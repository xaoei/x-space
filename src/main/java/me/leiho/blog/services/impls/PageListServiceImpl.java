package me.leiho.blog.services.impls;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import me.leiho.blog.entities.XArticle;
import me.leiho.blog.mappers.XArticleMapper;
import me.leiho.blog.services.PageListService;
import me.leiho.blog.vos.SimpleArticleInfo;
import me.leiho.blog.vos.SimpleArticleInfoReq;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 17:36 2018/3/14
 * @Contact: yesxiaolei@outlook.com
 */
@Service
public class PageListServiceImpl implements PageListService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private XArticleMapper xArticleMapper;

    public PageInfo<SimpleArticleInfo> getSimpleArticleInfo(SimpleArticleInfoReq req){
        PageHelper.startPage(req.getPage(), req.getSize());
        switch(req.getType().toLowerCase().trim())
        {
            case "update_asc":
                PageHelper.orderBy(" update_time ASC");
                break;
            case "update_desc":
                PageHelper.orderBy(" update_time DESC");
                break;
            case "announce_asc":
                PageHelper.orderBy(" announce_time ASC");
                break;
            case "announce_desc":
                PageHelper.orderBy(" announce_time DESC");
                break;
            default:
                PageHelper.orderBy(" announce_time DESC");
                break;
        }
        List<SimpleArticleInfo> simpleArticleInfos = null;
        simpleArticleInfos = xArticleMapper.getSimpleArticleInfo(
                StringUtils.isNotBlank(req.getKeyWord())?"%"+req.getKeyWord()+"%":req.getKeyWord(),
                req.getAuthor(),
                req.getHot(),
                StringUtils.isNotBlank(req.getAnnounceTime())?"%"+req.getAnnounceTime()+"%":req.getAnnounceTime(),
                StringUtils.isNotBlank(req.getUpdateTime())?"%"+req.getUpdateTime()+"%":req.getUpdateTime()
        );
        PageInfo<SimpleArticleInfo> pageInfo = new PageInfo<>(simpleArticleInfos);
        if (simpleArticleInfos.isEmpty()){
            return new PageInfo<SimpleArticleInfo>();
        }
        //处理标签名称:标签需要前端调用getAllTag()接口将数字替换为名称。
        return pageInfo;
    }
}
