package me.leiho.blog.apis;

import me.leiho.blog.entities.XComment;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.services.CommentService;
import me.leiho.blog.services.SiteInfoService;
import me.leiho.blog.services.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UpdateController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private SiteInfoService siteInfoService;

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
}
