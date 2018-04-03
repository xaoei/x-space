package me.leiho.blog.vos;

import me.leiho.blog.entities.StringEntity;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 16:15 2018/2/8
 * @Contact: yesxiaolei@outlook.com
 */
public class LoginVO extends StringEntity {
    private String account;
    private String password;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
