package me.leiho.blog.services.impls;

import me.leiho.blog.entities.XArticle;
import me.leiho.blog.entities.XComment;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.mappers.XArticleMapper;
import me.leiho.blog.mappers.XCommentMapper;
import me.leiho.blog.mappers.XUserAccountMapper;
import me.leiho.blog.services.PageService;
import me.leiho.blog.vos.CommentVO;
import me.leiho.blog.vos.SimpleArticleInfoReq;
import me.leiho.blog.vos.XArticleVO;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 18:10 2018/3/16
 * @Contact: yesxiaolei@outlook.com
 */
@Service
public class PageServiceImpl implements PageService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private XArticleMapper xArticleMapper;
    @Autowired
    private XCommentMapper xCommentMapper;
    @Autowired
    private XUserAccountMapper xUserAccountMapper;

    private Map<String, Object> map;

    public PageServiceImpl getValueMap(Map<String, Object> map) {
        this.map = map;
        return this;
    }

    public PageServiceImpl setArticle(String type, Integer no) {
        XUserAccount loginUser = null;
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            loginUser = xUserAccountMapper.selectOne(param);
        }

        SimpleArticleInfoReq req = SimpleArticleInfoReq.build().setType(type).setPage(no).setSize(25);
        XArticle article = xArticleMapper.selectByPrimaryKey(no);
        if (article == null) {
            return this;
        }
        List<XComment> xCommentList = xCommentMapper.getAllCommentByArticleId(no);
        map.put("have_comment", 0);
        if (!xCommentList.isEmpty()) {
            List<CommentVO> commentVOList = new ArrayList<>();
            for (XComment xComment : xCommentList) {
                CommentVO commentVO = new CommentVO();
                commentVO.setId(xComment.getId());
                BeanUtils.copyProperties(xComment, commentVO);
                XUserAccount xUserAccount = xUserAccountMapper.selectByPrimaryKey(xComment.getUserId());
                if (xUserAccount == null || xUserAccount.getUsername() == null) {
                    break;
                }
                commentVO.setUserName(xUserAccount.getUsername());
                if (loginUser!=null&&xUserAccount.getId()==loginUser.getId()){
                    commentVO.setIsOwner(1);
                }else {
                    commentVO.setIsOwner(0);
                }
                if (SecurityUtils.getSubject().hasRole("admin")||SecurityUtils.getSubject().hasRole("superadmin")){
                    commentVO.setIsOwner(1);
                }
                commentVOList.add(commentVO);
            }
            map.put("comment_list", commentVOList);
            map.put("have_comment", 1);
            HashMap<String, String> commentList = new HashMap<>();
        }
        XArticleVO xArticleVO = new XArticleVO();
        BeanUtils.copyProperties(article, xArticleVO);
        //获取作者名称
        XUserAccount xUserAccount = xUserAccountMapper.selectByPrimaryKey(xArticleVO.getAuthor());
        if (xUserAccount == null || StringUtils.isBlank(xUserAccount.getUsername())) {
            return this;
        }
        xArticleVO.setAuthorName(xUserAccount.getUsername());
        map.put("one_content", xArticleVO);
        return this;
    }
}
