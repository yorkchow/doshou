package me.doshou.admin.personal.notification.web.controller;

import me.doshou.common.entity.search.SearchOperator;
import me.doshou.common.entity.search.Searchable;
import me.doshou.common.web.bind.annotation.PageableDefaults;
import me.doshou.common.web.controller.BaseController;
import me.doshou.admin.maintain.notification.entity.NotificationData;
import me.doshou.admin.maintain.notification.service.NotificationDataService;
import me.doshou.admin.sys.user.entity.User;
import me.doshou.admin.sys.user.web.bind.annotation.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/16
 * Time: 23:09
 */
@Controller
@RequestMapping("/admin/personal/notification")
public class NotificationController extends BaseController {

    @Autowired
    private NotificationDataService notificationDataService;

    @RequestMapping
    @PageableDefaults(value = 20, sort = "id=desc")
    public String list(@CurrentUser User user, Pageable pageable, Model model) {

        Searchable searchable = Searchable.newSearchable();
        searchable.addSearchFilter("userId", SearchOperator.eq, user.getId());

        Page<NotificationData> page = notificationDataService.findAll(pageable);

        model.addAttribute("page", page);
        if(pageable.getPageNumber() == 0) {
            notificationDataService.markReadAll(user.getId());
        }

        return viewName("list");
    }

    @RequestMapping("/markRead")
    @ResponseBody
    public String markRead(@RequestParam("id") Long id) {
        notificationDataService.markRead(id);
        return "";
    }
}
