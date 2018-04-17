package me.leiho.blog.controllers;

import me.leiho.blog.services.ArticlePageService;
import me.leiho.blog.services.CommonPageValueService;
import me.leiho.blog.services.IndexSettingService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description: 主页控制器
 * @Date: Create in 17:41 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
@Controller
public class IndexPageController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private CommonPageValueService commonPageValueService;

    @Autowired
    private ArticlePageService articlePageService;

    @Autowired
    private IndexSettingService indexSettingService;
    @GetMapping("/")
    public String index(Map<String, Object> map) {
        commonPageValueService
                .getValueMap(map)
                .setUserInfo()
                .setCommonPageSiteInfo()
                .setPageName("主页")
                .setCommonPageHead(1)
                .setCommonPageFoot();
        indexSettingService.getValueMap(map).setIndexArticles();
        articlePageService.getValueMap(map).setSideBar(100);
        logger.info("/index");
        return "index";
    }
    @GetMapping("/index")
    public String index1(Map<String, Object> map) {
        commonPageValueService
                .getValueMap(map)
                .setUserInfo()
                .setCommonPageSiteInfo()
                .setPageName("主页")
                .setCommonPageHead(1)
                .setCommonPageFoot();
        indexSettingService.getValueMap(map).setIndexArticles();
        articlePageService.getValueMap(map).setSideBar(100);
        logger.info("/index");
        return "index";
    }
}
