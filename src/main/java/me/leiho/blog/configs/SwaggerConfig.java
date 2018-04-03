package me.leiho.blog.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @Author: 萧大侠
 * @Description: swagger-ui的配置
 * api页面 /swagger-ui.html 或者/swagger/index.html ()
 * @Date: Create in 17:14 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("me.leiho.blog.apis"))
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("SpringBoot swagger接口")
                .termsOfServiceUrl("http://www.leiho.me")
                .description("SpringBoot集成swagger")
                .contact(new Contact("萧大侠", "http://leiho.me", "yesxiaolei@outlook.com"))
                .version("1.0")
                .build();
    }

}
