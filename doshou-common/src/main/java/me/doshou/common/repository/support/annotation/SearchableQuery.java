package me.doshou.common.repository.support.annotation;

import me.doshou.common.repository.callback.SearchCallback;

import java.lang.annotation.*;
/**
 * 覆盖默认的根据条件查询数据
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 18:36
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SearchableQuery {

    /**
     * 覆盖默认的查询所有ql
     *
     * @return
     */
    String findAllQuery() default "";

    /**
     * 覆盖默认的统计所有ql
     *
     * @return
     */
    String countAllQuery() default "";

    /**
     * 给ql拼条件及赋值的回调类型
     *
     * @return me.doshou.common.repository.callback.SearchCallback子类
     */
    Class<? extends SearchCallback> callbackClass() default SearchCallback.class;


    QueryJoin[] joins() default {};
}
