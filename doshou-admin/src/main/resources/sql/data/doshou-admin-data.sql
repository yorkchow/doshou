truncate table `sys_user`;
/*默认admin/123456*/
insert into `sys_user`
(`id`,`username`,`email`,`mobile_phone_number`,`password`,`salt`,`create_date`,`status`,`deleted`,`admin`)
values
(1,'admin','admin@sishuok.com','13412345671','ec21fa1738f39d5312c6df46002d403d','yDd1956wn1',sysdate(),'normal',0,1);

truncate table `sys_organization`;
insert into `sys_organization`(`id`, `parent_id`, `parent_ids`, weight, `name`, `is_show`) values (1, 0, '0/', 1, '组织机构', true);

truncate table `sys_job`;
insert into `sys_job`(`id`, `parent_id`, `parent_ids`, weight, `name`, `is_show`) values (1, 0, '0/', 1, '职务', true);

truncate table `sys_resource`;
insert into `sys_resource`(`id`, `parent_id`, `parent_ids`, weight, `name`, `identity`, `url`, `is_show`) values
(1, 0, '0/', 1, '资源', '', '', 1),
(2, 1, '0/1/', 2, '系统管理', 'sys', '', 1),
(3, 2, '0/1/2/', 1, '用户管理', '', '', 1),
(4, 3, '0/1/2/3/', 1, '用户列表', 'user', '/admin/sys/user/main', 1),
(5, 3, '0/1/2/3/', 2, '在线用户列表', 'userOnline', '/admin/sys/user/online', 1),
(6, 3, '0/1/2/3/', 3, '状态变更历史列表', 'userStatusHistory', '/admin/sys/user/statusHistory', 1),
(7, 3, '0/1/2/3/', 4, '用户最后在线历史列表', 'userLastOnline', '/admin/sys/user/lastOnline', 1),
(8, 2, '0/1/2/', 2, '组织机构管理', '', '', 1),
(9, 8, '0/1/2/8/', 1, '组织机构列表', 'organization', '/admin/sys/organization/organization', 1),
(10, 8, '0/1/2/8/', 2, '工作职务列表', 'job', '/admin/sys/organization/job', 1),
(11, 2, '0/1/2/', 3, '分组列表', 'group', '/admin/sys/group', 1),
(12, 2, '0/1/2/', 4, '资源列表', 'resource', '/admin/sys/resource', 1),
(13, 2, '0/1/2/', 5, '权限管理', '', '', 1),
(14, 13, '0/1/2/13/', 1, '权限列表', 'permission', '/admin/sys/permission/permission', 1),
(15, 13, '0/1/2/13/', 2, '授权权限给角色', 'role', '/admin/sys/permission/role', 1),
(16, 13, '0/1/2/13/', 3, '授权角色给实体', 'auth', '/admin/sys/auth', 1),
(17, 1, '0/1/', 4, '个人中心', '', '', 1),
(18, 17, '0/1/17/', 1, '我的消息', '', '/admin/personal/message', 1),
(19, 17, '0/1/17/', 2, '我的通知', '', '/admin/personal/notification', 1),
(20, 1, '0/1/', 5, '开发维护', 'maintain', '', 1),
(21, 20, '0/1/20/', 1, '通知模板', 'notificationTemplate', '/admin/maintain/notification/template', 1),
(22, 20, '0/1/20/', 2, '图标管理', 'icon', '/admin/maintain/icon', 1),
(23, 20, '0/1/20/', 3, '键值对', 'keyvalue', '/admin/maintain/keyvalue', 1),
(24, 20, '0/1/20/', 4, '静态资源版本控制', 'staticResource', '/admin/maintain/staticResource', 1),
(25, 20, '0/1/20/', 5, '在线编辑', 'onlineEditor', '/admin/maintain/editor', 1),
(26, 20, '0/1/33/', 6, '任务调度', 'dynamicTask', '/admin/maintain/dynamicTask', 1),
(27, 1, '0/1/', 6, '系统监控', 'monitor', '', 1),
(28, 27, '0/1/27/', 1, '在线用户列表', 'userOnline', '/admin/sys/user/online', 1),
(29, 27, '0/1/27/', 2, '数据库监控', 'db', '/admin/monitor/druid/index.html', 1),
(30, 27, '0/1/27/', 3, 'hibernate监控', 'hibernate', '/admin/monitor/hibernate', 1),
(31, 27, '0/1/27/', 4, '执行SQL/JPA QL', 'ql', '/admin/monitor/db/sql', 1),
(32, 27, '0/1/27/', 5, 'ehcache监控', 'ehcache', '/admin/monitor/ehcache', 1),
(33, 27, '0/1/27/', 6, 'jvm监控', 'jvm', '/admin/monitor/jvm', 1);

truncate table `sys_permission`;
insert into `sys_permission` (`id`, `name`, `permission`, `description`, `is_show`) values
(1, '所有', '*', '所有数据操作的权限', 1),
(2, '新增', 'create', '新增数据操作的权限', 1),
(3,  '修改', 'update', '修改数据操作的权限', 1),
(4,  '删除', 'delete', '删除数据操作的权限', 1),
(5,  '查看', 'view', '查看数据操作的权限', 1),
(6,  '审核', 'audit', '审核数据操作的权限', 1);

truncate table `sys_role`;
insert into `sys_role` (`id`, `name`, `role`, `description`, `is_show`) values
(1,  '超级管理员', 'admin', '拥有所有权限', 1),
(2,  '系统管理员', 'sys_admin', '拥有系统管理的所有权限', 1),
(3,  '维护管理员', 'conf_admin', '拥有维护管理的所有权限', 1),
(4,  '新增管理员', 'create_admin', '拥有新增/查看管理的所有权限', 1),
(5,  '修改管理员', 'update_admin', '拥有修改/查看管理的所有权限', 1),
(6,  '删除管理员', 'delete_admin', '拥有删除/查看管理的所有权限', 1),
(7,  '查看管理员', 'view_admin', '拥有查看管理的所有权限', 1),
(8,  '审核管理员', 'audit_admin', '拥有审核管理的所有权限', 1),
(9,  '监控管理员', 'audit_admin', '拥有审核管理的所有权限', 1);

truncate table `sys_role_resource_permission`;
insert into `sys_role_resource_permission` (`id`, `role_id`, `resource_id`, `permission_ids`) values
(1, 1, 2, '1'),
(2, 1, 20, '1'),
(3, 1, 27, '1'),
(4, 2, 2, '1'),
(5, 3, 20, '1'),
(6, 4, 2, '2,5'),
(7, 4, 20, '2,5'),
(8, 4, 27, '2,5'),
(9, 5, 2, '3,5'),
(10, 5, 20, '3,5'),
(11, 5, 27, '3,5'),
(12, 6, 2, '4,5'),
(13, 6, 20, '4,5'),
(14, 6, 27, '4,5'),
(15, 7, 2, '5'),
(16, 7, 20, '5'),
(17, 7, 27, '5'),
(18, 9, 27, '1');

truncate table `sys_auth`;
insert into sys_auth (`id`, `organization_id`, `job_id`, `user_id`, `group_id`, `role_ids`, `type`)
values(1, 0, 0, 1, 0, '1', 'user');

truncate table `maintain_notification_template`;
insert into `maintain_notification_template` (`id`, `name`, `system`, `title`, `template`, `deleted`) values
(1, 'excelInitDataSuccess', 'excel', '初始化Excel数据完成', '初始化Excel数据已完成，耗时{seconds}秒钟，可以尝试导入/导出操作啦！', false),
(2, 'excelImportSuccess', 'excel', '导入Excel成功', '导入Excel成功，耗时{seconds}秒钟，<a onclick="$($.find(\'#menu a:contains(Excel导入/导出)\')).click();$(\'.notification-list .close-notification-list\').click();">点击前往查看</a>', false),
(3, 'excelImportError', 'excel', '导入Excel失败', '导入Excel失败了，请把错误报告给管理员，可能的失败原因：文件格式不对；错误码：{error}', false),
(4, 'excelExportSuccess', 'excel', '导出Excel成功', '导出Excel成功，耗时{seconds}秒钟，<a href="{ctx}{url}" target="_blank">点击下载</a>（注意：导出的文件只保留3天，请尽快下载，过期将删除）', false),
(5, 'excelExportError', 'excel', '导出Excel失败', '导出Excel失败了，请把错误报告给管理员，可能的失败原因：文件格式不对；错误码：{error}', false);

truncate table `maintain_icon`;
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(1, 'icon-adjust', 'icon-adjust', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(2, 'icon-anchor', 'icon-anchor', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(3, 'icon-archive', 'icon-archive', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(4, 'icon-asterisk', 'icon-asterisk', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(5, 'icon-ban-circle', 'icon-ban-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(6, 'icon-bar-chart', 'icon-bar-chart', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(7, 'icon-barcode', 'icon-barcode', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(8, 'icon-beaker', 'icon-beaker', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(9, 'icon-beer', 'icon-beer', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(10, 'icon-bell', 'icon-bell', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(11, 'icon-bell-alt', 'icon-bell-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(12, 'icon-bolt', 'icon-bolt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(13, 'icon-book', 'icon-book', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(14, 'icon-bookmark', 'icon-bookmark', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(15, 'icon-bookmark-empty', 'icon-bookmark-empty', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(16, 'icon-briefcase', 'icon-briefcase', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(17, 'icon-bug', 'icon-bug', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(18, 'icon-building', 'icon-building', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(19, 'icon-bullhorn', 'icon-bullhorn', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(20, 'icon-bullseye', 'icon-bullseye', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(21, 'icon-calendar', 'icon-calendar', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(22, 'icon-calendar-empty', 'icon-calendar-empty', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(23, 'icon-camera', 'icon-camera', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(24, 'icon-camera-retro', 'icon-camera-retro', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(25, 'icon-certificate', 'icon-certificate', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(26, 'icon-check', 'icon-check', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(27, 'icon-check-empty', 'icon-check-empty', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(28, 'icon-check-minus', 'icon-check-minus', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(29, 'icon-check-sign', 'icon-check-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(30, 'icon-circle', 'icon-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(31, 'icon-circle-blank', 'icon-circle-blank', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(32, 'icon-cloud', 'icon-cloud', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(33, 'icon-cloud-download', 'icon-cloud-download', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(34, 'icon-cloud-upload', 'icon-cloud-upload', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(35, 'icon-code', 'icon-code', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(36, 'icon-code-fork', 'icon-code-fork', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(37, 'icon-coffee', 'icon-coffee', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(38, 'icon-cog', 'icon-cog', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(39, 'icon-cogs', 'icon-cogs', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(40, 'icon-collapse', 'icon-collapse', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(41, 'icon-collapse-alt', 'icon-collapse-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(42, 'icon-collapse-top', 'icon-collapse-top', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(43, 'icon-comment', 'icon-comment', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(44, 'icon-comment-alt', 'icon-comment-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(45, 'icon-comments', 'icon-comments', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(46, 'icon-comments-alt', 'icon-comments-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(47, 'icon-compass', 'icon-compass', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(48, 'icon-credit-card', 'icon-credit-card', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(49, 'icon-crop', 'icon-crop', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(50, 'icon-dashboard', 'icon-dashboard', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(51, 'icon-desktop', 'icon-desktop', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(52, 'icon-download', 'icon-download', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(53, 'icon-download-alt', 'icon-download-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(54, 'icon-edit', 'icon-edit', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(55, 'icon-edit-sign', 'icon-edit-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(56, 'icon-ellipsis-horizontal', 'icon-ellipsis-horizontal', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(57, 'icon-ellipsis-vertical', 'icon-ellipsis-vertical', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(58, 'icon-envelope', 'icon-envelope', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(59, 'icon-envelope-alt', 'icon-envelope-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(60, 'icon-eraser', 'icon-eraser', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(61, 'icon-exchange', 'icon-exchange', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(62, 'icon-exclamation', 'icon-exclamation', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(63, 'icon-exclamation-sign', 'icon-exclamation-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(64, 'icon-expand', 'icon-expand', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(65, 'icon-expand-alt', 'icon-expand-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(66, 'icon-external-link', 'icon-external-link', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(67, 'icon-external-link-sign', 'icon-external-link-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(68, 'icon-eye-close', 'icon-eye-close', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(69, 'icon-eye-open', 'icon-eye-open', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(70, 'icon-facetime-video', 'icon-facetime-video', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(71, 'icon-female', 'icon-female', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(72, 'icon-fighter-jet', 'icon-fighter-jet', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(73, 'icon-film', 'icon-film', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(74, 'icon-filter', 'icon-filter', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(75, 'icon-fire', 'icon-fire', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(76, 'icon-fire-extinguisher', 'icon-fire-extinguisher', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(77, 'icon-flag', 'icon-flag', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(78, 'icon-flag-alt', 'icon-flag-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(79, 'icon-flag-checkered', 'icon-flag-checkered', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(80, 'icon-folder-close', 'icon-folder-close', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(81, 'icon-folder-close-alt', 'icon-folder-close-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(82, 'icon-folder-open', 'icon-folder-open', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(83, 'icon-folder-open-alt', 'icon-folder-open-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(84, 'icon-food', 'icon-food', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(85, 'icon-frown', 'icon-frown', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(86, 'icon-gamepad', 'icon-gamepad', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(87, 'icon-gift', 'icon-gift', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(88, 'icon-glass', 'icon-glass', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(89, 'icon-globe', 'icon-globe', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(90, 'icon-group', 'icon-group', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(91, 'icon-hdd', 'icon-hdd', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(92, 'icon-headphones', 'icon-headphones', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(93, 'icon-heart', 'icon-heart', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(94, 'icon-heart-empty', 'icon-heart-empty', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(95, 'icon-home', 'icon-home', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(96, 'icon-inbox', 'icon-inbox', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(97, 'icon-info', 'icon-info', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(98, 'icon-info-sign', 'icon-info-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(99, 'icon-key', 'icon-key', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(100, 'icon-keyboard', 'icon-keyboard', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(101, 'icon-laptop', 'icon-laptop', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(102, 'icon-leaf', 'icon-leaf', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(103, 'icon-legal', 'icon-legal', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(104, 'icon-lemon', 'icon-lemon', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(105, 'icon-level-down', 'icon-level-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(106, 'icon-level-up', 'icon-level-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(107, 'icon-lightbulb', 'icon-lightbulb', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(108, 'icon-location-arrow', 'icon-location-arrow', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(109, 'icon-lock', 'icon-lock', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(110, 'icon-magic', 'icon-magic', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(111, 'icon-magnet', 'icon-magnet', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(112, 'icon-mail-forward', 'icon-mail-forward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(113, 'icon-mail-reply', 'icon-mail-reply', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(114, 'icon-mail-reply-all', 'icon-mail-reply-all', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(115, 'icon-male', 'icon-male', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(116, 'icon-map-marker', 'icon-map-marker', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(117, 'icon-meh', 'icon-meh', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(118, 'icon-microphone', 'icon-microphone', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(119, 'icon-microphone-off', 'icon-microphone-off', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(120, 'icon-minus', 'icon-minus', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(121, 'icon-minus-sign', 'icon-minus-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(122, 'icon-minus-sign-alt', 'icon-minus-sign-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(123, 'icon-mobile-phone', 'icon-mobile-phone', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(124, 'icon-money', 'icon-money', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(125, 'icon-moon', 'icon-moon', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(126, 'icon-move', 'icon-move', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(127, 'icon-music', 'icon-music', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(128, 'icon-off', 'icon-off', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(129, 'icon-ok', 'icon-ok', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(130, 'icon-ok-circle', 'icon-ok-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(131, 'icon-ok-sign', 'icon-ok-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(132, 'icon-pencil', 'icon-pencil', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(133, 'icon-phone', 'icon-phone', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(134, 'icon-phone-sign', 'icon-phone-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(135, 'icon-picture', 'icon-picture', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(136, 'icon-plane', 'icon-plane', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(137, 'icon-plus', 'icon-plus', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(138, 'icon-plus-sign', 'icon-plus-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(139, 'icon-plus-sign-alt', 'icon-plus-sign-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(140, 'icon-power-off', 'icon-power-off', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(141, 'icon-print', 'icon-print', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(142, 'icon-pushpin', 'icon-pushpin', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(143, 'icon-puzzle-piece', 'icon-puzzle-piece', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(144, 'icon-qrcode', 'icon-qrcode', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(145, 'icon-question', 'icon-question', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(146, 'icon-question-sign', 'icon-question-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(147, 'icon-quote-left', 'icon-quote-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(148, 'icon-quote-right', 'icon-quote-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(149, 'icon-random', 'icon-random', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(150, 'icon-refresh', 'icon-refresh', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(151, 'icon-remove', 'icon-remove', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(152, 'icon-remove-circle', 'icon-remove-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(153, 'icon-remove-sign', 'icon-remove-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(154, 'icon-reorder', 'icon-reorder', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(155, 'icon-reply', 'icon-reply', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(156, 'icon-reply-all', 'icon-reply-all', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(157, 'icon-resize-horizontal', 'icon-resize-horizontal', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(158, 'icon-resize-vertical', 'icon-resize-vertical', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(159, 'icon-retweet', 'icon-retweet', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(160, 'icon-road', 'icon-road', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(161, 'icon-rocket', 'icon-rocket', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(162, 'icon-rss', 'icon-rss', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(163, 'icon-rss-sign', 'icon-rss-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(164, 'icon-screenshot', 'icon-screenshot', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(165, 'icon-search', 'icon-search', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(166, 'icon-share', 'icon-share', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(167, 'icon-share-alt', 'icon-share-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(168, 'icon-share-sign', 'icon-share-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(169, 'icon-shield', 'icon-shield', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(170, 'icon-shopping-cart', 'icon-shopping-cart', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(171, 'icon-sign-blank', 'icon-sign-blank', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(172, 'icon-signal', 'icon-signal', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(173, 'icon-signin', 'icon-signin', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(174, 'icon-signout', 'icon-signout', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(175, 'icon-sitemap', 'icon-sitemap', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(176, 'icon-smile', 'icon-smile', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(177, 'icon-sort', 'icon-sort', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(178, 'icon-sort-by-alphabet', 'icon-sort-by-alphabet', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(179, 'icon-sort-by-alphabet-alt', 'icon-sort-by-alphabet-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(180, 'icon-sort-by-attributes', 'icon-sort-by-attributes', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(181, 'icon-sort-by-attributes-alt', 'icon-sort-by-attributes-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(182, 'icon-sort-by-order', 'icon-sort-by-order', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(183, 'icon-sort-by-order-alt', 'icon-sort-by-order-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(184, 'icon-sort-down', 'icon-sort-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(185, 'icon-sort-up', 'icon-sort-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(186, 'icon-spinner', 'icon-spinner', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(187, 'icon-star', 'icon-star', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(188, 'icon-star-empty', 'icon-star-empty', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(189, 'icon-star-half', 'icon-star-half', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(190, 'icon-star-half-empty', 'icon-star-half-empty', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(191, 'icon-star-half-full', 'icon-star-half-full', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(192, 'icon-subscript', 'icon-subscript', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(193, 'icon-suitcase', 'icon-suitcase', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(194, 'icon-sun', 'icon-sun', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(195, 'icon-superscript', 'icon-superscript', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(196, 'icon-tablet', 'icon-tablet', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(197, 'icon-tag', 'icon-tag', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(198, 'icon-tags', 'icon-tags', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(199, 'icon-tasks', 'icon-tasks', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(200, 'icon-terminal', 'icon-terminal', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(201, 'icon-thumbs-down', 'icon-thumbs-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(202, 'icon-thumbs-down-alt', 'icon-thumbs-down-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(203, 'icon-thumbs-up', 'icon-thumbs-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(204, 'icon-thumbs-up-alt', 'icon-thumbs-up-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(205, 'icon-ticket', 'icon-ticket', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(206, 'icon-time', 'icon-time', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(207, 'icon-tint', 'icon-tint', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(208, 'icon-trash', 'icon-trash', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(209, 'icon-trophy', 'icon-trophy', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(210, 'icon-truck', 'icon-truck', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(211, 'icon-umbrella', 'icon-umbrella', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(212, 'icon-unchecked', 'icon-unchecked', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(213, 'icon-unlock', 'icon-unlock', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(214, 'icon-unlock-alt', 'icon-unlock-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(215, 'icon-upload', 'icon-upload', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(216, 'icon-upload-alt', 'icon-upload-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(217, 'icon-user', 'icon-user', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(218, 'icon-volume-down', 'icon-volume-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(219, 'icon-volume-off', 'icon-volume-off', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(220, 'icon-volume-up', 'icon-volume-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(221, 'icon-warning-sign', 'icon-warning-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(222, 'icon-wrench', 'icon-wrench', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(223, 'icon-zoom-in', 'icon-zoom-in', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(224, 'icon-zoom-out', 'icon-zoom-out', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(225, 'icon-bitcoin', 'icon-bitcoin', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(226, 'icon-btc', 'icon-btc', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(227, 'icon-cny', 'icon-cny', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(228, 'icon-dollar', 'icon-dollar', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(229, 'icon-eur', 'icon-eur', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(230, 'icon-euro', 'icon-euro', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(231, 'icon-gbp', 'icon-gbp', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(232, 'icon-inr', 'icon-inr', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(233, 'icon-jpy', 'icon-jpy', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(234, 'icon-krw', 'icon-krw', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(235, 'icon-renminbi', 'icon-renminbi', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(236, 'icon-rupee', 'icon-rupee', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(237, 'icon-usd', 'icon-usd', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(238, 'icon-won', 'icon-won', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(239, 'icon-yen', 'icon-yen', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(240, 'icon-align-center', 'icon-align-center', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(241, 'icon-align-justify', 'icon-align-justify', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(242, 'icon-align-left', 'icon-align-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(243, 'icon-align-right', 'icon-align-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(244, 'icon-bold', 'icon-bold', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(245, 'icon-columns', 'icon-columns', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(246, 'icon-copy', 'icon-copy', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(247, 'icon-cut', 'icon-cut', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(249, 'icon-file', 'icon-file', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(250, 'icon-file-alt', 'icon-file-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(251, 'icon-file-text', 'icon-file-text', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(252, 'icon-file-text-alt', 'icon-file-text-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(253, 'icon-font', 'icon-font', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(254, 'icon-indent-left', 'icon-indent-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(255, 'icon-indent-right', 'icon-indent-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(256, 'icon-italic', 'icon-italic', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(257, 'icon-link', 'icon-link', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(258, 'icon-list', 'icon-list', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(259, 'icon-list-alt', 'icon-list-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(260, 'icon-list-ol', 'icon-list-ol', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(261, 'icon-list-ul', 'icon-list-ul', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(262, 'icon-paper-clip', 'icon-paper-clip', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(263, 'icon-paperclip', 'icon-paperclip', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(264, 'icon-paste', 'icon-paste', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(265, 'icon-repeat', 'icon-repeat', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(266, 'icon-rotate-left', 'icon-rotate-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(267, 'icon-rotate-right', 'icon-rotate-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(268, 'icon-save', 'icon-save', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(269, 'icon-strikethrough', 'icon-strikethrough', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(270, 'icon-table', 'icon-table', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(271, 'icon-text-height', 'icon-text-height', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(272, 'icon-text-width', 'icon-text-width', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(273, 'icon-th', 'icon-th', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(274, 'icon-th-large', 'icon-th-large', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(275, 'icon-th-list', 'icon-th-list', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(276, 'icon-underline', 'icon-underline', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(277, 'icon-undo', 'icon-undo', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(278, 'icon-unlink', 'icon-unlink', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(279, 'icon-angle-down', 'icon-angle-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(280, 'icon-angle-left', 'icon-angle-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(281, 'icon-angle-right', 'icon-angle-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(282, 'icon-angle-up', 'icon-angle-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(283, 'icon-arrow-down', 'icon-arrow-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(284, 'icon-arrow-left', 'icon-arrow-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(285, 'icon-arrow-right', 'icon-arrow-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(286, 'icon-arrow-up', 'icon-arrow-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(287, 'icon-caret-down', 'icon-caret-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(288, 'icon-caret-left', 'icon-caret-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(289, 'icon-caret-right', 'icon-caret-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(290, 'icon-caret-up', 'icon-caret-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(291, 'icon-chevron-down', 'icon-chevron-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(292, 'icon-chevron-left', 'icon-chevron-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(293, 'icon-chevron-right', 'icon-chevron-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(294, 'icon-chevron-sign-down', 'icon-chevron-sign-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(295, 'icon-chevron-sign-left', 'icon-chevron-sign-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(296, 'icon-chevron-sign-right', 'icon-chevron-sign-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(297, 'icon-chevron-sign-up', 'icon-chevron-sign-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(298, 'icon-chevron-up', 'icon-chevron-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(299, 'icon-circle-arrow-down', 'icon-circle-arrow-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(300, 'icon-circle-arrow-left', 'icon-circle-arrow-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(301, 'icon-circle-arrow-right', 'icon-circle-arrow-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(302, 'icon-circle-arrow-up', 'icon-circle-arrow-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(303, 'icon-double-angle-down', 'icon-double-angle-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(304, 'icon-double-angle-left', 'icon-double-angle-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(305, 'icon-double-angle-right', 'icon-double-angle-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(306, 'icon-double-angle-up', 'icon-double-angle-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(307, 'icon-hand-down', 'icon-hand-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(308, 'icon-hand-left', 'icon-hand-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(309, 'icon-hand-right', 'icon-hand-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(310, 'icon-hand-up', 'icon-hand-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(311, 'icon-long-arrow-down', 'icon-long-arrow-down', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(312, 'icon-long-arrow-left', 'icon-long-arrow-left', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(313, 'icon-long-arrow-right', 'icon-long-arrow-right', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(314, 'icon-long-arrow-up', 'icon-long-arrow-up', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(315, 'icon-backward', 'icon-backward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(316, 'icon-eject', 'icon-eject', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(317, 'icon-fast-backward', 'icon-fast-backward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(318, 'icon-fast-forward', 'icon-fast-forward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(319, 'icon-forward', 'icon-forward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(320, 'icon-fullscreen', 'icon-fullscreen', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(321, 'icon-pause', 'icon-pause', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(322, 'icon-play', 'icon-play', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(323, 'icon-play-circle', 'icon-play-circle', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(324, 'icon-play-sign', 'icon-play-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(325, 'icon-resize-full', 'icon-resize-full', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(326, 'icon-resize-small', 'icon-resize-small', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(327, 'icon-step-backward', 'icon-step-backward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(328, 'icon-step-forward', 'icon-step-forward', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(329, 'icon-stop', 'icon-stop', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(330, 'icon-youtube-play', 'icon-youtube-play', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(331, 'icon-adn', 'icon-adn', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(332, 'icon-android', 'icon-android', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(333, 'icon-apple', 'icon-apple', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(334, 'icon-bitbucket', 'icon-bitbucket', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(335, 'icon-bitbucket-sign', 'icon-bitbucket-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(338, 'icon-css3', 'icon-css3', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(339, 'icon-dribble', 'icon-dribble', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(340, 'icon-dropbox', 'icon-dropbox', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(341, 'icon-facebook', 'icon-facebook', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(342, 'icon-facebook-sign', 'icon-facebook-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(343, 'icon-flickr', 'icon-flickr', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(344, 'icon-foursquare', 'icon-foursquare', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(345, 'icon-github', 'icon-github', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(346, 'icon-github-alt', 'icon-github-alt', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(347, 'icon-github-sign', 'icon-github-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(348, 'icon-gittip', 'icon-gittip', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(349, 'icon-google-plus', 'icon-google-plus', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(350, 'icon-google-plus-sign', 'icon-google-plus-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(351, 'icon-html5', 'icon-html5', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(352, 'icon-instagram', 'icon-instagram', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(353, 'icon-linkedin', 'icon-linkedin', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(354, 'icon-linkedin-sign', 'icon-linkedin-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(355, 'icon-linux', 'icon-linux', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(356, 'icon-maxcdn', 'icon-maxcdn', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(357, 'icon-pinterest', 'icon-pinterest', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(358, 'icon-pinterest-sign', 'icon-pinterest-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(359, 'icon-renren', 'icon-renren', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(360, 'icon-skype', 'icon-skype', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(361, 'icon-stackexchange', 'icon-stackexchange', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(362, 'icon-trello', 'icon-trello', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(363, 'icon-tumblr', 'icon-tumblr', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(364, 'icon-tumblr-sign', 'icon-tumblr-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(365, 'icon-twitter', 'icon-twitter', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(366, 'icon-twitter-sign', 'icon-twitter-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(367, 'icon-vk', 'icon-vk', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(368, 'icon-weibo', 'icon-weibo', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(369, 'icon-windows', 'icon-windows', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(370, 'icon-xing', 'icon-xing', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(371, 'icon-xing-sign', 'icon-xing-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(372, 'icon-youtube', 'icon-youtube', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(374, 'icon-youtube-sign', 'icon-youtube-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(375, 'icon-ambulance', 'icon-ambulance', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(376, 'icon-h-sign', 'icon-h-sign', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(377, 'icon-hospital', 'icon-hospital', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(378, 'icon-medkit', 'icon-medkit', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(380, 'icon-stethoscope', 'icon-stethoscope', 'css_class');
insert into `maintain_icon` (`id`, `identity`, `css_class`, `type`) values(381, 'icon-user-md', 'icon-user-md', 'css_class');



insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1001, 'ztree_root_close', 'static/comp/zTree/css/zTreeStyle/img/diy/1_close.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1002, 'ztree_root_open', 'static/comp/zTree/css/zTreeStyle/img/diy/1_open.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1003, 'ztree_edit', 'static/comp/zTree/css/zTreeStyle/img/diy/2.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1004, 'ztree_star', 'static/comp/zTree/css/zTreeStyle/img/diy/3.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1005, 'ztree_calendar', 'static/comp/zTree/css/zTreeStyle/img/diy/4.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1006, 'ztree_heart', 'static/comp/zTree/css/zTreeStyle/img/diy/5.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1007, 'ztree_save', 'static/comp/zTree/css/zTreeStyle/img/diy/6.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1008, 'ztree_msg', 'static/comp/zTree/css/zTreeStyle/img/diy/7.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1009, 'ztree_report', 'static/comp/zTree/css/zTreeStyle/img/diy/8.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1010, 'ztree_setting', 'static/comp/zTree/css/zTreeStyle/img/diy/9.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1011, 'ztree_file', 'static/comp/zTree/css/zTreeStyle/img/diy/file.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1012, 'ztree_folder', 'static/comp/zTree/css/zTreeStyle/img/diy/folder.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1013, 'ztree_branch', 'static/comp/zTree/css/zTreeStyle/img/diy/branch.png', 'upload_file', 16, 16);
insert into `maintain_icon` (`id`, `identity`, `img_src`, `type`, `width`, `height`) values(1014, 'ztree_leaf', 'static/comp/zTree/css/zTreeStyle/img/diy/leaf.png', 'upload_file', 16, 16);



insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1500, 'ztree_folder_open', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 110, 0);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1501, 'ztree_folder_close', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 110, 17 );
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1502, 'ztree_file2', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 110, 32);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1503, 'ztree_edit2', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 110, 48);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1504, 'ztree_delete', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 110, 64);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1505, 'ztree_arrow', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 110, 80);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1506, 'ztree_plus', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 13, 13, 79, 75);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1507, 'ztree_minus', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 13, 13, 98, 75);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1508, 'ztree_add', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 144, 0);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1509, 'ztree_cicle_arrow_left1', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 144, 15);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1510, 'ztree_cicle_arrow_right1', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 144, 32);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1511, 'ztree_cicle_arrow_left2', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 144, 48);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1512, 'ztree_cicle_arrow_right2', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 144, 64);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1513, 'ztree_cicle_arrow', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 127, 48);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1514, 'ztree_star_light', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 127, 64);
insert into `maintain_icon` (`id`, `identity`, `sprite_src`, `type`, `width`, `height`, `left`, `top`)
  values(1515, 'ztree_star_dark', 'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png', 'css_sprite', 16, 16, 127, 80);