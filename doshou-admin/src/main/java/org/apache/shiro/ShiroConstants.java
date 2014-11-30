package org.apache.shiro;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 20:42
 */
public interface ShiroConstants {
    /**
     * 当前在线会话
     */
    String ONLINE_SESSION = "online_session";

    /**
     * 仅清空本地缓存 不情况数据库的
     */
    String ONLY_CLEAR_CACHE = "online_session_only_clear_cache";
}
