-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 17, 2021 lúc 03:21 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `test_pros_company`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 2 COMMENT '1: admin, 2: user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `gender`, `created_at`, `updated_at`, `birthday`, `address`) VALUES
(1, 'admin', 'admin@gmail.com', '', 2, NULL, NULL, NULL, NULL),
(8, 'Ty Khắc Chính', 'vo86@ty.ac.vn', '(84)(77)076-9723', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '04, Thôn 8, Xã Nhậm Hồng Trân, Quận Sử Thu\nĐồng Nai'),
(9, 'Nông Gia Duyên', 'duong22@danh.org.vn', '(095) 649 0800', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '90 Phố Khương Tài Thuần, Xã Viên Diễm Tuyền, Huyện Cảnh Trưởng\nAn Giang'),
(10, 'Bà. Ngụy An', 'dinh29@truong.edu.vn', '+84-39-158-3927', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '94, Ấp Giang Trung, Phường 18, Quận Lý Mạnh\nĐồng Nai'),
(11, 'Hồng Triệu Đào', 'h98@yahoo.com', '(84)(211)194-7535', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '9021 Phố Thịnh, Thôn Dao Vĩ, Quận 85\nHải Phòng'),
(12, 'Hồ Khoát', 'qnhiem@phan.ac.vn', '(0281) 576 6239', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '7319 Phố Cầm Nhiên Thuần, Ấp Trác Vịnh, Huyện Cảnh Ân\nĐiện Biên'),
(13, 'Tiếp Dũng Chiến', 'chau.khuong@yahoo.com', '(039)453-3861', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '009 Phố Nữ, Phường 5, Huyện Ung\nĐà Nẵng'),
(14, 'Bành Vân Nhung', 'aluong@phi.health.vn', '(0240)203-6903', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '3, Ấp Dương Minh, Phường Kiên, Quận Bạch\nNinh Bình'),
(15, 'Ông. Thiều Cảnh Phi', 'ubi@mn.ac.vn', '+84-99-903-2936', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '206, Ấp 62, Phường 82, Quận Ngạn Lương\nBình Dương'),
(16, 'Bác. Nông Nhượng', 'hong.hong@ho.com', '036 408 6755', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '49 Phố Bảo Ánh Thọ, Phường Viên, Huyện Việt Hàng\nHải Phòng'),
(17, 'Uông Thắm', 'hoan.banh@gmail.com', '(061) 309 7701', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '8126 Phố Vừ Huấn Tuệ, Ấp Thân Bình, Quận Mâu Dao Yến\nĐắk Lắk'),
(18, 'Chị. Nghiêm Đan Khanh', 'vi.mau@gmail.com', '84-125-370-1714', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '1 Phố Đan, Phường 3, Quận Nghiệp\nCần Thơ'),
(19, 'Em. Bùi Khang', 'ybu@yahoo.com', '+84-97-849-0873', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '03, Thôn Vi Phúc, Xã Cúc, Quận Bảo San\nHà Nam'),
(20, 'Cụ. Tống Hiếu Lạc', 'abach@mai.com', '(0164)454-7514', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '6 Phố Trương Du Lý, Ấp Viên Ngân, Huyện Khê Hợp\nĐắk Nông'),
(21, 'Trịnh Hoàn Võ', 'pham.han@ba.org', '095 597 0953', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '34, Ấp Lương Quyên, Phường Trang Châu Lâm, Quận Phi Đoan\nCao Bằng'),
(22, 'Em. Giang Ngọc Vân', 'dinh.ca@du.ac.vn', '(0128)747-7851', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '3 Phố Cơ, Ấp Hoàn Hường, Quận Chinh Hồ\nĐà Nẵng'),
(23, 'Bác. Ma Cảnh Kính', 'hao64@ma.org.vn', '(0126) 838 3475', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '835, Ấp Trang Châu, Ấp Giang Trác, Quận 3\nNinh Bình'),
(24, 'Phó Bích Khai', 'hoai.dam@yahoo.com', '+84-62-078-9006', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '53 Phố Viên Nữ Anh, Xã 9, Huyện Lê Hoài\nHà Nội'),
(25, 'Cụ. Lữ Bảo', 'rung@trieu.vn', '(095) 770 3691', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '3450, Ấp Lệ Uyên, Xã Bình Văn, Huyện Yến Như\nBắc Giang'),
(26, 'Em. An Sương Xuyến', 'son07@xa.com', '+84-59-915-7324', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '447 Phố Bảo, Thôn Cát Bình, Quận Vừ\nTiền Giang'),
(27, 'Cam Huy Công', 'hdai@dau.net.vn', '(025)191-3726', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '66, Thôn Hòa Thoại, Phường Hoa Châu Sử, Quận Kiều\nHải Dương'),
(28, 'Mạch Chi Mỹ', 'khuyen.chung@thoi.vn', '0231-016-4089', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '9, Ấp Đỗ Mỹ, Phường 88, Quận Miên\nTây Ninh'),
(29, 'Cô. Tiếp Thắm', 'kien98@hotmail.com', '(84)(37)777-1031', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '50 Phố Hạ, Phường 70, Huyện Trầm\nCần Thơ'),
(30, 'Bạch Trinh', 'nhung49@thach.com', '0321 551 6835', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '6 Phố Mã, Xã La Sinh Phi, Quận Cầm Trâm\nHà Nội'),
(31, 'Bác. Mộc Mạnh', 'ediep@giap.ac.vn', '(0164)433-4163', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '469, Thôn 43, Xã 4, Huyện 58\nLai Châu'),
(32, 'Kim Hiếu Lễ', 'luan.doan@hotmail.com', '(0186)809-7854', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '671, Ấp Mai, Ấp Trà Thắng, Huyện Nghi Đoàn\nBình Phước'),
(33, 'Bà. Bửu Liễu', 'tram31@d.com', '84-165-199-9596', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '2 Phố Hàng Hằng Canh, Phường Cam, Quận Nhu Triệu\nHà Nam'),
(34, 'Bác. Ninh Long Nghĩa', 'vng.du@han.com', '0350-717-0857', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '649 Phố Tòng Ánh Quỳnh, Thôn An Linh, Quận 61\nHồ Chí Minh'),
(35, 'Tào Hiệp', 'lo68@cao.vn', '(093) 747 4956', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '63, Ấp Trương Tường Dung, Thôn Miên Trà, Huyện 04\nBắc Ninh'),
(36, 'Chú. An Đắc Khanh', 'thy.moc@gmail.com', '0500 109 8958', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '9 Phố Ngọc, Xã Liên Tăng, Huyện Mẫn\nĐà Nẵng'),
(37, 'Bác. Thào Đăng Quân', 'hun.l@ca.name.vn', '(0510) 901 2335', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '438 Phố Giao Giang Vân, Phường 44, Quận Cơ Uyên\nHải Phòng'),
(38, 'Mạch Mạnh', 'xuong@yahoo.com', '(022)949-3714', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '277, Ấp Trịnh Bạch Bình, Xã Lâm Mâu, Quận Diệp Nhượng\nTuyên Quang'),
(39, 'Bác. Tống Nghi Thúy', 'dao57@phi.info.vn', '0710-298-4760', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '0764, Ấp Chử Lĩnh Hiền, Xã Bạc, Huyện Ngọc Mẫn\nThừa Thiên Huế'),
(40, 'Hy Hạc Châu', 'lu.hin@yahoo.com', '073 553 6891', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '21 Phố Hán Thực Cương, Ấp Yên Toại, Huyện Xa\nCần Thơ'),
(41, 'Cụ. Khu Ngôn', 'anh.thao@hang.org', '0651-346-6414', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '552, Thôn Kiều, Xã Bế, Quận 27\nBà Rịa - Vũng Tàu'),
(42, 'Cô. Ông Tuệ', 'di96@bi.int.vn', '84-321-280-4089', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '935, Thôn 3, Ấp Vi Đường, Huyện Nương\nBình Định'),
(43, 'Cầm Tịnh Hoa', 'vien.que@gmail.com', '0650-011-6576', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '935 Phố Trương Lý Uyên, Xã 5, Huyện Uyển Tăng\nHải Phòng'),
(44, 'Chung Nhu', 'an68@hotmail.com', '84-90-185-9859', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '950 Phố Bì Mi Tiến, Phường 3, Huyện 4\nCần Thơ'),
(45, 'Bác. Điền Kiệt Tráng', 'kha.bao@hotmail.com', '(0780)098-0901', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '26, Ấp 04, Xã Chưởng, Huyện Bửu Trung\nĐiện Biên'),
(46, 'Bác. Hùng Ngọc', 'don.t@c.name.vn', '84-53-060-0889', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '0 Phố Thi Đan Hoán, Xã Hùng An, Huyện Cơ\nHà Nội'),
(47, 'Lã Sương Tuyến', 'uong.dao@gmail.com', '84-56-547-8339', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '127 Phố Dương Thảo Đình, Phường 61, Quận Ấu Huệ\nHải Phòng'),
(48, 'Cụ. An Hội', 'tien.vu@moc.biz', '0127 828 4228', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '02 Phố Bành Nghiêm Chi, Phường Liên, Huyện Đặng\nHải Phòng'),
(49, 'Thái Đoan Quỳnh', 'phap31@hotmail.com', '(097) 574 5391', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '2 Phố Sử Khải Việt, Phường 74, Quận Nguyên Bình\nHậu Giang'),
(50, 'Chị. Hàn Hân', 'le.nhu@hoang.com', '0121 688 8127', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '35 Phố Bá Diệu Sơn, Xã Hiệp, Huyện Thắm Lâm\nĐồng Tháp'),
(51, 'Chử Trang', 'vu.ta@hotmail.com', '(84)(68)288-3050', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '380 Phố Hải, Phường Giáp Di Hoán, Huyện Sáng\nĐồng Tháp'),
(52, 'Chị. Đặng Việt', 'snguyn@kha.edu.vn', '030 266 0967', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '484, Thôn Bì, Xã My Lương, Quận 7\nĐồng Tháp'),
(53, 'Tăng Cầm', 'hoan.mn@dai.health.vn', '(84)(350)253-7507', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '8586 Phố Ân Vĩnh Độ, Phường 7, Quận Thoại Thôi\nCần Thơ'),
(54, 'Cụ. Lê Tài Trân', 'thc19@ong.org.vn', '+84-163-607-3680', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '05 Phố Di, Thôn Phước Yên, Quận Chung\nNinh Bình'),
(55, 'Anh. Lạc Công Hiệp', 'cuc.khuong@gmail.com', '(84)(500)245-5268', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', '1996-05-12', '886 Phố Ninh Kiếm Hạnh, Xã Nhiên Trang, Huyện Khiêm CẩnĐà Nẵng'),
(56, 'Cụ. Mã Tịnh Hân', 'cphi@gmail.com', '+84-77-851-7452', 1, '2021-11-17 13:31:26', '2021-11-17 13:31:26', NULL, '9 Phố Lộc, Phường 20, Huyện Liễu Cúc\nHải Phòng'),
(57, 'Chiêm Bình1', 'khoa.dung@hotmail.com', '0124-954-93111', 2, '2021-11-17 13:31:26', '2021-11-17 13:31:26', '2011-01-01', '156 Phố Đỗ Dân Hoán, Xã Dao, Quận Ngụy PhươngHồ Chí Minh');

--
-- Chỉ mục cho các bảng đã đổ
--

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
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
