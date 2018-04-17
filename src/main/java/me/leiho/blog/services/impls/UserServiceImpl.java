package me.leiho.blog.services.impls;

import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.mappers.XUserAccountMapper;
import me.leiho.blog.services.UserService;
import me.leiho.blog.utils.PBKDF2;
import me.leiho.blog.vos.LoginVO;
import me.leiho.blog.vos.RegisterVO;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Date;
import java.util.List;

import static me.leiho.blog.enums.ResultCode.*;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 15:16 2018/2/8
 * @Contact: yesxiaolei@outlook.com
 */
@Service
public class UserServiceImpl implements UserService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private XUserAccountMapper xUserAccountMapper;

    public BaseResult register(RegisterVO registerVO) {
        if (StringUtils.isBlank(registerVO.getAccount()) || StringUtils.isBlank(registerVO.getPassword()) || StringUtils.isBlank(registerVO.getUsername())) {
            return new BaseResult(FAILED_USER_REGISTER_LESS_INFO);
        }
        String account = registerVO.getAccount();
        String username = registerVO.getUsername();
        String password = registerVO.getPassword();
        if (account.length() > 32 || account.length() < 6) {
            return new BaseResult(FAILED_USER_REGISTER_ACCOUNT_LENGTH);
        }
        if (username.length() > 32 || username.length() < 2) {
            return new BaseResult(FAILED_USER_REGISTER_USERNAME_LENGTH);
        }
        if (password.length() > 32 || password.length() < 6) {
            return new BaseResult(FAILED_USER_REGISTER_PASSWORD_LENGTH);
        }
        if (!account.matches("^[1][3,5,7,8]\\d{9}$") && !account.matches("^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$")) {
            return new BaseResult(FAILED_USER_REGISTER_ACCOUNT_WRONG);
        }
        Example onlyOneAccount = new Example(XUserAccount.class);
        onlyOneAccount.createCriteria().andEqualTo("account", account);
        if (xUserAccountMapper.selectByExample(onlyOneAccount).size() > 0) {
            return new BaseResult(FAILED_USER_REGISTER_ACCOUNT_EXIST);
        }
        Example onlyOneUser = new Example(XUserAccount.class);
        onlyOneUser.createCriteria().andEqualTo("username", username);
        if (xUserAccountMapper.selectByExample(onlyOneUser).size() > 0) {
            return new BaseResult(FAILED_USER_REGISTER_USERNAME_EXIST);
        }
        //加密密码
        try {
            password = PBKDF2.createHash(password);
        } catch (NoSuchAlgorithmException e) {
            logger.error("加密失败,可能是加密类型出现非法修改", e);
            return new BaseResult(FAILED_USER_REGISTER_SERVICE_ERROR);
        } catch (InvalidKeySpecException e) {
            logger.error("加密失败,肯可能是参数出现了非法变动", e);
            return new BaseResult(FAILED_USER_REGISTER_SERVICE_ERROR);
        }
        //写入数据库
        XUserAccount xUserAccount = new XUserAccount();
        xUserAccount.setAccount(account);
        xUserAccount.setUsername(username);
        xUserAccount.setPassword(password);
        xUserAccount.setCreateTime(new Date());
        xUserAccountMapper.insertSelective(xUserAccount);
        return new BaseResult(SUCCESS);
    }

    public BaseResult login(LoginVO loginVO) {
        if (StringUtils.isBlank(loginVO.getAccount()) || StringUtils.isBlank(loginVO.getPassword())) {
            return new BaseResult(FAILED_USER_LOGIN_LESS_INFO);
        }
        String account = loginVO.getAccount();
        String password = loginVO.getPassword();
        Example findUser = new Example(XUserAccount.class);
        findUser.createCriteria().andEqualTo("account", account);
        List<XUserAccount> xUserAccountList = xUserAccountMapper.selectByExample(findUser);
        if (xUserAccountList == null || xUserAccountList.size() == 0) {
            return new BaseResult(FAILED_USER_LOGIN_NOT_EXIST);
        }
        XUserAccount xUserAccount = xUserAccountList.get(0);
//        try {
//            if (!PBKDF2.validatePassword(password,xUserAccount.getPassword())){
//                return new BaseResult(FAILED_USER_LOGIN_VALIDATE_PASSWORD);
//            }
//        } catch (NoSuchAlgorithmException e) {
//            logger.error("解密失败,可能是加密类型出现非法修改",e);
//            return new BaseResult(FAILED_USER_LOGIN_SERVICE_ERROR);
//        } catch (InvalidKeySpecException e) {
//            logger.error("解密失败,可能是参数出现了非法变动",e);
//            return new BaseResult(FAILED_USER_LOGIN_SERVICE_ERROR);
//        }
        Subject subject = SecurityUtils.getSubject();
        //设置会话为半个小时有效
        SecurityUtils.getSubject().getSession().setTimeout(1800000);
        try {
            UsernamePasswordToken token = new UsernamePasswordToken(account, password);
            subject.login(token);
        } catch (AuthenticationException e) {
            logger.error("shiro认证失败");
            return new BaseResult(FAILED_USER_LOGIN_VALIDATE_PASSWORD);
        }
        //todo 加载权限
        return new BaseResult(SUCCESS);
    }

    public BaseResult logout() {
        //todo 退出账号
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return new BaseResult(SUCCESS);
    }

    public String deleteUserById(Integer id){
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            XUserAccount xUserAccount = xUserAccountMapper.selectOne(param);
            if (xUserAccount == null) {
                return "用户信息异常";
            }
            XUserAccount result= xUserAccountMapper.selectByPrimaryKey(id);
            if (result==null){
                return "没有该用户的信息";
            }
            if (SecurityUtils.getSubject().hasRole("admin")||SecurityUtils.getSubject().hasRole("superadmin")){
                xUserAccountMapper.deleteUserById(id);
                return "删除成功";
            }else {
                return "没有权限删除";
            }
        }
        return "没有权限删除";
    }

    public String updateUserInfo(XUserAccount user){
        if (user==null||user.getId()==null){
            return "参数异常";
        }
        Integer id = user.getId();
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            XUserAccount xUserAccount = xUserAccountMapper.selectOne(param);
            if (xUserAccount == null) {
                return "用户信息异常";
            }
            XUserAccount result= xUserAccountMapper.selectByPrimaryKey(id);
            if (result==null){
                return "没有该用户的信息";
            }
            if (xUserAccount.getId()==id||SecurityUtils.getSubject().hasRole("admin")){
                //用户和普通管理员不能修改用户角色
                user.setRole(result.getRole());
                user.setUpdateTime(new Date());
                xUserAccountMapper.updateByPrimaryKeySelective(user);
                return "修改成功";
            }else if (SecurityUtils.getSubject().hasRole("superadmin")){
                user.setUpdateTime(new Date());
                xUserAccountMapper.updateByPrimaryKeySelective(user);
                return "修改成功";
            }else {
                return "没有权限修改";
            }
        }
        return "没有权限修改";
    }

    @Override
    public String updateUserPwd(String oldPwd, String newPwd) {
        if (StringUtils.isBlank(oldPwd)||StringUtils.isBlank(newPwd)){
            return "参数异常";
        }
        XUserAccount loginUser = null;
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            loginUser = xUserAccountMapper.selectOne(param);
        }
        if (loginUser==null||loginUser.getPassword()==null||loginUser.getPassword()==null){
            return "用户状态异常";
        }
        String password = null;
        try {
            if (!PBKDF2.validatePassword(oldPwd,loginUser.getPassword())){
                return "原密码错误";
            }
            password = PBKDF2.createHash(newPwd);
        } catch (NoSuchAlgorithmException e) {
            return "内部错误,请联系网站管理员";
        } catch (InvalidKeySpecException e) {
            return "内部错误,请联系网站管理员";
        }
        if (StringUtils.isBlank(password)){
            return "参数异常";
        }
        XUserAccount xUserAccount = new XUserAccount();
        xUserAccount.setId(loginUser.getId());
        xUserAccount.setPassword(password);
        xUserAccount.setUpdateTime(new Date());
        xUserAccountMapper.updateByPrimaryKeySelective(xUserAccount);
        return "修改成功";
    }
}
