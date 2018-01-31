package me.leiho.blog.services.impls;

import io.swagger.annotations.ApiParam;
import me.leiho.blog.dtos.HeadItemDTO;
import me.leiho.blog.dtos.UserAccountDTO;
import me.leiho.blog.entities.*;
import me.leiho.blog.mappers.*;
import me.leiho.blog.services.CommonPageValueService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.Collections;
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

    private Map<String, Object> map;
    public CommonPageValueServiceImpl getValueMap(Map<String, Object> map){
        this.map = map;
        return this;
    }
    public CommonPageValueServiceImpl setUserInfo(Integer userId){
        XUserAccount param = new XUserAccount();
        param.setId(userId);
        param.setDel(0);
        XUserAccount xUserAccount = xUserAccountMapper.selectOne(param);
        if (xUserAccount==null){
            logger.error("账号不存在");
        }
        UserAccountDTO userAccountDTO = new UserAccountDTO();
        BeanUtils.copyProperties(xUserAccount,userAccountDTO);
        map.put("user",userAccountDTO);
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

//        for (int i=0;i<xHeadItemList.size();i++){
        for (XHeadItem xHeadItem:xHeadItemList){
            HeadItemDTO headItemDTO = new HeadItemDTO();
            BeanUtils.copyProperties(xHeadItem,headItemDTO);
            if (headItemDTO.getSortId() == selective){
                headItemDTO.setIsSelective(1);
            }else {
                headItemDTO.setIsSelective(0);
            }
            headItemDTOList.add(headItemDTO);
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
//        commentLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("开局一张图，故事全靠编"));
//        commentLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("签完合同，美军立刻吓得屁滚尿流、抱头鼠窜、落荒而逃"));
//        commentLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("希斯莱杰，出演过电影蝙蝠侠黑暗骑士里的小丑，因为演的出神入化而被广为传颂，但演完那部电影..."));
        map.put("comment_links",commentLinks);

        List<PictureLink> pictureLinks = new ArrayList<>();
        Example pictureExample = new Example(XBlogImage.class);
        pictureExample.createCriteria().andEqualTo("hot",1).andEqualTo("del",0);

        pictureLinks.add(PictureLink.build().setUrl("img/tm-img-100x100-1.jpg").setLink("http://www.leiho.me"));
        pictureLinks.add(PictureLink.build().setUrl("img/tm-img-100x100-2.jpg").setLink("http://www.leiho.me"));
        pictureLinks.add(PictureLink.build().setUrl("img/tm-img-100x100-3.jpg").setLink("http://www.leiho.me"));
        pictureLinks.add(PictureLink.build().setUrl("img/tm-img-100x100-4.jpg").setLink("http://www.leiho.me"));
        pictureLinks.add(PictureLink.build().setUrl("img/tm-img-100x100-5.jpg").setLink("http://www.leiho.me"));
        pictureLinks.add(PictureLink.build().setUrl("img/tm-img-100x100-6.jpg").setLink("http://www.leiho.me"));
        map.put("picture_links",pictureLinks);
//        map.put("picture_area_context","时光在无声无息的冲刷着人们的记忆，像一把锋利的刀锋把你的记忆切成零散碎片。");
        return this;
    }
}
