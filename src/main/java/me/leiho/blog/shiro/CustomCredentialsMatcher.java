package me.leiho.blog.shiro;

import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.utils.PBKDF2;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import static me.leiho.blog.enums.ResultCode.FAILED_USER_LOGIN_SERVICE_ERROR;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 11:27 2018/2/27
 * @Contact: yesxiaolei@outlook.com
 */
public class CustomCredentialsMatcher extends SimpleCredentialsMatcher  {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        UsernamePasswordToken usernamePasswordTokenoken = (UsernamePasswordToken) token;
        String inputPassword = String.valueOf(usernamePasswordTokenoken.getPassword());
        String realPossword = getCredentials(info).toString();
        try {
            return PBKDF2.validatePassword(inputPassword,realPossword);
        } catch (NoSuchAlgorithmException e) {
            logger.error("解密失败,可能是加密类型出现非法修改",e);
        } catch (InvalidKeySpecException e) {
            logger.error("解密失败,可能是参数出现了非法变动",e);
        }
        return false;
    }
}
