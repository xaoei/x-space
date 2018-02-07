package me.leiho.blog.vos;

import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.enums.ResultCode;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 9:55 2018/2/7
 * @Contact: yesxiaolei@outlook.com
 */
public class PicUpResult extends BaseResult {
    private String uri;

    public PicUpResult(){}

    public PicUpResult(ResultCode resultCode){
        super(resultCode);
    }

    public PicUpResult(ResultCode resultCode, String uri){
        super(resultCode);
        this.uri = uri;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }
}
