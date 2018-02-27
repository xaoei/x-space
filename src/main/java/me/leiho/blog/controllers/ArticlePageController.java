package me.leiho.blog.controllers;

import me.leiho.blog.entities.IndexShortArticle;
import me.leiho.blog.entities.SimpleLink;
import me.leiho.blog.services.CommonPageValueService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private CommonPageValueService commonPageValueService;
    @GetMapping("/article")
    public String contact(Map<String, Object> map) {
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("文章").setCommonPageHead(2).setCommonPageFoot();
        logger.info("/article");
        return "article";
    }
}
