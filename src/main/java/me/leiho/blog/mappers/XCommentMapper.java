package me.leiho.blog.mappers;

import me.leiho.blog.entities.XComment;
import me.leiho.blog.utils.CustomerMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface XCommentMapper extends CustomerMapper<XComment> {
    List<XComment> getAllCommentByArticleId(@Param("articleId") Integer articleId);
}