package me.leiho.blog.services;

import me.leiho.blog.entities.XIndexSetting;

import java.util.List;

public interface ManageIndexSettingService {
    String getUploadSettings(List<XIndexSetting> settings);

    String getUploadSetting(XIndexSetting setting);
}
