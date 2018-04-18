package me.leiho.blog.controllers;

import me.leiho.blog.services.CommonPageValueService;
import me.leiho.blog.services.ManageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description: 管理页控制器
 * @Date: Create in 17:41 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
@Controller
public class ManagePageController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private CommonPageValueService commonPageValueService;
    @Autowired
    private ManageService manageService;

    @GetMapping("/manage")
    public String user(Map<String, Object> map) {
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("管理").setCommonPageHead(6).setCommonPageFoot();
        manageService.getValueMap(map).setPage("self",0);
        logger.info("/manage");
        return "manage";
    }
    @GetMapping("/manage/{page}")
    public String manage(Map<String, Object> map,@PathVariable String page) {
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("管理").setCommonPageHead(6).setCommonPageFoot();
        manageService.getValueMap(map).setPage(page,0);
        logger.info("/manage/"+page);
        return "manage";
    }
    @GetMapping("/manage/{page}/{index}")
    public String manage(Map<String, Object> map,@PathVariable String page,@PathVariable Integer index) {
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("管理").setCommonPageHead(6).setCommonPageFoot();
        manageService.getValueMap(map).setPage(page,index);
        logger.info("/manage/"+page);
        return "manage";
    }
}
