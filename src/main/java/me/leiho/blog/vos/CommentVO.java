package me.leiho.blog.vos;

import me.leiho.blog.entities.XComment;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 16:48 2018/3/18
 * @Contact: yesxiaolei@outlook.com
 */
public class CommentVO extends XComment {
    private String userName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
