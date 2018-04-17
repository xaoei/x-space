package me.leiho.blog.services;

import com.github.pagehelper.PageInfo;
import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.vos.LoginVO;
import me.leiho.blog.vos.RegisterVO;
import me.leiho.blog.vos.UserInfoReq;

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

    String updateUserInfo(XUserAccount user);
    String updateUserPwd(String oldPwd,String newPwd);
    String deleteUserById(Integer id);
    PageInfo<XUserAccount> getUserInfoList(UserInfoReq req);
}
