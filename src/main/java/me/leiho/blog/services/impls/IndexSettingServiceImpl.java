package me.leiho.blog.services.impls;

import me.leiho.blog.configs.WebAppConfig;
import me.leiho.blog.entities.IndexShortArticle;
import me.leiho.blog.entities.XIndexSetting;
import me.leiho.blog.mappers.XIndexSettingMapper;
import me.leiho.blog.services.IndexSettingService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class IndexSettingServiceImpl implements IndexSettingService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private XIndexSettingMapper xIndexSettingMapper;

    private Map<String, Object> map;

    public IndexSettingServiceImpl getValueMap(Map<String, Object> map) {
        this.map = map;
        return this;
    }

    public IndexSettingServiceImpl setIndexArticles(){
        List<XIndexSetting> indexSettingList = xIndexSettingMapper.getAllSettings();
        if (indexSettingList.isEmpty()||indexSettingList.size()<5){
            return this;
        }
        List<IndexShortArticle> shortNewArticles = new ArrayList<>();
        for (XIndexSetting xIndexSetting:indexSettingList){
            if ("hot".equals(xIndexSetting.getType())){
                //310x180
                shortNewArticles.add(IndexShortArticle
                        .build()
                        .setImg(xIndexSetting.getHeadImage())
                        .setTitle(xIndexSetting.getTitle())
                        .setArticle(xIndexSetting.getContent())
                        .setLink("/page/article/"+xIndexSetting.getArticleId()));
            }else if ("awesome".equals(xIndexSetting.getType())){
                map.put("main_article_title", xIndexSetting.getTitle());
                map.put("main_article_feeling",xIndexSetting.getFeeling());
                //660x330
                map.put("main_article_img", xIndexSetting.getHeadImage());
                map.put("main_article_context", xIndexSetting.getContent());
                map.put("main_article_url", "/page/article/"+xIndexSetting.getArticleId());
            }else if ("pic".equals(xIndexSetting.getType())){
                map.put("big_img", xIndexSetting.getTitle());
                map.put("big_img_url", xIndexSetting.getHeadImage());
            }
        }
        map.put("short_new_article", shortNewArticles);
//        map.put("test",WebAppConfig.class.getResource("/").toString());
        return this;
    }

}
