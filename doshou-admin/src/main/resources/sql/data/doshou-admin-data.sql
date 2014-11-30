truncate table `sys_user`;
/*默认admin/123456*/
insert into `sys_user`
(`id`,`username`,`email`,`mobile`,`password`,`salt`,`create_date`,`status`,,`deleted`,`admin`)
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
(16, 7, 27, '5'),
(17, 9, 27, '1');

truncate table `sys_auth`;
insert into sys_auth (`id`, `organization_id`, `job_id`, `user_id`, `group_id`, `role_ids`, `type`)
values(1, 0, 0, 1, 0, '1', 'user');