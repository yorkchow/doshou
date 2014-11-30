package me.doshou.admin.sys.group.service;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import me.doshou.common.entity.search.SearchOperator;
import me.doshou.common.entity.search.Searchable;
import me.doshou.common.service.BaseService;
import me.doshou.admin.sys.group.entity.Group;
import me.doshou.admin.sys.group.repository.GroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Set;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 20:56
 */
@Service
public class GroupService extends BaseService<Group, Long> {


    @Autowired
    private GroupRelationService groupRelationService;

    private GroupRepository getGroupRepository() {
        return (GroupRepository) baseRepository;
    }

    public Set<Map<String, Object>> findIdAndNames(Searchable searchable, String groupName) {

        searchable.addSearchFilter("name", SearchOperator.like, groupName);

        return Sets.newHashSet(
                Lists.transform(
                        findAll(searchable).getContent(),
                        new Function<Group, Map<String, Object>>() {
                            @Override
                            public Map<String, Object> apply(Group input) {
                                Map<String, Object> data = Maps.newHashMap();
                                data.put("label", input.getName());
                                data.put("value", input.getId());
                                return data;
                            }
                        }
                )
        );
    }

    /**
     * 获取可用的的分组编号列表
     *
     * @param userId
     * @param organizationIds
     * @return
     */
    public Set<Long> findShowGroupIds(Long userId, Set<Long> organizationIds) {
        Set<Long> groupIds = Sets.newHashSet();
        groupIds.addAll(getGroupRepository().findDefaultGroupIds());
        groupIds.addAll(groupRelationService.findGroupIds(userId, organizationIds));


        //TODO 如果分组数量很多 建议此处查询时直接带着是否可用的标识去查
        for (Group group : findAll()) {
            if (Boolean.FALSE.equals(group.getShow())) {
                groupIds.remove(group.getId());
            }
        }

        return groupIds;
    }
}
