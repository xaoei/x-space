package me.leiho.blog.apis;

import me.leiho.blog.entities.XComment;
import me.leiho.blog.entities.XFriendLink;
import me.leiho.blog.entities.XIndexSetting;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.mappers.XArticleMapper;
import me.leiho.blog.services.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

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

    @PostMapping("/update/userInfo")
    public String updateUserInfo(@RequestBody XUserAccount user){
        return userService.updateUserInfo(user);
    }
    @PostMapping("/update/comment")
    public String updateComment(@RequestBody XComment comment){
        return commentService.updateCommentById(comment);
    }
    @PostMapping("/update/siteInfo")
    public String updateSiteInfo(@RequestBody String siteInfo){
        return siteInfoService.updateSiteInfo(siteInfo);
    }
    @PostMapping("/update/indexSettingHots")
    public String updateIndexSettingHots(@RequestBody List<XIndexSetting> hots){
        return manageIndexSettingService.getUploadSettings(hots);
    }
    @PostMapping("/update/indexSettingGood")
    public String updateIndexSettingGood(@RequestBody XIndexSetting good){
        return manageIndexSettingService.getUploadSetting(good);
    }
    @PostMapping("/update/hot")
    public String updateHot(@RequestBody Integer id){
        return articlePageService.setHot(id);
    }
    @PostMapping("/update/links")
    public String updateLinks(@RequestBody List<XFriendLink> links){
        return manageFriendLinkService.updateLinks(links);
    }
}
