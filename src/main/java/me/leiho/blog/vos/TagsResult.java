package me.leiho.blog.vos;

import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.enums.ResultCode;

import java.util.List;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 11:06 2018/2/7
 * @Contact: yesxiaolei@outlook.com
 */
public class TagsResult extends BaseResult{
    List<String> tags;
    public TagsResult(){}
    public TagsResult(ResultCode resultCode){
        super(resultCode);
    }
    public TagsResult(ResultCode resultCode,List<String> tags){
        super(resultCode);
        this.tags=tags;
    }
    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }
}
