package me.doshou.admin.maintain.icon.service;

import me.doshou.common.service.BaseService;
import me.doshou.admin.maintain.icon.entity.Icon;
import me.doshou.admin.maintain.icon.repository.IconRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/21
 * Time: 20:14
 */
@Service
public class IconService extends BaseService<Icon, Long> {

    private IconRepository getIconRepository() {
        return (IconRepository) baseRepository;
    }

    public Icon findByIdentity(String identity) {
        return getIconRepository().findByIdentity(identity);
    }
}
