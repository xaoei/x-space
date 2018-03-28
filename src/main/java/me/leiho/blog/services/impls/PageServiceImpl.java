package me.leiho.blog.services.impls;

import com.github.pagehelper.PageInfo;
import me.leiho.blog.entities.XArticle;
import me.leiho.blog.entities.XComment;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.mappers.XArticleMapper;
import me.leiho.blog.mappers.XCommentMapper;
import me.leiho.blog.mappers.XUserAccountMapper;
import me.leiho.blog.services.PageListService;
import me.leiho.blog.services.PageService;
import me.leiho.blog.vos.CommentVO;
import me.leiho.blog.vos.SimpleArticleInfo;
import me.leiho.blog.vos.SimpleArticleInfoReq;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.Id;
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
    public PageServiceImpl getValueMap(Map<String, Object> map){
        this.map = map;
        return this;
    }
    public PageServiceImpl setArticle(String type,Integer no){
        SimpleArticleInfoReq req = SimpleArticleInfoReq.build().setType(type).setPage(no).setSize(25);
        XArticle article = xArticleMapper.selectByPrimaryKey(no);
        if (article==null){
            return this;
        }
        List<XComment> xCommentList = xCommentMapper.getAllCommentByArticleId(no);
        map.put("have_comment",0);
        if (!xCommentList.isEmpty()){
            List<CommentVO> commentVOList = new ArrayList<>();
            for (XComment xComment:xCommentList){
                CommentVO commentVO = new CommentVO();
                BeanUtils.copyProperties(xComment,commentVO);
                XUserAccount xUserAccount = xUserAccountMapper.selectByPrimaryKey(xComment.getUserId());
                if (xUserAccount==null||xUserAccount.getUsername()==null){
                    break;
                }
                commentVO.setUserName(xUserAccount.getUsername());
                commentVOList.add(commentVO);
            }
            map.put("comment_list",commentVOList);
            map.put("have_comment",1);
            HashMap<String,String> commentList = new HashMap<>();
        }
        map.put("one_content",article);
        return this;
    }
}