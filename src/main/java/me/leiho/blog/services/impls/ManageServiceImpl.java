package me.leiho.blog.services.impls;

import com.github.pagehelper.PageInfo;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.mappers.XUserAccountMapper;
import me.leiho.blog.services.ManageService;
import me.leiho.blog.services.UserService;
import me.leiho.blog.vos.UserInfoReq;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class ManageServiceImpl implements ManageService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private Map<String, Object> map;

    @Autowired
    private UserService userService;

    public ManageServiceImpl getValueMap(Map<String, Object> map) {
        this.map = map;
        return this;
    }

    public ManageServiceImpl setPage(String page,Integer index){
        if (!SecurityUtils.getSubject().isPermitted("/manage/"+page)){
            map.put("forbidden",true);
        }else {
            if ("user".equals(page)){
                setManageUserPage(map,index);
            }
        }
        //通过page设置不同的map
        map.put("manage_page",page);
        return this;
    }
    private void setManageUserPage(Map<String, Object> map,Integer index){
        UserInfoReq req = null;
        if (index>0){
            req = UserInfoReq.build().setPage(index).setSize(10);
        }else {
            req = UserInfoReq.build().setPage(1).setSize(10);
        }
        PageInfo<XUserAccount> pageInfo = userService.getUserInfoList(req);
        if (pageInfo==null){
            return;
        }
        map.put("page_index", pageInfo.getPageNum());
        map.put("page_total", pageInfo.getPages());
        map.put("page_pre", pageInfo.getPrePage());
        map.put("page_next", pageInfo.getNextPage());
        if (pageInfo.getSize() == 0) {
            return;
        }
        map.put("user_info_list", pageInfo.getList());
    }
}
