package me.leiho.blog.apis;

import me.leiho.blog.utils.IpUtil;
import me.leiho.blog.vos.Greeting;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.concurrent.atomic.AtomicLong;

/**
 * @Author: 萧大侠
 * @Description: 接口
 * @Date: Create in 17:14 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
@RestController
public class ApiController {
    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private IpUtil ipUtil;

    @GetMapping("/greeting")
    public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name, HttpServletRequest request) {
        logger.info(ipUtil.getIpAddr(request) + "访问/greeting");
        return new Greeting(counter.incrementAndGet(), String.format(template, name));
    }
}
