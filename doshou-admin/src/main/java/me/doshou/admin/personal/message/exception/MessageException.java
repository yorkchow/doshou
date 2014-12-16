package me.doshou.admin.personal.message.exception;

import me.doshou.common.exception.BaseException;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/16
 * Time: 23:03
 */
public class MessageException extends BaseException {

    public MessageException(String code, Object[] args) {
        super("personal", code, args);
    }
}
