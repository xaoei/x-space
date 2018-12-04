package me.leiho.blog.vos;

import io.swagger.annotations.ApiModelProperty;
import me.leiho.blog.entities.StringEntity;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 17:39 2018/3/14
 * @Contact: yesxiaolei@outlook.com
 */
public class SimpleArticleInfoReq extends StringEntity {
    @ApiModelProperty(name = "page", value = "页码")
    private Integer page;
    @ApiModelProperty(name = "size", value = "页面大小")
    private Integer size;
    @ApiModelProperty(name = "keyWord", value = "关键字")
    private String keyWord;
    @ApiModelProperty(name = "author", value = "作者")
    private String author;
    @ApiModelProperty(name = "hot", value = "热门")
    private String hot;
    @ApiModelProperty(name = "isAnnounce", value = "已发布")
    private Integer isAnnounce;
    @ApiModelProperty(name = "announceTime", value = "发布时间")
    private String announceTime;
    @ApiModelProperty(name = "updateTime", value = "更新时间")
    private String updateTime;
    @ApiModelProperty(name = "type", value = "排序方式")
    private String type;

    public static SimpleArticleInfoReq build() {
        return new SimpleArticleInfoReq();
    }

    public Integer getIsAnnounce() {
        return isAnnounce;
    }

    public SimpleArticleInfoReq setIsAnnounce(Integer isAnnounce) {
        this.isAnnounce = isAnnounce;
        return this;
    }

    public Integer getPage() {
        return page;
    }

    public SimpleArticleInfoReq setPage(Integer page) {
        this.page = page;
        return this;
    }

    public Integer getSize() {
        return size;
    }

    public SimpleArticleInfoReq setSize(Integer size) {
        this.size = size;
        return this;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public SimpleArticleInfoReq setKeyWord(String keyWord) {
        this.keyWord = keyWord;
        return this;
    }

    public String getAuthor() {
        return author;
    }

    public SimpleArticleInfoReq setAuthor(String author) {
        this.author = author;
        return this;
    }

    public String getHot() {
        return hot;
    }

    public SimpleArticleInfoReq setHot(String hot) {
        this.hot = hot;
        return this;
    }

    public String getAnnounceTime() {
        return announceTime;
    }

    public SimpleArticleInfoReq setAnnounceTime(String announceTime) {
        this.announceTime = announceTime;
        return this;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public SimpleArticleInfoReq setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
        return this;
    }

    public String getType() {
        return type;
    }

    public SimpleArticleInfoReq setType(String type) {
        this.type = type;
        return this;
    }
}
