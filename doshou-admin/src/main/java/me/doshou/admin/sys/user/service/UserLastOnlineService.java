package me.doshou.admin.sys.user.service;

import me.doshou.common.service.BaseService;
import me.doshou.admin.sys.user.entity.UserLastOnline;
import me.doshou.admin.sys.user.repository.UserLastOnlineRepository;
import org.springframework.stereotype.Service;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/20
 * Time: 13:07
 */
@Service
public class UserLastOnlineService extends BaseService<UserLastOnline, Long> {

    private UserLastOnlineRepository getUserLastOnlineRepository() {
        return (UserLastOnlineRepository) baseRepository;
    }


    public UserLastOnline findByUserId(Long userId) {
        return getUserLastOnlineRepository().findByUserId(userId);
    }

    public void lastOnline(UserLastOnline lastOnline) {
        UserLastOnline dbLastOnline = findByUserId(lastOnline.getUserId());

        if (dbLastOnline == null) {
            dbLastOnline = lastOnline;
        } else {
            UserLastOnline.merge(lastOnline, dbLastOnline);
        }
        dbLastOnline.incLoginCount();
        dbLastOnline.incTotalOnlineTime();
        //相对于save or update
        save(dbLastOnline);
    }
}
