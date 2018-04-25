package me.leiho.blog.apis;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.services.ArticleService;
import me.leiho.blog.services.WritePageService;
import me.leiho.blog.utils.IpUtil;
import me.leiho.blog.vos.TagsResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

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
    @Autowired
    private WritePageService writePageService;
    @Autowired
    private IpUtil ipUtil;
    @ApiOperation(value = "保存文章")
    @PostMapping("/v1/write/save")
    public BaseResult write(@RequestBody String article,HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request)+"访问/v1/write/save:" + article);
        return articleService.saveOrAnnounceArticle(article, false);
    }

    @ApiOperation(value = "发布文章")
    @PostMapping("/v1/write/announce")
    public BaseResult announce(@RequestBody String article,HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request)+"访问/v1/write/announce:" + article);
        return articleService.saveOrAnnounceArticle(article, true);
    }

    @ApiOperation(value = "新增tags")
    @PostMapping("/v1/addNewTags")
    public TagsResult addNewTags(@RequestBody String tags,HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request)+"访问/v1/addNewTags:" + tags);
        return writePageService.addNewTags(tags);
    }
}
