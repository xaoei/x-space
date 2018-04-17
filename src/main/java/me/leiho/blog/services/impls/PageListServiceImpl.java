package me.leiho.blog.services.impls;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.mappers.XArticleMapper;
import me.leiho.blog.mappers.XUserAccountMapper;
import me.leiho.blog.services.PageListService;
import me.leiho.blog.vos.SimpleArticleInfo;
import me.leiho.blog.vos.SimpleArticleInfoReq;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    @Autowired
    private XUserAccountMapper xUserAccountMapper;

    public PageInfo<SimpleArticleInfo> getSimpleArticleInfo(SimpleArticleInfoReq req) {
        XUserAccount loginUser = null;
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            loginUser = xUserAccountMapper.selectOne(param);
        }
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            XUserAccount xUserAccount = xUserAccountMapper.selectOne(param);
            if (xUserAccount == null) {
                return new PageInfo<SimpleArticleInfo>();
            }
            if (StringUtils.isNotBlank(req.getAuthor())) {
                if (xUserAccount.getId() != Integer.parseInt(req.getAuthor())) {
                    return new PageInfo<SimpleArticleInfo>();
                }
            }
        }
        PageHelper.startPage(req.getPage(), req.getSize());
        switch (req.getType().toLowerCase().trim()) {
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
                StringUtils.isNotBlank(req.getKeyWord()) ? "%" + req.getKeyWord() + "%" : req.getKeyWord(),
                req.getAuthor(),
                req.getHot(),
                StringUtils.isNotBlank(req.getAnnounceTime()) ? "%" + req.getAnnounceTime() + "%" : req.getAnnounceTime(),
                StringUtils.isNotBlank(req.getUpdateTime()) ? "%" + req.getUpdateTime() + "%" : req.getUpdateTime(),
                req.getIsAnnounce()
        );
        for (int i=0;i<simpleArticleInfos.size();i++){
            if (loginUser!=null&&simpleArticleInfos.get(i).getId()==loginUser.getId()){
                simpleArticleInfos.get(i).setIsOwner(1);
            }else {
                simpleArticleInfos.get(i).setIsOwner(0);
            }
            if (SecurityUtils.getSubject().hasRole("admin")||SecurityUtils.getSubject().hasRole("superadmin")){
                simpleArticleInfos.get(i).setIsOwner(1);
            }
        }
        PageInfo<SimpleArticleInfo> pageInfo = new PageInfo<>(simpleArticleInfos);
        if (simpleArticleInfos.isEmpty()) {
            return new PageInfo<SimpleArticleInfo>();
        }
        //处理标签名称:标签需要前端调用getAllTag()接口将数字替换为名称。
        return pageInfo;
    }
}
