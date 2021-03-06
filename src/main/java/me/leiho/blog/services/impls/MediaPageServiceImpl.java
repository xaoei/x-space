package me.leiho.blog.services.impls;

import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.entities.XUserImage;
import me.leiho.blog.mappers.XUserAccountMapper;
import me.leiho.blog.mappers.XUserImageMapper;
import me.leiho.blog.services.MediaPageService;
import me.leiho.blog.vos.XUserImageVO;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
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
        XUserAccount xUserAccount = null;
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            xUserAccount = xUserAccountMapper.selectOne(param);
        }
        List<XUserImage> xUserImageList = new ArrayList<>();
        if (SecurityUtils.getSubject().hasRole("superadmin") || SecurityUtils.getSubject().hasRole("admin")) {
            xUserImageList = xUserImageMapper.selectAllImg();
        } else {
            Example example = new Example(XUserImage.class);
            example.createCriteria().andNotEqualTo("id", 1);
            xUserImageList = xUserImageMapper.selectByExample(example);
        }
        List<XUserImageVO> imageVOList = new ArrayList<>();
        for (XUserImage xUserImage : xUserImageList) {
            XUserImageVO xUserImageVO = new XUserImageVO();
            BeanUtils.copyProperties(xUserImage, xUserImageVO);
            if (xUserAccount != null && xUserAccount.getId() != null && xUserImage.getUserId() != null && xUserAccount.getId().equals(xUserImage.getUserId())) {
                xUserImageVO.setIsOwner(1);
            } else {
                xUserImageVO.setIsOwner(0);
            }
            if (SecurityUtils.getSubject().hasRole("admin") || SecurityUtils.getSubject().hasRole("superadmin")) {
                xUserImageVO.setIsOwner(1);
            }
//            System.out.println(xUserImageVO);
            imageVOList.add(xUserImageVO);
        }
        map.put("user_img_list", imageVOList);
        return this;
    }

    public String deleteImageById(Integer id) {
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            XUserAccount xUserAccount = xUserAccountMapper.selectOne(param);
            if (xUserAccount == null) {
                return "用户信息异常";
            }
            XUserImage xUserImage = xUserImageMapper.selectByPrimaryKey(id);
            if (xUserImage == null || xUserImage.getUserId() == null) {
                return "没有这篇文章的信息";
            }
            if (xUserAccount.getId() == xUserImage.getUserId()) {
                xUserImageMapper.deleteImageById(id);
                return "删除成功";
            } else if (SecurityUtils.getSubject().hasRole("admin") || SecurityUtils.getSubject().hasRole("superadmin")) {
                xUserImageMapper.deleteImageById(id);
                return "删除成功";
            } else {
                return "没有权限删除";
            }
        }
        return "没有权限删除";
    }
}
