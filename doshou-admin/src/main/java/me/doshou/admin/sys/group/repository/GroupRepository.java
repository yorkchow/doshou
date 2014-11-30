package me.doshou.admin.sys.group.repository;

import me.doshou.common.repository.BaseRepository;
import me.doshou.admin.sys.group.entity.Group;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 20:59
 */
public interface GroupRepository extends BaseRepository<Group, Long> {

    @Query("select id from Group where defaultGroup=true and show=true")
    List<Long> findDefaultGroupIds();

}
