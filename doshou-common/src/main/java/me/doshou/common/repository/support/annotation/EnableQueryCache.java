package me.doshou.common.repository.support.annotation;

import java.lang.annotation.*;
/**
 * 开启查询缓存
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 18:59
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface EnableQueryCache {

    boolean value() default true;
}
