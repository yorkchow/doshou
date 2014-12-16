package me.doshou.web.repository;

import me.doshou.web.domain.Config;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Config Repository
 *
 * @author: York Chow<york.chow@actionsky.com>
 * @since: 2014/11/22
 * Time: 0:00
 */
public interface ConfigRepository extends JpaRepository<Config, Long> {

    /*
    @Query("select c from Config c where c.name = ?1")
    Config getByName(String name);
    */
    @Cacheable("configs")
    Config findByName(String name);
}
