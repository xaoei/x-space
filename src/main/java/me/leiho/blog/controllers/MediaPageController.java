package me.leiho.blog.controllers;

import me.leiho.blog.services.CommonPageValueService;
import me.leiho.blog.services.MediaPageService;
import me.leiho.blog.utils.IpUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    private IpUtil ipUtil;

    @GetMapping("/media")
    public String about(Map<String, Object> map, HttpServletRequest request) {
//        if (!SecurityUtils.getSubject().isPermitted("/media")) {
//            return "/403.html";
//        }
        logger.trace(ipUtil.getIpAddr(request) + "访问/media");
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("影音").setCommonPageHead(3).setCommonPageFoot();
        mediaPageService.getValueMap(map).setPhotoWall();
        return "media";
    }
}
