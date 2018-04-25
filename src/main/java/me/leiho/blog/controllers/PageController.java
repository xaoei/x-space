package me.leiho.blog.controllers;

import me.leiho.blog.services.CommonPageValueService;
import me.leiho.blog.services.PageService;
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
 * @Description: 主页控制器
 * @Date: Create in 17:41 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
@Controller
public class PageController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private CommonPageValueService commonPageValueService;
    @Autowired
    private PageService pageService;
    @Autowired
    private IpUtil ipUtil;
    @GetMapping(value = "/page/{type}/{id}")
    /**
     * type:
     *      article
     *      media
     * */
    public String index(Map<String, Object> map, @PathVariable String type, @PathVariable Integer id,HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request)+"访问/page/" + type + "/" + id);
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("主页").setCommonPageHead(0).setCommonPageFoot();
        pageService.getValueMap(map).setArticle(type, id);
        return "page";
    }
}
