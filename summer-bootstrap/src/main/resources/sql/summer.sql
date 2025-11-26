DROP TABLE IF EXISTS `sm_system_role_permission`;
DROP TABLE IF EXISTS `sm_system_permission`;
DROP TABLE IF EXISTS `sm_system_role`;
DROP TABLE IF EXISTS `sm_system_user`;
DROP TABLE IF EXISTS `sm_system_position`;
DROP TABLE IF EXISTS `sm_system_department`;

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
  `department_id` varchar(64) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pos_dept` (`department_id`)
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
  `position_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_dept` (`department_id`),
  KEY `idx_user_pos` (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sm_system_role` (
  `id` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `permission_scope` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sm_system_permission` (
  `id` varchar(64) NOT NULL,
  `code` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pid` varchar(64) DEFAULT NULL,
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

INSERT INTO `sm_system_position` (`id`,`name`,`code`,`department_id`,`type`,`description`,`sort`) VALUES
('pos_admin','Administrator','ADMIN','dept_root',1,'System administrator',1),
('pos_user','User','USER','dept_root',2,'Standard user',2);

INSERT INTO `sm_system_user` (`id`,`first_name`,`last_name`,`account`,`password`,`email`,`phone`,`gender`,`avatar`,`description`,`deleted`,`enable`,`department_id`,`position_id`) VALUES
('u_admin','Admin','','admin','$2a$10$7EqJtq98hPqEX7fNLEIw.uS8vz1p.nQH0I0ZgQ8YQJRnH/uaG6ay','admin@example.com','',1,'','Super administrator',0,1,'dept_root','pos_admin'),
('u_user','User','','user','$2a$10$7EqJtq98hPqEX7fNLEIw.uS8vz1p.nQH0I0ZgQ8YQJRnH/uaG6ay','user@example.com','',1,'','Standard user',0,1,'dept_root','pos_user');

INSERT INTO `sm_system_role` (`id`,`name`,`description`,`permission_scope`,`sort`) VALUES
('r_admin','ROLE_ADMIN','Administrator role',999,1),
('r_user','ROLE_USER','User role',1,2);

INSERT INTO `sm_system_permission` (`id`,`code`,`type`,`name`,`description`,`pid`) VALUES
('p_sys','SYSTEM','MENU','系统管理','System management',NULL),
('p_user','USER','MENU','用户管理','User management','p_sys'),
('p_role','ROLE','MENU','角色管理','Role management','p_sys'),
('p_perm','PERMISSION','MENU','权限管理','Permission management','p_sys'),
('p_dept','DEPARTMENT','MENU','部门管理','Department management','p_sys'),
('p_pos','POSITION','MENU','职位管理','Position management','p_sys'),
('p_user_c','USER_CREATE','OPERATION','创建用户','Create user','p_user'),
('p_user_r','USER_READ','OPERATION','查看用户','Read user','p_user'),
('p_user_u','USER_UPDATE','OPERATION','更新用户','Update user','p_user'),
('p_user_d','USER_DELETE','OPERATION','删除用户','Delete user','p_user'),
('p_role_c','ROLE_CREATE','OPERATION','创建角色','Create role','p_role'),
('p_role_r','ROLE_READ','OPERATION','查看角色','Read role','p_role'),
('p_role_u','ROLE_UPDATE','OPERATION','更新角色','Update role','p_role'),
('p_role_d','ROLE_DELETE','OPERATION','删除角色','Delete role','p_role'),
('p_perm_c','PERMISSION_CREATE','OPERATION','创建权限','Create permission','p_perm'),
('p_perm_r','PERMISSION_READ','OPERATION','查看权限','Read permission','p_perm'),
('p_perm_u','PERMISSION_UPDATE','OPERATION','更新权限','Update permission','p_perm'),
('p_perm_d','PERMISSION_DELETE','OPERATION','删除权限','Delete permission','p_perm'),
('p_dept_c','DEPARTMENT_CREATE','OPERATION','创建部门','Create department','p_dept'),
('p_dept_r','DEPARTMENT_READ','OPERATION','查看部门','Read department','p_dept'),
('p_dept_u','DEPARTMENT_UPDATE','OPERATION','更新部门','Update department','p_dept'),
('p_dept_d','DEPARTMENT_DELETE','OPERATION','删除部门','Delete department','p_dept'),
('p_pos_c','POSITION_CREATE','OPERATION','创建职位','Create position','p_pos'),
('p_pos_r','POSITION_READ','OPERATION','查看职位','Read position','p_pos'),
('p_pos_u','POSITION_UPDATE','OPERATION','更新职位','Update position','p_pos'),
('p_pos_d','POSITION_DELETE','OPERATION','删除职位','Delete position','p_pos');

INSERT INTO `sm_system_role_permission` (`role_id`,`permission_id`) VALUES
('r_admin','p_sys'),('r_admin','p_user'),('r_admin','p_role'),('r_admin','p_perm'),('r_admin','p_dept'),('r_admin','p_pos'),
('r_admin','p_user_c'),('r_admin','p_user_r'),('r_admin','p_user_u'),('r_admin','p_user_d'),
('r_admin','p_role_c'),('r_admin','p_role_r'),('r_admin','p_role_u'),('r_admin','p_role_d'),
('r_admin','p_perm_c'),('r_admin','p_perm_r'),('r_admin','p_perm_u'),('r_admin','p_perm_d'),
('r_admin','p_dept_c'),('r_admin','p_dept_r'),('r_admin','p_dept_u'),('r_admin','p_dept_d'),
('r_admin','p_pos_c'),('r_admin','p_pos_r'),('r_admin','p_pos_u'),('r_admin','p_pos_d');
