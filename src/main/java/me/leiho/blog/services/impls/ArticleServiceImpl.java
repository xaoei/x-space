package me.leiho.blog.services.impls;

import com.sun.xml.internal.rngom.parse.host.Base;
import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.entities.XArticle;
import me.leiho.blog.mappers.XArticleMapper;
import me.leiho.blog.mappers.XArticleTypeMapper;
import me.leiho.blog.services.ArticleService;
import me.leiho.blog.utils.JsonUtil;
import me.leiho.blog.vos.ArticleWriteVO;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import static me.leiho.blog.enums.ResultCode.*;

/**
 * @Author: 萧大侠
 * @Description:
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
    public BaseResult saveOrAnnounceArticle(String article,Boolean announce){
        //json反序列化
        ArticleWriteVO articleWriteVO = JsonUtil.json2pojo(article, ArticleWriteVO.class);
        logger.info(articleWriteVO.toString());
        //格式检校
        if (articleWriteVO==null){
            //解析失败
            return new BaseResult(FAILED_JSON_PARSE);
        }
        if (StringUtils.isBlank(articleWriteVO.getContent())||"<p><br></p>".equals(articleWriteVO.getContent().trim())){
            //文章内容为空
            return new BaseResult(FAILED_ARTICLE_CONTENT_NONE);
        }
        if (StringUtils.isBlank(articleWriteVO.getTitle())){
            //标题为空
            return new BaseResult(FAILED_ARTICLE_TITLE_NONE);
        }
        if (articleWriteVO.getType()==null){
            //未选择文章类型
            return new BaseResult(FAILED_ARTICLE_TYPE_NONE);
        }
        if (articleWriteVO.getContent().length()>60000){
            //文章内容过长
            return new BaseResult(FAILED_ARTICLE_CONTENT_TOLONG);
        }
        if (articleWriteVO.getFeeling().length()>200){
            //感想过长
            return new BaseResult(FAILED_ARTICLE_FEELING_TOLONG);
        }
        //文章类型不存在

        //文章标签不存在
        //
        return new BaseResult(SUCCESS);
    }
}
