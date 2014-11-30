package me.doshou.common.repository.support.annotation;

import javax.persistence.criteria.JoinType;
import java.lang.annotation.*;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 18:52
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface QueryJoin {

    /**
     * 连接的名字
     * @return
     */
    String property();

    JoinType joinType();
}
