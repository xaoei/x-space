package me.leiho.blog.services;

import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.vos.LoginVO;
import me.leiho.blog.vos.RegisterVO;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 15:16 2018/2/8
 * @Contact: yesxiaolei@outlook.com
 */
public interface UserService {
    BaseResult register(RegisterVO registerVO);

    BaseResult login(LoginVO loginVO);

    BaseResult logout();
}
