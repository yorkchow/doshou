package me.doshou.admin.maintain.icon.repository;

import me.doshou.common.repository.BaseRepository;
import me.doshou.admin.maintain.icon.entity.Icon;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/21
 * Time: 20:14
 */
public interface IconRepository extends BaseRepository<Icon, Long> {

    Icon findByIdentity(String identity);
}
