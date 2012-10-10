-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2012 年 10 月 10 日 09:51
-- 服务器版本: 5.5.24-log
-- PHP 版本: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `my_dilicms`
--

-- --------------------------------------------------------

--
-- 表的结构 `dili_admins`
--

CREATE TABLE IF NOT EXISTS `dili_admins` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` smallint(5) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1=正常，2=冻结',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `group` (`role`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dili_admins`
--

INSERT INTO `dili_admins` (`uid`, `username`, `password`, `email`, `role`, `status`) VALUES
(1, 'admin', 'aebcf178d597d93ff848fd2d6331d5e7', 'dili@cms.com', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dili_attachments`
--

CREATE TABLE IF NOT EXISTS `dili_attachments` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` smallint(10) NOT NULL DEFAULT '0',
  `model` mediumint(10) DEFAULT '0',
  `from` tinyint(1) DEFAULT '0' COMMENT '0:content model,1:cate model',
  `content` int(10) DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `folder` varchar(15) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `image` tinyint(1) DEFAULT '0',
  `posttime` int(11) DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dili_backend_settings`
--

CREATE TABLE IF NOT EXISTS `dili_backend_settings` (
  `backend_theme` varchar(15) DEFAULT NULL,
  `backend_lang` varchar(10) DEFAULT NULL,
  `backend_root_access` tinyint(1) unsigned DEFAULT '1',
  `backend_access_point` varchar(20) DEFAULT 'admin',
  `backend_title` varchar(100) DEFAULT 'DiliCMS后台管理',
  `backend_logo` varchar(100) DEFAULT 'images/logo.gif'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_backend_settings`
--

INSERT INTO `dili_backend_settings` (`backend_theme`, `backend_lang`, `backend_root_access`, `backend_access_point`, `backend_title`, `backend_logo`) VALUES
('default', 'zh-cn', 1, '', 'DiliCMS', 'images/logo.gif');

-- --------------------------------------------------------

--
-- 表的结构 `dili_cate_fields`
--

CREATE TABLE IF NOT EXISTS `dili_cate_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `model` smallint(10) unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` tinytext,
  `width` smallint(10) DEFAULT NULL,
  `height` smallint(10) DEFAULT NULL,
  `rules` tinytext,
  `ruledescription` tinytext,
  `searchable` tinyint(1) unsigned DEFAULT NULL,
  `listable` tinyint(1) unsigned DEFAULT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`model`),
  KEY `model` (`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `dili_cate_fields`
--

INSERT INTO `dili_cate_fields` (`id`, `name`, `description`, `model`, `type`, `length`, `values`, `width`, `height`, `rules`, `ruledescription`, `searchable`, `listable`, `order`, `editable`) VALUES
(3, 'nav_category', '菜单分类名称', 3, 'input', 50, '', 200, 20, 'required', '', 0, 0, 1, 1),
(5, 'zixun_category', '资讯类型', 6, 'input', 180, '', 0, 0, 'required', '', 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dili_cate_models`
--

CREATE TABLE IF NOT EXISTS `dili_cate_models` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `perpage` varchar(2) NOT NULL,
  `level` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `hasattach` tinyint(1) NOT NULL DEFAULT '0',
  `built_in` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `dili_cate_models`
--

INSERT INTO `dili_cate_models` (`id`, `name`, `description`, `perpage`, `level`, `hasattach`, `built_in`) VALUES
(3, 'nav', '菜单', '20', 1, 0, 0),
(6, 'zixun', '资讯', '20', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dili_fieldtypes`
--

CREATE TABLE IF NOT EXISTS `dili_fieldtypes` (
  `k` varchar(20) NOT NULL,
  `v` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_fieldtypes`
--

INSERT INTO `dili_fieldtypes` (`k`, `v`) VALUES
('int', '整形(INT)'),
('float', '浮点型(FLOAT)'),
('input', '单行文本框(VARCHAR)'),
('textarea', '文本区域(VARCHAR)'),
('select', '下拉菜单(VARCHAR)'),
('select_from_model', '下拉菜单(模型数据)(INT)'),
('linked_menu', '联动下拉菜单(VARCHAR)'),
('radio', '单选按钮(VARCHAR)'),
('radio_from_model', '单选按钮(模型数据)(INT)'),
('checkbox', '复选框(VARCHAR)'),
('checkbox_from_model', '复选框(模型数据)(VARCHAR)'),
('wysiwyg', '编辑器(TEXT)'),
('wysiwyg_basic', '编辑器(简)(TEXT)'),
('datetime', '日期时间(VARCHAR)'),
('colorpicker', '颜色选择器(VARCHAR)');

-- --------------------------------------------------------

--
-- 表的结构 `dili_menus`
--

CREATE TABLE IF NOT EXISTS `dili_menus` (
  `menu_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) NOT NULL,
  `method_name` varchar(30) NOT NULL,
  `menu_name` varchar(20) NOT NULL,
  `menu_level` tinyint(2) unsigned DEFAULT '0',
  `menu_parent` tinyint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `dili_menus`
--

INSERT INTO `dili_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES
(1, 'system', 'home', '系统', 0, 0),
(2, 'system', 'home', '后台首页', 1, 1),
(3, 'system', 'home', '后台首页', 2, 2),
(4, 'setting', 'site', '系统设置', 1, 1),
(5, 'setting', 'site', '站点设置', 2, 4),
(6, 'setting', 'backend', '后台设置', 2, 4),
(7, 'system', 'password', '修改密码', 2, 4),
(8, 'system', 'cache', '更新缓存', 2, 4),
(9, 'model', 'view', '模型管理', 1, 1),
(10, 'model', 'view', '内容模型管理', 2, 9),
(11, 'category', 'view', '分类模型管理', 2, 9),
(12, 'plugin', 'view', '插件管理', 1, 1),
(13, 'plugin', 'view', '插件管理', 2, 12),
(14, 'role', 'view', '权限管理', 1, 1),
(15, 'role', 'view', '用户组管理', 2, 14),
(16, 'user', 'view', '用户管理', 2, 14),
(17, 'content', 'view', '内容管理', 0, 0),
(18, 'content', 'view', '内容管理', 1, 17),
(19, 'category_content', 'view', '分类管理', 1, 17),
(20, 'module', 'run', '工具', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dili_models`
--

CREATE TABLE IF NOT EXISTS `dili_models` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `perpage` varchar(2) NOT NULL DEFAULT '10',
  `hasattach` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `built_in` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `dili_models`
--

INSERT INTO `dili_models` (`id`, `name`, `description`, `perpage`, `hasattach`, `built_in`) VALUES
(2, 'nav', '导航菜单', '20', 0, 0),
(7, 'article', '文章（普通）', '20', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dili_model_fields`
--

CREATE TABLE IF NOT EXISTS `dili_model_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `model` smallint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` tinytext NOT NULL,
  `width` smallint(10) unsigned NOT NULL,
  `height` smallint(10) unsigned NOT NULL,
  `rules` tinytext NOT NULL,
  `ruledescription` tinytext NOT NULL,
  `searchable` tinyint(1) unsigned NOT NULL,
  `listable` tinyint(1) unsigned NOT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`model`),
  KEY `model` (`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `dili_model_fields`
--

INSERT INTO `dili_model_fields` (`id`, `name`, `description`, `model`, `type`, `length`, `values`, `width`, `height`, `rules`, `ruledescription`, `searchable`, `listable`, `order`, `editable`) VALUES
(1, 'classid', '菜单类别', 2, 'select_from_model', 0, 'nav|nav_category', 0, 0, 'required', '', 0, 1, 1, 1),
(2, 'nav_label', '导航文本', 2, 'input', 50, '', 0, 0, 'required', '', 0, 1, 2, 1),
(3, 'nav_url', '链接地址', 2, 'input', 100, '', 300, 0, 'required', '', 0, 1, 3, 1),
(8, 'art_type', '文章分类', 7, 'select_from_model', 0, 'zixun|zixun_category', 0, 0, 'required', '', 0, 1, 1, 1),
(7, 'art_title', '文章标题', 7, 'input', 50, '', 400, 20, 'required', '', 0, 1, 2, 1),
(9, 'art_desc', '文章简述', 7, 'textarea', 200, '', 400, 50, '', '', 0, 1, 3, 1),
(10, 'art_content', '文章内容', 7, 'wysiwyg', 0, '', 600, 500, 'required', '', 0, 1, 4, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dili_plugins`
--

CREATE TABLE IF NOT EXISTS `dili_plugins` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `version` varchar(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `author` varchar(20) NOT NULL,
  `link` varchar(100) NOT NULL,
  `copyrights` varchar(100) NOT NULL,
  `access` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dili_rights`
--

CREATE TABLE IF NOT EXISTS `dili_rights` (
  `right_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `right_name` varchar(30) DEFAULT NULL,
  `right_class` varchar(30) DEFAULT NULL,
  `right_method` varchar(30) DEFAULT NULL,
  `right_detail` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`right_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- 转存表中的数据 `dili_rights`
--

INSERT INTO `dili_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES
(1, '密码修改', 'system', 'password', NULL),
(2, '更新缓存', 'system', 'cache', NULL),
(3, ' 站点设置', 'setting', 'site', NULL),
(4, '后台设置', 'setting', 'backend', NULL),
(5, '插件管理[列表]', 'plugin', 'view', NULL),
(6, '添加插件', 'plugin', 'add', NULL),
(7, '修改插件', 'plugin', 'edit', NULL),
(8, '卸载插件', 'plugin', 'del', NULL),
(9, '导出插件', 'plugin', 'export', NULL),
(10, '导入插件', 'plugin', 'import', NULL),
(11, '激活插件', 'plugin', 'active', NULL),
(12, '禁用插件', 'plugin', 'deactive', NULL),
(13, '运行插件', 'module', 'run', NULL),
(14, '内容模型管理[列表]', 'model', 'view', NULL),
(15, '添加内容模型', 'model', 'add', NULL),
(16, '修改内容模型', 'model', 'edit', NULL),
(17, '删除内容模型', 'model', 'del', NULL),
(18, '内容模型字段管理[列表]', 'model', 'fields', NULL),
(19, '添加内容模型字段', 'model', 'add_filed', NULL),
(20, '修改内容模型字段', 'model', 'edit_field', NULL),
(21, '删除内容模型字段', 'model', 'del_field', NULL),
(22, '分类模型管理[列表]', 'category', 'view', NULL),
(23, '添加分类模型', 'category', 'add', NULL),
(24, '修改分类模型', 'category', 'edit', NULL),
(25, '删除分类模型', 'category', 'del', NULL),
(26, '分类模型字段管理[列表]', 'category', 'fields', NULL),
(27, '添加分类模型字段', 'category', 'add_filed', NULL),
(28, '修改分类模型字段', 'category', 'edit_field', NULL),
(29, '删除分类模型字段', 'category', 'del_field', NULL),
(30, '内容管理[列表]', 'content', 'view', NULL),
(31, '添加内容[表单]', 'content', 'form', 'add'),
(32, '修改内容[表单]', 'content', 'form', 'edit'),
(33, '添加内容[动作]', 'content', 'save', 'add'),
(34, '修改内容[动作]', 'content', 'save', 'edit'),
(35, '删除内容', 'content', 'del', NULL),
(36, '分类管理[列表]', 'category_content', 'view', NULL),
(37, '添加分类[表单]', 'category_content', 'form', 'add'),
(38, '修改分类[表单]', 'category_content', 'form', 'edit'),
(39, '添加分类[动作]', 'category_content', 'save', 'add'),
(40, '修改分类[动作]', 'category_content', 'save', 'edit'),
(41, '删除分类', 'category_content', 'del', NULL),
(42, '用户组管理[列表]', 'role', 'view', NULL),
(43, '添加用户组', 'role', 'add', NULL),
(44, '修改用户组', 'role', 'edit', NULL),
(45, '删除用户组', 'role', 'del', NULL),
(46, '用户管理[列表]', 'user', 'view', NULL),
(47, '添加用户', 'user', 'add', NULL),
(48, '修改用户', 'user', 'edit', NULL),
(49, '删除用户', 'user', 'del', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `dili_roles`
--

CREATE TABLE IF NOT EXISTS `dili_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `rights` varchar(255) NOT NULL,
  `models` varchar(255) NOT NULL,
  `category_models` varchar(255) NOT NULL,
  `plugins` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dili_roles`
--

INSERT INTO `dili_roles` (`id`, `name`, `rights`, `models`, `category_models`, `plugins`) VALUES
(1, 'root', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `dili_sessions`
--

CREATE TABLE IF NOT EXISTS `dili_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_sessions`
--

INSERT INTO `dili_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('2082275a157d270ac76a73fc8a2f3663', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:15.0) Gecko/20100101 Firefox/15.0.1', 1349862496, 'a:2:{s:9:"user_data";s:0:"";s:3:"uid";s:1:"1";}');

-- --------------------------------------------------------

--
-- 表的结构 `dili_site_settings`
--

CREATE TABLE IF NOT EXISTS `dili_site_settings` (
  `site_name` varchar(50) DEFAULT NULL,
  `site_domain` varchar(50) DEFAULT NULL,
  `site_logo` varchar(50) DEFAULT NULL,
  `site_icp` varchar(50) DEFAULT NULL,
  `site_terms` text,
  `site_stats` varchar(200) DEFAULT NULL,
  `site_footer` varchar(500) DEFAULT NULL,
  `site_status` tinyint(1) DEFAULT '1',
  `site_close_reason` varchar(200) DEFAULT NULL,
  `site_keyword` varchar(200) DEFAULT NULL,
  `site_description` varchar(200) DEFAULT NULL,
  `site_theme` varchar(20) DEFAULT NULL,
  `attachment_dir` varchar(20) DEFAULT NULL,
  `attachment_type` varchar(50) DEFAULT NULL,
  `attachment_maxupload` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_site_settings`
--

INSERT INTO `dili_site_settings` (`site_name`, `site_domain`, `site_logo`, `site_icp`, `site_terms`, `site_stats`, `site_footer`, `site_status`, `site_close_reason`, `site_keyword`, `site_description`, `site_theme`, `attachment_dir`, `attachment_type`, `attachment_maxupload`) VALUES
('yodian本地测试站点', 'http://yodian.dev/', 'images/logo.gif', '12345', '', '', '', 1, '网站维护升级中......', 'DiliCMS,CodeIgniter,DiliCMS最新版', 'DiliCMS 基于CodeIgniter的开源免费 专业面向开发者的CMS系统', 'default', 'attachments', '*.jpg;*.gif;*.png;*.doc', '2097152');

-- --------------------------------------------------------

--
-- 表的结构 `dili_u_c_nav`
--

CREATE TABLE IF NOT EXISTS `dili_u_c_nav` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) NOT NULL,
  `nav_category` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `dili_u_c_nav`
--

INSERT INTO `dili_u_c_nav` (`classid`, `parentid`, `level`, `path`, `nav_category`) VALUES
(1, 0, 1, '', '主导航'),
(2, 0, 1, '', '友情链接');

-- --------------------------------------------------------

--
-- 表的结构 `dili_u_c_zixun`
--

CREATE TABLE IF NOT EXISTS `dili_u_c_zixun` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) NOT NULL,
  `zixun_category` varchar(180) NOT NULL DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `dili_u_c_zixun`
--

INSERT INTO `dili_u_c_zixun` (`classid`, `parentid`, `level`, `path`, `zixun_category`) VALUES
(1, 0, 1, '', '公开课'),
(2, 0, 1, '', '企业内训');

-- --------------------------------------------------------

--
-- 表的结构 `dili_u_m_article`
--

CREATE TABLE IF NOT EXISTS `dili_u_m_article` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `art_title` varchar(50) NOT NULL DEFAULT '',
  `art_type` int(10) NOT NULL DEFAULT '0',
  `art_desc` varchar(200) NOT NULL DEFAULT '',
  `art_content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dili_u_m_nav`
--

CREATE TABLE IF NOT EXISTS `dili_u_m_nav` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `classid` int(10) NOT NULL DEFAULT '0',
  `nav_label` varchar(50) NOT NULL DEFAULT '',
  `nav_url` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `dili_u_m_nav`
--

INSERT INTO `dili_u_m_nav` (`id`, `create_time`, `update_time`, `classid`, `nav_label`, `nav_url`) VALUES
(1, 1349857529, 1349857674, 1, '首页', '/'),
(2, 1349857744, 1349857744, 1, '公开课', '/gongkaike/'),
(3, 1349857772, 1349857772, 1, '企业内训', '/qiyeneixun/'),
(4, 1349857795, 1349857795, 1, '企业拓展', '/qiyetuozhan/'),
(5, 1349857836, 1349857836, 1, '顾问团队', '/guwentuandui/'),
(6, 1349857859, 1349857859, 1, '成功案例', '/chenggonganli/'),
(7, 1349857887, 1349857887, 1, '培训资讯', '/peixunzixun/'),
(8, 1349860003, 1349860003, 2, '百度', 'http://www.baidu.com/'),
(9, 1349860027, 1349860027, 2, '新浪科技', 'http://www.sina.com.cn/'),
(10, 1349860043, 1349860043, 2, '谷歌', 'http://www.google.com/');

-- --------------------------------------------------------

--
-- 表的结构 `dili_validations`
--

CREATE TABLE IF NOT EXISTS `dili_validations` (
  `k` varchar(20) DEFAULT NULL,
  `v` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dili_validations`
--

INSERT INTO `dili_validations` (`k`, `v`) VALUES
('required', '必填'),
('valid_email', 'E-mail格式');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
