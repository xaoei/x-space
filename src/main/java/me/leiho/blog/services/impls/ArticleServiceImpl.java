package me.leiho.blog.services.impls;

import junit.framework.Test;
import me.leiho.blog.entities.XArticle;
import me.leiho.blog.mappers.XArticleMapper;
import me.leiho.blog.mappers.XArticleTagMapper;
import me.leiho.blog.mappers.XArticleTypeMapper;
import me.leiho.blog.services.ArticleService;
import me.leiho.blog.utils.JsonUtil;
import me.leiho.blog.vos.ArticleWriteVO;
import me.leiho.blog.vos.SaveResult;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

import static me.leiho.blog.enums.ResultCode.*;

/**
 * @Author: 萧大侠
 * @Description: 文章服务
 * @Date: Create in 18:10 2018/2/5
 * @Contact: yesxiaolei@outlook.com
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private XArticleMapper xArticleMapper;
    @Autowired
    private XArticleTypeMapper xArticleTypeMapper;
    @Autowired
    private XArticleTagMapper xArticleTagMapper;
    public SaveResult saveOrAnnounceArticle(String article, Boolean announce){
        //json反序列化
        ArticleWriteVO articleWriteVO = JsonUtil.json2pojo(article, ArticleWriteVO.class);
        logger.info(articleWriteVO.toString());
        //格式检校
        if (articleWriteVO==null){
            //解析失败
            return new SaveResult(FAILED_JSON_PARSE);
        }
        if (StringUtils.isBlank(articleWriteVO.getContent())||"<p><br></p>".equals(articleWriteVO.getContent().trim())){
            //文章内容为空
            return new SaveResult(FAILED_ARTICLE_CONTENT_NONE);
        }
        if (StringUtils.isBlank(articleWriteVO.getTitle())){
            //标题为空
            return new SaveResult(FAILED_ARTICLE_TITLE_NONE);
        }
        if (articleWriteVO.getType()==null){
            //未选择文章类型
            return new SaveResult(FAILED_ARTICLE_TYPE_NONE);
        }
        if (articleWriteVO.getContent().length()>60000){
            //文章内容过长
            return new SaveResult(FAILED_ARTICLE_CONTENT_TOLONG);
        }
        if (articleWriteVO.getFeeling().length()>200){
            //感想过长
            return new SaveResult(FAILED_ARTICLE_FEELING_TOLONG);
        }
        if (xArticleTypeMapper.selectByPrimaryKey(articleWriteVO.getType())==null){
            //文章类型不存在
            return new SaveResult(FAILED_ARTICLE_TYPE_NOT_EXIST);
        }
        if (checkTagFailed(articleWriteVO.getTags())){
            //文章标签不存在
            return new SaveResult(FAILED_ARTICLE_TAG_NOT_EXIST);
        }
        if (articleWriteVO.getId()!=null){
            if (xArticleMapper.selectByPrimaryKey(articleWriteVO.getId())==null){
                return new SaveResult(FAILED_ARTICLE_ID_NOT_EXIST);
            }
            //todo 判断是否同一作者
        }
        //写入数据库
        if (articleWriteVO.getId()==null){
            //新建
            return insertSaveOrAnnounce(articleWriteVO,announce);
        }else {
            //更新
            return updataSaveOrAnnounce(articleWriteVO, announce);
        }
    }
    private SaveResult insertSaveOrAnnounce(ArticleWriteVO articleWriteVO,Boolean announce){
        XArticle xArticle = new XArticle();
        xArticle.setTitle(articleWriteVO.getTitle());
        xArticle.setContent(articleWriteVO.getContent());
        if (StringUtils.isNotBlank(articleWriteVO.getFeeling())){
            xArticle.setFeeling(articleWriteVO.getFeeling());
        }
        xArticle.setAuthor(1);//todo 获取作者id
        xArticle.setType(articleWriteVO.getType());
        if (StringUtils.isNotBlank(articleWriteVO.getTags())){
            xArticle.setTags(articleWriteVO.getTags());
        }
        xArticle.setUpdateCount(1);
        xArticle.setAnnounce(announce?1:0);
        xArticle.setCreateTime(new Date());
        xArticleMapper.insertSelective(xArticle);
        //通过相关条件将id返回
        Example filter = new Example(XArticle.class);
        filter.createCriteria()
                .andEqualTo("title",articleWriteVO.getTitle())
                .andEqualTo("content",articleWriteVO.getContent())
                .andEqualTo("type",articleWriteVO.getType())
                .andEqualTo("del",0);
        List<XArticle> result = xArticleMapper.selectByExample(filter);
        if (result==null||result.size()>1){
            return new SaveResult(FAILED_ARTICLE_SAVE_ERROR);
        }
        return new SaveResult(SUCCESS,result.get(0).getId());
    }
    private SaveResult updataSaveOrAnnounce(ArticleWriteVO articleWriteVO,Boolean announce){
        XArticle xArticle = new XArticle();
        xArticle = xArticleMapper.selectByPrimaryKey(articleWriteVO.getId());
        xArticle.setTitle(articleWriteVO.getTitle());
        xArticle.setContent(articleWriteVO.getContent());
        if (StringUtils.isNotBlank(articleWriteVO.getFeeling())){
            xArticle.setFeeling(articleWriteVO.getFeeling());
        }
        xArticle.setType(articleWriteVO.getType());
        if (StringUtils.isNotBlank(articleWriteVO.getTags())){
            xArticle.setTags(articleWriteVO.getTags());
        }
        xArticle.setAnnounce(announce?1:0);
        xArticle.setUpdateCount(xArticle.getUpdateCount()+1);
        xArticle.setUpdateTime(new Date());
        xArticleMapper.updateByPrimaryKeySelective(xArticle);
        return new SaveResult(SUCCESS);
    }
    private Boolean checkTagFailed(String tags){
        if (StringUtils.isBlank(tags)){
            return false;
        }
        tags = tags.trim();
        if (tags.length()>200){
            return true;
        }
        tags.replace("，",",");
        if (tags.indexOf(",")>0){
            //多tag
            String[] tagList = tags.split(",");
            for (String tag:tagList){
                if (xArticleTagMapper.selectByPrimaryKey(Integer.valueOf(tag))==null){
                    return true;
                }
            }
        }else {
            //单tag
            if (xArticleTagMapper.selectByPrimaryKey(Integer.valueOf(tags))==null){
                return true;
            }
        }
        return false;
    }
}
