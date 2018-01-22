package me.leiho.blog.entities;

import java.io.Serializable;

/**
 * @Author: 萧大侠
 * @Description: 主页的组件
 * @Date: Create in 17:38 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
public class IndexShortArticle extends BaseResult implements Serializable {
    public static IndexShortArticle build(){
        return new IndexShortArticle();
    }
    private String img;
    private String title;
    private String article;
    private String link;

    public String getLink() {
        return link;
    }

    public IndexShortArticle setLink(String link) {
        this.link = link;
        return this;
    }

    public String getImg() {
        return img;
    }

    public IndexShortArticle setImg(String img) {
        this.img = img;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public IndexShortArticle setTitle(String title) {
        this.title = title;
        return this;
    }

    public String getArticle() {
        return article;
    }

    public IndexShortArticle setArticle(String article) {
        this.article = article;
        return this;
    }
}
