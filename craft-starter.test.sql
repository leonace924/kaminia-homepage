/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : craft-starter.test

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-08-17 20:42:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for assetindexdata
-- ----------------------------
DROP TABLE IF EXISTS `assetindexdata`;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assetindexdata
-- ----------------------------

-- ----------------------------
-- Table structure for assets
-- ----------------------------
DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  KEY `assets_uploaderId_fk` (`uploaderId`),
  CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets
-- ----------------------------
INSERT INTO `assets` VALUES ('23', '1', '1', '1', 'banner-bg.png', 'image', '1920', '1080', '8308973', null, '0', '0', '2020-08-17 10:01:36', '2020-08-17 10:01:37', '2020-08-17 10:01:37', '76d289c1-5923-4584-87e8-0a8970c64dd5');
INSERT INTO `assets` VALUES ('41', '1', '4', '1', 'banner-bg.png', 'image', '1920', '1080', '8308973', null, null, null, '2020-08-17 11:25:57', '2020-08-17 11:25:57', '2020-08-17 11:26:01', 'a760d58b-5a77-4c62-81b8-e180b0b07bda');
INSERT INTO `assets` VALUES ('44', '1', '4', '1', 'bannerBg.jpg', 'image', '2560', '1600', '585901', null, null, null, '2020-08-17 11:48:16', '2020-08-17 11:48:16', '2020-08-17 11:48:16', '4ed7023f-c369-40a1-bc8f-7d4db5dfdaaa');
INSERT INTO `assets` VALUES ('45', '1', '4', '1', 'landscape.jpg', 'image', '1920', '1080', '479245', null, null, null, '2020-08-17 11:48:34', '2020-08-17 11:48:34', '2020-08-17 11:48:34', '9621c382-1cf2-4026-9432-307e8a5acd2c');
INSERT INTO `assets` VALUES ('48', '1', '1', '1', 'photo-1.jpg', 'image', '1350', '900', '272106', null, null, null, '2020-08-17 12:11:34', '2020-08-17 12:11:34', '2020-08-17 12:11:34', '9486e16b-cdb9-4dfe-89f9-075b64e3c404');
INSERT INTO `assets` VALUES ('49', '1', '1', '1', 'photo-2.jpg', 'image', '1378', '886', '122619', null, null, null, '2020-08-17 12:12:25', '2020-08-17 12:11:47', '2020-08-17 12:12:25', 'd3f2296a-9098-4082-83c5-53c0a36793ec');
INSERT INTO `assets` VALUES ('50', '1', '4', '1', 'photo-1.jpg', 'image', '1350', '900', '272106', null, null, null, '2020-08-17 12:12:13', '2020-08-17 12:12:13', '2020-08-17 12:12:13', '926ca9f6-d133-4d4a-a64d-570ddf732a4e');
INSERT INTO `assets` VALUES ('51', '1', '1', '1', 'photo-2_2020-08-17-121220.jpg', 'image', '1378', '886', '122569', null, '0', '0', '2020-08-17 12:12:20', '2020-08-17 12:12:20', '2020-08-17 12:12:20', '373618fc-4240-4900-90b2-63962cb082c1');
INSERT INTO `assets` VALUES ('52', '1', '4', '1', 'photo-2.jpg', 'image', '1378', '886', '122569', null, null, null, '2020-08-17 12:12:29', '2020-08-17 12:12:30', '2020-08-17 12:12:30', 'd6422472-e2bf-4acc-960c-82fc3efded1b');
INSERT INTO `assets` VALUES ('53', '1', '4', '1', 'photo-3.jpg', 'image', '1400', '875', '303762', null, null, null, '2020-08-17 12:12:42', '2020-08-17 12:12:42', '2020-08-17 12:12:42', '51d9a31e-0b3e-4f12-a2d5-698f56cd83e1');

-- ----------------------------
-- Table structure for assettransformindex
-- ----------------------------
DROP TABLE IF EXISTS `assettransformindex`;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assettransformindex
-- ----------------------------

-- ----------------------------
-- Table structure for assettransforms
-- ----------------------------
DROP TABLE IF EXISTS `assettransforms`;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransforms_name_idx` (`name`),
  KEY `assettransforms_handle_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assettransforms
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  KEY `categories_parentId_fk` (`parentId`),
  CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------

-- ----------------------------
-- Table structure for categorygroups
-- ----------------------------
DROP TABLE IF EXISTS `categorygroups`;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categorygroups_name_idx` (`name`),
  KEY `categorygroups_handle_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorygroups
-- ----------------------------

-- ----------------------------
-- Table structure for categorygroups_sites
-- ----------------------------
DROP TABLE IF EXISTS `categorygroups_sites`;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorygroups_sites
-- ----------------------------

-- ----------------------------
-- Table structure for changedattributes
-- ----------------------------
DROP TABLE IF EXISTS `changedattributes`;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedattributes_siteId_fk` (`siteId`),
  KEY `changedattributes_userId_fk` (`userId`),
  CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of changedattributes
-- ----------------------------
INSERT INTO `changedattributes` VALUES ('2', '1', 'uri', '2020-08-17 06:45:52', '0', '1');

-- ----------------------------
-- Table structure for changedfields
-- ----------------------------
DROP TABLE IF EXISTS `changedfields`;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedfields_siteId_fk` (`siteId`),
  KEY `changedfields_fieldId_fk` (`fieldId`),
  KEY `changedfields_userId_fk` (`userId`),
  CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of changedfields
-- ----------------------------
INSERT INTO `changedfields` VALUES ('16', '1', '4', '2020-08-17 11:17:39', '0', '1');
INSERT INTO `changedfields` VALUES ('16', '1', '5', '2020-08-17 11:48:39', '0', '1');
INSERT INTO `changedfields` VALUES ('16', '1', '6', '2020-08-17 11:48:39', '0', '1');
INSERT INTO `changedfields` VALUES ('16', '1', '7', '2020-08-17 12:12:48', '0', '1');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_bannerTitle` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`),
  CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('1', '1', '1', null, '2020-08-15 09:20:02', '2020-08-15 09:20:02', 'b33b3281-1911-4623-9d9a-f8c1c29ed829', null);
INSERT INTO `content` VALUES ('2', '2', '1', 'Home', '2020-08-17 06:44:22', '2020-08-17 06:46:06', '6dc22a16-e41c-49a8-96ba-67148cc8bd1f', null);
INSERT INTO `content` VALUES ('3', '3', '1', 'Home', '2020-08-17 06:44:23', '2020-08-17 06:44:23', 'e5a5f1bf-b82e-459b-9f18-24b1c35f001b', null);
INSERT INTO `content` VALUES ('4', '4', '1', 'Home', '2020-08-17 06:44:23', '2020-08-17 06:44:23', '574cd319-23f1-46e8-9004-5cd7b438fceb', null);
INSERT INTO `content` VALUES ('5', '5', '1', 'Home', '2020-08-17 06:45:52', '2020-08-17 06:45:52', '84640654-b6ba-431d-b2e1-b044a46f96b1', null);
INSERT INTO `content` VALUES ('6', '6', '1', 'Home', '2020-08-17 06:45:53', '2020-08-17 06:45:53', '1fc2217a-b134-4011-a309-46081d5a93e5', null);
INSERT INTO `content` VALUES ('7', '7', '1', 'Home', '2020-08-17 06:46:05', '2020-08-17 06:46:05', '16aa78f2-4cb5-4a47-85e2-0fc0ee3b05e6', null);
INSERT INTO `content` VALUES ('8', '8', '1', 'Home', '2020-08-17 06:46:06', '2020-08-17 06:46:06', 'ebddf3d7-01e3-48c1-8446-3b87a2003c90', null);
INSERT INTO `content` VALUES ('9', '9', '1', 'Home', '2020-08-17 09:07:13', '2020-08-17 09:30:27', 'c5cb86e9-5abf-4ab8-973f-a457ff168eab', null);
INSERT INTO `content` VALUES ('10', '10', '1', 'Home', '2020-08-17 09:07:13', '2020-08-17 09:07:13', 'f95cb7df-07fb-4bf3-a1cf-e2b5904527bf', null);
INSERT INTO `content` VALUES ('11', '11', '1', 'Home', '2020-08-17 09:07:14', '2020-08-17 09:07:14', 'a39f9efe-f47b-487f-8f25-33fac9d5b14c', null);
INSERT INTO `content` VALUES ('12', '12', '1', 'Home', '2020-08-17 09:28:23', '2020-08-17 09:28:23', '04b922f1-e75e-4d25-87bc-1e8266cb3a64', null);
INSERT INTO `content` VALUES ('13', '13', '1', 'Home', '2020-08-17 09:28:24', '2020-08-17 09:28:24', '054d8b66-74f6-478d-bedd-462f30963bae', null);
INSERT INTO `content` VALUES ('14', '14', '1', 'Home', '2020-08-17 09:28:26', '2020-08-17 09:28:26', '10904f14-0c9f-454c-b812-b324880cd35f', null);
INSERT INTO `content` VALUES ('15', '15', '1', 'Home', '2020-08-17 09:30:27', '2020-08-17 09:30:27', '5cf0679a-dc8c-4d29-9742-b2cbf39b3efa', null);
INSERT INTO `content` VALUES ('16', '16', '1', 'Homepage', '2020-08-17 09:31:06', '2020-08-17 12:17:30', 'be33e5c3-a26e-451b-8a2e-b57198b81a89', 'Welcome to your luxury hillside retreat');
INSERT INTO `content` VALUES ('17', '17', '1', 'Homepage', '2020-08-17 09:31:06', '2020-08-17 09:31:06', '8bff709e-c910-47f4-8c45-2de1a095f9b9', null);
INSERT INTO `content` VALUES ('18', '18', '1', 'Homepage', '2020-08-17 09:31:08', '2020-08-17 09:31:08', '5630e7ee-7fb0-4397-a105-0b373dafb636', null);
INSERT INTO `content` VALUES ('19', '19', '1', 'Homepage', '2020-08-17 09:31:24', '2020-08-17 09:31:24', 'e433bebb-7acd-4cc8-aad2-9df1b19747fe', null);
INSERT INTO `content` VALUES ('20', '20', '1', 'Homepage', '2020-08-17 09:31:25', '2020-08-17 09:31:25', '5c017ffb-063c-4718-9930-405ddf7cc659', null);
INSERT INTO `content` VALUES ('21', '21', '1', 'Homepage', '2020-08-17 09:31:45', '2020-08-17 09:31:45', '2ac3432a-7e0f-477c-a1bd-f28b55c5eab3', null);
INSERT INTO `content` VALUES ('22', '22', '1', 'Homepage', '2020-08-17 09:40:23', '2020-08-17 09:40:23', 'db8a4392-25ab-4f24-81ad-7e6245412090', null);
INSERT INTO `content` VALUES ('23', '23', '1', 'Banner bg', '2020-08-17 10:01:33', '2020-08-17 10:01:33', 'a0ef7898-96a8-4b6b-86b7-64261885e9fa', null);
INSERT INTO `content` VALUES ('24', '25', '1', 'Homepage', '2020-08-17 10:23:26', '2020-08-17 10:23:26', '83575bfb-3b90-4ce9-bfbe-7b04c9f03eae', null);
INSERT INTO `content` VALUES ('25', '27', '1', 'Homepage', '2020-08-17 10:26:05', '2020-08-17 10:26:05', '769131f6-7c54-42fd-ba96-e088b17d4f0a', null);
INSERT INTO `content` VALUES ('26', '29', '1', 'Homepage', '2020-08-17 10:26:05', '2020-08-17 10:26:05', 'd914d008-4447-436e-ade1-1b77b4ae0c80', null);
INSERT INTO `content` VALUES ('27', '31', '1', 'Homepage', '2020-08-17 10:26:36', '2020-08-17 10:26:36', 'b0682980-56a0-462a-9f91-a053ac2ce36a', null);
INSERT INTO `content` VALUES ('28', '33', '1', 'Homepage', '2020-08-17 10:26:37', '2020-08-17 10:26:37', '2e059616-080d-498c-8cc2-d5d41bb3ede0', null);
INSERT INTO `content` VALUES ('29', '35', '1', 'Homepage', '2020-08-17 10:50:10', '2020-08-17 10:50:10', 'eeeff283-48b9-4842-aed3-9ddb5f6fa1ca', null);
INSERT INTO `content` VALUES ('30', '37', '1', 'Homepage', '2020-08-17 11:15:00', '2020-08-17 11:15:00', '96a9fc0b-00bc-45db-9230-5189af98b1a6', null);
INSERT INTO `content` VALUES ('31', '38', '1', 'Homepage', '2020-08-17 11:16:59', '2020-08-17 11:16:59', '3c2f6fbe-aed2-439c-a39b-00f43956378d', null);
INSERT INTO `content` VALUES ('32', '40', '1', 'Homepage', '2020-08-17 11:17:38', '2020-08-17 11:17:38', '2e7a69d4-b468-4c41-ba0a-6faf888066d8', 'Welcome to your luxury hillside retreat');
INSERT INTO `content` VALUES ('33', '41', '1', 'Banner bg', '2020-08-17 11:25:55', '2020-08-17 11:26:01', 'f60465d7-9b8f-40af-bd54-c5f688d3856b', null);
INSERT INTO `content` VALUES ('34', '42', '1', 'Homepage', '2020-08-17 11:26:07', '2020-08-17 11:26:07', '444d1a31-79a9-4b15-aafd-af86f3e2f1e7', 'Welcome to your luxury hillside retreat');
INSERT INTO `content` VALUES ('35', '43', '1', 'Homepage', '2020-08-17 11:45:48', '2020-08-17 11:45:48', '6ab4c338-4e88-40dd-bac5-31e45d6f2144', 'Welcome to your luxury hillside retreat');
INSERT INTO `content` VALUES ('36', '44', '1', 'Banner Bg', '2020-08-17 11:48:16', '2020-08-17 11:48:16', '54f891b3-d4f4-4355-bf56-b8f587db3b2b', null);
INSERT INTO `content` VALUES ('37', '45', '1', 'Landscape', '2020-08-17 11:48:33', '2020-08-17 11:48:33', '7d115d56-9c32-460f-8eb4-82711b1dbbed', null);
INSERT INTO `content` VALUES ('38', '46', '1', 'Homepage', '2020-08-17 11:48:39', '2020-08-17 11:48:39', '93a9923d-f0cd-4926-a948-37c819123bac', 'Welcome to your luxury hillside retreat');
INSERT INTO `content` VALUES ('39', '47', '1', 'Homepage', '2020-08-17 12:10:22', '2020-08-17 12:10:22', '73a65438-660f-4afd-a996-4dfe78c0223b', 'Welcome to your luxury hillside retreat');
INSERT INTO `content` VALUES ('40', '48', '1', 'Photo 1', '2020-08-17 12:11:33', '2020-08-17 12:11:33', 'eac234f3-5143-4eed-9b69-67dab2992198', null);
INSERT INTO `content` VALUES ('41', '49', '1', 'Photo 2', '2020-08-17 12:11:47', '2020-08-17 12:12:24', '1ab84def-8eca-4e79-ad74-b68a44904d6a', null);
INSERT INTO `content` VALUES ('42', '50', '1', 'Photo 1', '2020-08-17 12:12:13', '2020-08-17 12:12:13', 'c130f159-ba1c-4e4e-a12c-c0f8c914b3e0', null);
INSERT INTO `content` VALUES ('43', '51', '1', 'Photo 2', '2020-08-17 12:12:20', '2020-08-17 12:12:20', 'a0b3c1a8-de34-407e-83a6-7ae168f24671', null);
INSERT INTO `content` VALUES ('44', '52', '1', 'Photo 2', '2020-08-17 12:12:29', '2020-08-17 12:12:29', '4ddce5a3-aef7-4425-be04-a53cd80933d8', null);
INSERT INTO `content` VALUES ('45', '53', '1', 'Photo 3', '2020-08-17 12:12:41', '2020-08-17 12:12:41', 'b065e177-f2ed-4ca7-83e8-14602ae90136', null);
INSERT INTO `content` VALUES ('46', '57', '1', 'Homepage', '2020-08-17 12:12:47', '2020-08-17 12:12:47', 'f0ca4904-9256-4274-803d-7675c79a5d68', 'Welcome to your luxury hillside retreat');
INSERT INTO `content` VALUES ('47', '61', '1', 'Homepage', '2020-08-17 12:16:34', '2020-08-17 12:16:34', 'd362ec62-e2c4-4e26-a933-38f640e5745e', 'Welcome to your luxury hillside retreat');
INSERT INTO `content` VALUES ('48', '65', '1', 'Homepage', '2020-08-17 12:17:30', '2020-08-17 12:17:30', 'fafd2745-e1ef-423c-8776-b434a079fb40', 'Welcome to your luxury hillside retreat');

-- ----------------------------
-- Table structure for craftidtokens
-- ----------------------------
DROP TABLE IF EXISTS `craftidtokens`;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of craftidtokens
-- ----------------------------

-- ----------------------------
-- Table structure for deprecationerrors
-- ----------------------------
DROP TABLE IF EXISTS `deprecationerrors`;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deprecationerrors
-- ----------------------------

-- ----------------------------
-- Table structure for drafts
-- ----------------------------
DROP TABLE IF EXISTS `drafts`;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drafts_creatorId_fk` (`creatorId`),
  KEY `drafts_sourceId_fk` (`sourceId`),
  CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drafts
-- ----------------------------

-- ----------------------------
-- Table structure for elementindexsettings
-- ----------------------------
DROP TABLE IF EXISTS `elementindexsettings`;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elementindexsettings
-- ----------------------------

-- ----------------------------
-- Table structure for elements
-- ----------------------------
DROP TABLE IF EXISTS `elements`;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_dateDeleted_idx` (`dateDeleted`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  KEY `elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `elements_draftId_fk` (`draftId`),
  KEY `elements_revisionId_fk` (`revisionId`),
  CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elements
-- ----------------------------
INSERT INTO `elements` VALUES ('1', null, null, null, 'craft\\elements\\User', '1', '0', '2020-08-15 09:20:02', '2020-08-15 09:20:02', null, 'aa1b9de4-5e98-4a06-9797-0d48baa1b9dd');
INSERT INTO `elements` VALUES ('2', null, null, '1', 'craft\\elements\\Entry', '1', '0', '2020-08-17 06:44:22', '2020-08-17 06:46:06', '2020-08-17 06:53:02', 'ac80052d-5a9c-47af-b55d-3ee33c88b1e9');
INSERT INTO `elements` VALUES ('3', null, '1', '1', 'craft\\elements\\Entry', '1', '0', '2020-08-17 06:44:22', '2020-08-17 06:44:22', '2020-08-17 06:53:02', 'd950153b-8d94-4ed6-81b8-07ea4be1e14a');
INSERT INTO `elements` VALUES ('4', null, '2', '1', 'craft\\elements\\Entry', '1', '0', '2020-08-17 06:44:23', '2020-08-17 06:44:23', '2020-08-17 06:53:02', '8c9597c4-2ce1-4299-bdfa-c67983f4e30a');
INSERT INTO `elements` VALUES ('5', null, '3', '1', 'craft\\elements\\Entry', '1', '0', '2020-08-17 06:45:52', '2020-08-17 06:45:52', '2020-08-17 06:53:02', '307b3e62-3d0f-4956-85f7-5077ffadc291');
INSERT INTO `elements` VALUES ('6', null, '4', '1', 'craft\\elements\\Entry', '1', '0', '2020-08-17 06:45:53', '2020-08-17 06:45:53', '2020-08-17 06:53:02', '6770b7ec-389f-4dc5-b90f-95f5d5030ced');
INSERT INTO `elements` VALUES ('7', null, '5', '1', 'craft\\elements\\Entry', '1', '0', '2020-08-17 06:46:05', '2020-08-17 06:46:05', '2020-08-17 06:53:02', 'bd78c098-cd6b-44b1-9b33-468529511e0e');
INSERT INTO `elements` VALUES ('8', null, '6', '1', 'craft\\elements\\Entry', '1', '0', '2020-08-17 06:46:06', '2020-08-17 06:46:06', '2020-08-17 06:53:02', '5502e5fb-a6cf-47e5-a124-5c8edb67e15f');
INSERT INTO `elements` VALUES ('9', null, null, '2', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:07:13', '2020-08-17 09:30:26', '2020-08-17 09:30:53', '99762afe-4a57-4d79-8c23-11d7b576b333');
INSERT INTO `elements` VALUES ('10', null, '7', '2', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:07:13', '2020-08-17 09:07:13', '2020-08-17 09:30:53', '7d759889-f873-4488-b4ec-9a20011d1b29');
INSERT INTO `elements` VALUES ('11', null, '8', '2', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:07:14', '2020-08-17 09:07:14', '2020-08-17 09:30:53', 'a021211f-fca7-4eac-a288-5b22e4a7fef8');
INSERT INTO `elements` VALUES ('12', null, '9', '2', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:28:22', '2020-08-17 09:28:22', '2020-08-17 09:30:53', '77613d52-ac5a-42b5-83a4-86c77fdc4a4f');
INSERT INTO `elements` VALUES ('13', null, '10', '2', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:28:24', '2020-08-17 09:28:24', '2020-08-17 09:30:53', '79d2177d-c16c-4f76-90a9-98e7242056d0');
INSERT INTO `elements` VALUES ('14', null, '11', '2', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:28:25', '2020-08-17 09:28:25', '2020-08-17 09:30:53', '13e93acf-7556-4514-8264-fac766237235');
INSERT INTO `elements` VALUES ('15', null, '12', '2', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:30:26', '2020-08-17 09:30:26', '2020-08-17 09:30:53', '1fe074c4-7f1f-4355-a2b2-95ac79786d3b');
INSERT INTO `elements` VALUES ('16', null, null, '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:31:06', '2020-08-17 12:17:30', null, 'fa42d06a-f41c-4fdd-a8ad-9b23676924f2');
INSERT INTO `elements` VALUES ('17', null, '13', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:31:06', '2020-08-17 09:31:06', null, '914c6568-352d-4a11-b72a-a23c425b869e');
INSERT INTO `elements` VALUES ('18', null, '14', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:31:07', '2020-08-17 09:31:07', null, '0733e42e-4cc4-4c79-8e15-093bbbca2f6f');
INSERT INTO `elements` VALUES ('19', null, '15', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:31:23', '2020-08-17 09:31:23', null, '9d1fdcab-69ca-4ef1-91e7-db9646ab6e5b');
INSERT INTO `elements` VALUES ('20', null, '16', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:31:24', '2020-08-17 09:31:24', null, '0cea3154-775a-4c3b-8f0b-2227cca83eaf');
INSERT INTO `elements` VALUES ('21', null, '17', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:31:45', '2020-08-17 09:31:45', null, '9b2bfee3-2e34-4c80-b3a7-93545edf57a4');
INSERT INTO `elements` VALUES ('22', null, '18', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 09:40:23', '2020-08-17 09:40:23', null, '7bdd6ec2-e806-423b-b8e7-7fd54411ef29');
INSERT INTO `elements` VALUES ('23', null, null, '5', 'craft\\elements\\Asset', '1', '0', '2020-08-17 10:01:33', '2020-08-17 10:01:33', '2020-08-17 11:23:59', '5b47dc5d-d994-418d-a044-4e5c6a2c0f77');
INSERT INTO `elements` VALUES ('24', null, null, '4', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 10:23:25', '2020-08-17 10:23:25', '2020-08-17 11:17:38', 'fcc8852d-c9c1-471d-9d89-4753a814cdaf');
INSERT INTO `elements` VALUES ('25', null, '19', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 10:23:25', '2020-08-17 10:23:25', null, 'a67aa9cc-d450-4e76-b92d-633c9ce3686e');
INSERT INTO `elements` VALUES ('26', null, null, '4', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 10:23:26', '2020-08-17 10:23:25', null, '8474b2e7-6ff3-4598-b609-c3cf3f883079');
INSERT INTO `elements` VALUES ('27', null, '20', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 10:26:04', '2020-08-17 10:26:04', null, 'cbbae197-d00d-4791-b25d-f475539719cc');
INSERT INTO `elements` VALUES ('28', null, null, '4', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 10:26:05', '2020-08-17 10:23:25', null, '3a5ec787-e3f2-4f11-b091-2fb61f4a0abc');
INSERT INTO `elements` VALUES ('29', null, '21', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 10:26:05', '2020-08-17 10:26:05', null, '9c188a3d-cb15-43f3-90e8-f92c51c9d524');
INSERT INTO `elements` VALUES ('30', null, null, '4', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 10:26:05', '2020-08-17 10:23:25', null, 'a68dbb40-890a-49b6-a7d3-21b63026b710');
INSERT INTO `elements` VALUES ('31', null, '22', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 10:26:36', '2020-08-17 10:26:36', null, '40b0e9f9-138f-43b7-b6a6-72546145d5b2');
INSERT INTO `elements` VALUES ('32', null, null, '4', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 10:26:36', '2020-08-17 10:23:25', null, 'e30369e7-e71d-48ea-ac23-537061958871');
INSERT INTO `elements` VALUES ('33', null, '23', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 10:26:37', '2020-08-17 10:26:37', null, '6c9cc959-3416-445f-9799-b363cf88a2a7');
INSERT INTO `elements` VALUES ('34', null, null, '4', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 10:26:38', '2020-08-17 10:23:25', null, 'd11301a0-26e5-4272-aa4d-dbf3c15cd396');
INSERT INTO `elements` VALUES ('35', null, '24', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 10:50:10', '2020-08-17 10:50:10', null, '4864773f-3ed9-4350-9ea1-3f9843e69599');
INSERT INTO `elements` VALUES ('36', null, null, '4', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 10:50:11', '2020-08-17 10:23:25', null, '3d175919-efef-4d10-a564-e3d81a410cd6');
INSERT INTO `elements` VALUES ('37', null, '25', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 11:14:59', '2020-08-17 11:14:59', null, 'aa6111be-ce88-411a-acb0-a0cfb4f9f335');
INSERT INTO `elements` VALUES ('38', null, '26', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 11:16:59', '2020-08-17 11:16:59', null, 'dbf2eca8-dbf1-4fea-8ca5-8c6decdcd1b3');
INSERT INTO `elements` VALUES ('39', null, null, '4', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 11:16:59', '2020-08-17 10:23:25', null, 'f0f33310-1a6f-4050-a0a6-637c97405dd6');
INSERT INTO `elements` VALUES ('40', null, '27', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 11:17:38', '2020-08-17 11:17:38', null, '446ffe79-5fe2-48af-9af6-fb11ee2bb748');
INSERT INTO `elements` VALUES ('41', null, null, '5', 'craft\\elements\\Asset', '1', '0', '2020-08-17 11:25:55', '2020-08-17 11:26:01', null, '6efb110e-42fc-4bb3-81f9-478494dacb92');
INSERT INTO `elements` VALUES ('42', null, '28', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 11:26:06', '2020-08-17 11:26:06', null, '8a2c69b3-ffd4-4fad-ba44-83202c6acaa9');
INSERT INTO `elements` VALUES ('43', null, '29', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 11:45:48', '2020-08-17 11:45:48', null, 'e62a03b6-b6af-48a4-a47d-d0ca4b09714e');
INSERT INTO `elements` VALUES ('44', null, null, '5', 'craft\\elements\\Asset', '1', '0', '2020-08-17 11:48:16', '2020-08-17 11:48:16', null, 'bea83b83-71b7-49c6-8cd8-a599410b6e81');
INSERT INTO `elements` VALUES ('45', null, null, '5', 'craft\\elements\\Asset', '1', '0', '2020-08-17 11:48:33', '2020-08-17 11:48:33', null, '36d0f8f4-0555-4b15-a2dd-614a9897ebd8');
INSERT INTO `elements` VALUES ('46', null, '30', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 11:48:39', '2020-08-17 11:48:39', null, '44f0763f-fa8f-4f91-a134-e6d6ed87f798');
INSERT INTO `elements` VALUES ('47', null, '31', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 12:10:21', '2020-08-17 12:10:21', null, 'dd0abde4-72df-4892-88d1-600f9a5f8512');
INSERT INTO `elements` VALUES ('48', null, null, '5', 'craft\\elements\\Asset', '1', '0', '2020-08-17 12:11:33', '2020-08-17 12:11:33', null, 'a5239b5e-2045-4dba-8b46-360eb9eaaf10');
INSERT INTO `elements` VALUES ('49', null, null, '5', 'craft\\elements\\Asset', '1', '0', '2020-08-17 12:11:47', '2020-08-17 12:12:24', null, '351b5868-0477-49b0-aa1a-60319b47b5a0');
INSERT INTO `elements` VALUES ('50', null, null, '5', 'craft\\elements\\Asset', '1', '0', '2020-08-17 12:12:13', '2020-08-17 12:12:13', null, 'bf7dca08-c451-4aa3-bf76-c5fba2a9a10a');
INSERT INTO `elements` VALUES ('51', null, null, '5', 'craft\\elements\\Asset', '1', '0', '2020-08-17 12:12:20', '2020-08-17 12:12:20', '2020-08-17 12:12:25', 'b3d253c1-764b-4353-af91-2ae2bc075f5c');
INSERT INTO `elements` VALUES ('52', null, null, '5', 'craft\\elements\\Asset', '1', '0', '2020-08-17 12:12:29', '2020-08-17 12:12:29', null, '6fae2003-f77b-4e44-a9ab-1393c9e748a4');
INSERT INTO `elements` VALUES ('53', null, null, '5', 'craft\\elements\\Asset', '1', '0', '2020-08-17 12:12:41', '2020-08-17 12:12:41', null, '18586174-8d4f-4489-b236-b527d25e7afa');
INSERT INTO `elements` VALUES ('54', null, null, '6', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 12:12:46', '2020-08-17 12:12:46', null, '2c3c546e-b6e1-4c9c-a3cc-a57129f465f9');
INSERT INTO `elements` VALUES ('55', null, null, '6', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 12:12:46', '2020-08-17 12:12:46', null, '0eb4bc83-874a-4e4a-9b11-ee4fb3b8dbc2');
INSERT INTO `elements` VALUES ('56', null, null, '6', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 12:12:47', '2020-08-17 12:12:47', null, '197f168a-323e-439c-bfb1-fb90d1995968');
INSERT INTO `elements` VALUES ('57', null, '32', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 12:12:46', '2020-08-17 12:12:46', null, '999ec967-88cd-4129-b198-af34e7042412');
INSERT INTO `elements` VALUES ('58', null, null, '6', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 12:12:47', '2020-08-17 12:12:46', null, '7bc9c344-c3e7-44f8-8cc6-1c48a74946ea');
INSERT INTO `elements` VALUES ('59', null, null, '6', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 12:12:47', '2020-08-17 12:12:46', null, 'd58719fc-207c-43c9-b5d1-1b78afbc66a2');
INSERT INTO `elements` VALUES ('60', null, null, '6', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 12:12:47', '2020-08-17 12:12:47', null, '32d852b8-ae2f-48a8-8700-3430aa49f855');
INSERT INTO `elements` VALUES ('61', null, '33', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 12:16:34', '2020-08-17 12:16:34', null, 'af97037a-7aae-43a3-880a-4e441586fde7');
INSERT INTO `elements` VALUES ('62', null, null, '6', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 12:16:34', '2020-08-17 12:12:46', null, '1d7d0189-dfb9-45ea-9fe5-277f57a5bee7');
INSERT INTO `elements` VALUES ('63', null, null, '6', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 12:16:34', '2020-08-17 12:12:46', null, 'e90b4ec2-75ba-4f0c-8e38-0fc2e93b749b');
INSERT INTO `elements` VALUES ('64', null, null, '6', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 12:16:34', '2020-08-17 12:12:47', null, '76c7b8ed-4f0c-4cda-bf14-5871c8c34f96');
INSERT INTO `elements` VALUES ('65', null, '34', '3', 'craft\\elements\\Entry', '1', '0', '2020-08-17 12:17:30', '2020-08-17 12:17:30', null, '0d12957d-8d5c-43d1-8e38-4be6d3cdd8e7');
INSERT INTO `elements` VALUES ('66', null, null, '6', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 12:17:31', '2020-08-17 12:12:46', null, '7540fec2-5664-42df-9269-bf2e06e80a15');
INSERT INTO `elements` VALUES ('67', null, null, '6', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 12:17:31', '2020-08-17 12:12:46', null, '72a18ea4-a111-4d29-bfc0-e52168fb9347');
INSERT INTO `elements` VALUES ('68', null, null, '6', 'craft\\elements\\MatrixBlock', '1', '0', '2020-08-17 12:17:31', '2020-08-17 12:12:47', null, 'e12e203f-5aba-4b2b-b731-3b755097bf6d');

-- ----------------------------
-- Table structure for elements_sites
-- ----------------------------
DROP TABLE IF EXISTS `elements_sites`;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `elements_sites_siteId_idx` (`siteId`),
  KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `elements_sites_enabled_idx` (`enabled`),
  KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elements_sites
-- ----------------------------
INSERT INTO `elements_sites` VALUES ('1', '1', '1', null, null, '1', '2020-08-15 09:20:02', '2020-08-15 09:20:02', 'ae092afa-4790-460e-be90-cf7bc3c91098');
INSERT INTO `elements_sites` VALUES ('2', '2', '1', 'home', '__home__', '1', '2020-08-17 06:44:22', '2020-08-17 06:45:52', '5f1494fb-1381-4755-a863-163c93d49436');
INSERT INTO `elements_sites` VALUES ('3', '3', '1', 'home', 'home', '1', '2020-08-17 06:44:23', '2020-08-17 06:44:23', '6992520f-a1e8-40a9-8978-054c81203033');
INSERT INTO `elements_sites` VALUES ('4', '4', '1', 'home', 'home', '1', '2020-08-17 06:44:23', '2020-08-17 06:44:23', '50bb0cab-23bc-4998-af7b-000005d9d144');
INSERT INTO `elements_sites` VALUES ('5', '5', '1', 'home', '__home__', '1', '2020-08-17 06:45:52', '2020-08-17 06:45:52', '0b7cf6ba-7cf3-4f42-ae54-65a6910e69ee');
INSERT INTO `elements_sites` VALUES ('6', '6', '1', 'home', '__home__', '1', '2020-08-17 06:45:53', '2020-08-17 06:45:53', 'dc238dae-5a8c-41c3-ac0a-d385bf9bbe9c');
INSERT INTO `elements_sites` VALUES ('7', '7', '1', 'home', '__home__', '1', '2020-08-17 06:46:05', '2020-08-17 06:46:05', '655f9854-5b10-47cd-a3fc-87a035965d70');
INSERT INTO `elements_sites` VALUES ('8', '8', '1', 'home', '__home__', '1', '2020-08-17 06:46:06', '2020-08-17 06:46:06', 'b39932cf-7a51-4c3b-93ca-e5a84c3b23b2');
INSERT INTO `elements_sites` VALUES ('9', '9', '1', 'home', '__home__', '1', '2020-08-17 09:07:13', '2020-08-17 09:07:13', 'e4583d50-b45f-4397-a010-6528acd6d17d');
INSERT INTO `elements_sites` VALUES ('10', '10', '1', 'home', '__home__', '1', '2020-08-17 09:07:13', '2020-08-17 09:07:13', 'be5b9293-9582-4fba-a3ba-33e94d254c8f');
INSERT INTO `elements_sites` VALUES ('11', '11', '1', 'home', '__home__', '1', '2020-08-17 09:07:14', '2020-08-17 09:07:14', '5a631f46-ec3f-413e-a23f-a2dab7612ad2');
INSERT INTO `elements_sites` VALUES ('12', '12', '1', 'home', '__home__', '1', '2020-08-17 09:28:23', '2020-08-17 09:28:23', '38daa236-ae7f-4e47-830a-0937173fb9e7');
INSERT INTO `elements_sites` VALUES ('13', '13', '1', 'home', '__home__', '1', '2020-08-17 09:28:24', '2020-08-17 09:28:24', '3a01dd50-b784-4bc8-8391-4f7f5e03e13a');
INSERT INTO `elements_sites` VALUES ('14', '14', '1', 'home', '__home__', '1', '2020-08-17 09:28:26', '2020-08-17 09:28:26', 'd996bbcf-bcc6-419b-be58-1acc30b024d0');
INSERT INTO `elements_sites` VALUES ('15', '15', '1', 'home', '__home__', '1', '2020-08-17 09:30:27', '2020-08-17 09:30:27', 'e93ee56d-b0b0-4bed-8070-97408b1577b1');
INSERT INTO `elements_sites` VALUES ('16', '16', '1', 'homepage', '__home__', '1', '2020-08-17 09:31:06', '2020-08-17 09:31:06', '8372e1bf-cc86-4146-9aad-4081470dc89d');
INSERT INTO `elements_sites` VALUES ('17', '17', '1', 'homepage', '__home__', '1', '2020-08-17 09:31:06', '2020-08-17 09:31:06', '89e4a79e-11f3-43af-9bdc-a2f431363e59');
INSERT INTO `elements_sites` VALUES ('18', '18', '1', 'homepage', '__home__', '1', '2020-08-17 09:31:07', '2020-08-17 09:31:07', '89e27f42-b53a-4877-b5f4-2916e70d1b0c');
INSERT INTO `elements_sites` VALUES ('19', '19', '1', 'homepage', '__home__', '1', '2020-08-17 09:31:24', '2020-08-17 09:31:24', '2c8827f5-d3b3-4532-a3e7-e1d03c4d17be');
INSERT INTO `elements_sites` VALUES ('20', '20', '1', 'homepage', '__home__', '1', '2020-08-17 09:31:25', '2020-08-17 09:31:25', '96f90115-8198-4c75-a397-deb3d6b39c92');
INSERT INTO `elements_sites` VALUES ('21', '21', '1', 'homepage', '__home__', '1', '2020-08-17 09:31:45', '2020-08-17 09:31:45', 'e0847d0d-9c81-4406-b3cd-6a3f60c0ae95');
INSERT INTO `elements_sites` VALUES ('22', '22', '1', 'homepage', '__home__', '1', '2020-08-17 09:40:23', '2020-08-17 09:40:23', '1555a0c7-7400-4dfa-ad05-761bb028c6ad');
INSERT INTO `elements_sites` VALUES ('23', '23', '1', null, null, '1', '2020-08-17 10:01:33', '2020-08-17 10:01:33', 'c6b683cc-5e54-4c1d-8239-0804cd02b6d3');
INSERT INTO `elements_sites` VALUES ('24', '24', '1', null, null, '1', '2020-08-17 10:23:25', '2020-08-17 10:23:25', 'a161c9f6-bc15-4fb8-a377-a11eb7ef0637');
INSERT INTO `elements_sites` VALUES ('25', '25', '1', 'homepage', '__home__', '1', '2020-08-17 10:23:26', '2020-08-17 10:23:26', '0fe32754-cabd-449b-8161-0973d371dc0b');
INSERT INTO `elements_sites` VALUES ('26', '26', '1', null, null, '1', '2020-08-17 10:23:26', '2020-08-17 10:23:26', 'c42dab98-3397-4f82-89ba-fd1c1c072b82');
INSERT INTO `elements_sites` VALUES ('27', '27', '1', 'homepage', '__home__', '1', '2020-08-17 10:26:05', '2020-08-17 10:26:05', 'e783358a-6b81-485e-9b8d-1557ddfd67d2');
INSERT INTO `elements_sites` VALUES ('28', '28', '1', null, null, '1', '2020-08-17 10:26:05', '2020-08-17 10:26:05', '10895001-6cad-41ff-b5c6-5b9375e1711c');
INSERT INTO `elements_sites` VALUES ('29', '29', '1', 'homepage', '__home__', '1', '2020-08-17 10:26:05', '2020-08-17 10:26:05', '68b3f7cc-91a7-4141-9d97-42525635731a');
INSERT INTO `elements_sites` VALUES ('30', '30', '1', null, null, '1', '2020-08-17 10:26:05', '2020-08-17 10:26:05', 'b97cd548-5b2b-4484-ba0d-16d2d158650b');
INSERT INTO `elements_sites` VALUES ('31', '31', '1', 'homepage', '__home__', '1', '2020-08-17 10:26:36', '2020-08-17 10:26:36', 'e999eaa7-f02c-41be-b6f8-fee0e810ccbc');
INSERT INTO `elements_sites` VALUES ('32', '32', '1', null, null, '1', '2020-08-17 10:26:36', '2020-08-17 10:26:36', '6c108892-84c9-4653-9db9-b7256fa30c0c');
INSERT INTO `elements_sites` VALUES ('33', '33', '1', 'homepage', '__home__', '1', '2020-08-17 10:26:37', '2020-08-17 10:26:37', '89b74829-fc25-4024-b7f0-05d1fc353762');
INSERT INTO `elements_sites` VALUES ('34', '34', '1', null, null, '1', '2020-08-17 10:26:38', '2020-08-17 10:26:38', 'a7d3d192-81dc-41d5-b222-5bbc1130779d');
INSERT INTO `elements_sites` VALUES ('35', '35', '1', 'homepage', '__home__', '1', '2020-08-17 10:50:10', '2020-08-17 10:50:10', '050d1ad6-04b5-4430-9dd1-b1691f52821e');
INSERT INTO `elements_sites` VALUES ('36', '36', '1', null, null, '1', '2020-08-17 10:50:11', '2020-08-17 10:50:11', 'd48f7bb9-e2b5-44d6-993e-e291e03fef02');
INSERT INTO `elements_sites` VALUES ('37', '37', '1', 'homepage', '__home__', '1', '2020-08-17 11:15:00', '2020-08-17 11:15:00', 'f5513710-2de4-44c5-930a-91c3b45c2825');
INSERT INTO `elements_sites` VALUES ('38', '38', '1', 'homepage', '__home__', '1', '2020-08-17 11:16:59', '2020-08-17 11:16:59', 'bc705a4b-6333-4236-a9c1-85292138ebe3');
INSERT INTO `elements_sites` VALUES ('39', '39', '1', null, null, '1', '2020-08-17 11:16:59', '2020-08-17 11:16:59', 'f32f232a-c45a-4db4-9010-ff9330fb0131');
INSERT INTO `elements_sites` VALUES ('40', '40', '1', 'homepage', '__home__', '1', '2020-08-17 11:17:38', '2020-08-17 11:17:38', 'ab318295-7da6-447a-8398-5c2015f14824');
INSERT INTO `elements_sites` VALUES ('41', '41', '1', null, null, '1', '2020-08-17 11:25:55', '2020-08-17 11:25:55', '1a41706c-f252-454c-b9cb-1f07e82914f5');
INSERT INTO `elements_sites` VALUES ('42', '42', '1', 'homepage', '__home__', '1', '2020-08-17 11:26:07', '2020-08-17 11:26:07', 'ff87cde3-6216-426c-9ead-84b575913179');
INSERT INTO `elements_sites` VALUES ('43', '43', '1', 'homepage', '__home__', '1', '2020-08-17 11:45:48', '2020-08-17 11:45:48', '1812f2a5-8bf3-485d-90d6-6ad31b08e568');
INSERT INTO `elements_sites` VALUES ('44', '44', '1', null, null, '1', '2020-08-17 11:48:16', '2020-08-17 11:48:16', 'e367f0a8-b29e-49ce-bd7a-3f5771ffeaaa');
INSERT INTO `elements_sites` VALUES ('45', '45', '1', null, null, '1', '2020-08-17 11:48:33', '2020-08-17 11:48:33', 'f6904fbc-069b-41a4-b347-d16423dce285');
INSERT INTO `elements_sites` VALUES ('46', '46', '1', 'homepage', '__home__', '1', '2020-08-17 11:48:39', '2020-08-17 11:48:39', 'e160c0be-516e-4149-b2a9-2f58d1476182');
INSERT INTO `elements_sites` VALUES ('47', '47', '1', 'homepage', '__home__', '1', '2020-08-17 12:10:22', '2020-08-17 12:10:22', '27665c32-6c01-412c-a593-bdd5001abff2');
INSERT INTO `elements_sites` VALUES ('48', '48', '1', null, null, '1', '2020-08-17 12:11:33', '2020-08-17 12:11:33', 'ce56cd9f-3970-4ea7-8a00-e947a3afd365');
INSERT INTO `elements_sites` VALUES ('49', '49', '1', null, null, '1', '2020-08-17 12:11:47', '2020-08-17 12:11:47', '0157be3b-3853-4a99-bb35-f36c24f4bf54');
INSERT INTO `elements_sites` VALUES ('50', '50', '1', null, null, '1', '2020-08-17 12:12:13', '2020-08-17 12:12:13', 'c8f7eace-5ec8-4773-93f5-102a1f11d630');
INSERT INTO `elements_sites` VALUES ('51', '51', '1', null, null, '1', '2020-08-17 12:12:20', '2020-08-17 12:12:20', 'd5c5a05d-5558-4be1-ba44-8f452ba23cb4');
INSERT INTO `elements_sites` VALUES ('52', '52', '1', null, null, '1', '2020-08-17 12:12:29', '2020-08-17 12:12:29', 'b6d8f54e-c77b-4a9b-ba32-fe165d537046');
INSERT INTO `elements_sites` VALUES ('53', '53', '1', null, null, '1', '2020-08-17 12:12:41', '2020-08-17 12:12:41', 'd5cdf845-2488-4c5e-a2b6-6b54b71219c9');
INSERT INTO `elements_sites` VALUES ('54', '54', '1', null, null, '1', '2020-08-17 12:12:46', '2020-08-17 12:12:46', 'fb126599-a0e4-42bf-b168-4a0ad049be55');
INSERT INTO `elements_sites` VALUES ('55', '55', '1', null, null, '1', '2020-08-17 12:12:46', '2020-08-17 12:12:46', '11cc514b-f340-43b5-8bf8-f055feae10f8');
INSERT INTO `elements_sites` VALUES ('56', '56', '1', null, null, '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', 'd8e1edba-bef9-4b05-b96f-d6dc8b439b4d');
INSERT INTO `elements_sites` VALUES ('57', '57', '1', 'homepage', '__home__', '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '4ca034b3-14a4-4ce0-ba8e-b38bc9eb2d0f');
INSERT INTO `elements_sites` VALUES ('58', '58', '1', null, null, '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '489e3874-ff3f-45b0-87dc-6afc98e9126f');
INSERT INTO `elements_sites` VALUES ('59', '59', '1', null, null, '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '438fc69a-26bd-4d91-bbd6-889412c8771f');
INSERT INTO `elements_sites` VALUES ('60', '60', '1', null, null, '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '92035bf0-b936-45dd-919d-6daae17b8aa7');
INSERT INTO `elements_sites` VALUES ('61', '61', '1', 'homepage', '__home__', '1', '2020-08-17 12:16:34', '2020-08-17 12:16:34', 'c7037248-771b-40cd-93df-0f081ae40f07');
INSERT INTO `elements_sites` VALUES ('62', '62', '1', null, null, '1', '2020-08-17 12:16:34', '2020-08-17 12:16:34', '5b6b8a31-4ef3-40d3-aefa-324d4ed97e6c');
INSERT INTO `elements_sites` VALUES ('63', '63', '1', null, null, '1', '2020-08-17 12:16:34', '2020-08-17 12:16:34', '555d2452-4efe-47de-b006-77b92c5c4dc9');
INSERT INTO `elements_sites` VALUES ('64', '64', '1', null, null, '1', '2020-08-17 12:16:34', '2020-08-17 12:16:34', '0e327a58-02f4-44df-ad01-ef86255926e8');
INSERT INTO `elements_sites` VALUES ('65', '65', '1', 'homepage', '__home__', '1', '2020-08-17 12:17:30', '2020-08-17 12:17:30', 'a89c92a6-a1af-4e0b-b639-03522159b0d4');
INSERT INTO `elements_sites` VALUES ('66', '66', '1', null, null, '1', '2020-08-17 12:17:31', '2020-08-17 12:17:31', '59fcd5c5-a54c-4da2-882b-36a807143212');
INSERT INTO `elements_sites` VALUES ('67', '67', '1', null, null, '1', '2020-08-17 12:17:31', '2020-08-17 12:17:31', '2bb2ad8e-f5dc-4ae8-bbaf-4f3e980ad874');
INSERT INTO `elements_sites` VALUES ('68', '68', '1', null, null, '1', '2020-08-17 12:17:31', '2020-08-17 12:17:31', '4fa3725c-86d6-4a96-89f2-46b7a0add806');

-- ----------------------------
-- Table structure for entries
-- ----------------------------
DROP TABLE IF EXISTS `entries`;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  KEY `entries_parentId_fk` (`parentId`),
  CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entries
-- ----------------------------
INSERT INTO `entries` VALUES ('2', '1', null, '1', null, '2020-08-17 06:44:00', null, '1', '2020-08-17 06:44:22', '2020-08-17 06:44:22', '65021dbd-ff39-48da-b396-77f77ec7d06e');
INSERT INTO `entries` VALUES ('3', '1', null, '1', null, '2020-08-17 06:44:00', null, null, '2020-08-17 06:44:23', '2020-08-17 06:44:23', '5855b5b5-620d-4d70-b956-e29d0f65bc44');
INSERT INTO `entries` VALUES ('4', '1', null, '1', null, '2020-08-17 06:44:00', null, null, '2020-08-17 06:44:23', '2020-08-17 06:44:23', '7531fe53-611a-4c6a-b9b8-d260c9a85361');
INSERT INTO `entries` VALUES ('5', '1', null, '1', null, '2020-08-17 06:44:00', null, null, '2020-08-17 06:45:52', '2020-08-17 06:45:52', '5f07868b-6d34-4724-b2d7-f5e98a0b9879');
INSERT INTO `entries` VALUES ('6', '1', null, '1', null, '2020-08-17 06:44:00', null, null, '2020-08-17 06:45:53', '2020-08-17 06:45:53', '31257a0e-7b2e-4f4a-8765-f4205e599c2c');
INSERT INTO `entries` VALUES ('7', '1', null, '1', null, '2020-08-17 06:44:00', null, null, '2020-08-17 06:46:06', '2020-08-17 06:46:06', '7146641e-367b-444b-aca1-9fcbd6a4c9c6');
INSERT INTO `entries` VALUES ('8', '1', null, '1', null, '2020-08-17 06:44:00', null, null, '2020-08-17 06:46:06', '2020-08-17 06:46:06', 'e968bd6e-1365-488b-906a-72168183d80a');
INSERT INTO `entries` VALUES ('9', '2', null, '2', null, '2020-08-17 09:07:00', null, '1', '2020-08-17 09:07:13', '2020-08-17 09:07:13', 'cc3ac78b-ac9b-4722-9e8c-b126e0ef2b47');
INSERT INTO `entries` VALUES ('10', '2', null, '2', null, '2020-08-17 09:07:00', null, null, '2020-08-17 09:07:13', '2020-08-17 09:07:13', 'f2a303a5-39f3-499f-ae45-b9f514b3c8a8');
INSERT INTO `entries` VALUES ('11', '2', null, '2', null, '2020-08-17 09:07:00', null, null, '2020-08-17 09:07:14', '2020-08-17 09:07:14', 'c0342aa9-309f-4c55-a553-d40121dc8d76');
INSERT INTO `entries` VALUES ('12', '2', null, '2', null, '2020-08-17 09:07:00', null, null, '2020-08-17 09:28:23', '2020-08-17 09:28:23', 'db0c5363-6a68-4781-ae94-0912c144ab5c');
INSERT INTO `entries` VALUES ('13', '2', null, '2', null, '2020-08-17 09:07:00', null, null, '2020-08-17 09:28:24', '2020-08-17 09:28:24', '5a8c68d4-350d-459e-b39f-97245132b48b');
INSERT INTO `entries` VALUES ('14', '2', null, '2', null, '2020-08-17 09:07:00', null, null, '2020-08-17 09:28:26', '2020-08-17 09:28:26', '6ad0ea1f-cbae-46b9-8434-5f47487e97db');
INSERT INTO `entries` VALUES ('15', '2', null, '2', null, '2020-08-17 09:07:00', null, null, '2020-08-17 09:30:27', '2020-08-17 09:30:27', 'c5d927bd-6425-4a38-8da0-df655d437795');
INSERT INTO `entries` VALUES ('16', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 09:31:06', '2020-08-17 09:31:06', 'cb0a6c0d-dedd-4e87-b44c-01048c7c5b27');
INSERT INTO `entries` VALUES ('17', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 09:31:06', '2020-08-17 09:31:06', '8616e822-9249-4286-945d-ffda50a3edf9');
INSERT INTO `entries` VALUES ('18', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 09:31:08', '2020-08-17 09:31:08', '18003344-1be2-4f83-95d7-f912038526a7');
INSERT INTO `entries` VALUES ('19', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 09:31:24', '2020-08-17 09:31:24', '9de17843-8237-49ac-8d28-1e1fb31731e5');
INSERT INTO `entries` VALUES ('20', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 09:31:25', '2020-08-17 09:31:25', '19eb450e-1bc5-4acc-880c-37c3fd0766a6');
INSERT INTO `entries` VALUES ('21', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 09:31:45', '2020-08-17 09:31:45', '1bbafca5-590b-479e-82d1-306d26b77354');
INSERT INTO `entries` VALUES ('22', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 09:40:23', '2020-08-17 09:40:23', 'f459b251-32ca-4ec5-8df3-c137cac0de1a');
INSERT INTO `entries` VALUES ('25', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 10:23:26', '2020-08-17 10:23:26', '8ab36564-83e1-4610-aa1f-51d540ca064b');
INSERT INTO `entries` VALUES ('27', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 10:26:05', '2020-08-17 10:26:05', '7f81e87e-3eae-4016-bfa0-fa5abeb45981');
INSERT INTO `entries` VALUES ('29', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 10:26:05', '2020-08-17 10:26:05', '6607064b-d608-46e3-8dec-49087fbce207');
INSERT INTO `entries` VALUES ('31', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 10:26:36', '2020-08-17 10:26:36', '776ef3dd-c4f8-44f3-bd90-b66b96f23f99');
INSERT INTO `entries` VALUES ('33', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 10:26:38', '2020-08-17 10:26:38', 'cca58a61-a086-42ee-8244-6104c3264f66');
INSERT INTO `entries` VALUES ('35', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 10:50:10', '2020-08-17 10:50:10', '786d0b4e-0753-47bb-89bf-2ed813e0430e');
INSERT INTO `entries` VALUES ('37', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 11:15:00', '2020-08-17 11:15:00', '89054f11-ac05-463b-ad31-8deb2a9eb619');
INSERT INTO `entries` VALUES ('38', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 11:16:59', '2020-08-17 11:16:59', '65aa9d55-d47b-4ce8-8435-896afb9cecd0');
INSERT INTO `entries` VALUES ('40', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 11:17:38', '2020-08-17 11:17:38', 'c4767120-6fa2-45cd-ad8c-75e9542ed2ec');
INSERT INTO `entries` VALUES ('42', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 11:26:07', '2020-08-17 11:26:07', '25843cd8-9eb2-4650-ab22-f5f1c939045e');
INSERT INTO `entries` VALUES ('43', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 11:45:48', '2020-08-17 11:45:48', '2603c0e9-77b1-41e3-9700-60d8ddc9b5b4');
INSERT INTO `entries` VALUES ('46', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 11:48:39', '2020-08-17 11:48:39', '9e7e1d47-34e9-49b5-825a-f0134740f4b1');
INSERT INTO `entries` VALUES ('47', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 12:10:22', '2020-08-17 12:10:22', 'ae41cf85-0ad6-4abd-86f6-0e872f3ac496');
INSERT INTO `entries` VALUES ('57', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 12:12:47', '2020-08-17 12:12:47', '750b4a4a-5140-488f-97a2-d1ac47f181fa');
INSERT INTO `entries` VALUES ('61', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 12:16:34', '2020-08-17 12:16:34', '30403110-1abb-4107-af17-6563c651986f');
INSERT INTO `entries` VALUES ('65', '3', null, '3', null, '2020-08-17 09:31:00', null, null, '2020-08-17 12:17:30', '2020-08-17 12:17:30', '00531b21-0670-4406-adf4-ee210839231c');

-- ----------------------------
-- Table structure for entrytypes
-- ----------------------------
DROP TABLE IF EXISTS `entrytypes`;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entrytypes
-- ----------------------------
INSERT INTO `entrytypes` VALUES ('1', '1', '1', 'Home', 'home', '0', 'site', null, '{section.name|raw}', '1', '2020-08-17 06:44:22', '2020-08-17 06:44:22', '2020-08-17 06:53:02', '4637866d-2aa4-4785-9ff3-b635304f42c5');
INSERT INTO `entrytypes` VALUES ('2', '2', '2', 'Homepage', 'homepage', '1', 'site', null, null, '1', '2020-08-17 09:06:19', '2020-08-17 09:28:25', '2020-08-17 09:30:54', '4787f91c-9cbc-4c8f-a47d-d84015d97f34');
INSERT INTO `entrytypes` VALUES ('3', '3', '3', 'Homepage', 'homepage', '1', 'site', null, '{section.name|raw}', '1', '2020-08-17 09:31:06', '2020-08-17 09:40:22', null, '2958e5a3-8ad6-48ff-95d9-0bc95a77ab35');

-- ----------------------------
-- Table structure for fieldgroups
-- ----------------------------
DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldgroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fieldgroups
-- ----------------------------
INSERT INTO `fieldgroups` VALUES ('1', 'Common', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '64e782e6-253a-47a6-ad98-235fc176974a');
INSERT INTO `fieldgroups` VALUES ('2', 'Homepage', '2020-08-17 09:34:23', '2020-08-17 09:34:23', 'd30f5b86-f31a-45c3-8ec2-7cd5bfafe237');

-- ----------------------------
-- Table structure for fieldlayoutfields
-- ----------------------------
DROP TABLE IF EXISTS `fieldlayoutfields`;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fieldlayoutfields
-- ----------------------------
INSERT INTO `fieldlayoutfields` VALUES ('28', '3', '24', '4', '0', '0', '2020-08-17 12:16:33', '2020-08-17 12:16:33', 'bdfd2b20-fb89-4b5e-97df-5e5056fc2b79');
INSERT INTO `fieldlayoutfields` VALUES ('29', '3', '24', '5', '0', '1', '2020-08-17 12:16:33', '2020-08-17 12:16:33', '455fba4f-6239-4c9e-94f0-cc96bb9a3abf');
INSERT INTO `fieldlayoutfields` VALUES ('30', '3', '24', '6', '0', '2', '2020-08-17 12:16:33', '2020-08-17 12:16:33', '9c42ab86-538a-473b-8528-f1a156c61303');
INSERT INTO `fieldlayoutfields` VALUES ('31', '3', '24', '7', '0', '3', '2020-08-17 12:16:33', '2020-08-17 12:16:33', 'd44e9c74-c002-4991-bf40-d099141a3291');
INSERT INTO `fieldlayoutfields` VALUES ('32', '6', '25', '8', '1', '0', '2020-08-17 12:17:10', '2020-08-17 12:17:10', '679876f5-703d-43a7-8609-e4c65ed74440');
INSERT INTO `fieldlayoutfields` VALUES ('33', '6', '25', '9', '1', '1', '2020-08-17 12:17:10', '2020-08-17 12:17:10', 'bf0347b9-c08e-4310-a460-e1aa9e3125c6');

-- ----------------------------
-- Table structure for fieldlayouts
-- ----------------------------
DROP TABLE IF EXISTS `fieldlayouts`;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fieldlayouts
-- ----------------------------
INSERT INTO `fieldlayouts` VALUES ('1', 'craft\\elements\\Entry', '2020-08-17 06:44:21', '2020-08-17 06:44:21', '2020-08-17 06:53:02', '5d1942bb-91c8-4fe2-bdad-de08cbc08f6e');
INSERT INTO `fieldlayouts` VALUES ('2', 'craft\\elements\\Entry', '2020-08-17 09:06:19', '2020-08-17 09:06:19', '2020-08-17 09:30:54', 'c6f87f68-12c8-4988-9808-7683a912559b');
INSERT INTO `fieldlayouts` VALUES ('3', 'craft\\elements\\Entry', '2020-08-17 09:31:06', '2020-08-17 09:31:06', null, '89d029fc-998a-4fe6-91d3-e731168d0ffd');
INSERT INTO `fieldlayouts` VALUES ('4', 'craft\\elements\\MatrixBlock', '2020-08-17 09:38:30', '2020-08-17 09:38:30', '2020-08-17 11:44:35', 'faee3ba0-7dca-48f1-8de7-b3091e9f9366');
INSERT INTO `fieldlayouts` VALUES ('5', 'craft\\elements\\Asset', '2020-08-17 09:53:46', '2020-08-17 09:53:46', null, 'ad16a14f-0369-4441-ac0b-8abbbffda296');
INSERT INTO `fieldlayouts` VALUES ('6', 'craft\\elements\\MatrixBlock', '2020-08-17 12:09:25', '2020-08-17 12:09:25', null, '65f4d158-c8bf-41f8-a6ee-507baf2a8b5f');

-- ----------------------------
-- Table structure for fieldlayouttabs
-- ----------------------------
DROP TABLE IF EXISTS `fieldlayouttabs`;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `elements` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fieldlayouttabs
-- ----------------------------
INSERT INTO `fieldlayouttabs` VALUES ('1', '1', 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autofocus\":false,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100}]', '1', '2020-08-17 06:44:22', '2020-08-17 06:44:22', '7a31c9f0-762b-4be2-aaec-128f154e9136');
INSERT INTO `fieldlayouttabs` VALUES ('4', '2', 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autofocus\":false,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":\"Test Home\",\"instructions\":\"\",\"tip\":null,\"warning\":null,\"required\":false,\"width\":75}]', '1', '2020-08-17 09:30:26', '2020-08-17 09:30:26', 'e526a980-7bcb-42a0-a709-7f66bc8113e6');
INSERT INTO `fieldlayouttabs` VALUES ('12', '5', 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autofocus\":false,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100}]', '1', '2020-08-17 10:14:38', '2020-08-17 10:14:38', '189bc990-3222-489e-b47e-43175a000839');
INSERT INTO `fieldlayouttabs` VALUES ('16', '4', 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"9600cff5-07f2-413d-ac3e-2cfbd5b291ca\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"59ea2f3a-615b-4fff-a55c-db436a42b29a\"}]', '1', '2020-08-17 11:08:08', '2020-08-17 11:08:08', '2e12b3b5-3263-4e55-8981-611a9a05be72');
INSERT INTO `fieldlayouttabs` VALUES ('24', '3', 'Homepage', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"fc11d5eb-d042-43c4-bc6e-63a38c201090\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bac1e266-423c-4b7c-bd38-1bd1c6a3d75a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7d762406-b88d-4da2-9461-95561df3178f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autofocus\":false,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100}]', '1', '2020-08-17 12:16:33', '2020-08-17 12:16:33', '58718dd3-94b4-40f1-9864-ee641de9ba02');
INSERT INTO `fieldlayouttabs` VALUES ('25', '6', 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"4785a585-910c-4da0-8299-f05af7f8207c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"998cedd0-1ef4-4dd3-87f8-8d308068b2bc\"}]', '1', '2020-08-17 12:17:10', '2020-08-17 12:17:10', '056ff91a-7e18-4b16-950f-a0c9a4d9b8dc');

-- ----------------------------
-- Table structure for fields
-- ----------------------------
DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fields_handle_context_idx` (`handle`,`context`),
  KEY `fields_groupId_idx` (`groupId`),
  KEY `fields_context_idx` (`context`),
  CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fields
-- ----------------------------
INSERT INTO `fields` VALUES ('4', '2', 'Banner Title', 'bannerTitle', 'global', '', '1', 'none', null, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-08-17 11:13:57', '2020-08-17 11:13:57', 'fc11d5eb-d042-43c4-bc6e-63a38c201090');
INSERT INTO `fields` VALUES ('5', '2', 'Banner Image', 'bannerImage', 'global', '', '0', 'site', null, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:66b75dae-aadd-43b7-857e-6d3d40b4b6a2\",\"defaultUploadLocationSubpath\":\"homepage\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":true,\"singleUploadLocationSource\":\"volume:66b75dae-aadd-43b7-857e-6d3d40b4b6a2\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2020-08-17 11:14:30', '2020-08-17 11:16:20', 'bac1e266-423c-4b7c-bd38-1bd1c6a3d75a');
INSERT INTO `fields` VALUES ('6', '2', 'Relax Image', 'relaxImage', 'global', '', '1', 'site', null, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:66b75dae-aadd-43b7-857e-6d3d40b4b6a2\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":true,\"singleUploadLocationSource\":\"volume:66b75dae-aadd-43b7-857e-6d3d40b4b6a2\",\"singleUploadLocationSubpath\":\"homepage\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2020-08-17 11:45:15', '2020-08-17 11:45:33', '7d762406-b88d-4da2-9461-95561df3178f');
INSERT INTO `fields` VALUES ('7', '2', 'Location Slide', 'locationSlide', 'global', '', '0', 'site', null, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_locationslide}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2020-08-17 12:09:22', '2020-08-17 12:09:22', '5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f');
INSERT INTO `fields` VALUES ('8', null, 'Slide Title', 'slideTitle', 'matrixBlockType:a921eda3-b6f3-4838-bb29-96913e0fce79', '', '1', 'none', null, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-08-17 12:09:25', '2020-08-17 12:09:25', '4785a585-910c-4da0-8299-f05af7f8207c');
INSERT INTO `fields` VALUES ('9', null, 'Slide Image', 'slideImage', 'matrixBlockType:a921eda3-b6f3-4838-bb29-96913e0fce79', '', '1', 'site', null, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:66b75dae-aadd-43b7-857e-6d3d40b4b6a2\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":true,\"singleUploadLocationSource\":\"volume:66b75dae-aadd-43b7-857e-6d3d40b4b6a2\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2020-08-17 12:10:00', '2020-08-17 12:10:00', '998cedd0-1ef4-4dd3-87f8-8d308068b2bc');

-- ----------------------------
-- Table structure for globalsets
-- ----------------------------
DROP TABLE IF EXISTS `globalsets`;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `globalsets_name_idx` (`name`),
  KEY `globalsets_handle_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of globalsets
-- ----------------------------

-- ----------------------------
-- Table structure for gqlschemas
-- ----------------------------
DROP TABLE IF EXISTS `gqlschemas`;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gqlschemas
-- ----------------------------
INSERT INTO `gqlschemas` VALUES ('1', 'Public Schema', '[]', '1', '2020-08-15 09:37:17', '2020-08-15 09:37:17', '9e3339bf-e761-40ad-8cf8-f19e1bc3034c');

-- ----------------------------
-- Table structure for gqltokens
-- ----------------------------
DROP TABLE IF EXISTS `gqltokens`;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  KEY `gqltokens_schemaId_fk` (`schemaId`),
  CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gqltokens
-- ----------------------------
INSERT INTO `gqltokens` VALUES ('1', 'Public Token', '__PUBLIC__', '1', null, null, '1', '2020-08-15 09:37:17', '2020-08-15 09:37:17', '3ff4ca43-b657-4069-bbb6-abd602979493');

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES ('1', '3.5.4', '3.5.12', '0', 'ludrcykkeqej', '2020-08-15 09:19:53', '2020-08-17 12:17:10', 'f8e0b670-3dfa-4a1e-bc93-8b4564349772');

-- ----------------------------
-- Table structure for matrixblocks
-- ----------------------------
DROP TABLE IF EXISTS `matrixblocks`;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`ownerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matrixblocks
-- ----------------------------
INSERT INTO `matrixblocks` VALUES ('54', '16', '7', '2', '1', null, '2020-08-17 12:12:46', '2020-08-17 12:12:46', '861d45ae-8ab1-4701-b84d-ca507e6e3dc7');
INSERT INTO `matrixblocks` VALUES ('55', '16', '7', '2', '2', null, '2020-08-17 12:12:47', '2020-08-17 12:12:47', '4722a071-a9fe-4e70-9f26-6ebbf60ef1c9');
INSERT INTO `matrixblocks` VALUES ('56', '16', '7', '2', '3', null, '2020-08-17 12:12:47', '2020-08-17 12:12:47', 'eb29129f-32bf-4cf8-9c38-ebc1f6960fe3');
INSERT INTO `matrixblocks` VALUES ('58', '57', '7', '2', '1', null, '2020-08-17 12:12:47', '2020-08-17 12:12:47', 'aea6c93e-cc4f-40f9-838c-a660bfd65734');
INSERT INTO `matrixblocks` VALUES ('59', '57', '7', '2', '2', null, '2020-08-17 12:12:47', '2020-08-17 12:12:47', '6fea8e25-45ea-4275-8ee5-3dd66e149df9');
INSERT INTO `matrixblocks` VALUES ('60', '57', '7', '2', '3', null, '2020-08-17 12:12:47', '2020-08-17 12:12:47', 'f9c76109-3585-47a9-b2fb-d31c0a6d93c0');
INSERT INTO `matrixblocks` VALUES ('62', '61', '7', '2', '1', null, '2020-08-17 12:16:34', '2020-08-17 12:16:34', '66c59286-fdbf-4d8d-81d9-d1e6a3f73545');
INSERT INTO `matrixblocks` VALUES ('63', '61', '7', '2', '2', null, '2020-08-17 12:16:34', '2020-08-17 12:16:34', '1680ed0e-0d3c-4325-9e20-3cd1b1ea0fb7');
INSERT INTO `matrixblocks` VALUES ('64', '61', '7', '2', '3', null, '2020-08-17 12:16:34', '2020-08-17 12:16:34', '3cc6ba3f-44b0-4b88-a493-db3786c0a744');
INSERT INTO `matrixblocks` VALUES ('66', '65', '7', '2', '1', null, '2020-08-17 12:17:31', '2020-08-17 12:17:31', '6f6a9864-2c5a-4856-8ec6-ac5904720940');
INSERT INTO `matrixblocks` VALUES ('67', '65', '7', '2', '2', null, '2020-08-17 12:17:31', '2020-08-17 12:17:31', '792dc3f7-505d-4781-9760-d7657a684217');
INSERT INTO `matrixblocks` VALUES ('68', '65', '7', '2', '3', null, '2020-08-17 12:17:31', '2020-08-17 12:17:31', '91478107-e6f0-40dd-9ec3-4684bcfc90ff');

-- ----------------------------
-- Table structure for matrixblocktypes
-- ----------------------------
DROP TABLE IF EXISTS `matrixblocktypes`;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocktypes_name_fieldId_idx` (`name`,`fieldId`),
  KEY `matrixblocktypes_handle_fieldId_idx` (`handle`,`fieldId`),
  KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matrixblocktypes
-- ----------------------------
INSERT INTO `matrixblocktypes` VALUES ('2', '7', '6', 'Location Details', 'locationDetails', '1', '2020-08-17 12:09:26', '2020-08-17 12:11:05', 'a921eda3-b6f3-4838-bb29-96913e0fce79');

-- ----------------------------
-- Table structure for matrixcontent_locationslide
-- ----------------------------
DROP TABLE IF EXISTS `matrixcontent_locationslide`;
CREATE TABLE `matrixcontent_locationslide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_locationDetails_slideTitle` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_locationslide_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_locationslide_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_locationslide_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_locationslide_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matrixcontent_locationslide
-- ----------------------------
INSERT INTO `matrixcontent_locationslide` VALUES ('1', '54', '1', '2020-08-17 12:12:46', '2020-08-17 12:12:46', '87cb7c26-2246-4fc2-b4a3-89f31a72ce65', 'Slide-1');
INSERT INTO `matrixcontent_locationslide` VALUES ('2', '55', '1', '2020-08-17 12:12:46', '2020-08-17 12:12:46', 'c2799ffd-a255-4b52-9174-9b0b423cfb27', 'Slide-2');
INSERT INTO `matrixcontent_locationslide` VALUES ('3', '56', '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '8cf51168-9d0f-479b-b964-6bcaef36caac', 'Slide-3');
INSERT INTO `matrixcontent_locationslide` VALUES ('4', '58', '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '47550f80-858c-4581-9067-489f2b43fd65', 'Slide-1');
INSERT INTO `matrixcontent_locationslide` VALUES ('5', '59', '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '4b661d0d-4859-48aa-82ee-8e41b7e36201', 'Slide-2');
INSERT INTO `matrixcontent_locationslide` VALUES ('6', '60', '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '24c2dbb0-dae3-45cd-a9e5-5e58afbc866a', 'Slide-3');
INSERT INTO `matrixcontent_locationslide` VALUES ('7', '62', '1', '2020-08-17 12:16:34', '2020-08-17 12:16:34', 'e3dd8e0d-66ea-4085-8ec0-8a434dc78c1e', 'Slide-1');
INSERT INTO `matrixcontent_locationslide` VALUES ('8', '63', '1', '2020-08-17 12:16:34', '2020-08-17 12:16:34', 'e3156091-75e7-4a6d-9a7c-fc1fc3d21954', 'Slide-2');
INSERT INTO `matrixcontent_locationslide` VALUES ('9', '64', '1', '2020-08-17 12:16:34', '2020-08-17 12:16:34', 'af67f78f-9cc0-406d-9ec2-266ed625b5fc', 'Slide-3');
INSERT INTO `matrixcontent_locationslide` VALUES ('10', '66', '1', '2020-08-17 12:17:31', '2020-08-17 12:17:31', 'dbee102f-10e7-4f28-9fa4-6c57a7e1b16f', 'Slide-1');
INSERT INTO `matrixcontent_locationslide` VALUES ('11', '67', '1', '2020-08-17 12:17:31', '2020-08-17 12:17:31', 'c23971d8-415a-4337-a3b0-24e1f16be145', 'Slide-2');
INSERT INTO `matrixcontent_locationslide` VALUES ('12', '68', '1', '2020-08-17 12:17:31', '2020-08-17 12:17:31', '4c1c8856-641f-456b-b91e-4159e210c0b3', 'Slide-3');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `migrations_track_name_unq_idx` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', 'plugin:seomatic', 'Install', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '2a0e9ef9-4988-41af-a432-c44afc13a766');
INSERT INTO `migrations` VALUES ('2', 'plugin:seomatic', 'm180314_002755_field_type', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '31cd078e-e5fd-4691-b5e1-611aed46ca4d');
INSERT INTO `migrations` VALUES ('3', 'plugin:seomatic', 'm180314_002756_base_install', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '97abeabb-d999-4c04-8370-41d11501b234');
INSERT INTO `migrations` VALUES ('4', 'plugin:seomatic', 'm180502_202319_remove_field_metabundles', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '67490f98-cad5-4afd-a48b-f4d5d20e0cc4');
INSERT INTO `migrations` VALUES ('5', 'plugin:seomatic', 'm180711_024947_commerce_products', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '754275aa-5e9f-4b3d-92bb-cb7b0d68a450');
INSERT INTO `migrations` VALUES ('6', 'plugin:seomatic', 'm190401_220828_longer_handles', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '1d032888-0db6-449f-9640-e28a42e1ef90');
INSERT INTO `migrations` VALUES ('7', 'plugin:seomatic', 'm190518_030221_calendar_events', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '326d2220-44f5-473f-bbf1-2523e36cd3b4');
INSERT INTO `migrations` VALUES ('8', 'plugin:seomatic', 'm200419_203444_add_type_id', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '2020-08-15 09:20:00', '5406967b-4808-4f6c-84ba-45f2081b07de');
INSERT INTO `migrations` VALUES ('9', 'craft', 'Install', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '2020-08-15 09:20:05', 'fb7452f7-f5c1-4d87-9a92-b21d1ca44a92');
INSERT INTO `migrations` VALUES ('10', 'craft', 'm150403_183908_migrations_table_changes', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '75201038-da34-4b51-b07c-04248c045ae7');
INSERT INTO `migrations` VALUES ('11', 'craft', 'm150403_184247_plugins_table_changes', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '802f0d84-4343-4da4-8c54-62d1a571d1c7');
INSERT INTO `migrations` VALUES ('12', 'craft', 'm150403_184533_field_version', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '71282db4-30bf-4a81-9b68-fe1abdd5cea2');
INSERT INTO `migrations` VALUES ('13', 'craft', 'm150403_184729_type_columns', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '52fefadf-d0f6-45a9-92f8-fd139682bbdf');
INSERT INTO `migrations` VALUES ('14', 'craft', 'm150403_185142_volumes', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '2020-08-15 09:20:05', 'bcac2204-a6f9-484e-a4d6-ca1499793fb9');
INSERT INTO `migrations` VALUES ('15', 'craft', 'm150428_231346_userpreferences', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '01e63e93-1c0c-4d22-a222-32e6b64d8a31');
INSERT INTO `migrations` VALUES ('16', 'craft', 'm150519_150900_fieldversion_conversion', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '0723d739-e761-450d-8a39-644e4ed37f44');
INSERT INTO `migrations` VALUES ('17', 'craft', 'm150617_213829_update_email_settings', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '913b4807-3e77-46d6-b639-fb716cda5058');
INSERT INTO `migrations` VALUES ('18', 'craft', 'm150721_124739_templatecachequeries', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '70fd85f4-e0a7-40b6-a3c0-31653004abf0');
INSERT INTO `migrations` VALUES ('19', 'craft', 'm150724_140822_adjust_quality_settings', '2020-08-15 09:20:05', '2020-08-15 09:20:05', '2020-08-15 09:20:05', 'ecec525c-6cc2-4e94-a97d-6ed87290ade9');
INSERT INTO `migrations` VALUES ('20', 'craft', 'm150815_133521_last_login_attempt_ip', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', 'd20d6bc7-efc7-43b0-9a95-f17eb03ab4a6');
INSERT INTO `migrations` VALUES ('21', 'craft', 'm151002_095935_volume_cache_settings', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', 'a3a3fe88-4ec2-483f-af5a-9b385c0bf530');
INSERT INTO `migrations` VALUES ('22', 'craft', 'm151005_142750_volume_s3_storage_settings', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '627ce372-a192-4931-a5ae-cc164dfdcd3e');
INSERT INTO `migrations` VALUES ('23', 'craft', 'm151016_133600_delete_asset_thumbnails', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', 'e06cd0f6-4af3-4d20-937e-2f0a91261319');
INSERT INTO `migrations` VALUES ('24', 'craft', 'm151209_000000_move_logo', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '0e5c2635-de95-417b-9653-2452301bffbb');
INSERT INTO `migrations` VALUES ('25', 'craft', 'm151211_000000_rename_fileId_to_assetId', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', 'ff2aa79d-c479-457e-8e92-0fc3fd9a03af');
INSERT INTO `migrations` VALUES ('26', 'craft', 'm151215_000000_rename_asset_permissions', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', 'db272456-128d-4fcd-886c-1e58014564b2');
INSERT INTO `migrations` VALUES ('27', 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', 'bc59e433-388f-4488-9d23-596aa50821d7');
INSERT INTO `migrations` VALUES ('28', 'craft', 'm160708_185142_volume_hasUrls_setting', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '7234d3c5-33be-4a51-879e-f8255665a137');
INSERT INTO `migrations` VALUES ('29', 'craft', 'm160714_000000_increase_max_asset_filesize', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '867415d8-3e60-41b4-9c8d-8b162a6d89bf');
INSERT INTO `migrations` VALUES ('30', 'craft', 'm160727_194637_column_cleanup', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', 'aeb26893-15a1-4c90-b721-788827c5bf38');
INSERT INTO `migrations` VALUES ('31', 'craft', 'm160804_110002_userphotos_to_assets', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '6770d802-3331-4047-97ab-38d3e0d272ef');
INSERT INTO `migrations` VALUES ('32', 'craft', 'm160807_144858_sites', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '45420b10-f1ec-4de8-984e-f8ac2ec5c54c');
INSERT INTO `migrations` VALUES ('33', 'craft', 'm160829_000000_pending_user_content_cleanup', '2020-08-15 09:20:06', '2020-08-15 09:20:06', '2020-08-15 09:20:06', 'e70e28ec-6bfb-43fa-b1b0-1d0f1625137c');
INSERT INTO `migrations` VALUES ('34', 'craft', 'm160830_000000_asset_index_uri_increase', '2020-08-15 09:20:07', '2020-08-15 09:20:07', '2020-08-15 09:20:07', 'ce982d8c-4057-46b2-8ac6-4278c5c164a2');
INSERT INTO `migrations` VALUES ('35', 'craft', 'm160912_230520_require_entry_type_id', '2020-08-15 09:20:07', '2020-08-15 09:20:07', '2020-08-15 09:20:07', '02348ad4-5917-43ae-8516-49589b07cd27');
INSERT INTO `migrations` VALUES ('36', 'craft', 'm160913_134730_require_matrix_block_type_id', '2020-08-15 09:20:07', '2020-08-15 09:20:07', '2020-08-15 09:20:07', '42c19891-eaf7-47dd-81cf-fdbafadab6ec');
INSERT INTO `migrations` VALUES ('37', 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2020-08-15 09:20:07', '2020-08-15 09:20:07', '2020-08-15 09:20:07', 'baca6aa7-a91f-4d05-b977-a8492b56cfe2');
INSERT INTO `migrations` VALUES ('38', 'craft', 'm160920_231045_usergroup_handle_title_unique', '2020-08-15 09:20:07', '2020-08-15 09:20:07', '2020-08-15 09:20:07', 'bdb5f429-c8e9-46cf-99e6-583defbc4040');
INSERT INTO `migrations` VALUES ('39', 'craft', 'm160925_113941_route_uri_parts', '2020-08-15 09:20:07', '2020-08-15 09:20:07', '2020-08-15 09:20:07', '86e63f21-8acd-42d3-8443-6736e8305eeb');
INSERT INTO `migrations` VALUES ('40', 'craft', 'm161006_205918_schemaVersion_not_null', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '12d24377-1e01-4586-98b3-9d258d1e4ffc');
INSERT INTO `migrations` VALUES ('41', 'craft', 'm161007_130653_update_email_settings', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '92f4ae68-57e6-4ff4-b885-b6f1e1ba4b54');
INSERT INTO `migrations` VALUES ('42', 'craft', 'm161013_175052_newParentId', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '917e0584-1bbd-42ac-b1a7-5f35dad99147');
INSERT INTO `migrations` VALUES ('43', 'craft', 'm161021_102916_fix_recent_entries_widgets', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '1376e85b-1ea9-418e-b0f4-50cd8ded45b3');
INSERT INTO `migrations` VALUES ('44', 'craft', 'm161021_182140_rename_get_help_widget', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '3360d181-8eb1-46c1-af1a-3f538e47acd5');
INSERT INTO `migrations` VALUES ('45', 'craft', 'm161025_000000_fix_char_columns', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '2020-08-15 09:20:08', 'dcef5d32-f6d4-48d3-879c-b218a95bd586');
INSERT INTO `migrations` VALUES ('46', 'craft', 'm161029_124145_email_message_languages', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '2020-08-15 09:20:08', 'eec28f68-ac42-468c-a274-36856f9561ed');
INSERT INTO `migrations` VALUES ('47', 'craft', 'm161108_000000_new_version_format', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '2020-08-15 09:20:08', 'c3cc7cc0-050b-4f95-8f38-1fa5cad29053');
INSERT INTO `migrations` VALUES ('48', 'craft', 'm161109_000000_index_shuffle', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '2020-08-15 09:20:08', 'a6d07e77-42a2-4003-84d9-5e17e6b88fe1');
INSERT INTO `migrations` VALUES ('49', 'craft', 'm161122_185500_no_craft_app', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '1839c208-273d-4d95-a7fd-1877cbf3ebb8');
INSERT INTO `migrations` VALUES ('50', 'craft', 'm161125_150752_clear_urlmanager_cache', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '7be2b59a-7c84-4634-8522-da057d08912c');
INSERT INTO `migrations` VALUES ('51', 'craft', 'm161220_000000_volumes_hasurl_notnull', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '1c579f22-e7c0-4efb-a6e8-718d0c6019d8');
INSERT INTO `migrations` VALUES ('52', 'craft', 'm170114_161144_udates_permission', '2020-08-15 09:20:08', '2020-08-15 09:20:08', '2020-08-15 09:20:08', 'e30f7cd3-ee59-4b21-9f19-56eb4ad0b0b1');
INSERT INTO `migrations` VALUES ('53', 'craft', 'm170120_000000_schema_cleanup', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '66b22c99-bf2d-4f90-86d4-8a8788276aac');
INSERT INTO `migrations` VALUES ('54', 'craft', 'm170126_000000_assets_focal_point', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '2020-08-15 09:20:09', 'c54a3ac9-ef37-4a39-9d92-a10d4586390d');
INSERT INTO `migrations` VALUES ('55', 'craft', 'm170206_142126_system_name', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '2020-08-15 09:20:09', 'b4040a35-d3b8-4236-a8ea-766e23cf4f62');
INSERT INTO `migrations` VALUES ('56', 'craft', 'm170217_044740_category_branch_limits', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '9f0d7d18-888b-4076-89eb-ee3a303a3285');
INSERT INTO `migrations` VALUES ('57', 'craft', 'm170217_120224_asset_indexing_columns', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '2020-08-15 09:20:09', 'bdbda58d-e588-401d-967a-d10c059fa951');
INSERT INTO `migrations` VALUES ('58', 'craft', 'm170223_224012_plain_text_settings', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '4b568d10-3448-4f43-b466-d935f88f9edd');
INSERT INTO `migrations` VALUES ('59', 'craft', 'm170227_120814_focal_point_percentage', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '7006aa63-7e34-4c99-bcab-40684b7cd13d');
INSERT INTO `migrations` VALUES ('60', 'craft', 'm170228_171113_system_messages', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '2020-08-15 09:20:09', 'b0c1495f-8e29-41c1-87ce-c06205c27579');
INSERT INTO `migrations` VALUES ('61', 'craft', 'm170303_140500_asset_field_source_settings', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '2020-08-15 09:20:09', 'a3f011f3-9714-4f5b-9f3c-97c4be1beb71');
INSERT INTO `migrations` VALUES ('62', 'craft', 'm170306_150500_asset_temporary_uploads', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '89e39368-9cd3-42a0-8476-cc5fafaf1d05');
INSERT INTO `migrations` VALUES ('63', 'craft', 'm170523_190652_element_field_layout_ids', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '2020-08-15 09:20:09', 'd7fcdb9a-ac5d-41fd-8b54-95abf045ecca');
INSERT INTO `migrations` VALUES ('64', 'craft', 'm170612_000000_route_index_shuffle', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '2020-08-15 09:20:09', '7852879d-2da3-43f4-b226-35f70d0b87c0');
INSERT INTO `migrations` VALUES ('65', 'craft', 'm170621_195237_format_plugin_handles', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2020-08-15 09:20:10', 'f97a22b3-c54a-47c8-9d1f-01ddf3b3ef74');
INSERT INTO `migrations` VALUES ('66', 'craft', 'm170630_161027_deprecation_line_nullable', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '528f31de-0ddf-4ab0-85bd-266e139f420f');
INSERT INTO `migrations` VALUES ('67', 'craft', 'm170630_161028_deprecation_changes', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '4f27c4d2-9f21-4af1-920e-c1779c6517b2');
INSERT INTO `migrations` VALUES ('68', 'craft', 'm170703_181539_plugins_table_tweaks', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '63fc7092-bd02-4345-9468-05dc5c3eb226');
INSERT INTO `migrations` VALUES ('69', 'craft', 'm170704_134916_sites_tables', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '3b5c3dbb-b8af-4554-add7-762237983086');
INSERT INTO `migrations` VALUES ('70', 'craft', 'm170706_183216_rename_sequences', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2020-08-15 09:20:10', 'e841dc78-d9e4-4b36-9881-b411b8f494b1');
INSERT INTO `migrations` VALUES ('71', 'craft', 'm170707_094758_delete_compiled_traits', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '6094705a-52d0-4e10-a31e-39532d866357');
INSERT INTO `migrations` VALUES ('72', 'craft', 'm170731_190138_drop_asset_packagist', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2020-08-15 09:20:10', 'a0f3ed68-3bcc-4afe-a7e3-ed24ec19c45f');
INSERT INTO `migrations` VALUES ('73', 'craft', 'm170810_201318_create_queue_table', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '196c8059-9dbe-40c5-8c94-ba65f2b5c8a6');
INSERT INTO `migrations` VALUES ('74', 'craft', 'm170903_192801_longblob_for_queue_jobs', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '74a9f1b4-52fd-4ef7-881b-a1ef07c86ba4');
INSERT INTO `migrations` VALUES ('75', 'craft', 'm170914_204621_asset_cache_shuffle', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '490fef45-c9f0-47d7-bf60-dd3b9051ac27');
INSERT INTO `migrations` VALUES ('76', 'craft', 'm171011_214115_site_groups', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2020-08-15 09:20:10', 'c061700c-a81b-478f-8f9a-ef07efd0257c');
INSERT INTO `migrations` VALUES ('77', 'craft', 'm171012_151440_primary_site', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2020-08-15 09:20:10', '2f7fc69b-6d0f-4404-9a31-4b7e9a0d6311');
INSERT INTO `migrations` VALUES ('78', 'craft', 'm171013_142500_transform_interlace', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2020-08-15 09:20:11', 'f6c2e5ae-4476-4e01-ad46-07b5104bf2fa');
INSERT INTO `migrations` VALUES ('79', 'craft', 'm171016_092553_drop_position_select', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '44602627-19fa-45df-a27c-8fc315159d28');
INSERT INTO `migrations` VALUES ('80', 'craft', 'm171016_221244_less_strict_translation_method', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2020-08-15 09:20:11', 'd60c3faf-462e-4b04-8b07-1481924bc658');
INSERT INTO `migrations` VALUES ('81', 'craft', 'm171107_000000_assign_group_permissions', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2a4f45fb-61b9-49d2-88ba-23e432b4de59');
INSERT INTO `migrations` VALUES ('82', 'craft', 'm171117_000001_templatecache_index_tune', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '3d019897-dc66-423b-9eba-a287d49797b6');
INSERT INTO `migrations` VALUES ('83', 'craft', 'm171126_105927_disabled_plugins', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '58c193e4-124f-427b-b26e-207f07d4bf5c');
INSERT INTO `migrations` VALUES ('84', 'craft', 'm171130_214407_craftidtokens_table', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '651ae9ff-21c3-4bd4-a38e-748091a6361e');
INSERT INTO `migrations` VALUES ('85', 'craft', 'm171202_004225_update_email_settings', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2e91e9dd-f513-42b9-ae2f-4d1da97be6df');
INSERT INTO `migrations` VALUES ('86', 'craft', 'm171204_000001_templatecache_index_tune_deux', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '764d90ce-a990-4315-b694-8d0ca116bd97');
INSERT INTO `migrations` VALUES ('87', 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2020-08-15 09:20:11', 'd35d615c-3e74-4245-8c61-869ab90ee97a');
INSERT INTO `migrations` VALUES ('88', 'craft', 'm171218_143135_longtext_query_column', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '4aac90ba-6e95-4037-8a14-e4a10a9399df');
INSERT INTO `migrations` VALUES ('89', 'craft', 'm171231_055546_environment_variables_to_aliases', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '316fb8c9-046f-435c-8641-706c91b95d98');
INSERT INTO `migrations` VALUES ('90', 'craft', 'm180113_153740_drop_users_archived_column', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '2020-08-15 09:20:11', '90e01039-a2ee-4c34-b5b0-a31eca6fa477');
INSERT INTO `migrations` VALUES ('91', 'craft', 'm180122_213433_propagate_entries_setting', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', 'a5dc4f0d-5844-4118-b70a-e78da5370adf');
INSERT INTO `migrations` VALUES ('92', 'craft', 'm180124_230459_fix_propagate_entries_values', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', 'c5874087-175c-454a-9aaa-f3fcdceb5f6e');
INSERT INTO `migrations` VALUES ('93', 'craft', 'm180128_235202_set_tag_slugs', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '14e298ca-ebb6-413c-b777-57a7528a4fb5');
INSERT INTO `migrations` VALUES ('94', 'craft', 'm180202_185551_fix_focal_points', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '9d5c439d-4e00-402a-a2fb-a0d67c6b5b3e');
INSERT INTO `migrations` VALUES ('95', 'craft', 'm180217_172123_tiny_ints', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '8e37587a-7c52-404f-b1c6-571b202f5ca2');
INSERT INTO `migrations` VALUES ('96', 'craft', 'm180321_233505_small_ints', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '04bb70aa-4efa-4da4-b744-cb80d63e36d1');
INSERT INTO `migrations` VALUES ('97', 'craft', 'm180328_115523_new_license_key_statuses', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', 'd607069d-20c4-4a7c-a279-309959596e3f');
INSERT INTO `migrations` VALUES ('98', 'craft', 'm180404_182320_edition_changes', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '850e9c19-40c0-4598-b633-a6430d2df97a');
INSERT INTO `migrations` VALUES ('99', 'craft', 'm180411_102218_fix_db_routes', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '934318b6-1764-4db5-99a0-08132566ccca');
INSERT INTO `migrations` VALUES ('100', 'craft', 'm180416_205628_resourcepaths_table', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '99e16d4d-6fb0-4e85-87d7-856fd0a29805');
INSERT INTO `migrations` VALUES ('101', 'craft', 'm180418_205713_widget_cleanup', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', 'e04e2502-907b-4276-a099-bfba82b50760');
INSERT INTO `migrations` VALUES ('102', 'craft', 'm180425_203349_searchable_fields', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '85413bd1-36d9-4db4-93ce-ebee95505921');
INSERT INTO `migrations` VALUES ('103', 'craft', 'm180516_153000_uids_in_field_settings', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '44370e5c-2b2f-48c6-8baa-0c69b5e55885');
INSERT INTO `migrations` VALUES ('104', 'craft', 'm180517_173000_user_photo_volume_to_uid', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '037067a4-0303-4f51-a30e-1d5fff763b51');
INSERT INTO `migrations` VALUES ('105', 'craft', 'm180518_173000_permissions_to_uid', '2020-08-15 09:20:12', '2020-08-15 09:20:12', '2020-08-15 09:20:12', 'b1e9e30c-e810-4a00-b22b-d6bed4742591');
INSERT INTO `migrations` VALUES ('106', 'craft', 'm180520_173000_matrix_context_to_uids', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '134fa028-8586-4eae-9f60-befb000c96c5');
INSERT INTO `migrations` VALUES ('107', 'craft', 'm180521_172900_project_config_table', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '5316aa82-bd41-4b31-91f9-2aee04681937');
INSERT INTO `migrations` VALUES ('108', 'craft', 'm180521_173000_initial_yml_and_snapshot', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '6df04e7e-bcd3-440e-b7b6-4c180959510b');
INSERT INTO `migrations` VALUES ('109', 'craft', 'm180731_162030_soft_delete_sites', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', 'd719c99a-0222-468b-9cf6-091a1f3126aa');
INSERT INTO `migrations` VALUES ('110', 'craft', 'm180810_214427_soft_delete_field_layouts', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '4d7a430b-885a-4501-8302-0e7c9446f559');
INSERT INTO `migrations` VALUES ('111', 'craft', 'm180810_214439_soft_delete_elements', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', 'f79461ed-d2f7-4f41-8e89-7d4bc0696a99');
INSERT INTO `migrations` VALUES ('112', 'craft', 'm180824_193422_case_sensitivity_fixes', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '7cec1ecf-99cc-44dd-b45e-50b71e9e7f55');
INSERT INTO `migrations` VALUES ('113', 'craft', 'm180901_151639_fix_matrixcontent_tables', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', 'b58170c4-71c3-474b-bf7a-e1f9ccda8946');
INSERT INTO `migrations` VALUES ('114', 'craft', 'm180904_112109_permission_changes', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', 'f3237b2e-1061-46b3-a1b6-dce74904d77f');
INSERT INTO `migrations` VALUES ('115', 'craft', 'm180910_142030_soft_delete_sitegroups', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', 'daafc6d1-587b-47c6-9197-ebb090a0a00c');
INSERT INTO `migrations` VALUES ('116', 'craft', 'm181011_160000_soft_delete_asset_support', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', 'ba374780-c513-4aa7-9953-ecfec052f100');
INSERT INTO `migrations` VALUES ('117', 'craft', 'm181016_183648_set_default_user_settings', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', 'f787f3df-3200-4273-a302-c7ca42222062');
INSERT INTO `migrations` VALUES ('118', 'craft', 'm181017_225222_system_config_settings', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '8b51f963-cd5b-455d-890b-fde5d2baa53d');
INSERT INTO `migrations` VALUES ('119', 'craft', 'm181018_222343_drop_userpermissions_from_config', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '1aaab583-91ab-4567-bc1a-edbe251ee2d3');
INSERT INTO `migrations` VALUES ('120', 'craft', 'm181029_130000_add_transforms_routes_to_config', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', 'e76e74c5-64e9-4515-9960-d088f4dfffb9');
INSERT INTO `migrations` VALUES ('121', 'craft', 'm181112_203955_sequences_table', '2020-08-15 09:20:13', '2020-08-15 09:20:13', '2020-08-15 09:20:13', 'd9ab766b-72c7-4e75-80e0-1466a55db24d');
INSERT INTO `migrations` VALUES ('122', 'craft', 'm181121_001712_cleanup_field_configs', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '33a2f474-1b70-45d0-a866-9e95a7559a59');
INSERT INTO `migrations` VALUES ('123', 'craft', 'm181128_193942_fix_project_config', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', 'baa506c8-ccfb-4d8d-b630-29fc943ac842');
INSERT INTO `migrations` VALUES ('124', 'craft', 'm181130_143040_fix_schema_version', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', 'afc5914f-7233-452e-9c46-52a9a47e9fd9');
INSERT INTO `migrations` VALUES ('125', 'craft', 'm181211_143040_fix_entry_type_uids', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '19fbfcc2-1d10-47dd-bcb0-073e1e125113');
INSERT INTO `migrations` VALUES ('126', 'craft', 'm181217_153000_fix_structure_uids', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', 'f42a1abc-cd60-4c65-9975-2ae910cc748c');
INSERT INTO `migrations` VALUES ('127', 'craft', 'm190104_152725_store_licensed_plugin_editions', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '30e4c5fe-45ea-4912-8c02-fb09b8afc667');
INSERT INTO `migrations` VALUES ('128', 'craft', 'm190108_110000_cleanup_project_config', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '6cd350b1-5d8b-4af1-9ba8-c3c9951162cb');
INSERT INTO `migrations` VALUES ('129', 'craft', 'm190108_113000_asset_field_setting_change', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '061191f3-4607-44af-9591-41bd14e4700c');
INSERT INTO `migrations` VALUES ('130', 'craft', 'm190109_172845_fix_colspan', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', 'd07e84a4-2961-4746-8ff2-a2077816807c');
INSERT INTO `migrations` VALUES ('131', 'craft', 'm190110_150000_prune_nonexisting_sites', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', 'cfab5efa-666d-43de-9979-7ef6dee901cc');
INSERT INTO `migrations` VALUES ('132', 'craft', 'm190110_214819_soft_delete_volumes', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', 'a3f4c581-fa1e-475c-9645-2cc14da40cca');
INSERT INTO `migrations` VALUES ('133', 'craft', 'm190112_124737_fix_user_settings', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '655e648a-6f1f-4fca-a8e1-0e1dce2ba396');
INSERT INTO `migrations` VALUES ('134', 'craft', 'm190112_131225_fix_field_layouts', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', 'eb7a9b6a-92bb-46c3-97cd-cb77b90028a0');
INSERT INTO `migrations` VALUES ('135', 'craft', 'm190112_201010_more_soft_deletes', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '214b408d-4454-4e0f-8007-2d529f64769c');
INSERT INTO `migrations` VALUES ('136', 'craft', 'm190114_143000_more_asset_field_setting_changes', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '357e182d-73d1-4675-86bb-0bfe94347c0f');
INSERT INTO `migrations` VALUES ('137', 'craft', 'm190121_120000_rich_text_config_setting', '2020-08-15 09:20:14', '2020-08-15 09:20:14', '2020-08-15 09:20:14', 'd39631ec-f287-4345-b144-bafb24e9f2ed');
INSERT INTO `migrations` VALUES ('138', 'craft', 'm190125_191628_fix_email_transport_password', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', 'efb4ae28-6dab-4b93-88be-acd143efe6a9');
INSERT INTO `migrations` VALUES ('139', 'craft', 'm190128_181422_cleanup_volume_folders', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '9deb5a14-9eb0-48e4-a3fe-a4e9c4a95fe4');
INSERT INTO `migrations` VALUES ('140', 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '9bdde5e7-6471-4704-b1ac-bfb727c6191b');
INSERT INTO `migrations` VALUES ('141', 'craft', 'm190218_143000_element_index_settings_uid', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2b4c999b-fe69-4e72-a13e-fc176bad7eac');
INSERT INTO `migrations` VALUES ('142', 'craft', 'm190312_152740_element_revisions', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2d24b788-1e5b-432e-8481-05de8a058e97');
INSERT INTO `migrations` VALUES ('143', 'craft', 'm190327_235137_propagation_method', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', 'ef71cd21-eed8-4bb8-9397-4f453d712463');
INSERT INTO `migrations` VALUES ('144', 'craft', 'm190401_223843_drop_old_indexes', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2e36f9ea-a1f3-4270-9ab7-df2ab3f3cad1');
INSERT INTO `migrations` VALUES ('145', 'craft', 'm190416_014525_drop_unique_global_indexes', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '046b5746-1d0a-4c86-b4d7-7234236d54d0');
INSERT INTO `migrations` VALUES ('146', 'craft', 'm190417_085010_add_image_editor_permissions', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', 'e552ee00-66ee-4964-a8a2-76febe057a0d');
INSERT INTO `migrations` VALUES ('147', 'craft', 'm190502_122019_store_default_user_group_uid', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '4d845b0c-2958-401b-aadb-ccabd94d114b');
INSERT INTO `migrations` VALUES ('148', 'craft', 'm190504_150349_preview_targets', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '28454582-b094-47dd-b68c-ccc013144b2e');
INSERT INTO `migrations` VALUES ('149', 'craft', 'm190516_184711_job_progress_label', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '3bf21328-ee27-4c8d-8b57-58d2d2e904b9');
INSERT INTO `migrations` VALUES ('150', 'craft', 'm190523_190303_optional_revision_creators', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', 'f64f8a58-9f1c-4fa7-bc3c-9268293199df');
INSERT INTO `migrations` VALUES ('151', 'craft', 'm190529_204501_fix_duplicate_uids', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', 'dcf8fdc4-b452-44b6-9477-affdc94daa88');
INSERT INTO `migrations` VALUES ('152', 'craft', 'm190605_223807_unsaved_drafts', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', 'b541c397-dade-4564-9a4c-87f8ddfcc3a1');
INSERT INTO `migrations` VALUES ('153', 'craft', 'm190607_230042_entry_revision_error_tables', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '89ee6285-8d4e-4ce1-a2e5-33e34f5c9c22');
INSERT INTO `migrations` VALUES ('154', 'craft', 'm190608_033429_drop_elements_uid_idx', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2020-08-15 09:20:15', '2dfa43b5-74bd-4d4d-b1b7-850f96de16ef');
INSERT INTO `migrations` VALUES ('155', 'craft', 'm190617_164400_add_gqlschemas_table', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '2020-08-15 09:20:16', 'b4c6d8bb-076b-4e24-9a56-aee55a0c0ec8');
INSERT INTO `migrations` VALUES ('156', 'craft', 'm190624_234204_matrix_propagation_method', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '44a74222-6254-424b-8dfd-9d9eec3b13e4');
INSERT INTO `migrations` VALUES ('157', 'craft', 'm190711_153020_drop_snapshots', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '29708f2f-dfe7-4e0d-b9ad-1274e6af03f2');
INSERT INTO `migrations` VALUES ('158', 'craft', 'm190712_195914_no_draft_revisions', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '2ace355c-fcce-4ce4-984f-8b29051387ab');
INSERT INTO `migrations` VALUES ('159', 'craft', 'm190723_140314_fix_preview_targets_column', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '69b2550b-ba27-4dee-8535-060e75554d34');
INSERT INTO `migrations` VALUES ('160', 'craft', 'm190820_003519_flush_compiled_templates', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '24fb1155-dad2-4385-b28f-42ae2f5207e7');
INSERT INTO `migrations` VALUES ('161', 'craft', 'm190823_020339_optional_draft_creators', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '027c6b81-a535-40ba-b565-13d1a864a3ce');
INSERT INTO `migrations` VALUES ('162', 'craft', 'm190913_152146_update_preview_targets', '2020-08-15 09:20:16', '2020-08-15 09:20:16', '2020-08-15 09:20:16', 'd8c6a32a-dd98-43a8-b283-3b33e6b669b7');
INSERT INTO `migrations` VALUES ('163', 'craft', 'm191107_122000_add_gql_project_config_support', '2020-08-15 09:20:17', '2020-08-15 09:20:17', '2020-08-15 09:20:17', '733363dc-3d97-4960-b81e-e9498b9567a2');
INSERT INTO `migrations` VALUES ('164', 'craft', 'm191204_085100_pack_savable_component_settings', '2020-08-15 09:20:17', '2020-08-15 09:20:17', '2020-08-15 09:20:17', 'f02d32cf-9991-4583-9743-003ea91eb4f7');
INSERT INTO `migrations` VALUES ('165', 'craft', 'm191206_001148_change_tracking', '2020-08-15 09:20:17', '2020-08-15 09:20:17', '2020-08-15 09:20:17', 'f30d51d8-bc7e-400d-99e9-8544f98ddcdc');
INSERT INTO `migrations` VALUES ('166', 'craft', 'm191216_191635_asset_upload_tracking', '2020-08-15 09:20:17', '2020-08-15 09:20:17', '2020-08-15 09:20:17', '6e6a329d-dc47-4175-a49e-6bfd2f88a69a');
INSERT INTO `migrations` VALUES ('167', 'craft', 'm191222_002848_peer_asset_permissions', '2020-08-15 09:20:17', '2020-08-15 09:20:17', '2020-08-15 09:20:17', '5eb8c42b-d5ab-4870-add4-ad2fbd9cf526');
INSERT INTO `migrations` VALUES ('168', 'craft', 'm200127_172522_queue_channels', '2020-08-15 09:20:17', '2020-08-15 09:20:17', '2020-08-15 09:20:17', '239dfb05-ef98-43a0-beed-004cc2742e5c');
INSERT INTO `migrations` VALUES ('169', 'craft', 'm200211_175048_truncate_element_query_cache', '2020-08-15 09:20:17', '2020-08-15 09:20:17', '2020-08-15 09:20:17', '9883aecb-e5f1-41a5-9e27-d753cb65b2ff');
INSERT INTO `migrations` VALUES ('170', 'craft', 'm200213_172522_new_elements_index', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '0a9d81ae-250f-41e9-93cc-568f12e706e1');
INSERT INTO `migrations` VALUES ('171', 'craft', 'm200228_195211_long_deprecation_messages', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '2020-08-15 09:20:18', 'e35565f4-ae60-407d-9c23-f995a2b02cdb');
INSERT INTO `migrations` VALUES ('172', 'craft', 'm200306_054652_disabled_sites', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '94329fda-ed26-4277-8a5a-895c6ff50c89');
INSERT INTO `migrations` VALUES ('173', 'craft', 'm200522_191453_clear_template_caches', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '2020-08-15 09:20:18', 'b4ca5e75-828f-4c76-a7b4-ccee7bed3fe9');
INSERT INTO `migrations` VALUES ('174', 'craft', 'm200606_231117_migration_tracks', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '21837330-d812-43a1-829a-83354ec84b68');
INSERT INTO `migrations` VALUES ('175', 'craft', 'm200619_215137_title_translation_method', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '2020-08-15 09:20:18', 'cb91729d-6c00-4316-858b-e9c1dd247aa2');
INSERT INTO `migrations` VALUES ('176', 'craft', 'm200620_005028_user_group_descriptions', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '2020-08-15 09:20:18', 'c52a8506-e616-4042-826d-910d40d3bd44');
INSERT INTO `migrations` VALUES ('177', 'craft', 'm200620_230205_field_layout_changes', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '651e5a2a-da19-4582-a438-5f7e7e45ad95');
INSERT INTO `migrations` VALUES ('178', 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '9b6edc27-58e8-4137-aee5-2afdf2c7aa14');
INSERT INTO `migrations` VALUES ('179', 'craft', 'm200629_112700_remove_project_config_legacy_files', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '2020-08-15 09:20:18', 'b2848e05-29e6-47e5-b683-fa6268ef2235');
INSERT INTO `migrations` VALUES ('180', 'craft', 'm200630_183000_drop_configmap', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '2020-08-15 09:20:18', '3c15bc0d-7324-4440-87c1-ed9467df68b6');
INSERT INTO `migrations` VALUES ('181', 'craft', 'm200715_113400_transform_index_error_flag', '2020-08-15 09:20:19', '2020-08-15 09:20:19', '2020-08-15 09:20:19', 'fec2e3e6-fa32-4f16-b058-9934a0245836');
INSERT INTO `migrations` VALUES ('182', 'craft', 'm200716_110900_replace_file_asset_permissions', '2020-08-15 09:20:19', '2020-08-15 09:20:19', '2020-08-15 09:20:19', '7bfc1488-edca-4de8-9951-16a2db896c51');
INSERT INTO `migrations` VALUES ('183', 'craft', 'm200716_153800_public_token_settings_in_project_config', '2020-08-15 09:20:19', '2020-08-15 09:20:19', '2020-08-15 09:20:19', '793a910f-a33e-43e8-b5cc-c615e214b6cc');
INSERT INTO `migrations` VALUES ('184', 'craft', 'm200720_175543_drop_unique_constraints', '2020-08-15 09:20:19', '2020-08-15 09:20:19', '2020-08-15 09:20:19', '69ad7a4e-9b4b-4dbc-be50-1482a806e7b2');

-- ----------------------------
-- Table structure for plugins
-- ----------------------------
DROP TABLE IF EXISTS `plugins`;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plugins
-- ----------------------------
INSERT INTO `plugins` VALUES ('1', 'assetrev', '6.0.2', '1.0.0', 'unknown', null, '2020-08-15 09:19:54', '2020-08-15 09:19:54', '2020-08-17 04:15:29', 'e2e4e075-837b-41c5-a7b5-10c92e7d7736');
INSERT INTO `plugins` VALUES ('2', 'seomatic', '3.3.15', '3.0.9', 'invalid', null, '2020-08-15 09:19:54', '2020-08-15 09:19:54', '2020-08-17 04:15:29', '8a1a8a04-fde7-408c-a496-6af0e023b2b8');

-- ----------------------------
-- Table structure for projectconfig
-- ----------------------------
DROP TABLE IF EXISTS `projectconfig`;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projectconfig
-- ----------------------------
INSERT INTO `projectconfig` VALUES ('dateModified', '1597666264');
INSERT INTO `projectconfig` VALUES ('email.fromEmail', '\"meobius123@gmail.com\"');
INSERT INTO `projectconfig` VALUES ('email.fromName', '\"Craft Starter\"');
INSERT INTO `projectconfig` VALUES ('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.0.fieldUid', '\"fc11d5eb-d042-43c4-bc6e-63a38c201090\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.0.instructions', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.0.label', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.0.required', 'false');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.0.tip', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.0.width', '100');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.1.fieldUid', '\"bac1e266-423c-4b7c-bd38-1bd1c6a3d75a\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.1.instructions', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.1.label', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.1.required', 'false');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.1.tip', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.1.warning', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.1.width', '100');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.2.fieldUid', '\"7d762406-b88d-4da2-9461-95561df3178f\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.2.instructions', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.2.label', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.2.required', 'false');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.2.tip', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.2.warning', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.2.width', '100');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.3.fieldUid', '\"5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.3.instructions', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.3.label', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.3.required', 'false');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.3.tip', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.3.warning', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.3.width', '100');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.autocapitalize', 'true');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.autocomplete', 'false');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.autocorrect', 'true');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.autofocus', 'false');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.class', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.disabled', 'false');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.id', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.instructions', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.label', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.max', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.min', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.name', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.orientation', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.placeholder', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.readonly', 'false');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.requirable', 'false');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.required', 'false');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.size', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.step', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.tip', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.title', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.warning', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.elements.4.width', '100');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.name', '\"Homepage\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.fieldLayouts.89d029fc-998a-4fe6-91d3-e731168d0ffd.tabs.0.sortOrder', '1');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.handle', '\"homepage\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.hasTitleField', 'true');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.name', '\"Homepage\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.section', '\"dd8528fb-979f-4d18-9932-4cd4af05f0a0\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.sortOrder', '1');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.titleFormat', '\"{section.name|raw}\"');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.titleTranslationKeyFormat', 'null');
INSERT INTO `projectconfig` VALUES ('entryTypes.2958e5a3-8ad6-48ff-95d9-0bc95a77ab35.titleTranslationMethod', '\"site\"');
INSERT INTO `projectconfig` VALUES ('fieldGroups.64e782e6-253a-47a6-ad98-235fc176974a.name', '\"Common\"');
INSERT INTO `projectconfig` VALUES ('fieldGroups.d30f5b86-f31a-45c3-8ec2-7cd5bfafe237.name', '\"Homepage\"');
INSERT INTO `projectconfig` VALUES ('fields.5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f.contentColumnType', '\"string\"');
INSERT INTO `projectconfig` VALUES ('fields.5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f.fieldGroup', '\"d30f5b86-f31a-45c3-8ec2-7cd5bfafe237\"');
INSERT INTO `projectconfig` VALUES ('fields.5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f.handle', '\"locationSlide\"');
INSERT INTO `projectconfig` VALUES ('fields.5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f.instructions', '\"\"');
INSERT INTO `projectconfig` VALUES ('fields.5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f.name', '\"Location Slide\"');
INSERT INTO `projectconfig` VALUES ('fields.5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f.searchable', 'false');
INSERT INTO `projectconfig` VALUES ('fields.5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f.settings.contentTable', '\"{{%matrixcontent_locationslide}}\"');
INSERT INTO `projectconfig` VALUES ('fields.5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f.settings.maxBlocks', '\"\"');
INSERT INTO `projectconfig` VALUES ('fields.5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f.settings.minBlocks', '\"\"');
INSERT INTO `projectconfig` VALUES ('fields.5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f.settings.propagationMethod', '\"all\"');
INSERT INTO `projectconfig` VALUES ('fields.5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f.translationKeyFormat', 'null');
INSERT INTO `projectconfig` VALUES ('fields.5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f.translationMethod', '\"site\"');
INSERT INTO `projectconfig` VALUES ('fields.5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f.type', '\"craft\\\\fields\\\\Matrix\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.contentColumnType', '\"string\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.fieldGroup', '\"d30f5b86-f31a-45c3-8ec2-7cd5bfafe237\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.handle', '\"relaxImage\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.instructions', '\"\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.name', '\"Relax Image\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.searchable', 'true');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.allowedKinds.0', '\"image\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.allowSelfRelations', 'false');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.defaultUploadLocationSource', '\"volume:66b75dae-aadd-43b7-857e-6d3d40b4b6a2\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.defaultUploadLocationSubpath', '\"\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.limit', '\"1\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.localizeRelations', 'false');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.restrictFiles', '\"1\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.selectionLabel', '\"\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.showSiteMenu', 'true');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.showUnpermittedFiles', 'false');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.showUnpermittedVolumes', 'true');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.singleUploadLocationSource', '\"volume:66b75dae-aadd-43b7-857e-6d3d40b4b6a2\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.singleUploadLocationSubpath', '\"homepage\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.source', 'null');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.sources', '\"*\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.targetSiteId', 'null');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.useSingleFolder', 'true');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.validateRelatedElements', 'false');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.settings.viewMode', '\"list\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.translationKeyFormat', 'null');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.translationMethod', '\"site\"');
INSERT INTO `projectconfig` VALUES ('fields.7d762406-b88d-4da2-9461-95561df3178f.type', '\"craft\\\\fields\\\\Assets\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.contentColumnType', '\"string\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.fieldGroup', '\"d30f5b86-f31a-45c3-8ec2-7cd5bfafe237\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.handle', '\"bannerImage\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.instructions', '\"\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.name', '\"Banner Image\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.searchable', 'false');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.allowedKinds.0', '\"image\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.allowSelfRelations', 'false');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.defaultUploadLocationSource', '\"volume:66b75dae-aadd-43b7-857e-6d3d40b4b6a2\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.defaultUploadLocationSubpath', '\"homepage\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.limit', '\"1\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.localizeRelations', 'false');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.restrictFiles', '\"1\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.selectionLabel', '\"\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.showSiteMenu', 'true');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.showUnpermittedFiles', 'false');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.showUnpermittedVolumes', 'true');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.singleUploadLocationSource', '\"volume:66b75dae-aadd-43b7-857e-6d3d40b4b6a2\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.singleUploadLocationSubpath', '\"\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.source', 'null');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.sources', '\"*\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.targetSiteId', 'null');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.useSingleFolder', 'false');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.validateRelatedElements', 'false');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.settings.viewMode', '\"list\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.translationKeyFormat', 'null');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.translationMethod', '\"site\"');
INSERT INTO `projectconfig` VALUES ('fields.bac1e266-423c-4b7c-bd38-1bd1c6a3d75a.type', '\"craft\\\\fields\\\\Assets\"');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.contentColumnType', '\"text\"');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.fieldGroup', '\"d30f5b86-f31a-45c3-8ec2-7cd5bfafe237\"');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.handle', '\"bannerTitle\"');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.instructions', '\"\"');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.name', '\"Banner Title\"');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.searchable', 'true');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.settings.byteLimit', 'null');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.settings.charLimit', 'null');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.settings.code', '\"\"');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.settings.columnType', 'null');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.settings.initialRows', '\"4\"');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.settings.multiline', '\"\"');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.settings.placeholder', '\"\"');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.settings.uiMode', '\"normal\"');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.translationKeyFormat', 'null');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.translationMethod', '\"none\"');
INSERT INTO `projectconfig` VALUES ('fields.fc11d5eb-d042-43c4-bc6e-63a38c201090.type', '\"craft\\\\fields\\\\PlainText\"');
INSERT INTO `projectconfig` VALUES ('graphql.publicToken.enabled', 'true');
INSERT INTO `projectconfig` VALUES ('graphql.publicToken.expiryDate', 'null');
INSERT INTO `projectconfig` VALUES ('graphql.schemas.9e3339bf-e761-40ad-8cf8-f19e1bc3034c.isPublic', 'true');
INSERT INTO `projectconfig` VALUES ('graphql.schemas.9e3339bf-e761-40ad-8cf8-f19e1bc3034c.name', '\"Public Schema\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.field', '\"5ab7a284-29b5-4ba7-b9a4-0a1d4b12144f\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.0.fieldUid', '\"4785a585-910c-4da0-8299-f05af7f8207c\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.0.instructions', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.0.label', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.0.required', 'true');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.0.tip', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.0.width', '100');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.1.fieldUid', '\"998cedd0-1ef4-4dd3-87f8-8d308068b2bc\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.1.instructions', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.1.label', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.1.required', 'true');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.1.tip', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.1.warning', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.elements.1.width', '100');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.name', '\"Content\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fieldLayouts.65f4d158-c8bf-41f8-a6ee-507baf2a8b5f.tabs.0.sortOrder', '1');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.contentColumnType', '\"text\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.fieldGroup', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.handle', '\"slideTitle\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.instructions', '\"\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.name', '\"Slide Title\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.searchable', 'true');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.settings.byteLimit', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.settings.charLimit', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.settings.code', '\"\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.settings.columnType', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.settings.initialRows', '\"4\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.settings.multiline', '\"\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.settings.placeholder', '\"\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.settings.uiMode', '\"normal\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.translationKeyFormat', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.translationMethod', '\"none\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.4785a585-910c-4da0-8299-f05af7f8207c.type', '\"craft\\\\fields\\\\PlainText\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.contentColumnType', '\"string\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.fieldGroup', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.handle', '\"slideImage\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.instructions', '\"\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.name', '\"Slide Image\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.searchable', 'true');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.allowedKinds.0', '\"image\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.allowSelfRelations', 'false');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.defaultUploadLocationSource', '\"volume:66b75dae-aadd-43b7-857e-6d3d40b4b6a2\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.defaultUploadLocationSubpath', '\"\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.limit', '\"1\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.localizeRelations', 'false');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.restrictFiles', '\"1\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.selectionLabel', '\"\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.showSiteMenu', 'true');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.showUnpermittedFiles', 'false');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.showUnpermittedVolumes', 'true');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.singleUploadLocationSource', '\"volume:66b75dae-aadd-43b7-857e-6d3d40b4b6a2\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.singleUploadLocationSubpath', '\"\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.source', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.sources', '\"*\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.targetSiteId', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.useSingleFolder', 'false');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.validateRelatedElements', 'false');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.settings.viewMode', '\"list\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.translationKeyFormat', 'null');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.translationMethod', '\"site\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.fields.998cedd0-1ef4-4dd3-87f8-8d308068b2bc.type', '\"craft\\\\fields\\\\Assets\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.handle', '\"locationDetails\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.name', '\"Location Details\"');
INSERT INTO `projectconfig` VALUES ('matrixBlockTypes.a921eda3-b6f3-4838-bb29-96913e0fce79.sortOrder', '1');
INSERT INTO `projectconfig` VALUES ('plugins.assetrev.edition', '\"standard\"');
INSERT INTO `projectconfig` VALUES ('plugins.assetrev.enabled', 'true');
INSERT INTO `projectconfig` VALUES ('plugins.assetrev.schemaVersion', '\"1.0.0\"');
INSERT INTO `projectconfig` VALUES ('plugins.seomatic.edition', '\"standard\"');
INSERT INTO `projectconfig` VALUES ('plugins.seomatic.enabled', 'true');
INSERT INTO `projectconfig` VALUES ('plugins.seomatic.schemaVersion', '\"3.0.9\"');
INSERT INTO `projectconfig` VALUES ('sections.dd8528fb-979f-4d18-9932-4cd4af05f0a0.enableVersioning', 'true');
INSERT INTO `projectconfig` VALUES ('sections.dd8528fb-979f-4d18-9932-4cd4af05f0a0.handle', '\"homepage\"');
INSERT INTO `projectconfig` VALUES ('sections.dd8528fb-979f-4d18-9932-4cd4af05f0a0.name', '\"Homepage\"');
INSERT INTO `projectconfig` VALUES ('sections.dd8528fb-979f-4d18-9932-4cd4af05f0a0.propagationMethod', '\"all\"');
INSERT INTO `projectconfig` VALUES ('sections.dd8528fb-979f-4d18-9932-4cd4af05f0a0.siteSettings.da06c0e6-3443-4f86-923d-5bddf6fb6f71.enabledByDefault', 'true');
INSERT INTO `projectconfig` VALUES ('sections.dd8528fb-979f-4d18-9932-4cd4af05f0a0.siteSettings.da06c0e6-3443-4f86-923d-5bddf6fb6f71.hasUrls', 'true');
INSERT INTO `projectconfig` VALUES ('sections.dd8528fb-979f-4d18-9932-4cd4af05f0a0.siteSettings.da06c0e6-3443-4f86-923d-5bddf6fb6f71.template', '\"_views\\\\home\"');
INSERT INTO `projectconfig` VALUES ('sections.dd8528fb-979f-4d18-9932-4cd4af05f0a0.siteSettings.da06c0e6-3443-4f86-923d-5bddf6fb6f71.uriFormat', '\"__home__\"');
INSERT INTO `projectconfig` VALUES ('sections.dd8528fb-979f-4d18-9932-4cd4af05f0a0.type', '\"single\"');
INSERT INTO `projectconfig` VALUES ('siteGroups.409229b6-3aa6-4551-be04-e9be6415b2e6.name', '\"Craft Starter\"');
INSERT INTO `projectconfig` VALUES ('sites.da06c0e6-3443-4f86-923d-5bddf6fb6f71.baseUrl', '\"http://$DEFAULT_SITE_URL\"');
INSERT INTO `projectconfig` VALUES ('sites.da06c0e6-3443-4f86-923d-5bddf6fb6f71.enabled', 'true');
INSERT INTO `projectconfig` VALUES ('sites.da06c0e6-3443-4f86-923d-5bddf6fb6f71.handle', '\"default\"');
INSERT INTO `projectconfig` VALUES ('sites.da06c0e6-3443-4f86-923d-5bddf6fb6f71.hasUrls', 'true');
INSERT INTO `projectconfig` VALUES ('sites.da06c0e6-3443-4f86-923d-5bddf6fb6f71.language', '\"en-US\"');
INSERT INTO `projectconfig` VALUES ('sites.da06c0e6-3443-4f86-923d-5bddf6fb6f71.name', '\"Craft Starter\"');
INSERT INTO `projectconfig` VALUES ('sites.da06c0e6-3443-4f86-923d-5bddf6fb6f71.primary', 'true');
INSERT INTO `projectconfig` VALUES ('sites.da06c0e6-3443-4f86-923d-5bddf6fb6f71.siteGroup', '\"409229b6-3aa6-4551-be04-e9be6415b2e6\"');
INSERT INTO `projectconfig` VALUES ('sites.da06c0e6-3443-4f86-923d-5bddf6fb6f71.sortOrder', '1');
INSERT INTO `projectconfig` VALUES ('system.edition', '\"solo\"');
INSERT INTO `projectconfig` VALUES ('system.live', 'true');
INSERT INTO `projectconfig` VALUES ('system.name', '\"Craft Starter\"');
INSERT INTO `projectconfig` VALUES ('system.schemaVersion', '\"3.5.12\"');
INSERT INTO `projectconfig` VALUES ('system.timeZone', '\"America/Los_Angeles\"');
INSERT INTO `projectconfig` VALUES ('users.allowPublicRegistration', 'false');
INSERT INTO `projectconfig` VALUES ('users.defaultGroup', 'null');
INSERT INTO `projectconfig` VALUES ('users.photoSubpath', 'null');
INSERT INTO `projectconfig` VALUES ('users.photoVolumeUid', 'null');
INSERT INTO `projectconfig` VALUES ('users.requireEmailVerification', 'true');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.autocapitalize', 'true');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.autocomplete', 'false');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.autocorrect', 'true');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.autofocus', 'false');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.class', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.disabled', 'false');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.id', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.instructions', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.label', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.max', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.min', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.name', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.orientation', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.placeholder', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.readonly', 'false');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.requirable', 'false');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.required', 'false');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.size', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.step', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.tip', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.title', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\TitleField\"');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.elements.0.width', '100');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.name', '\"Content\"');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.fieldLayouts.ad16a14f-0369-4441-ac0b-8abbbffda296.tabs.0.sortOrder', '1');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.handle', '\"files\"');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.hasUrls', 'true');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.name', '\"Files\"');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.settings.path', '\"@webroot/files\"');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.sortOrder', '1');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.type', '\"craft\\\\volumes\\\\Local\"');
INSERT INTO `projectconfig` VALUES ('volumes.66b75dae-aadd-43b7-857e-6d3d40b4b6a2.url', '\"@web/files\"');

-- ----------------------------
-- Table structure for queue
-- ----------------------------
DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of queue
-- ----------------------------

-- ----------------------------
-- Table structure for relations
-- ----------------------------
DROP TABLE IF EXISTS `relations`;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `relations_sourceId_idx` (`sourceId`),
  KEY `relations_targetId_idx` (`targetId`),
  KEY `relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relations
-- ----------------------------
INSERT INTO `relations` VALUES ('10', '5', '40', null, '23', '1', '2020-08-17 11:17:39', '2020-08-17 11:17:39', '8da1069a-b36e-4a25-8021-59bed133b1f7');
INSERT INTO `relations` VALUES ('12', '5', '42', null, '41', '1', '2020-08-17 11:26:07', '2020-08-17 11:26:07', '327d508a-1c4b-43b5-a3b0-759f90d63486');
INSERT INTO `relations` VALUES ('13', '5', '43', null, '41', '1', '2020-08-17 11:45:48', '2020-08-17 11:45:48', 'da72c1a6-ff0b-43db-8e6f-1b4311fc4928');
INSERT INTO `relations` VALUES ('14', '5', '16', null, '44', '1', '2020-08-17 11:48:39', '2020-08-17 11:48:39', '671f4279-2028-4d2e-a2bc-b2e1e04c7989');
INSERT INTO `relations` VALUES ('15', '6', '16', null, '45', '1', '2020-08-17 11:48:39', '2020-08-17 11:48:39', '1b828daf-37b9-40d4-b6db-7373702cf039');
INSERT INTO `relations` VALUES ('16', '5', '46', null, '44', '1', '2020-08-17 11:48:39', '2020-08-17 11:48:39', '68f5804e-2478-44e0-832f-404370ddfde8');
INSERT INTO `relations` VALUES ('17', '6', '46', null, '45', '1', '2020-08-17 11:48:39', '2020-08-17 11:48:39', '0fa6e2ef-f77b-442d-8e9a-be7d7690239b');
INSERT INTO `relations` VALUES ('18', '5', '47', null, '44', '1', '2020-08-17 12:10:22', '2020-08-17 12:10:22', '6ddf1c11-472c-4fe5-8990-3144f214f670');
INSERT INTO `relations` VALUES ('19', '6', '47', null, '45', '1', '2020-08-17 12:10:22', '2020-08-17 12:10:22', '9f9e9c3a-f72d-40f3-a865-b716ff243430');
INSERT INTO `relations` VALUES ('20', '9', '54', null, '50', '1', '2020-08-17 12:12:46', '2020-08-17 12:12:46', '1de7bd0c-e95c-4ecd-9d3c-62755bfa5073');
INSERT INTO `relations` VALUES ('21', '9', '55', null, '52', '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '99a56f36-2ac9-43d0-9927-b0830909aac1');
INSERT INTO `relations` VALUES ('22', '9', '56', null, '53', '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '642c6e3b-a452-4214-914d-1ebfc332ae59');
INSERT INTO `relations` VALUES ('23', '5', '57', null, '44', '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '17be8c9f-9929-4f59-af28-07c0b457cc7c');
INSERT INTO `relations` VALUES ('24', '6', '57', null, '45', '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '37097d79-279d-4f10-b3ce-8f1e4b885332');
INSERT INTO `relations` VALUES ('25', '9', '58', null, '50', '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '8845a485-a320-4b27-9353-4a7713a0be9c');
INSERT INTO `relations` VALUES ('26', '9', '59', null, '52', '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', 'd1e76810-bce2-4f25-937e-04fa500e6a00');
INSERT INTO `relations` VALUES ('27', '9', '60', null, '53', '1', '2020-08-17 12:12:47', '2020-08-17 12:12:47', '96fc977d-c576-4ef8-9e3f-c274473cb5f3');
INSERT INTO `relations` VALUES ('28', '5', '61', null, '44', '1', '2020-08-17 12:16:34', '2020-08-17 12:16:34', '7b73782c-2152-4049-bd9c-003f0af968c5');
INSERT INTO `relations` VALUES ('29', '6', '61', null, '45', '1', '2020-08-17 12:16:34', '2020-08-17 12:16:34', '2a8d36a7-0466-46f7-b84d-7d62947b4194');
INSERT INTO `relations` VALUES ('30', '9', '62', null, '50', '1', '2020-08-17 12:16:34', '2020-08-17 12:16:34', 'fab672ed-fc9f-4b83-b23c-20f96d591858');
INSERT INTO `relations` VALUES ('31', '9', '63', null, '52', '1', '2020-08-17 12:16:34', '2020-08-17 12:16:34', '839f5005-1d65-4e4b-a225-ba4f8862305e');
INSERT INTO `relations` VALUES ('32', '9', '64', null, '53', '1', '2020-08-17 12:16:34', '2020-08-17 12:16:34', '0073b105-e9fb-439e-8a9f-468b658f3ae2');
INSERT INTO `relations` VALUES ('33', '5', '65', null, '44', '1', '2020-08-17 12:17:31', '2020-08-17 12:17:31', '9faa5166-24ff-435f-b701-978c3ecef064');
INSERT INTO `relations` VALUES ('34', '6', '65', null, '45', '1', '2020-08-17 12:17:31', '2020-08-17 12:17:31', '6b21e5b9-fee2-4d05-8695-48beba983c61');
INSERT INTO `relations` VALUES ('35', '9', '66', null, '50', '1', '2020-08-17 12:17:31', '2020-08-17 12:17:31', 'e0db69bc-4c31-42f4-ab04-002baabd822a');
INSERT INTO `relations` VALUES ('36', '9', '67', null, '52', '1', '2020-08-17 12:17:31', '2020-08-17 12:17:31', 'dde7af3c-d8b2-44cb-94af-46d42f12fe31');
INSERT INTO `relations` VALUES ('37', '9', '68', null, '53', '1', '2020-08-17 12:17:31', '2020-08-17 12:17:31', 'ba107f62-63d3-4c87-9037-ea8e33bda810');

-- ----------------------------
-- Table structure for resourcepaths
-- ----------------------------
DROP TABLE IF EXISTS `resourcepaths`;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resourcepaths
-- ----------------------------
INSERT INTO `resourcepaths` VALUES ('1126a26b', '@lib/d3');
INSERT INTO `resourcepaths` VALUES ('1827bef8', '@lib/jquery-touch-events');
INSERT INTO `resourcepaths` VALUES ('1aa1b471', '@lib/prismjs');
INSERT INTO `resourcepaths` VALUES ('1f83823a', '@lib/picturefill');
INSERT INTO `resourcepaths` VALUES ('229bb5ed', '@lib/garnishjs');
INSERT INTO `resourcepaths` VALUES ('252b6881', '@app/web/assets/admintable/dist');
INSERT INTO `resourcepaths` VALUES ('329e492', '@nystudio107/seomatic/assetbundles/seomatic/dist');
INSERT INTO `resourcepaths` VALUES ('331a2afa', '@app/web/assets/editsection/dist');
INSERT INTO `resourcepaths` VALUES ('37dd61d3', '@lib/fabric');
INSERT INTO `resourcepaths` VALUES ('4191eb34', '@lib/xregexp');
INSERT INTO `resourcepaths` VALUES ('4bfdafbe', '@lib/selectize');
INSERT INTO `resourcepaths` VALUES ('4f3e3063', '@app/web/assets/updates/dist');
INSERT INTO `resourcepaths` VALUES ('546a4ce5', '@app/web/assets/matrix/dist');
INSERT INTO `resourcepaths` VALUES ('5b486ed1', '@app/web/assets/editentry/dist');
INSERT INTO `resourcepaths` VALUES ('76b83c4', '@lib/fileupload');
INSERT INTO `resourcepaths` VALUES ('7beeacd1', '@app/web/assets/dashboard/dist');
INSERT INTO `resourcepaths` VALUES ('7c89829f', '@app/web/assets/fields/dist');
INSERT INTO `resourcepaths` VALUES ('82a649c0', '@lib/velocity');
INSERT INTO `resourcepaths` VALUES ('9329bebd', '@bower/jquery/dist');
INSERT INTO `resourcepaths` VALUES ('95862bbf', '@app/web/assets/craftsupport/dist');
INSERT INTO `resourcepaths` VALUES ('9657a427', '@app/web/assets/fieldsettings/dist');
INSERT INTO `resourcepaths` VALUES ('9e81e628', '@lib/jquery.payment');
INSERT INTO `resourcepaths` VALUES ('a3dbafb6', '@app/web/assets/pluginstore/dist');
INSERT INTO `resourcepaths` VALUES ('a5aec510', '@app/web/assets/recententries/dist');
INSERT INTO `resourcepaths` VALUES ('b039d4bd', '@app/web/assets/updateswidget/dist');
INSERT INTO `resourcepaths` VALUES ('b8e3e29d', '@app/web/assets/cp/dist');
INSERT INTO `resourcepaths` VALUES ('bc8bcd3', '@lib/iframe-resizer');
INSERT INTO `resourcepaths` VALUES ('bcb91548', '@lib/element-resize-detector');
INSERT INTO `resourcepaths` VALUES ('bcddf7e3', '@app/web/assets/login/dist');
INSERT INTO `resourcepaths` VALUES ('c1f8a923', '@app/web/assets/feed/dist');
INSERT INTO `resourcepaths` VALUES ('c6d8922c', '@lib/axios');
INSERT INTO `resourcepaths` VALUES ('cc0fd265', '@lib/jquery-ui');
INSERT INTO `resourcepaths` VALUES ('eb333159', '@lib/vue');
INSERT INTO `resourcepaths` VALUES ('f032fd4c', '@app/web/assets/matrixsettings/dist');
INSERT INTO `resourcepaths` VALUES ('f1b5f3cf', '@app/web/assets/utilities/dist');

-- ----------------------------
-- Table structure for revisions
-- ----------------------------
DROP TABLE IF EXISTS `revisions`;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  KEY `revisions_creatorId_fk` (`creatorId`),
  CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of revisions
-- ----------------------------
INSERT INTO `revisions` VALUES ('1', '2', '1', '1', null);
INSERT INTO `revisions` VALUES ('2', '2', '1', '2', null);
INSERT INTO `revisions` VALUES ('3', '2', '1', '3', null);
INSERT INTO `revisions` VALUES ('4', '2', '1', '4', null);
INSERT INTO `revisions` VALUES ('5', '2', '1', '5', null);
INSERT INTO `revisions` VALUES ('6', '2', '1', '6', null);
INSERT INTO `revisions` VALUES ('7', '9', '1', '1', null);
INSERT INTO `revisions` VALUES ('8', '9', '1', '2', null);
INSERT INTO `revisions` VALUES ('9', '9', '1', '3', null);
INSERT INTO `revisions` VALUES ('10', '9', '1', '4', null);
INSERT INTO `revisions` VALUES ('11', '9', '1', '5', null);
INSERT INTO `revisions` VALUES ('12', '9', '1', '6', null);
INSERT INTO `revisions` VALUES ('13', '16', '1', '1', null);
INSERT INTO `revisions` VALUES ('14', '16', '1', '2', null);
INSERT INTO `revisions` VALUES ('15', '16', '1', '3', null);
INSERT INTO `revisions` VALUES ('16', '16', '1', '4', null);
INSERT INTO `revisions` VALUES ('17', '16', '1', '5', null);
INSERT INTO `revisions` VALUES ('18', '16', '1', '6', null);
INSERT INTO `revisions` VALUES ('19', '16', '1', '7', null);
INSERT INTO `revisions` VALUES ('20', '16', '1', '8', null);
INSERT INTO `revisions` VALUES ('21', '16', '1', '9', null);
INSERT INTO `revisions` VALUES ('22', '16', '1', '10', null);
INSERT INTO `revisions` VALUES ('23', '16', '1', '11', null);
INSERT INTO `revisions` VALUES ('24', '16', '1', '12', null);
INSERT INTO `revisions` VALUES ('25', '16', '1', '13', null);
INSERT INTO `revisions` VALUES ('26', '16', '1', '14', null);
INSERT INTO `revisions` VALUES ('27', '16', '1', '15', null);
INSERT INTO `revisions` VALUES ('28', '16', '1', '16', null);
INSERT INTO `revisions` VALUES ('29', '16', '1', '17', null);
INSERT INTO `revisions` VALUES ('30', '16', '1', '18', null);
INSERT INTO `revisions` VALUES ('31', '16', '1', '19', null);
INSERT INTO `revisions` VALUES ('32', '16', '1', '20', null);
INSERT INTO `revisions` VALUES ('33', '16', '1', '21', null);
INSERT INTO `revisions` VALUES ('34', '16', '1', '22', null);

-- ----------------------------
-- Table structure for searchindex
-- ----------------------------
DROP TABLE IF EXISTS `searchindex`;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of searchindex
-- ----------------------------
INSERT INTO `searchindex` VALUES ('1', 'username', '0', '1', ' leon ');
INSERT INTO `searchindex` VALUES ('1', 'firstname', '0', '1', '');
INSERT INTO `searchindex` VALUES ('1', 'lastname', '0', '1', '');
INSERT INTO `searchindex` VALUES ('1', 'fullname', '0', '1', '');
INSERT INTO `searchindex` VALUES ('1', 'email', '0', '1', ' meobius123 gmail com ');
INSERT INTO `searchindex` VALUES ('1', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('2', 'title', '0', '1', ' home ');
INSERT INTO `searchindex` VALUES ('2', 'slug', '0', '1', ' home ');
INSERT INTO `searchindex` VALUES ('9', 'title', '0', '1', ' home ');
INSERT INTO `searchindex` VALUES ('9', 'slug', '0', '1', ' home ');
INSERT INTO `searchindex` VALUES ('16', 'title', '0', '1', ' homepage ');
INSERT INTO `searchindex` VALUES ('16', 'slug', '0', '1', ' homepage ');
INSERT INTO `searchindex` VALUES ('23', 'filename', '0', '1', ' banner bg png ');
INSERT INTO `searchindex` VALUES ('23', 'extension', '0', '1', ' png ');
INSERT INTO `searchindex` VALUES ('23', 'kind', '0', '1', ' image ');
INSERT INTO `searchindex` VALUES ('23', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('23', 'title', '0', '1', ' banner bg ');
INSERT INTO `searchindex` VALUES ('24', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('24', 'field', '3', '1', ' welcome to your luxury hillside retreat ');
INSERT INTO `searchindex` VALUES ('24', 'field', '2', '1', ' banner bg ');
INSERT INTO `searchindex` VALUES ('16', 'field', '4', '1', ' welcome to your luxury hillside retreat ');
INSERT INTO `searchindex` VALUES ('44', 'filename', '0', '1', ' bannerbg jpg ');
INSERT INTO `searchindex` VALUES ('41', 'kind', '0', '1', ' image ');
INSERT INTO `searchindex` VALUES ('41', 'extension', '0', '1', ' png ');
INSERT INTO `searchindex` VALUES ('41', 'filename', '0', '1', ' banner bg png ');
INSERT INTO `searchindex` VALUES ('41', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('41', 'title', '0', '1', ' banner bg ');
INSERT INTO `searchindex` VALUES ('44', 'extension', '0', '1', ' jpg ');
INSERT INTO `searchindex` VALUES ('44', 'kind', '0', '1', ' image ');
INSERT INTO `searchindex` VALUES ('44', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('44', 'title', '0', '1', ' banner bg ');
INSERT INTO `searchindex` VALUES ('45', 'filename', '0', '1', ' landscape jpg ');
INSERT INTO `searchindex` VALUES ('45', 'extension', '0', '1', ' jpg ');
INSERT INTO `searchindex` VALUES ('45', 'kind', '0', '1', ' image ');
INSERT INTO `searchindex` VALUES ('45', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('45', 'title', '0', '1', ' landscape ');
INSERT INTO `searchindex` VALUES ('16', 'field', '6', '1', ' landscape ');
INSERT INTO `searchindex` VALUES ('48', 'filename', '0', '1', ' photo 1 jpg ');
INSERT INTO `searchindex` VALUES ('48', 'extension', '0', '1', ' jpg ');
INSERT INTO `searchindex` VALUES ('48', 'kind', '0', '1', ' image ');
INSERT INTO `searchindex` VALUES ('48', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('48', 'title', '0', '1', ' photo 1 ');
INSERT INTO `searchindex` VALUES ('49', 'kind', '0', '1', ' image ');
INSERT INTO `searchindex` VALUES ('49', 'extension', '0', '1', ' jpg ');
INSERT INTO `searchindex` VALUES ('49', 'filename', '0', '1', ' photo 2 jpg ');
INSERT INTO `searchindex` VALUES ('50', 'filename', '0', '1', ' photo 1 jpg ');
INSERT INTO `searchindex` VALUES ('50', 'extension', '0', '1', ' jpg ');
INSERT INTO `searchindex` VALUES ('50', 'kind', '0', '1', ' image ');
INSERT INTO `searchindex` VALUES ('50', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('50', 'title', '0', '1', ' photo 1 ');
INSERT INTO `searchindex` VALUES ('51', 'filename', '0', '1', ' photo 2 2020 08 17 121220 jpg ');
INSERT INTO `searchindex` VALUES ('51', 'extension', '0', '1', ' jpg ');
INSERT INTO `searchindex` VALUES ('51', 'kind', '0', '1', ' image ');
INSERT INTO `searchindex` VALUES ('51', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('51', 'title', '0', '1', ' photo 2 ');
INSERT INTO `searchindex` VALUES ('49', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('49', 'title', '0', '1', ' photo 2 ');
INSERT INTO `searchindex` VALUES ('52', 'filename', '0', '1', ' photo 2 jpg ');
INSERT INTO `searchindex` VALUES ('52', 'extension', '0', '1', ' jpg ');
INSERT INTO `searchindex` VALUES ('52', 'kind', '0', '1', ' image ');
INSERT INTO `searchindex` VALUES ('52', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('52', 'title', '0', '1', ' photo 2 ');
INSERT INTO `searchindex` VALUES ('53', 'filename', '0', '1', ' photo 3 jpg ');
INSERT INTO `searchindex` VALUES ('53', 'extension', '0', '1', ' jpg ');
INSERT INTO `searchindex` VALUES ('53', 'kind', '0', '1', ' image ');
INSERT INTO `searchindex` VALUES ('53', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('53', 'title', '0', '1', ' photo 3 ');
INSERT INTO `searchindex` VALUES ('54', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('54', 'field', '8', '1', ' slide 1 ');
INSERT INTO `searchindex` VALUES ('54', 'field', '9', '1', ' photo 1 ');
INSERT INTO `searchindex` VALUES ('55', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('55', 'field', '8', '1', ' slide 2 ');
INSERT INTO `searchindex` VALUES ('55', 'field', '9', '1', ' photo 2 ');
INSERT INTO `searchindex` VALUES ('56', 'slug', '0', '1', '');
INSERT INTO `searchindex` VALUES ('56', 'field', '8', '1', ' slide 3 ');
INSERT INTO `searchindex` VALUES ('56', 'field', '9', '1', ' photo 3 ');

-- ----------------------------
-- Table structure for sections
-- ----------------------------
DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sections_handle_idx` (`handle`),
  KEY `sections_name_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  KEY `sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sections
-- ----------------------------
INSERT INTO `sections` VALUES ('1', null, 'Home', 'home', 'single', '1', 'all', null, '2020-08-17 06:44:20', '2020-08-17 06:44:20', '2020-08-17 06:53:02', '1f0ebe4d-5e41-445b-832c-c72b9f36e2b5');
INSERT INTO `sections` VALUES ('2', null, 'Homepage', 'homepage', 'single', '1', 'all', null, '2020-08-17 09:06:19', '2020-08-17 09:28:22', '2020-08-17 09:30:54', '892e1397-9d3a-4f1c-941b-384400475aff');
INSERT INTO `sections` VALUES ('3', null, 'Homepage', 'homepage', 'single', '1', 'all', null, '2020-08-17 09:31:06', '2020-08-17 09:31:06', null, 'dd8528fb-979f-4d18-9932-4cd4af05f0a0');

-- ----------------------------
-- Table structure for sections_sites
-- ----------------------------
DROP TABLE IF EXISTS `sections_sites`;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sections_sites
-- ----------------------------
INSERT INTO `sections_sites` VALUES ('1', '1', '1', '1', '__home__', null, '1', '2020-08-17 06:44:20', '2020-08-17 06:45:52', '33e19ff3-42ef-4450-881e-403af1679e66');
INSERT INTO `sections_sites` VALUES ('2', '2', '1', '1', '__home__', 'index', '1', '2020-08-17 09:06:19', '2020-08-17 09:28:22', '516376f7-03da-4fce-9626-d9bff46e944c');
INSERT INTO `sections_sites` VALUES ('3', '3', '1', '1', '__home__', '_views\\home', '1', '2020-08-17 09:31:06', '2020-08-17 10:26:36', 'ae0605cf-373c-4e0a-a3f6-5ed8483bf388');

-- ----------------------------
-- Table structure for seomatic_metabundles
-- ----------------------------
DROP TABLE IF EXISTS `seomatic_metabundles`;
CREATE TABLE `seomatic_metabundles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `bundleVersion` varchar(255) NOT NULL DEFAULT '',
  `sourceBundleType` varchar(255) NOT NULL DEFAULT '',
  `sourceId` int(11) DEFAULT NULL,
  `sourceName` varchar(255) NOT NULL DEFAULT '',
  `sourceHandle` varchar(255) NOT NULL DEFAULT '',
  `sourceType` varchar(64) NOT NULL DEFAULT '',
  `typeId` int(11) DEFAULT NULL,
  `sourceTemplate` varchar(500) DEFAULT '',
  `sourceSiteId` int(11) DEFAULT NULL,
  `sourceAltSiteSettings` text,
  `sourceDateUpdated` datetime NOT NULL,
  `metaGlobalVars` text,
  `metaSiteVars` text,
  `metaSitemapVars` text,
  `metaContainers` text,
  `redirectsContainer` text,
  `frontendTemplatesContainer` text,
  `metaBundleSettings` text,
  PRIMARY KEY (`id`),
  KEY `seomatic_metabundles_sourceBundleType_idx` (`sourceBundleType`),
  KEY `seomatic_metabundles_sourceId_idx` (`sourceId`),
  KEY `seomatic_metabundles_sourceSiteId_idx` (`sourceSiteId`),
  KEY `seomatic_metabundles_sourceHandle_idx` (`sourceHandle`),
  CONSTRAINT `seomatic_metabundles_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seomatic_metabundles
-- ----------------------------
INSERT INTO `seomatic_metabundles` VALUES ('1', '2020-08-15 09:19:59', '2020-08-15 09:19:59', '117adf80-957f-4e5c-a644-ad5a2c5bb657', '1.0.47', '__GLOBAL_BUNDLE__', '1', '__GLOBAL_BUNDLE__', '__GLOBAL_BUNDLE__', '__GLOBAL_BUNDLE__', null, '', '1', '[]', '2020-08-15 09:19:58', '{\"language\":null,\"mainEntityOfPage\":\"WebSite\",\"seoTitle\":\"\",\"siteNamePosition\":\"before\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{seomatic.helper.safeCanonicalUrl()}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"none\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"none\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\"}', '{\"siteName\":\"Craft Starter\",\"identity\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"creator\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"sameAsLinks\":{\"twitter\":{\"siteName\":\"Twitter\",\"handle\":\"twitter\",\"url\":\"\"},\"facebook\":{\"siteName\":\"Facebook\",\"handle\":\"facebook\",\"url\":\"\"},\"wikipedia\":{\"siteName\":\"Wikipedia\",\"handle\":\"wikipedia\",\"url\":\"\"},\"linkedin\":{\"siteName\":\"LinkedIn\",\"handle\":\"linkedin\",\"url\":\"\"},\"googleplus\":{\"siteName\":\"Google+\",\"handle\":\"googleplus\",\"url\":\"\"},\"youtube\":{\"siteName\":\"YouTube\",\"handle\":\"youtube\",\"url\":\"\"},\"instagram\":{\"siteName\":\"Instagram\",\"handle\":\"instagram\",\"url\":\"\"},\"pinterest\":{\"siteName\":\"Pinterest\",\"handle\":\"pinterest\",\"url\":\"\"},\"github\":{\"siteName\":\"GitHub\",\"handle\":\"github\",\"url\":\"\"},\"vimeo\":{\"siteName\":\"Vimeo\",\"handle\":\"vimeo\",\"url\":\"\"}},\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}', '{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}]}', '{\"MetaTagContainergeneral\":{\"data\":{\"generator\":{\"charset\":\"\",\"content\":\"SEOmatic\",\"httpEquiv\":\"\",\"name\":\"generator\",\"property\":null,\"include\":true,\"key\":\"generator\",\"environment\":null,\"dependencies\":{\"config\":[\"generatorEnabled\"]}},\"keywords\":{\"charset\":\"\",\"content\":\"{seomatic.meta.seoKeywords}\",\"httpEquiv\":\"\",\"name\":\"keywords\",\"property\":null,\"include\":true,\"key\":\"keywords\",\"environment\":null,\"dependencies\":null},\"description\":{\"charset\":\"\",\"content\":\"{seomatic.meta.seoDescription}\",\"httpEquiv\":\"\",\"name\":\"description\",\"property\":null,\"include\":true,\"key\":\"description\",\"environment\":null,\"dependencies\":null},\"referrer\":{\"charset\":\"\",\"content\":\"{seomatic.site.referrer}\",\"httpEquiv\":\"\",\"name\":\"referrer\",\"property\":null,\"include\":true,\"key\":\"referrer\",\"environment\":null,\"dependencies\":null},\"robots\":{\"charset\":\"\",\"content\":\"none\",\"httpEquiv\":\"\",\"name\":\"robots\",\"property\":null,\"include\":true,\"key\":\"robots\",\"environment\":{\"live\":{\"content\":\"{seomatic.meta.robots}\"},\"staging\":{\"content\":\"none\"},\"local\":{\"content\":\"none\"}},\"dependencies\":null}},\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":{\"fb:profile_id\":{\"charset\":\"\",\"content\":\"{seomatic.site.facebookProfileId}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:profile_id\",\"include\":true,\"key\":\"fb:profile_id\",\"environment\":null,\"dependencies\":null},\"fb:app_id\":{\"charset\":\"\",\"content\":\"{seomatic.site.facebookAppId}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:app_id\",\"include\":true,\"key\":\"fb:app_id\",\"environment\":null,\"dependencies\":null},\"og:locale\":{\"charset\":\"\",\"content\":\"{{ craft.app.language |replace({\\\"-\\\": \\\"_\\\"}) }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale\",\"include\":true,\"key\":\"og:locale\",\"environment\":null,\"dependencies\":null},\"og:locale:alternate\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale:alternate\",\"include\":true,\"key\":\"og:locale:alternate\",\"environment\":null,\"dependencies\":null},\"og:site_name\":{\"charset\":\"\",\"content\":\"{seomatic.site.siteName}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:site_name\",\"include\":true,\"key\":\"og:site_name\",\"environment\":null,\"dependencies\":null},\"og:type\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogType}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:type\",\"include\":true,\"key\":\"og:type\",\"environment\":null,\"dependencies\":null},\"og:url\":{\"charset\":\"\",\"content\":\"{seomatic.meta.canonicalUrl}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:url\",\"include\":true,\"key\":\"og:url\",\"environment\":null,\"dependencies\":null},\"og:title\":{\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.ogSiteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"charset\":\"\",\"content\":\"{seomatic.meta.ogTitle}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:title\",\"include\":true,\"key\":\"og:title\",\"environment\":null,\"dependencies\":null},\"og:description\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogDescription}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:description\",\"include\":true,\"key\":\"og:description\",\"environment\":null,\"dependencies\":null},\"og:image\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogImage}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image\",\"include\":true,\"key\":\"og:image\",\"environment\":null,\"dependencies\":null},\"og:image:width\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogImageWidth}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:width\",\"include\":true,\"key\":\"og:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]}},\"og:image:height\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogImageHeight}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:height\",\"include\":true,\"key\":\"og:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]}},\"og:image:alt\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogImageDescription}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:alt\",\"include\":true,\"key\":\"og:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]}},\"og:see_also\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:see_also\",\"include\":true,\"key\":\"og:see_also\",\"environment\":null,\"dependencies\":null}},\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":{\"twitter:card\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterCard}\",\"httpEquiv\":\"\",\"name\":\"twitter:card\",\"property\":null,\"include\":true,\"key\":\"twitter:card\",\"environment\":null,\"dependencies\":null},\"twitter:site\":{\"charset\":\"\",\"content\":\"@{seomatic.site.twitterHandle}\",\"httpEquiv\":\"\",\"name\":\"twitter:site\",\"property\":null,\"include\":true,\"key\":\"twitter:site\",\"environment\":null,\"dependencies\":{\"site\":[\"twitterHandle\"]}},\"twitter:creator\":{\"charset\":\"\",\"content\":\"@{seomatic.meta.twitterCreator}\",\"httpEquiv\":\"\",\"name\":\"twitter:creator\",\"property\":null,\"include\":true,\"key\":\"twitter:creator\",\"environment\":null,\"dependencies\":{\"meta\":[\"twitterCreator\"]}},\"twitter:title\":{\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.twitterSiteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"charset\":\"\",\"content\":\"{seomatic.meta.twitterTitle}\",\"httpEquiv\":\"\",\"name\":\"twitter:title\",\"property\":null,\"include\":true,\"key\":\"twitter:title\",\"environment\":null,\"dependencies\":null},\"twitter:description\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterDescription}\",\"httpEquiv\":\"\",\"name\":\"twitter:description\",\"property\":null,\"include\":true,\"key\":\"twitter:description\",\"environment\":null,\"dependencies\":null},\"twitter:image\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterImage}\",\"httpEquiv\":\"\",\"name\":\"twitter:image\",\"property\":null,\"include\":true,\"key\":\"twitter:image\",\"environment\":null,\"dependencies\":null},\"twitter:image:width\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterImageWidth}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:width\",\"property\":null,\"include\":true,\"key\":\"twitter:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]}},\"twitter:image:height\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterImageHeight}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:height\",\"property\":null,\"include\":true,\"key\":\"twitter:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]}},\"twitter:image:alt\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterImageDescription}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:alt\",\"property\":null,\"include\":true,\"key\":\"twitter:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]}}},\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":{\"site\":[\"twitterHandle\"]},\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":{\"google-site-verification\":{\"charset\":\"\",\"content\":\"{seomatic.site.googleSiteVerification}\",\"httpEquiv\":\"\",\"name\":\"google-site-verification\",\"property\":null,\"include\":true,\"key\":\"google-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"googleSiteVerification\"]}},\"bing-site-verification\":{\"charset\":\"\",\"content\":\"{seomatic.site.bingSiteVerification}\",\"httpEquiv\":\"\",\"name\":\"msvalidate.01\",\"property\":null,\"include\":true,\"key\":\"bing-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"bingSiteVerification\"]}},\"pinterest-site-verification\":{\"charset\":\"\",\"content\":\"{seomatic.site.pinterestSiteVerification}\",\"httpEquiv\":\"\",\"name\":\"p:domain_verify\",\"property\":null,\"include\":true,\"key\":\"pinterest-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"pinterestSiteVerification\"]}}},\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":{\"canonical\":{\"crossorigin\":\"\",\"href\":\"{seomatic.meta.canonicalUrl}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"canonical\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"canonical\",\"environment\":null,\"dependencies\":null},\"home\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"/\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"home\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"home\",\"environment\":null,\"dependencies\":null},\"author\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"/humans.txt\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"author\",\"sizes\":\"\",\"type\":\"text/plain\",\"include\":true,\"key\":\"author\",\"environment\":null,\"dependencies\":{\"frontend_template\":[\"humans\"]}},\"publisher\":{\"crossorigin\":\"\",\"href\":\"{seomatic.site.googlePublisherLink}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"publisher\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"publisher\",\"environment\":null,\"dependencies\":{\"site\":[\"googlePublisherLink\"]}}},\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":{\"googleAnalytics\":{\"name\":\"Google Analytics\",\"description\":\"Google Analytics gives you the digital analytics tools you need to analyze data from all touchpoints in one place, for a deeper understanding of the customer experience. You can then share the insights that matter with your whole organization. [Learn More](https://www.google.com/analytics/analytics/)\",\"templatePath\":\"_frontend/scripts/googleAnalytics.twig\",\"templateString\":\"{% if trackingId.value is defined and trackingId.value %}\\n(function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\\n(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\\nm=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\\n})(window,document,\'script\',\'{{ analyticsUrl.value }}\',\'ga\');\\nga(\'create\', \'{{ trackingId.value |raw }}\', \'auto\'{% if linker.value %}, {allowLinker: true}{% endif %});\\n{% if ipAnonymization.value %}\\nga(\'set\', \'anonymizeIp\', true);\\n{% endif %}\\n{% if displayFeatures.value %}\\nga(\'require\', \'displayfeatures\');\\n{% endif %}\\n{% if ecommerce.value %}\\nga(\'require\', \'ecommerce\');\\n{% endif %}\\n{% if enhancedEcommerce.value %}\\nga(\'require\', \'ec\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linkid\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linker\');\\n{% endif %}\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nga(\'send\', \'pageview\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"trackingId\":{\"title\":\"Google Analytics Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `UA-XXXXXX-XX`, not the entire script code. [Learn More](https://support.google.com/analytics/answer/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Google Analytics PageView\",\"instructions\":\"Controls whether the Google Analytics script automatically sends a PageView to Google Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"When a customer of Analytics requests IP address anonymization, Analytics anonymizes the address as soon as technically feasible at the earliest possible stage of the collection network.\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Display Features\",\"instructions\":\"The display features plugin for analytics.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/display-features)\",\"type\":\"bool\",\"value\":false},\"ecommerce\":{\"title\":\"Ecommerce\",\"instructions\":\"Ecommerce tracking allows you to measure the number of transactions and revenue that your website generates. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedEcommerce\":{\"title\":\"Enhanced Ecommerce\",\"instructions\":\"The enhanced ecommerce plug-in for analytics.js enables the measurement of user interactions with products on ecommerce websites across the user\'s shopping experience, including: product impressions, product clicks, viewing product details, adding a product to a shopping cart, initiating the checkout process, transactions, and refunds. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/enhanced-ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Enhanced Link Attribution\",\"instructions\":\"Enhanced Link Attribution improves the accuracy of your In-Page Analytics report by automatically differentiating between multiple links to the same URL on a single page by using link element IDs. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"linker\":{\"title\":\"Linker\",\"instructions\":\"The linker plugin simplifies the process of implementing cross-domain tracking as described in the Cross-domain Tracking guide for analytics.js. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/linker)\",\"type\":\"bool\",\"value\":false},\"analyticsUrl\":{\"title\":\"Google Analytics Script URL\",\"instructions\":\"The URL to the Google Analytics tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.google-analytics.com/analytics.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"googleAnalytics\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"nonce\":null},\"gtag\":{\"name\":\"Google gtag.js\",\"description\":\"The global site tag (gtag.js) is a JavaScript tagging framework and API that allows you to send event data to AdWords, DoubleClick, and Google Analytics. Instead of having to manage multiple tags for different products, you can use gtag.js and more easily benefit from the latest tracking features and integrations as they become available. [Learn More](https://developers.google.com/gtagjs/)\",\"templatePath\":\"_frontend/scripts/gtagHead.twig\",\"templateString\":\"{% set gtagProperty = googleAnalyticsId.value ?? googleAdWordsId.value ?? dcFloodlightId.value ?? null %}\\n{% if gtagProperty %}\\nwindow.dataLayer = window.dataLayer || [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\nfunction gtag(){dataLayer.push(arguments)};\\ngtag(\'js\', new Date());\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if googleAnalyticsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'anonymize_ip\': #{ipAnonymization.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'link_attribution\': #{enhancedLinkAttribution.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'allow_display_features\': #{displayFeatures.value ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAnalyticsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if googleAdWordsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAdWordsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if dcFloodlightId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ dcFloodlightId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/gtagBody.twig\",\"bodyTemplateString\":\"{% set gtagProperty = googleAnalyticsId.value ?? googleAdWordsId.value ?? dcFloodlightId.value ?? null %}\\n{% if gtagProperty %}\\n<script async src=\\\"{{ gtagScriptUrl.value }}?id={{ gtagProperty }}\\\"></script>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleAnalyticsId\":{\"title\":\"Google Analytics Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `UA-XXXXXX-XX`, not the entire script code. [Learn More](https://support.google.com/analytics/answer/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"googleAdWordsId\":{\"title\":\"AdWords Conversion ID\",\"instructions\":\"Only enter the ID, e.g.: `AW-XXXXXXXX`, not the entire script code. [Learn More](https://developers.google.com/adwords-remarketing-tag/)\",\"type\":\"string\",\"value\":\"\"},\"dcFloodlightId\":{\"title\":\"DoubleClick Floodlight ID\",\"instructions\":\"Only enter the ID, e.g.: `DC-XXXXXXXX`, not the entire script code. [Learn More](https://support.google.com/dcm/partner/answer/7568534)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send PageView\",\"instructions\":\"Controls whether the `gtag.js` script automatically sends a PageView to Google Analytics, AdWords, and DoubleClick Floodlight when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"In some cases, you might need to anonymize the IP addresses of hits sent to Google Analytics. [Learn More](https://developers.google.com/analytics/devguides/collection/gtagjs/ip-anonymization)\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Google Analytics Display Features\",\"instructions\":\"The display features plugin for gtag.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https://developers.google.com/analytics/devguides/collection/gtagjs/display-features)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Google Analytics Enhanced Link Attribution\",\"instructions\":\"Enhanced link attribution improves click track reporting by automatically differentiating between multiple link clicks that have the same URL on a given page. [Learn More](https://developers.google.com/analytics/devguides/collection/gtagjs/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"gtagScriptUrl\":{\"title\":\"Google gtag.js Script URL\",\"instructions\":\"The URL to the Google gtag.js tracking script. Normally this should not be changed, unless you locally cache it. The JavaScript `dataLayer` will automatically be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"https://www.googletagmanager.com/gtag/js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"gtag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"nonce\":null},\"googleTagManager\":{\"name\":\"Google Tag Manager\",\"description\":\"Google Tag Manager is a tag management system that allows you to quickly and easily update tags and code snippets on your website. Once the Tag Manager snippet has been added to your website or mobile app, you can configure tags via a web-based user interface without having to alter and deploy additional code. [Learn More](https://support.google.com/tagmanager/answer/6102821?hl=en)\",\"templatePath\":\"_frontend/scripts/googleTagManagerHead.twig\",\"templateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n{{ dataLayerVariableName.value }} = [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({\'gtm.start\':\\nnew Date().getTime(),event:\'gtm.js\'});var f=d.getElementsByTagName(s)[0],\\nj=d.createElement(s),dl=l!=\'dataLayer\'?\'&l=\'+l:\'\';j.async=true;j.src=\\n\'{{ googleTagManagerUrl.value }}?id=\'+i+dl;f.parentNode.insertBefore(j,f);\\n})(window,document,\'script\',\'{{ dataLayerVariableName.value }}\',\'{{ googleTagManagerId.value }}\');\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/googleTagManagerBody.twig\",\"bodyTemplateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n<noscript><iframe src=\\\"{{ googleTagManagerNoScriptUrl.value }}?id={{ googleTagManagerId.value }}\\\"\\nheight=\\\"0\\\" width=\\\"0\\\" style=\\\"display:none;visibility:hidden\\\"></iframe></noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleTagManagerId\":{\"title\":\"Google Tag Manager ID\",\"instructions\":\"Only enter the ID, e.g.: `GTM-XXXXXX`, not the entire script code. [Learn More](https://developers.google.com/tag-manager/quickstart)\",\"type\":\"string\",\"value\":\"\"},\"dataLayerVariableName\":{\"title\":\"DataLayer Variable Name\",\"instructions\":\"The name to use for the JavaScript DataLayer variable. The value of this variable will be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"dataLayer\"},\"googleTagManagerUrl\":{\"title\":\"Google Tag Manager Script URL\",\"instructions\":\"The URL to the Google Tag Manager script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.googletagmanager.com/gtm.js\"},\"googleTagManagerNoScriptUrl\":{\"title\":\"Google Tag Manager Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Google Tag Manager `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.googletagmanager.com/ns.html\"}},\"dataLayer\":[],\"include\":false,\"key\":\"googleTagManager\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"nonce\":null},\"facebookPixel\":{\"name\":\"Facebook Pixel\",\"description\":\"The Facebook pixel is an analytics tool that helps you measure the effectiveness of your advertising. You can use the Facebook pixel to understand the actions people are taking on your website and reach audiences you care about. [Learn More](https://www.facebook.com/business/help/651294705016616)\",\"templatePath\":\"_frontend/scripts/facebookPixelHead.twig\",\"templateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?\\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;\\nn.push=n;n.loaded=!0;n.version=\'2.0\';n.queue=[];t=b.createElement(e);t.async=!0;\\nt.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,\\ndocument,\'script\',\'{{ facebookPixelUrl.value }}\');\\nfbq(\'init\', \'{{ facebookPixelId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nfbq(\'track\', \'PageView\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/facebookPixelBody.twig\",\"bodyTemplateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none\\\"\\nsrc=\\\"{{ facebookPixelNoScriptUrl.value }}?id={{ facebookPixelId.value }}&ev=PageView&noscript=1\\\" /></noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"facebookPixelId\":{\"title\":\"Facebook Pixel ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://developers.facebook.com/docs/facebook-pixel/api-reference)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Facebook Pixel PageView\",\"instructions\":\"Controls whether the Facebook Pixel script automatically sends a PageView to Facebook Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"facebookPixelUrl\":{\"title\":\"Facebook Pixel Script URL\",\"instructions\":\"The URL to the Facebook Pixel script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://connect.facebook.net/en_US/fbevents.js\"},\"facebookPixelNoScriptUrl\":{\"title\":\"Facebook Pixel Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Facebook Pixel `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.facebook.com/tr\"}},\"dataLayer\":[],\"include\":false,\"key\":\"facebookPixel\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"nonce\":null},\"linkedInInsight\":{\"name\":\"LinkedIn Insight\",\"description\":\"The LinkedIn Insight Tag is a lightweight JavaScript tag that powers conversion tracking, retargeting, and web analytics for LinkedIn ad campaigns.\",\"templatePath\":\"_frontend/scripts/linkedInInsightHead.twig\",\"templateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n_linkedin_data_partner_id = \\\"{{ dataPartnerId.value }}\\\";\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/linkedInInsightBody.twig\",\"bodyTemplateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n<script type=\\\"text/javascript\\\">\\n(function(){var s = document.getElementsByTagName(\\\"script\\\")[0];\\n    var b = document.createElement(\\\"script\\\");\\n    b.type = \\\"text/javascript\\\";b.async = true;\\n    b.src = \\\"{{ linkedInInsightUrl.value }}\\\";\\n    s.parentNode.insertBefore(b, s);})();\\n</script>\\n<noscript>\\n<img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ linkedInInsightNoScriptUrl.value }}?pid={{ dataPartnerId.value }}&fmt=gif\\\" />\\n</noscript>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"dataPartnerId\":{\"title\":\"LinkedIn Data Partner ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://www.linkedin.com/help/lms/answer/65513/adding-the-linkedin-insight-tag-to-your-website?lang=en)\",\"type\":\"string\",\"value\":\"\"},\"linkedInInsightUrl\":{\"title\":\"LinkedIn Insight Script URL\",\"instructions\":\"The URL to the LinkedIn Insight script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://snap.licdn.com/li.lms-analytics/insight.min.js\"},\"linkedInInsightNoScriptUrl\":{\"title\":\"LinkedIn Insight &lt;noscript&gt; URL\",\"instructions\":\"The URL to the LinkedIn Insight `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://dc.ads.linkedin.com/collect/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"linkedInInsight\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"nonce\":null},\"hubSpot\":{\"name\":\"HubSpot\",\"description\":\"If you\'re not hosting your entire website on HubSpot, or have pages on your website that are not hosted on HubSpot, you\'ll need to install the HubSpot tracking code on your non-HubSpot pages in order to capture those analytics.\",\"templatePath\":null,\"templateString\":null,\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/hubSpotBody.twig\",\"bodyTemplateString\":\"{% if hubSpotId.value is defined and hubSpotId.value %}\\n<script type=\\\"text/javascript\\\" id=\\\"hs-script-loader\\\" async defer src=\\\"{{ hubSpotUrl.value }}{{ hubSpotId.value }}.js\\\"></script>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"hubSpotId\":{\"title\":\"HubSpot ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://knowledge.hubspot.com/articles/kcs_article/reports/install-the-hubspot-tracking-code)\",\"type\":\"string\",\"value\":\"\"},\"hubSpotUrl\":{\"title\":\"HubSpot Script URL\",\"instructions\":\"The URL to the HubSpot script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"//js.hs-scripts.com/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"hubSpot\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"nonce\":null}},\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"issn\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{seomatic.site.identity.genericUrl}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{seomatic.site.identity.genericUrl}#identity\"},\"copyrightYear\":null,\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{seomatic.site.creator.genericUrl}#creator\"},\"dateCreated\":null,\"dateModified\":null,\"datePublished\":null,\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":null,\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":null,\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"nonce\":null},\"identity\":{\"actionableFeedbackPolicy\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{seomatic.site.identity.genericStreetAddress}\",\"addressLocality\":\"{seomatic.site.identity.genericAddressLocality}\",\"addressRegion\":\"{seomatic.site.identity.genericAddressRegion}\",\"postalCode\":\"{seomatic.site.identity.genericPostalCode}\",\"addressCountry\":\"{seomatic.site.identity.genericAddressCountry}\"},\"aggregateRating\":null,\"alumni\":null,\"areaServed\":null,\"award\":null,\"brand\":null,\"contactPoint\":null,\"correctionsPolicy\":null,\"department\":null,\"dissolutionDate\":null,\"diversityPolicy\":null,\"diversityStaffingReport\":null,\"duns\":\"{seomatic.site.identity.organizationDuns}\",\"email\":\"{seomatic.site.identity.genericEmail}\",\"employee\":null,\"ethicsPolicy\":null,\"event\":null,\"faxNumber\":null,\"founder\":\"{seomatic.site.identity.organizationFounder}\",\"foundingDate\":\"{seomatic.site.identity.organizationFoundingDate}\",\"foundingLocation\":\"{seomatic.site.identity.organizationFoundingLocation}\",\"funder\":null,\"globalLocationNumber\":null,\"hasCredential\":null,\"hasMerchantReturnPolicy\":null,\"hasOfferCatalog\":null,\"hasPOS\":null,\"interactionStatistic\":null,\"isicV4\":null,\"knowsAbout\":null,\"knowsLanguage\":null,\"legalName\":null,\"leiCode\":null,\"location\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.helper.socialTransform(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\")}\",\"width\":\"{seomatic.helper.socialTransformWidth(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\")}\",\"height\":\"{seomatic.helper.socialTransformHeight(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\")}\"},\"makesOffer\":null,\"member\":null,\"memberOf\":null,\"naics\":null,\"numberOfEmployees\":null,\"ownershipFundingInfo\":null,\"owns\":null,\"parentOrganization\":null,\"publishingPrinciples\":null,\"review\":null,\"seeks\":null,\"slogan\":null,\"sponsor\":null,\"subOrganization\":null,\"taxID\":null,\"telephone\":\"{seomatic.site.identity.genericTelephone}\",\"unnamedSourcesPolicy\":null,\"vatID\":null,\"additionalType\":null,\"alternateName\":\"{seomatic.site.identity.genericAlternateName}\",\"description\":\"{seomatic.site.identity.genericDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.site.identity.genericImage}\",\"width\":\"{seomatic.site.identity.genericImageWidth}\",\"height\":\"{seomatic.site.identity.genericImageHeight}\"},\"mainEntityOfPage\":null,\"name\":\"{seomatic.site.identity.genericName}\",\"potentialAction\":null,\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.site.identity.genericUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.site.identity.computedType}\",\"id\":\"{seomatic.site.identity.genericUrl}#identity\",\"graph\":null,\"include\":true,\"key\":\"identity\",\"environment\":null,\"dependencies\":null,\"nonce\":null},\"creator\":{\"actionableFeedbackPolicy\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{seomatic.site.creator.genericStreetAddress}\",\"addressLocality\":\"{seomatic.site.creator.genericAddressLocality}\",\"addressRegion\":\"{seomatic.site.creator.genericAddressRegion}\",\"postalCode\":\"{seomatic.site.creator.genericPostalCode}\",\"addressCountry\":\"{seomatic.site.creator.genericAddressCountry}\"},\"aggregateRating\":null,\"alumni\":null,\"areaServed\":null,\"award\":null,\"brand\":null,\"contactPoint\":null,\"correctionsPolicy\":null,\"department\":null,\"dissolutionDate\":null,\"diversityPolicy\":null,\"diversityStaffingReport\":null,\"duns\":\"{seomatic.site.creator.organizationDuns}\",\"email\":\"{seomatic.site.creator.genericEmail}\",\"employee\":null,\"ethicsPolicy\":null,\"event\":null,\"faxNumber\":null,\"founder\":\"{seomatic.site.creator.organizationFounder}\",\"foundingDate\":\"{seomatic.site.creator.organizationFoundingDate}\",\"foundingLocation\":\"{seomatic.site.creator.organizationFoundingLocation}\",\"funder\":null,\"globalLocationNumber\":null,\"hasCredential\":null,\"hasMerchantReturnPolicy\":null,\"hasOfferCatalog\":null,\"hasPOS\":null,\"interactionStatistic\":null,\"isicV4\":null,\"knowsAbout\":null,\"knowsLanguage\":null,\"legalName\":null,\"leiCode\":null,\"location\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.helper.socialTransform(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\")}\",\"width\":\"{seomatic.helper.socialTransformWidth(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\")}\",\"height\":\"{seomatic.helper.socialTransformHeight(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\")}\"},\"makesOffer\":null,\"member\":null,\"memberOf\":null,\"naics\":null,\"numberOfEmployees\":null,\"ownershipFundingInfo\":null,\"owns\":null,\"parentOrganization\":null,\"publishingPrinciples\":null,\"review\":null,\"seeks\":null,\"slogan\":null,\"sponsor\":null,\"subOrganization\":null,\"taxID\":null,\"telephone\":\"{seomatic.site.creator.genericTelephone}\",\"unnamedSourcesPolicy\":null,\"vatID\":null,\"additionalType\":null,\"alternateName\":\"{seomatic.site.creator.genericAlternateName}\",\"description\":\"{seomatic.site.creator.genericDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.site.creator.genericImage}\",\"width\":\"{seomatic.site.creator.genericImageWidth}\",\"height\":\"{seomatic.site.creator.genericImageHeight}\"},\"mainEntityOfPage\":null,\"name\":\"{seomatic.site.creator.genericName}\",\"potentialAction\":null,\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.site.creator.genericUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.site.creator.computedType}\",\"id\":\"{seomatic.site.creator.genericUrl}#creator\",\"graph\":null,\"include\":true,\"key\":\"creator\",\"environment\":null,\"dependencies\":null,\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}', '[]', '{\"data\":{\"humans\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"/* TEAM */\\n\\nCreator: {{ seomatic.site.creator.genericName ?? \\\"n/a\\\" }}\\nURL: {{ seomatic.site.creator.genericUrl ?? \\\"n/a\\\" }}\\nDescription: {{ seomatic.site.creator.genericDescription ?? \\\"n/a\\\" }}\\n\\n/* THANKS */\\n\\nCraft CMS - https://craftcms.com\\nPixel & Tonic - https://pixelandtonic.com\\n\\n/* SITE */\\n\\nStandards: HTML5, CSS3\\nComponents: Craft CMS 3, Yii2, PHP, JavaScript, SEOmatic\\n\",\"siteId\":null,\"include\":true,\"handle\":\"humans\",\"path\":\"humans.txt\",\"template\":\"_frontend/pages/humans.twig\",\"controller\":\"frontend-template\",\"action\":\"humans\"},\"robots\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# robots.txt for {{ siteUrl }}\\n\\nSitemap: {{ seomatic.helper.sitemapIndexForSiteId() }}\\n{% switch seomatic.config.environment %}\\n\\n{% case \\\"live\\\" %}\\n\\n# live - don\'t allow web crawlers to index cpresources/ or vendor/\\n\\nUser-agent: *\\nDisallow: /cpresources/\\nDisallow: /vendor/\\nDisallow: /.env\\nDisallow: /cache/\\n\\n{% case \\\"staging\\\" %}\\n\\n# staging - disallow all\\n\\nUser-agent: *\\nDisallow: /\\n\\n{% case \\\"local\\\" %}\\n\\n# local - disallow all\\n\\nUser-agent: *\\nDisallow: /\\n\\n{% default %}\\n\\n# default - don\'t allow web crawlers to index cpresources/ or vendor/\\n\\nUser-agent: *\\nDisallow: /cpresources/\\nDisallow: /vendor/\\nDisallow: /.env\\nDisallow: /cache/\\n\\n{% endswitch %}\\n\",\"siteId\":null,\"include\":true,\"handle\":\"robots\",\"path\":\"robots.txt\",\"template\":\"_frontend/pages/robots.twig\",\"controller\":\"frontend-template\",\"action\":\"robots\"},\"ads\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# ads.txt file for {{ siteUrl }}\\n# More info: https://support.google.com/admanager/answer/7441288?hl=en\\n{{ siteUrl }},123,DIRECT\\n\",\"siteId\":null,\"include\":true,\"handle\":\"ads\",\"path\":\"ads.txt\",\"template\":\"_frontend/pages/ads.twig\",\"controller\":\"frontend-template\",\"action\":\"ads\"}},\"name\":\"Frontend Templates\",\"description\":\"Templates that are rendered on the frontend\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":\"SeomaticEditableTemplate\",\"include\":true,\"dependencies\":null,\"clearCache\":false}', '{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}');
INSERT INTO `seomatic_metabundles` VALUES ('4', '2020-08-17 09:31:06', '2020-08-17 12:17:31', 'e998a984-1f9c-4e04-89ea-4dacc8ff3418', '1.0.28', 'section', '3', 'Homepage', 'homepage', 'single', null, '', '1', '{\"1\":{\"id\":3,\"sectionId\":3,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"__home__\",\"template\":null,\"language\":\"en-us\"}}', '2020-08-17 12:17:30', '{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{entry.title}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{entry.url}\",\"robots\":\"\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\"}', '{\"siteName\":\"Craft Starter\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}', '{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}]}', '{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"primaryImageOfPage\":null,\"relatedLink\":null,\"reviewedBy\":null,\"significantLink\":null,\"speakable\":null,\"specialty\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{seomatic.site.identity.genericUrl}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{seomatic.site.identity.genericUrl}#identity\"},\"copyrightYear\":\"{entry.postDate | date(\\\"Y\\\")}\",\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{seomatic.site.identity.genericUrl}#creator\"},\"dateCreated\":false,\"dateModified\":\"{entry.dateUpdated |atom}\",\"datePublished\":\"{entry.postDate |atom}\",\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":\"{seomatic.meta.seoTitle}\",\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":{\"id\":\"{seomatic.site.identity.genericUrl}#creator\"},\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}', '[]', '{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}', '{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebPage\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromField\",\"seoTitleField\":\"title\",\"siteNamePositionSource\":\"sameAsGlobal\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"sameAsGlobal\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"sameAsGlobal\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}');

-- ----------------------------
-- Table structure for sequences
-- ----------------------------
DROP TABLE IF EXISTS `sequences`;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sequences
-- ----------------------------

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessions_uid_idx` (`uid`),
  KEY `sessions_token_idx` (`token`),
  KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `sessions_userId_idx` (`userId`),
  CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('1', '1', 'uPlD4WwlWhUQWPNDwez_TVibpmNAartw2apkrQn9Z7aTxX7OhazaBtCABdjfp79b3IUUPwoGOJwiGX1R2gWp-Wl6Lbm8zxrFPG48', '2020-08-15 09:20:04', '2020-08-15 09:20:04', 'd4652866-108f-4004-8a0f-c054ffac4b8c');
INSERT INTO `sessions` VALUES ('7', '1', '-wprueTqrSUp8SaZ7bJez2l8ikdQTqgE02VHaH05NIfMuAqF6oK8IgVA8Q3jHVSIh5he4x-9DRgjtUasqYBC8HsHTaL8fmaOlarJ', '2020-08-17 09:05:17', '2020-08-17 12:17:34', 'ce30a9bb-768f-4b07-9ea0-89d553dd3f86');
INSERT INTO `sessions` VALUES ('8', '1', 'dVK9ScW07O_NEo4Ma7jxB6Zhoa8M8N0Y26EZGChpL48JdZSJhkEkVSy3PjovAJz4u_cMMe2UFfPU3uzEWBggVcB0mrHUmhBVM8v2', '2020-08-17 09:20:45', '2020-08-17 09:20:45', '6cecee6f-b9f2-4965-b3de-b24f7be1e0b9');
INSERT INTO `sessions` VALUES ('9', '1', 'hIoVJlpkKUEkWZZIN1xF03qeyBzqCBakiY5JixYkcd9HhBN8dpO0nVN284isIvhzG6w2X7UIi0-vD3AzA9C_wC7emF77VFhmETF6', '2020-08-17 09:20:56', '2020-08-17 09:20:59', '2bc28a7f-8e39-4846-9608-733ca5efe74f');

-- ----------------------------
-- Table structure for shunnedmessages
-- ----------------------------
DROP TABLE IF EXISTS `shunnedmessages`;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shunnedmessages
-- ----------------------------

-- ----------------------------
-- Table structure for sitegroups
-- ----------------------------
DROP TABLE IF EXISTS `sitegroups`;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sitegroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sitegroups
-- ----------------------------
INSERT INTO `sitegroups` VALUES ('1', 'Craft Starter', '2020-08-15 09:19:54', '2020-08-15 09:19:54', null, '409229b6-3aa6-4551-be04-e9be6415b2e6');

-- ----------------------------
-- Table structure for sites
-- ----------------------------
DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sites_dateDeleted_idx` (`dateDeleted`),
  KEY `sites_handle_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`),
  CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sites
-- ----------------------------
INSERT INTO `sites` VALUES ('1', '1', '1', '1', 'Craft Starter', 'default', 'en-US', '1', 'http://$DEFAULT_SITE_URL', '1', '2020-08-15 09:19:54', '2020-08-15 09:20:01', null, 'da06c0e6-3443-4f86-923d-5bddf6fb6f71');

-- ----------------------------
-- Table structure for structureelements
-- ----------------------------
DROP TABLE IF EXISTS `structureelements`;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `structureelements_root_idx` (`root`),
  KEY `structureelements_lft_idx` (`lft`),
  KEY `structureelements_rgt_idx` (`rgt`),
  KEY `structureelements_level_idx` (`level`),
  KEY `structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of structureelements
-- ----------------------------

-- ----------------------------
-- Table structure for structures
-- ----------------------------
DROP TABLE IF EXISTS `structures`;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of structures
-- ----------------------------

-- ----------------------------
-- Table structure for systemmessages
-- ----------------------------
DROP TABLE IF EXISTS `systemmessages`;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemmessages
-- ----------------------------

-- ----------------------------
-- Table structure for taggroups
-- ----------------------------
DROP TABLE IF EXISTS `taggroups`;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taggroups_name_idx` (`name`),
  KEY `taggroups_handle_idx` (`handle`),
  KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taggroups
-- ----------------------------

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`),
  CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for templatecacheelements
-- ----------------------------
DROP TABLE IF EXISTS `templatecacheelements`;
CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of templatecacheelements
-- ----------------------------

-- ----------------------------
-- Table structure for templatecachequeries
-- ----------------------------
DROP TABLE IF EXISTS `templatecachequeries`;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `templatecachequeries_type_idx` (`type`),
  CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of templatecachequeries
-- ----------------------------

-- ----------------------------
-- Table structure for templatecaches
-- ----------------------------
DROP TABLE IF EXISTS `templatecaches`;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of templatecaches
-- ----------------------------

-- ----------------------------
-- Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unq_idx` (`token`),
  KEY `tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tokens
-- ----------------------------

-- ----------------------------
-- Table structure for usergroups
-- ----------------------------
DROP TABLE IF EXISTS `usergroups`;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `usergroups_handle_idx` (`handle`),
  KEY `usergroups_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usergroups
-- ----------------------------

-- ----------------------------
-- Table structure for usergroups_users
-- ----------------------------
DROP TABLE IF EXISTS `usergroups_users`;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usergroups_users
-- ----------------------------

-- ----------------------------
-- Table structure for userpermissions
-- ----------------------------
DROP TABLE IF EXISTS `userpermissions`;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userpermissions
-- ----------------------------

-- ----------------------------
-- Table structure for userpermissions_usergroups
-- ----------------------------
DROP TABLE IF EXISTS `userpermissions_usergroups`;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userpermissions_usergroups
-- ----------------------------

-- ----------------------------
-- Table structure for userpermissions_users
-- ----------------------------
DROP TABLE IF EXISTS `userpermissions_users`;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userpermissions_users
-- ----------------------------

-- ----------------------------
-- Table structure for userpreferences
-- ----------------------------
DROP TABLE IF EXISTS `userpreferences`;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userpreferences
-- ----------------------------
INSERT INTO `userpreferences` VALUES ('1', '{\"language\":\"en-US\"}');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_uid_idx` (`uid`),
  KEY `users_verificationCode_idx` (`verificationCode`),
  KEY `users_email_idx` (`email`),
  KEY `users_username_idx` (`username`),
  KEY `users_photoId_fk` (`photoId`),
  CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Leon', null, null, null, 'meobius123@gmail.com', '$2y$13$fbXmu8iozddh5G0gnNLee.VS8ZnUFc.7syN6ID6I4ZCm3YaA0op0u', '1', '0', '0', '0', '2020-08-17 09:20:56', null, null, null, null, null, '1', null, null, null, '0', '2020-08-15 09:20:03', '2020-08-15 09:20:03', '2020-08-17 09:20:57', '9910e0f0-d448-46d3-a54f-3dde56970678');

-- ----------------------------
-- Table structure for volumefolders
-- ----------------------------
DROP TABLE IF EXISTS `volumefolders`;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `volumefolders_parentId_idx` (`parentId`),
  KEY `volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of volumefolders
-- ----------------------------
INSERT INTO `volumefolders` VALUES ('1', null, '1', 'Files', '', '2020-08-17 09:53:47', '2020-08-17 09:53:47', '9047fb11-eb88-4c85-bea7-b4ed395b6ab1');
INSERT INTO `volumefolders` VALUES ('2', null, null, 'Temporary source', null, '2020-08-17 09:54:15', '2020-08-17 09:54:15', '65b1f5b9-69bc-4d43-8ac9-b6ddc7506a6a');
INSERT INTO `volumefolders` VALUES ('3', '2', null, 'user_1', 'user_1/', '2020-08-17 09:54:15', '2020-08-17 09:54:15', '5733336c-bbcb-4173-ba7b-52ed9bc3d1b6');
INSERT INTO `volumefolders` VALUES ('4', '1', '1', 'homepage', 'homepage/', '2020-08-17 10:22:58', '2020-08-17 10:22:58', '3454fef9-b6a3-4f14-82a4-309d0356bbf6');

-- ----------------------------
-- Table structure for volumes
-- ----------------------------
DROP TABLE IF EXISTS `volumes`;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `volumes_name_idx` (`name`),
  KEY `volumes_handle_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of volumes
-- ----------------------------
INSERT INTO `volumes` VALUES ('1', '5', 'Files', 'files', 'craft\\volumes\\Local', '1', '@web/files', '{\"path\":\"@webroot/files\"}', '1', '2020-08-17 09:53:46', '2020-08-17 09:53:46', null, '66b75dae-aadd-43b7-857e-6d3d40b4b6a2');

-- ----------------------------
-- Table structure for widgets
-- ----------------------------
DROP TABLE IF EXISTS `widgets`;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`),
  CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of widgets
-- ----------------------------
INSERT INTO `widgets` VALUES ('1', '1', 'craft\\widgets\\RecentEntries', '1', null, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', '1', '2020-08-15 09:36:38', '2020-08-15 09:36:38', 'ef8b2e54-72db-4649-9384-e30c804f57c1');
INSERT INTO `widgets` VALUES ('2', '1', 'craft\\widgets\\CraftSupport', '2', null, '[]', '1', '2020-08-15 09:36:38', '2020-08-15 09:36:38', 'f3b0b802-289c-47b1-b498-585657cedb49');
INSERT INTO `widgets` VALUES ('3', '1', 'craft\\widgets\\Updates', '3', null, '[]', '1', '2020-08-15 09:36:38', '2020-08-15 09:36:38', '11cbb057-604c-4fd2-ae30-1f9049b94ffc');
INSERT INTO `widgets` VALUES ('4', '1', 'craft\\widgets\\Feed', '4', null, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', '1', '2020-08-15 09:36:38', '2020-08-15 09:36:38', '7e185a0a-f5f7-49fb-b76b-8c3e9d6e18bb');
