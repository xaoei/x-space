package me.leiho.blog.services;

import me.leiho.blog.services.impls.ArticlePageServiceImpl;

import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 17:37 2018/3/15
 * @Contact: yesxiaolei@outlook.com
 */
public interface ArticlePageService {
    ArticlePageServiceImpl setSimpleArticleInfo(String type, Integer no);
    ArticlePageServiceImpl getValueMap(Map<String, Object> map);
}
