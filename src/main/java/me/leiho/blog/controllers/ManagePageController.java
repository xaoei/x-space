package me.leiho.blog.controllers;

import me.leiho.blog.services.CommonPageValueService;
import me.leiho.blog.services.ManageService;
import me.leiho.blog.utils.IpUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    private IpUtil ipUtil;
    @GetMapping("/manage")
    public String user(Map<String, Object> map,HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request)+"访问/manage");
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("管理").setCommonPageHead(6).setCommonPageFoot();
        manageService.getValueMap(map).setPage("self",0);
        return "manage";
    }
    @GetMapping("/manage/{page}")
    public String manage(Map<String, Object> map,@PathVariable String page,HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request)+"访问/manage/"+page);
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("管理").setCommonPageHead(6).setCommonPageFoot();
        manageService.getValueMap(map).setPage(page,0);
        return "manage";
    }
    @GetMapping("/manage/{page}/{index}")
    public String manage(Map<String, Object> map,@PathVariable String page,@PathVariable Integer index,HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request)+"访问/manage/"+page+"/"+index);
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("管理").setCommonPageHead(6).setCommonPageFoot();
        manageService.getValueMap(map).setPage(page,index);
        return "manage";
    }
}
