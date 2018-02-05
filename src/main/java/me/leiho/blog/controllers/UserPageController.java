package me.leiho.blog.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description: 用户页控制器
 * @Date: Create in 15:25 2018/1/25
 * @Contact: yesxiaolei@outlook.com
 */
@Controller
public class UserPageController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @GetMapping("/register")
    public String index(Map<String, Object> map) {
        map.put("sitename","x-space");
        return "register";
    }
}
