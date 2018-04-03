package me.leiho.blog.services;

import me.leiho.blog.entities.BaseResult;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 18:10 2018/2/5
 * @Contact: yesxiaolei@outlook.com
 */
public interface ArticleService {
    /**
     * 保存或发布文章,announce为false保存,为true发布.
     *
     * @param article
     * @param announce
     * @return
     */
    BaseResult saveOrAnnounceArticle(String article, Boolean announce);
}
