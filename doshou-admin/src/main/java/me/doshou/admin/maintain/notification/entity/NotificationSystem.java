package me.doshou.admin.maintain.notification.entity;

/**
 * 触发的子系统
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/16
 * Time: 23:12
 */
public enum NotificationSystem {

    system("系统"), excel("excel");

    private final String info;

    private NotificationSystem(final String info) {
        this.info = info;
    }

    public String getInfo() {
        return info;
    }
}
