package me.leiho.blog.entities;

import java.io.Serializable;

/**
 * @Author: 萧大侠
 * @Description: 网页链接，附带描述
 * @Date: Create in 18:36 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
public class SimpleLink extends BaseResult implements Serializable {
    private String url;
    private String desc;

    public static SimpleLink build() {
        return new SimpleLink();
    }

    public String getUrl() {
        return url;
    }

    public SimpleLink setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getDesc() {
        return desc;
    }

    public SimpleLink setDesc(String desc) {
        this.desc = desc;
        return this;
    }
}
