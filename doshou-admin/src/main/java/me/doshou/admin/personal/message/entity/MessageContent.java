package me.doshou.admin.personal.message.entity;

import me.doshou.common.entity.BaseEntity;
import org.hibernate.annotations.Proxy;
import org.hibernate.validator.constraints.Length;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;
import javax.persistence.Table;
/**
 * 消息内容
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/4
 * Time: 23:06
 */
@Entity
@Table(name = "personal_message_content")
@Proxy(lazy = true, proxyClass = MessageContent.class)
public class MessageContent extends BaseEntity<Long> {

    @OneToOne(fetch = FetchType.LAZY)
    private Message message;

    /**
     * 消息内容
     */
    @Length(min = 5, max = 50000, message = "{length.not.valid}")
    private String content;


    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
