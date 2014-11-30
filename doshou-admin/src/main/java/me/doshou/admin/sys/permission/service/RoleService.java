package me.doshou.admin.sys.permission.service;

import com.google.common.collect.Sets;
import me.doshou.common.service.BaseService;
import me.doshou.admin.sys.permission.entity.Role;
import me.doshou.admin.sys.permission.entity.RoleResourcePermission;
import me.doshou.admin.sys.permission.repository.RoleRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 21:15
 */
@Service
public class RoleService extends BaseService<Role, Long> {

    public RoleRepository getRoleRepository() {
        return (RoleRepository) baseRepository;
    }

    @Override
    public Role update(Role role) {
        List<RoleResourcePermission> localResourcePermissions = role.getResourcePermissions();
        for (int i = 0, l = localResourcePermissions.size(); i < l; i++) {
            RoleResourcePermission localResourcePermission = localResourcePermissions.get(i);
            localResourcePermission.setRole(role);
            RoleResourcePermission dbResourcePermission = findRoleResourcePermission(localResourcePermission);
            if (dbResourcePermission != null) {//出现在先删除再添加的情况
                dbResourcePermission.setRole(localResourcePermission.getRole());
                dbResourcePermission.setResourceId(localResourcePermission.getResourceId());
                dbResourcePermission.setPermissionIds(localResourcePermission.getPermissionIds());
                localResourcePermissions.set(i, dbResourcePermission);
            }
        }
        return super.update(role);
    }

    private RoleResourcePermission findRoleResourcePermission(RoleResourcePermission roleResourcePermission) {
        return getRoleRepository().findRoleResourcePermission(
                roleResourcePermission.getRole(), roleResourcePermission.getResourceId());
    }

    /**
     * 获取可用的角色列表
     *
     * @param roleIds
     * @return
     */
    public Set<Role> findShowRoles(Set<Long> roleIds) {

        Set<Role> roles = Sets.newHashSet();

        //TODO 如果角色很多 此处应该写查询
        for (Role role : findAll()) {
            if (Boolean.TRUE.equals(role.getShow()) && roleIds.contains(role.getId())) {
                roles.add(role);
            }
        }
        return roles;
    }


}
