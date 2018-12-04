package me.leiho.blog.services.impls;

import me.leiho.blog.entities.XFriendLink;
import me.leiho.blog.mappers.XFriendLinkMapper;
import me.leiho.blog.services.ManageFriendLinkService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ManageFriendLinkServiceImpl implements ManageFriendLinkService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private XFriendLinkMapper xFriendLinkMapper;

    @Override
    public String updateLinks(List<XFriendLink> links) {
        for (XFriendLink xFriendLink : links) {
            if (xFriendLink.getId() == null || StringUtils.isBlank(xFriendLink.getLinkValue()) || StringUtils.isBlank(xFriendLink.getLinkHref())) {
                return "有的地方没有填";
            }
        }
        try {
            for (XFriendLink xFriendLink : links) {
                xFriendLink.setUpdateTime(new Date());
                xFriendLinkMapper.updateByPrimaryKeySelective(xFriendLink);
            }
        } catch (Exception e) {
            return "数据库保存出错";
        }
        return "ok";
    }
}
