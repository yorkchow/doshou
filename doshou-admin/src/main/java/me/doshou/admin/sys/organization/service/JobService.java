package me.doshou.admin.sys.organization.service;

import me.doshou.common.plugin.service.BaseTreeableService;
import me.doshou.admin.sys.organization.entity.Job;
import me.doshou.admin.sys.organization.repository.JobRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.Set;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 21:02
 */
@Service
public class JobService extends BaseTreeableService<Job, Long> {


    /**
     * 过滤仅获取可显示的数据
     *
     * @param jobIds
     * @param organizationJobIds
     */
    public void filterForCanShow(Set<Long> jobIds, Set<Long[]> organizationJobIds) {

        Iterator<Long> iter1 = jobIds.iterator();

        while (iter1.hasNext()) {
            Long id = iter1.next();
            Job o = findOne(id);
            if (o == null || Boolean.FALSE.equals(o.getShow())) {
                iter1.remove();
            }
        }

        Iterator<Long[]> iter2 = organizationJobIds.iterator();

        while (iter2.hasNext()) {
            Long id = iter2.next()[1];
            Job o = findOne(id);
            if (o == null || Boolean.FALSE.equals(o.getShow())) {
                iter2.remove();
            }
        }

    }
}
