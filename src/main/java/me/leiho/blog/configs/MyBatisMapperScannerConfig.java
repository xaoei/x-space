package me.leiho.blog.configs;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import tk.mybatis.spring.mapper.MapperScannerConfigurer;

import java.util.Properties;


/**
 * @Author: 萧大侠
 * @Description: MyBatis扫描接口，使用的tk.mybatis.spring.mappers.MapperScannerConfigurer，如果你不使用通用Mapper
 * @Date: Create in 17:14 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
@Configuration
//TODO 注意，由于MapperScannerConfigurer执行的比较早，所以必须有下面的注解
@AutoConfigureAfter(MyBatisConfig.class)
public class MyBatisMapperScannerConfig {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Bean
    public MapperScannerConfigurer mapperScannerConfigurer() {
        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
        mapperScannerConfigurer.setSqlSessionFactoryBeanName("sqlSessionFactory");
        mapperScannerConfigurer.setBasePackage("me.leiho.blog.mappers");
        Properties properties = new Properties();
        properties.setProperty("mappers", "me.leiho.blog.utils.CustomerMapper");
        properties.setProperty("ORDER", "BEFORE");
        properties.setProperty("notEmpty", "false");
        properties.setProperty("IDENTITY", "MYSQL");
        mapperScannerConfigurer.setProperties(properties);
        return mapperScannerConfigurer;
    }
}
