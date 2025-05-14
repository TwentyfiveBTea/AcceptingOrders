/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 80042
Source Host           : localhost:3306
Source Database       : house_crawler

Target Server Type    : MYSQL
Target Server Version : 80042
File Encoding         : 65001

Date: 2025-05-14 16:55:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for houses_lianjia
-- ----------------------------
DROP TABLE IF EXISTS `houses_lianjia`;
CREATE TABLE `houses_lianjia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decoration` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `follow_info` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of houses_lianjia
-- ----------------------------
INSERT INTO `houses_lianjia` VALUES ('1', '白云园南片，龙江新城市广场，一楼带院子，配套成熟', '白云园南片', '2室1厅', '54.31平米', '南 北', '简装', '低楼层(共7层)', '160万', '29,461元/平', '7人关注 / 7个月以前发布', '必看好房,,,,近地铁,VR房源,随时看房,160,关注', 'https://nj.lianjia.com/ershoufang/103136362740.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('2', '湖西雅居东苑 次新小区 电梯三房  凤凰楼层', '湖西雅居东苑', '3室2厅', '99.87平米', '南', '简装', '高楼层(共22层)', '149万', '14,920元/平', '1人关注 / 3个月以前发布', '必看好房,,,,VR看装修,随时看房,149,关注', 'https://nj.lianjia.com/ershoufang/103138575452.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('3', '此房满五年，三房朝南，一房朝北，厨卫全明，有客厅。', '丁家桥1-37号', '4室1厅', '103.93平米', '南 北', '简装', '中楼层(共5层)', '270万', '25,980元/平', '13人关注 / 7个月以前发布', '必看好房,,,,近地铁,VR房源,房本满五年,随时看房,270,关注', 'https://nj.lianjia.com/ershoufang/103135865248.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('4', '河西金鹰地铁2号线兴隆大街站，采光好', '兴达新寓二村', '2室1厅', '54.08平米', '东南 南', '精装', '中楼层(共7层)', '149万', '27,552元/平', '4人关注 / 2个月以前发布', '必看好房,,,,近地铁,VR看装修,房本满两年,随时看房,149,关注', 'https://nj.lianjia.com/ershoufang/103139014592.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('5', '九龙湖殷巷两房采光好南北通透好楼层', '殷巷新寓188至241幢', '2室1厅', '64.82平米', '南 北', '其他', '中楼层(共6层)', '94万', '14,502元/平', '0人关注 / 5个月以前发布', '必看好房,,,,VR看装修,房本满五年,94,关注', 'https://nj.lianjia.com/ershoufang/103137246356.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('6', '草芳新苑单室套诚心出售总价低格局方正', '草芳新苑', '1室1厅', '42.26平米', '南', '其他', '高楼层(共6层)', '33万', '7,809元/平', '0人关注 / 26天以前发布', '必看好房,,,,近地铁,VR看装修,33,关注', 'https://nj.lianjia.com/ershoufang/103140787879.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('7', '科利华 廖家巷全明两房 总价低 满五唯一 近大树根', '廖家巷小区', '2室1厅', '54.26平米', '南 北', '简装', '高楼层(共5层)', '190万', '35,017元/平', '1人关注 / 25天以前发布', '必看好房,,,,VR房源,房本满五年,随时看房,190,关注', 'https://nj.lianjia.com/ershoufang/103140815568.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('8', '湖韵怡居，三房两厅两卫，纯毛坯，好楼层，诚心出售', '湖韵怡居B区', '3室2厅', '122.05平米', '南', '毛坯', '低楼层(共18层)', '71万', '5,818元/平', '0人关注 / 1个月以前发布', '必看好房,,,,VR看装修,房本满两年,随时看房,71,关注', 'https://nj.lianjia.com/ershoufang/103140265373.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('9', '户型方正，楼层好，采光好，视野开阔.', '文鼎雅苑', '3室2厅', '116.96平米', '南', '其他', '中楼层(共6层)', '168万', '14,364元/平', '0人关注 / 16天以前发布', '必看好房,,,,VR看装修,房本满五年,168,关注', 'https://nj.lianjia.com/ershoufang/103141074021.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('10', '一楼带院子 玄武区 自住精装 满五年唯一 随时看房', '十字街3号', '3室2厅', '88.82平米', '南', '毛坯', '低楼层(共6层)', '185万', '20,829元/平', '5人关注 / 一年前发布', '必看好房,,,,VR房源,185,关注', 'https://nj.lianjia.com/ershoufang/103132805091.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('11', '三房 边户 封闭院子安静 南师 东大南门 离校近', '蓁巷', '3室1厅', '75.73平米', '南 北', '简装', '中楼层(共7层)', '289万', '38,162元/平', '2人关注 / 16天以前发布', '必看好房,,,,近地铁,VR看装修,随时看房,289,关注', 'https://nj.lianjia.com/ershoufang/103141092908.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('12', '房龄新 带电梯 小区环境好 配套完善', '精金花园北区', '2室1厅', '76.36平米', '南 北', '其他', '低楼层(共21层)', '175万', '22,918元/平', '0人关注 / 4个月以前发布', '必看好房,,,,近地铁,VR房源,随时看房,175,关注', 'https://nj.lianjia.com/ershoufang/103138061437.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('13', '麒麟科创园 精装双卫大三房 生活便利 未来发展很好', '中信泰富海麟苑', '3室2厅', '114.1平米', '南 北', '精装', '低楼层(共26层)', '165万', '14,461元/平', '17人关注 / 一年前发布', '必看好房,,,,VR房源,房本满五年,165,关注', 'https://nj.lianjia.com/ershoufang/103124028993.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('14', '光华路 月牙湖 三房边户 小区环境好 交通便利', '四方新村八村', '3室1厅', '123.04平米', '南 北', '其他', '低楼层(共7层)', '282万', '22,920元/平', '4人关注 / 一年前发布', '必看好房,,,,VR看装修,房本满五年,随时看房,282,关注', 'https://nj.lianjia.com/ershoufang/103126087186.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('15', '南师 楼层采光好 视野无遮挡有电梯2005年房龄', '同创软件大厦', '1室1厅', '43.93平米', '西', '精装', '高楼层(共6层)', '166万', '37,788元/平', '2人关注 / 1个月以前发布', '必看好房,,,,近地铁,VR看装修,房本满五年,随时看房,166,关注', 'https://nj.lianjia.com/ershoufang/103140579286.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('16', '婚装，中楼层，户型佳，省级机关房，夫子庙三山街地铁', '秦状元里', '2室1厅', '72.12平米', '南 北', '精装', '中楼层(共7层)', '208万', '28,841元/平', '6人关注 / 7个月以前发布', '必看好房,,,,近地铁,VR看装修,房本满两年,随时看房,208,关注', 'https://nj.lianjia.com/ershoufang/103136264671.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('17', '纯毛坯带车位 采光充足无遮挡，看房有钥匙', '锁石苑', '3室1厅', '88.56平米', '南', '毛坯', '中楼层(共33层)', '72万', '8,131元/平', '3人关注 / 8个月以前发布', '必看好房,,,,VR看装修,随时看房,72,关注', 'https://nj.lianjia.com/ershoufang/103135600368.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('18', '仙霞公寓力学南师大汉口西路200号南北通透安静', '虎踞路86号', '3室1厅', '68.6平米', '南 北', '其他', '低楼层(共5层)', '248万', '36,152元/平', '3人关注 / 一年前发布', '必看好房,,,,近地铁,VR看装修,房本满两年,248,关注', 'https://nj.lianjia.com/ershoufang/103132478227.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('19', '精装自住，户型好，业主诚心出售，价格可谈', '天华绿谷庄园', '2室1厅', '83.51平米', '南', '其他', '低楼层(共6层)', '92万', '11,017元/平', '2人关注 / 一年前发布', '必看好房,,,,近地铁,VR看装修,房本满五年,随时看房,92,关注', 'https://nj.lianjia.com/ershoufang/103129264785.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('20', '此房精装修，交通出行便利，户型方正', '东方红郡', '2室2厅', '85.55平米', '南', '简装', '中楼层(共11层)', '139万', '16,248元/平', '5人关注 / 5个月以前发布', '必看好房,,,,近地铁,VR房源,房本满两年,139,关注', 'https://nj.lianjia.com/ershoufang/103137632866.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('21', '3/7号线双地铁，满五唯一，配套方便', '幕府佳园', '3室1厅', '118.97平米', '南 北', '精装', '中楼层(共11层)', '226万', '18,997元/平', '17人关注 / 6个月以前发布', '必看好房,,,,近地铁,VR看装修,房本满五年,226,关注', 'https://nj.lianjia.com/ershoufang/103136784618.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('22', '低楼层 采光好 业主诚心卖  全明户型', '西一巷', '1室1厅', '37.03平米', '南', '简装', '低楼层(共7层)', '185万', '49,960元/平', '1人关注 / 一年前发布', '必看好房,,,,近地铁,VR房源,房本满五年,随时看房,185,关注', 'https://nj.lianjia.com/ershoufang/103131223847.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('23', '户型方正 自住装修保养好 满五唯一 拎包入住', '南方花园枫彩园北区', '3室1厅', '82.77平米', '南', '精装', '高楼层(共6层)', '126万', '15,223元/平', '4人关注 / 2个月以前发布', '必看好房,,,,近地铁,VR看装修,房本满五年,随时看房,126,关注', 'https://nj.lianjia.com/ershoufang/103139351192.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('24', '南方花园B组团 精装一室一厅 满五年 南北通透 地铁口', '南方花园B组团', '1室1厅', '45.83平米', '南 北', '精装', '低楼层(共7层)', '99万', '21,602元/平', '0人关注 / 17天以前发布', '必看好房,,,,近地铁,VR房源,房本满五年,随时看房,99,关注', 'https://nj.lianjia.com/ershoufang/103141059434.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('25', '次新房，户型方正，精装修，环境优美。', '中海桃源铂公馆', '1室1厅', '52.52平米', '北', '其他', '高楼层(共8层)', '75万', '14,281元/平', '0人关注 / 5个月以前发布', '必看好房,,,,VR房源,随时看房,75,关注', 'https://nj.lianjia.com/ershoufang/103137263986.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('26', '湖南路 边户 青云巷小区 双南三房 环境好 采光好', '青云巷(鼓楼)', '3室1厅', '80.09平米', '南 北', '简装', '高楼层(共7层)', '190万', '23,724元/平', '5人关注 / 6个月以前发布', '必看好房,,,,近地铁,VR看装修,随时看房,190,关注', 'https://nj.lianjia.com/ershoufang/103136762054.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('27', '夫子庙 长乐路 精装修两室 适合刚需 直接住 满五唯一', '长乐路', '3室1厅', '73.42平米', '南', '精装', '高楼层(共6层)', '150万', '20,431元/平', '7人关注 / 7个月以前发布', '必看好房,,,,近地铁,VR看装修,房本满五年,150,关注', 'https://nj.lianjia.com/ershoufang/103136191816.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('28', '此房是二房户型，南北户型，动静分离，居住体验好。', '中电颐和家园睿域', '2室1厅', '94.47平米', '南', '其他', '中楼层(共18层)', '278万', '29,428元/平', '3人关注 / 1个月以前发布', '必看好房,,,,近地铁,VR看装修,房本满五年,278,关注', 'https://nj.lianjia.com/ershoufang/103140122251.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('29', '满五唯一带储藏室 地铁口 南北通透精装三房 看房方便', '武夷绿洲观竹苑', '3室1厅', '100.24平米', '南 北', '其他', '高楼层(共6层)', '178万', '17,758元/平', '10人关注 / 一年前发布', '必看好房,,,,近地铁,VR房源,房本满五年,随时看房,178,关注', 'https://nj.lianjia.com/ershoufang/103130047560.html', '2025-05-14 15:41:06');
INSERT INTO `houses_lianjia` VALUES ('30', '电梯洋房 采光无遮挡 视野效果好', '翡翠天域臻园', '3室2厅', '96.32平米', '南', '精装', '低楼层(共11层)', '160万', '16,612元/平', '0人关注 / 2个月以前发布', '必看好房,,,,VR看装修,房本满两年,160,关注', 'https://nj.lianjia.com/ershoufang/103139375709.html', '2025-05-14 15:41:06');
