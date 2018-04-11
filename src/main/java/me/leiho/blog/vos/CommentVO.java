package me.leiho.blog.vos;

import me.leiho.blog.entities.XComment;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 16:48 2018/3/18
 * @Contact: yesxiaolei@outlook.com
 */
public class CommentVO extends XComment {
    private Integer id;
    private String userName;

    private Integer isOwner;

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIsOwner() {
        return isOwner;
    }

    public void setIsOwner(Integer isOwner) {
        this.isOwner = isOwner;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
