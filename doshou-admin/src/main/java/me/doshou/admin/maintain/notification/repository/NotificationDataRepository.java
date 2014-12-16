package me.doshou.admin.maintain.notification.repository;

import me.doshou.common.repository.BaseRepository;
import me.doshou.admin.maintain.notification.entity.NotificationData;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/16
 * Time: 23:15
 */
public interface NotificationDataRepository extends BaseRepository<NotificationData, Long> {

    @Modifying
    @Query("update NotificationData o set o.read=true where userId=?1")
    void markReadAll(Long userId);
}
