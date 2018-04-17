package me.leiho.blog.vos;

import io.swagger.annotations.ApiModelProperty;
import me.leiho.blog.entities.StringEntity;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 17:39 2018/3/14
 * @Contact: yesxiaolei@outlook.com
 */
public class UserInfoReq extends StringEntity {
    public static UserInfoReq build() {
        return new UserInfoReq();
    }

    @ApiModelProperty(name = "page", value = "页码")
    private Integer page;
    @ApiModelProperty(name = "size", value = "页面大小")
    private Integer size;
    @ApiModelProperty(name = "del", value = "删除标识")
    private String del;


    public UserInfoReq setPage(Integer page) {
        this.page = page;
        return this;
    }

    public UserInfoReq setSize(Integer size) {
        this.size = size;
        return this;
    }

    public String getDel() {
        return del;
    }

    public void setDel(String del) {
        this.del = del;
    }

    public Integer getPage() {
        return page;
    }

    public Integer getSize() {
        return size;
    }

}
