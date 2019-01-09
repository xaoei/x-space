package me.leiho.blog.apis;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.services.UserService;
import me.leiho.blog.utils.IpUtil;
import me.leiho.blog.vos.ChangePwdVO;
import me.leiho.blog.vos.LoginVO;
import me.leiho.blog.vos.RegisterVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;


/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 17:41 2018/2/11
 * @Contact: yesxiaolei@outlook.com
 */
@Api("用户相关接口")
@RestController
public class UserController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserService userService;
    @Autowired
    private IpUtil ipUtil;

    @ApiOperation(value = "注册账号")
    @PostMapping("/v1/user/register")
    public BaseResult register(@RequestBody RegisterVO registerVO, HttpServletRequest request) {
        logger.trace(ipUtil.getIpAddr(request) + "访问/v1/user/register:" + registerVO);
        return userService.register(registerVO);
    }

    @ApiOperation(value = "用户登陆")
    @PostMapping("/v1/user/login")
    public BaseResult login(@RequestBody LoginVO loginVO, HttpServletRequest request) {
        logger.trace(ipUtil.getIpAddr(request) + "访问/v1/user/login:" + loginVO);
        return userService.login(loginVO);
    }

    @ApiOperation(value = "用户修改密码")
    @PostMapping("/v1/user/changePwd")
    public String changePwd(@RequestBody ChangePwdVO changePwdVO, HttpServletRequest request) {
        logger.trace(ipUtil.getIpAddr(request) + "访问/v1/user/changePwd:" + changePwdVO);
        return userService.updateUserPwd(changePwdVO.getOldPwd(), changePwdVO.getNewPwd());
    }

    @ApiOperation(value = "用户下线")
    @GetMapping("/v1/user/logout")
    public BaseResult logout(HttpServletRequest request) {
        logger.trace(ipUtil.getIpAddr(request) + "访问/v1/user/logout");
        return userService.logout();
    }
}
