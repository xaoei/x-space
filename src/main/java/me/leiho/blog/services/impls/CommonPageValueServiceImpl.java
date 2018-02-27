package me.leiho.blog.services.impls;

import io.swagger.annotations.ApiParam;
import me.leiho.blog.dtos.HeadItemDTO;
import me.leiho.blog.dtos.UserAccountDTO;
import me.leiho.blog.entities.*;
import me.leiho.blog.mappers.*;
import me.leiho.blog.services.CommonPageValueService;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.*;

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
    private XBlogImageMapper xBlogImageMapper;

    private Map<String, Object> map;
    public CommonPageValueServiceImpl getValueMap(Map<String, Object> map){
        this.map = map;
        return this;
    }
    public CommonPageValueServiceImpl setUserInfo(){
        if (SecurityUtils.getSubject()!=null&&SecurityUtils.getSubject().getPrincipal()!=null){
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            XUserAccount xUserAccount = xUserAccountMapper.selectOne(param);
            if (xUserAccount==null){
                logger.error("账号不存在");
                return this;
            }
            UserAccountDTO userAccountDTO = new UserAccountDTO();
            BeanUtils.copyProperties(xUserAccount,userAccountDTO);
            map.put("user",userAccountDTO);
        }
        return this;
    }
    public CommonPageValueServiceImpl setCommonPageSiteInfo(){
        List<XSiteInfo> xSiteInfoList = xSiteInfoMapper.selectAll();
        for (XSiteInfo xSiteInfo:xSiteInfoList){
            map.put(xSiteInfo.getItemName(),xSiteInfo.getItemValue());
        }
        return this;
    }
    public CommonPageValueServiceImpl setCommonPageHead(int selective){
        List<XHeadItem> xHeadItemList = xHeadItemMapper.selectAll();
        List<HeadItemDTO> headItemDTOList = new ArrayList<>();

        for (XHeadItem xHeadItem:xHeadItemList){
            HeadItemDTO headItemDTO = new HeadItemDTO();
            BeanUtils.copyProperties(xHeadItem,headItemDTO);
            if (headItemDTO.getSortId() != 4 || SecurityUtils.getSubject().isAuthenticated()){
                List<String> roles = new ArrayList<>();
                if(headItemDTO.getSortId() != 4 || SecurityUtils.getSubject().isPermitted("/write")){
                    if (headItemDTO.getSortId() == selective){
                        headItemDTO.setIsSelective(1);
                    }else {
                        headItemDTO.setIsSelective(0);
                    }
                    headItemDTOList.add(headItemDTO);
                }
            }
        }
        map.put("head_items",headItemDTOList);
        return this;
    }
    public CommonPageValueServiceImpl setCommonPageFoot(){
        List<XFriendLink> xFriendLinkList = xFriendLinkMapper.selectAll();
        List<SimpleLink> friendLinks = new ArrayList<>();
        for (XFriendLink xFriendLink:xFriendLinkList){
            friendLinks.add(SimpleLink.build().setUrl(xFriendLink.getLinkHref()).setDesc(xFriendLink.getLinkValue()));
        }
        map.put("friend_links",friendLinks);

        List<SimpleLink> commentLinks = new ArrayList<>();
        Example commentExample = new Example(XComment.class);
        commentExample.createCriteria().andEqualTo("hot",1).andEqualTo("del",0);
        List<XComment> xHotComments = xCommentMapper.selectByExample(commentExample);
        for (int i=0;i<3;i++){
            String comment = xHotComments.get(i).getComment();
            if (comment.length()>40){//将读取的评论字数控制在40以下
                comment = comment.substring(0,40)+"...";
            }
            commentLinks.add(SimpleLink.build().setUrl(xHotComments.get(i).getSourceLink()).setDesc(comment));
        }
        map.put("comment_links",commentLinks);

        List<PictureLink> pictureLinks = new ArrayList<>();
        Example pictureExample = new Example(XBlogImage.class);
        pictureExample.createCriteria().andEqualTo("hot",1).andEqualTo("del",0);
        List<XBlogImage> xHotBlogImages = xBlogImageMapper.selectByExample(pictureExample);
        for (int i=0;i<6;i++){
            String url = "";
            if (xHotBlogImages.get(i).getSync()==1){
                url = xHotBlogImages.get(i).getPath();
            }else {
                url = xHotBlogImages.get(i).getSrc();
            }
            pictureLinks.add(PictureLink.build().setUrl(url).setLink(xHotBlogImages.get(i).getLink()));
        }
        map.put("picture_links",pictureLinks);
        return this;
    }
    public CommonPageValueServiceImpl setPageName(String pageName){
        map.put("page_name",pageName);
        return this;
    }
}
