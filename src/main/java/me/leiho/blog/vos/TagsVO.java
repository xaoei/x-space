package me.leiho.blog.vos;

import me.leiho.blog.entities.BaseResult;

import java.util.List;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 15:26 2018/2/6
 * @Contact: yesxiaolei@outlook.com
 */
public class TagsVO extends BaseResult {
    List<String> tags;

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }
}
