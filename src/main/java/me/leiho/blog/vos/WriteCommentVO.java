package me.leiho.blog.vos;

import me.leiho.blog.entities.XComment;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 16:42 2018/3/23
 * @Contact: yesxiaolei@outlook.com
 */
public class WriteCommentVO extends XComment {
    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
