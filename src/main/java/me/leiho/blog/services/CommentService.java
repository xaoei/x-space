package me.leiho.blog.services;

import me.leiho.blog.entities.XComment;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 17:08 2018/3/18
 * @Contact: yesxiaolei@outlook.com
 */
public interface CommentService {
    String deleteCommentById(Integer id);
    String updateCommentById(XComment comment);
}
