package me.leiho.blog.services.impls;

import com.github.pagehelper.PageInfo;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimePullMultipart;
import me.leiho.blog.dtos.UserAccountDTO;
import me.leiho.blog.entities.IndexShortArticle;
import me.leiho.blog.entities.SimpleLink;
import me.leiho.blog.entities.XUserAccount;
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
    private PageListService pageListService;
    private Map<String, Object> map;
    public ArticlePageServiceImpl getValueMap(Map<String, Object> map){
        this.map = map;
        return this;
    }
    public ArticlePageServiceImpl setSimpleArticleInfo(String type,Integer no){
        SimpleArticleInfoReq req = SimpleArticleInfoReq.build().setType(type).setPage(no).setSize(25);
        PageInfo<SimpleArticleInfo> pageInfo = pageListService.getSimpleArticleInfo(req);
        map.put("page_index",pageInfo.getPageNum());
        map.put("page_total",pageInfo.getPages());
        map.put("page_pre",pageInfo.getPrePage());
        map.put("page_next",pageInfo.getNextPage());
        if (pageInfo.getSize()==0){
            return this;
        }
        map.put("simple_article_info",pageInfo.getList());
        return this;
    }
    public ArticlePageServiceImpl setSideBar(){
        List<SimpleLink> reprintLinks = new ArrayList<>();
        reprintLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("这篇文章贼溜"));
        reprintLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("非常好的教程"));
        reprintLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("学学这个"));
        reprintLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("如何走向成功..."));
        reprintLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("心灵毒鸡汤"));
        map.put("repring_links",reprintLinks);

        List<SimpleLink> essayLinks = new ArrayList<>();
        essayLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("这是一篇文章"));
        essayLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("这又是一篇文章"));
        essayLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("这还是一篇文章"));
        essayLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("怎么又是一篇文..."));
        essayLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("竟然还是一篇文..."));
        map.put("essay_links",essayLinks);

        List<IndexShortArticle> shortHotArticles = new ArrayList<>();
        shortHotArticles.add(IndexShortArticle.build().setImg("img/tm-img-240x120-1.jpg").setTitle("第一篇热门文章").setArticle("酒店位于北京首都国际机场与北京新国展中心位置。").setLink("http://www.leiho.me"));
        shortHotArticles.add(IndexShortArticle.build().setImg("img/tm-img-240x120-2.jpg").setTitle("第二篇热门文章").setArticle("北京嘉利华连锁宾馆刘家窑店是一家全新理念的经济宾馆连锁企业。").setLink("http://www.leiho.me"));
        shortHotArticles.add(IndexShortArticle.build().setImg("img/tm-img-240x120-3.jpg").setTitle("第三篇热门文章").setArticle("京石景山玖玖源速8酒店座落于空气清新，环境宜人的北京石景山区CRD的繁盛地段。").setLink("http://www.leiho.me"));
        map.put("short_hot_article",shortHotArticles);
        return this;
    }
}
