package me.leiho.blog.controllers;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import me.leiho.blog.entities.IndexShortArticle;
import me.leiho.blog.entities.SimpleLink;
import me.leiho.blog.services.ArticlePageService;
import me.leiho.blog.services.ArticleService;
import me.leiho.blog.services.CommonPageValueService;
import me.leiho.blog.services.PageListService;
import me.leiho.blog.vos.SimpleArticleInfoReq;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description: 文章页控制器
 * @Date: Create in 17:41 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
@Controller
public class ArticlePageController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private PageListService pageListService;

    @Autowired
    private ArticlePageService articlePageService;

    @Autowired
    private CommonPageValueService commonPageValueService;

    @GetMapping("/article/{type}/{no}")
    /**
     * type:
     *      1:按发布时间排序 announce_desc
     *      2:按发布时间排序 announce_asc
     *      3:按更新时间排序 update_desc
     *      4:按更新时间排序 update_asc
     */
    public String contactA(Map<String, Object> map, @PathVariable String type, @PathVariable Integer no) {
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("文章").setCommonPageHead(2).setCommonPageFoot();
        SimpleArticleInfoReq req = SimpleArticleInfoReq.build().setType(type).setPage(no).setSize(25).setIsAnnounce(1).setSize(25);
        articlePageService.getValueMap(map).setSimpleArticleInfo(req).setSideBar(30);
        logger.info("/article/" + type + "/" + no);
        return "article";
    }

    @GetMapping("/article/{type}")
    public String contactB(Map<String, Object> map, @PathVariable String type) {
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("文章").setCommonPageHead(2).setCommonPageFoot();
        SimpleArticleInfoReq req = SimpleArticleInfoReq.build().setType(type).setPage(1).setSize(25).setIsAnnounce(1);
        articlePageService.getValueMap(map).setSimpleArticleInfo(req).setSideBar(30);
        logger.info("/article/" + type);
        return "article";
    }

    @GetMapping("/article")
    public String contactC(Map<String, Object> map) {
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("文章").setCommonPageHead(2).setCommonPageFoot();
        SimpleArticleInfoReq req = SimpleArticleInfoReq.build().setType("announce_desc").setPage(1).setSize(25).setIsAnnounce(1);
        articlePageService.getValueMap(map).setSimpleArticleInfo(req).setSideBar(30);
        logger.info("/article");
        return "article";
    }


}
