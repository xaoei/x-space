package me.leiho.blog.mappers;

import me.leiho.blog.entities.XComment;
import me.leiho.blog.utils.CustomerMapper;
import me.leiho.blog.vos.WriteCommentVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface XCommentMapper extends CustomerMapper<XComment> {
    List<XComment> getAllCommentByArticleId(@Param("articleId") Integer articleId);

    List<WriteCommentVO> getCommentByAuthor(
            @Param("author") Integer author,
            @Param("size") Integer size
    );

    List<XComment> getNewComments(@Param("size") Integer size);

    void deleteCommentById(@Param("id")Integer id);
}