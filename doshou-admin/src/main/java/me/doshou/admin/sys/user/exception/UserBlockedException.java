package me.doshou.admin.sys.user.exception;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 20:23
 */
public class UserBlockedException extends UserException {

    public UserBlockedException(String reason) {
        super("user.blocked", new Object[]{reason});
    }
}
