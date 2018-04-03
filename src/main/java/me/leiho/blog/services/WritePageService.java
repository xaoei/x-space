package me.leiho.blog.services;

import me.leiho.blog.services.impls.WritePageServiceImpl;
import me.leiho.blog.vos.TagsResult;

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
     *
     * @param map
     * @return
     */
    WritePageServiceImpl getValueMap(Map<String, Object> map);

    /**
     * 设置文章的可选类型
     *
     * @return
     */
    WritePageServiceImpl setTypes();

    /**
     * 设置文章的可选标签
     *
     * @return
     */
    WritePageServiceImpl setTags();

    /**
     * 通过文章id读取文章
     *
     * @param articleId
     * @return
     */
    WritePageServiceImpl setDefaultArticle(Integer articleId);

    /**
     * 新增标签,并返回所有标签
     *
     * @param tags
     * @return
     */
    TagsResult addNewTags(String tags);
}
