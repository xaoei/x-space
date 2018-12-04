package me.leiho.blog.services;

import me.leiho.blog.services.impls.MediaPageServiceImpl;

import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 15:45 2018/3/28
 * @Contact: yesxiaolei@outlook.com
 */
public interface MediaPageService {
    MediaPageServiceImpl getValueMap(Map<String, Object> map);

    //    MediaPageServiceImpl setPhotoWall();
    String deleteImageById(Integer id);
}
