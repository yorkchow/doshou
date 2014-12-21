SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- DROP DATABASE IF EXISTS `doshou_db`;

CREATE DATABASE IF NOT EXISTS `doshou_db`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `doshou_db`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

-- -----------------------------
-- Table structure for sys_user
-- -----------------------------
DROP TABLE IF EXISTS `sys_user`;
create table `sys_user`(
  `id`                  bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username`            varchar(100) NOT NULL DEFAULT '',
  `email`               varchar(100) NOT NULL DEFAULT '',
  `mobile_phone_number` varchar(20) NOT NULL DEFAULT '',
  `password`            varchar(100) NOT NULL DEFAULT '',
  `salt`                varchar(10) NOT NULL DEFAULT '',
  `create_date`         timestamp NOT NULL DEFAULT 0,
  `status`              enum('normal','blocked') NOT NULL DEFAULT 'normal',
  `deleted`             tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `admin`               tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_sys_user_username_email` (`username`,`email`),
  INDEX `idx_sys_user_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- Table structure for sys_user_status_history
-- -------------------------------------------
DROP TABLE IF EXISTS `sys_user_status_history`;
create table `sys_user_status_history`(
  `id`         bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id`    bigint UNSIGNED NOT NULL DEFAULT 0,
  `status`     enum('normal','blocked') NOT NULL DEFAULT 'normal',
  `reason`     varchar(200) NOT NULL DEFAULT '',
  `op_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `op_date`    timestamp NOT NULL default 0 ,
  PRIMARY KEY (`id`),
  INDEX `idx_sys_user_block_history_user_id_block_date` (`user_id`,`op_date`),
  INDEX `idx_sys_user_block_history_op_user_id_op_date` (`op_user_id`, `op_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ------------------------------------
-- Table structure for sys_user_online
-- ------------------------------------
DROP TABLE IF EXISTS `sys_user_online`;
create table `sys_user_online`(
  `id`                varchar(100) not null,
  `user_id`           bigint default 0,
  `username`          varchar(100),
  `host`              varchar(100),
  `system_host`       varchar(100),
  `user_agent`        varchar(200),
  `status`            varchar(50),
  `start_timestsamp`  timestamp default 0 ,
  `last_access_time`  timestamp default 0 ,
  `timeout`           bigint,
  `session`           mediumtext,
  primary key(`id`),
  INDEX `idx_sys_user_online_sys_user_id` (`user_id`),
  INDEX `idx_sys_user_online_username` (`username`),
  INDEX `idx_sys_user_online_host` (`host`),
  INDEX `idx_sys_user_online_system_host` (`system_host`),
  INDEX `idx_sys_user_online_start_timestsamp` (`start_timestsamp`),
  INDEX `idx_sys_user_online_last_access_time` (`last_access_time`),
  INDEX `idx_sys_user_online_user_agent` (`user_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------------------
-- Table structure for sys_user_last_online
-- ----------------------------------------
DROP TABLE IF EXISTS `sys_user_last_online`;
create table `sys_user_last_online`(
  `id`                    bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id`               bigint UNSIGNED NOT NULL DEFAULT 0,
  `username`              varchar(100) NOT NULL DEFAULT '',
  `uid`                   varchar(100) NOT NULL DEFAULT '',
  `host`                  varchar(100) NOT NULL DEFAULT '',
  `user_agent`            varchar(200) NOT NULL DEFAULT '',
  `system_host`           varchar(100) NOT NULL DEFAULT '',
  `last_login_timestamp`  timestamp NOT NULL DEFAULT 0,
  `last_stop_timestamp`   timestamp NOT NULL DEFAULT 0,
  `login_count`           bigint NOT NULL DEFAULT 0,
  `total_online_time`     bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_sys_user_last_online_sys_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ------------------------------------
-- Table structure for sys_organization
-- ------------------------------------
DROP TABLE IF EXISTS `sys_organization`;
create table `sys_organization`(
  `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        varchar(100) NOT NULL DEFAULT '',
  `type`        enum('bloc','branch_office','department','group') NOT NULL DEFAULT 'group',
  `parent_id`   int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_ids`  varchar(200) NOT NULL DEFAULT '',
  `icon`        varchar(200) NOT NULL DEFAULT '',
  `weight`      int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_show`     tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `idx_sys_organization_name` (`name`),
  INDEX `idx_sys_organization_type` (`type`),
  INDEX `idx_sys_organization_parent_id` (`parent_id`),
  INDEX `idx_sys_organization_parent_ids_weight` (`parent_ids`, `weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------
-- Table structure for sys_job
-- ---------------------------
DROP TABLE IF EXISTS `sys_job`;
create table `sys_job`(
  `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        varchar(100) NOT NULL DEFAULT '',
  `parent_id`   bigint UNSIGNED NOT NULL DEFAULT 0,
  `parent_ids`  varchar(200) NOT NULL DEFAULT '',
  `icon`        varchar(200) NOT NULL DEFAULT '',
  `weight`      int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_show`     tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `idx_sys_job_nam` (`name`),
  INDEX `idx_sys_job_parent_id` (`parent_id`),
  INDEX `idx_sys_job_parent_ids_weight` (`parent_ids`, `weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------
-- Table structure for sys_user_organization_job
-- ---------------------------------------------
DROP TABLE IF EXISTS `sys_user_organization_job`;
create table `sys_user_organization_job`(
  `id`              bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id`         bigint UNSIGNED NOT NULL DEFAULT 0,
  `organization_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `job_id`          bigint UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_sys_user_organization_job` (`user_id`, `organization_id`, `job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------
-- Table structure for sys_resource
-- --------------------------------
DROP TABLE IF EXISTS `sys_resource`;
create table `sys_resource`(
  `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        varchar(100) NOT NULL DEFAULT '',
  `identity`    varchar(100) NOT NULL DEFAULT '',
  `url`         varchar(200) NOT NULL DEFAULT '',
  `parent_id`   bigint UNSIGNED NOT NULL DEFAULT 0,
  `parent_ids`  varchar(200) NOT NULL DEFAULT '',
  `icon`        varchar(200) NOT NULL DEFAULT '',
  `weight`      int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_show`     tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `idx_sys_resource_name` (`name`),
  INDEX `idx_sys_resource_identity` (`identity`),
  INDEX `idx_sys_resource_parent_id` (`parent_id`),
  INDEX `idx_sys_resource_parent_ids_weight` (`parent_ids`, `weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------------
-- Table structure for sys_permission
-- ----------------------------------
DROP TABLE IF EXISTS `sys_permission`;
create table `sys_permission`(
  `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        varchar(100) NOT NULL DEFAULT '',
  `permission`  varchar(100) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `is_show`     tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX idx_sys_permission_name (`name`),
  INDEX idx_sys_permission_permission (`permission`),
  INDEX idx_sys_permission_show (`is_show`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
create table `sys_role`(
  `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        varchar(100) NOT NULL DEFAULT '',
  `role`        varchar(100) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `is_show`     tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `idx_sys_role_name` (`name`),
  INDEX `idx_sys_role_role` (`role`),
  INDEX `idx_sys_role_show` (`is_show`)
) charset=utf8 ENGINE=InnoDB;

-- ------------------------------------------------
-- Table structure for sys_role_resource_permission
-- ------------------------------------------------
DROP TABLE IF EXISTS `sys_role_resource_permission`;
create table `sys_role_resource_permission`(
  `id`              bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id`         bigint UNSIGNED NOT NULL DEFAULT 0,
  `resource_id`     bigint UNSIGNED NOT NULL DEFAULT 0,
  `permission_ids`  varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_sys_role_resource_permission` (`role_id`, `resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -----------------------------
-- Table structure for sys_group
-- -----------------------------
DROP TABLE IF EXISTS `sys_group`;
create table `sys_group`(
  `id`            bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`          varchar(100) NOT NULL DEFAULT '',
  `type`          varchar(50) NOT NULL DEFAULT '',
  `is_show`       tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `default_group` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `idx_sys_group_type` (`type`),
  INDEX `idx_sys_group_show` (`is_show`),
  INDEX `idx_sys_group_default_group` (`default_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------
-- Table structure for sys_group_relation
-- --------------------------------------
DROP TABLE IF EXISTS `sys_group_relation`;
create table `sys_group_relation`(
  `id`              bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id`        bigint UNSIGNED NOT NULL DEFAULT 0,
  `organization_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `user_id`         bigint UNSIGNED NOT NULL DEFAULT 0,
  `start_user_id`   bigint UNSIGNED NOT NULL DEFAULT 0,
  `end_user_id`     bigint UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `idx_sys_group_relation_group` (`group_id`),
  INDEX `idx_sys_group_relation_organization` (`organization_id`),
  INDEX `idx_sys_group_relation_user` (`user_id`),
  INDEX `idx_sys_group_relation_start_user_id` (`start_user_id`),
  INDEX `idx_sys_group_relation_end_user_id` (`end_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for sys_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth`;
create table `sys_auth`(
  `id`              bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `job_id`          bigint UNSIGNED NOT NULL DEFAULT 0,
  `user_id`         bigint UNSIGNED NOT NULL DEFAULT 0,
  `group_id`        bigint UNSIGNED NOT NULL DEFAULT 0,
  `role_ids`        varchar(500) NOT NULL DEFAULT '',
  `type`            enum('user','user_group','organization_job','organization_group') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  INDEX `idx_sys_auth_organization` (`organization_id`),
  INDEX `idx_sys_auth_job` (`job_id`),
  INDEX `idx_sys_auth_user` (`user_id`),
  INDEX `idx_sys_auth_group` (`group_id`),
  INDEX `idx_sys_auth_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ------------------------------------
-- Table structure for personal_message
-- ------------------------------------
DROP TABLE IF EXISTS `personal_message`;
create table `personal_message`(
  `id`                          bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sender_id`                   bigint UNSIGNED NOT NULL DEFAULT 0,
  `receiver_id`                 bigint UNSIGNED NOT NULL DEFAULT 0,
  `send_date`                   timestamp default 0,
  `title`                       varchar(200) NOT NULL DEFAULT '',
  `sender_state`                varchar(20) NOT NULL DEFAULT '',
  `sender_state_change_date`    timestamp  default 0,
  `receiver_state`              varchar(20) NOT NULL DEFAULT '',
  `receiver_state_change_date`  timestamp  default 0,
  `type`                        varchar(20) NOT NULL DEFAULT '',
  `is_read`                     tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_replied`                  tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id`                   bigint UNSIGNED NOT NULL DEFAULT 0,
  `parent_ids`                  varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  INDEX `idx_personal_message_sender_id_sender_state` (`sender_id`, `sender_state`),
  INDEX `idx_personal_message_receiver_id_receiver_state` (`receiver_id`, `receiver_state`,`is_read`),
  INDEX `idx_personal_sender_state_change_date` (`sender_state_change_date`),
  INDEX `idx_personal_receiver_state_change_date` (`receiver_state_change_date`),
  INDEX `idx_personal_parent_id` (`parent_id`),
  INDEX `idx_personal_parent_ids` (`parent_ids`),
  INDEX `idx_personal_message_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------
-- Table structure for personal_message_content
-- --------------------------------------------
DROP TABLE IF EXISTS `personal_message_content`;
create table `personal_message_content`(
  `id`               bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `message_id`       bigint UNSIGNED NOT NULL DEFAULT 0,
  `content`          longtext,
  PRIMARY KEY (`id`),
  INDEX `idx_personal_message_content_message_id` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------
-- Table structure for personal_calendar
-- -------------------------------------
DROP TABLE IF EXISTS `personal_calendar`;
create table `personal_calendar`(
  `id`                bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id`           bigint UNSIGNED NOT NULL DEFAULT 0,
  `title`             varchar(500) NOT NULL DEFAULT '',
  `details`           varchar(1000) NOT NULL DEFAULT '',
  `start_date`        date,
  `length`            int UNSIGNED NOT NULL DEFAULT 0,
  `start_time`        time,
  `end_time`          time,
  `background_color`  varchar(100) NOT NULL DEFAULT '',
  `text_color`        varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  INDEX `office_calendar_user_id_start_date` (user_id, start_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------
-- Table structure for maintain_icon
-- ---------------------------------
DROP TABLE IF EXISTS `maintain_icon`;
create table `maintain_icon`(
  `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `identity`    varchar(100) NOT NULL DEFAULT '',
  `css_class`   varchar(100) NOT NULL DEFAULT '',
  `img_src`     varchar(200) NOT NULL DEFAULT '',
  `width`       smallint UNSIGNED NOT NULL DEFAULT 0,
  `height`      smallint UNSIGNED NOT NULL DEFAULT 0,
  `sprite_src`  varchar(200) NOT NULL DEFAULT '',
  `left`        smallint NOT NULL DEFAULT 0,
  `top`         smallint NOT NULL DEFAULT 0,
  `style`       varchar(100) NOT NULL DEFAULT '',
  `type`        varchar(30) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_maintain_icon_identity` (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------
-- Table structure for maintain_map
-- ---------------------------------
DROP TABLE IF EXISTS `maintain_map`;
create table `maintain_map`(
  `id`        bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `map_key`   varchar(200) NOT NULL DEFAULT '',
  `map_value` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_maintain_map_key` (`map_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------
-- Table structure for maintain_notification_template
-- --------------------------------------------------
DROP TABLE IF EXISTS `maintain_notification_template`;
create table `maintain_notification_template`(
  `id`        bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`      varchar(200) NOT NULL DEFAULT '',
  `system`    varchar(50) NOT NULL DEFAULT '',
  `title`     varchar(600) NOT NULL DEFAULT '',
  `template`  varchar(2000) NOT NULL DEFAULT '',
  `deleted`   tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_maintain_notification_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------------------------
-- Table structure for maintain_notification_data
-- ----------------------------------------------
DROP TABLE IF EXISTS `maintain_notification_data`;
create table `maintain_notification_data`(
  `id`      bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `system`  varchar(50) NOT NULL DEFAULT '',
  `title`   varchar(600) NOT NULL DEFAULT '',
  `content` varchar(2000) NOT NULL DEFAULT '',
  `date`    timestamp default 0,
  `is_read` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `idx_maintain_notification_data_user_id_read` (`user_id`, `is_read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------
-- Table structure for maintain_task_definition
-- --------------------------------------------
DROP TABLE IF EXISTS `maintain_task_definition`;
create table `maintain_task_definition`(
  `id`              bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`            varchar(500) NOT NULL DEFAULT '',
  `cron`            varchar(200) NOT NULL DEFAULT '',
  `bean_class`      varchar(200) NOT NULL DEFAULT '',
  `bean_name`       varchar(200) NOT NULL DEFAULT '',
  `method_name`     varchar(200) NOT NULL DEFAULT '',
  `is_start`        tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `description`     varchar(2000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;