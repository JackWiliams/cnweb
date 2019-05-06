-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 10, 2018 lúc 05:39 PM
-- Phiên bản máy phục vụ: 10.1.36-MariaDB
-- Phiên bản PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_banhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `status`, `created_at`, `updated_at`) VALUES
(14, 14, '2017-03-23', 160000, 'COD', 'k', 0, '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 13, '2017-03-21', 400000, 'COD', 'Vui lòng giao hàng trước 5h', 1, '2018-11-11 08:29:46', '2018-11-11 08:29:46'),
(15, 15, '2017-03-24', 220000, 'COD', 'e', 0, '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(28, 30, '2018-12-03', 380000, 'COD', 'giao hang cho tôi', 0, '2018-12-03 14:15:47', '2018-12-03 14:15:47'),
(20, 21, '2018-11-06', 150000, 'COD', 'giao hang dung han', 0, '2018-11-06 10:34:13', '2018-11-06 10:34:13'),
(27, 29, '2018-11-28', 150000, 'COD', 'gia hàng đúnh giờ', 0, '2018-11-28 14:47:22', '2018-11-28 14:47:22'),
(19, 20, '2018-10-20', 340000, 'COD', 'Mua hàng', 0, '2018-10-20 06:02:23', '2018-10-20 06:02:23'),
(21, 22, '2018-11-11', 160000, 'COD', 'giao hàng đúng hạn', 0, '2018-11-11 06:59:00', '2018-11-11 06:59:00'),
(22, 23, '2018-11-11', 160000, 'COD', 'hihi', 0, '2018-11-11 07:05:27', '2018-11-11 07:05:27'),
(23, 24, '2018-11-11', 350000, 'COD', 'aaa', 0, '2018-11-11 07:07:19', '2018-11-11 07:07:19'),
(24, 25, '2018-11-11', 120000, 'COD', 'aaa', 0, '2018-11-11 07:08:57', '2018-11-11 07:08:57'),
(25, 27, '2018-11-11', 100000, 'COD', 'a', 0, '2018-11-11 07:31:42', '2018-11-11 07:31:42'),
(26, 28, '2018-11-24', 160000, 'COD', '+-', 0, '2018-11-24 07:07:47', '2018-11-24 07:07:47'),
(29, 31, '2018-12-04', 150000, 'COD', 'aqweq', 0, '2018-12-04 13:35:16', '2018-12-04 13:35:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(18, 15, 62, 5, 220000, '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(17, 14, 2, 1, 160000, '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(16, 13, 60, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(15, 13, 59, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(14, 12, 60, 2, 200000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(13, 12, 61, 1, 120000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(12, 11, 61, 1, 120000, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(11, 11, 57, 2, 150000, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(19, 17, 2, 1, 160000, '2018-10-19 09:27:10', '2018-10-19 09:27:10'),
(20, 17, 7, 1, 160000, '2018-10-19 09:27:10', '2018-10-19 09:27:10'),
(35, 28, 25, 1, 70000, '2018-12-03 14:15:48', '2018-12-03 14:15:48'),
(34, 28, 22, 1, 150000, '2018-12-03 14:15:47', '2018-12-03 14:15:47'),
(33, 27, 22, 1, 150000, '2018-11-28 14:47:22', '2018-11-28 14:47:22'),
(24, 19, 7, 1, 160000, '2018-10-20 06:02:23', '2018-10-20 06:02:23'),
(25, 19, 12, 1, 180000, '2018-10-20 06:02:23', '2018-10-20 06:02:23'),
(26, 20, 22, 1, 150000, '2018-11-06 10:34:13', '2018-11-06 10:34:13'),
(27, 21, 7, 1, 160000, '2018-11-11 06:59:00', '2018-11-11 06:59:00'),
(28, 22, 2, 1, 160000, '2018-11-11 07:05:27', '2018-11-11 07:05:27'),
(29, 23, 30, 1, 350000, '2018-11-11 07:07:19', '2018-11-11 07:07:19'),
(30, 24, 28, 1, 120000, '2018-11-11 07:08:57', '2018-11-11 07:08:57'),
(31, 25, 50, 1, 100000, '2018-11-11 07:31:42', '2018-11-11 07:31:42'),
(32, 26, 2, 1, 160000, '2018-11-24 07:07:47', '2018-11-24 07:07:47'),
(36, 28, 7, 1, 160000, '2018-12-03 14:15:48', '2018-12-03 14:15:48'),
(37, 29, 22, 1, 150000, '2018-12-04 13:35:16', '2018-12-04 13:35:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(15, 'ê', 'Nữ', 'huongnguyen@gmail.com', 'e', 'e', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(14, 'hhh', 'nam', 'huongnguyen@gmail.com', 'Lê thị riêng', '99999999999999999', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '23456789', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 'Khoa phạm', 'Nam', 'khoapham@gmail.com', 'Lê thị riêng', '1234567890', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '234567890-', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(16, 'Nguyễn Tất Lai', 'nam', '20162273@student.hust.edu.vn', 'Số 6B,Ngõ Tân Lạc,phố Đại La,phường Trương Định,quận Hai  Bà Trưng,Hà Nội', '1697687558', 'aaa', '2018-10-19 09:20:37', '2018-10-19 09:20:37'),
(17, 'Nguyễn Tất Lai', 'nam', '20162273@student.hust.edu.vn', 'Số 6B,Ngõ Tân Lạc,phố Đại La,phường Trương Định,quận Hai  Bà Trưng,Hà Nội', '1697687558', 'prj1', '2018-10-19 09:25:44', '2018-10-19 09:25:44'),
(18, 'Nguyễn Tất Lai', 'nam', '20162273@student.hust.edu.vn', 'Số 6B,Ngõ Tân Lạc,phố Đại La,phường Trương Định,quận Hai  Bà Trưng,Hà Nội', '1697687558', 'prj1', '2018-10-19 09:27:10', '2018-10-19 09:27:10'),
(19, 'Nguyễn Thu Hằng', 'nữ', 'greenhouse.thanhlam@gmail.com', 'Hà Nội', '0989021725', 'Mua hàng', '2018-10-20 05:57:32', '2018-10-20 05:57:32'),
(20, 'Nguyễn Minh Phương', 'nữ', 'anhlai1106@gmail.com', 'Hà Nội', '01658759665', 'Mua hàng', '2018-10-20 06:02:23', '2018-10-20 06:02:23'),
(21, 'Nguyễn Tất Lai', 'nam', 'anhlai1106@gmail.com', 'Ngõ Tân Lạc,phố Đại La,phường Trương Định,quận Hai  Bà Trưng,Hà Nội', '0989021725', 'giao hang dung han', '2018-11-06 10:34:13', '2018-11-06 10:34:13'),
(22, 'Ngọc Anh', 'nữ', 'anh6@gmail.com', 'Hà Nam', '0989021412', 'giao hàng đúng hạn', '2018-11-11 06:58:59', '2018-11-11 06:58:59'),
(23, 'Minh', 'nam', 'i1106@gmail.com', 'Thái Bình', '01236521445', 'hihi', '2018-11-11 07:05:27', '2018-11-11 07:05:27'),
(24, 'Nguyễn Tất Lai', 'nam', '06@gmail.com', 'Hà Nội', '0989021725', 'aaa', '2018-11-11 07:07:19', '2018-11-11 07:07:19'),
(25, 'Nguyễn Tất Lai', 'nam', 'anhlai1106@gmail.com', 'Ngõ Tân Lạc,phố Đại La,phường Trương Định,quận Hai  Bà Trưng,Hà Nội', '0989021725', 'aaa', '2018-11-11 07:08:57', '2018-11-11 07:08:57'),
(26, 'Nguyễn Tất Lai', 'nam', 'anhlai1106@gmail.com', 'Ngõ Tân Lạc,phố Đại La,phường Trương Định,quận Hai  Bà Trưng,Hà Nội', '0989021725', 'aaa', '2018-11-11 07:09:09', '2018-11-11 07:09:09'),
(27, 'Nguyễn Tất Lai', 'nam', 'anhlai1106@gmail.com', 'Ngõ Tân Lạc,phố Đại La,phường Trương Định,quận Hai  Bà Trưng,Hà Nội', '0989021725', 'a', '2018-11-11 07:31:42', '2018-11-11 07:31:42'),
(28, 'Nguyễn Tất Lai', 'nam', 'anhlai1106@gmail.com', 'Ngõ Tân Lạc,phố Đại La,phường Trương Định,quận Hai  Bà Trưng,Hà Nội', '0989021725', '+-', '2018-11-24 07:07:46', '2018-11-24 07:07:46'),
(29, 'Triệu Hồng Thúy', 'nữ', 'hongthuy@gmail.com', 'Hà Nội', '01652142556', 'gia hàng đúnh giờ', '2018-11-28 14:47:22', '2018-11-28 14:47:22'),
(30, 'Nguyễn Thị Linh', 'nữ', 'linh@gmail.com', 'Hà Nam', '0985632112', 'giao hang cho tôi', '2018-12-03 14:15:47', '2018-12-03 14:15:47'),
(31, 'Nguyễn Tất Lai', 'nam', 'anhlai1106@gmail.com', 'Ngõ Tân Lạc,phố Đại La,phường Trương Định,quận Hai  Bà Trưng,Hà Nội', '0989021725', 'aqweq', '2018-12-04 13:35:15', '2018-12-04 13:35:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(1, 'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam \"Bánh trung thu Bơ Sữa HongKong\".', 'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', 'sample1.jpg', '2017-03-11 06:20:23', '0000-00-00 00:00:00'),
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(2, 'Bánh Crepe Chocolate', 6, '', 180000, 160000, 'crepe-chocolate.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(3, 'Bánh Crepe Sầu riêng - Chuối', 5, '', 150000, 120000, 'crepe-chuoi.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(4, 'Bánh Crepe Đào', 5, '', 160000, 0, 'crepe-dao.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(5, 'Bánh Crepe Dâu', 5, '', 160000, 0, 'crepedau.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(6, 'Bánh Crepe Pháp', 5, '', 200000, 180000, 'crepe-phap.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(7, 'Bánh Crepe Táo', 5, '', 160000, 0, 'crepe-tao.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(8, 'Bánh Crepe Trà xanh', 5, '', 160000, 150000, 'crepe-traxanh.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(9, 'Bánh Crepe Sầu riêng và Dứa', 5, '', 160000, 150000, 'saurieng-dua.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(22, 'Bánh bông lan trứng muối I', 1, '', 160000, 150000, 'banhbonglantrung.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(23, 'Bánh bông lan trứng muối II', 1, '', 180000, 0, 'banhbonglantrungmuoi.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(24, 'Bánh French', 1, '', 180000, 0, 'banh-man-thu-vi-nhat-1.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(25, 'Bánh mì Australia', 1, '', 80000, 70000, 'dung-khoai-tay-lam-banh-gato-man-cuc-ngon.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(26, 'Bánh mặn thập cẩm', 1, '', 50000, 0, 'Fruit-Cake.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(27, 'Bánh Muffins trứng', 1, '', 100000, 80000, 'maxresdefault.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(28, 'Bánh Scone Peach Cake', 1, '', 120000, 0, 'Peach-Cake_3300.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(29, 'Bánh mì Loaf I', 1, '', 100000, 0, 'sli12.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(30, 'Bánh kem Chocolate Dâu I', 4, '', 380000, 350000, 'sli12.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(31, 'Bánh kem Trái cây I', 4, '', 380000, 350000, 'Fruit-Cake.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(32, 'Bánh kem Trái cây II', 4, '', 380000, 350000, 'Fruit-Cake_7971.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(33, 'Bánh kem Doraemon', 4, '', 280000, 250000, 'p1392962167_banh74.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(34, 'Bánh kem Caramen Pudding', 4, '', 280000, 0, 'Caramen-pudding636099031482099583.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(35, 'Bánh kem Chocolate Fruit', 4, '', 320000, 300000, 'chocolate-fruit636098975917921990.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(36, 'Bánh kem Coffee Chocolate GH6', 4, '', 320000, 300000, 'COFFE-CHOCOLATE636098977566220885.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(37, 'Bánh kem Mango Mouse', 4, '', 320000, 300000, 'mango-mousse-cake.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(38, 'Bánh kem Matcha Mouse', 4, '', 350000, 330000, 'MATCHA-MOUSSE.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(39, 'Bánh kem Flower Fruit', 4, '', 350000, 330000, 'flower-fruits636102461981788938.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(40, 'Bánh kem Strawberry Delight', 4, '', 350000, 330000, 'strawberry-delight636102445035635173.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(41, 'Bánh kem Raspberry Delight', 4, '', 350000, 330000, 'raspberry.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(42, 'Beefy Pizza', 6, 'Thịt bò xay, ngô, sốt BBQ, phô mai mozzarella', 150000, 130000, '40819_food_pizza.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(43, 'Hawaii Pizza', 6, 'Sốt cà chua, ham , dứa, pho mai mozzarella', 120000, 0, 'hawaiian paradise_large-900x900.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(44, 'Smoke Chicken Pizza', 6, 'Gà hun khói,nấm, sốt cà chua, pho mai mozzarella.', 120000, 0, 'chicken black pepper_large-900x900.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(45, 'Sausage Pizza', 6, 'Xúc xích klobasa, Nấm, Ngô, sốtcà chua, pho mai Mozzarella.', 120000, 0, 'pizza-miami.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(46, 'Ocean Pizza', 6, 'Tôm , mực, xào cay,ớt xanh, hành tây, cà chua, phomai mozzarella.', 120000, 0, 'seafood curry_large-900x900.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(47, 'All Meaty Pizza', 6, 'Ham, bacon, chorizo, pho mai mozzarella.', 140000, 0, 'all1).jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(48, 'Tuna Pizza', 6, 'Cá Ngừ, sốt Mayonnaise,sốt càchua, hành tây, pho mai Mozzarella', 140000, 0, '54eaf93713081_-_07-germany-tuna.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(49, 'Bánh su kem nhân dừa', 7, '', 120000, 100000, 'maxresdefault.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(50, 'Bánh su kem sữa tươi', 7, '', 120000, 100000, 'sukem.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(51, 'Bánh su kem sữa tươi chiên giòn', 7, '', 150000, 0, '1434429117-banh-su-kem-chien-20.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(52, 'Bánh su kem dâu sữa tươi', 7, '', 150000, 0, 'sukemdau.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(53, 'Bánh su kem bơ sữa tươi', 7, '', 150000, 0, 'He-Thong-Banh-Su-Singapore-Chewy-Junior.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(54, 'Bánh su kem nhân trái cây sữa tươi', 7, '', 150000, 0, 'foody-banh-su-que-635930347896369908.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(55, 'Bánh su kem cà phê', 7, '', 150000, 0, 'banh-su-kem-ca-phe-1.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(56, 'Bánh su kem phô mai', 7, '', 150000, 0, '50020041-combo-20-banh-su-que-pho-mai-9.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(57, 'Bánh su kem sữa tươi chocolate', 7, '', 150000, 0, 'combo-20-banh-su-que-kem-sua-tuoi-phu-socola.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(61, 'Bánh Cupcake - Anh Quốc', 6, 'Những chiếc cupcake có cấu tạo gồm phần vỏ bánh xốp mịn và phần kem trang trí bên trên rất bắt mắt với nhiều hình dạng và màu sắc khác nhau. Cupcake còn được cho là chiếc bánh mang lại niềm vui và tiếng cười như chính hình dáng đáng yêu của chúng.', 150000, 120000, 'cupcake.jpg', 'cái', 1, NULL, NULL),
(62, 'Bánh Sachertorte', 6, 'Sachertorte là một loại bánh xốp được tạo ra bởi loại&nbsp;chocholate&nbsp;tuyệt hảo nhất của nước Áo. Sachertorte có vị ngọt nhẹ, gồm nhiều lớp bánh được làm từ ruột bánh mì và bánh sữa chocholate, xen lẫn giữa các lớp bánh là mứt mơ. Món bánh chocholate này nổi tiếng tới mức thành phố Vienna của Áo đã ấn định&nbsp;tổ chức một ngày Sachertorte quốc gia, vào 5/12 hằng năm', 250000, 220000, '111.jpg', 'cái', 0, NULL, NULL),
(63, 'Bánh ngọt nhân cream táo', 8, '<p>Hương vị táo khó quên</p>', 180000, 0, 'Ung49Qc_20131108144733.jpg', 'hop', 0, '2018-10-28 04:10:51', '2018-11-04 04:22:37'),
(64, 'Bánh Chocolate Trái cây', 8, '<p>Sự kết hợp hòa quyện giữa sô cô la và hương trái cây sẽ mang lại hương vị khó quên</p>', 150000, 0, 'iyYmNwe_Fruit-Cake_7976.jpg', 'hop', 1, '2018-10-28 04:13:21', '2018-11-04 04:21:59'),
(65, 'Bánh Chocolate Trái cây II', 8, '<p>Hương vị hòa quyện của sô lô ca và trái cây</p>', 150000, 0, 'ntjlHKz_Fruit-Cake_7981.jpg', 'hop', 0, '2018-10-28 04:16:01', '2018-11-04 04:23:54'),
(66, 'Peach Cake', 8, '<p>Hương vị đậm đà thanh thanh</p>', 160000, 150000, '94802KW_Peach-Cake_3294.jpg', 'cai', 0, '2018-10-28 04:17:22', '2018-11-04 04:20:44'),
(67, 'Bánh Macaron Pháp', 8, '<p>Hương vị bánh Pháp</p>', 200000, 180000, 'HOLBYX5_Macaron9.jpg', 'cai', 1, '2018-10-28 04:18:32', '2018-11-04 04:24:58'),
(68, 'Bánh Tiramisu - Italia', 8, '<p>Chỉ cần cắn một miếng, bạn sẽ cảm nhận được tất cả các hương vị đó hòa quyện cùng một chính vì thế người ta còn ví món bánh này là Thiên đường trong miệng của bạn</p>', 200000, 0, 'OXHtwYy_234.jpg', 'hop', 0, '2018-10-28 04:19:22', '2018-11-04 04:26:00'),
(69, 'Bánh Táo - Mỹ', 8, '<p>Bánh táo Mỹ với phần vỏ bánh mỏng, giòn mềm, ẩn chứa phần nhân táo thơm ngọt, điểm chút vị chua dịu của trái cây quả sẽ là một lựa chọn hoàn hảo cho những tín đồ bánh ngọt trên toàn thế giới.</p>', 200000, 0, 'NyOjJ0z_1234.jpg', 'cai', 0, '2018-10-28 04:20:09', '2018-11-04 04:26:59'),
(70, 'Bánh Gato Trái cây Việt Quất', 9, '<p>Hương vị trái cây đậm đà khó quên,mang lại cảm giác thanh mát</p>', 250000, 0, 'r8gZpmR_544bc48782741.png', 'hop', 1, '2018-10-28 04:21:09', '2018-11-03 16:38:59'),
(71, 'Bánh sinh nhật rau câu trái cây', 9, '<p>Hương vị trái cây thanh mát</p>', 200000, 180000, 'fqBxoQY_210215-banh-sinh-nhat-rau-cau-body- (6).jpg', 'cai', 0, '2018-10-28 12:10:41', '2018-11-04 04:16:12'),
(72, 'Bánh kem Chocolate Dâu', 9, '<p>Hương vị dâu kêt hợp hài hòa với Chocolate</p>', 300000, 280000, 'YkBk5RE_banh kem sinh nhat.jpg', 'hop', 1, '2018-10-28 12:12:21', '2018-11-04 04:15:30'),
(73, 'Bánh kem Dâu III', 9, '<p>Kem Dâu ngon lành!!</p>', 300000, 280000, '0q9ihLF_Banh-kem (6).jpg', 'cai', 0, '2018-10-28 12:14:02', '2018-11-04 04:14:31'),
(74, 'Bánh kem Dâu I', 9, '<p>Hương vị dâu thanh mát</p>', 350000, 320000, 'SvQQOjm_banhkem-dau.jpg', 'hop', 1, '2018-10-28 12:15:16', '2018-11-04 04:13:38'),
(75, 'Bánh trái cây II', 9, '<p>Bánh trái cây dinh dưỡng</p>', 150000, 120000, '1wbcUes_banhtraicay.jpg', 'hop', 0, '2018-10-28 12:16:50', '2018-11-04 04:12:31'),
(76, 'Apple Cake', 9, '<p>Bánh Kem Táo Ngọt Lành</p>', 250000, 240000, 'i1tVSXH_Fruit-Cake_7979.jpg', 'hop', 1, '2018-10-28 12:18:08', '2018-11-04 04:11:29'),
(77, 'Bánh Crepe Sầu Riêng', 9, '<p>Hương vị sầu riêng đậm đà</p>', 200000, 180000, 'xK4Yvqf_1430967449-pancake-sau-rieng-6.jpg', 'hop', 1, '2018-11-03 16:30:38', '2018-11-03 16:40:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Bánh mặn', 'Nếu từng bị mê hoặc bởi các loại tarlet ngọt thì chắn chắn bạn không thể bỏ qua những loại tarlet mặn. Ngoài hình dáng bắt mắt, lớp vở bánh giòn giòn cùng với nhân mặn như thịt gà, nấm, thị heo ,… của bánh sẽ chinh phục bất cứ ai dùng thử.', 'banh-man-thu-vi-nhat-1.jpg', NULL, NULL),
(4, 'Bánh kem', 'Với người Việt Nam thì bánh ngọt nói chung đều hay được quy về bánh bông lan – một loại tráng miệng bông xốp, ăn không hoặc được phủ kem lên thành bánh kem. Tuy nhiên, cốt bánh kem thực ra có rất nhiều loại với hương vị, kết cấu và phương thức làm khác nhau chứ không chỉ đơn giản là “bánh bông lan” chung chung đâu nhé!', 'banhkem.jpg', '2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, 'Bánh crepe', '<p>Crepe là một món bánh nổi tiếng của Pháp, nhưng từ khi du nhập vào Việt Nam món bánh đẹp mắt, ngon miệng này đã làm cho biết bao bạn trẻ phải “xiêu lòng”</p>', '8MSTZRI_crepe-chocolate.jpg', '2016-10-28 04:00:00', '2018-12-10 13:32:35'),
(6, 'Bánh Pizza', 'Pizza đã không chỉ còn là một món ăn được ưa chuộng khắp thế giới mà còn được những nhà cầm quyền EU chứng nhận là một phần di sản văn hóa ẩm thực châu Âu. Và để được chứng nhận là một nhà sản xuất pizza không hề đơn giản. Người ta phải qua đủ mọi các bước xét duyệt của chính phủ Ý và liên minh châu Âu nữa… tất cả là để đảm bảo danh tiếng cho món ăn này.', 'pizza.jpg', '2016-10-25 17:19:00', NULL),
(7, 'Bánh su kem', 'Bánh su kem là món bánh ngọt ở dạng kem được làm từ các nguyên liệu như bột mì, trứng, sữa, bơ.... đánh đều tạo thành một hỗn hợp và sau đó bằng thao tác ép và phun qua một cái túi để định hình thành những bánh nhỏ và cuối cùng được nướng chín. Bánh su kem có thể thêm thành phần Sô cô la để tăng vị hấp dẫn. Bánh có xuất xứ từ nước Pháp.', 'sukemdau.jpg', '2016-10-25 17:19:00', NULL),
(8, 'Bánh ngọt', '<p>Bánh ngọt là một loại thức ăn thường dưới hình thức món bánh dạng bánh mì từ bột nhào, được nướng lên dùng để tráng miệng. Bánh ngọt có nhiều loại, có thể phân loại dựa theo nguyên liệu và kỹ thuật chế biến như bánh ngọt làm từ lúa mì, bơ, bánh ngọt dạng bọt biển. Bánh ngọt có thể phục vụ những mục đính đặc biệt như bánh cưới, bánh sinh nhật, bánh Giáng sinh, bánh Halloween..</p>', 'fh7NlJy_20131108144733.jpg', '2018-10-28 03:43:55', '2018-12-10 13:30:23'),
(9, 'bánh trái cây', '<p>Bánh trái cây, hay còn gọi là bánh hoa quả, là một món ăn chơi, không riêng gì của Huế nhưng khi \"lạc\" vào mảnh đất Cố đô, món bánh này dường như cũng mang chút tinh tế, cầu kỳ và đặc biệt. Lấy cảm hứng từ những loại trái cây trong vườn, qua bàn tay khéo léo của người phụ nữ Huế, món bánh trái cây ra đời - ngọt thơm, dịu nhẹ làm đẹp lòng biết bao người thưởng thức.</p>', 'SNqXc51_banhtraicay.jpg', '2018-10-28 03:46:57', '2018-12-10 13:30:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `level`, `created_at`, `updated_at`) VALUES
(6, 'Hương Hương', 'huonghuong08.php@gmail.com', '$2y$10$3mh4KHBXfECTFfOuUu.mJets0YebJQo90Wq63JBg6RAtbQpdYeJce', '23456789', 'Hoàng Diệu 2', NULL, 0, '2017-03-23 07:17:33', '2018-11-01 14:01:59'),
(7, 'Nguyễn Tất Lai', 'anhlai@gmail.com', '$2y$10$mb.vbBTxXKZ0hgAIz.6bSOvql5E0d345vCxA6fADgrLPJIGQlyfzS', '01697687558', 'Hà Nội', NULL, 0, '2018-10-20 07:28:09', '2018-10-20 07:28:09'),
(8, 'Nguyễn Văn Điền', 'nguyenvandien@gmail.com', '$2y$10$dGYwp9K0xoE.uiSmC8VzEeJEoMhu6TTeJgs1S7bW8kqSi5s4usw/u', '0985632225', 'Bắc Ninh', NULL, 0, '2018-11-01 14:21:39', '2018-11-01 14:21:39'),
(9, 'Nguyễn Tất Lai', '123@gmail.com', '$2y$10$.SZWpBRoGQJk946lbLmTNO73BWNsEoABrSzSfzvdA5aIQ7BaQBJZq', '0169 768 7558', 'Số 6B,Ngõ Tân Lạc,phố Đại La,phường Trương Định,quận Hai  Bà Trưng,Hà Nội', NULL, 0, '2018-11-03 15:17:58', '2018-11-03 15:17:58'),
(10, 'Nguyễn Tất Lai', '1@gmail.com', '$2y$10$Ie4toGbXs3U2z5i4W/CBTOsmQquwV54miyLFFE01w6P331EZMqE92', '0169 768 7558', 'Số 6B,Ngõ Tân Lạc,phố Đại La,phường Trương Định,quận Hai  Bà Trưng,Hà Nội', NULL, 0, '2018-11-03 15:21:52', '2018-11-03 15:21:52'),
(11, 'Nguyễn Tất Lai', 'anhlai1106@gmail.com', '$2y$10$volTxYQ0YB8tdzM0YkExJujZWntFjJrYC.uVNPc3W1VS2wMe7E9Cu', '0989021725', 'Ngõ Tân Lạc,phố Đại La,phường Trương Định,quận Hai  Bà Trưng,Hà Nội', 'veIM1AbHeU9OLOEhmAxrJnOZiVhLb57jNvifGINIzUX0TVunVLdmWTLquRhF', 1, '2018-11-04 06:33:59', '2018-11-05 14:06:22'),
(13, 'Nguyễn Vân Anh', 'anhnguyen@gmail.com', '$2y$10$OZHdNy4ur10C7Lht/q/6duTy75DKkgE5cUs2IKngOsKk1SzFu8M1G', '0985221442', 'Hà Nội', '$2y$10$16U/tZGSFJRhx9T9febwCufi6LJRd9bsd7osVpf3t/.hz5SlD/0Jq', 0, '2018-11-05 15:05:04', '2018-11-05 15:05:04'),
(14, 'Nguyễn Văn Tuân', 'diennguyen@gmail.com', '$2y$10$8IMqKbEkhtC.tKoi.BJXEu1PMx2XML8n8i6bzVUrhEtJNBqMQ0QOm', '01684252365', 'Hà Nội', '$2y$10$LykT53AXx/NDnlIW6msdEeohNUplSP3mBirjXWoB8TRnOD0F3ekC6', 0, '2018-11-05 15:38:20', '2018-11-05 15:38:20'),
(15, 'Nguyễn Văn Tiến', '1a12@gmail.com', '$2y$10$r55ugYCtPZVHuc0O62GpXOP4Tj7iqedX8m8xgXWkW7hDZOD1NL2G6', '0152635445', 'Hà Nội', NULL, 0, '2018-12-03 14:10:26', '2018-12-03 14:10:26');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
