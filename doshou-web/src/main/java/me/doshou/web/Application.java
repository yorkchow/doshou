package me.doshou.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * 程序启动类
 *
 * @author: York Chow<york.chow@actionsky.com>
 * @since: 2014/11/21
 * Time: 16:56
 */
@Configuration
@ComponentScan
@EnableCaching
@EnableAutoConfiguration
public class Application extends SpringBootServletInitializer {

    private static Class<Application> entryPointClass = Application.class;

    private static final Logger log = LoggerFactory.getLogger(entryPointClass);

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(entryPointClass);
    }

    @Bean
    public CacheManager cacheManager() {
        log.info(".... CacheManager init");
        return new ConcurrentMapCacheManager(new String[]{"configs", "cats"});
    }

    public static void main(String[] args) {
        SpringApplication.run(entryPointClass, args);
    }
}
