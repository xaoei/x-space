package me.leiho.blog.vos;

import me.leiho.blog.entities.XArticle;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 16:11 2018/3/29
 * @Contact: yesxiaolei@outlook.com
 */
public class XArticleVO extends XArticle {
    private String authorName;

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }
}
