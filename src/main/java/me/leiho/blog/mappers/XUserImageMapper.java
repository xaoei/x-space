package me.leiho.blog.mappers;

import me.leiho.blog.entities.XUserImage;
import me.leiho.blog.utils.CustomerMapper;

import java.util.List;

public interface XUserImageMapper extends CustomerMapper<XUserImage> {
    List<XUserImage> selectAllImg();
}