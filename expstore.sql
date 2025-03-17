-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-03-11 02:06:26
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `expstore`
--

-- --------------------------------------------------------

--
-- 資料表結構 `addbook`
--

CREATE TABLE `addbook` (
  `addressid` int(10) NOT NULL COMMENT '地址ID',
  `setdefault` tinyint(1) NOT NULL DEFAULT 0 COMMENT '預設收件人',
  `emailid` int(10) NOT NULL COMMENT '會員編號',
  `cname` varchar(30) NOT NULL COMMENT '收件者姓名',
  `mobile` varchar(20) NOT NULL COMMENT '收件者電話',
  `myzip` varchar(10) DEFAULT NULL COMMENT '郵遞區號',
  `address` varchar(200) NOT NULL COMMENT '收件地址',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '建立日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `addbook`
--

INSERT INTO `addbook` (`addressid`, `setdefault`, `emailid`, `cname`, `mobile`, `myzip`, `address`, `create_date`) VALUES
(1, 1, 11, '鍾珮蓉', '0978810915', '300', '自強一街21號7樓', '2025-02-24 08:11:55'),
(2, 0, 12, '999', '0954813945', '819', '自強一街0號7樓', '2025-02-24 08:26:49'),
(3, 1, 10, '鍾蓉蓉', '0978520520', '205', '巧虎島凱蒂貓街1號', '2025-03-03 08:26:05'),
(4, 1, 13, 'QQQ', '0978542369', '262', '自強一街1號7樓', '2025-03-05 07:40:13'),
(5, 0, 13, 'AAA', '0978546236', '354', '自強一街11號', '2025-03-05 07:40:33'),
(6, 0, 12, '888', '0978654326', '223', '自強一街2號7樓', '2025-03-07 03:01:58'),
(7, 1, 12, '666', '0978563421', '203', '自強一街2號7樓', '2025-03-10 08:13:03');

-- --------------------------------------------------------

--
-- 資料表結構 `carousel`
--

CREATE TABLE `carousel` (
  `caro_id` int(3) NOT NULL COMMENT '輪播編號',
  `caro_title` varchar(50) DEFAULT NULL COMMENT '輪播標題',
  `caro_content` varchar(100) DEFAULT NULL COMMENT '輪播內容介紹',
  `caro_online` tinyint(1) NOT NULL DEFAULT 1 COMMENT '上下架',
  `caro_sort` int(3) NOT NULL COMMENT '輪播排序',
  `caro_pic` varchar(50) NOT NULL COMMENT '輪播圖檔名稱',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '建立日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `carousel`
--

INSERT INTO `carousel` (`caro_id`, `caro_title`, `caro_content`, `caro_online`, `caro_sort`, `caro_pic`, `p_id`, `create_date`) VALUES
(1, '', '', 1, 1, 'OSEWAYApic01.webp', 13, '2021-03-18 03:59:55'),
(2, '', '', 1, 2, 'OSEWAYApic02.webp', 49, '2021-03-18 03:59:55'),
(3, '', '', 1, 3, 'OSEWAYApic03.webp', 50, '2021-03-18 03:59:55'),
(4, '', '', 0, 4, 'OSEWAYApic03.webp', 51, '2021-03-18 03:59:55');

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `cartid` int(10) NOT NULL COMMENT '購物車編號',
  `emailid` int(10) DEFAULT NULL COMMENT '會員編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `qty` int(3) NOT NULL COMMENT '產品數量',
  `orderid` varchar(30) DEFAULT NULL COMMENT '訂單編號',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '訂單處理狀態',
  `ip` varchar(200) NOT NULL COMMENT '訂購者的IP',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '加入購物車時間'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `cart`
--

INSERT INTO `cart` (`cartid`, `emailid`, `p_id`, `qty`, `orderid`, `status`, `ip`, `create_date`) VALUES
(27, NULL, 28, 3, NULL, 1, '127.0.0.1', '2025-02-17 08:12:21'),
(26, NULL, 51, 3, NULL, 1, '127.0.0.1', '2025-02-17 08:12:19'),
(28, 13, 39, 3, '2025030503514997655', 8, '::1', '2025-02-18 08:03:08'),
(29, 13, 50, 2, '2025030503514997655', 8, '::1', '2025-03-05 07:50:40'),
(30, 13, 50, 1, '2025030504030622392', 8, '::1', '2025-03-05 08:02:39'),
(31, 13, 51, 2, '2025030504030622392', 8, '::1', '2025-03-05 08:02:41'),
(32, 13, 49, 1, '2025030504030622392', 8, '::1', '2025-03-05 08:02:42'),
(33, 12, 51, 1, '2025030710082973524', 8, '::1', '2025-03-05 08:04:16'),
(34, 12, 48, 1, '2025030710082973524', 8, '::1', '2025-03-05 08:04:18'),
(35, 12, 43, 1, '2025030710082973524', 8, '::1', '2025-03-05 08:04:20'),
(36, 12, 51, 1, '2025031002074589842', 8, '::1', '2025-03-07 02:10:51'),
(38, 12, 44, 1, '2025031002074589842', 8, '::1', '2025-03-07 02:10:56'),
(39, 12, 48, 1, '2025031002074589842', 8, '::1', '2025-03-10 06:07:28'),
(40, 12, 46, 1, '2025031002074589842', 8, '::1', '2025-03-10 06:07:31'),
(41, 12, 28, 1, '2025031002080959636', 8, '::1', '2025-03-10 06:07:54'),
(42, 12, 51, 1, '2025031002080959636', 8, '::1', '2025-03-10 06:07:56'),
(43, 12, 24, 1, '2025031002080959636', 8, '::1', '2025-03-10 06:08:01'),
(44, 12, 47, 1, '2025031002082265255', 8, '::1', '2025-03-10 06:08:14'),
(45, 12, 48, 1, '2025031002082265255', 8, '::1', '2025-03-10 06:08:16'),
(46, 12, 50, 1, '2025031002105239851', 8, '::1', '2025-03-10 06:10:40'),
(47, 12, 47, 1, '2025031002105239851', 8, '::1', '2025-03-10 06:10:42'),
(48, 12, 45, 1, '2025031002105239851', 8, '::1', '2025-03-10 06:10:45'),
(49, 12, 49, 1, '2025031002111444391', 8, '::1', '2025-03-10 06:10:56'),
(50, 12, 14, 1, '2025031002111444391', 8, '::1', '2025-03-10 06:11:01'),
(51, 12, 15, 1, '2025031002111444391', 8, '::1', '2025-03-10 06:11:03'),
(52, 12, 47, 2, '2025031004130980303', 8, '::1', '2025-03-10 08:09:12'),
(53, 12, 46, 1, '2025031004130980303', 8, '::1', '2025-03-10 08:09:14'),
(54, 12, 44, 2, '2025031004130980303', 8, '::1', '2025-03-10 08:09:20'),
(57, NULL, 48, 1, NULL, 1, '::1', '2025-03-11 00:58:43'),
(58, NULL, 47, 2, NULL, 1, '::1', '2025-03-11 00:58:46');

-- --------------------------------------------------------

--
-- 資料表結構 `city`
--

CREATE TABLE `city` (
  `AutoNo` int(10) NOT NULL COMMENT '城市編號',
  `Name` varchar(150) NOT NULL COMMENT '城市名稱',
  `cityOrder` tinyint(2) NOT NULL COMMENT '標記',
  `State` smallint(6) NOT NULL COMMENT '狀態'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `city`
--

INSERT INTO `city` (`AutoNo`, `Name`, `cityOrder`, `State`) VALUES
(1, '臺北市', 0, 0),
(2, '基隆市', 0, 0),
(3, '新北市', 0, 0),
(4, '宜蘭縣', 0, 0),
(5, '新竹市', 0, 0),
(6, '新竹縣', 0, 0),
(7, '桃園市', 0, 0),
(8, '苗栗縣', 0, 0),
(9, '台中市', 0, 0),
(10, '彰化縣', 0, 0),
(11, '南投縣', 0, 0),
(12, '雲林縣', 0, 0),
(13, '嘉義市', 0, 0),
(14, '嘉義縣', 0, 0),
(15, '台南市', 0, 0),
(16, '高雄市', 0, 0),
(17, '南海諸島', 0, 0),
(18, '澎湖縣', 0, 0),
(19, '屏東縣', 0, 0),
(20, '台東縣', 0, 0),
(21, '花蓮縣', 0, 0),
(22, '金門縣', 0, 0),
(23, '連江縣', 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `hot`
--

CREATE TABLE `hot` (
  `h_id` int(3) NOT NULL COMMENT '熱銷商品流水號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `h_sort` int(3) DEFAULT NULL COMMENT '熱銷商品排名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `hot`
--

INSERT INTO `hot` (`h_id`, `p_id`, `h_sort`) VALUES
(1, 13, 1),
(2, 14, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `emailid` int(11) NOT NULL COMMENT 'email流水號',
  `email` varchar(100) NOT NULL COMMENT 'email帳號',
  `pw1` varchar(50) NOT NULL COMMENT '密碼',
  `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否啟動',
  `cname` varchar(30) NOT NULL COMMENT '中文姓名',
  `tssn` varchar(20) NOT NULL COMMENT '身份證字號',
  `birthday` date NOT NULL COMMENT '生日',
  `imgname` varchar(20) DEFAULT NULL COMMENT '相片檔名',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '建立日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`emailid`, `email`, `pw1`, `active`, `cname`, `tssn`, `birthday`, `imgname`, `create_date`) VALUES
(9, 'test@gmail.com', '123456', 1, '林小強', 'A123456789', '2021-04-01', NULL, '2025-02-17 06:13:19'),
(10, 'te@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, '李小明', 'A223456789', '2021-04-01', NULL, '2025-02-17 06:13:19'),
(11, 'bbb@JJJ.COM', 'e10adc3949ba59abbe56e057f20f883e', 1, '鍾珮蓉', 'L220389924', '2025-02-20', '擷取.PNG', '2025-02-24 08:11:55'),
(12, '556@jjj.com', 'e10adc3949ba59abbe56e057f20f883e', 1, '999', 'l227816495', '2025-02-27', '', '2025-02-24 08:26:49');

-- --------------------------------------------------------

--
-- 資料表結構 `multiselect`
--

CREATE TABLE `multiselect` (
  `msid` int(5) NOT NULL COMMENT '多功能選擇ID',
  `mslevel` int(2) NOT NULL COMMENT '多功能選擇層級',
  `msuplink` int(4) NOT NULL COMMENT '上層連結',
  `opcode` varchar(10) DEFAULT NULL COMMENT '外掛參數',
  `msname` varchar(50) NOT NULL COMMENT '多功能選擇名稱',
  `msort` int(11) DEFAULT NULL COMMENT '各功能列表排序',
  `url1` varchar(200) DEFAULT NULL COMMENT '外掛網址1',
  `url2` varchar(200) DEFAULT NULL COMMENT '外掛網址2',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '建立日期',
  `update_date` varchar(50) DEFAULT NULL COMMENT '修改日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `multiselect`
--

INSERT INTO `multiselect` (`msid`, `mslevel`, `msuplink`, `opcode`, `msname`, `msort`, `url1`, `url2`, `create_date`, `update_date`) VALUES
(1, 1, 0, NULL, '付款方式', 0, NULL, NULL, '2023-08-11 09:46:53', '2023-08-17 03:42:28'),
(2, 1, 0, NULL, '訂單處理狀態', 0, NULL, NULL, '2023-08-11 09:52:29', '2023-08-17 03:42:41'),
(3, 2, 1, NULL, '貨到付款', 1, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:43:37'),
(4, 2, 1, NULL, '信用卡付款', 2, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:43:54'),
(5, 2, 1, NULL, '銀行轉帳', 3, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:44:37'),
(6, 2, 1, NULL, '電子支付', 4, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:44:51'),
(7, 2, 2, NULL, '處理中', 1, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:03'),
(8, 2, 2, NULL, '待出貨', 2, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:32'),
(9, 2, 2, NULL, '運送中', 3, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:45'),
(10, 2, 2, NULL, '收貨完成', 4, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:10'),
(11, 2, 2, NULL, '退貨中', 5, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:24'),
(12, 2, 2, NULL, '已關閉訂單', 6, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:35'),
(13, 2, 2, NULL, '無效訂單', 7, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 05:39:26'),
(14, 2, 2, NULL, '訂單確認', 8, NULL, NULL, '2023-08-18 06:13:47', '2023-10-23 12:37:36'),
(15, 2, 2, NULL, '平台出貨', 9, NULL, NULL, '2023-08-18 06:13:47', '2023-10-25 08:29:31'),
(34, 1, 0, NULL, '付款處理狀態', 0, NULL, NULL, '2023-08-11 09:52:29', '2023-08-17 03:42:41'),
(35, 2, 34, NULL, '侍貨到付款', 1, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(36, 2, 34, NULL, '完成付款', 2, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(37, 2, 34, NULL, '未完成付款', 3, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(38, 2, 34, NULL, '貨到付款已完成', 4, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12');

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `p_name` varchar(200) NOT NULL COMMENT '產品名稱',
  `p_intro` varchar(200) DEFAULT NULL COMMENT '產品簡介',
  `p_price` int(11) DEFAULT NULL COMMENT '產品單價',
  `p_open` tinyint(1) NOT NULL DEFAULT 1 COMMENT '上架',
  `p_content` text DEFAULT NULL COMMENT '產品詳細規格',
  `p_date` timestamp NULL DEFAULT current_timestamp() COMMENT '產品輸入日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES
(13, 21, 'YURA 玫瑰耳環\n', '【材質】合金、壓克力、鈦柱\n【尺寸】約 2 cm\n【貨號】24PC1893\n', 920, 1, '<div><img src=\"https://img.shoplineapp.com/media/image_clips/656d97e7b182ea0020d6962c/original.png?1701681126\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/656d97e7b182ea0020d6962c/original.png?1701681126\" class=\" sl-lazyloaded\"></div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n', '2017-08-06 16:00:00'),
(14, 21, '月下忍者耳環 - 3入', '【材質】黃銅、壓克力、鈦柱\r\n【尺寸】忍者約 3 cm、城堡約 1.8 cm、新月約 0.5 cm\r\n【貨號】AXPC3243\r\n【產地】日本製造', 490, 1, '<div><img src=\"https://img.shoplineapp.com/media/image_clips/64d09c6bebf4960013e373d0/original.jpeg?1691393131\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64d09c6bebf4960013e373d0/original.jpeg?1691393131\" class=\" ls-is-cached sl-lazyloaded\"></div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n\r\n', '2017-08-06 16:00:00'),
(15, 21, '燈影茶趣耳環 - 3入', '【材質】黃銅，壓克力，木材，鈦柱\n【尺寸】燈籠約 1.8 cm，糰子約 1.5 cm，茶約 0.8 cm\n【貨號】AXSP3242\n【產地】日本製造', 530, 1, '<div><img src=\"https://img.shoplineapp.com/media/image_clips/64d09c6bebf4960013e373d0/original.jpeg?1691393131\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64d09c6bebf4960013e373d0/original.jpeg?1691393131\" class=\" ls-is-cached sl-lazyloaded\"></div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>', '2021-03-10 07:15:16'),
(16, 21, '櫻茶點心耳環 - 3入\n', '【材質】黃銅、壓克力、玻璃、鈦柱\n【尺寸】糰子約 2.1 cm、茶約 1.5 cm、花約 0.7 cm\n【貨號】AXPC3241\n【產地】日本製造', 490, 1, '<div><img src=\"https://img.shoplineapp.com/media/image_clips/64d09c6bebf4960013e373d0/original.jpeg?1691393131\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64d09c6bebf4960013e373d0/original.jpeg?1691393131\" class=\" ls-is-cached sl-lazyloaded\"></div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>', '2021-03-10 07:18:41'),
(17, 21, '福運達摩耳環', '【材質】黃銅、壓克力、Epo、鈦柱\n【尺寸】約 1.6 cm\n【貨號】AXPC3240\n【產地】日本製造', 460, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div><img src=\"https://img.shoplineapp.com/media/image_clips/64d09c6bebf4960013e373d0/original.jpeg?1691393131\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64d09c6bebf4960013e373d0/original.jpeg?1691393131\" class=\" ls-is-cached sl-lazyloaded\"></div>\r\n<div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div><br></div>\r\n<div><br style=\"text-align: center;\"></div>\r\n</div>\r\n\r\n\r\n        \r\n                                    </div>', '2021-03-10 07:18:41'),
(18, 21, '動物生肖耳環 – 3入\n', '【材質】黃銅、合金、壓克力、鈦柱、不銹鋼柱\n【尺寸】龍/約 0.14 cm、繪馬/約 1.3 cm、花/約 0.7 cm\n【貨號】AXSP3208、AXSP3209、AXSP3210\n【產地】日本製造', 770, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div><img src=\"https://img.shoplineapp.com/media/image_clips/64d09c6bebf4960013e373d0/original.jpeg?1691393131\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64d09c6bebf4960013e373d0/original.jpeg?1691393131\" class=\" ls-is-cached sl-lazyloaded\"></div>\r\n<div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div><br></div>\r\n<div><br style=\"text-align: center;\"></div>\r\n</div>\r\n\r\n\r\n        \r\n                                    </div>', '2021-03-10 07:18:41'),
(19, 21, '花紮霞繪耳環 – 3入', '【材質】油漆、樹脂、紙、鈦柱\n【尺寸】約 0.7 cm\n【貨號】AXSP3203\n【產地】日本製造', 570, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div><img src=\"https://img.shoplineapp.com/media/image_clips/64d09c6bebf4960013e373d0/original.jpeg?1691393131\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64d09c6bebf4960013e373d0/original.jpeg?1691393131\" class=\" ls-is-cached sl-lazyloaded\"></div>\r\n<div>\r\n<div><br></div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div><br></div>\r\n<div><br style=\"text-align: center;\"></div>\r\n</div>\r\n\r\n\r\n        \r\n                                    </div>', '2021-03-10 07:18:41'),
(20, 21, '緞面環形耳夾', '【材質】合金\n【尺寸】約 1 cm\n【貨號】24NH0623\n【產地】日本製造', 770, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div><img src=\"https://img.shoplineapp.com/media/image_clips/64ad1c672fd5d7002086ed0f/original.png?1689066598\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64ad1c672fd5d7002086ed0f/original.png?1689066598\" class=\" sl-lazyloaded\"></div>\r\n<div><br></div>\r\n<div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div><br></div>\r\n<div><br style=\"text-align: center;\"></div>\r\n</div>\r\n\r\n\r\n        \r\n                                    </div>', '2021-03-10 07:18:41'),
(21, 21, '半月雙線耳夾', '【材質】合金\n【尺寸】約 1.2 cm\n【貨號】24NH0622\n【產地】日本製造', 770, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div><img src=\"https://img.shoplineapp.com/media/image_clips/64ad1c672fd5d7002086ed0f/original.png?1689066598\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64ad1c672fd5d7002086ed0f/original.png?1689066598\" class=\" ls-is-cached sl-lazyloaded\"></div>\r\n<div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div><br></div>\r\n<div><br style=\"text-align: center;\"></div>\r\n</div>\r\n\r\n\r\n        \r\n                                    </div>', '2021-03-10 07:18:41'),
(22, 21, '植絨緞結耳夾', '【材質】合金、合成纖維\n【尺寸】約 2.4 cm\n【貨號】24ER1015', 600, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\"><img src=\"https://img.shoplineapp.com/media/image_clips/6538cc10841e5b001a51f8ac/original.png?1698221071\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/6538cc10841e5b001a51f8ac/original.png?1698221071\" class=\" ls-is-cached sl-lazyloaded\"></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2021-03-10 07:18:41'),
(23, 21, '花漾蝶結耳環', '【材質】合金、玻璃、塑膠珍珠、鈦金屬耳針\n【尺寸】約 0.9 cm\n【貨號】AXPC5161\n【產地】日本製造', 730, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(24, 21, '晶璨蝶舞耳環', '【材質】立方氧化鋯、黃銅（包括柱部件）\n【尺寸】直徑約 1 cm，圖案約 0.7 cm\n【貨號】24PP0678', 690, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(25, 21, '星鑽璀璨耳環', '【材質】黃銅、立方氧化鋯、不銹鋼柱\n【尺寸】約 1.3 cm \n【貨號】24PP0664', 800, 1, '<div class=\"drop-box\">\n<p>&nbsp;</p>\n<p class=\"ecTitle\">詳細介紹</p>\n<div class=\"longDesc\">\n<p><span style=\"font-size: 14px;\"><strong>肌研濃極潤系列 &nbsp;完美一瓶 5效合一</strong></span></p>\n<div style=\"margin: 0px; padding: 0px;\">\n<div style=\"margin: 0px; padding: 0px;\"><br />\n<div style=\"margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\">極致潤澤、高效美白、緊緻彈力全系列保養滿足肌膚各種需求</span></div>\n<br /><br />\n<div style=\"margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\">讓肌膚美得更有效率輕鬆擁有光澤Q彈的青春美肌</span></div>\n<br />\n<div style=\"margin: 0px; padding: 0px;\">&nbsp;</div>\n<br />\n<div style=\"margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><strong>肌研極潤完美多效清透凝露UV-5效合一最強防曬</strong></span></div>\n<br />\n<div style=\"margin: 0px; padding: 0px;\"><br />\n<table style=\"width: 500px;\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\n<tbody>\n<tr>\n<td style=\"border: 1px solid gray; height: 30px; line-height: 30px;\"><span style=\"font-size: 14px;\">弱酸性</span></td>\n<td style=\"border: 1px solid gray; height: 30px; line-height: 30px;\"><span style=\"font-size: 14px;\">低刺激性</span></td>\n<td style=\"border: 1px solid gray; height: 30px; line-height: 30px;\"><span style=\"font-size: 14px;\">無添加香料、色素、礦物油</span></td>\n</tr>\n</tbody>\n</table>\n<br />\n<p>一瓶取代化粧水、精華液、乳液、防曬、粧前乳擁有肌研最高防曬係數 SPF50+ PA++++能阻隔UVA時間長達16倍。嚴選3重玻尿酸全天候長效保濕清爽水感凝露質地粧前使用粧感服貼更持久。每日早晨保養、防曬一瓶完成</p>\n</div>\n<div style=\"margin: 0px; padding: 0px;\">&nbsp;</div>\n<div style=\"margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"background-color: #afeeee;\">玻尿酸</span> &nbsp; <span style=\"background-color: #afeeee;\">高效玻尿酸</span> &nbsp; &nbsp;<span style=\"background-color: #afeeee;\">水解玻尿酸</span></span></div>\n<br />\n<div style=\"margin: 0px; padding: 0px;\">&nbsp;</div>\n</div>\n</div>\n<div style=\"font-size: 12pt; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><strong>規格</strong></span></div>\n<br /><br />\n<div style=\"font-size: 12pt; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\">50g</span></div>\n<br /><br />\n<div style=\"font-size: 12pt; margin: 0px; padding: 0px;\"><br /><br /><span style=\"font-size: 14px;\"><strong>使用方式:</strong></span></div>\n<br /><br />\n<div style=\"font-size: 12pt; margin: 0px; padding: 0px;\"><br />\n<div style=\"margin: 0px; padding: 0px; color: rgb(51 51 51); font-family: Arial; font-size: 14px; line-height: 17.234px; background-color: rgb(253 255 255);\"><br />\n<div style=\"margin: 0px; padding: 0px; line-height: 17.234px;\"><span style=\"font-size: 14px;\">1. 取適量均勻塗抹於肌膚</span></div>\n<br /><br />\n<div style=\"margin: 0px; padding: 0px; line-height: 17.234px;\"><span style=\"font-size: 14px;\">2. 為達最佳效果流汗後請以毛巾擦乾後再次塗抹</span></div>\n<br /><br />\n<div style=\"margin: 0px; padding: 0px; line-height: 17.234px;\"><span style=\"font-size: 14px;\">3. 清潔時使用一般潔顏產品即可卸除</span></div>\n</div>\n<br /><br />\n<div style=\"margin: 0px; padding: 0px; color: rgb(51 51 51); font-family: Arial; font-size: 16.3636px; line-height: 17.7455px; background-color: rgb(253 255 255);\">&nbsp;</div>\n<br /><br />\n<div style=\"margin: 0px; padding: 0px; color: rgb(51 51 51); font-family: Arial; font-size: 16.3636px; line-height: 17.7455px; background-color: rgb(253 255 255);\">&nbsp;</div>\n<br /><br />\n<div style=\"margin: 0px; padding: 0px; color: rgb(51 51 51); font-family: Arial; font-size: 16.3636px; line-height: 17.7455px; background-color: rgb(253 255 255);\"><span style=\"font-size: 14px;\"><strong>廠商服務專線</strong><br /><br />0800-231-149</span></div>\n<br /><br />\n<div style=\"margin: 0px; padding: 0px; color: rgb(51 51 51); font-family: Arial; font-size: 16.3636px; line-height: 17.7455px; background-color: rgb(253 255 255);\">&nbsp;</div>\n<br /><br />\n<div style=\"margin: 0px; padding: 0px; color: rgb(51 51 51); font-family: Arial; font-size: 16.3636px; line-height: 17.7455px; background-color: rgb(253 255 255);\"><span style=\"font-size: 14px;\"><strong>產地國</strong><br /><br />日本</span></div>\n<br /><br />\n<div style=\"margin: 0px; padding: 0px; color: rgb(51 51 51); font-family: Arial; font-size: 16.3636px; line-height: 17.7455px; background-color: rgb(253 255 255);\"><br />\n<div>&nbsp;</div>\n</div>\n</div>\n</div>\n<p class=\"ecTitle\">商品規格</p>\n<table class=\"ecTable\">\n<tbody>\n<tr>\n<td class=\"td1\">商品簡述</td>\n<td class=\"td2\">All in One清爽水感凝露誕生早晨洗臉後只要一瓶保養、防曬一次完成</td>\n</tr>\n<tr>\n<td class=\"td1\">品牌</td>\n<td class=\"td2\">肌研</td>\n</tr>\n<tr>\n<td class=\"td1\">規格</td>\n<td class=\"td2\">50g</td>\n</tr>\n<tr>\n<td class=\"td1\">原產地</td>\n<td class=\"td2\">日本</td>\n</tr>\n<tr>\n<td class=\"td1\">深、寬、高</td>\n<td class=\"td2\">3.1x8.5x18.5cm</td>\n</tr>\n<tr>\n<td class=\"td1\">淨重</td>\n<td class=\"td2\">50 g</td>\n</tr>\n<tr>\n<td class=\"td1\">保存環境</td>\n<td class=\"td2\">室溫</td>\n</tr>\n<tr>\n<td class=\"td1\">是否可門市/超商取貨</td>\n<td class=\"td2\">Y</td>\n</tr>\n</tbody>\n</table>\n<p class=\"ecTitle\">商品屬性</p>\n<table class=\"ecTable\">\n<tbody>\n<tr>\n<td class=\"td1\">有效期限</td>\n<td class=\"td2\">4年</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<h4>產地</h4>\n<p>JP</p>\n<h4>Height</h4>\n<p>18.5</p>\n<h4>Width</h4>\n<p>8.5</p>\n<h4>Depth</h4>\n<p>3.1</p>\n</div>', '2017-08-06 16:00:00'),
(26, 21, '三角流蘇耳夾\n', '【材質】合金、黃銅、樹脂、矽膠\n【尺寸】約 3.7 cm\n【貨號】LNER1086', 1140, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\"><img src=\"https://img.shoplineapp.com/media/image_clips/655f1694681281001dae726d/original.png?1700730515\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/655f1694681281001dae726d/original.png?1700730515\" class=\" sl-lazyloaded\"></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(27, 21, '珍珠綻放耳夾', '【材質】合金、黃銅、塑膠珍珠、矽\n【尺寸】約 2.5 cm\n【貨號】LNER1084', 1060, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\"><img src=\"https://img.shoplineapp.com/media/image_clips/655f1694681281001dae726d/original.png?1700730515\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/655f1694681281001dae726d/original.png?1700730515\" class=\" ls-is-cached sl-lazyloaded\"></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(28, 21, '絲絨蝶結耳環', '【材質】聚酯纖維、塑膠珍珠、鈦柱\n【尺寸】約 2.2 cm\n【貨號】24PC1877', 600, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\"><img src=\"https://img.shoplineapp.com/media/image_clips/6538cc10841e5b001a51f8ac/original.png?1698221071\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/6538cc10841e5b001a51f8ac/original.png?1698221071\" class=\" ls-is-cached sl-lazyloaded\"></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(29, 111, '黑貓音符項鍊', '【材質】黃銅、合金、玻璃\n【尺寸】總長約 40 cm，調節器約 5 cm，圖案約 1.4 cm\n【貨號】AXNK0522\n【產地】日本製造', 730, 1, '<div class=\"drop-box\">\r\n			\r\n				<meta itemprop=\"description\" content=\"DHC 維他命B群(90日份)，除了DHC等推薦品牌，屈臣氏提供多種熱銷基礎營養其他商品選擇，全面符合您的需求。\">\r\n				<p></p><p class=\"ecTitle\">詳細介紹</p><div class=\"longDesc\"><p>DHC維他命B群是以均衡比例添加維他命B1、B2、B6、B12、葉酸、泛酸、菸鹼酸、生物素、肌醇等9種營養素有助於維持能量正常代謝增進肌膚、神經系統、黏膜及消化系統的健康每日攝取可常保充沛活力讓您天天神采奕奕。</p><br><br><p>維他命B群是協助胺基酸等營養素代謝的必要成分每種營養素都分別具有不同的特性及功能彼此間的作用相輔相成缺一不可因此建議最好能均衡攝取。</p><br><br><p>需特別留意的是維他命B群屬於人體無法自行合成的水溶性維他命不僅無法儲存在體內也容易隨著汗水或尿液而流失所以需要每天積極補充。</p><br><br><p>食物來源</p><br><br><p>五榖雜糧、瘦肉、肝臟、蛋黃、乳酪、牛奶等。</p><br><br><p>各營養素的主要生理功能</p><br><br><p>維他命B1-----能幫助維持肌膚、心臟及神經系統的正常功能</p><br><br><p>維他命B2-----有助於維持能量正常代謝及維持肌膚健康</p><br><br><p>維他命B6-----可維持胺基酸正常代謝及維持紅血球正常型態</p><br><br><p>維他命B12---有助於紅血球的形成及增進神經系統的健康</p><br><br><p>葉酸-----------有助於核酸、核蛋白及紅血球的形成是維持胎兒正常生長發育的必備營養素</p><br><br><p>泛酸-----------有助於體脂肪、膽固醇的合成及胺基酸的代謝</p><br><br><p>菸鹼素--------可增進肌膚、神經系統、黏膜及消化系統的健康</p><br><br><p>生物素--------有助於脂肪與肝醣的合成增進皮膚和黏膜健康</p><br></div><p class=\"ecTitle\">商品規格</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">商品簡述</td><td class=\"td2\">常保充沛活力天天神采奕奕</td></tr><tr><td class=\"td1\">品牌</td><td class=\"td2\">DHC</td></tr><tr><td class=\"td1\">規格</td><td class=\"td2\">90日份180粒</td></tr><tr><td class=\"td1\">原產地</td><td class=\"td2\">台灣</td></tr><tr><td class=\"td1\">深、寬、高</td><td class=\"td2\">1x12x17cm</td></tr><tr><td class=\"td1\">淨重</td><td class=\"td2\">44.1 g</td></tr><tr><td class=\"td1\">保存環境</td><td class=\"td2\">室溫</td></tr><tr><td class=\"td1\">是否可門市/超商取貨</td><td class=\"td2\">Y</td></tr></tbody></table><p class=\"ecTitle\">商品屬性</p><table class=\"ecTable\"><tbody><tr><td class=\"td1\">內容物名稱</td><td class=\"td2\">菸鹼醯胺、預糊化澱粉、維生素B6</td></tr><tr><td class=\"td1\">食品添加物名稱</td><td class=\"td2\">微結晶纖維素、肌醇、泛酸鈣、維生素B1 、維生素B2、葉酸維生素B12</td></tr><tr><td class=\"td1\">營養成份</td><td class=\"td2\">依照產品說明</td></tr><tr><td class=\"td1\">製造日期</td><td class=\"td2\">依外包裝顯示</td></tr><tr><td class=\"td1\">有效日期</td><td class=\"td2\">3年</td></tr><tr><td class=\"td1\">包裝份量</td><td class=\"td2\">90日份</td></tr><tr><td class=\"td1\">內容量</td><td class=\"td2\">180粒</td></tr><tr><td class=\"td1\">投保產品責任險</td><td class=\"td2\">第17AML0000693號</td></tr><tr><td class=\"td1\">注意事項</td><td class=\"td2\">請依照每日建議量食用多食無益。請置於陰涼乾燥處避免陽光直射。</td></tr><tr><td class=\"td1\">其他</td><td class=\"td2\">每日2粒早晚搭配開水分次食用</td></tr><tr><td class=\"td1\">食品業者登錄字號</td><td class=\"td2\">A-189403744-00000-7</td></tr></tbody></table><style>.ecTable{width:100%;border:1px solid gray;}.ecTable td{border:1px solid gray;font-size:14px}.ecTable .td1{width:30%;height:25px;padding:5px;line-height:25px;background-color:#eeeeee;text-align:center;font-weight:bold}.ecTable .td2{padding:5px;letter-spacing:1px;color:#4c4c4c}.ecTitle{font-size:18px;font-weight:bold;color:#009f9f;margin:5px 0 5px 0;} .longDesc p{margin-bottom:16px}</style><p></p>\r\n			\r\n			\r\n				<h4>產地</h4>\r\n				<p>TW</p>\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n				<h4>Height</h4>\r\n				<p>17</p>\r\n			\r\n			\r\n				<h4>Width</h4>\r\n				<p>12</p>\r\n			\r\n			\r\n				<h4>Depth</h4>\r\n				<p>1</p>\r\n			\r\n			\r\n			\r\n			\r\n			<br>\r\n		</div>', '2017-08-06 16:00:00'),
(30, 111, '晶露垂滴項鍊 - 316不鏽鋼', '【材質】手術不鏽鋼 316L、立方氧化鋯、磁鐵\n【尺寸】總長約 41 cm、立方氧化鋯約 0.5 cm、下降部分約 1.5 cm\n【貨號】24NP0501', 980, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"https://img.shoplineapp.com/media/image_clips/6764f78ee3ac35000a2773b5/original.jpg?1734670222\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/6764f78ee3ac35000a2773b5/original.jpg?1734670222\" class=\" ls-is-cached sl-lazyloaded\">\r\n</div>\r\n<div><br></div>\r\n<div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div><br></div>\r\n<div><br style=\"text-align: center;\"></div>\r\n</div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(31, 111, 'Y型垂晶項鍊 - 316不鏽鋼', '【材質】手術不鏽鋼 316L，立方氧化鋯，磁鐵\n【尺寸】總長度約 41 cm，立方氧化鋯（大）約 0.7 cm，降低部分約 0.37 cm\n【貨號】24NP0500', 980, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"https://img.shoplineapp.com/media/image_clips/6764f78ee3ac35000a2773b5/original.jpg?1734670222\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/6764f78ee3ac35000a2773b5/original.jpg?1734670222\" class=\" ls-is-cached sl-lazyloaded\">\r\n</div>\r\n<div>\r\n<div><br></div>\r\n<div><br></div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div><br></div>\r\n<div><br style=\"text-align: center;\"></div>\r\n</div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(32, 111, '珍珠細語項鍊 - 316不鏽鋼\n', '【材質】手術不鏽鋼316L、淡水珍珠、磁鐵\n【尺寸】總長約 41 cm、淡水珍珠約 0.2 cm\n【貨號】24NP0499', 980, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"https://img.shoplineapp.com/media/image_clips/6764f78ee3ac35000a2773b5/original.jpg?1734670222\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/6764f78ee3ac35000a2773b5/original.jpg?1734670222\" class=\" ls-is-cached sl-lazyloaded\">\r\n</div>\r\n<div><br></div>\r\n<div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div><br></div>\r\n<div><br style=\"text-align: center;\"></div>\r\n</div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(33, 111, '細鏈珍珠磁鐵項鍊 - 316不鏽鋼', '【材質】316L手術不鏽鋼、淡水珍珠、磁鐵\n【尺寸】總長約 41 cm、淡水珍珠約 0.4-0.5 cm \n【貨號】24NP0498', 920, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"https://img.shoplineapp.com/media/image_clips/6764f78ee3ac35000a2773b5/original.jpg?1734670222\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/6764f78ee3ac35000a2773b5/original.jpg?1734670222\" class=\" ls-is-cached sl-lazyloaded\">\r\n</div>\r\n<div><br></div>\r\n<div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" sl-lazyloaded\"><br>\r\n</div>\r\n<div><br></div>\r\n<div><br style=\"text-align: center;\"></div>\r\n</div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(34, 111, '天鵝絨頸鍊', '【材質】合金、鐵、聚酯纖維\n【尺寸】總長約 32 cm，調節器約 5 cm，圖案約 9 cm\n【貨號】24NK1045\n【產地】日本製造', 690, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(35, 111, '月牙星耀項鍊', '【材質】合金，黃銅\n【尺寸】總長約 40 cm，調節器約 5 cm，圖案約 2 cm\n【貨號】AXNK1394\n【產地】日本製造', 690, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(36, 111, '心型珍珠項鍊', '【材質】黃銅、鐵、塑膠珍珠\n【尺寸】總長約 38 cm，調節器約 5 cm，圖案約 1.4 cm\n【貨號】24NK1029\n【規格】單件販售', 770, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\"><img src=\"https://img.shoplineapp.com/media/image_clips/651ce200a7110c169370bdbc/original.png?1696391680\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/651ce200a7110c169370bdbc/original.png?1696391680\" class=\" ls-is-cached sl-lazyloaded\"></div>\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(37, 111, '幸運草項鍊', '【材質】黃銅、合金、玻璃\n【尺寸】總長約 39 cm，調節器約 5 cm，圖案約 1.2 cm\n【貨號】24NP0476', 640, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(38, 111, 'Rose Silver 純淨珍珠項鍊', '【材質】黃銅、塑膠珍珠\n【尺寸】總長約 41 cm，調節器約 5 cm，珍珠（大）約 0.6 cm\n【貨號】24NK1026\n【規格】單件販售', 800, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(39, 111, '桔梗花語項鍊', '【材質】無鎳電鍍、黃銅\n【尺寸】鍊長約 39 cm、延長鍊約 5 cm\n【貨號】AXNP0417\n【規格】單件販售', 690, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/6530ba081f338d001a578813/original.png?1697692167\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/6530ba081f338d001a578813/original.png?1697692167\" class=\" sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(40, 111, '晶瑩蝴蝶項鍊', '【材質】黃銅、立方氧化鋯\n【尺寸】總長度約 41 cm，調節器約 6 cm，圖案約 1 cm\n【貨號】24NP0452\n【規格】單件販售', 800, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/6530ad2b18d070001acc2858/original.jpeg?1697688875\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/6530ad2b18d070001acc2858/original.jpeg?1697688875\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(41, 111, '星光花語項鍊', '【材質】黃銅、立方氧化鋯\n【尺寸】總長度約 41 cm，調節器約 6 cm，圖案約 1.3 cm\n【貨號】24NP0449\n【規格】單件販售', 770, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(42, 111, '繫心之結項鍊', '【材質】黃銅、合金\n【尺寸】總長度約 46 cm，調節器約 5 cm，圖案約 4 cm\n【貨號】24NK0996\n【規格】單件販售', 640, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(43, 111, '2WAY垂滴項鍊', '【材質】無鎳、黃銅、合金、CCB\n【尺寸】總長度約 67 cm，圖案約 1.7 cm，滑動球可調節\n【貨號】24NK1000\n【規格】單件販售', 690, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(44, 111, '閃亮蝴蝶結項鍊', '【材質】無鎳電鍍、黃銅、合金\n【尺寸】約 39 cm + 5 cm（延長鍊）\n【貨號】24NK0990\n【規格】單件販售', 840, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(45, 22, '黑貓音符耳環', '【材質】黃銅，合金，塑膠珍珠，鈦柱\n【尺寸】包括掛鉤部分/約 3.1 cm，約 2.8 cm\n【貨號】AXPC0520\n【產地】日本製造', 730, 1, '<div><img src=\"https://img.shoplineapp.com/media/image_clips/650912aabe007a0014b87381/original.png?1695093418\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/650912aabe007a0014b87381/original.png?1695093418\" class=\" sl-lazyloaded\"></div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" sl-lazyloaded\"><br>\r\n</div>', '2017-08-06 16:00:00'),
(46, 22, '金屬水滴波紋耳夾', '【材質】黃銅、玻璃、樹脂\n【尺寸】約 4.3 cm\n【貨號】24NH0626\n【產地】日本製造', 490, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div><br></div>\r\n<div>\r\n<div>\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div><br></div>\r\n<div><br style=\"text-align: center;\"></div>\r\n</div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(47, 22, '麋鹿星雪耳環', '【材質】合金、塑膠珍珠、玻璃、鈦金屬耳針\n【尺寸】麋鹿約 2 cm，雪花(含珍珠)約 2.5 cm\n【貨號】AXPC5163\n【產地】日本製造', 770, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\"><img src=\"https://img.shoplineapp.com/media/image_clips/6538cc10841e5b001a51f8ac/original.png?1698221071\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/6538cc10841e5b001a51f8ac/original.png?1698221071\" class=\" ls-is-cached sl-lazyloaded\"></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(48, 22, '心光花環耳環', '【材質】立方氧化鋯\n【尺寸】花環約 2 cm\n【貨號】AXPC5162\n【產地】日本製造', 730, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\"><img src=\"https://img.shoplineapp.com/media/image_clips/6538cc10841e5b001a51f8ac/original.png?1698221071\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/6538cc10841e5b001a51f8ac/original.png?1698221071\" class=\" ls-is-cached sl-lazyloaded\"></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(49, 116, '羊毛貝雷帽', '【材質】95% 羊毛、5% 尼龍\n【尺寸】57.5cm\n【貨號】430-435\n【規格】單件販售', 730, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(50, 25, '愛心毛球耳夾', '【材質】無鎳電鍍、黃銅、玻璃、Epo、人造珍珠、聚脂纖維\n【尺寸】總長約 5 公分\n【貨號】AXNH5058', 730, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/6538cc10841e5b001a51f8ac/original.png?1698221071\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/6538cc10841e5b001a51f8ac/original.png?1698221071\" class=\" sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\" ls-is-cached sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00'),
(51, 21, '松壽司耳環', '【材質】黏土、EPO\n【尺寸】約 1.3 cm\n【貨號】AXPC0481 , AXPC0482\n【產地】日本\n【規格】一對販售', 570, 1, '<div class=\"ProductDetail-description\">                <div class=\"ProductDetail-title primary-border-color-after\">                  商品描述                </div>                                \r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n          \r\n\r\n<div style=\"text-align: center;\">\r\n<img src=\"https://img.shoplineapp.com/media/image_clips/65f174a2e658d4b2abee779a/original.png?1710322849\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/65f174a2e658d4b2abee779a/original.png?1710322849\" class=\" sl-lazyloaded\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\">\r\n<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAAGQAQMAAAC6caSPAAAAA1BMVEVHcEyC+tLSAAAAAXRSTlMAQObYZgAAACpJREFUeNrtwTEBAAAAwqD1T+1vBqAAAAAAAAAAAAAAAAAAAAAAAAAAgDdPsAABlEEYXAAAAABJRU5ErkJggg==\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64d09c6bebf4960013e373d0/original.jpeg?1691393131\" class=\"sl-lazy\"><br>\r\n</div>\r\n<div style=\"text-align: center;\">\r\n<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAAGQAQMAAAC6caSPAAAAA1BMVEVHcEyC+tLSAAAAAXRSTlMAQObYZgAAACpJREFUeNrtwTEBAAAAwqD1T+1vBqAAAAAAAAAAAAAAAAAAAAAAAAAAgDdPsAABlEEYXAAAAABJRU5ErkJggg==\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/64f5806a1539ac00149cb26e/original.png?1693810793\" class=\"sl-lazy\"><br>\r\n</div>\r\n<div style=\"text-align: center;\"><br></div>\r\n<div style=\"text-align: center;\"><br></div>\r\n\r\n\r\n        \r\n                                    </div>', '2017-08-06 16:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `product_img`
--

CREATE TABLE `product_img` (
  `img_id` int(11) NOT NULL COMMENT '圖檔編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `img_file` varchar(100) NOT NULL COMMENT '圖檔名稱',
  `sort` int(2) NOT NULL COMMENT '圖片順序',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '建立日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product_img`
--

INSERT INTO `product_img` (`img_id`, `p_id`, `img_file`, `sort`, `create_date`) VALUES
(103, 51, 'pp2.webp', 2, '2021-03-18 03:35:17'),
(102, 51, 'pp1.webp', 1, '2021-03-18 03:35:17'),
(101, 50, 'oo2.webp', 2, '2021-03-18 03:29:09'),
(100, 50, 'oo1.webp', 1, '2021-03-18 03:29:09'),
(99, 49, 'ii2.webp', 2, '2021-03-18 03:21:43'),
(98, 49, 'ii1.webp', 1, '2021-03-18 03:21:43'),
(97, 48, 'uu3.webp', 3, '2021-03-17 08:50:05'),
(96, 48, 'uu2.webp', 2, '2021-03-17 08:50:05'),
(95, 48, 'uu1.webp', 1, '2021-03-17 08:50:05'),
(94, 47, 'yy2.webp', 2, '2021-03-17 08:42:31'),
(93, 47, 'yy1.webp', 1, '2021-03-17 08:42:31'),
(92, 46, 'tt2.webp', 2, '2021-03-17 08:38:37'),
(91, 46, 'tt1.webp', 1, '2021-03-17 08:38:37'),
(90, 45, 'rr2.webp', 2, '2021-03-17 08:27:09'),
(89, 45, 'rr1.webp', 1, '2021-03-17 08:27:09'),
(88, 44, 'ee3.webp', 2, '2021-03-17 08:17:40'),
(87, 44, 'ee2.webp', 1, '2021-03-17 08:17:40'),
(86, 44, 'ee1.webp', 3, '2021-03-17 08:15:22'),
(85, 43, 'ww3.webp', 3, '2021-03-17 08:06:00'),
(84, 43, 'ww2.webp', 2, '2021-03-17 08:06:00'),
(83, 43, 'ww1.webp', 1, '2021-03-17 08:06:00'),
(82, 42, 'qq2.webp', 2, '2021-03-17 08:02:39'),
(81, 42, 'qq1.webp', 1, '2021-03-17 08:02:39'),
(80, 41, '9001.webp', 2, '2021-03-17 07:58:31'),
(79, 41, '9000.webp', 1, '2021-03-17 07:58:31'),
(78, 40, '8001.webp', 3, '2021-03-17 07:55:25'),
(77, 40, '8002.webp', 2, '2021-03-17 07:55:25'),
(76, 40, '8000.webp', 1, '2021-03-17 07:55:25'),
(75, 39, '7001.webp', 2, '2021-03-17 07:51:51'),
(74, 39, '7000.webp', 1, '2021-03-17 07:51:51'),
(73, 38, '6002.webp', 3, '2021-03-17 07:40:00'),
(72, 38, '6001.webp', 2, '2021-03-17 07:40:00'),
(71, 38, '6000.webp', 1, '2021-03-17 07:40:00'),
(70, 37, '5001.webp', 2, '2021-03-17 07:35:19'),
(69, 37, '5000.webp', 1, '2021-03-17 07:35:19'),
(68, 36, '4002.webp', 3, '2021-03-17 07:32:38'),
(67, 36, '4001.webp', 2, '2021-03-17 07:32:38'),
(66, 36, '4000.webp', 1, '2021-03-17 07:32:38'),
(65, 35, '3001.webp', 2, '2021-03-17 07:29:45'),
(64, 35, '3000.webp', 1, '2021-03-17 07:29:45'),
(63, 34, '2002.webp', 4, '2021-03-17 07:27:12'),
(62, 34, '2002.webp', 3, '2021-03-17 07:27:12'),
(61, 34, '2001.webp', 2, '2021-03-17 07:27:12'),
(60, 34, '2000.webp', 1, '2021-03-17 07:27:12'),
(59, 33, '1001.webp', 2, '2021-03-17 07:23:13'),
(58, 33, '1000.webp', 1, '2021-03-17 07:23:13'),
(57, 32, '910.webp', 2, '2021-03-17 07:18:43'),
(56, 32, '900.webp', 1, '2021-03-17 07:18:43'),
(55, 31, '810.webp', 2, '2021-03-17 06:40:31'),
(54, 31, '800.webp', 1, '2021-03-17 06:40:31'),
(53, 30, '720.webp', 3, '2021-03-17 06:37:21'),
(52, 30, '710.webp', 2, '2021-03-17 06:37:21'),
(51, 30, '700.webp', 1, '2021-03-17 06:37:21'),
(50, 29, '610.webp', 2, '2021-03-17 06:31:25'),
(49, 29, '600.webp', 1, '2021-03-17 06:31:25'),
(48, 28, '510.webp', 2, '2021-03-17 06:16:58'),
(47, 28, '500.webp', 1, '2021-03-17 06:16:58'),
(46, 27, '420.webp', 3, '2021-03-17 03:57:51'),
(45, 27, '410.webp', 2, '2021-03-17 03:57:51'),
(44, 27, '400.webp', 1, '2021-03-17 03:57:51'),
(43, 26, '320.webp', 3, '2021-03-17 03:54:24'),
(42, 26, '310.webp', 2, '2021-03-17 03:54:24'),
(41, 26, '300.webp', 1, '2021-03-17 03:54:24'),
(40, 25, '220.webp', 3, '2021-03-17 03:51:23'),
(39, 25, '210.webp', 2, '2021-03-17 03:51:23'),
(38, 25, '200.webp', 1, '2021-03-17 03:51:23'),
(37, 24, '191.webp', 2, '2021-03-17 03:46:20'),
(36, 24, '190.webp', 1, '2021-03-17 03:46:20'),
(35, 23, '182.webp', 3, '2021-03-17 03:43:06'),
(34, 23, '181.webp', 2, '2021-03-17 03:43:06'),
(33, 23, '180.webp', 1, '2021-03-17 03:43:06'),
(32, 22, '172.webp', 4, '2021-03-17 03:37:56'),
(31, 22, '172.webp', 3, '2021-03-17 03:37:56'),
(30, 22, '171.webp', 2, '2021-03-17 03:37:56'),
(29, 22, '170.webp', 1, '2021-03-17 03:37:56'),
(28, 21, '162.webp', 3, '2021-03-17 03:33:26'),
(27, 21, '161.webp', 2, '2021-03-17 03:33:26'),
(26, 21, '160.webp', 1, '2021-03-17 03:33:26'),
(25, 20, '152.webp', 3, '2021-03-17 03:16:12'),
(24, 20, '151.webp', 2, '2021-03-17 03:16:12'),
(23, 20, '150.webp', 1, '2021-03-17 03:16:12'),
(22, 19, '141.webp', 2, '2021-03-17 03:09:50'),
(21, 19, '140.webp', 1, '2021-03-17 03:09:50'),
(20, 18, '132.webp', 3, '2021-03-17 03:06:03'),
(19, 18, '131.webp', 2, '2021-03-17 03:06:03'),
(18, 18, '130.webp', 1, '2021-03-17 03:06:03'),
(16, 17, '122.webp', 3, '2021-03-10 07:20:07'),
(15, 17, '121.webp', 2, '2021-03-10 07:20:07'),
(14, 17, '120.webp', 1, '2021-03-10 07:20:07'),
(13, 16, '111.webp', 2, '2021-03-10 07:20:07'),
(12, 16, '110.webp', 1, '2021-03-10 07:20:07'),
(11, 15, '101.webp', 2, '2021-03-10 07:16:13'),
(10, 15, '100.webp', 1, '2021-03-10 07:16:13'),
(9, 14, 'bb3.webp', 3, '2021-03-10 06:37:23'),
(8, 14, 'bb2.webp', 1, '2021-03-10 06:37:23'),
(7, 14, 'bb1.webp', 2, '2021-03-10 06:37:23'),
(6, 13, 'aa3.webp', 3, '2021-03-10 06:37:23'),
(5, 13, 'aa2.webp', 2, '2021-03-10 06:36:26'),
(4, 13, 'aa1.webp', 1, '2021-03-10 06:36:26');

-- --------------------------------------------------------

--
-- 資料表結構 `pyclass`
--

CREATE TABLE `pyclass` (
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `level` int(2) NOT NULL COMMENT '所在層級',
  `fonticon` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字型圖示',
  `cname` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '類別名稱',
  `sort` int(3) NOT NULL COMMENT '列表排序',
  `uplink` int(3) NOT NULL COMMENT '上層連結',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '建立時間與更新時間'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 傾印資料表的資料 `pyclass`
--

INSERT INTO `pyclass` (`classid`, `level`, `fonticon`, `cname`, `sort`, `uplink`, `create_date`) VALUES
(1, 1, 'fa-star', '耳環', 1, 0, '2025-02-03 07:23:49'),
(2, 1, 'fa-star', '耳夾', 2, 0, '2025-02-03 07:24:22'),
(3, 1, 'fa-star', '項鍊', 3, 0, '2025-02-03 07:24:30'),
(21, 2, 'fa-feather', '貼耳耳環', 1, 1, '2025-02-03 07:26:29'),
(22, 2, 'fa-feather', '垂墜耳環', 2, 1, '2025-02-03 07:26:33'),
(23, 2, 'fa-feather', '圈圈耳環', 3, 1, '2025-02-03 07:27:38'),
(24, 2, 'fa-feather', '特色耳環', 4, 1, '2025-02-03 07:27:43'),
(25, 2, 'fa-feather', '矽膠耳夾', 1, 2, '2025-02-03 07:28:17'),
(26, 2, 'fa-feather', '螺旋耳夾', 2, 2, '2025-02-03 07:28:21'),
(27, 2, 'fa-feather', '無痛夾式', 3, 2, '2025-02-03 07:28:26'),
(28, 2, 'fa-feather', '耳骨夾', 4, 2, '2025-02-03 07:28:30'),
(29, 2, 'fa-feather', '可愛耳夾', 5, 2, '2025-02-03 07:28:35'),
(110, 2, 'fa-feather', '特色耳夾', 6, 2, '2025-02-03 07:28:40'),
(111, 2, 'fa-feather', '項鍊', 1, 3, '2025-02-03 07:28:45'),
(112, 2, 'fa-feather', '鎖骨鏈', 2, 3, '2025-02-03 07:28:50'),
(113, 2, 'fa-feather', '長項鍊', 3, 3, '2025-02-03 07:28:54'),
(114, 2, 'fa-feather', '特色項鍊', 4, 3, '2025-02-03 07:28:58'),
(115, 2, 'fa-feather', '髮飾', 5, 3, '2025-02-03 07:29:15'),
(116, 2, 'fa-feather', '雜貨', 6, 3, '2025-02-03 07:29:19'),
(117, 2, 'fa-feather', '送禮包裝', 7, 3, '2025-02-03 07:29:23'),
(118, 1, 'fa-feather', '戒指', 4, 0, '2025-02-03 07:29:27'),
(119, 2, 'fa-feather', '可調式戒指', 1, 118, '2025-02-03 07:29:30');

-- --------------------------------------------------------

--
-- 資料表結構 `town`
--

CREATE TABLE `town` (
  `townNo` bigint(20) NOT NULL COMMENT '鄕鎮市編號',
  `Name` varchar(150) NOT NULL COMMENT '鄕鎮市名稱',
  `Post` varchar(10) NOT NULL COMMENT '郵遞區號',
  `State` smallint(6) NOT NULL COMMENT '狀態',
  `AutoNo` int(10) NOT NULL COMMENT '上層城市編號連結'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `town`
--

INSERT INTO `town` (`townNo`, `Name`, `Post`, `State`, `AutoNo`) VALUES
(1, '中正區', '100', 0, 1),
(2, '大同區', '103', 0, 1),
(3, '中山區', '104', 0, 1),
(4, '松山區', '105', 0, 1),
(5, '大安區', '106', 0, 1),
(6, '萬華區', '108', 0, 1),
(7, '信義區', '110', 0, 1),
(8, '士林區', '111', 0, 1),
(9, '北投區', '112', 0, 1),
(10, '內湖區', '114', 0, 1),
(11, '南港區', '115', 0, 1),
(12, '文山區', '116', 0, 1),
(13, '仁愛區', '200', 0, 2),
(14, '信義區', '201', 0, 2),
(15, '中正區', '202', 0, 2),
(16, '中山區', '203', 0, 2),
(17, '安樂區', '204', 0, 2),
(18, '暖暖區', '205', 0, 2),
(19, '七堵區', '206', 0, 2),
(20, '萬里區', '207', 0, 3),
(21, '金山區', '208', 0, 3),
(22, '板橋區', '220', 0, 3),
(23, '汐止區', '221', 0, 3),
(24, '深坑區', '222', 0, 3),
(25, '石碇區', '223', 0, 3),
(26, '瑞芳區', '224', 0, 3),
(27, '平溪區', '226', 0, 3),
(28, '雙溪區', '227', 0, 3),
(29, '貢寮區', '228', 0, 3),
(30, '新店區', '231', 0, 3),
(31, '坪林區', '232', 0, 3),
(32, '烏來區', '233', 0, 3),
(33, '永和區', '234', 0, 3),
(34, '中和區', '235', 0, 3),
(35, '土城區', '236', 0, 3),
(36, '三峽區', '237', 0, 3),
(37, '樹林區', '238', 0, 3),
(38, '鶯歌區', '239', 0, 3),
(39, '三重區', '241', 0, 3),
(40, '新莊區', '242', 0, 3),
(41, '泰山區', '243', 0, 3),
(42, '林口區', '244', 0, 3),
(43, '蘆洲區', '247', 0, 3),
(44, '五股區', '248', 0, 3),
(45, '八里區', '249', 0, 3),
(46, '淡水區', '251', 0, 3),
(47, '三芝區', '252', 0, 3),
(48, '石門區', '253', 0, 3),
(49, '宜蘭市', '260', 0, 4),
(50, '頭城鎮', '261', 0, 4),
(51, '礁溪鄉', '262', 0, 4),
(52, '壯圍鄉', '263', 0, 4),
(53, '員山鄉', '264', 0, 4),
(54, '羅東鎮', '265', 0, 4),
(55, '三星鄉', '266', 0, 4),
(56, '大同鄉', '267', 0, 4),
(57, '五結鄉', '268', 0, 4),
(58, '冬山鄉', '269', 0, 4),
(59, '蘇澳鎮', '270', 0, 4),
(60, '南澳鄉', '272', 0, 4),
(61, '釣魚台列嶼', '290', 0, 4),
(62, '新竹市(東區)', '300', 0, 5),
(63, '竹北市', '302', 0, 6),
(64, '湖口鄉', '303', 0, 6),
(65, '新豐鄉', '304', 0, 6),
(66, '新埔鎮', '305', 0, 6),
(67, '關西鎮', '306', 0, 6),
(68, '芎林鄉', '307', 0, 6),
(69, '寶山鄉', '308', 0, 6),
(70, '竹東鎮', '310', 0, 6),
(71, '五峰鄉', '311', 0, 6),
(72, '橫山鄉', '312', 0, 6),
(73, '尖石鄉', '313', 0, 6),
(74, '北埔鄉', '314', 0, 6),
(75, '峨眉鄉', '315', 0, 6),
(76, '中壢區', '320', 0, 7),
(77, '平鎮區', '324', 0, 7),
(78, '龍潭區', '325', 0, 7),
(79, '楊梅區', '326', 0, 7),
(80, '新屋區', '327', 0, 7),
(81, '觀音區', '328', 0, 7),
(82, '桃園區', '330', 0, 7),
(83, '龜山區', '333', 0, 7),
(84, '八德區', '334', 0, 7),
(85, '大溪區', '335', 0, 7),
(86, '復興區', '336', 0, 7),
(87, '大園區', '337', 0, 7),
(88, '蘆竹區', '338', 0, 7),
(89, '竹南鎮', '350', 0, 8),
(90, '頭份市', '351', 0, 8),
(91, '三灣鄉', '352', 0, 8),
(92, '南庄鄉', '353', 0, 8),
(93, '獅潭鄉', '354', 0, 8),
(94, '後龍鎮', '356', 0, 8),
(95, '通霄鎮', '357', 0, 8),
(96, '苑裡鎮', '358', 0, 8),
(97, '苗栗市', '360', 0, 8),
(98, '造橋鄉', '361', 0, 8),
(99, '頭屋鄉', '362', 0, 8),
(100, '公館鄉', '363', 0, 8),
(101, '大湖鄉', '364', 0, 8),
(102, '泰安鄉', '365', 0, 8),
(103, '銅鑼鄉', '366', 0, 8),
(104, '三義鄉', '367', 0, 8),
(105, '西湖鄉', '368', 0, 8),
(106, '卓蘭鎮', '369', 0, 8),
(107, '中區', '400', 0, 9),
(108, '東區', '401', 0, 9),
(109, '南區', '402', 0, 9),
(110, '西區', '403', 0, 9),
(111, '北區', '404', 0, 9),
(112, '北屯區', '406', 0, 9),
(113, '西屯區', '407', 0, 9),
(114, '南屯區', '408', 0, 9),
(115, '太平區', '411', 0, 9),
(116, '大里區', '412', 0, 9),
(117, '霧峰區', '413', 0, 9),
(118, '烏日區', '414', 0, 9),
(119, '豐原區', '420', 0, 9),
(120, '后里區', '421', 0, 9),
(121, '石岡區', '422', 0, 9),
(122, '東勢區', '423', 0, 9),
(123, '和平區', '424', 0, 9),
(124, '新社區', '426', 0, 9),
(125, '潭子區', '427', 0, 9),
(126, '大雅區', '428', 0, 9),
(127, '神岡區', '429', 0, 9),
(128, '大肚區', '432', 0, 9),
(129, '沙鹿區', '433', 0, 9),
(130, '龍井區', '434', 0, 9),
(131, '梧棲區', '435', 0, 9),
(132, '清水區', '436', 0, 9),
(133, '大甲區', '437', 0, 9),
(134, '外埔區', '438', 0, 9),
(135, '大安區', '439', 0, 9),
(136, '彰化市', '500', 0, 10),
(137, '芬園鄉', '502', 0, 10),
(138, '花壇鄉', '503', 0, 10),
(139, '秀水鄉', '504', 0, 10),
(140, '鹿港鎮', '505', 0, 10),
(141, '福興鄉', '506', 0, 10),
(142, '線西鄉', '507', 0, 10),
(143, '和美鎮', '508', 0, 10),
(144, '伸港鄉', '509', 0, 10),
(145, '員林市', '510', 0, 10),
(146, '社頭鄉', '511', 0, 10),
(147, '永靖鄉', '512', 0, 10),
(148, '埔心鄉', '513', 0, 10),
(149, '溪湖鎮', '514', 0, 10),
(150, '大村鄉', '515', 0, 10),
(151, '埔鹽鄉', '516', 0, 10),
(152, '田中鎮', '520', 0, 10),
(153, '北斗鎮', '521', 0, 10),
(154, '田尾鄉', '522', 0, 10),
(155, '埤頭鄉', '523', 0, 10),
(156, '溪州鄉', '524', 0, 10),
(157, '竹塘鄉', '525', 0, 10),
(158, '二林鎮', '526', 0, 10),
(159, '大城鄉', '527', 0, 10),
(160, '芳苑鄉', '528', 0, 10),
(161, '二水鄉', '530', 0, 10),
(162, '南投市', '540', 0, 11),
(163, '中寮鄉', '541', 0, 11),
(164, '草屯鎮', '542', 0, 11),
(165, '國姓鄉', '544', 0, 11),
(166, '埔里鎮', '545', 0, 11),
(167, '仁愛鄉', '546', 0, 11),
(168, '名間鄉', '551', 0, 11),
(169, '集集鎮', '552', 0, 11),
(170, '水里鄉', '553', 0, 11),
(171, '魚池鄉', '555', 0, 11),
(172, '信義鄉', '556', 0, 11),
(173, '竹山鎮', '557', 0, 11),
(174, '鹿谷鄉', '558', 0, 11),
(175, '斗南鎮', '630', 0, 12),
(176, '大埤鄉', '631', 0, 12),
(177, '虎尾鎮', '632', 0, 12),
(178, '土庫鎮', '633', 0, 12),
(179, '褒忠鄉', '634', 0, 12),
(180, '東勢鄉', '635', 0, 12),
(181, '臺西鄉', '636', 0, 12),
(182, '崙背鄉', '637', 0, 12),
(183, '麥寮鄉', '638', 0, 12),
(184, '斗六市', '640', 0, 12),
(185, '林內鄉', '643', 0, 12),
(186, '古坑鄉', '646', 0, 12),
(187, '莿桐鄉', '647', 0, 12),
(188, '西螺鎮', '648', 0, 12),
(189, '二崙鄉', '649', 0, 12),
(190, '北港鎮', '651', 0, 12),
(191, '水林鄉', '652', 0, 12),
(192, '口湖鄉', '653', 0, 12),
(193, '四湖鄉', '654', 0, 12),
(194, '元長鄉', '655', 0, 12),
(195, '嘉義市(東區)', '600', 0, 13),
(196, '番路鄉', '602', 0, 14),
(197, '梅山鄉', '603', 0, 14),
(198, '竹崎鄉', '604', 0, 14),
(199, '阿里山鄉', '605', 0, 14),
(200, '中埔鄉', '606', 0, 14),
(201, '大埔鄉', '607', 0, 14),
(202, '水上鄉', '608', 0, 14),
(203, '鹿草鄉', '611', 0, 14),
(204, '太保市', '612', 0, 14),
(205, '朴子市', '613', 0, 14),
(206, '東石鄉', '614', 0, 14),
(207, '六腳鄉', '615', 0, 14),
(208, '新港鄉', '616', 0, 14),
(209, '民雄鄉', '621', 0, 14),
(210, '大林鎮', '622', 0, 14),
(211, '溪口鄉', '623', 0, 14),
(212, '義竹鄉', '624', 0, 14),
(213, '布袋鎮', '625', 0, 14),
(214, '中西區', '700', 0, 15),
(215, '東區', '701', 0, 15),
(216, '南區', '702', 0, 15),
(217, '北區', '704', 0, 15),
(218, '安平區', '708', 0, 15),
(219, '安南區', '709', 0, 15),
(220, '永康區', '710', 0, 15),
(221, '歸仁區', '711', 0, 15),
(222, '新化區', '712', 0, 15),
(223, '左鎮區', '713', 0, 15),
(224, '玉井區', '714', 0, 15),
(225, '楠西區', '715', 0, 15),
(226, '南化區', '716', 0, 15),
(227, '仁德區', '717', 0, 15),
(228, '關廟區', '718', 0, 15),
(229, '龍崎區', '719', 0, 15),
(230, '官田區', '720', 0, 15),
(231, '麻豆區', '721', 0, 15),
(232, '佳里區', '722', 0, 15),
(233, '西港區', '723', 0, 15),
(234, '七股區', '724', 0, 15),
(235, '將軍區', '725', 0, 15),
(236, '學甲區', '726', 0, 15),
(237, '北門區', '727', 0, 15),
(238, '新營區', '730', 0, 15),
(239, '後壁區', '731', 0, 15),
(240, '白河區', '732', 0, 15),
(241, '東山區', '733', 0, 15),
(242, '六甲區', '734', 0, 15),
(243, '下營區', '735', 0, 15),
(244, '柳營區', '736', 0, 15),
(245, '鹽水區', '737', 0, 15),
(246, '善化區', '741', 0, 15),
(247, '大內區', '742', 0, 15),
(248, '山上區', '743', 0, 15),
(249, '新市區', '744', 0, 15),
(250, '安定區', '745', 0, 15),
(251, '新興區', '800', 0, 16),
(252, '前金區', '801', 0, 16),
(253, '苓雅區', '802', 0, 16),
(254, '鹽埕區', '803', 0, 16),
(255, '鼓山區', '804', 0, 16),
(256, '旗津區', '805', 0, 16),
(257, '前鎮區', '806', 0, 16),
(258, '三民區', '807', 0, 16),
(259, '楠梓區', '811', 0, 16),
(260, '小港區', '812', 0, 16),
(261, '左營區', '813', 0, 16),
(262, '仁武區', '814', 0, 16),
(263, '大社區', '815', 0, 16),
(264, '岡山區', '820', 0, 16),
(265, '路竹區', '821', 0, 16),
(266, '阿蓮區', '822', 0, 16),
(267, '田寮區', '823', 0, 16),
(268, '燕巢區', '824', 0, 16),
(269, '橋頭區', '825', 0, 16),
(270, '梓官區', '826', 0, 16),
(271, '彌陀區', '827', 0, 16),
(272, '永安區', '828', 0, 16),
(273, '湖內區', '829', 0, 16),
(274, '鳳山區', '830', 0, 16),
(275, '大寮區', '831', 0, 16),
(276, '林園區', '832', 0, 16),
(277, '鳥松區', '833', 0, 16),
(278, '大樹區', '840', 0, 16),
(279, '旗山區', '842', 0, 16),
(280, '美濃區', '843', 0, 16),
(281, '六龜區', '844', 0, 16),
(282, '內門區', '845', 0, 16),
(283, '杉林區', '846', 0, 16),
(284, '甲仙區', '847', 0, 16),
(285, '桃源區', '848', 0, 16),
(286, '那瑪夏區', '849', 0, 16),
(287, '茂林區', '851', 0, 16),
(288, '茄萣區', '852', 0, 16),
(289, '東沙', '817', 0, 17),
(290, '南沙', '819', 0, 17),
(291, '馬公市', '880', 0, 18),
(292, '西嶼鄉', '881', 0, 18),
(293, '望安鄉', '882', 0, 18),
(294, '七美鄉', '883', 0, 18),
(295, '白沙鄉', '884', 0, 18),
(296, '湖西鄉', '885', 0, 18),
(297, '屏東市', '900', 0, 19),
(298, '三地門鄉', '901', 0, 19),
(299, '霧臺鄉', '902', 0, 19),
(300, '瑪家鄉', '903', 0, 19),
(301, '九如鄉', '904', 0, 19),
(302, '里港鄉', '905', 0, 19),
(303, '高樹鄉', '906', 0, 19),
(304, '鹽埔鄉', '907', 0, 19),
(305, '長治鄉', '908', 0, 19),
(306, '麟洛鄉', '909', 0, 19),
(307, '竹田鄉', '911', 0, 19),
(308, '內埔鄉', '912', 0, 19),
(309, '萬丹鄉', '913', 0, 19),
(310, '潮州鎮', '920', 0, 19),
(311, '泰武鄉', '921', 0, 19),
(312, '來義鄉', '922', 0, 19),
(313, '萬巒鄉', '923', 0, 19),
(314, '崁頂鄉', '924', 0, 19),
(315, '新埤鄉', '925', 0, 19),
(316, '南州鄉', '926', 0, 19),
(317, '林邊鄉', '927', 0, 19),
(318, '東港鄉', '928', 0, 19),
(319, '琉球鄉', '929', 0, 19),
(320, '佳冬鄉', '931', 0, 19),
(321, '新園鄉', '932', 0, 19),
(322, '枋寮鄉', '940', 0, 19),
(323, '枋山鄉', '941', 0, 19),
(324, '春日鄉', '942', 0, 19),
(325, '獅子鄉', '943', 0, 19),
(326, '車城鄉', '944', 0, 19),
(327, '牡丹鄉', '945', 0, 19),
(328, '恆春鎮', '946', 0, 19),
(329, '滿州鄉', '947', 0, 19),
(330, '臺東市', '950', 0, 20),
(331, '綠島鄉', '951', 0, 20),
(332, '蘭嶼鄉', '952', 0, 20),
(333, '延平鄉', '953', 0, 20),
(334, '卑南鄉', '954', 0, 20),
(335, '鹿野鄉', '955', 0, 20),
(336, '關山鎮', '956', 0, 20),
(337, '海端鄉', '957', 0, 20),
(338, '池上鄉', '958', 0, 20),
(339, '東河鄉', '959', 0, 20),
(340, '成功鎮', '961', 0, 20),
(341, '長濱鄉', '962', 0, 20),
(342, '太麻里鄉', '963', 0, 20),
(343, '金峰鄉', '964', 0, 20),
(344, '大武鄉', '965', 0, 20),
(345, '達仁鄉', '966', 0, 20),
(346, '花蓮市', '970', 0, 21),
(347, '新城鄉', '971', 0, 21),
(348, '秀林鄉', '972', 0, 21),
(349, '吉安鄉', '973', 0, 21),
(350, '壽豐鄉', '974', 0, 21),
(351, '鳳林鎮', '975', 0, 21),
(352, '光復鄉', '976', 0, 21),
(353, '豐濱鄉', '977', 0, 21),
(354, '瑞穗鄉', '978', 0, 21),
(355, '萬榮鄉', '979', 0, 21),
(356, '玉里鎮', '981', 0, 21),
(357, '卓溪鄉', '982', 0, 21),
(358, '富里鄉', '983', 0, 21),
(359, '金沙鎮', '890', 0, 22),
(360, '金湖鎮', '891', 0, 22),
(361, '金寧鄉', '892', 0, 22),
(362, '金城鎮', '893', 0, 22),
(363, '烈嶼鄉', '894', 0, 22),
(364, '烏坵鄉', '896', 0, 22),
(365, '南竿鄉', '209', 0, 23),
(366, '北竿鄉', '210', 0, 23),
(367, '莒光鄉', '211', 0, 23),
(368, '東引鄉', '212', 0, 23),
(371, '新竹市(北區)', '300', 0, 5),
(372, '新竹市(香山區)', '300', 0, 5),
(373, '嘉義市(西區)', '600', 0, 13);

-- --------------------------------------------------------

--
-- 資料表結構 `uorder`
--

CREATE TABLE `uorder` (
  `orderid` varchar(30) NOT NULL COMMENT '訂單編號',
  `emailid` int(10) NOT NULL COMMENT '會員編號',
  `addressid` int(10) NOT NULL COMMENT '收件人編號',
  `howpay` tinyint(4) NOT NULL DEFAULT 1 COMMENT '如何付款',
  `paystatus` int(5) DEFAULT NULL COMMENT '付款狀態',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '訂單處理狀態',
  `remark` varchar(200) DEFAULT NULL COMMENT '備註',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '訂單時間'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 傾印資料表的資料 `uorder`
--

INSERT INTO `uorder` (`orderid`, `emailid`, `addressid`, `howpay`, `paystatus`, `status`, `remark`, `create_date`) VALUES
('2025030503514997655', 13, 5, 3, 35, 7, NULL, '2025-03-05 07:51:49'),
('2025030504030622392', 13, 4, 3, 35, 7, NULL, '2025-03-05 08:03:06'),
('2025030710082973524', 12, 2, 3, 35, 7, NULL, '2025-03-07 02:08:29'),
('2025031002074589842', 12, 6, 3, 35, 7, NULL, '2025-03-10 06:07:45'),
('2025031002080959636', 12, 6, 3, 35, 7, NULL, '2025-03-10 06:08:09'),
('2025031002082265255', 12, 6, 3, 35, 7, NULL, '2025-03-10 06:08:22'),
('2025031002105239851', 12, 6, 3, 35, 7, NULL, '2025-03-10 06:10:52'),
('2025031002111444391', 12, 2, 3, 35, 7, NULL, '2025-03-10 06:11:14'),
('2025031004130980303', 12, 7, 3, 35, 7, NULL, '2025-03-10 08:13:09');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `addbook`
--
ALTER TABLE `addbook`
  ADD PRIMARY KEY (`addressid`);

--
-- 資料表索引 `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`caro_id`);

--
-- 資料表索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`);

--
-- 資料表索引 `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`AutoNo`);

--
-- 資料表索引 `hot`
--
ALTER TABLE `hot`
  ADD PRIMARY KEY (`h_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`emailid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- 資料表索引 `multiselect`
--
ALTER TABLE `multiselect`
  ADD PRIMARY KEY (`msid`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`);

--
-- 資料表索引 `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`img_id`);

--
-- 資料表索引 `pyclass`
--
ALTER TABLE `pyclass`
  ADD PRIMARY KEY (`classid`);

--
-- 資料表索引 `town`
--
ALTER TABLE `town`
  ADD PRIMARY KEY (`townNo`);

--
-- 資料表索引 `uorder`
--
ALTER TABLE `uorder`
  ADD PRIMARY KEY (`orderid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `addbook`
--
ALTER TABLE `addbook`
  MODIFY `addressid` int(10) NOT NULL AUTO_INCREMENT COMMENT '地址ID', AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `carousel`
--
ALTER TABLE `carousel`
  MODIFY `caro_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '輪播編號', AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int(10) NOT NULL AUTO_INCREMENT COMMENT '購物車編號', AUTO_INCREMENT=59;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `city`
--
ALTER TABLE `city`
  MODIFY `AutoNo` int(10) NOT NULL AUTO_INCREMENT COMMENT '城市編號', AUTO_INCREMENT=24;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `hot`
--
ALTER TABLE `hot`
  MODIFY `h_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '熱銷商品流水號', AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `emailid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'email流水號', AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `multiselect`
--
ALTER TABLE `multiselect`
  MODIFY `msid` int(5) NOT NULL AUTO_INCREMENT COMMENT '多功能選擇ID', AUTO_INCREMENT=39;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '產品編號', AUTO_INCREMENT=52;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_img`
--
ALTER TABLE `product_img`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '圖檔編號', AUTO_INCREMENT=104;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `pyclass`
--
ALTER TABLE `pyclass`
  MODIFY `classid` int(3) NOT NULL AUTO_INCREMENT COMMENT '產品類別', AUTO_INCREMENT=120;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `town`
--
ALTER TABLE `town`
  MODIFY `townNo` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '鄕鎮市編號', AUTO_INCREMENT=374;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
