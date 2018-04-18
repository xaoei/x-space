package me.leiho.blog.mappers;

import me.leiho.blog.entities.XSiteInfo;
import me.leiho.blog.utils.CustomerMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface XSiteInfoMapper extends CustomerMapper<XSiteInfo> {
    void updateSiteInfoByMap(@Param("siteInfo")Map<String,String> siteInfo);
}