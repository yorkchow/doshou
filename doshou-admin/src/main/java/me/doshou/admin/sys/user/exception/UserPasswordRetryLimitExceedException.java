package me.doshou.admin.sys.user.exception;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 20:39
 */
public class UserPasswordRetryLimitExceedException extends UserException {
    public UserPasswordRetryLimitExceedException(int retryLimitCount) {
        super("user.password.retry.limit.exceed", new Object[]{retryLimitCount});
    }
}
