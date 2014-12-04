-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2014 at 05:07 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pvp_fashion`
--

-- --------------------------------------------------------

--
-- Table structure for table `fs-product_images`
--

CREATE TABLE IF NOT EXISTS `fs-product_images` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Product_id` bigint(20) unsigned NOT NULL,
  `image` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fs_additional_list`
--

CREATE TABLE IF NOT EXISTS `fs_additional_list` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Nameunsign` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` longtext COLLATE utf8_unicode_ci,
  `Fee` double unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fs_category`
--

CREATE TABLE IF NOT EXISTS `fs_category` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Nameunsign` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` longtext COLLATE utf8_unicode_ci,
  `Id_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `fs_category`
--

INSERT INTO `fs_category` (`Id`, `Name`, `Nameunsign`, `Description`, `Id_parent`) VALUES
(1, 'Woman', 'Woman', NULL, 0),
(4, 'Man', 'Man', NULL, 0),
(5, 'Bag', 'bag-woman', NULL, 1),
(6, 'Shoes', 'shoes-woman', NULL, 1),
(7, 'Dress', 'dress-woman', NULL, 1),
(8, 'Pants', 'pant-woman', NULL, 1),
(9, 'Pants', 'pants-men', NULL, 4),
(10, 'Cravat', 'cravat-men', NULL, 4),
(11, 'Bag Model', 'bag-model', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `fs_country`
--

CREATE TABLE IF NOT EXISTS `fs_country` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Nameunsign` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fs_orders`
--

CREATE TABLE IF NOT EXISTS `fs_orders` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Nameunsign` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Date` datetime NOT NULL,
  `User_id` bigint(20) unsigned DEFAULT NULL,
  `Shipping_method` bigint(20) unsigned NOT NULL,
  `Payment_method` bigint(20) unsigned NOT NULL,
  `Status` bigint(20) unsigned DEFAULT '1',
  `Total` double unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fs_order_additional_fee`
--

CREATE TABLE IF NOT EXISTS `fs_order_additional_fee` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Order_id` bigint(20) unsigned NOT NULL,
  `Additional_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fs_order_buyers`
--

CREATE TABLE IF NOT EXISTS `fs_order_buyers` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `Firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Gender` tinyint(1) unsigned NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address_1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Address_2` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Address_3` longtext COLLATE utf8_unicode_ci NOT NULL,
  `City` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Postal` int(5) unsigned NOT NULL,
  `Phone` int(20) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fs_order_details`
--

CREATE TABLE IF NOT EXISTS `fs_order_details` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Order_id` bigint(20) unsigned NOT NULL,
  `Product_id` bigint(20) unsigned NOT NULL,
  `Price` bigint(20) unsigned NOT NULL,
  `Number` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`Id`,`Order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fs_order_shippers`
--

CREATE TABLE IF NOT EXISTS `fs_order_shippers` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `order_id` bigint(20) unsigned NOT NULL,
  `Firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Gender` tinyint(1) unsigned NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address_1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Address_2` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Address_3` longtext COLLATE utf8_unicode_ci NOT NULL,
  `City` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Postal` int(5) unsigned NOT NULL,
  `Phone` int(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fs_order_status`
--

CREATE TABLE IF NOT EXISTS `fs_order_status` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Nameunsign` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fs_payment`
--

CREATE TABLE IF NOT EXISTS `fs_payment` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Nameunsign` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fs_payment_meta`
--

CREATE TABLE IF NOT EXISTS `fs_payment_meta` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Payment_id` bigint(20) unsigned NOT NULL,
  `Meta_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fs_product`
--

CREATE TABLE IF NOT EXISTS `fs_product` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Nameunsign` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Regular_Price` bigint(20) unsigned NOT NULL DEFAULT '0',
  `Sale_Price` bigint(20) unsigned NOT NULL DEFAULT '0',
  `Number` bigint(20) unsigned NOT NULL DEFAULT '0',
  `Description` longtext COLLATE utf8_unicode_ci,
  `Image` longtext COLLATE utf8_unicode_ci,
  `Size` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Color` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Material` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Breasts` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Waist` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Weight` int(10) unsigned NOT NULL DEFAULT '0',
  `Feature` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Id_category` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `fs_product`
--

INSERT INTO `fs_product` (`Id`, `Name`, `Nameunsign`, `Regular_Price`, `Sale_Price`, `Number`, `Description`, `Image`, `Size`, `Color`, `Material`, `Breasts`, `Waist`, `Weight`, `Feature`, `Id_category`) VALUES
(1, 'SKIRT 01', 'SKIRT-01', 17, 0, 2, NULL, '06532362014_04_25_115407.270.400.jpg', '', '', '', '', '', 0, 1, 7),
(2, 'TOP 03', 'TOP-03', 22, 0, 3, NULL, '07042462014_04_19_235739.270.400.jpg', '', '', '', '', '', 0, 1, 7),
(3, 'SKIRT 01 ', 'SKIRT-01 ', 16, 0, 2, NULL, '06532362014_04_25_115407.270.400.jpg', '', '', '', '', '', 0, 1, 7),
(4, 'OUTER 02', 'OUTER-02', 35, 0, 4, NULL, '23400372014_04_22_141928.270.400.jpg', '', '', '', '', '', 0, 1, 7),
(5, 'OUTER 01', 'OUTER-01', 30, 0, 6, NULL, '31488822014_04_20_002629.270.400.jpg', '', '', '', '', '', 0, 1, 7),
(6, 'TOP 01 ', 'TOP-01 ', 19, 0, 5, NULL, '45027442014_04_25_104506.270.400.jpg', '', '', '', '', '', 0, 1, 7),
(7, 'giay nam GB7006-1', 'giay-nam-GB7006-1', 15, 0, 2, NULL, '3744323giay_nam_3__1.280.420.jpg', '', '', '', '', '', 0, 1, 9),
(8, 'giày nam GB7013', 'giay-nam-GB7013', 5, 0, 12, NULL, '0809038giay_nam_don_gian_4__1.280.420.jpg', '', '', '', '', '', 0, 1, 9),
(9, 'giày nam GB7013-1', 'giay-nam-GB7013-1', 12, 0, 42, NULL, '0642505giay_nam_don_gian_3__1.280.420.jpg', '', '', '', '', '', 0, 1, 9),
(10, 'giày nam GB7005-3', 'giay-nam-GB7005-3', 11, 0, 34, NULL, '0219224giay_nam_don_gian_2__1.280.420.jpg', '', '', '', '', '', 0, 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `fs_product_images`
--

CREATE TABLE IF NOT EXISTS `fs_product_images` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Product_id` bigint(20) unsigned NOT NULL,
  `image` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fs_shipping`
--

CREATE TABLE IF NOT EXISTS `fs_shipping` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Nameunsign` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Fee` double unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fs_users`
--

CREATE TABLE IF NOT EXISTS `fs_users` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Role` bigint(20) unsigned NOT NULL,
  `Firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Gender` tinyint(1) unsigned NOT NULL,
  `Birthday` date NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address_1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Address_2` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Address_3` longtext COLLATE utf8_unicode_ci NOT NULL,
  `City` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Postal` int(5) unsigned NOT NULL,
  `Country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` int(20) unsigned DEFAULT NULL,
  `Created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fs_user_role`
--

CREATE TABLE IF NOT EXISTS `fs_user_role` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Nameunsign` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` longtext COLLATE utf8_unicode_ci,
  `Id_parent` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
