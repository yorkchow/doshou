package me.doshou.admin.sys.user.web.bind.annotation;

import me.doshou.common.Constants;

import java.lang.annotation.*;
/**
 * <p>绑定当前登录的用户</p>
 * <p>不同于@ModelAttribute</p>
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/4
 * Time: 22:46
 */
@Target({ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface CurrentUser {

    /**
     * 当前用户在request中的名字 默认{@link Constants#CURRENT_USER}
     *
     * @return
     */
    String value() default Constants.CURRENT_USER;
}
