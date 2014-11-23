package me.doshou.web.repository;

import me.doshou.common.repository.BaseRepository;
import me.doshou.web.domain.Config;
import org.springframework.data.jpa.repository.Query;

/**
 * Config Repository
 *
 * @author: York Chow<york.chow@actionsky.com>
 * @since: 2014/11/22
 * Time: 0:00
 */
public interface ConfigRepository extends BaseRepository<Config, Long> {

    @Query("select c from Config c where c.name = ?1")
    Config getByName(String name);
}
