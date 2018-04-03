package me.leiho.blog.apis;

import me.leiho.blog.services.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

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
    @PostMapping("/delete/article")
    public String deleteArticle(@RequestBody Integer id){
        return articleService.deleteArticleById(id);
    }
    @PostMapping("/delete/comment")
    public String deleteComment(@RequestBody Integer id){
        return commentService.deleteCommentById(id);
    }
    @PostMapping("/delete/image")
    public String deleteImage(@RequestBody Integer id){
        return mediaPageService.deleteImageById(id);
    }
    @PostMapping("/delete/user")
    public String deleteUser(@RequestBody Integer id){
        return userService.deleteUserById(id);
    }
}
