package me.doshou.admin.sys.user.exception;

import me.doshou.common.exception.BaseException;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 20:24
 */
public class UserException extends BaseException {

    public UserException(String code, Object[] args) {
        super("user", code, args, null);
    }
}
