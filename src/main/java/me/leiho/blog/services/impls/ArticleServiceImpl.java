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
            return new BaseResult(FAILED_JSON_PARSE.getValue(),FAILED_JSON_PARSE.getDesc());
        }
        if (StringUtils.isBlank(articleWriteVO.getContent())||"<p><br></p>".equals(articleWriteVO.getContent().trim())){
            return new BaseResult(FAILED_ARTICLE_CONTENT_NONE.getValue(),FAILED_ARTICLE_CONTENT_NONE.getDesc());
        }
        if (StringUtils.isBlank(articleWriteVO.getTitle())){
            return new BaseResult(FAILED_ARTICLE_TITLE_NONE.getValue(),FAILED_ARTICLE_TITLE_NONE.getDesc());
        }
        if (articleWriteVO.getType()==null){
            return new BaseResult(FAILED_ARTICLE_TYPE_NONE.getValue(),FAILED_ARTICLE_TYPE_NONE.getDesc());
        }
        //
        return new BaseResult();
    }
}
