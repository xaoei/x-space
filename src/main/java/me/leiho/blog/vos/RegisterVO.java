package me.leiho.blog.vos;

import com.sun.xml.internal.rngom.parse.host.Base;
import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.entities.StringEntity;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 15:19 2018/2/8
 * @Contact: yesxiaolei@outlook.com
 */
public class RegisterVO extends StringEntity{
    private String account;
    private String username;
    private String password;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
