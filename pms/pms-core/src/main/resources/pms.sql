/*
Navicat MySQL Data Transfer

Source Server         : 99.12.140.135_test
Source Server Version : 50623
Source Host           : 99.12.140.135:5407
Source Database       : fxdgxd

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2017-10-23 16:44:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `AuthorityID` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统生成，主键',
  `ParentAuthID` int(20) unsigned NOT NULL COMMENT '父权限ID',
  `AuthName` varchar(50) NOT NULL DEFAULT '' COMMENT '权限名',
  `AuthDescription` varchar(100) DEFAULT '' COMMENT '权限描述',
  `AuthURL` varchar(200) DEFAULT '' COMMENT '权限URL',
  `AuthCreTime` datetime DEFAULT NULL COMMENT '创建时间',
  `AuthModTime` datetime DEFAULT NULL COMMENT '修改时间',
  `AuthCreator` varchar(20) DEFAULT '' COMMENT '创建人',
  `AuthModifier` varchar(20) DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`AuthorityID`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', '0', '根权限', '\\', '/', '2017-09-15 17:32:55', '2017-09-15 17:32:57', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('2', '3', '添加新需求', '添加操作', '/createReq.do', '2017-09-19 16:36:37', '2017-09-21 11:43:41', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('3', '4', '需求列表', '查看操作', '/loadReqsList.do', '2017-09-19 16:33:01', '2017-09-21 16:47:44', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('4', '1', '需求管理', '/', '/reqs', '2017-09-19 16:36:48', '2017-09-21 16:55:21', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('8', '1', '公共活动管理', '/', '/loadPublicActivity.do', '2017-09-15 17:39:47', '2017-09-21 16:55:53', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('9', '1', '权限管理', '/', '/loadAuthoritiesList.do', '2017-09-15 17:40:10', '2017-09-21 16:55:58', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('10', '3', '修改需求', '修改操作', '/updateReq.do', '2017-09-15 17:40:40', '2017-09-21 11:44:19', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('20', '23', '新建公共活动', '/', '/createPublicActivity.do', '2017-09-19 16:33:13', '2017-09-21 16:56:02', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('21', '24', '新建内部培训', '/', '/createInterTraining.do', '2017-09-19 16:33:16', '2017-09-21 16:56:06', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('22', '23', '修改公共活动', '/', '/updatePublicActivity.do', '2017-09-19 16:33:20', '2017-09-21 16:56:09', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('23', '8', '公共活动', '/', '/loadPublicActivity.do', '2017-09-19 16:22:38', '2017-09-21 18:49:40', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('24', '8', '内部培训', '/', '/loadInterTraining.do', '2017-09-19 16:23:23', '2017-09-21 16:56:16', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('25', '24', '修改内部培训', '/', '/updateInterTraining.do', '2017-09-19 16:24:35', '2017-09-21 16:56:19', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('26', '3', '按条件查询需求列表', '/', '/searchReqs.do', '2017-09-19 17:15:13', '2017-09-21 16:56:22', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('27', '3', '删除需求', '/', '/deleteReq.do', '2017-09-19 17:20:03', '2017-09-21 16:56:26', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('28', '3', '查看需求详细内容', '/', '/getReqByID.do', '2017-09-21 08:37:13', '2017-09-21 16:56:29', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('29', '4', '预研需求列表', '/', '/loadPreResearchReqs.do', '2017-09-21 08:54:20', '2017-09-21 16:56:34', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('30', '4', '意向性需求列表', '/', '/loadIntentionalityReqs.do', '2017-09-21 08:55:38', '2017-09-21 16:56:37', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('31', '4', '待完善需求列表', '/', '/loadWaitPerfectReqs.do', '2017-09-21 08:56:39', '2017-09-21 16:56:44', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('32', '4', '评估中需求列表', '/', '/loadEstimatingReqs.do', '2017-09-21 08:59:42', '2017-09-21 16:56:51', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('33', '4', '排期开发需求列表', '/', '/loadSchedulDevReqs.do', '2017-09-21 09:00:56', '2017-09-21 16:56:56', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('34', '4', '暂缓需求列表', '/', '/loadDeferReqs.do', '2017-09-21 09:02:49', '2017-09-21 16:57:03', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('35', '4', '开发中需求列表', '/', '/loadDevelopingReqs.do', '2017-09-21 09:03:53', '2017-09-21 16:58:09', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('36', '4', '已上线需求列表', '/', '/loadOnLinedReqs.do', '2017-09-21 09:08:01', '2017-09-21 16:58:14', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('39', '29', '预研需求条件查询', '/', '/searchPreResReqs.do', '2017-09-21 11:47:36', '2017-09-21 16:58:19', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('40', '30', '意向性需求条件查询', '/', '/searchIntentionReqs.do', '2017-09-21 14:54:12', '2017-09-21 16:57:54', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('41', '31', '待完善需求条件查询', '/', '/searchWaitPerfectReqs.do', '2017-09-21 14:55:31', '2017-09-21 16:58:00', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('42', '32', '评估中需求条件查询', '/', '/searchEstimatingReqs.do', '2017-09-21 14:57:06', '2017-09-21 16:57:49', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('43', '33', '排期开发需求条件查询', '/', '/searchSchedulDevReqs.do', '2017-09-21 14:58:32', '2017-09-21 16:57:44', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('44', '34', '暂缓需求条件查询', '/', '/searchDeferReqs.do', '2017-09-21 14:59:38', '2017-09-21 16:57:39', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('45', '35', '开发中需求条件查询', '/', '/searchDevelopingReqs.do', '2017-09-21 15:00:54', '2017-09-21 16:57:34', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('46', '36', '已上线需求条件查询', '/', '/searchOnLinedReqs.do', '2017-09-21 15:02:45', '2017-09-21 16:57:29', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('47', '9', '用户列表', '/', '/loadUsersList.do', '2017-09-21 16:45:27', '2017-09-21 16:57:24', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('48', '47', '按条件查询用户信息', '/', '/searchUsers.do', '2017-09-21 16:50:13', '2017-09-21 16:57:17', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('49', '47', '删除用户', '/', '/deleteUser.do', '2017-09-21 16:53:04', '2017-09-21 16:57:12', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('50', '47', '查看用户基本信息', '/', '/getUserByID.do', '2017-09-21 16:53:53', '2017-09-21 16:57:08', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('51', '47', '修改用户信息', '/', '/updateUser.do', '2017-09-21 16:54:24', '2017-09-21 16:55:40', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('52', '9', '角色列表', '/', '/loadRolesList.do', '2017-09-21 16:55:01', '2017-09-21 16:58:28', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('53', '52', '按条件查询角色信息', '/', '/searchRoles.do', '2017-09-21 16:59:09', '2017-09-21 16:59:09', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('54', '52', '删除角色信息', '/', '/deleteRole.do', '2017-09-21 16:59:52', '2017-09-21 16:59:52', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('55', '52', '查看角色基本信息', '/', '/getRoleByID.do', '2017-09-21 17:00:35', '2017-09-21 17:00:35', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('56', '52', '创建新角色', '/', '/createRole.do', '2017-09-21 17:01:24', '2017-09-21 17:01:24', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('57', '52', '修改角色信息', '/', '/updateRole.do', '2017-09-21 17:01:56', '2017-09-21 17:01:56', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('58', '52', '初始化角色资源树', '辅助修改和新建操作', '/initRolesTree.do', '2017-09-21 17:03:43', '2017-09-21 17:03:43', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('59', '9', '权限列表', '/', '/loadAuthoritiesList.do', '2017-09-21 17:05:17', '2017-09-21 17:05:17', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('60', '59', '查询权限列表信息', '/', '/searchAuths.do', '2017-09-21 17:05:50', '2017-09-21 17:05:50', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('61', '59', '删除权限资源', '/', '/deleteAuth.do', '2017-09-21 17:06:33', '2017-09-21 17:06:33', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('62', '59', '创建权限资源', '/', '/createAuth.do', '2017-09-21 17:07:12', '2017-09-21 17:07:12', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('63', '59', '更新权限资源', '/', '/updateAuth.do', '2017-09-21 17:07:45', '2017-09-21 17:07:45', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('64', '59', '初始化权限资源树', '辅助权限资源新建和修改', '/initAuthsTree.do', '2017-09-21 17:08:47', '2017-09-21 17:08:47', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('65', '9', '角色权限', '/', '/', '2017-09-21 17:09:39', '2017-09-21 17:09:39', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('66', '65', '角色权限信息初始化', '/', '/initRoleAuthsTree.do', '2017-09-21 17:10:25', '2017-09-21 17:10:25', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('67', '65', '设置角色权限', '/', '/setRoleAuth.do', '2017-09-21 17:11:15', '2017-09-21 17:11:15', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('68', '9', '用户角色', '/', '/', '2017-09-21 17:13:03', '2017-09-21 17:13:03', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('69', '68', '初始化用户角色信息', '/', '/initUserRolesTree.do', '2017-09-21 17:13:39', '2017-09-21 17:13:39', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('70', '68', '指定用户角色', '/', '/setUserRole.do', '2017-09-21 17:14:21', '2017-09-21 17:14:21', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('71', '1', '项目管理', '/', '/loadProject.do', '2017-09-21 17:42:11', '2017-09-22 10:12:52', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('72', '1', '程序冲突', '/', '/loadProgramConflict.do', '2017-09-21 17:42:28', '2017-09-22 10:15:25', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('73', '1', '事项追踪', '/', '/loadEventTrack.do', '2017-09-21 17:42:48', '2017-09-22 10:16:03', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('74', '59', '查看权限资源基本信息', '/', '/getAuthByID.do', '2017-09-21 18:45:09', '2017-09-21 18:45:09', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('75', '23', '按条件查询公共活动', '/', '/searchPublicActivities.do', '2017-09-21 18:50:19', '2017-09-21 18:50:19', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('76', '24', '按条件查询内部培训', '/', '/searchInterTrainings.do', '2017-09-21 18:51:05', '2017-09-21 18:51:05', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('77', '71', '查询项目信息', '/', '/searchProjects.do', '2017-09-21 20:28:18', '2017-09-21 20:28:18', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('78', '71', '查询已完成的项目', '/', '/searchFinishProjects.do', '2017-09-21 20:29:29', '2017-09-21 20:29:29', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('79', '71', '根据项目编号查询项目', '/', '/searchProject.do', '2017-09-21 20:31:00', '2017-09-21 20:31:00', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('80', '71', '新建项目', '/', '/createProject.do', '2017-09-21 20:31:43', '2017-09-21 20:32:04', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('81', '71', '删除项目', '/', '/deleteProject.do', '2017-09-21 20:33:07', '2017-09-21 20:33:07', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('82', '71', '更新项目', '/', '/updateProject.do', '2017-09-21 20:33:47', '2017-09-21 20:33:47', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('83', '71', '查询项目需求编号', '/', '/serchProjReqNum.do', '2017-09-21 20:34:59', '2017-09-21 20:34:59', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('84', '72', '查询程序冲突', '/', '/searchProgramConflicts.do', '2017-09-21 20:36:11', '2017-09-21 20:36:11', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('85', '72', '新建程序冲突', '/', '/createProgramConflict.do', '2017-09-21 20:37:15', '2017-09-21 20:37:15', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('86', '72', '删除程序冲突', '/', '/deleteProgramConflict.do', '2017-09-21 20:37:57', '2017-09-21 20:37:57', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('87', '72', '更新程序冲突', '/', '/updateProgramConflict.do', '2017-09-21 20:38:33', '2017-09-21 20:38:33', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('88', '72', '根据项目编号查询程序冲突', '/', '/searchConProject.do', '2017-09-21 20:46:14', '2017-09-21 20:46:14', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('89', '72', '查询冲突项目编号', '/', '/serchConProjNumber.do', '2017-09-21 20:48:42', '2017-09-21 20:48:42', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('90', '72', '根据项目编号获取解决方案', '/', '/getAutoSolution.do', '2017-09-21 20:49:35', '2017-09-21 20:49:35', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('91', '73', '查询事项追踪', '/', '/searchEventTracks.do', '2017-09-21 20:50:58', '2017-09-21 20:50:58', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('92', '73', '查询已解决事项追踪', '/', '/searchFinishEventTracks.do', '2017-09-21 20:51:49', '2017-09-21 20:51:49', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('93', '73', '新建事项追踪', '/', '/createEventTrack.do', '2017-09-21 20:52:25', '2017-09-21 20:52:25', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('94', '73', '删除事项追踪', '/', '/deleteEventTrack.do', '2017-09-21 20:52:59', '2017-09-21 20:52:59', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('95', '73', '更新事项追踪', '/', '/updateEventTrack.do', '2017-09-21 20:53:27', '2017-09-21 20:53:27', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('96', '71', '加载已完成的项目', '/', '/loadProjectFinish.do', '2017-09-22 10:13:26', '2017-09-22 10:13:26', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('97', '71', '加载预研项目', '/', '/loadProjectBeforehand.do', '2017-09-22 10:14:40', '2017-09-22 10:14:40', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('98', '73', '加载已完成的事项追踪', '/', '/loadEventTrackFinish.do', '2017-09-22 10:16:31', '2017-09-22 10:16:31', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('99', '23', '获取公共活动信息', '/', '/getPublicActivityByID.do', '2017-09-22 10:44:37', '2017-09-22 10:44:37', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('100', '24', '获取内部培训信息', '/', '/getInterTrainingByID.do', '2017-09-22 10:45:27', '2017-09-22 10:45:27', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('101', '9', '文件管理', '/', '/loadFilesList.do', '2017-09-29 14:43:13', '2017-09-29 14:43:13', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('102', '101', '按条件查询文件信息', '/', '/searchFiles.do', '2017-09-29 14:45:04', '2017-09-29 14:45:04', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('103', '101', '删除文件', '/', '/deleteFile.do', '2017-09-29 14:45:34', '2017-09-29 14:45:34', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('104', '101', '文件上传', '/', '/uploadPicture.do', '2017-09-29 14:46:11', '2017-09-29 14:46:11', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('105', '1', '知识管理', '/', '/', '2017-09-29 18:42:27', '2017-09-29 18:42:27', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('106', '105', '笔记列表', '/', '/loadNotesList.do', '2017-09-29 18:42:58', '2017-09-29 18:42:58', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('107', '3', '需求编号判重', '/', '/isHasReq.do', '2017-09-30 10:22:42', '2017-09-30 10:22:42', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('108', '106', '根据条件查询笔记', '/', '/searchNotes.do', '2017-10-09 15:40:16', '2017-10-09 15:40:16', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('109', '106', '删除笔记', '/', '/deleteNote.do', '2017-10-09 15:41:04', '2017-10-09 15:41:04', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('110', '106', '添加笔记', '/', '/addNote.do', '2017-10-09 15:41:41', '2017-10-09 15:41:41', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('111', '106', '上传笔记附件', '添加笔记子操作', '/addNoteAttachment.do', '2017-10-09 15:42:33', '2017-10-09 15:42:33', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('112', '106', '查询笔记关键字', '新建修改笔记查询关键字', '/searchKeyWords.do', '2017-10-09 15:43:43', '2017-10-09 16:54:33', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('113', '106', '根据 ID 获取笔记信息', '/', '/getNoteByID.do', '2017-10-09 15:44:22', '2017-10-09 15:44:40', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('114', '106', '更新笔记信息', '/', '/updateNote.do', '2017-10-09 15:45:11', '2017-10-09 15:45:11', 'Admin', 'Admin');
INSERT INTO `authority` VALUES ('115', '106', '下载笔记附件', '查看修改笔记子操作', '/downloadAttachment.do', '2017-10-09 16:48:16', '2017-10-09 16:48:16', 'Admin', 'Admin');

-- ----------------------------
-- Table structure for eventtrack
-- ----------------------------
DROP TABLE IF EXISTS `eventtrack`;
CREATE TABLE `eventtrack` (
  `EveTraID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统生成，Primary Key',
  `EveTraReqName` varchar(100) DEFAULT '' COMMENT '需求名称',
  `EveTraState` varchar(20) DEFAULT '' COMMENT '状态',
  `EveTraProgress` varchar(100) DEFAULT '' COMMENT '进展',
  `EveTraContent` varchar(1000) DEFAULT '' COMMENT '主要内容',
  `EveTraPerInCharge` varchar(20) DEFAULT '' COMMENT '负责人',
  `EveTraCreTime` datetime DEFAULT NULL COMMENT '记录生成时间',
  `EveTraModTime` datetime DEFAULT NULL COMMENT '记录更新时间',
  `EveTraCreator` varchar(20) DEFAULT '' COMMENT '创建人',
  `EveTraModifier` varchar(20) DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`EveTraID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eventtrack
-- ----------------------------
INSERT INTO `eventtrack` VALUES ('1', '增值税文件清理策略', '解决中', '合并到大文件清理', '增值税文件清理', '郑祺达', '2017-09-13 14:08:45', '2017-09-29 17:56:24', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('3', '计划还款业务当期提前还款还款金额问题', '解决中', '合并到T1612481（信贷放款时资本净额校验规则等优化功能）', '一笔计划还款业务，放款时是一次性还本，期间做了还本还息方式维护，维护为还本不还息利息暂挂，然后做了提前还款，产生了暂挂息。之后又直接维护还款方式为计划还款，月供当期提前归还时，还款金额异常的问题', '郑祺达', '2017-09-13 14:52:39', '2017-09-13 16:07:58', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('4', '数据文件清理', '', '运行主导，我们配合', 'CMBDTA库下 LO大数据文件清理', '周自勇', '2017-09-13 16:14:59', '2017-09-13 16:14:59', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('7', 'AMCMMOTHCR作业的性能优化', '解决中', '', 'AMCMMOTHCR这个作业每月总有几天CPU冲得很高，尤其是每月26日，CPU消耗排名在TOP2以内，因此急需优化', '马粒君', '2017-09-13 17:19:59', '2017-09-14 09:42:17', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('8', '放款报错', '', '保证金二期考虑', '苏州分行做一笔国际信用证开证业务，资产机构为A，保证金账户在B机构。 __放款报错：AMZ8150  计数类别', '赵玉蓉', '2017-09-13 17:23:31', '2017-09-18 09:39:30', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('9', '额度敞口可用为负值', '解决中', '', '错币种时，保证金质押足够，但额度敞口可用为负值的问题', '郑祺达', '2017-09-13 17:24:30', '2017-09-14 09:42:43', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('12', '不良贷款只有165本金余额时，系统日终会将业务自动结清', '解决中', '放到自助贷款项目里__放到批处理专题', '不良贷款只有165本金余额时，系统日终会将业务自动结清__同时提交日终处理', '熊小飞', '2017-09-13 17:30:14', '2017-09-18 09:38:32', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('13', '分期还款冲账', '', '分期类业务要禁止非当期还款的冲账', '分期类业务还款冲账，未按倒序冲', '朱旭鹏', '2017-09-13 17:33:10', '2017-09-14 09:43:01', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('14', '梳理程序', '', '', '梳理程序中写死科目及科目前几位作为判断条件', '马粒君', '2017-09-13 17:44:46', '2017-09-14 09:43:12', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('15', '信贷系统功能优化', '', '合并黄金租赁需求', '建议将维护利率时，那个界面上必须按一下tab键才能生效的小bug一并修复了吧，这个问题导致很多利率维护不生效了', '周连兰', '2017-09-13 17:46:32', '2017-09-14 09:43:07', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('16', '离岸部额度管理系统内发起取消纳入旧额度流程时报错', '', '正提需求', '在CVM的额度管理系统发起对宝达投资（香港）有限公司（客户编号CM1112269600072）取消旧额度纳入（编号EL1603100000336）现有额度管理时，系统报错为“额度纳入嵌套过多”', '熊小飞', '2017-09-13 17:47:40', '2017-09-13 17:47:40', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('18', '大文件清理', '', '', 'AMBYQLSTP：批量承兑明细文件  1个月前的数据备份后删除__AMCRLMNUP：额度变更文件        除现金池额度外，一个月前的数据备带后删除', '', '2017-09-14 10:22:46', '2017-09-18 09:36:20', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('19', '企银余额共享现金池项目修改核心底层记账程序对信贷的影响问题', '', '', '账务系统修改点：  __金融交易记账、删账、冲账，预期交易记账、撤销，增加了对集团现金池协议账户的支持。主要修改了余额透支判断的逻辑，除了判断本账户可用余额是否充足（注：签了集团现金池的账户会设置透支额度），还判断了现金池的可用余额，直接结果就是查询获取的账户余额，与实际交易时可用的余额可能不一致。  ____1.还款扣息影响  __信贷系统的所有扣款逻辑，均是先取账户余额，再根据账户余额的多少来确定后续交易的扣款金额、转逾期金额，此逻辑的默认前提，是取到的账户可用余额在交易时一定是可用的（冻结情况信贷已特殊处理），根据与蔡秋喜沟通，此次修改将可能出现取到可用余额后，在实际记账时可用部分小于之前取到的可用余额导致交易失败，直接会造成信贷扣款、扣息交易失败，这个对信贷影响很大，请业务评估风险，并确定解决方案。  ____2.质押冻结影响 __信贷系统的质押冻结，是用预期交易方式实现金额冻结的，冻结前信贷不取账户余额，能否冻结成功由账户系统控制，本次修改后，经测试，在账户真实可用余额只有100W的情况下，可以冻结超过100W，冻结后，账户的联机可用余额变为负数，这个地方是否也存在问题，实际能否覆盖信贷业务风险敞口？  __存量已经发布透支的产品也存在类似问题，预计可以通过提前查询账户可用余额，增加检查来解决； 但是本次修改后，如果查询的可用余额与实际交易时可用的金额不一致，即使我们提前增加了检查，也会存在问题；', '', '2017-09-14 10:30:51', '2017-09-18 09:40:39', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('20', '客户合并', '', '嘻嘻', '两个成员客户号A和B，客户名称相同，同属于一个集团时，做客户合并，如果企业代码证都是空的情况下，将客户号A刷新成客户号B时，由于集团成员文件AMCLMAPDP设置了唯一键（集团编号 客户号 客户名称 企业代码证），如果直接UPDATE，则会报重复键。应该修改集团成员文件合并逻辑，改成如果已经存在，则将待合并的客户成员记录直接删除即可。', '', '2017-09-14 10:57:55', '2017-09-26 16:03:40', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('21', '报错修改', '', '', '信贷部门未初        始化报错修改', '', '2017-09-14 10:58:26', '2017-09-29 14:42:27', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('23', '账销案存本金收回后的当天交易删除、隔日冲账报交易透支', '', '嘻嘻', '账销案存本金收回后的当天交易删除、隔日冲账报交易透支，原因是本金收回交易的借贷分录存在缺陷。', '李志然', '2017-09-14 11:07:59', '2017-09-26 16:12:15', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('24', '一次性先收息修改到期日后部门日终扣款', '', '', '针对一次性先收息业务，到期日为A，往前修改到期日到B，到期日部门日终转逾期后__1、 在C日期手工逾期收回,B<C<A,正常收回，AMCPTPA2RP__2、 在C日部门日终批量扣款，报AMS0009__报错点：AMCPTBH2RP->#pIntSum->AMCPTINTRI __到期日往前修改到B后，业务起息日仍未原业务到日A__止息日C<起息日A，报错AMS0009__测试业务品种：出口押汇 9997830666__黄金租赁 2301008936', '马粒君', '2017-09-14 11:17:49', '2017-10-12 10:11:50', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('25', '测试2', '已解决', '', '阿萨德发的方法  更好的风格和低功耗、阿萨德法师打发 ____<测试一下>          #&a#￥￥&……*hskjf…h！@##￥%……&*（））~', '', '2017-09-14 14:32:38', '2017-09-29 18:06:01', 'Admin', 'Admin');
INSERT INTO `eventtrack` VALUES ('27', '测试', '未解决', '', '收到回复感觉！@#￥￥￥￥%……&*（）（——+', '没有', '2017-09-29 15:23:10', '2017-09-30 16:56:37', 'Admin', 'Admin');

-- ----------------------------
-- Table structure for fileinfo
-- ----------------------------
DROP TABLE IF EXISTS `fileinfo`;
CREATE TABLE `fileinfo` (
  `FileID` int(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `FileName` varchar(300) NOT NULL DEFAULT '' COMMENT '文件名',
  `FileDescription` varchar(100) DEFAULT '' COMMENT '文件描述',
  `FileType` varchar(10) DEFAULT '' COMMENT '文件类型',
  `FileSize` double(30,2) unsigned DEFAULT '0.00' COMMENT '文件大小 (单位：kb)',
  `OriginalFileName` varchar(310) DEFAULT '' COMMENT '文件原名',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建日期',
  `ModifyTime` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`FileID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fileinfo
-- ----------------------------
INSERT INTO `fileinfo` VALUES ('18', '测试截图5', '首页-团队风采', 'png', '19.26', '测试截图5.PNG', '2017-09-30 14:22:40', '2017-09-30 14:22:40');

-- ----------------------------
-- Table structure for intertraining
-- ----------------------------
DROP TABLE IF EXISTS `intertraining`;
CREATE TABLE `intertraining` (
  `TraID` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统生成，Primary Key',
  `TraSegment` varchar(5) DEFAULT '' COMMENT '节次',
  `TraTime` datetime DEFAULT NULL COMMENT '培训时间',
  `TraContent` varchar(100) DEFAULT '' COMMENT '培训内容',
  `TraSpeaker` varchar(20) DEFAULT '' COMMENT '主讲人',
  `TraParticipant` varchar(100) DEFAULT '' COMMENT '参与人',
  PRIMARY KEY (`TraID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of intertraining
-- ----------------------------
INSERT INTO `intertraining` VALUES ('2', '1/3', '2017-08-16 09:00:00', 'UCD开发培训', '郑如冰', '小白');
INSERT INTO `intertraining` VALUES ('6', '1/1', '2017-09-08 15:21:22', 'Oracle基础培训', '大佬', '小白');
INSERT INTO `intertraining` VALUES ('7', '1/1', '2017-09-13 09:00:00', '“大数据分析系列培训”第3期', '龙静玲', '宋高，陈倩，吴平，赵玉蓉，陈继伟');

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `NoteID` int(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `NoteTitle` varchar(80) NOT NULL DEFAULT '' COMMENT '主题',
  `NoteContent` varchar(800) NOT NULL DEFAULT '' COMMENT '内容',
  `NoteAttachment` varchar(50) DEFAULT '' COMMENT '附件',
  `NoteKeyWord` varchar(60) DEFAULT '' COMMENT '关键字(多个以分号;分隔)',
  `NotePublisherID` int(32) unsigned NOT NULL COMMENT '发布人ID',
  `NotePublishDate` date DEFAULT NULL COMMENT '发布日期',
  `NoteModifyDate` date DEFAULT NULL COMMENT '最后修改日期',
  PRIMARY KEY (`NoteID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('17', '同业额度测试', '根据 P1706231_联调案例20171010 进行联调测试，重点测试业务逻辑，注意新建额度进行测试。', 'P1706231_联调案例20171010.xlsx', '测试', '1', '2017-10-16', '2017-10-16');
INSERT INTO `note` VALUES ('18', '总控系统开发环境', '开发环境应用服务器，开发环境数据库服务器', '', '总控', '5', '2017-10-18', '2017-10-18');

-- ----------------------------
-- Table structure for programconflict
-- ----------------------------
DROP TABLE IF EXISTS `programconflict`;
CREATE TABLE `programconflict` (
  `ConID` int(12) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统编号：主键ID，自增',
  `ConProID` varchar(20) NOT NULL DEFAULT '' COMMENT '程序编号',
  `ConProName` varchar(20) NOT NULL DEFAULT '' COMMENT '程序名称',
  `ConProjName` varchar(255) NOT NULL DEFAULT '' COMMENT '项目名称',
  `ConPerInCharge` varchar(20) NOT NULL DEFAULT '' COMMENT '负责人',
  `ConSTStaTime` date DEFAULT NULL COMMENT 'ST开始时间',
  `ConUATStaTime` date DEFAULT NULL COMMENT 'UAT开始时间',
  `ConExOnlineDate` date DEFAULT NULL COMMENT '预计上线时间',
  `ConSolution` varchar(100) DEFAULT '' COMMENT '解决方案',
  `ConCreTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ConModTime` datetime DEFAULT NULL COMMENT '修改时间',
  `ConCreator` varchar(20) DEFAULT '' COMMENT '创建人',
  `ConModifier` varchar(20) DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`ConID`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programconflict
-- ----------------------------
INSERT INTO `programconflict` VALUES ('19', 'T1701572', 'AMINJCHKRI', '（2017年度）出口代付业务系统（风险）', '郑祺达', null, null, '2017-12-06', '在T1708741基础上改', '2017-09-06 11:13:18', '2017-09-20 08:29:10', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('20', 'T1701572', 'AMINJCHKRI', '（2017年度）出口代付业务系统（风险）', '郑祺达', null, null, '2017-12-06', '在T1708741基础上改', '2017-09-06 11:13:18', '2017-09-20 08:29:10', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('38', 'T1701572', 'AMINJCHKRI', '（2017年度）出口代付业务系统（风险）', '郑祺达', null, null, '2017-12-06', '在T1708741基础上改', '2017-09-06 11:13:18', '2017-09-20 08:29:10', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('48', 'T1716551', 'AMBUSCKARM', '增加对公信贷业务结息周期选择等功能（FTP相关）', '郑祺达', null, null, '2017-10-02', 'T1708741在T1720101基础上改 <br>P1706611在T1708741基础上改<br>T1716551在P1706611基础上改                       ', '2017-09-15 14:25:30', '2017-09-29 14:19:09', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('50', 'P1714571', 'AMBUSCKARM', '（2017年度）付款代理对接保灵通（福费廷）业务改造需求  ', '马粒君', null, null, '2017-09-19', 'T1708741在T1720101基础上改 <br>P1706611在T1708741基础上改<br>T1716551在P1706611基础上改                       ', '2017-09-15 14:26:17', '2017-09-29 14:19:09', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('57', 'T1705872', 'AMTRSDLTRP', '（信贷流程优化）新一代国内信用证系统优化任务（风险）    ', '周自勇', null, null, '2017-09-26', 'P1705951在P1706611基础上改; P1705951在T1705872基础上改                       ', '2017-09-15 14:32:36', '2017-09-20 15:23:49', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('59', 'T1705872', 'AMNLCCHURP', '（信贷流程优化）新一代国内信用证系统优化任务（风险）    ', '周自勇', null, null, '2017-09-26', 'T1705872在P1706611基础上改                       ', '2017-09-15 14:35:15', '2017-09-20 15:22:25', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('68', 'P1705951', 'AMCPTBH2RP', '(H)（保证金对接改造）信用风险系统保证金管理', '周自勇', null, null, '2017-09-23', 'P1705951在T1708741基础上改', '2017-09-20 14:58:07', '2017-09-30 16:55:57', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('69', 'P1705951', 'AMTRSCFMRI', '(H)（保证金对接改造）信用风险系统保证金管理', '周自勇', null, null, '2017-09-23', 'P1705951在P1706611基础上改                       ', '2017-09-20 15:00:04', '2017-09-20 15:25:01', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('70', 'P1706611', 'AMBUSCKARM', 'CMBRUN系统国内证议付功能优化项目', '朱旭鹏', null, null, '2017-09-09', 'T1708741在T1720101基础上改 <br>P1706611在T1708741基础上改<br>T1716551在P1706611基础上改                       ', '2017-09-20 15:09:16', '2017-09-29 14:19:09', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('71', 'P1706611', 'AMCPTPA3RP', 'CMBRUN系统国内证议付功能优化项目', '朱旭鹏', null, null, '2017-09-09', 'T1701572在P1706611基础上改', '2017-09-20 15:10:39', '2017-09-20 15:10:39', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('72', 'T1701572', 'AMCPTPA3RP', '（2017年度）出口代付业务系统（风险）', '郑祺达', null, null, '2017-12-06', 'T1701572在P1706611基础上改', '2017-09-20 15:10:39', '2017-09-20 15:10:39', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('73', 'T1701572', 'AMCPTDF1RP', '（2017年度）出口代付业务系统（风险）', '郑祺达', null, null, '2017-12-06', 'T1701572在P1714571基础上改', '2017-09-20 15:12:36', '2017-09-20 15:12:36', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('74', 'P1714571', 'AMCPTDF1RP', '（2017年度）付款代理对接保灵通（福费廷）业务改造需求', '马粒君', null, null, '2017-09-19', 'T1701572在P1714571基础上改', '2017-09-20 15:12:36', '2017-09-20 15:12:36', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('75', 'T1701572', 'AMCPTBH0RP', '（2017年度）出口代付业务系统（风险）', '郑祺达', null, null, '2017-12-06', 'T1701572在T1716551基础上改                       ', '2017-09-20 15:13:34', '2017-09-20 15:14:07', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('76', 'T1716551', 'AMCPTBH0RP', '增加对公信贷业务结息周期选择等功能（FTP相关）', '郑祺达', null, null, '2017-10-02', 'T1701572在T1716551基础上改                       ', '2017-09-20 15:13:34', '2017-09-20 15:14:07', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('77', 'T1701572', 'AMBCHTS2RP', '（2017年度）出口代付业务系统（风险）', '郑祺达', null, null, '2017-12-06', '', '2017-09-20 15:15:54', '2017-09-20 15:15:54', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('78', 'P1705951', 'AMBCHTS2RP', '(H)（保证金对接改造）信用风险系统保证金管理', '周自勇', null, null, '2017-09-23', '', '2017-09-20 15:15:54', '2017-09-20 15:15:54', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('79', 'T1705872', 'AMTRSDLTRI', '（信贷流程优化）新一代国内信用证系统优化任务（风险）是大法官多个个宋高', '周自勇', null, null, '2017-09-26', '', '2017-09-20 15:18:27', '2017-09-20 15:18:27', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('80', 'T1701572', 'AMTRSDLTRI', '（2017年度）出口代付业务系统（风险）', '郑祺达', null, null, '2017-12-06', '', '2017-09-20 15:18:27', '2017-09-20 15:18:27', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('81', 'P1706611', 'AMCPTBH3RP', 'CMBRUN系统国内证议付功能优化项目', '朱旭鹏', null, null, '2017-09-09', 'P170661在P1714571基础上改                       ', '2017-09-20 15:19:05', '2017-09-20 15:19:15', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('82', 'P1714571', 'AMCPTBH3RP', '（2017年度）付款代理对接保灵通（福费廷）业务改造需求', '马粒君', null, null, '2017-09-19', 'P170661在P1714571基础上改                       ', '2017-09-20 15:19:05', '2017-09-20 15:19:15', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('83', 'P1706611', 'AMCPSINXRP', 'CMBRUN系统国内证议付功能优化项目', '朱旭鹏', null, null, '2017-09-09', 'T1708741在P1706611基础上改', '2017-09-20 15:20:02', '2017-09-20 15:20:02', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('84', 'T1708741', 'AMCPSINXRP', '黄金租赁业务规则功能调整业务', '朱旭鹏', null, null, '2017-08-22', 'T1708741在P1706611基础上改', '2017-09-20 15:20:02', '2017-09-20 15:20:02', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('85', 'P1706611', 'AMXOUSIGRP', 'CMBRUN系统国内证议付功能优化项目', '朱旭鹏', null, null, '2017-09-09', 'T1705872在P1706611基础上改', '2017-09-20 15:20:56', '2017-09-20 15:20:56', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('86', 'T1705872', 'AMXOUSIGRP', '（信贷流程优化）新一代国内信用证系统优化任务（风险）是大法官多个个宋高', '周自勇', null, null, '2017-09-26', 'T1705872在P1706611基础上改', '2017-09-20 15:20:56', '2017-09-20 15:20:56', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('87', 'P1706611', 'AMNLCCHURP', 'CMBRUN系统国内证议付功能优化项目', '朱旭鹏', null, null, '2017-09-09', 'T1705872在P1706611基础上改                       ', '2017-09-20 15:22:25', '2017-09-20 15:22:25', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('88', 'P1706611', 'AMTRSDLTRP', 'CMBRUN系统国内证议付功能优化项目', '朱旭鹏', null, null, '2017-09-09', 'P1705951在P1706611基础上改; P1705951在T1705872基础上改                       ', '2017-09-20 15:23:49', '2017-09-20 15:23:49', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('89', 'P1705951', 'AMTRSDLTRP', '(H)（保证金对接改造）信用风险系统保证金管理', '周自勇', null, null, '2017-09-23', 'P1705951在P1706611基础上改; P1705951在T1705872基础上改                       ', '2017-09-20 15:23:49', '2017-09-20 15:23:49', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('90', 'P1706611', 'AMTRSCFMRI', 'CMBRUN系统国内证议付功能优化项目', '朱旭鹏', null, null, '2017-09-09', 'P1705951在P1706611基础上改                       ', '2017-09-20 15:25:01', '2017-09-20 15:25:01', 'Admin', 'Admin');
INSERT INTO `programconflict` VALUES ('91', 'P1706611', 'AMCPTBH2RP', 'CMBRUN系统国内证议付功能优化项目', '朱旭鹏', null, null, '2017-09-09', 'P1705951在T1708741基础上改', '2017-09-20 15:26:20', '2017-09-30 16:55:57', 'Admin', 'Admin');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `ProjID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `ProjNumber` char(8) NOT NULL DEFAULT '' COMMENT '项目编号（P1706231）',
  `ProjName` varchar(255) NOT NULL DEFAULT '' COMMENT '项目名称',
  `ProjReqNum` varchar(100) DEFAULT '' COMMENT '需求编号',
  `ProjStartDate` date DEFAULT NULL COMMENT '立项时间',
  `ProjSTStartDate` date DEFAULT NULL COMMENT 'ST开始时间',
  `ProjSTEndDate` date DEFAULT NULL COMMENT 'ST结束时间(实际)',
  `ProjUATStartDate` date DEFAULT NULL COMMENT 'UAT开始时间',
  `ProjOnlineDate` date DEFAULT NULL COMMENT '计划上线时间',
  `ProjExpEndDate` date DEFAULT NULL COMMENT '计划结束时间',
  `ProjOrganizeType` char(1) NOT NULL COMMENT '主/辅办',
  `ProjPerInCharge` varchar(20) NOT NULL DEFAULT '' COMMENT '开发(项目)负责人',
  `ProjFuncPoint` float(6,2) DEFAULT NULL COMMENT '功能点估算',
  `ProjMember` varchar(100) DEFAULT '' COMMENT '其他成员',
  `ProjCurState` char(2) NOT NULL DEFAULT '' COMMENT '目前状态(01-预研,02-设计中,03-开发中,04-ST测试,05-UAT测试,06-已完成)',
  `ProjDependID` varchar(50) DEFAULT '' COMMENT '程序版本依赖关系',
  `ProjCouBusiness` varchar(100) DEFAULT NULL COMMENT '对口业务',
  `ProjRemark` varchar(200) DEFAULT '' COMMENT '备注',
  `ProjCreTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ProjModTime` datetime DEFAULT NULL COMMENT '修改时间',
  `ProjCreator` varchar(20) DEFAULT '' COMMENT '创建人',
  `ProjModifier` varchar(20) DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`ProjID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', 'T1750551', 'CVM合同资金监控程序交接', 'P1205668', '2017-01-20', '2017-08-01', '2017-09-08', '2017-09-08', '2017-03-30', '2017-09-08', '1', '陈曦', '61.50', '', '16', '版本基于 T1708741', '', '', '2017-08-25 17:23:34', '2017-09-14 19:20:47', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('2', 'P1624101', '（2016年度）客户风险总控系统二期优化', 'P1205668', '2016-12-19', '2017-09-21', '2017-03-08', '2017-09-08', '2017-04-14', '2017-09-08', '1', '陈曦', '159.10', '宋高', '16', '', '风险管理部', '', '2017-08-25 17:23:56', '2017-09-14 19:21:54', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('4', 'T1717781', '银关通担保支付功能改造任务', 'P1205668', '2017-07-03', '2017-09-19', '2017-07-28', null, '2017-08-22', null, '1', '熊小飞', '21.83', '', '16', '', '交易银行部', 'RTCSAV03/S170726056(T1717781_R1M0_XD_UAT_03_20170726_01)', '2017-09-11 15:20:33', '2017-09-14 19:27:23', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('6', 'T1706811', '信用风险管理系统国内证议付功能优化', 'R171328', '2017-04-13', '2017-09-19', '2017-08-10', null, '2017-09-09', null, '1', '朱旭鹏', '105.86', '', '15', '无', '风险管理部', '', '2017-09-11 17:09:54', '2017-09-14 16:54:26', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('7', 'P1706611', 'CMBRUN系统国内证议付功能优化项目', 'R171130', '2017-04-18', null, '2017-08-10', null, '2017-09-09', null, '2', '朱旭鹏', '105.86', '', '15', '版本基于 T1716551', '交易银行部', '', '2017-09-14 19:03:27', '2017-09-28 16:31:21', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('12', 'T1704151', '自助贷款直通二期优化改造（风险）', 'R171130', '2017-03-09', null, null, '2017-09-11', '2017-07-06', '2017-09-11', '1', '熊小飞', '15.00', '', '11', '', '小企业金融部', '39.44 RTCSAV03/S170630001<br>(T1704151_R1M0_XD_UAT_03_20170630_02)#&', '2017-09-11 18:22:10', '2017-09-29 18:32:57', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('15', 'R162171', 'GMS交易明细对接CVM需求', 'R171254', '2017-09-19', null, null, null, null, null, '2', '马粒君', null, '', '16', '', '与主办方合并立预研项目', '', '2017-09-12 09:00:18', '2017-09-12 09:00:18', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('19', 'T1705872', '（信贷流程优化）新一代国内信用证系统优化任务（风险）是大法官多个个宋高', 'R170890', '2017-07-18', null, '2017-08-25', null, '2017-09-26', null, '1', '周自勇', '52.95', '', '14', '版本基于P1705951', '交易银行部', '', '2017-09-12 18:31:47', '2017-09-15 16:05:07', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('20', 'T1701572', '（2017年度）出口代付业务系统（风险）', 'R171208', '2017-08-21', null, '2017-10-16', null, '2017-12-06', null, '1', '郑祺达', '41.39', '小张', '12', '版本基于 P1714571', '交易银行部', '#￥%%…………&**&*（）&*', '2017-09-12 19:03:23', '2017-09-29 18:15:12', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('33', 'P1714571', '（2017年度）付款代理对接保灵通（福费廷）业务改造需求', 'R171646', '2017-06-16', null, '2017-09-06', null, '2017-09-19', null, '2', '马粒君', '82.52', '', '14', '版本基于P1706611 /T1708741/ T1716551', '交易银行部', '', '2017-09-14 19:09:35', '2017-09-14 19:09:35', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('34', 'P1706231', '（2017年度）新一代同业额度管理系统开发', 'R171130', '2017-07-05', null, '2017-10-20', null, '2017-10-24', null, '1', '朱旭鹏', '1403.23', '', '14', '无', '同业客户部', '', '2017-09-14 19:13:02', '2017-09-14 19:13:02', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('35', 'T1752031', '客户风险总控系统定时任务优化（一）', 'R171328', '2017-03-06', null, '2017-04-20', null, '2017-06-05', null, '1', '宋高', null, '陈曦、陈继伟', '16', '', '无', '', '2017-09-14 19:23:31', '2017-09-14 19:23:40', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('36', 'T1712521', '信用风险系统自营非标数据移植需求（FTP相关）', 'P2017098', '2017-05-22', null, null, null, '2017-07-14', null, '1', '郑祺达', null, '', '16', '', '风险管理部', '', '2017-09-14 19:25:01', '2017-09-14 19:25:01', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('37', 'T1708741', '黄金租赁业务规则功能调整业务', 'R170890', '2017-05-15', null, '2017-08-17', null, '2017-08-22', null, '1', '朱旭鹏', '100.97', '', '16', '', '风险管理部', 'RTCSAV03/S170726056(T1717781_R1M0_XD_UAT_03_20170726_01)', '2017-09-14 19:29:00', '2017-09-14 19:29:00', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('41', 'P1715251', '东风汽车财务集团票据池银企直联项目', 'R171328', '2017-08-31', null, '2017-07-17', null, '2017-09-11', null, '2', '马粒君', null, '', '14', '无', '', '', '2017-09-15 14:21:53', '2017-09-15 14:21:53', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('42', 'T1716551', '增加对公信贷业务结息周期选择等功能（FTP相关）', 'R170890', '2017-04-03', null, '2017-08-08', null, '2017-10-02', null, '1', '郑祺达', '91.37', '', '17', '\"版本基于 T1708741\"', '风险管理部', '', '2017-09-15 14:23:31', '2017-09-20 16:26:56', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('43', 'P1705951', '(H)（保证金对接改造）信用风险系统保证金管理', 'P1205668;P2017086;P2017092;P2017098', '2017-04-06', null, '2017-08-18', null, '2017-09-23', null, '2', '周自勇', '627.89', '', '14', '版本基于 P1706611', '风险管理部', '', '2017-09-18 17:08:30', '2017-09-30 15:19:08', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('44', 'P1111112', '测试', 'P2809656;PK155800', '2017-05-16', null, null, null, null, '2017-09-14', '1', '嘻嘻', null, '', '01', '', '', '', '2017-09-20 18:46:08', '2017-09-29 11:24:22', 'Admin', 'Admin');
INSERT INTO `project` VALUES ('45', 'T2222222', '测试2', 'P2809656', '2017-09-05', null, '2017-09-15', null, '2017-09-25', '2017-09-22', '2', '', null, '', '02', '', '嘻嘻', '', '2017-09-20 18:48:00', '2017-09-20 19:32:29', 'Admin', 'Admin');

-- ----------------------------
-- Table structure for publicactivity
-- ----------------------------
DROP TABLE IF EXISTS `publicactivity`;
CREATE TABLE `publicactivity` (
  `ActID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动编号（主键ID，自增）',
  `ActContent` varchar(100) NOT NULL DEFAULT '' COMMENT '活动内容及任务',
  `ActPerInCharge` varchar(20) NOT NULL DEFAULT '' COMMENT '负责人',
  `ActProgress` varchar(20) NOT NULL DEFAULT '' COMMENT '进展情况',
  `ActCreTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ActModTime` datetime DEFAULT NULL COMMENT '修改时间',
  `ActCreator` varchar(20) DEFAULT '' COMMENT '创建人',
  `ActModifier` varchar(20) DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`ActID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicactivity
-- ----------------------------
INSERT INTO `publicactivity` VALUES ('8', '团建项目-广州长隆两日游', '宋高', '已结束', '2017-09-08 09:58:22', '2017-09-08 09:58:22', 'Admin', 'Admin');
INSERT INTO `publicactivity` VALUES ('9', '9月8号看板回顾会', '周自勇', '已结束', '2017-09-08 10:47:53', '2017-09-15 10:50:42', 'Admin', 'Admin');
INSERT INTO `publicactivity` VALUES ('10', '同业额度代码检视', '宋高', '进行中', '2017-09-08 11:05:37', '2017-09-15 10:50:47', 'Admin', 'Admin');

-- ----------------------------
-- Table structure for requirements
-- ----------------------------
DROP TABLE IF EXISTS `requirements`;
CREATE TABLE `requirements` (
  `ReqID` int(12) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统编号(主键ID自增)',
  `ReqNum` char(8) NOT NULL DEFAULT '' COMMENT '需求编号',
  `ReqName` varchar(100) NOT NULL DEFAULT '' COMMENT '需求名称',
  `ReqState` char(2) NOT NULL DEFAULT '' COMMENT '状态(01-预研,02-意向性，03-暂缓)，主要用于父级区分',
  `ReqChildState` char(2) DEFAULT '' COMMENT '内部状态 (做子状态标识)',
  `ReqAssessmentDate` date DEFAULT NULL COMMENT '需求评估日期',
  `ReqScheduleStartDate` date DEFAULT NULL COMMENT '计划启动日期',
  `ReqStartDate` date DEFAULT NULL COMMENT '立项时间',
  `ReqScheduleDate` date DEFAULT NULL COMMENT '排期（计划结束时间）',
  `ReqOrganizeType` char(1) DEFAULT '' COMMENT '主/辅办',
  `ReqPriority` char(1) DEFAULT '' COMMENT '优先级(A-最高, B-次高, C-...)',
  `ReqContent` varchar(300) DEFAULT '' COMMENT '（主要内容）需求内容',
  `ReqPerInCharge` varchar(20) NOT NULL DEFAULT '' COMMENT '负责人',
  `ReqMember` varchar(100) DEFAULT '' COMMENT '其他成员',
  `ReqAssessment` varchar(300) DEFAULT '' COMMENT '评估意见',
  `ReqAuthor` varchar(20) DEFAULT '' COMMENT '需求提交人',
  `ReqBusDepart` varchar(20) DEFAULT '' COMMENT '业务部门',
  `ReqComment` varchar(20) DEFAULT '' COMMENT '备注',
  `ReqCreTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ReqModTime` datetime DEFAULT NULL COMMENT '修改时间',
  `ReqCreator` varchar(20) DEFAULT '' COMMENT '创建人',
  `ReqModifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ReqID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of requirements
-- ----------------------------
INSERT INTO `requirements` VALUES ('1', 'R170999', '同业额度对接总控', '07', '01', '2017-09-07', '2017-09-10', '2017-09-01', '2017-09-09', '1', 'A', '对接表', '陈倩', '吴平', '通过', '小白', '总行同业管理部', '\\', '2017-09-01 17:36:58', '2017-09-19 10:54:21', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('8', 'R171910', 'CVM对接总控', '05', '01', '2017-08-28', '2017-09-07', '2017-08-18', '2017-09-30', '2', 'A', '\\', '宋高', '小宋', '\\', '\\', '同业管理部', '\\', '2017-09-04 16:38:33', '2017-09-19 10:50:34', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('9', 'R170678', '风险大数据', '04', '01', '2017-07-16', '2017-09-07', '2017-09-12', '2017-09-10', '1', 'B', '前瞻性需求', '王平', '\\', '通过', '\\', '风险管理部', '\\', '2017-09-04 16:39:56', '2017-09-19 10:55:26', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('10', 'R170980', '冲账优化', '02', '01', '2017-09-08', '2017-09-07', '2017-09-07', '2017-09-07', '2', 'A', '待定', '朱旭鹏', '', '通过', '', '信贷管理部', '', '2017-09-04 16:45:22', '2017-09-30 09:06:34', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('11', 'R170922', '部分后台维护功能前移给业务', '02', '01', '2017-09-06', '2017-09-07', '2017-09-07', '2017-09-07', '1', 'C', '如题', '周天虹', '', '通过', '', '项目管理部', '', '2017-09-04 16:46:34', '2017-09-30 09:08:38', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('12', 'R170869', '信贷系统加总开关', '02', '01', '2017-09-03', '2017-09-07', '2017-09-07', '2017-09-07', '2', 'A', 'AS400加开关', '周自勇', '', '通过', '', '信贷管理部', '', '2017-09-04 16:48:02', '2017-09-30 09:08:55', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('18', 'R170890', '（2017年度）来单备付公共模块搭建及对接进口信用证、进口代收和开出保函备付开发需求', '03', '01', '2017-06-02', '2017-09-07', '2017-09-19', '2017-09-20', '1', 'B', '2.3保证金合并经与保证金系统确认，不能直接从活期、定期保证金户收取，而是需要通过先支取到挂账单，再重新收取的方式解决，请业务修改需求； 其它：   交易银行部进口信用证、国际保函业务需求中，提出需CVM支持保证金冻结事项转换、保证金活期转定期、保证金币种转换、保证金合并功能', '周志勇', '\\', '请业务统筹考虑CVM是否开发对应功能, 如要开发，请补充并细化需求', '周志建', '风险管理部', '\\', '2017-09-05 16:13:33', '2017-09-07 16:57:30', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('23', 'R162259', '信贷增加国内保函收费功能', '06', '01', '2017-08-08', '2017-09-07', '2017-09-06', '2017-09-06', '1', 'A', '\\', '周自勇', '\\', '', '', '风险', '', '2017-09-06 11:18:06', '2017-09-19 10:43:08', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('24', 'R162451', '招商银行资产证券化业务需求', '06', '01', '2017-08-13', '2017-09-07', '2017-09-12', '2017-09-08', '1', 'B', '根据主办项目计划，对公信贷部分，一期只实现通过数仓做基础数据接入，不实现证券化系统与信贷系统的对接，信贷系统原有的资产证券化功能暂不修改，信贷提供技术支持，二期预计在17年6月开始开发。', '王平', '\\', '', '小白', '\\', '总行直属', '2017-09-06 11:27:08', '2017-09-19 10:45:10', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('25', 'R171201', '离岸核心系统贷款模块查询权限修改需求', '06', '03', '2017-09-02', '2017-09-07', '2017-09-07', '2017-09-11', '1', 'A', '人力资源排期，7月初重启', '马粒君', '\\', '', '', '\\', '\\', '2017-09-06 11:31:07', '2017-09-19 10:45:26', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('27', 'R171208', 'CVM系统增加出口代付业务品种需求（FTP相关）', '06', '01', '2017-09-12', '2017-09-07', '2017-09-07', '2017-08-17', '2', 'C', '6.19重启评估', '郑祺达', '\\', '', '', '\\', '\\', '2017-09-06 11:38:36', '2017-09-19 10:48:37', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('28', 'R171328', '票据池对接新一代同业额度系统改造', '06', '01', '2017-09-07', '2017-09-07', '2017-09-07', '2017-08-01', '2', 'C', '7月10日重启评估', '熊小飞', '\\', '', '', '\\', '\\', '2017-09-06 11:43:15', '2017-09-19 10:46:11', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('29', 'R171130', '（2017年度）运营票据综合业务处理平台', '06', '04', '2017-08-27', '2017-09-07', '2017-09-07', '2017-09-06', '1', 'C', '\\', '周连兰', '\\', '', '', '\\', '\\', '2017-09-06 14:08:49', '2017-09-19 10:48:50', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('30', 'R171646', '同业专营-信贷类自营非标投资业务系统改造需求', '06', '02', '2017-09-09', '2017-09-07', '2017-09-07', '2017-09-08', '2', 'B', '\\', '朱旭鹏', '\\', '', '', '\\', '\\', '2017-09-06 14:12:33', '2017-09-19 10:50:51', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('32', 'R172401', 'PRMS债券额度扎口管理需求', '06', '02', '2017-09-07', '2017-09-07', '2017-09-07', '2017-10-09', '2', 'A', '\\', '周自勇', '\\', '', '', '资产管理部', '\\', '2017-09-06 14:14:39', '2017-09-19 10:47:05', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('35', 'R171254', '信用风险系统黄金租赁业务数据移植需求（FTP相关）', '06', '01', '2017-05-03', '2017-09-07', '2017-09-20', '2017-09-14', '2', 'C', '预研结束，需业务按预研方案完善需求', '朱旭鹏', '\\', '退回', '周志建', '风险管理部', '\\', '2017-09-06 17:16:26', '2017-09-07 17:05:22', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('36', 'R173211', '同业额度管理系统', '07', '01', '2017-09-07', '2017-09-15', '2017-09-07', '2017-10-31', '1', 'A', '同业额度管理', '宋高', '\\', '通过', '彭湃', '同业管理部', '\\', '2017-09-06 17:16:26', '2017-09-19 10:47:18', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('37', 'R178921', '黄金租赁系统', '08', '01', '2017-09-07', '2017-09-13', '2017-09-12', '2017-09-18', '1', 'C', '信贷流程优化', '熊小飞', '\\', '\\', 'ASD', '\\', '\\', '2017-09-07 15:52:12', '2017-09-19 10:47:26', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('39', 'R171482', '深圳分行对公账户一键迁移需求', '01', '01', '2017-06-22', '2017-08-01', '2017-07-05', '2017-09-07', '2', 'A', '\\', '周自勇', '\\', '\\', '\\', '\\', '\\', '2017-09-19 10:53:36', '2017-09-19 10:53:36', 'Admin', 'Admin');
INSERT INTO `requirements` VALUES ('40', 'R170799', '（保证金对接改造）进口押汇等产品保证金自动对接功能需求', '07', '01', '2017-04-06', '2017-08-18', '2017-03-18', '2017-09-08', '1', 'B', '合并到P1705951-（保证金对接改造）信用风险系统保证金管理开发', '熊小飞', '\\', '\\', '贾素红', '交易银行部', '\\', '2017-09-19 10:58:13', '2017-09-19 10:58:13', 'Admin', 'Admin');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `RoleID` int(12) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统生成，主键',
  `RoleName` varchar(25) NOT NULL DEFAULT '' COMMENT '角色名',
  `RoleType` char(2) NOT NULL DEFAULT '' COMMENT '角色类型(PM-室经理（Project Manager）)',
  `RoleDescription` varchar(100) DEFAULT '' COMMENT '角色描述',
  `ParentRoleID` int(12) unsigned NOT NULL COMMENT '父角色ID',
  `RoleCreTime` datetime DEFAULT NULL COMMENT '创建时间',
  `RoleModTime` datetime DEFAULT NULL COMMENT '修改时间',
  `RoleCreator` varchar(20) DEFAULT '' COMMENT '创建人',
  `RoleModifier` varchar(20) DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '根角色', 'A', '\\', '0', '2017-09-12 20:38:04', '2017-09-15 10:52:08', 'Admin', 'Admin');
INSERT INTO `role` VALUES ('2', '对公信贷室经理', 'PM', '周自勇', '1', '2017-09-12 20:41:19', '2017-09-12 20:41:19', 'Admin', 'Admin');
INSERT INTO `role` VALUES ('3', '同业额度项目组长', 'PL', '宋高', '1', '2017-09-13 09:05:34', '2017-09-13 09:05:34', 'Admin', 'Admin');
INSERT INTO `role` VALUES ('5', '管理员', 'A', '\\', '1', '2017-09-15 10:53:58', '2017-09-15 10:53:58', 'Admin', 'Admin');
INSERT INTO `role` VALUES ('6', '同业额度开发员', 'CD', '\\', '1', '2017-09-15 17:47:27', '2017-09-15 17:47:27', 'Admin', 'Admin');
INSERT INTO `role` VALUES ('7', '外包员工', 'CD', '公司人力外包', '1', '2017-10-10 09:18:28', '2017-10-10 09:18:28', 'Admin', 'Admin');
INSERT INTO `role` VALUES ('8', 'AS400组', 'CD', 'AS400开发', '1', '2017-10-10 09:20:25', '2017-10-10 09:20:25', 'Admin', 'Admin');

-- ----------------------------
-- Table structure for roleauthority
-- ----------------------------
DROP TABLE IF EXISTS `roleauthority`;
CREATE TABLE `roleauthority` (
  `RoleAuthID` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统生成，主键',
  `RoleID` int(10) unsigned NOT NULL COMMENT '角色ID',
  `AuthorityID` int(20) unsigned NOT NULL COMMENT '权限ID',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyTime` datetime DEFAULT NULL COMMENT '修改时间',
  `Creator` varchar(20) DEFAULT '' COMMENT '创建人',
  `Modifier` varchar(20) DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`RoleAuthID`)
) ENGINE=InnoDB AUTO_INCREMENT=2166 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roleauthority
-- ----------------------------
INSERT INTO `roleauthority` VALUES ('1721', '2', '1', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1722', '2', '4', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1723', '2', '3', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1724', '2', '2', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1725', '2', '10', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1726', '2', '26', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1727', '2', '27', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1728', '2', '28', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1729', '2', '107', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1730', '2', '29', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1731', '2', '39', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1732', '2', '30', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1733', '2', '40', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1734', '2', '31', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1735', '2', '41', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1736', '2', '32', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1737', '2', '42', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1738', '2', '33', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1739', '2', '43', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1740', '2', '34', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1741', '2', '44', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1742', '2', '35', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1743', '2', '45', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1744', '2', '36', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1745', '2', '46', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1746', '2', '8', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1747', '2', '23', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1748', '2', '20', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1749', '2', '22', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1750', '2', '75', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1751', '2', '99', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1752', '2', '24', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1753', '2', '21', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1754', '2', '25', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1755', '2', '76', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1756', '2', '100', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1757', '2', '71', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1758', '2', '77', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1759', '2', '78', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1760', '2', '79', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1761', '2', '80', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1762', '2', '81', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1763', '2', '82', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1764', '2', '83', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1765', '2', '96', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1766', '2', '97', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1767', '2', '72', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1768', '2', '84', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1769', '2', '85', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1770', '2', '86', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1771', '2', '87', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1772', '2', '88', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1773', '2', '89', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1774', '2', '90', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1775', '2', '73', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1776', '2', '91', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1777', '2', '92', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1778', '2', '93', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1779', '2', '94', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1780', '2', '95', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1781', '2', '98', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1782', '2', '105', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1783', '2', '106', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1784', '2', '108', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1785', '2', '109', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1786', '2', '110', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1787', '2', '111', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1788', '2', '112', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1789', '2', '113', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1790', '2', '114', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1791', '2', '115', '2017-10-09 16:48:32', '2017-10-09 16:48:32', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1792', '3', '1', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1793', '3', '4', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1794', '3', '3', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1795', '3', '2', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1796', '3', '10', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1797', '3', '26', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1798', '3', '27', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1799', '3', '28', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1800', '3', '107', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1801', '3', '29', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1802', '3', '39', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1803', '3', '30', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1804', '3', '40', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1805', '3', '31', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1806', '3', '41', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1807', '3', '32', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1808', '3', '42', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1809', '3', '33', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1810', '3', '43', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1811', '3', '34', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1812', '3', '44', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1813', '3', '35', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1814', '3', '45', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1815', '3', '36', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1816', '3', '46', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1817', '3', '8', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1818', '3', '23', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1819', '3', '20', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1820', '3', '22', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1821', '3', '75', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1822', '3', '99', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1823', '3', '24', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1824', '3', '21', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1825', '3', '25', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1826', '3', '76', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1827', '3', '100', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1828', '3', '71', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1829', '3', '77', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1830', '3', '78', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1831', '3', '79', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1832', '3', '80', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1833', '3', '81', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1834', '3', '82', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1835', '3', '83', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1836', '3', '96', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1837', '3', '97', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1838', '3', '72', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1839', '3', '84', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1840', '3', '85', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1841', '3', '86', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1842', '3', '87', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1843', '3', '88', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1844', '3', '89', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1845', '3', '90', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1846', '3', '73', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1847', '3', '91', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1848', '3', '92', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1849', '3', '93', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1850', '3', '94', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1851', '3', '95', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1852', '3', '98', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1853', '3', '105', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1854', '3', '106', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1855', '3', '108', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1856', '3', '109', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1857', '3', '110', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1858', '3', '111', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1859', '3', '112', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1860', '3', '113', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1861', '3', '114', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1862', '3', '115', '2017-10-09 16:48:40', '2017-10-09 16:48:40', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1863', '5', '1', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1864', '5', '4', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1865', '5', '3', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1866', '5', '2', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1867', '5', '10', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1868', '5', '26', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1869', '5', '27', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1870', '5', '28', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1871', '5', '107', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1872', '5', '29', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1873', '5', '39', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1874', '5', '30', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1875', '5', '40', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1876', '5', '31', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1877', '5', '41', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1878', '5', '32', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1879', '5', '42', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1880', '5', '33', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1881', '5', '43', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1882', '5', '34', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1883', '5', '44', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1884', '5', '35', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1885', '5', '45', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1886', '5', '36', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1887', '5', '46', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1888', '5', '8', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1889', '5', '23', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1890', '5', '20', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1891', '5', '22', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1892', '5', '75', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1893', '5', '99', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1894', '5', '24', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1895', '5', '21', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1896', '5', '25', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1897', '5', '76', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1898', '5', '100', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1899', '5', '9', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1900', '5', '47', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1901', '5', '48', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1902', '5', '49', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1903', '5', '50', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1904', '5', '51', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1905', '5', '52', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1906', '5', '53', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1907', '5', '54', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1908', '5', '55', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1909', '5', '56', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1910', '5', '57', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1911', '5', '58', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1912', '5', '59', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1913', '5', '60', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1914', '5', '61', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1915', '5', '62', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1916', '5', '63', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1917', '5', '64', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1918', '5', '74', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1919', '5', '65', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1920', '5', '66', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1921', '5', '67', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1922', '5', '68', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1923', '5', '69', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1924', '5', '70', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1925', '5', '101', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1926', '5', '102', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1927', '5', '103', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1928', '5', '104', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1929', '5', '71', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1930', '5', '77', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1931', '5', '78', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1932', '5', '79', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1933', '5', '80', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1934', '5', '81', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1935', '5', '82', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1936', '5', '83', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1937', '5', '96', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1938', '5', '97', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1939', '5', '72', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1940', '5', '84', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1941', '5', '85', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1942', '5', '86', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1943', '5', '87', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1944', '5', '88', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1945', '5', '89', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1946', '5', '90', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1947', '5', '73', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1948', '5', '91', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1949', '5', '92', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1950', '5', '93', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1951', '5', '94', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1952', '5', '95', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1953', '5', '98', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1954', '5', '105', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1955', '5', '106', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1956', '5', '108', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1957', '5', '109', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1958', '5', '110', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1959', '5', '111', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1960', '5', '112', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1961', '5', '113', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1962', '5', '114', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1963', '5', '115', '2017-10-09 16:48:49', '2017-10-09 16:48:49', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1964', '6', '1', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1965', '6', '4', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1966', '6', '3', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1967', '6', '2', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1968', '6', '10', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1969', '6', '26', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1970', '6', '27', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1971', '6', '28', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1972', '6', '107', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1973', '6', '29', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1974', '6', '39', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1975', '6', '30', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1976', '6', '40', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1977', '6', '31', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1978', '6', '41', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1979', '6', '32', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1980', '6', '42', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1981', '6', '33', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1982', '6', '43', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1983', '6', '34', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1984', '6', '44', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1985', '6', '35', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1986', '6', '45', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1987', '6', '36', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1988', '6', '46', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1989', '6', '8', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1990', '6', '23', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1991', '6', '20', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1992', '6', '22', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1993', '6', '75', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1994', '6', '99', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1995', '6', '24', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1996', '6', '21', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1997', '6', '25', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1998', '6', '76', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('1999', '6', '100', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2000', '6', '71', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2001', '6', '77', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2002', '6', '78', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2003', '6', '79', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2004', '6', '80', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2005', '6', '81', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2006', '6', '82', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2007', '6', '83', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2008', '6', '96', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2009', '6', '97', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2010', '6', '72', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2011', '6', '84', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2012', '6', '85', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2013', '6', '86', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2014', '6', '87', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2015', '6', '88', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2016', '6', '89', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2017', '6', '90', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2018', '6', '73', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2019', '6', '91', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2020', '6', '92', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2021', '6', '93', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2022', '6', '94', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2023', '6', '95', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2024', '6', '98', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2025', '6', '105', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2026', '6', '106', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2027', '6', '108', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2028', '6', '109', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2029', '6', '110', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2030', '6', '111', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2031', '6', '112', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2032', '6', '113', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2033', '6', '114', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2034', '6', '115', '2017-10-09 16:48:59', '2017-10-09 16:48:59', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2035', '7', '1', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2036', '7', '4', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2037', '7', '3', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2038', '7', '2', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2039', '7', '10', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2040', '7', '26', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2041', '7', '27', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2042', '7', '28', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2043', '7', '107', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2044', '7', '29', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2045', '7', '39', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2046', '7', '30', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2047', '7', '40', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2048', '7', '31', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2049', '7', '41', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2050', '7', '32', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2051', '7', '42', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2052', '7', '33', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2053', '7', '43', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2054', '7', '34', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2055', '7', '44', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2056', '7', '35', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2057', '7', '45', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2058', '7', '36', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2059', '7', '46', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2060', '7', '71', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2061', '7', '77', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2062', '7', '78', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2063', '7', '79', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2064', '7', '80', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2065', '7', '81', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2066', '7', '82', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2067', '7', '83', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2068', '7', '96', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2069', '7', '97', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2070', '7', '72', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2071', '7', '84', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2072', '7', '85', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2073', '7', '86', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2074', '7', '87', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2075', '7', '88', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2076', '7', '89', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2077', '7', '90', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2078', '7', '73', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2079', '7', '91', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2080', '7', '92', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2081', '7', '93', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2082', '7', '94', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2083', '7', '95', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2084', '7', '98', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2085', '7', '105', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2086', '7', '106', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2087', '7', '108', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2088', '7', '109', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2089', '7', '110', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2090', '7', '111', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2091', '7', '112', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2092', '7', '113', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2093', '7', '114', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2094', '7', '115', '2017-10-10 09:19:11', '2017-10-10 09:19:11', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2095', '8', '1', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2096', '8', '4', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2097', '8', '3', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2098', '8', '2', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2099', '8', '10', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2100', '8', '26', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2101', '8', '27', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2102', '8', '28', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2103', '8', '107', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2104', '8', '29', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2105', '8', '39', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2106', '8', '30', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2107', '8', '40', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2108', '8', '31', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2109', '8', '41', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2110', '8', '32', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2111', '8', '42', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2112', '8', '33', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2113', '8', '43', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2114', '8', '34', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2115', '8', '44', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2116', '8', '35', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2117', '8', '45', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2118', '8', '36', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2119', '8', '46', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2120', '8', '8', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2121', '8', '23', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2122', '8', '20', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2123', '8', '22', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2124', '8', '75', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2125', '8', '99', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2126', '8', '24', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2127', '8', '21', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2128', '8', '25', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2129', '8', '76', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2130', '8', '100', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2131', '8', '71', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2132', '8', '77', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2133', '8', '78', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2134', '8', '79', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2135', '8', '80', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2136', '8', '81', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2137', '8', '82', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2138', '8', '83', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2139', '8', '96', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2140', '8', '97', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2141', '8', '72', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2142', '8', '84', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2143', '8', '85', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2144', '8', '86', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2145', '8', '87', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2146', '8', '88', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2147', '8', '89', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2148', '8', '90', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2149', '8', '73', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2150', '8', '91', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2151', '8', '92', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2152', '8', '93', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2153', '8', '94', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2154', '8', '95', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2155', '8', '98', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2156', '8', '105', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2157', '8', '106', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2158', '8', '108', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2159', '8', '109', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2160', '8', '110', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2161', '8', '111', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2162', '8', '112', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2163', '8', '113', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2164', '8', '114', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');
INSERT INTO `roleauthority` VALUES ('2165', '8', '115', '2017-10-10 09:20:47', '2017-10-10 09:20:47', 'Admin', 'Admin');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `UserWorkID` char(8) NOT NULL DEFAULT '' COMMENT '用户工号',
  `UserPassword` varchar(20) NOT NULL DEFAULT '' COMMENT '登录密码',
  `UserName` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `UserMobile` char(11) DEFAULT '' COMMENT '手机号码',
  `UserEmail` varchar(50) DEFAULT '' COMMENT '邮箱',
  `GroupName` varchar(20) DEFAULT '' COMMENT '团队名（风险团队）',
  `DevRoom` varchar(20) DEFAULT '' COMMENT '开发室',
  `UserPass` char(32) DEFAULT '' COMMENT '32位加密密码',
  `UserCreTime` datetime DEFAULT NULL COMMENT '创建时间',
  `UserModTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UserCreator` varchar(20) DEFAULT '' COMMENT '创建人',
  `UserModifier` varchar(20) DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '12234909', '123456', '吴平', '18765916881', 'test@163.com', '风险业务开发团队', '对公信贷开发室', '', '2017-08-24 09:47:52', '2017-09-11 16:46:21', 'Admin', 'Admin');
INSERT INTO `user` VALUES ('2', '12234900', '123456', '陈倩', '12562018018', 'test@163.com', '风险业务开发团队', '对公信贷开发室', '', '2017-08-25 08:59:55', '2017-09-11 16:46:16', 'Admin', 'Admin');

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `UserRoleID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统生成，主键',
  `UserID` int(20) unsigned NOT NULL COMMENT '用户ID',
  `RoleID` int(10) unsigned NOT NULL COMMENT '角色ID',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyTime` datetime DEFAULT NULL COMMENT '修改时间',
  `Creator` varchar(20) DEFAULT '' COMMENT '创建人',
  `Modifier` varchar(20) DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`UserRoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES ('38', '4', '1', '2017-09-22 10:17:54', '2017-09-22 10:17:54', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('39', '4', '2', '2017-09-22 10:17:54', '2017-09-22 10:17:54', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('40', '5', '1', '2017-09-22 10:17:59', '2017-09-22 10:17:59', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('41', '5', '3', '2017-09-22 10:17:59', '2017-09-22 10:17:59', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('44', '1', '1', '2017-09-22 10:18:17', '2017-09-22 10:18:17', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('45', '1', '5', '2017-09-22 10:18:17', '2017-09-22 10:18:17', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('46', '2', '1', '2017-09-22 10:31:10', '2017-09-22 10:31:10', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('47', '2', '5', '2017-09-22 10:31:10', '2017-09-22 10:31:10', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('48', '7', '1', '2017-09-26 16:22:55', '2017-09-26 16:22:55', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('49', '7', '6', '2017-09-26 16:22:55', '2017-09-26 16:22:55', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('50', '8', '1', '2017-09-26 16:23:01', '2017-09-26 16:23:01', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('51', '8', '6', '2017-09-26 16:23:01', '2017-09-26 16:23:01', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('52', '18', '1', '2017-10-10 09:19:27', '2017-10-10 09:19:27', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('53', '18', '7', '2017-10-10 09:19:27', '2017-10-10 09:19:27', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('54', '17', '1', '2017-10-10 09:19:32', '2017-10-10 09:19:32', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('55', '17', '7', '2017-10-10 09:19:32', '2017-10-10 09:19:32', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('58', '9', '1', '2017-10-10 09:21:03', '2017-10-10 09:21:03', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('59', '9', '8', '2017-10-10 09:21:03', '2017-10-10 09:21:03', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('60', '10', '1', '2017-10-10 09:21:10', '2017-10-10 09:21:10', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('61', '10', '8', '2017-10-10 09:21:10', '2017-10-10 09:21:10', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('62', '11', '1', '2017-10-10 09:21:16', '2017-10-10 09:21:16', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('63', '11', '8', '2017-10-10 09:21:16', '2017-10-10 09:21:16', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('64', '12', '1', '2017-10-10 09:21:22', '2017-10-10 09:21:22', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('65', '12', '8', '2017-10-10 09:21:22', '2017-10-10 09:21:22', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('66', '13', '1', '2017-10-10 09:21:27', '2017-10-10 09:21:27', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('67', '13', '8', '2017-10-10 09:21:27', '2017-10-10 09:21:27', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('68', '14', '1', '2017-10-10 09:21:32', '2017-10-10 09:21:32', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('69', '14', '8', '2017-10-10 09:21:32', '2017-10-10 09:21:32', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('70', '15', '1', '2017-10-10 09:21:37', '2017-10-10 09:21:37', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('71', '15', '8', '2017-10-10 09:21:37', '2017-10-10 09:21:37', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('72', '16', '1', '2017-10-10 09:21:44', '2017-10-10 09:21:44', 'Admin', 'Admin');
INSERT INTO `userrole` VALUES ('73', '16', '8', '2017-10-10 09:21:44', '2017-10-10 09:21:44', 'Admin', 'Admin');
