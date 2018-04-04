package me.leiho.blog.services;

import me.leiho.blog.services.impls.ManageServiceImpl;

import java.util.Map;

public interface ManageService {
    ManageServiceImpl getValueMap(Map<String, Object> map);
}
