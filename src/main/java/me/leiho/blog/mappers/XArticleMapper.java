package me.leiho.blog.mappers;

import me.leiho.blog.entities.XArticle;
import me.leiho.blog.utils.CustomerMapper;
import me.leiho.blog.vos.SimpleArticleInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface XArticleMapper extends CustomerMapper<XArticle> {
    /**
     *  时间格式为 2018-01-01
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
            @Param("hot") String hot,
            @Param("announceTime") String announceTime,
            @Param("updateTime") String updateTime
    );
}