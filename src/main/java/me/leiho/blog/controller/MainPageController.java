package me.leiho.blog.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class MainPageController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @GetMapping("/")
    public String main(Model model) {
        model.addAttribute("name", "world");
        logger.info("/");
        return "index";
    }
    @GetMapping("/index")
    public String index(Model model) {
        model.addAttribute("name", "world");
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
