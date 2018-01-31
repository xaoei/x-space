package me.leiho.blog.services;

import me.leiho.blog.services.impls.CommonPageValueServiceImpl;

import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 15:30 2018/1/25
 * @Contact: yesxiaolei@outlook.com
 */
public interface CommonPageValueService {
    /**
     * 获得设置参数的map对象
     * @param map
     * @return
     */
    CommonPageValueServiceImpl getValueMap(Map<String, Object> map);

    /**
     * 设置用户信息
     * @param userId
     * @return
     */
    CommonPageValueServiceImpl setUserInfo(Integer userId);

    /**
     * 设置网站信息
     * @return
     */
    CommonPageValueServiceImpl setCommonPageSiteInfo();

    /**
     * 设置网站头部信息
     * @return
     */
    CommonPageValueServiceImpl setCommonPageHead(int selective);

    /**
     * 设置网站底部信息
     * @return
     */
    CommonPageValueServiceImpl setCommonPageFoot();

    /**
     * 设置网站页面名称
     * @return
     */
    CommonPageValueServiceImpl setPageName(String pageName);
}
