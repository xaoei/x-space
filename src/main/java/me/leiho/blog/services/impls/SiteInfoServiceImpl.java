package me.leiho.blog.services.impls;

import me.leiho.blog.mappers.XSiteInfoMapper;
import me.leiho.blog.services.SiteInfoService;
import me.leiho.blog.utils.JsonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class SiteInfoServiceImpl implements SiteInfoService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private XSiteInfoMapper xSiteInfoMapper;

    public String updateSiteInfo(String siteInfo) {
        Map maps = JsonUtil.json2map(siteInfo);
        xSiteInfoMapper.updateSiteInfoByMap(maps);
        return "完成了";
    }
}
