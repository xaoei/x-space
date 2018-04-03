package me.leiho.blog.mappers;

import me.leiho.blog.entities.XUserImage;
import me.leiho.blog.utils.CustomerMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface XUserImageMapper extends CustomerMapper<XUserImage> {
    List<XUserImage> selectAllImg();
    List<XUserImage> selectSomrImgs(@Param("size") Integer size);
    void deleteImageById(@Param("id")Integer id);
}