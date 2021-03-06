package me.leiho.blog.mappers;

import me.leiho.blog.entities.XArticle;
import me.leiho.blog.utils.CustomerMapper;
import me.leiho.blog.vos.SimpleArticleInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface XArticleMapper extends CustomerMapper<XArticle> {
    /**
     * 时间格式为 2018-01-01
     *
     * @param keyWord
     * @param author
     * @param hot
     * @param announceTime
     * @param updateTime
     * @return
     */
    List<SimpleArticleInfo> getSimpleArticleInfo(
            @Param("keyWord") String keyWord,
            @Param("author") String author,
            @Param("type") String type,
            @Param("hot") String hot,
            @Param("announceTime") String announceTime,
            @Param("updateTime") String updateTime,
            @Param("isAnnounce") Integer isAnnounce
    );

    List<SimpleArticleInfo> getUnFinishArticles(
            @Param("author") Integer author,
            @Param("announce") Integer announce,
            @Param("size") Integer size
    );

    List<SimpleArticleInfo> getArticlesByType(@Param("size") Integer size, @Param("type") Integer type);

    List<XArticle> getHotArticles(@Param("size") Integer size);

    void deleteArticleById(@Param("id") Integer id);
}