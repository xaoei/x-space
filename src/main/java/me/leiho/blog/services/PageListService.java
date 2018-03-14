package me.leiho.blog.services;

import com.github.pagehelper.PageInfo;
import me.leiho.blog.vos.SimpleArticleInfo;
import me.leiho.blog.vos.SimpleArticleInfoReq;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 17:36 2018/3/14
 * @Contact: yesxiaolei@outlook.com
 */
public interface PageListService {
    PageInfo<SimpleArticleInfo> getSimpleArticleInfo(SimpleArticleInfoReq req);
}
