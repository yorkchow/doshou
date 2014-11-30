package me.doshou.admin.sys.organization.service;

import me.doshou.common.plugin.service.BaseTreeableService;
import me.doshou.admin.sys.organization.entity.Organization;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.Set;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 21:08
 */
@Service
public class OrganizationService extends BaseTreeableService<Organization, Long> {

    /**
     * 过滤仅获取可显示的数据
     *
     * @param organizationIds
     * @param organizationJobIds
     */
    public void filterForCanShow(Set<Long> organizationIds, Set<Long[]> organizationJobIds) {

        Iterator<Long> iter1 = organizationIds.iterator();

        while (iter1.hasNext()) {
            Long id = iter1.next();
            Organization o = findOne(id);
            if (o == null || Boolean.FALSE.equals(o.getShow())) {
                iter1.remove();
            }
        }

        Iterator<Long[]> iter2 = organizationJobIds.iterator();

        while (iter2.hasNext()) {
            Long id = iter2.next()[0];
            Organization o = findOne(id);
            if (o == null || Boolean.FALSE.equals(o.getShow())) {
                iter2.remove();
            }
        }

    }
}
