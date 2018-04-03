package me.leiho.blog.mappers;

import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.utils.CustomerMapper;
import org.apache.ibatis.annotations.Param;

public interface XUserAccountMapper extends CustomerMapper<XUserAccount> {
    void deleteUserById(@Param("id")Integer id);
}