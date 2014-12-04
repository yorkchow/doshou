package me.doshou.admin.personal.message.entity;

/**
 * 消息类型
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/4
 * Time: 23:07
 */
public enum MessageType {

    user_message("普通消息"),
    system_message("系统消息");

    private final String info;

    private MessageType(String info) {
        this.info = info;
    }

    public String getInfo() {
        return info;
    }
}
