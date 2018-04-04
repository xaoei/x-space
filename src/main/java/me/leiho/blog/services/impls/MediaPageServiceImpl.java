package me.leiho.blog.services.impls;

import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.entities.XUserImage;
import me.leiho.blog.mappers.XUserAccountMapper;
import me.leiho.blog.mappers.XUserImageMapper;
import me.leiho.blog.services.MediaPageService;
import org.apache.shiro.SecurityUtils;
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

    @Autowired
    private XUserAccountMapper xUserAccountMapper;


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
    public String deleteImageById(Integer id){
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            XUserAccount xUserAccount = xUserAccountMapper.selectOne(param);
            if (xUserAccount == null) {
                return "用户信息异常";
            }
            XUserImage xUserImage= xUserImageMapper.selectByPrimaryKey(id);
            if (xUserImage==null||xUserImage.getUserId()==null){
                return "没有这篇文章的信息";
            }
            if (xUserAccount.getId()==xUserImage.getUserId()){
                xUserImageMapper.deleteImageById(id);
                return "删除成功";
            }else if (SecurityUtils.getSubject().hasRole("admin")||SecurityUtils.getSubject().hasRole("superadmin")){
                xUserImageMapper.deleteImageById(id);
                return "删除成功";
            }else {
                return "没有权限删除";
            }
        }
        return "没有权限删除";
    }
}
