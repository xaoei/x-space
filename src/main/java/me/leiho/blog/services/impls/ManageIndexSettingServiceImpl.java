package me.leiho.blog.services.impls;

import me.leiho.blog.entities.XIndexSetting;
import me.leiho.blog.mappers.XIndexSettingMapper;
import me.leiho.blog.services.ManageIndexSettingService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ManageIndexSettingServiceImpl implements ManageIndexSettingService{
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private XIndexSettingMapper xIndexSettingMapper;
    public String getUploadSettings(List<XIndexSetting> settings){
        for (XIndexSetting xIndexSetting:settings){
            if (xIndexSetting.getId()==null||StringUtils.isBlank(xIndexSetting.getHeadImage())||StringUtils.isBlank(xIndexSetting.getTitle())||xIndexSetting.getArticleId()==null||StringUtils.isBlank(xIndexSetting.getContent())){
                return "有的地方没有填";
            }
        }
        try {
            for (XIndexSetting xIndexSetting:settings){
                xIndexSetting.setUpdateTime(new Date());
                xIndexSettingMapper.updateByPrimaryKeySelective(xIndexSetting);
            }
        }catch (Exception e){
            return "数据库保存出错";
        }
        return "ok";
    }

    public String getUploadSetting(XIndexSetting setting){
        if (setting.getId()==null||StringUtils.isBlank(setting.getHeadImage()) ||StringUtils.isBlank(setting.getTitle())||setting.getArticleId()==null||StringUtils.isBlank(setting.getContent())||StringUtils.isBlank(setting.getFeeling())){
            return "有的地方没有填";
        }
        try {
            setting.setUpdateTime(new Date());
            xIndexSettingMapper.updateByPrimaryKeySelective(setting);
        }catch (Exception e){
            return "数据库保存出错";
        }
        return "ok";
    }
}
