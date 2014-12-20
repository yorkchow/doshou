package me.doshou.admin.sys.permission.web.controller;

import me.doshou.common.Constants;
import me.doshou.common.entity.enums.AvailableEnum;
import me.doshou.common.web.controller.BaseCRUDController;
import me.doshou.admin.sys.permission.entity.Permission;
import me.doshou.admin.sys.permission.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/20
 * Time: 14:00
 */
@Controller
@RequestMapping(value = "/admin/sys/permission/permission")
public class PermissionController extends BaseCRUDController<Permission, Long> {

    public PermissionController() {
        setResourceIdentity("sys:permission");
    }

    @Override
    protected void setCommonData(Model model) {
        super.setCommonData(model);
        model.addAttribute("availableList", AvailableEnum.values());
    }

    @RequestMapping(value = "/changeStatus/{newStatus}")
    public String changeStatus(
            HttpServletRequest request,
            @PathVariable("newStatus") Boolean newStatus,
            @RequestParam("ids") Long[] ids
    ) {

        this.permissionList.assertHasUpdatePermission();

        for (Long id : ids) {
            Permission permission = baseService.findOne(id);
            permission.setShow(newStatus);
            baseService.update(permission);
        }


        return "redirect:" + request.getAttribute(Constants.BACK_URL);
    }
}
