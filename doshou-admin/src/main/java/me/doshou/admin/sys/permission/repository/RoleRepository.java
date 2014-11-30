package me.doshou.admin.sys.permission.repository;

import me.doshou.common.repository.BaseRepository;
import me.doshou.admin.sys.permission.entity.Role;
import me.doshou.admin.sys.permission.entity.RoleResourcePermission;
import org.springframework.data.jpa.repository.Query;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 21:16
 */
public interface RoleRepository extends BaseRepository<Role, Long> {

    @Query("from RoleResourcePermission where role=?1 and resourceId=?2")
    RoleResourcePermission findRoleResourcePermission(Role role, Long resourceId);
}
