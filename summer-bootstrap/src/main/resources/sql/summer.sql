CREATE DATABASE IF NOT EXISTS `summer` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `summer`;

DROP TABLE IF EXISTS `sm_system_role_permission`;
DROP TABLE IF EXISTS `sm_system_permission`;
DROP TABLE IF EXISTS `sm_system_role`;
DROP TABLE IF EXISTS `sm_system_user`;
DROP TABLE IF EXISTS `sm_system_position`;
DROP TABLE IF EXISTS `sm_system_department`;
DROP TABLE IF EXISTS `sm_system_user_position`;
DROP TABLE IF EXISTS `sm_system_user_role`;

CREATE TABLE `sm_system_department` (
  `id` varchar(64) NOT NULL,
  `pid` varchar(64) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `is_root` tinyint(1) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sm_system_position` (
  `id` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sm_system_user` (
  `id` varchar(64) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `account` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `enable` tinyint(1) DEFAULT 1,
  `department_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_dept` (`department_id`),
  KEY `idx_user_account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sm_system_user_position` (
  `user_id` varchar(64) NOT NULL,
  `position_id` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`,`position_id`),
  KEY `idx_up_pos` (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sm_system_user_role` (
  `user_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `idx_ur_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sm_system_role` (
  `id` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `permission_scope` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sm_system_permission` (
  `id` varchar(64) NOT NULL,
  `code` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pid` varchar(64) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_perm_pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sm_system_role_permission` (
  `role_id` varchar(64) NOT NULL,
  `permission_id` varchar(64) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `idx_rp_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sm_system_department` (`id`,`pid`,`name`,`icon`,`is_root`,`code`,`sort`) VALUES
('dept_root',NULL,'System','settings',1,'SYS',1);

INSERT INTO `sm_system_position` (`id`,`name`,`code`,`type`,`description`,`sort`,`enabled`) VALUES
('pos_admin','Administrator','ADMIN',1,'System administrator',1,1),
('pos_user','User','USER',2,'Standard user',2,1);

INSERT INTO `sm_system_user` (`id`,`first_name`,`last_name`,`account`,`password`,`email`,`phone`,`gender`,`avatar`,`description`,`deleted`,`enable`,`department_id`) VALUES
('u_admin','Admin','','admin','$2a$12$W8rD3AaAeKnrAH5Jii/BV.HVrE1.5tluTxrtCMxGp6Mu120lZwWti','admin@example.com','',1,'','Super administrator',0,1,'dept_root'),
('u_user','User','','user','$2a$12$W8rD3AaAeKnrAH5Jii/BV.HVrE1.5tluTxrtCMxGp6Mu120lZwWti','user@example.com','',1,'','Standard user',0,1,'dept_root'),
('u_vben','Vben','','vben','$2a$12$W8rD3AaAeKnrAH5Jii/BV.HVrE1.5tluTxrtCMxGp6Mu120lZwWti','user@example.com','',1,'','Standard user',0,1,'dept_root');

INSERT INTO `sm_system_role` (`id`,`name`,`description`,`permission_scope`,`sort`,`enabled`) VALUES
('r_admin','ROLE_ADMIN','Administrator role',999,1,1),
('r_user','ROLE_USER','User role',1,2,1);

INSERT INTO `sm_system_permission` (`id`,`code`,`type`,`name`,`description`,`pid`,`icon`) VALUES
('p_sys','system','CATALOG','系统管理','System management',NULL,'carbon:settings'),
('p_user','system:user:list','MENU','用户管理','User management','p_sys','carbon:user'),
('p_role','system:role:list','MENU','角色管理','Role management','p_sys','carbon:group'),
('p_perm','system:permission:list','MENU','权限管理','Permission management','p_sys','carbon:menu'),
('p_dept','system:department:list','MENU','部门管理','Department management','p_sys','carbon:container-services'),
('p_pos','system:position:list','MENU','职位管理','Position management','p_sys','carbon:id-management'),
('p_user_c','system:user:create','BUTTON','创建','Create','p_user','carbon:add'),
('p_user_r','system:user:read','BUTTON','查看','Read','p_user','carbon:view'),
('p_user_u','system:user:update','BUTTON','更新','Update','p_user','carbon:edit'),
('p_user_d','system:user:delete','BUTTON','删除','Delete','p_user','carbon:delete'),
('p_role_c','system:role:create','BUTTON','创建','Create','p_role','carbon:add'),
('p_role_r','system:role:read','BUTTON','查看','Read','p_role','carbon:view'),
('p_role_u','system:role:update','BUTTON','更新','Update','p_role','carbon:edit'),
('p_role_d','system:role:delete','BUTTON','删除','Delete','p_role','carbon:delete'),
('p_perm_c','system:permission:create','BUTTON','创建','Create','p_perm','carbon:add'),
('p_perm_r','system:permission:read','BUTTON','查看','Read','p_perm','carbon:view'),
('p_perm_u','system:permission:update','BUTTON','更新','Update','p_perm','carbon:edit'),
('p_perm_d','system:permission:delete','BUTTON','删除','Delete','p_perm','carbon:delete'),
('p_dept_c','system:department:create','BUTTON','创建','Create','p_dept','carbon:add'),
('p_dept_r','system:department:read','BUTTON','查看','Read','p_dept','carbon:view'),
('p_dept_u','system:department:update','BUTTON','更新','Update','p_dept','carbon:edit'),
('p_dept_d','system:department:delete','BUTTON','删除','Delete','p_dept','carbon:delete'),
('p_pos_c','system:position:create','BUTTON','创建','Create','p_pos','carbon:add'),
('p_pos_r','system:position:read','BUTTON','查看','Read','p_pos','carbon:view'),
('p_pos_u','system:position:update','BUTTON','更新','Update','p_pos','carbon:edit'),
('p_pos_d','system:position:delete','BUTTON','删除','Delete','p_pos','carbon:delete');

INSERT INTO `sm_system_role_permission` (`role_id`,`permission_id`) VALUES
('r_admin','p_sys'),('r_admin','p_user'),('r_admin','p_role'),('r_admin','p_perm'),('r_admin','p_dept'),('r_admin','p_pos'),
('r_admin','p_user_c'),('r_admin','p_user_r'),('r_admin','p_user_u'),('r_admin','p_user_d'),
('r_admin','p_role_c'),('r_admin','p_role_r'),('r_admin','p_role_u'),('r_admin','p_role_d'),
('r_admin','p_perm_c'),('r_admin','p_perm_r'),('r_admin','p_perm_u'),('r_admin','p_perm_d'),
('r_admin','p_dept_c'),('r_admin','p_dept_r'),('r_admin','p_dept_u'),('r_admin','p_dept_d'),
('r_admin','p_pos_c'),('r_admin','p_pos_r'),('r_admin','p_pos_u'),('r_admin','p_pos_d');

INSERT INTO `sm_system_user_position` (`user_id`,`position_id`) VALUES
('u_admin','pos_admin'),
('u_user','pos_user'),
('u_vben','pos_user');

INSERT INTO `sm_system_user_role` (`user_id`,`role_id`) VALUES
('u_admin','r_admin'),
('u_user','r_user'),
('u_vben','r_user');
