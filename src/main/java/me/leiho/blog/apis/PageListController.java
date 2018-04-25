package me.leiho.blog.apis;

import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import me.leiho.blog.services.PageListService;
import me.leiho.blog.utils.IpUtil;
import me.leiho.blog.vos.SimpleArticleInfo;
import me.leiho.blog.vos.SimpleArticleInfoReq;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 17:35 2018/3/14
 * @Contact: yesxiaolei@outlook.com
 */
@Api("列表相关接口")
@RestController
public class PageListController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private PageListService pageListService;
    @Autowired
    private IpUtil ipUtil;
    @ApiOperation(value = "分页读取列表")
    @PostMapping("/v1/read/getSimpleArticleInfo")
    public PageInfo<SimpleArticleInfo> getSimpleArticleInfo(@RequestBody SimpleArticleInfoReq req,HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request)+"访问/v1/read/getSimpleArticleInfo:" + req);
        return pageListService.getSimpleArticleInfo(req);
    }
}
