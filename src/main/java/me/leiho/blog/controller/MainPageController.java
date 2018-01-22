package me.leiho.blog.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
public class MainPageController {
    Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("/demo")
    public String demo(Map<String, Object> map) {
        map.put("descrip", "It's a springboot integrate freemarker's demo!!!!");
        return "demo";
    }

    @GetMapping({"/","/index"})
    public String index(Map<String, Object> map) {
        map.put("sitename","x-space");
        map.put("username", "萧大侠");
        map.put("nav_item_a","主页");
        map.put("nav_item_b","关于");
        map.put("nav_item_c","博客");
        map.put("nav_item_d","联系方式");
        map.put("logo","tm-home-img");
        map.put("logo_url","\"img/tm-home-img.jpg\"");
        logger.info("/index");
        return "index";
    }
    @GetMapping("/contact")
    public String contact(Model model) {
        model.addAttribute("name", "world");
        logger.info("/contact");
        return "contact";
    }
    @GetMapping("/about")
    public String about(Model model) {
        model.addAttribute("name", "world");
        logger.info("/about");
        return "about";
    }
    @GetMapping("/blog")
    public String blog(Model model) {
        model.addAttribute("name", "world");
        logger.info("/blog");
        return "blog";
    }
}
