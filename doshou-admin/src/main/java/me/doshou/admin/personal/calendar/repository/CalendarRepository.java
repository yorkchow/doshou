package me.doshou.admin.personal.calendar.repository;

import me.doshou.common.repository.BaseRepository;
import me.doshou.admin.personal.calendar.entity.Calendar;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/4
 * Time: 23:02
 */
public interface CalendarRepository extends BaseRepository<Calendar, Long> {

    @Query("select count(id) from Calendar where userId=?1 and ((startDate=?2 and (startTime is null or startTime<?3)) or (startDate > ?2 and startDate<=(?2+?4)) or (startDate<?2 and (startDate+length)>?2) or ((startDate+length)=?2 and (endTime is null or endTime>?3)))")
    Long countRecentlyCalendar(Long userId, Date nowDate, Date nowTime, Integer interval);
}
