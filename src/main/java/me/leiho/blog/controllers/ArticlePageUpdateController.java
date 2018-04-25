package me.leiho.blog.controllers;

import me.leiho.blog.services.ArticlePageService;
import me.leiho.blog.services.CommonPageValueService;
import me.leiho.blog.utils.IpUtil;
import me.leiho.blog.vos.SimpleArticleInfoReq;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
@Controller
public class ArticlePageUpdateController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ArticlePageService articlePageService;
    @Autowired
    private CommonPageValueService commonPageValueService;
    @Autowired
    private IpUtil ipUtil;

    @GetMapping("/update/{type}/{userId}/{isAnnounce}/{no}")
    public String updateArticle(Map<String, Object> map, @PathVariable String type, @PathVariable String userId, @PathVariable Integer isAnnounce, @PathVariable Integer no,HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request)+"访问/update/" + type+"/"+userId+"/"+isAnnounce+"/"+no);
        commonPageValueService.getValueMap(map).setUserInfo().setCommonPageSiteInfo().setPageName("作品").setCommonPageHead(4).setCommonPageFoot();
        SimpleArticleInfoReq req = SimpleArticleInfoReq.build().setType(type).setPage(no).setSize(25).setIsAnnounce(isAnnounce).setAuthor(userId);
        articlePageService.getValueMap(map).setSimpleArticleInfo(req).setSideBar(30);
        map.put("page_mode", "update");
        return "update";
    }
}
