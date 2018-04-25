package me.leiho.blog.apis;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import me.leiho.blog.entities.XArticle;
import me.leiho.blog.entities.XComment;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.mappers.XArticleMapper;
import me.leiho.blog.mappers.XCommentMapper;
import me.leiho.blog.mappers.XUserAccountMapper;
import me.leiho.blog.utils.IpUtil;
import me.leiho.blog.utils.JsonUtil;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 17:58 2018/3/18
 * @Contact: yesxiaolei@outlook.com
 */
@Api("评论相关接口")
@RestController
public class CommentController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private XUserAccountMapper xUserAccountMapper;
    @Autowired
    private XArticleMapper xArticleMapper;
    @Autowired
    private XCommentMapper xCommentMapper;
    @Autowired
    private IpUtil ipUtil;
    @ApiOperation(value = "保存评论")
    @RequestMapping("/v1/comment/save")
    public String saveComment(@RequestBody String comment,HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request)+"访问/v1/comment/save:" + comment);
        //json反序列化
        XComment xComment = JsonUtil.json2pojo(comment, XComment.class);
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            XUserAccount xUserAccount = xUserAccountMapper.selectOne(param);
            if (xUserAccount == null) {
                logger.error("账号不存在");
                return "账号不存在";
            }
            xComment.setUserId(xUserAccount.getId());
        } else {
            return "不是自己人不可以评论喔~";
        }
        XArticle xArticle = xArticleMapper.selectByPrimaryKey(xComment.getArticleId());
        if (xArticle == null) {
            return "不能乱修改页面元素喔~";
        }
        xComment.setCreateTime(new Date());
        xCommentMapper.insertSelective(xComment);
        return "评论成功!";
    }
}
