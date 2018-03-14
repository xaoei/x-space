package me.leiho.blog.mappers;

import me.leiho.blog.entities.XArticleTag;
import me.leiho.blog.utils.CustomerMapper;

import java.util.List;

public interface XArticleTagMapper extends CustomerMapper<XArticleTag> {
    List<XArticleTag> getAllTag();
}