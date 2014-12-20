package me.doshou.admin.sys.user.web.controller;

import me.doshou.common.web.controller.BaseCRUDController;
import me.doshou.admin.sys.user.entity.UserLastOnline;
import me.doshou.admin.sys.user.service.UserLastOnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/20
 * Time: 13:25
 */
@Controller
@RequestMapping(value = "/admin/sys/user/lastOnline")
public class UserLastOnlineController extends BaseCRUDController<UserLastOnline, Long> {

    public UserLastOnlineController() {
        setResourceIdentity("sys:userLastOnline");
    }
}
