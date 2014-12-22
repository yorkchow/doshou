/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package me.doshou.admin.monitor.web.controller;

import me.doshou.common.web.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/4
 * Time: 23:01
 */
@Controller
@RequestMapping("/admin/monitor/jvm")
@RequiresPermissions("monitor:jvm:*")
public class JvmMonitorController extends BaseController {

    @RequestMapping("")
    public String index() {
        return viewName("index");
    }


}
