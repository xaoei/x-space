package me.leiho.blog.services;

import me.leiho.blog.services.impls.IndexSettingServiceImpl;

import java.util.Map;

public interface IndexSettingService {
    IndexSettingServiceImpl getValueMap(Map<String, Object> map);
}
