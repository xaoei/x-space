package me.leiho.blog.services.impls;

import me.leiho.blog.entities.XUserImage;
import me.leiho.blog.mappers.XUserImageMapper;
import me.leiho.blog.services.MediaPageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 15:45 2018/3/28
 * @Contact: yesxiaolei@outlook.com
 */
@Service
public class MediaPageServiceImpl implements MediaPageService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private XUserImageMapper xUserImageMapper;


    private Map<String, Object> map;

    public MediaPageServiceImpl getValueMap(Map<String, Object> map) {
        this.map = map;
        return this;
    }

    public MediaPageServiceImpl setPhotoWall() {
        List<XUserImage> xUserImageList = xUserImageMapper.selectAllImg();
        map.put("user_img_list", xUserImageList);
        return this;
    }
}
