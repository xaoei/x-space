package me.leiho.blog.apis;

import me.leiho.blog.entities.XComment;
import me.leiho.blog.entities.XFriendLink;
import me.leiho.blog.entities.XIndexSetting;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.services.*;
import me.leiho.blog.utils.IpUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class UpdateController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private SiteInfoService siteInfoService;
    @Autowired
    private ManageIndexSettingService manageIndexSettingService;
    @Autowired
    private ArticlePageService articlePageService;
    @Autowired
    private ManageFriendLinkService manageFriendLinkService;
    @Autowired
    private IpUtil ipUtil;

    @PostMapping("/update/userInfo")
    public String updateUserInfo(@RequestBody XUserAccount user, HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request) + "访问/update/userInfo:" + user);
        return userService.updateUserInfo(user);
    }

    @PostMapping("/update/comment")
    public String updateComment(@RequestBody XComment comment, HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request) + "访问/update/comment:" + comment);
        return commentService.updateCommentById(comment);
    }

    @PostMapping("/update/siteInfo")
    public String updateSiteInfo(@RequestBody String siteInfo, HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request) + "访问/update/siteInfo:" + siteInfo);
        return siteInfoService.updateSiteInfo(siteInfo);
    }

    @PostMapping("/update/indexSettingHots")
    public String updateIndexSettingHots(@RequestBody List<XIndexSetting> hots, HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request) + "访问/update/indexSettingHots:" + hots.toString());
        return manageIndexSettingService.getUploadSettings(hots);
    }

    @PostMapping("/update/indexSettingGood")
    public String updateIndexSettingGood(@RequestBody XIndexSetting good, HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request) + "访问/update/indexSettingGood:" + good);
        return manageIndexSettingService.getUploadSetting(good);
    }

    @PostMapping("/update/hot")
    public String updateHot(@RequestBody Integer id, HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request) + "访问/update/hot:" + id);
        return articlePageService.setHot(id);
    }

    @PostMapping("/update/links")
    public String updateLinks(@RequestBody List<XFriendLink> links, HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request) + "访问/update/links:" + links.toString());
        return manageFriendLinkService.updateLinks(links);
    }
}
