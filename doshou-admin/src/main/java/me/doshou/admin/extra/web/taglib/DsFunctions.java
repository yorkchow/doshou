package me.doshou.admin.extra.web.taglib;

import me.doshou.common.utils.SpringUtils;
import me.doshou.admin.sys.organization.entity.Job;
import me.doshou.admin.sys.organization.entity.Organization;
import me.doshou.admin.sys.organization.service.JobService;
import me.doshou.admin.sys.organization.service.OrganizationService;
import me.doshou.admin.sys.permission.entity.Permission;
import me.doshou.admin.sys.permission.entity.Role;
import me.doshou.admin.sys.permission.service.PermissionService;
import me.doshou.admin.sys.permission.service.RoleService;
import me.doshou.admin.sys.resource.entity.Resource;
import me.doshou.admin.sys.resource.service.ResourceService;

import java.util.Iterator;
/**
 * 提供el中可以使用的一些函数
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/15
 * Time: 22:27
 */
public class DsFunctions {

    public static boolean in(Iterable iterable, Object obj) {
        if(iterable == null) {
            return false;
        }
        Iterator iterator = iterable.iterator();

        while(iterator.hasNext()) {
            if(iterator.next().equals(obj)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 判断是否存储指定id的组织机构
     *
     * @param id
     * @param onlyDisplayShow 是否仅显示可见的
     * @return
     */
    public static boolean existsOrganization(Long id, Boolean onlyDisplayShow) {
        Organization organization = SpringUtils.getBean(OrganizationService.class).findOne(id);
        if (organization == null) {
            return false;
        }
        if (Boolean.TRUE.equals(onlyDisplayShow) && Boolean.FALSE.equals(organization.getShow())) {
            return false;
        }
        return true;
    }

    /**
     * 判断是否存储指定id的工作职务
     *
     * @param id
     * @param onlyDisplayShow 是否仅显示可见的
     * @return
     */
    public static boolean existsJob(Long id, Boolean onlyDisplayShow) {
        Job job = SpringUtils.getBean(JobService.class).findOne(id);
        if (job == null) {
            return false;
        }
        if (Boolean.TRUE.equals(onlyDisplayShow) && Boolean.FALSE.equals(job.getShow())) {
            return false;
        }
        return true;
    }

    /**
     * 判断是否存储指定id的资源
     *
     * @param id
     * @param onlyDisplayShow 是否仅显示可见的
     * @return
     */
    public static boolean existsResource(Long id, Boolean onlyDisplayShow) {
        Resource resource = SpringUtils.getBean(ResourceService.class).findOne(id);
        if (resource == null) {
            return false;
        }
        if (Boolean.TRUE.equals(onlyDisplayShow) && Boolean.FALSE.equals(resource.getShow())) {
            return false;
        }
        return true;
    }

    /**
     * 判断是否存储指定id的权限
     *
     * @param id
     * @param onlyDisplayShow 是否仅显示可见的
     * @return
     */
    public static boolean existsPermission(Long id, Boolean onlyDisplayShow) {
        Permission permission = SpringUtils.getBean(PermissionService.class).findOne(id);
        if (permission == null) {
            return false;
        }
        if (Boolean.TRUE.equals(onlyDisplayShow) && Boolean.FALSE.equals(permission.getShow())) {
            return false;
        }
        return true;
    }


    /**
     * 判断是否存储指定id的角色
     *
     * @param id
     * @param onlyDisplayShow 是否仅显示可见的
     * @return
     */
    public static boolean existsRole(Long id, Boolean onlyDisplayShow) {
        Role role = SpringUtils.getBean(RoleService.class).findOne(id);
        if (role == null) {
            return false;
        }
        if (Boolean.TRUE.equals(onlyDisplayShow) && Boolean.FALSE.equals(role.getShow())) {
            return false;
        }
        return true;
    }
}
