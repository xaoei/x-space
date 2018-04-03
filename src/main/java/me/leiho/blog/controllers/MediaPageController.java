package me.leiho.blog.controllers;

import me.leiho.blog.entities.IndexShortArticle;
import me.leiho.blog.entities.SimpleLink;
import me.leiho.blog.services.CommonPageValueService;
import me.leiho.blog.services.MediaPageService;
import org.apache.shiro.SecurityUtils;
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
 * @Description: 影音页控制器
 * @Date: Create in 17:41 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
@Controller
public class MediaPageController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private CommonPageValueService commonPageValueService;

    @Autowired
    private MediaPageService mediaPageService;

    @GetMapping("/media")
    public String about(Map<String, Object> map) {
//        if (!SecurityUtils.getSubject().isPermitted("/media")) {
//            return "/403.html";
//        }
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("影音").setCommonPageHead(3).setCommonPageFoot();
        mediaPageService.getValueMap(map).setPhotoWall();

        logger.info("/media");
        return "media";
    }
}
