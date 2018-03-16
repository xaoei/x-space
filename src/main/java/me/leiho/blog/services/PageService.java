package me.leiho.blog.services;

import me.leiho.blog.services.impls.PageServiceImpl;

import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 18:09 2018/3/16
 * @Contact: yesxiaolei@outlook.com
 */
public interface PageService {
    PageServiceImpl getValueMap(Map<String, Object> map);
    PageServiceImpl setArticle(String type,Integer no);
}
