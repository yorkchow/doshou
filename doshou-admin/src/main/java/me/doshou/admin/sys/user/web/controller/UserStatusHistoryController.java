package me.doshou.admin.sys.user.web.controller;

import me.doshou.common.web.controller.BaseCRUDController;
import me.doshou.admin.sys.user.entity.UserStatus;
import me.doshou.admin.sys.user.entity.UserStatusHistory;
import me.doshou.admin.sys.user.service.UserStatusHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/20
 * Time: 13:28
 */
@Controller
@RequestMapping(value = "/admin/sys/user/statusHistory")
public class UserStatusHistoryController extends BaseCRUDController<UserStatusHistory, Long> {

    public UserStatusHistoryController() {
        setListAlsoSetCommonData(true);
        setResourceIdentity("sys:userStatusHistory");
    }


    @Override
    protected void setCommonData(Model model) {
        model.addAttribute("statusList", UserStatus.values());
    }
}
