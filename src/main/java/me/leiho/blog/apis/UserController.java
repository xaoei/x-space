package me.leiho.blog.apis;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.services.UserService;
import me.leiho.blog.vos.ChangePwdVO;
import me.leiho.blog.vos.LoginVO;
import me.leiho.blog.vos.RegisterVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


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

    @ApiOperation(value = "注册账号")
    @PostMapping("/v1/user/register")
    public BaseResult register(@RequestBody RegisterVO registerVO) {
        return userService.register(registerVO);
    }

    @ApiOperation(value = "用户登陆")
    @PostMapping("/v1/user/login")
    public BaseResult login(@RequestBody LoginVO loginVO) {
        return userService.login(loginVO);
    }

    @ApiOperation(value = "用户修改密码")
    @PostMapping("/v1/user/changePwd")
    public String changePwd(@RequestBody ChangePwdVO changePwdVO) {
        return userService.updateUserPwd(changePwdVO.getOldPwd(),changePwdVO.getNewPwd());
    }

    @ApiOperation(value = "用户下线")
    @PostMapping("/v1/user/logout")
    public BaseResult logout() {
        return userService.logout();
    }
}
