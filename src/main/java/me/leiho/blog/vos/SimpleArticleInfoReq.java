package me.leiho.blog.vos;

import io.swagger.annotations.ApiModelProperty;
import me.leiho.blog.entities.StringEntity;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 17:39 2018/3/14
 * @Contact: yesxiaolei@outlook.com
 */
public class SimpleArticleInfoReq extends StringEntity{
    @ApiModelProperty(name = "page",value = "页码")
    private Integer page;
    @ApiModelProperty(name = "size",value = "页面大小")
    private Integer size;
    @ApiModelProperty(name = "keyWord",value = "关键字")
    private String keyWord;
    @ApiModelProperty(name = "author",value = "作者")
    private String author;
    @ApiModelProperty(name = "hot",value = "热门")
    private String hot;
    @ApiModelProperty(name = "announceTime",value = "发布时间")
    private String announceTime;
    @ApiModelProperty(name = "updateTime",value = "更新时间")
    private String updateTime;
    @ApiModelProperty(name = "type",value = "排序方式")
    private String type;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getHot() {
        return hot;
    }

    public void setHot(String hot) {
        this.hot = hot;
    }

    public String getAnnounceTime() {
        return announceTime;
    }

    public void setAnnounceTime(String announceTime) {
        this.announceTime = announceTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
