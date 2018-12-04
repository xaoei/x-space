package me.leiho.blog.entities;

import java.io.Serializable;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 20:13 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
public class PictureLink extends BaseResult implements Serializable {
    private String url;
    private String link;

    public static PictureLink build() {
        return new PictureLink();
    }

    public String getUrl() {
        return url;
    }

    public PictureLink setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getLink() {
        return link;
    }

    public PictureLink setLink(String link) {
        this.link = link;
        return this;
    }
}
