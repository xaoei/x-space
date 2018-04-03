package me.leiho.blog.services.impls;

import com.github.pagehelper.PageInfo;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimePullMultipart;
import me.leiho.blog.dtos.UserAccountDTO;
import me.leiho.blog.entities.IndexShortArticle;
import me.leiho.blog.entities.SimpleLink;
import me.leiho.blog.entities.XArticle;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.mappers.XArticleMapper;
import me.leiho.blog.services.ArticlePageService;
import me.leiho.blog.services.PageListService;
import me.leiho.blog.vos.SimpleArticleInfo;
import me.leiho.blog.vos.SimpleArticleInfoReq;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 17:37 2018/3/15
 * @Contact: yesxiaolei@outlook.com
 */
@Service
public class ArticlePageServiceImpl implements ArticlePageService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private XArticleMapper xArticleMapper;
    @Autowired
    private PageListService pageListService;
    private Map<String, Object> map;

    public ArticlePageServiceImpl getValueMap(Map<String, Object> map) {
        this.map = map;
        return this;
    }

    public ArticlePageServiceImpl setSimpleArticleInfo(SimpleArticleInfoReq req) {
        PageInfo<SimpleArticleInfo> pageInfo = pageListService.getSimpleArticleInfo(req);
        map.put("page_index", pageInfo.getPageNum());
        map.put("page_total", pageInfo.getPages());
        map.put("page_pre", pageInfo.getPrePage());
        map.put("page_next", pageInfo.getNextPage());
        if (pageInfo.getSize() == 0) {
            return this;
        }
        map.put("simple_article_info", pageInfo.getList());
        return this;
    }

    public ArticlePageServiceImpl setSideBar() {
        List<SimpleArticleInfo> reprintArticleInfos = xArticleMapper.getArticlesByType(5, 4);
        List<SimpleLink> reprintLinks = new ArrayList<>();
        if (reprintArticleInfos.size() > 0) {
            for (int i = 0; i < (reprintArticleInfos.size() > 5 ? 5 : reprintArticleInfos.size()); i++) {
                reprintLinks.add(SimpleLink.build().setUrl("/page/article/" + reprintArticleInfos.get(i).getId()).setDesc(cutString(reprintArticleInfos.get(i).getTitle(), 13)));
            }
            map.put("repring_links", reprintLinks);
        }
        List<SimpleArticleInfo> essayArticleInfos = xArticleMapper.getArticlesByType(5, 3);
        List<SimpleLink> essayLinks = new ArrayList<>();
        if (essayArticleInfos.size() > 0) {
            for (int i = 0; i < (essayArticleInfos.size() > 5 ? 5 : essayArticleInfos.size()); i++) {
                essayLinks.add(SimpleLink.build().setUrl("/page/article/" + essayArticleInfos.get(i).getId()).setDesc(cutString(essayArticleInfos.get(i).getTitle(), 13)));
            }
            map.put("essay_links", essayLinks);
        }
        List<XArticle> hotArticles = xArticleMapper.getHotArticles(4);
        List<IndexShortArticle> shortHotArticles = new ArrayList<>();
        if (hotArticles.size() > 0) {
            for (int i = 0; i < (hotArticles.size() > 4 ? 4 : hotArticles.size()); i++) {
                shortHotArticles.add(IndexShortArticle.build().setTitle(cutString(hotArticles.get(i).getTitle(), 13)).setArticle(cutString(cleanHtml(hotArticles.get(i).getContent()), 30)).setLink("/page/article/" + hotArticles.get(i).getId()));
            }
            map.put("short_hot_article", shortHotArticles);
        }
        return this;
    }

    private String cutString(String src, Integer size) {
        if (src == null || src.length() <= 0) {
            return "error";
        }
        if (src.length() > size) {
            src = src.substring(0, size - 1) + "...";
        }
        return src.trim();
    }

    public String cleanHtml(String src) {
        String txtcontent = src.replaceAll("</?[^>]+>", ""); //剔出<html>的标签
        txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");//去除字符串中的空格,回车,换行符,制表符
        return txtcontent;
    }
}
