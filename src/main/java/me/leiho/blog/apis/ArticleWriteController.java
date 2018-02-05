package me.leiho.blog.apis;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.services.ArticleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: 萧大侠
 * @Description: 文章书写相关接口
 * @Date: Create in 18:18 2018/2/5
 * @Contact: yesxiaolei@outlook.com
 */
@Api("文章书写相关接口")
@RestController
public class ArticleWriteController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private ArticleService articleService;
    @ApiOperation(value = "保存文章")
    @PostMapping("/v1/write/save")
    public BaseResult write(@RequestBody String article){
        logger.info(article);
        return articleService.saveOrAnnounceArticle(article,false);
    }
    @ApiOperation(value = "发布文章")
    @PostMapping("/v1/write/announce")
    public BaseResult announce(@RequestBody String article){
        logger.info(article);
        return articleService.saveOrAnnounceArticle(article,true);
    }
}
