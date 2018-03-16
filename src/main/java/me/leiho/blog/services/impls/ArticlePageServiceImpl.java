package me.leiho.blog.services.impls;

import com.github.pagehelper.PageInfo;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimePullMultipart;
import me.leiho.blog.dtos.UserAccountDTO;
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
        if (pageInfo.getSize()==0){
            return this;
        }
        map.put("page_index",pageInfo.getPageNum());
        map.put("page_total",pageInfo.getPages());
        map.put("page_pre",pageInfo.getPrePage());
        map.put("page_next",pageInfo.getNextPage());
        map.put("simple_article_info",pageInfo.getList());
        return this;
    }
}
