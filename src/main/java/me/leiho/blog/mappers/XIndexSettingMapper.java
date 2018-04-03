package me.leiho.blog.mappers;

import me.leiho.blog.entities.XIndexSetting;
import me.leiho.blog.utils.CustomerMapper;

import java.util.List;

public interface XIndexSettingMapper extends CustomerMapper<XIndexSetting> {
    List<XIndexSetting> getAllSettings();
}