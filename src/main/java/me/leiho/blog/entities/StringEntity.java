package me.leiho.blog.entities;

import me.leiho.blog.utils.JsonUtil;

/**
 * @Author: 萧大侠
 * @Description: 将toString 格式化为json格式
 * @Date: Create in 17:40 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
public class StringEntity {
    @Override
    public String toString() {
        return JsonUtil.obj2json(this);
    }
}
