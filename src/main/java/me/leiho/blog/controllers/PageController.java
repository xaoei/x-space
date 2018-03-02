package me.leiho.blog.controllers;

import me.leiho.blog.entities.IndexShortArticle;
import me.leiho.blog.entities.SimpleLink;
import me.leiho.blog.services.CommonPageValueService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description: 主页控制器
 * @Date: Create in 17:41 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
@Controller
public class PageController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private CommonPageValueService commonPageValueService;
//    @GetMapping(value="/page/{type}/{id}")
//    public String index(Map<String, Object> map,@PathVariable String type,@PathVariable String id) {
//        logger.info(type+","+id);
//        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("主页").setCommonPageHead(0).setCommonPageFoot();
//
//        logger.info("/page");
//        return "page";
//    }
    @GetMapping(value="/page")
    public String index(Map<String, Object> map) {
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("主页").setCommonPageHead(0).setCommonPageFoot();

        logger.info("/page");
        return "page";
    }
}
