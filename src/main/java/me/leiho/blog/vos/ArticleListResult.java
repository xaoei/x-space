package me.leiho.blog.vos;

import com.github.pagehelper.PageInfo;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 17:08 2018/3/14
 * @Contact: yesxiaolei@outlook.com
 */
public class ArticleListResult {
    PageInfo<SimpleArticleInfo> articles;

    public PageInfo<SimpleArticleInfo> getArticles() {
        return articles;
    }

    public void setArticles(PageInfo<SimpleArticleInfo> articles) {
        this.articles = articles;
    }
}
