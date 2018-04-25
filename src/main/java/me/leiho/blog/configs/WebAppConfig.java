package me.leiho.blog.configs;

import junit.framework.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 16:55 2018/2/7
 * @Contact: yesxiaolei@outlook.com
 */
@Configuration
@ComponentScan
public class WebAppConfig extends WebMvcConfigurerAdapter {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/image/**").addResourceLocations("file:C:/工作空间/Projects/x-space/image/");


        String path = WebAppConfig.class.getResource("/").toString();
        path = path.substring(0, path.lastIndexOf("x-space")) + "image/";
        path = path.replace("jar:","");
        try {
            path = URLDecoder.decode(path,"utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        File pathFile = new File("image");
        if (!pathFile.exists()){
            pathFile.mkdirs();
        }else if(pathFile.isFile()){
            pathFile.delete();
            pathFile.mkdirs();
        }

        registry.addResourceHandler("/image/**").addResourceLocations(path);
//        registry.addResourceHandler("/image/**").addResourceLocations(path);
        super.addResourceHandlers(registry);
    }

    @Bean
    public EmbeddedServletContainerCustomizer containerCustomizer() {
        return new EmbeddedServletContainerCustomizer() {
            @Override
            public void customize(ConfigurableEmbeddedServletContainer container) {
                ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/401.html");
                ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/404.html");
                ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500.html");
                container.addErrorPages(error401Page, error404Page, error500Page);
            }
        };
    }

//    public static void main(String[] args) {
//        String path = "file:/www/wwwroot/blog.leiho.me/image/";
//        path = path.replace("jar:","");
//        System.out.println(path);
//    }
}
