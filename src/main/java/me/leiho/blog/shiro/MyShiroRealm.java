package me.leiho.blog.shiro;

import me.leiho.blog.entities.XPermission;
import me.leiho.blog.entities.XRole;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.mappers.XPermissionMapper;
import me.leiho.blog.mappers.XUserAccountMapper;
import me.leiho.blog.services.UserService;
import me.leiho.blog.utils.PBKDF2;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 14:21 2018/2/12
 * @Contact: yesxiaolei@outlook.com
 */
public class MyShiroRealm extends AuthorizingRealm {
    @Autowired
    private XUserAccountMapper xUserAccountMapper;
    @Autowired
    private XPermissionMapper xPermissionMapper;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("权限配置-->MyShiroRealm.doGetAuthorizationInfo()");
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        XUserAccount userInfo  = (XUserAccount)principalCollection.getPrimaryPrincipal();
        String role = userInfo.getRole();
        authorizationInfo.addRole(role);
        Example permissionExample = new Example(XPermission.class);
        permissionExample.createCriteria().andEqualTo("del",0).andCondition("like '%"+role+"%'");//todo 待验证
        List<XPermission> permissions = xPermissionMapper.selectByExample(permissionExample);
        for(XPermission p:permissions){
            authorizationInfo.addStringPermission(p.getPermission());
        }
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("MyShiroRealm.doGetAuthenticationInfo()");
        //获取用户的输入的账号.
        String id = (String)authenticationToken.getPrincipal();
        System.out.println(authenticationToken.getCredentials());
        //通过username从数据库中查找 User对象，如果找到，没找到.
        //实际项目中，这里可以根据实际情况做缓存，如果不做，Shiro自己也是有时间间隔机制，2分钟内不会重复执行该方法
        XUserAccount userInfo = xUserAccountMapper.selectByPrimaryKey(id);
        System.out.println("----->>userInfo="+userInfo);
        if(userInfo == null){
            return null;
        }
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                userInfo, //用户名
                userInfo.getPassword(), //密码
//                ByteSource.Util.bytes(userInfo.getCredentialsSalt()),//salt=username+salt
                getName()  //realm name
        );
        return authenticationInfo;
    }
}
