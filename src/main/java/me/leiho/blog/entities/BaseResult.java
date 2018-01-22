package me.leiho.blog.entities;

import io.swagger.annotations.ApiModelProperty;
import me.leiho.blog.enums.ResultCode;

import java.io.Serializable;

/**
 * @Author: 萧大侠
 * @Description: 接口返回的基础数据
 * @Date: Create in 17:39 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
public class BaseResult extends StringEntity implements Serializable {
    @ApiModelProperty(value = "返回状态码")
    private Integer code;
    @ApiModelProperty(value = "错误描述")
    private String msg;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public BaseResult(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public BaseResult() {
        this.code = ResultCode.SUCCESS.getValue();
        this.msg = ResultCode.SUCCESS.getDesc();
    }

    public void addMessage(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}


