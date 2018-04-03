package me.leiho.blog.services.impls;

import me.leiho.blog.entities.XArticle;
import me.leiho.blog.entities.XComment;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.mappers.XCommentMapper;
import me.leiho.blog.mappers.XUserAccountMapper;
import me.leiho.blog.services.CommentService;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 17:09 2018/3/18
 * @Contact: yesxiaolei@outlook.com
 */
@Service
public class CommentServiceImpl implements CommentService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private XUserAccountMapper xUserAccountMapper;

    @Autowired
    private XCommentMapper xCommentMapper;

    public String deleteCommentById(Integer id){
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            XUserAccount xUserAccount = xUserAccountMapper.selectOne(param);
            if (xUserAccount == null) {
                return "用户信息异常";
            }
            XComment xComment = xCommentMapper.selectByPrimaryKey(id);
            if (xComment==null||xComment.getUserId()==null){
                return "没有这篇文章的信息";
            }
            if (xUserAccount.getId()==xComment.getUserId()){
                xCommentMapper.deleteCommentById(id);
                return "删除成功";
            }else if (SecurityUtils.getSubject().hasRole("admin")||SecurityUtils.getSubject().hasRole("superadmin")){
                xCommentMapper.deleteCommentById(id);
                return "删除成功";
            }else {
                return "没有权限删除";
            }
        }
        return "没有权限删除";
    }
    public String updateCommentById(XComment comment){
        if (comment==null||comment.getId()==null){
            return "参数异常";
        }
        Integer id = comment.getId();
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            XUserAccount xUserAccount = xUserAccountMapper.selectOne(param);
            if (xUserAccount == null) {
                return "用户信息异常";
            }
            XComment xComment = xCommentMapper.selectByPrimaryKey(id);
            if (xComment==null||xComment.getUserId()==null){
                return "没有这篇文章的信息";
            }
            if (xUserAccount.getId()==xComment.getUserId()){
                comment.setUpdateTime(new Date());
                xCommentMapper.updateByPrimaryKeySelective(comment);
                return "修改成功";
            }else {
                return "没有权限修改";
            }
        }
        return "没有权限修改";
    }

}
