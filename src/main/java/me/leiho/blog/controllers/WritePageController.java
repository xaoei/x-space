package me.leiho.blog.controllers;

import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.entities.IndexShortArticle;
import me.leiho.blog.entities.SimpleLink;
import me.leiho.blog.services.CommonPageValueService;
import me.leiho.blog.services.WritePageService;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description: 创作页控制器
 * @Date: Create in 17:41 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
@Controller
public class WritePageController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private CommonPageValueService commonPageValueService;
    @Autowired
    private WritePageService writePageService;
    @GetMapping("/write")
    public String write(Map<String, Object> map) {
        if (!SecurityUtils.getSubject().isPermitted("/write")){
            return "/403.html";
        }
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("发布").setCommonPageHead(4).setCommonPageFoot();
        writePageService.getValueMap(map).setTypes().setTags().setSideBar();
        logger.info("/write");
        return "write";
    }
    @GetMapping("/write/{articleId}")
    public String edit(Map<String, Object> map, @PathVariable Integer articleId) {
        if (!SecurityUtils.getSubject().isPermitted("/write")){
            return "/403.html";
        }
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("发布").setCommonPageHead(4).setCommonPageFoot();
        writePageService.getValueMap(map).setTypes().setTags().setSideBar().setDefaultArticle(articleId);
        logger.info("/write/"+articleId);
        return "write";
    }
}
