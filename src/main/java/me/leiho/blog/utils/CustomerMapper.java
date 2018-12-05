package me.leiho.blog.utils;

import tk.mybatis.mapper.common.ConditionMapper;
import tk.mybatis.mapper.common.IdsMapper;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;
import tk.mybatis.mapper.common.special.InsertListMapper;

/**
 * @Author: 萧大侠
 * @Description: Mapper工具类
 * @Date: Create in 17:14 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
public interface CustomerMapper<T> extends
        Mapper<T>,
        MySqlMapper<T>,
        ConditionMapper<T>,
        IdsMapper<T>,
        InsertListMapper<T> {
    //特别注意，该接口不能被扫描到，否则会出错
}
