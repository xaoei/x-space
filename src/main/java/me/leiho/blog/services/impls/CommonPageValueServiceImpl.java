package me.leiho.blog.services.impls;

import me.leiho.blog.dtos.HeadItemDTO;
import me.leiho.blog.dtos.UserAccountDTO;
import me.leiho.blog.entities.*;
import me.leiho.blog.mappers.*;
import me.leiho.blog.services.CommonPageValueService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 15:30 2018/1/25
 * @Contact: yesxiaolei@outlook.com
 */
@Service
public class CommonPageValueServiceImpl implements CommonPageValueService {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private XHeadItemMapper xHeadItemMapper;
    @Autowired
    private XUserAccountMapper xUserAccountMapper;
    @Autowired
    private XSiteInfoMapper xSiteInfoMapper;
    @Autowired
    private XFriendLinkMapper xFriendLinkMapper;
    @Autowired
    private XCommentMapper xCommentMapper;
    @Autowired
    private XUserImageMapper xUserImageMapper;

    private Map<String, Object> map;

    public CommonPageValueServiceImpl getValueMap(Map<String, Object> map) {
        this.map = map;
        return this;
    }

    public CommonPageValueServiceImpl setUserInfo() {
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            XUserAccount xUserAccount = xUserAccountMapper.selectOne(param);
            if (xUserAccount == null) {
                logger.error("账号不存在");
                return this;
            }
            UserAccountDTO userAccountDTO = new UserAccountDTO();
            BeanUtils.copyProperties(xUserAccount, userAccountDTO);
            map.put("user", userAccountDTO);
        }
        return this;
    }

    public CommonPageValueServiceImpl setCommonPageSiteInfo() {
        List<XSiteInfo> xSiteInfoList = xSiteInfoMapper.selectAll();
        for (XSiteInfo xSiteInfo : xSiteInfoList) {
            map.put(xSiteInfo.getItemName(), xSiteInfo.getItemValue());
        }
        return this;
    }

    public CommonPageValueServiceImpl setCommonPageHead(int selective) {
        List<XHeadItem> xHeadItemList = xHeadItemMapper.selectAll();
        List<HeadItemDTO> headItemDTOList = new ArrayList<>();

        for (XHeadItem xHeadItem : xHeadItemList) {
            Subject subject = SecurityUtils.getSubject();
            HeadItemDTO headItemDTO = new HeadItemDTO();
            BeanUtils.copyProperties(xHeadItem, headItemDTO);
            if ((headItemDTO.getSortId() != 4 && headItemDTO.getSortId() != 6)
                    || SecurityUtils.getSubject().isAuthenticated()) {
                if ((headItemDTO.getSortId() != 4 && headItemDTO.getSortId() != 6) ||
                        (headItemDTO.getSortId() == 4 && SecurityUtils.getSubject().isPermitted("/write")) ||
                        (headItemDTO.getSortId() == 6 && SecurityUtils.getSubject().isPermitted("/manage")))
                {
                    if (headItemDTO.getSortId() == selective) {
                        headItemDTO.setIsSelective(1);
                    } else {
                        headItemDTO.setIsSelective(0);
                    }
                    headItemDTOList.add(headItemDTO);
                }
            }
        }
        map.put("head_items", headItemDTOList);
        return this;
    }

    public CommonPageValueServiceImpl setCommonPageFoot() {
        List<XFriendLink> xFriendLinkList = xFriendLinkMapper.selectAll();
        List<SimpleLink> friendLinks = new ArrayList<>();
        if (xFriendLinkList.size() > 0) {
            for (int i = 0; i < (xFriendLinkList.size() > 6 ? 6 : xFriendLinkList.size()); i++) {
                friendLinks.add(SimpleLink.build().setUrl(xFriendLinkList.get(i).getLinkHref()).setDesc(xFriendLinkList.get(i).getLinkValue()));
            }
            map.put("friend_links", friendLinks);
        }
        List<SimpleLink> commentLinks = new ArrayList<>();
        List<XComment> xHotComments = xCommentMapper.getNewComments(3);
        if (xHotComments.size() > 0) {
            for (int i = 0; i < (xHotComments.size() > 3 ? 3 : xHotComments.size()); i++) {
                String comment = xHotComments.get(i).getComment();
                if (comment.length() > 40) {//将读取的评论字数控制在40以下
                    comment = comment.substring(0, 40) + "...";
                }
                commentLinks.add(SimpleLink.build().setUrl(xHotComments.get(i).getArticleId() + "").setDesc(comment));
            }
            map.put("comment_links", commentLinks);
        }
        List<PictureLink> pictureLinks = new ArrayList<>();
        List<XUserImage> xUserImages = xUserImageMapper.selectSomrImgs(6);
        if (xUserImages.size() > 0) {
            for (int i = 0; i < (xUserImages.size() > 6 ? 6 : xUserImages.size()); i++) {
                String url = "";
//                if (xUserImages.get(i).getSync() == 1) {
//                    url = xUserImages.get(i).getPath();
//                } else {
//                    url = xUserImages.get(i).getSrc();
//                }
                url = xUserImages.get(i).getSmallSrc();
                pictureLinks.add(PictureLink.build().setUrl(url).setLink(xUserImages.get(i).getTotalSrc()));
            }
            map.put("picture_links", pictureLinks);
        }
        return this;
    }

    public CommonPageValueServiceImpl setPageName(String pageName) {
        map.put("page_name", pageName);
        return this;
    }
}
