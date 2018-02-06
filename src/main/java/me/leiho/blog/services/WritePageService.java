package me.leiho.blog.services;

import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.services.impls.WritePageServiceImpl;
import me.leiho.blog.vos.TagsVO;

import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 14:56 2018/2/6
 * @Contact: yesxiaolei@outlook.com
 */
public interface WritePageService {
    /**
     * 获得设置参数的map对象
     * @param map
     * @return
     */
    WritePageServiceImpl getValueMap(Map<String, Object> map);

    /**
     * 设置文章的可选类型
     * @return
     */
    WritePageServiceImpl setTypes();

    /**
     * 设置文章的可选标签
     * @return
     */
    WritePageServiceImpl setTags();

    /**
     * 新增标签
     * @param tags
     * @return
     */
    BaseResult addNewTags(String tags);

    /**
     * 获得所有可选标签
     * @return
     */
    TagsVO getAllTags();
}
