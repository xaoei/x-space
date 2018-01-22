package me.leiho.blog.controllers;

import me.leiho.blog.entities.IndexShortArticle;
import me.leiho.blog.entities.PictureLink;
import me.leiho.blog.entities.SimpleLink;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: 萧大侠
 * @Description: 主页控制器
 * @Date: Create in 17:41 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
@Controller
public class MainPageController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @GetMapping({"/","/index"})
    public String index(Map<String, Object> map) {
        map.put("sitename","x-space");
        map.put("title","雷吼");
        map.put("subtitle","也许你只是一株稚嫩的幼苗，然而只要坚忍不拔，终会成为参天大树。");


        map.put("username", "萧大侠");


        map.put("nav_item_a","主页");
        map.put("nav_item_b","文章");
        map.put("nav_item_c","影像");
        map.put("nav_item_d","发布");
        map.put("nav_item_e","管理");


        map.put("logo","tm-home-img");
        map.put("logo_url","img/tm-home-img.jpg");

        List<IndexShortArticle> shortNewArticles = new ArrayList<>();
        shortNewArticles.add(IndexShortArticle.build().setImg("img/tm-img-310x180-1.jpg").setTitle("第一篇新文章").setArticle("酒店位于北京首都国际机场与北京新国展中心位置。").setLink("http://www.leiho.me"));
        shortNewArticles.add(IndexShortArticle.build().setImg("img/tm-img-310x180-2.jpg").setTitle("第二篇新文章").setArticle("北京嘉利华连锁宾馆刘家窑店是一家全新理念的经济宾馆连锁企业。").setLink("http://www.leiho.me"));
        shortNewArticles.add(IndexShortArticle.build().setImg("img/tm-img-310x180-3.jpg").setTitle("第三篇新文章").setArticle("京石景山玖玖源速8酒店座落于空气清新，环境宜人的北京石景山区CRD的繁盛地段。").setLink("http://www.leiho.me"));
        shortNewArticles.add(IndexShortArticle.build().setImg("img/tm-img-310x180-4.jpg").setTitle("第四篇新文章").setArticle("北京嘉利华连锁酒店（旭升店）是一家经济实惠的宾馆。").setLink("http://www.leiho.me"));
        map.put("short_new_article",shortNewArticles);

        map.put("main_article_title","精品文章标题");
        map.put("main_article_feeling","精品文章感言");
        map.put("main_article_img","img/tm-img-660x330-1.jpg");
        map.put("main_article_context","<p>胡适之先生在一九二二年三月，写了一篇《五十年来中国之文学》；篇末论到白话文学的成绩，第三项说：</p><p>白话散文很进步了。长篇议论文的进步，那是显而易见的，可以不论。这几年来，散文方面最可注意的发展，乃是周作人等提倡的“小品散文”。这一类的小品，用平淡的谈话，包藏着深刻的意味；有时很像笨拙，其实却是滑稽。这一类作品的成功，就可彻底打破那“美文不能用白话”的迷信了。</p><p>胡先生共举了四项。第一项白话诗，他说，“可以算是上了成功的路了”；第二项短篇小说，他说“也渐渐的成立了”；第四项戏剧与长篇小说...</p>");

        List<SimpleLink> essayLinks = new ArrayList<>();
        essayLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("这是一篇文章"));
        essayLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("这又是一篇文章"));
        essayLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("这还是一篇文章"));
        essayLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("怎么又是一篇文..."));
        essayLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("竟然还是一篇文..."));
        map.put("essay_links",essayLinks);

        List<SimpleLink> reprintLinks = new ArrayList<>();
        reprintLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("这篇文章贼溜"));
        reprintLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("非常好的教程"));
        reprintLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("学学这个"));
        reprintLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("如何走向成功..."));
        reprintLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("心灵毒鸡汤"));
        map.put("repring_links",reprintLinks);


        List<IndexShortArticle> shortHotArticles = new ArrayList<>();
        shortHotArticles.add(IndexShortArticle.build().setImg("img/tm-img-240x120-1.jpg").setTitle("第一篇热门文章").setArticle("酒店位于北京首都国际机场与北京新国展中心位置。").setLink("http://www.leiho.me"));
        shortHotArticles.add(IndexShortArticle.build().setImg("img/tm-img-240x120-2.jpg").setTitle("第二篇热门文章").setArticle("北京嘉利华连锁宾馆刘家窑店是一家全新理念的经济宾馆连锁企业。").setLink("http://www.leiho.me"));
        shortHotArticles.add(IndexShortArticle.build().setImg("img/tm-img-240x120-3.jpg").setTitle("第三篇热门文章").setArticle("京石景山玖玖源速8酒店座落于空气清新，环境宜人的北京石景山区CRD的繁盛地段。").setLink("http://www.leiho.me"));
        map.put("short_hot_article",shortHotArticles);


        map.put("motto","这是座右铭的位置，请务必保证字数，不要太多，也不要太少，要适中，刚刚好最好。");
        map.put("authorize","转载本站标注原创内容均需获得本人授权，如有版权纠纷请联系本人。");
        map.put("site_master_name","萧大侠/lester");


        List<SimpleLink> friendLinks = new ArrayList<>();
        friendLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("这个网站不错"));
        friendLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("一个很好的博客"));
        friendLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("这是什么东西"));
        friendLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("还行啊"));
        friendLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("点进来看看"));
        friendLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("不要错过"));
        map.put("friend_links",friendLinks);

        List<SimpleLink> commentLinks = new ArrayList<>();
        commentLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("开局一张图，故事全靠编"));
        commentLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("签完合同，美军立刻吓得屁滚尿流、抱头鼠窜、落荒而逃"));
        commentLinks.add(SimpleLink.build().setUrl("http://www.leiho.me").setDesc("希斯莱杰，出演过电影蝙蝠侠黑暗骑士里的小丑，因为演的出神入化而被广为传颂，但演完那部电影..."));
        map.put("comment_links",commentLinks);

        List<PictureLink> pictureLinks = new ArrayList<>();
        pictureLinks.add(PictureLink.build().setUrl("img/tm-img-100x100-1.jpg").setLink("http://www.leiho.me"));
        pictureLinks.add(PictureLink.build().setUrl("img/tm-img-100x100-2.jpg").setLink("http://www.leiho.me"));
        pictureLinks.add(PictureLink.build().setUrl("img/tm-img-100x100-3.jpg").setLink("http://www.leiho.me"));
        pictureLinks.add(PictureLink.build().setUrl("img/tm-img-100x100-4.jpg").setLink("http://www.leiho.me"));
        pictureLinks.add(PictureLink.build().setUrl("img/tm-img-100x100-5.jpg").setLink("http://www.leiho.me"));
        pictureLinks.add(PictureLink.build().setUrl("img/tm-img-100x100-6.jpg").setLink("http://www.leiho.me"));
        map.put("picture_links",pictureLinks);
        map.put("picture_area_context","时光在无声无息的冲刷着人们的记忆，像一把锋利的刀锋把你的记忆切成零散碎片。");



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
