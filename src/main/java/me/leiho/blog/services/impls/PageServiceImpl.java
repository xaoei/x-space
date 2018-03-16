package me.leiho.blog.services.impls;

import com.github.pagehelper.PageInfo;
import me.leiho.blog.entities.XArticle;
import me.leiho.blog.mappers.XArticleMapper;
import me.leiho.blog.services.PageListService;
import me.leiho.blog.services.PageService;
import me.leiho.blog.vos.SimpleArticleInfo;
import me.leiho.blog.vos.SimpleArticleInfoReq;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.Id;
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
        map.put("one_content",article);
        return this;
    }
}
