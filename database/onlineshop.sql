-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 13, 2021 lúc 09:15 AM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `onlineshop`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'motorolla'),
(5, 'LG'),
(6, 'Cloth Brand');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electronics'),
(2, 'Ladies Wears'),
(3, 'Mens Wear'),
(4, 'Kids Wear'),
(5, 'Furnitures'),
(6, 'Home Appliances'),
(7, 'Electronics Gadgets');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL,
  `product_details` varchar(355) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`, `product_details`) VALUES
(1, 1, 2, 'Samsung Galaxy A52s 5G', 9690000, 'Samsung Galaxy A', 'a52s.jpg', 'samsung galaxy A', 'Màn hình:  Super AMOLED6.5\"Full HD+ Hệ điều hành:  Android 11 Camera sau:  Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP Camera trước:  32 MP Chip:  Snapdragon 778G 5G 8 nhân RAM:  8 GB Bộ nhớ trong:  128 GB SIM:  2 Nano SIMHỗ trợ 5G Pin, Sạc:  4500 mAh25 W'),
(2, 1, 3, 'Iphone 6s Plus', 4990000, 'Iphone 6S', 'ip6splus.jpg', 'iphone 6', 'Màn hình:  LED-backlit IPS LCD4.7\"Retina HD Hệ điều hành:  iOS 11 Camera sau:  12 MP Camera trước:  5 MP Chip:  Apple A9 RAM:  2 GB Bộ nhớ trong:  32 GB SIM:  1 Nano SIM'),
(3, 1, 3, 'Iphone 7 32GB', 13400000, 'Iphone 7s', 'iphone7.jpg', 'iphone 7', 'Màn hình:  LED-backlit IPS LCD4.7\"Retina HD Hệ điều hành:  iOS 14 Camera sau:  12 MP Camera trước:  7 MP Chip:  Apple A10 Fusion RAM:  2 GB Bộ nhớ trong:  32 GB SIM:  1 Nano SIMHỗ trợ 4G Pin, Sạc:  1960 mAh'),
(4, 1, 3, 'iPhone 7 64GB', 14600000, 'Iphone 7s', 'iphone7.jpg', 'iphone 7', 'Màn hình:  LED-backlit IPS LCD4.7\"Retina HD Hệ điều hành:  iOS 14 Camera sau:  12 MP Camera trước:  7 MP Chip:  Apple A10 Fusion RAM:  2 GB Bộ nhớ trong:  128 GB SIM:  1 Nano SIMHỗ trợ 4G Pin, Sạc:  1960 mAh'),
(5, 1, 2, 'Samsung Galaxy A03s', 3490000, 'Samsung Galaxy A', 'a03s.jpg', 'samsung galaxy', 'Màn hình:  PLS LCD6.5\"HD+ Hệ điều hành:  Android 11 Camera sau:  Chính 13 MP & Phụ 2 MP, 2 MP Camera trước:  5 MP Chip:  MediaTek MT6765 RAM:  4 GB Bộ nhớ trong:  64 GB SIM:  2 Nano SIMHỗ trợ 4G Pin, Sạc:  5000 mAh7.75 W'),
(6, 1, 1, 'Galaxy Z Fold2 5G', 44000000, 'Samsung Galaxy Z', 'Zfold2.jpg', 'samsung Zfold2', 'Màn hình:  Chính: Dynamic AMOLED 2X, Phụ: Super AMOLEDChính 7.59\" & Phụ 6.23\"Full HD+ Hệ điều hành:  Android 10 Camera sau:  3 camera 12 MP Camera trước:  Trong 10 MP & Ngoài 10 MP Chip:  Snapdragon 865+ RAM:  12 GB Bộ nhớ trong:  256 GB SIM:  1 Nano SIM & 1 eSIMHỗ trợ 5G Pin, Sạc:  4500 mAh25 W'),
(7, 1, 1, 'Samsung Galaxy Z Fold3 5G 256GB', 41990000, 'Samsung Galaxy Z', 'Zfold3.jpg', 'samsung Zfold3', 'Màn hình:  Dynamic AMOLED 2XChính 7.6\" & Phụ 6.2\"Full HD+ Hệ điều hành:  Android 11 Camera sau:  3 camera 12 MP Camera trước:  10 MP & 4 MP Chip:  Snapdragon 888 RAM:  12 GB Bộ nhớ trong:  256 GB SIM:  2 Nano SIM + 1 eSIMHỗ trợ 5G Pin, Sạc:  4400 mAh25 W'),
(8, 1, 4, 'Samsung Galaxy Z Flip3 5G 256GB', 26990000, 'Samsung Galaxy Z', '530201353846AM_635_sony_xperia_z.png', 'Samsung Galaxy Zflip', 'Màn hình:  Dynamic AMOLED 2XChính 6.7\" & Phụ 1.9\"Full HD+ Hệ điều hành:  Android 11 Camera sau:  2 camera 12 MP Camera trước:  10 MP Chip:  Snapdragon 888 RAM:  8 GB Bộ nhớ trong:  256 GB SIM:  1 Nano SIM & 1 eSIMHỗ trợ 5G Pin, Sạc:  3300 mAh15 W'),
(9, 1, 3, 'Vivo Y21', 4290000, 'Vivo Y', 'y21.jpg', 'Vivo Y21', 'Màn hình:  IPS LCD6.51\"HD+ Hệ điều hành:  Android 11 Camera sau:  Chính 13 MP & Phụ 2 MP Camera trước:  8 MP Chip:  MediaTek Helio P35 RAM:  4 GB Bộ nhớ trong:  64 GB SIM:  2 Nano SIMHỗ trợ 4G Pin, Sạc:  5000 mAh18 W'),
(10, 2, 6, 'Xiaomi Redmi Note 10S', 6490000, 'Xiaomi Redmi Note', 'xiaominote10.jpg', 'Xiaomi note 10', 'Màn hình:  AMOLED6.43\"Full HD+ Hệ điều hành:  Android 11 Camera sau:  Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước:  13 MP Chip:  MediaTek Helio G95 RAM:  8 GB Bộ nhớ trong:  128 GB SIM:  2 Nano SIMHỗ trợ 4G Pin, Sạc:  5000 mAh33 W'),
(11, 2, 6, 'OPPO Reno6 Pro 5G', 18490000, 'Oppo Reno', 'oppoRN6.jpg', 'OPPO Reno6', 'Màn hình:  AMOLED6.55\"Full HD+ Hệ điều hành:  Android 11 Camera sau:  Chính 50 MP & Phụ 16 MP, 13 MP, 2 MP Camera trước:  32 MP Chip:  Snapdragon 870 5G RAM:  12 GB Bộ nhớ trong:  256 GB SIM:  2 Nano SIMHỗ trợ 5G Pin, Sạc:  4500 mAh65 W'),
(12, 2, 6, 'Realme C21Y 4GB', 3990000, 'Realme C', 'realme-c21y-den-1-org.jpg', 'Realme C21Y', 'Màn hình:  IPS LCD6.5\"HD+ Hệ điều hành:  Android 11 Camera sau:  Chính 13 MP & Phụ 2 MP, 2 MP Camera trước:  5 MP Chip:  Spreadtrum T610 8 nhân RAM:  4 GB Bộ nhớ trong:  64 GB SIM:  2 Nano SIMHỗ trợ 4G Pin, Sạc:  5000 mAh10 W'),
(13, 2, 6, 'iPhone 13 Pro 128GB', 30990000, 'Iphone 13 Pro', 'iphone-13-pro1.jpg', 'iphone 13', 'Màn hình:  OLED6.1\"Super Retina XDR Hệ điều hành:  iOS 15 Camera sau:  3 camera 12 MP Camera trước:  12 MP Chip:  Apple A15 Bionic RAM:  6 GB Bộ nhớ trong:  128 GB SIM:  1 Nano SIM & 1 eSIMHỗ trợ 5G Pin, Sạc:  3095 mAh20 W'),
(14, 2, 6, 'Iphone 13 Pro Max', 33990000, 'Iphone 13 Pro Max', 'iphone-13-pro-max-xanh-1.jpg', 'iphone 13', 'Màn hình:  OLED6.7\"Super Retina XDR Hệ điều hành:  iOS 15 Camera sau:  3 camera 12 MP Camera trước:  12 MP Chip:  Apple A15 Bionic RAM:  6 GB Bộ nhớ trong:  128 GB SIM:  1 Nano SIM & 1 eSIMHỗ trợ 5G Pin, Sạc:  4352 mAh20 W'),
(15, 2, 6, 'Samsung Galaxy S21 Ultra 5G 128GB', 21990000, 'Samsung Galaxy S21 Ultra 5G', 'samsung-galaxy-s21-ultra-bac-1-org.jpg', 'samsung galaxy s21 ultra', 'Màn hình:  Dynamic AMOLED 2X6.8\"Quad HD+ (2K+) Hệ điều hành:  Android 11 Camera sau:  Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP Camera trước:  40 MP Chip:  Exynos 2100 RAM:  12 GB Bộ nhớ trong:  128 GB SIM:  2 Nano SIM hoặc 1 Nano SIM + 1 eSIMHỗ trợ 5G Pin, Sạc:  5000 mAh25 W'),
(16, 3, 6, 'Xiaomi Mi 11 5G', 19990000, 'Xiaomi Mi 11 5G', 'xiaomi-mi-11-xanhduong-1-org.jpg', 'Xiaomi mi 11', 'Màn hình:  AMOLED6.81\"Quad HD+ (2K+) Hệ điều hành:  Android 11 Camera sau:  Chính 108 MP & Phụ 13 MP, 5 MP Camera trước:  20 MP Chip:  Snapdragon 888 RAM:  8 GB Bộ nhớ trong:  256 GB SIM:  2 Nano SIMHỗ trợ 5G Pin, Sạc:  4600 mAh55 W'),
(17, 3, 6, 'Xiaomi 11T Pro 5G', 14990000, 'Xiaomi 11T Pro 5G', 'xiaomi-11t-pro-1-1.jpg', 'Xiaomi 11T', 'Màn hình:  AMOLED6.67\"Full HD+ Hệ điều hành:  Android 11 Camera sau:  Chính 108 MP & Phụ 8 MP, 5 MP Camera trước:  16 MP Chip:  Snapdragon 888 RAM:  12 GB Bộ nhớ trong:  256 GB SIM:  2 Nano SIMHỗ trợ 5G Pin, Sạc:  5000 mAh120 W'),
(19, 3, 6, 'OPPO A74', 6690000, 'OPPO A74', 'oppo-a74-xanh-duong-1-org.jpg', 'Oppo A', 'Màn hình:  AMOLED6.43\"Full HD+ Hệ điều hành:  Android 11 Camera sau:  Chính 48 MP & Phụ 2 MP, 2 MP Camera trước:  16 MP Chip:  Snapdragon 662 RAM:  8 GB Bộ nhớ trong:  128 GB SIM:  2 Nano SIMHỗ trợ 4G Pin, Sạc:  5000 mAh33 W'),
(20, 3, 6, 'Vivo X70 Pro 5G', 18990000, 'Vivo X70 Pro 5G', 'vivo-x70-pro-xanh-1-1.jpg', 'Vivo X70', 'Màn hình:  AMOLED6.56\"Full HD+ Hệ điều hành:  Android 11 Camera sau:  Chính 50 MP & Phụ 12 MP, 12 MP, 8 MP Camera trước:  32 MP Chip:  MediaTek Dimensity 1200 RAM:  12 GB Bộ nhớ trong:  256 GB SIM:  2 Nano SIMHỗ trợ 5G Pin, Sạc:  4450 mAh44 W'),
(21, 3, 6, 'Realme 8 Pro', 8390000, 'Realme 8 Pro', 'realme-8-pro--vang-1-org.jpg', 'Realme 8', 'Màn hình:  Super AMOLED6.4\"Full HD+ Hệ điều hành:  Android 11 Camera sau:  Chính 108 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước:  16 MP Chip:  Snapdragon 720G RAM:  8 GB Bộ nhớ trong:  128 GB SIM:  2 Nano SIMHỗ trợ 4G Pin, Sạc:  4500 mAh50 W'),
(22, 4, 6, 'Realme 7 Pro', 8690000, 'Realme 7 Pro', 'realme-7-pro-bac-1-org.jpg', 'Realme 7', 'Màn hình:  Super AMOLED6.4\"Full HD+ Hệ điều hành:  Android 10 Camera sau:  Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước:  32 MP Chip:  Snapdragon 720G RAM:  8 GB Bộ nhớ trong:  128 GB SIM:  2 Nano SIMHỗ trợ 4G Pin, Sạc:  4500 mAh65 W'),
(23, 4, 6, 'Vivo Y51', 5990000, 'Vivo Y51', 'vivo-y51-2020-tim-bac-1-org.jpg', 'Vivo Y', 'Màn hình:  IPS LCD6.58\"Full HD+ Hệ điều hành:  Android 11 Camera sau:  Chính 48 MP & Phụ 8 MP, 2 MP Camera trước:  16 MP Chip:  Snapdragon 662 RAM:  8 GB Bộ nhớ trong:  128 GB SIM:  2 Nano SIMHỗ trợ 4G Pin, Sạc:  5000 mAh18 W'),
(24, 4, 6, 'Xiaomi Redmi 10', 4290000, 'Xiaomi Redmi 10', 'xiaomi-redmi-10-trang-1-org.jpg', 'Xiaomi redmi 10', 'Màn hình:  IPS LCD6.5\"Full HD+ Hệ điều hành:  Android 11 Camera sau:  Chính 50 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước:  8 MP Chip:  MediaTek Helio G88 8 nhân RAM:  4 GB Bộ nhớ trong:  128 GB SIM:  2 Nano SIMHỗ trợ 4G Pin, Sạc:  5000 mAh18 W'),
(25, 4, 6, 'Samsung Galaxy A31', 5790000, 'Samsung Galaxy A31', 'samsung-galaxy-a31-trang-1-org.jpg', 'Samsung galaxy A', 'Màn hình:  Super AMOLED6.4\"Full HD+ Hệ điều hành:  Android 10 Camera sau:  Chính 48 MP & Phụ 8 MP, 5 MP, 5 MP Camera trước:  20 MP Chip:  MediaTek MT6768 (Helio P65) RAM:  6 GB Bộ nhớ trong:  128 GB SIM:  2 Nano SIMHỗ trợ 4G Pin, Sạc:  5000 mAh15 W'),
(27, 4, 6, 'OPPO A94', 7690, 'OPPO A94', 'oppo-a94-tim-1-org.jpg', 'oppo A', 'Màn hình:  AMOLED6.43\"Full HD+ Hệ điều hành:  Android 11 Camera sau:  Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước:  32 MP Chip:  MediaTek Helio P95 RAM:  8 GB Bộ nhớ trong:  128 GB SIM:  2 Nano SIMHỗ trợ 4G Pin, Sạc:  4310 mAh30 W'),
(32, 5, 0, 'Book Shelf', 2500, 'book shelf', 'furniture-book-shelf-250x250.jpg', 'book shelf furniture', ''),
(33, 6, 2, 'Refrigerator', 35000, 'Refrigerator', 'CT_WM_BTS-BTC-AppliancesHome_20150723.jpg', 'refrigerator samsung', ''),
(34, 6, 4, 'Emergency Light', 1000, 'Emergency Light', 'emergency light.JPG', 'emergency light', ''),
(35, 6, 0, 'Vaccum Cleaner', 6000, 'Vaccum Cleaner', 'images (2).jpg', 'Vaccum Cleaner', ''),
(36, 6, 5, 'Iron', 1500, 'gj', 'iron.JPG', 'iron', ''),
(37, 6, 5, 'LED TV', 20000, 'LED TV', 'images (4).jpg', 'led tv lg', ''),
(38, 6, 4, 'Microwave Oven', 3500, 'Microwave Oven', 'images.jpg', 'Microwave Oven', ''),
(39, 6, 5, 'Mixer Grinder', 2500, 'Mixer Grinder', 'singer-mixer-grinder-mg-46-medium_4bfa018096c25dec7ba0af40662856ef.jpg', 'Mixer Grinder', ''),
(40, 2, 6, 'Formal girls dress', 3000, 'Formal girls dress', 'girl-walking.jpg', 'ladies', ''),
(45, 1, 2, 'Samsung Galaxy Note 3', 10000, '0', 'samsung_galaxy_note3_note3neo.JPG', 'samsung galaxy Note 3 neo', ''),
(46, 1, 2, 'Galaxy A52s 5G', 9690000, '', 'samsung_galaxy_note3_note3neo.JPG', 'samsung galxaxy note 3 neo', ''),
(47, 4, 6, 'Laptop', 650, 'nbk', 'product01.png', 'Dell Laptop', ''),
(48, 1, 7, 'Headphones', 250, 'Headphones', 'product05.png', 'Headphones Sony', ''),
(49, 1, 7, 'Headphones', 250, 'Headphones', 'product05.png', 'Headphones Sony', ''),
(50, 3, 6, 'boys shirts', 350, 'shirts', 'pm1.JPG', 'suit boys shirts', ''),
(51, 3, 6, 'boys shirts', 270, 'shirts', 'pm2.JPG', 'suit boys shirts', ''),
(52, 3, 6, 'boys shirts', 453, 'shirts', 'pm3.JPG', 'suit boys shirts', ''),
(53, 3, 6, 'boys shirts', 220, 'shirts', 'ms1.JPG', 'suit boys shirts', ''),
(54, 3, 6, 'boys shirts', 290, 'shirts', 'ms2.JPG', 'suit boys shirts', ''),
(55, 3, 6, 'boys shirts', 259, 'shirts', 'ms3.JPG', 'suit boys shirts', ''),
(56, 3, 6, 'boys shirts', 299, 'shirts', 'pm7.JPG', 'suit boys shirts', ''),
(57, 3, 6, 'boys shirts', 260, 'shirts', 'i3.JPG', 'suit boys shirts', ''),
(58, 3, 6, 'boys shirts', 350, 'shirts', 'pm9.JPG', 'suit boys shirts', ''),
(59, 3, 6, 'boys shirts', 855, 'shirts', 'a2.JPG', 'suit boys shirts', ''),
(60, 3, 6, 'boys shirts', 150, 'shirts', 'pm11.JPG', 'suit boys shirts', ''),
(61, 3, 6, 'boys shirts', 215, 'shirts', 'pm12.JPG', 'suit boys shirts', ''),
(62, 3, 6, 'boys shirts', 299, 'shirts', 'pm13.JPG', 'suit boys shirts', ''),
(63, 3, 6, 'boys Jeans Pant', 550, 'Pants', 'pt1.JPG', 'boys Jeans Pant', ''),
(64, 3, 6, 'boys Jeans Pant', 460, 'pants', 'pt2.JPG', 'boys Jeans Pant', ''),
(65, 3, 6, 'boys Jeans Pant', 470, 'pants', 'pt3.JPG', 'boys Jeans Pant', ''),
(66, 3, 6, 'boys Jeans Pant', 480, 'pants', 'pt4.JPG', 'boys Jeans Pant', ''),
(67, 3, 6, 'boys Jeans Pant', 360, 'pants', 'pt5.JPG', 'boys Jeans Pant', ''),
(68, 3, 6, 'boys Jeans Pant', 550, 'pants', 'pt6.JPG', 'boys Jeans Pant', ''),
(69, 3, 6, 'boys Jeans Pant', 390, 'pants', 'pt7.JPG', 'boys Jeans Pant', ''),
(70, 3, 6, 'boys Jeans Pant', 399, 'pants', 'pt8.JPG', 'boys Jeans Pant', ''),
(71, 1, 2, 'Samsung galaxy s7', 5000, 'Samsung galaxy s7', 'product07.png', 'samsung mobile electronics', ''),
(72, 7, 2, 'sony Headphones', 3500, 'sony Headphones', 'product02.png', 'sony Headphones electronics gadgets', ''),
(73, 7, 2, 'samsung Headphones', 3500, 'samsung Headphones', 'product05.png', 'samsung Headphones electronics gadgets', ''),
(74, 1, 1, 'HP i5 laptop', 5500, 'HP i5 laptop', 'product01.png', 'HP i5 laptop electronics', ''),
(75, 1, 1, 'HP i7 laptop 8gb ram', 5500, 'HP i7 laptop 8gb ram', 'product03.png', 'HP i7 laptop 8gb ram electronics', ''),
(76, 1, 5, 'sony note 6gb ram', 4500, 'sony note 6gb ram', 'product04.png', 'sony note 6gb ram mobile electronics', ''),
(77, 1, 4, 'MSV laptop 16gb ram NVIDEA Graphics', 5499, 'MSV laptop 16gb ram', 'product06.png', 'MSV laptop 16gb ram NVIDEA Graphics electronics', ''),
(78, 1, 5, 'dell laptop 8gb ram intel integerated Graphics', 4579, 'dell laptop 8gb ram intel integerated Graphics', 'product08.png', 'dell laptop 8gb ram intel integerated Graphics electronics', ''),
(79, 7, 2, 'camera with 3D pixels', 2569, 'camera with 3D pixels', 'product09.png', 'camera with 3D pixels camera electronics gadgets', ''),
(80, 1, 1, 'ytrfdkjsd', 12343, 'sdfhgh', '1542455446_thythtf .jpeg', 'dfgh', ''),
(81, 4, 6, 'Kids blue dress', 300, 'blue dress', '1543993724_pg4.jpg', 'kids blue dress', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Bẫy `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Chỉ mục cho bảng `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Chỉ mục cho bảng `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Các ràng buộc cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
