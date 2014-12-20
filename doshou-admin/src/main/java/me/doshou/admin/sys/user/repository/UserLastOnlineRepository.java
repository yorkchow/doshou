package me.doshou.admin.sys.user.repository;

import me.doshou.common.repository.BaseRepository;
import me.doshou.admin.sys.user.entity.UserLastOnline;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/20
 * Time: 13:09
 */
public interface UserLastOnlineRepository extends BaseRepository<UserLastOnline, Long> {

    UserLastOnline findByUserId(Long userId);
}
