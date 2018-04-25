package me.leiho.blog.apis;

import me.leiho.blog.services.ArticleService;
import me.leiho.blog.services.CommentService;
import me.leiho.blog.services.MediaPageService;
import me.leiho.blog.services.UserService;
import me.leiho.blog.utils.IpUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
public class DeleteController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ArticleService articleService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private MediaPageService mediaPageService;
    @Autowired
    private UserService userService;
    @Autowired
    private IpUtil ipUtil;
    @PostMapping("/delete/article")
    public String deleteArticle(@RequestBody Integer id,HttpServletRequest request){
        logger.info(ipUtil.getIpAddr(request)+"访问/delete/article:" + id);
        return articleService.deleteArticleById(id);
    }
    @PostMapping("/delete/comment")
    public String deleteComment(@RequestBody Integer id,HttpServletRequest request){
        logger.info(ipUtil.getIpAddr(request)+"访问/delete/comment:" + id);
        return commentService.deleteCommentById(id);
    }
    @PostMapping("/delete/image")
    public String deleteImage(@RequestBody Integer id,HttpServletRequest request){
        logger.info(ipUtil.getIpAddr(request)+"访问/delete/image:" + id);
        return mediaPageService.deleteImageById(id);
    }
    @PostMapping("/delete/user")
    public String deleteUser(@RequestBody Integer id,HttpServletRequest request){
        logger.info(ipUtil.getIpAddr(request)+"访问/delete/user:" + id);
        return userService.deleteUserById(id);
    }
}
