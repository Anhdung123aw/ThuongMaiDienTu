-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 22, 2026 lúc 08:07 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ie104_group2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_login_name` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_full_name` varchar(100) NOT NULL,
  `admin_avt_img` varchar(100) DEFAULT NULL,
  `admin_birth` date NOT NULL,
  `admin_sex` tinyint(1) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_phone` varchar(10) NOT NULL,
  `admin_address` text DEFAULT NULL,
  `admin_role` varchar(100) DEFAULT 'Owner',
  `admin_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_login_name`, `admin_password`, `admin_name`, `admin_full_name`, `admin_avt_img`, `admin_birth`, `admin_sex`, `admin_email`, `admin_phone`, `admin_address`, `admin_role`, `admin_active`) VALUES
(1, 'minh1234', '$2a$08$gacaZP8P7lcQeHoiW9fgkOr47/Y0vHv3HOixU1rELCc6rkv0oDw9K', 'Minh', 'Lê Văn Minh', 'admin_1.jpg', '2003-04-02', 1, 'admin@gmail.com', '0987296708', 'Hà Đông, Hà Nội', 'Owner', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `customer_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `cart_quantity` int(11) NOT NULL,
  `cart_added_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`customer_id`, `product_variant_id`, `cart_quantity`, `cart_added_date`) VALUES
(1, 52, 1, '2023-12-18 18:14:08'),
(1, 58, 1, '2023-12-18 18:25:08'),
(1, 62, 1, '2023-12-18 18:14:02'),
(1, 72, 1, '2023-12-18 18:25:16'),
(3, 3, 3, '2023-11-01 04:40:58'),
(4, 32, 3, '2023-11-26 19:45:13'),
(5, 22, 2, '2023-11-26 19:45:13'),
(6, 4, 2, '2023-11-26 19:45:13'),
(6, 19, 2, '2023-11-26 19:45:13'),
(7, 7, 1, '2023-11-26 19:45:13'),
(8, 3, 10, '2023-11-26 19:45:13'),
(8, 24, 3, '2023-11-26 19:45:13'),
(10, 11, 5, '2023-11-26 19:45:13'),
(10, 28, 1, '2023-11-26 19:45:13'),
(13, 34, 1, '2023-12-15 14:16:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_img` varchar(100) NOT NULL,
  `categorry_type` varchar(50) NOT NULL DEFAULT 'Điện máy',
  `category_added_date` date NOT NULL DEFAULT current_timestamp(),
  `category_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_img`, `categorry_type`, `category_added_date`, `category_is_display`) VALUES
(1, 'Snack', 'snack.png', 'Đồ gói', '2026-03-23', 1),
(2, 'Mì gói', 'Mi.jpg', 'Đồ gói', '2026-03-23', 1),
(3, 'Các loại hạt', 'Hat.jpg', 'Đồ khô', '2026-03-23', 1),
(4, 'Trái cây sấy ', 'TraiCay.jpg', 'Đồ khô', '2026-03-23', 1),
(5, 'Thịt sấy', 'ThitSay.jpg', 'Đồ khô', '2026-03-23', 1),
(6, 'Bánh', 'Banh.png', 'Đồ khô', '2026-03-23', 1),
(7, 'Kẹo', 'Keo.jpg\r\n', 'Đồ gói', '2026-03-23', 1),
(8, 'Sữa', 'Sua.jpg', 'Đồ uống', '2026-03-23', 1),
(9, 'Nước có ga', 'NuocCoGa.jpg', 'Đồ uống', '2026-03-23', 1),
(10, 'Nước trái cây', 'NuocTraiCay.jpg', 'Đồ uống', '2026-03-23', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`customer_id`, `user_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 31),
(12, 32),
(13, 33),
(14, 34),
(15, 35),
(17, 37);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `discount_id` int(11) NOT NULL,
  `discount_name` varchar(100) NOT NULL,
  `discount_description` text DEFAULT NULL,
  `discount_start_date` date NOT NULL DEFAULT current_timestamp(),
  `discount_end_date` date NOT NULL DEFAULT current_timestamp(),
  `discount_amount` float NOT NULL,
  `discount_is_display` tinyint(1) NOT NULL DEFAULT 1,
  `discount_img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `discounts`
--

INSERT INTO `discounts` (`discount_id`, `discount_name`, `discount_description`, `discount_start_date`, `discount_end_date`, `discount_amount`, `discount_is_display`, `discount_img`) VALUES
(1, 'Black Friday', 'Chương trình giảm giá Black Friday', '2026-11-23', '2026-11-30', 10, 1, ''),
(2, 'Vui Tết', 'Chương trình giảm giá dịp Tết', '2026-01-01', '2026-03-01', 15, 1, ''),
(3, 'Vui Trung Thu', 'Chương trình giảm giá dịp Trung Thu', '2026-09-25', '2026-09-30', 20, 1, ''),
(4, 'Back to school', 'Chương trình giảm giá cho học sinh, sinh viên back to school', '2026-11-01', '2026-11-30', 12.5, 1, ''),
(5, 'Kỷ niệm 5 năm thành lập', 'Chương trình giảm giá kỷ niệm 1 năm thành lập của TechMo', '2026-11-01', '1026-01-13', 10, 1, ''),
(6, 'Tháng 4', 'Chương trình giảm giá tháng 4', '2026-04-01', '2026-04-30', 18, 1, ''),
(7, '06/06', 'Chương trình giảm giá ngày đôi 06/06', '2026-06-01', '2026-06-30', 15, 1, ''),
(8, '09/09', 'Chương trình giảm giá ngày đôi 09/09', '2026-09-01', '2026-09-30', 10, 1, ''),
(9, '10/10', 'Chương trình giảm giá ngày đôi 10/10', '2026-10-01', '2026-12-31', 12, 1, ''),
(10, '11/11', 'Chương trình giảm giá ngày đôi 11/11', '2026-11-01', '2026-12-31', 10, 1, ''),
(11, '12/12', 'Chương trình giảm giá ngày đôi 12/12', '2026-11-30', '2026-12-13', 12, 1, ''),
(12, '1/11', 'Chương trình giảm giá ngày đôi 1/1', '2026-12-24', '2025-12-30', 20, 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedbacks`
--

CREATE TABLE `feedbacks` (
  `feedback_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `feedback_date` date NOT NULL DEFAULT current_timestamp(),
  `feedback_rate` int(11) NOT NULL DEFAULT 5,
  `feedback_content` text DEFAULT 'Bạn chưa để lại lời nhận xét nào',
  `feedback_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `feedbacks`
--

INSERT INTO `feedbacks` (`feedback_id`, `product_variant_id`, `customer_id`, `order_id`, `feedback_date`, `feedback_rate`, `feedback_content`, `feedback_is_display`) VALUES
(1, 1, 1, 1, '2026-04-15', 5, 'Sản phẩm tươi mới, chất lượng tốt.', 1),
(5, 4, 5, 5, '2026-04-15', 5, 'Mùi thơm hấp dẫn, hương vị tuyệt vời.', 1),
(6, 5, 6, 6, '2026-04-15', 4, 'Mùi thơm hấp dẫn, hương vị tuyệt vời.', 1),
(7, 4, 7, 7, '2026-04-15', 5, 'Vị cay vừa phải, ăn hoài không ngán.', 1),
(8, 9, 8, 8, '2026-04-15', 5, 'Ngon tuyệt! Ăn một lần là ghiền luôn.', 1),
(10, 24, 8, 10, '2026-04-15', 5, 'Ngon tuyệt! Ăn một lần là ghiền luôn.', 1),
(12, 11, 9, 12, '2026-04-15', 5, 'Không đạt như quảng cáo, hơi thất vọng.', 1),
(13, 10, 10, 13, '2026-04-15', 4, 'Không đạt như quảng cáo, hơi thất vọng.', 1),
(14, 22, 10, 14, '2026-04-15', 5, 'Không đạt như quảng cáo, hơi thất vọng.', 1),
(500, 2, 5, 8, '2026-04-15', 4, 'Ăn ngon nhưng giá hơi cao.', 1),
(502, 57, 9, 10, '2026-04-15', 5, 'Quá trình mua hàng diễn ra suôn sẻ và sản phẩm chất lượng cao.', 1),
(504, 73, 1, 6, '2026-04-15', 5, 'Dịch vụ khách hàng rất nhanh chóng và thân thiện.', 1),
(508, 64, 10, 13, '2026-04-15', 4, 'Đó là một lựa chọn tốt	 tôi sẽ mua lại!', 1),
(509, 78, 7, 5, '2026-04-15', 4, 'Chất lượng đáng kinh ngạc	 tôi sẽ giới thiệu cho bạn bè!', 1),
(512, 55, 9, 12, '2026-04-15', 4, 'Sản phẩm tốt	 nhưng giao hàng hơi chậm.', 1),
(513, 68, 1, 10, '2026-04-15', 4, 'Hỗ trợ khách hàng rất chuyên nghiệp và hữu ích.', 1),
(515, 11, 7, 13, '2026-04-15', 4, 'Sản phẩm chất lượng cao với giá phải chăng.', 1),
(516, 29, 3, 11, '2026-04-15', 5, 'Một trải nghiệm mua sắm trực tuyến tuyệt vời!', 1),
(519, 74, 1, 5, '2026-04-15', 4, 'Sản phẩm chất lượng	 đúng như mô tả.', 1),
(520, 8, 4, 2, '2026-04-15', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(521, 34, 9, 1, '2026-04-15', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(522, 59, 2, 10, '2026-04-15', 4, 'Sản phẩm không tồi	 nhưng có thể cải thiện.', 1),
(523, 67, 7, 12, '2026-04-15', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(526, 41, 1, 7, '2026-04-15', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(529, 76, 10, 6, '2026-04-15', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(530, 22, 4, 5, '2026-04-15', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(532, 63, 2, 12, '2026-04-15', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(533, 77, 7, 8, '2026-04-15', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(534, 9, 1, 4, '2026-04-15', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(536, 52, 3, 13, '2026-04-15', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(539, 13, 4, 11, '2026-04-15', 4, 'Chất lượng sản phẩm đáng giá mỗi xu.', 1),
(540, 27, 9, 5, '2026-04-15', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(541, 5, 3, 2, '2026-04-15', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(542, 18, 6, 8, '2026-04-15', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(543, 63, 9, 10, '2026-04-15', 5, 'Một trải nghiệm mua sắm tuyệt vời!', 1),
(544, 41, 2, 4, '2026-04-15', 3, 'Không hài lòng với chất lượng sản phẩm.', 1),
(545, 27, 7, 12, '2026-04-15', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(546, 8, 5, 6, '2026-04-15', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(547, 32, 3, 11, '2026-04-15', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(550, 77, 8, 7, '2026-04-15', 4, 'Sản phẩm đúng như mô tả.', 1),
(553, 55, 9, 12, '2026-04-15', 4, 'Giao hàng nhanh	 nhưng sản phẩm không đạt yêu cầu.', 1),
(554, 68, 1, 10, '2026-04-15', 4, 'Sản phẩm đúng như hình	 tôi rất hài lòng.', 1),
(556, 11, 7, 13, '2026-04-15', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(557, 29, 3, 11, '2026-04-15', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(560, 74, 1, 5, '2026-04-15', 4, 'Đã nhận được đúng sản phẩm mình mong đợi.', 1),
(561, 8, 4, 2, '2026-04-15', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(562, 34, 9, 1, '2026-04-15', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(563, 59, 2, 10, '2026-04-15', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện thêm', 1),
(564, 67, 7, 12, '2026-04-15', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(567, 41, 1, 7, '2026-04-15', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(570, 76, 10, 6, '2026-04-15', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(571, 22, 4, 5, '2026-04-15', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(573, 63, 2, 12, '2026-04-15', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(574, 77, 7, 8, '2026-04-15', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(575, 9, 1, 4, '2026-04-15', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(577, 52, 3, 13, '2026-04-15', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(580, 13, 4, 11, '2026-04-15', 4, 'Chất lượng sản phẩm đáng giá mỗi xu.', 1),
(581, 27, 9, 5, '2026-04-15', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(582, 5, 3, 2, '2026-04-15', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(583, 18, 6, 8, '2026-04-15', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(584, 63, 9, 10, '2026-04-15', 5, 'Một trải nghiệm mua sắm tuyệt vời!', 1),
(585, 41, 2, 4, '2026-04-15', 3, 'Không hài lòng với chất lượng sản phẩm.', 1),
(586, 27, 7, 12, '2026-04-15', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(587, 8, 5, 6, '2026-04-15', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(588, 32, 3, 11, '2026-04-15', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(590, 77, 8, 7, '2026-04-15', 4, 'Sản phẩm đúng như mô tả.', 1),
(593, 55, 9, 12, '2026-04-15', 4, 'Giao hàng nhanh	 nhưng sản phẩm không đạt yêu cầu.', 1),
(594, 68, 1, 10, '2026-04-15', 4, 'Sản phẩm đúng như hình	 tôi rất hài lòng.', 1),
(596, 11, 7, 13, '2026-04-15', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(597, 29, 3, 11, '2026-04-15', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(600, 74, 1, 5, '2026-04-15', 4, 'Đã nhận được đúng sản phẩm mình mong đợi.', 1),
(601, 8, 4, 2, '2026-04-15', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(602, 34, 9, 1, '2026-04-15', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(603, 59, 2, 10, '2026-04-15', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện một chút.', 1),
(604, 67, 7, 12, '2026-04-15', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(607, 41, 1, 7, '2026-04-15', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(610, 76, 10, 6, '2026-04-15', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(611, 22, 4, 5, '2026-04-15', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(613, 63, 2, 12, '2026-04-15', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(614, 77, 7, 8, '2026-04-15', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(615, 9, 1, 4, '2026-04-15', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(617, 52, 3, 13, '2026-04-15', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(620, 1, 5, 8, '2026-04-15', 4, 'Sản phẩm tuyệt vời	 tôi rất hài lòng!', 1),
(622, 34, 9, 10, '2026-04-15', 5, 'Quá trình mua hàng diễn ra suôn sẻ và sản phẩm chất lượng cao.', 1),
(623, 33, 4, 12, '2026-04-15', 4, 'Một trải nghiệm tích cực	 nhưng có điểm nhỏ cần lưu ý.', 1),
(624, 12, 1, 6, '2026-04-15', 5, 'Dịch vụ khách hàng rất nhanh chóng và thân thiện.', 1),
(625, 51, 8, 11, '2026-04-15', 4, 'Sản phẩm đáng giá đồng tiền bát gạo!', 1),
(626, 34, 3, 7, '2026-04-15', 5, 'Hài lòng với chất lượng và giá trị sản phẩm.', 1),
(628, 22, 10, 13, '2026-04-15', 4, 'Đó là một lựa chọn tốt	 tôi sẽ mua lại!', 1),
(629, 18, 7, 5, '2026-04-15', 4, 'Chất lượng đáng kinh ngạc	 tôi sẽ giới thiệu cho bạn bè!', 1),
(630, 25, 2, 4, '2026-04-15', 4, 'Nhận được đúng những gì tôi mong đợi	 không có bất kỳ vấn đề gì.', 1),
(631, 49, 4, 8, '2026-04-15', 5, 'Một sự mua sắm trực tuyến tuyệt vời!', 1),
(632, 55, 9, 12, '2026-04-15', 4, 'Sản phẩm tốt	 nhưng giao hàng hơi chậm.', 1),
(634, 12, 5, 6, '2026-04-15', 5, 'Không có gì để chê	 tôi rất hài lòng!', 1),
(635, 11, 7, 13, '2026-04-15', 4, 'Sản phẩm chất lượng cao với giá phải chăng.', 1),
(639, 44, 1, 5, '2026-04-15', 4, 'Sản phẩm chất lượng	 đúng như mô tả.', 1),
(640, 28, 4, 2, '2026-04-15', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(641, 24, 9, 1, '2026-04-15', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(642, 19, 2, 10, '2026-04-15', 4, 'Sản phẩm không tồi	 nhưng có thể cải thiện.', 1),
(643, 17, 7, 12, '2026-04-15', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(644, 12, 3, 8, '2026-04-15', 5, 'Đúng như mong đợi	 tuyệt vời!', 1),
(645, 26, 6, 11, '2026-04-15', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(646, 11, 1, 7, '2026-04-15', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(649, 26, 10, 6, '2026-04-15', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(650, 32, 4, 5, '2026-04-15', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(653, 37, 7, 8, '2026-04-15', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(654, 49, 1, 4, '2026-04-15', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(656, 42, 3, 13, '2026-04-15', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(659, 33, 4, 11, '2026-04-15', 4, 'Chất lượng sản phẩm đáng giá mỗi xu.', 1),
(660, 57, 9, 5, '2026-04-15', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(661, 3, 3, 2, '2026-04-15', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(662, 28, 6, 8, '2026-04-15', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(663, 33, 9, 10, '2026-04-15', 5, 'Một trải nghiệm mua sắm tuyệt vời!', 1),
(664, 11, 2, 4, '2026-04-15', 3, 'Không hài lòng với chất lượng sản phẩm.', 1),
(665, 17, 7, 12, '2026-04-15', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(667, 33, 3, 11, '2026-04-15', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(669, 57, 1, 5, '2026-04-15', 5, 'Sản phẩm đáng giá tiền.', 1),
(670, 34, 8, 7, '2026-04-15', 4, 'Sản phẩm đúng như mô tả.', 1),
(671, 17, 2, 4, '2026-04-15', 4, 'Chất lượng sản phẩm không tốt như mong đợi.', 1),
(672, 29, 4, 8, '2026-04-15', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(673, 19, 9, 12, '2026-04-15', 4, 'Giao hàng nhanh	 nhưng sản phẩm không đạt yêu cầu.', 1),
(674, 76, 1, 10, '2026-04-15', 4, 'Sản phẩm đúng như hình	 tôi rất hài lòng.', 1),
(675, 44, 5, 6, '2026-04-15', 5, 'Không có gì để phàn nàn	 sản phẩm tốt.', 1),
(677, 32, 3, 11, '2026-04-15', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(681, 61, 4, 2, '2026-04-15', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(683, 51, 2, 10, '2026-04-15', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện thêm', 1),
(684, 62, 7, 12, '2026-04-15', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(685, 1, 3, 8, '2026-04-15', 5, 'Đúng như mong đợi	 tuyệt vời!', 1),
(686, 9, 6, 11, '2026-04-15', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(687, 10, 1, 7, '2026-04-15', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(688, 4, 5, 13, '2026-04-15', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(690, 6, 10, 6, '2026-04-15', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(691, 7, 4, 5, '2026-04-15', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(692, 8, 9, 2, '2026-04-15', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(693, 4, 2, 12, '2026-04-15', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(694, 37, 7, 8, '2026-04-15', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(695, 32, 1, 4, '2026-04-15', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(697, 11, 3, 13, '2026-04-15', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(699, 67, 1, 7, '2026-04-15', 4, 'Sản phẩm tốt	 nhưng có thể cải thiện một chút.', 1),
(700, 10, 4, 11, '2026-04-15', 4, 'Chất lượng sản phẩm đáng giá mỗi xu.', 1),
(701, 11, 9, 5, '2026-04-15', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(702, 19, 3, 2, '2026-04-15', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(704, 49, 9, 10, '2026-04-15', 5, 'Một trải nghiệm mua sắm tuyệt vời!', 1),
(706, 61, 7, 12, '2026-04-15', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(707, 62, 5, 6, '2026-04-15', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(708, 58, 3, 11, '2026-04-15', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(709, 52, 1, 5, '2026-04-15', 5, 'Sản phẩm đáng giá tiền.', 1),
(710, 75, 8, 7, '2026-04-15', 4, 'Sản phẩm đúng như mô tả.', 1),
(711, 71, 2, 4, '2026-04-15', 4, 'Chất lượng sản phẩm không tốt như mong đợi.', 1),
(713, 55, 9, 12, '2026-04-15', 4, 'Giao hàng nhanh	 nhưng sản phẩm không đạt yêu cầu.', 1),
(714, 68, 1, 10, '2026-04-15', 4, 'Sản phẩm đúng như hình	 tôi rất hài lòng.', 1),
(716, 11, 7, 13, '2026-04-15', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(717, 29, 3, 11, '2026-04-15', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(720, 74, 1, 5, '2026-04-15', 4, 'Đã nhận được đúng sản phẩm mình mong đợi.', 1),
(721, 8, 4, 2, '2026-04-15', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(722, 34, 9, 1, '2026-04-15', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(723, 59, 2, 10, '2026-04-15', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện một chút.', 1),
(724, 67, 7, 12, '2026-04-15', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(727, 41, 1, 7, '2026-04-15', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(730, 76, 10, 6, '2026-04-15', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(731, 22, 4, 5, '2026-04-15', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(733, 63, 2, 12, '2026-04-15', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(734, 77, 7, 8, '2026-04-15', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(735, 9, 1, 4, '2026-04-15', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(737, 52, 3, 13, '2026-04-15', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(740, 33, 1, 4, '2026-04-15', 5, 'Nhung nguyễn test', 1),
(741, 6, 1, 1, '2026-04-15', 2, 'Máy giặt tồi quá', 1),
(743, 62, 1, 1, '2026-04-15', 5, 'Hàng tốt, giá rẻ', 1),
(756, 9, 1, 42, '2026-04-15', 3, 'Bạn không để lại lời nhận xét nào', 1),
(757, 17, 1, 42, '2026-04-15', 4, 'Sản phẩm tốt quá nè', 1),
(758, 18, 1, 42, '2026-04-15', 2, 'Bạn không để lại lời nhận xét nào', 1),
(759, 44, 1, 42, '2026-04-15', 4, 'Bạn không để lại lời nhận xét nào', 1),
(760, 62, 1, 5, '2026-04-15', 5, 'Sản phẩm tuyệt vời', 1);

--
-- Bẫy `feedbacks`
--
DELIMITER $$
CREATE TRIGGER `insert_after_feedbacks` AFTER INSERT ON `feedbacks` FOR EACH ROW BEGIN
    DECLARE avg_rate DECIMAL(10, 1) ;
    DECLARE product_id INT(11) ;
    DECLARE product_variant_id INT(11);
   
    SET product_variant_id = NEW.product_variant_id;
    
    SET product_id = (SELECT product_variants.product_id 
    FROM product_variants 
    WHERE product_variants.product_variant_id = product_variant_id);
    
    SET avg_rate =  (SELECT AVG(feedbacks.feedback_rate) 
     FROM feedbacks, product_variants 
     WHERE feedbacks.product_variant_id = product_variants.product_variant_id 
     AND product_variants.product_id = product_id 
     GROUP BY product_variants.product_id);
    
    UPDATE products 
    SET products.product_rate = avg_rate
    WHERE products.product_id = product_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback_imgs`
--

CREATE TABLE `feedback_imgs` (
  `feedback_img_id` int(11) NOT NULL,
  `feedback_id` int(11) NOT NULL,
  `feedback_img_name` varchar(100) NOT NULL,
  `feedback_img_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_sections`
--

CREATE TABLE `home_sections` (
  `id` int(11) NOT NULL,
  `section_key` varchar(50) NOT NULL,
  `display_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `home_sections`
--

INSERT INTO `home_sections` (`id`, `section_key`, `display_order`) VALUES
(1, 'Gợi ý hôm nay', 1),
(2, 'Hàng mới về', 2),
(3, 'Khuyến mãi', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `notification_title` varchar(100) NOT NULL,
  `notification_subtitle` text DEFAULT NULL,
  `notification_content` text NOT NULL,
  `notification_date` date NOT NULL DEFAULT current_timestamp(),
  `notification_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`notification_id`, `notification_type_id`, `notification_title`, `notification_subtitle`, `notification_content`, `notification_date`, `notification_is_display`) VALUES
(1, 1, 'Đơn hàng mới', 'Bạn có một đơn hàng mới đang chờ xử lý.', 'Đơn hàng mới đã được đặt thành công. Vui lòng kiểm tra và xử lý đơn hàng.', '2026-04-15', 1),
(2, 2, 'Đơn hàng đã được vận chuyển', 'Đơn hàng của bạn đã được vận chuyển và đang trên đường đến tay bạn.', 'Đơn hàng đã được vận chuyển thành công. Bạn có thể theo dõi trạng thái đơn hàng tại đây.', '2026-04-15', 1),
(3, 3, 'Đơn hàng đã được giao', 'Đơn hàng của bạn đã được giao đến địa chỉ của bạn.', 'Đơn hàng đã được giao thành công. Vui lòng kiểm tra và xác nhận đơn hàng.', '2026-04-15', 1),
(4, 4, 'Thanh toán đã được nhận', 'Thanh toán của bạn cho đơn hàng đã được nhận.', 'Thanh toán đã được nhận thành công. Vui lòng kiểm tra email của bạn để biết thêm chi tiết.', '2026-04-15', 1),
(5, 5, 'Phản hồi đã được nhận', 'Bạn đã nhận được phản hồi từ khách hàng.', 'Khách hàng đã phản hồi về sản phẩm của bạn. Vui lòng kiểm tra và xử lý phản hồi này.', '2026-04-15', 1),
(6, 6, 'Giảm giá 50% cho tất cả sản phẩm', 'Cơ hội mua sắm tuyệt vời!', 'Từ ngày 03/11/2023 đến ngày 09/11/2023, chúng tôi giảm giá 50% cho tất cả sản phẩm. Đây là cơ hội tuyệt vời để bạn mua sắm với giá ưu đãi.', '2026-04-15', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification_types`
--

CREATE TABLE `notification_types` (
  `notification_type_id` int(11) NOT NULL,
  `notification_type_name` varchar(100) NOT NULL,
  `notification_type_img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `notification_types`
--

INSERT INTO `notification_types` (`notification_type_id`, `notification_type_name`, `notification_type_img`) VALUES
(1, 'Order placed', 'order_placed.jpg'),
(2, 'Order shipped', 'order_shipped.jpg'),
(3, 'Order delivered', 'order_delivered.jpg'),
(4, 'Payment received', 'payment_received.jpg'),
(5, 'Feedback received', 'feedback_received.jpg'),
(6, 'Sale', 'sale.jpg'),
(7, 'Lucky Customer', 'lucky_customer.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL DEFAULT 1,
  `order_name` varchar(100) NOT NULL,
  `order_phone` varchar(10) NOT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp(),
  `order_delivery_date` date NOT NULL,
  `order_delivery_address` varchar(100) NOT NULL,
  `order_note` text NOT NULL,
  `order_total_before` int(11) DEFAULT 0,
  `order_total_after` int(11) NOT NULL DEFAULT 0,
  `paying_method_id` int(11) NOT NULL DEFAULT 1,
  `order_paying_date` date NOT NULL,
  `order_is_paid` tinyint(1) NOT NULL,
  `order_status` enum('Chờ thanh toán','Đang giao hàng','Hoàn thành','Đã hủy') DEFAULT 'Chờ thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `staff_id`, `order_name`, `order_phone`, `order_date`, `order_delivery_date`, `order_delivery_address`, `order_note`, `order_total_before`, `order_total_after`, `paying_method_id`, `order_paying_date`, `order_is_paid`, `order_status`) VALUES
(1, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-11-02', '2026-11-02', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Kiểm hàng trước', 80000, 80000, 1, '2023-11-30', 1, 'Hoàn thành'),
(2, 2, 2, 'Trần Thị Bình', '0987654322', '2026-11-02', '2026-11-02', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Giao vào giờ hành chính 8h đến 16h', 400000, 400000, 1, '2023-11-30', 1, 'Hoàn thành'),
(4, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-11-02', '2026-11-02', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Kiểm hàng trước', 40000, 40000, 1, '2023-11-30', 1, 'Hoàn thành'),
(5, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-11-02', '2026-11-02', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Giao vào giờ hành chính 8h đến 16h', 80000, 80000, 1, '2023-11-30', 0, 'Hoàn thành'),
(6, 1, 3, 'Phan Nguyễn Hải Yến', '0987654321', '2026-11-02', '2026-11-02', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Đóng gói kỹ', 320000, 320000, 1, '2023-11-30', 0, 'Đã hủy'),
(7, 7, 3, 'Phan Thanh Danh', '0987654327', '2026-11-20', '2026-11-20', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', '', 90000, 90000, 1, '2023-11-30', 0, 'Đã hủy'),
(8, 8, 3, 'Mai Văn Tiên', '0987654328', '2026-11-19', '2026-11-19', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Giao sau giờ hành chính', 40000, 40000, 1, '2023-11-30', 0, 'Đã hủy'),
(10, 8, 3, 'Mai Văn Tiên', '0987654328', '2026-11-16', '2026-11-16', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Giao sau 10h sáng', 100000, 100000, 1, '2023-11-30', 0, 'Đã hủy'),
(11, 1, 3, 'Phan Nguyễn Hải Yến', '0987654321', '2026-11-25', '2026-11-25', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Giao sau 1h chiều', 200000, 200000, 1, '2023-11-30', 0, 'Đã hủy'),
(12, 1, 3, 'Phan Nguyễn Hải Yến', '0987654321', '2026-11-16', '2026-11-16', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Giao gấp', 40000, 40000, 1, '2023-11-30', 0, 'Đã hủy'),
(13, 2, 3, 'Trần Thị Bình', '0987654322', '2026-11-23', '2026-11-23', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Tránh rơi vỡ đơn hàng của tôi', 90000, 90000, 1, '2023-11-30', 1, 'Hoàn thành'),
(14, 2, 3, 'Trần Thị Bình', '0987654322', '2026-11-24', '2026-11-24', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Giao  hỏa tốc cho  tôi', 778000, 778000, 1, '2023-11-30', 1, 'Đang giao hàng'),
(39, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-12-05', '2026-12-05', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', '', 12000, 12000, 1, '0000-00-00', 1, 'Hoàn thành'),
(40, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-12-17', '2026-12-17', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', '', 20000, 20000, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(41, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-12-17', '2026-12-17', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', '', 10000, 10000, 1, '0000-00-00', 1, 'Đang giao hàng'),
(42, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-12-17', '2026-12-17', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', '', 1360000, 1360000, 1, '0000-00-00', 1, 'Hoàn thành'),
(44, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-12-18', '2026-12-18', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Không mua', 40000, 40000, 2, '0000-00-00', 0, 'Đã hủy'),
(45, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-12-18', '2026-12-18', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Đừng có gửi', 40000, 40000, 2, '0000-00-00', 0, 'Đã hủy'),
(46, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2026-12-18', '2026-12-18', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', 'Kiểm hàng trước', 135000, 135000, 1, '0000-00-00', 1, 'Hoàn thành'),
(48, 1, 1, 'Hương vi', '0987654321', '2026-12-18', '2026-12-18', 'Số 15, Nguyễn Trãi, Hà Đông, Hà Nội', '', 15000, 15000, 1, '0000-00-00', 1, 'Hoàn thành'),
(68, 14, 1, 'Lê Văn Minh', '0987345654', '2026-04-14', '2026-04-14', 'w Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 3, '0000-00-00', 0, 'Hoàn thành'),
(69, 14, 1, 'Lê Văn Minh', '0987345654', '2026-04-14', '2026-04-14', 'w Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(70, 14, 1, 'Lê Văn Minh', '0987345654', '2026-04-15', '2026-04-15', 'số 21 Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(71, 14, 1, 'Lê Văn Minh', '0987345654', '2026-04-15', '0000-00-00', 'w Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(72, 14, 1, 'Lê Văn Minh', '0987345654', '2026-04-18', '0000-00-00', 'w Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(73, 14, 1, 'Lê Văn Minh', '0987345654', '2026-04-18', '0000-00-00', 'w Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Đã hủy'),
(74, 14, 1, 'Lê Văn Minh', '0987345654', '2026-04-18', '0000-00-00', 'w Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(75, 15, 1, 'Minh Lê Văn', '0999777555', '2026-04-18', '0000-00-00', 'X Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(76, 14, 1, 'Lê Văn Minh', '0987345654', '2026-04-18', '0000-00-00', 'w Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(77, 15, 1, 'Minh Lê Văn', '0999777555', '2026-04-18', '0000-00-00', 'X Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(78, 15, 1, 'Minh Lê Văn', '0999777555', '2026-04-18', '0000-00-00', 'w Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(79, 15, 1, 'Minh Lê Văn', '0999777555', '2026-04-18', '0000-00-00', 'w Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(80, 14, 1, 'Lê Văn Minh', '0987345654', '2026-04-19', '0000-00-00', 'w Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(81, 14, 1, 'Lê Văn Minh', '0987345654', '2026-04-19', '0000-00-00', 'w Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(82, 14, 1, 'Lê Văn Minh', '0987345654', '2026-04-21', '0000-00-00', 'w Nguyễn Trãi Hà Đông Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(83, 14, 1, 'Lê Văn Minh', '0987345654', '2026-04-22', '0000-00-00', 'w Phường 8 Quận 3 Hà Nội', '', NULL, 0, 2, '0000-00-00', 0, 'Đang giao hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `order_detail_quantity` int(11) NOT NULL,
  `order_detail_price_before` int(11) DEFAULT 0,
  `order_detail_price_after` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_variant_id`, `order_detail_quantity`, `order_detail_price_before`, `order_detail_price_after`) VALUES
(1, 6, 2, 5000, 5000),
(1, 62, 1, 40000, 40000),
(2, 37, 3, 10000, 10000),
(2, 59, 2, 100000, 100000),
(4, 33, 2, 20000, 20000),
(5, 62, 2, 40000, 40000),
(6, 67, 2, 160000, 160000),
(7, 12, 2, 45000, 45000),
(8, 72, 2, 20000, 20000),
(10, 13, 1, 100000, 100000),
(11, 59, 2, 100000, 100000),
(12, 33, 2, 20000, 20000),
(13, 11, 2, 45000, 45000),
(14, 33, 10, 20000, 20000),
(14, 60, 1, 389000, 389000),
(39, 1, 1, 12000, 12000),
(40, 44, 1, 340000, 340000),
(40, 73, 1, 10000, 10000),
(41, 25, 1, 10000, 10000),
(42, 9, 1, 5000, 5000),
(42, 17, 1, 410000, 410000),
(42, 18, 1, 250000, 250000),
(42, 44, 1, 340000, 340000),
(44, 63, 1, 40000, 40000),
(45, 63, 1, 40000, 40000),
(46, 18, 1, 250000, 250000),
(46, 26, 1, 10000, 10000),
(46, 41, 1, 45000, 45000),
(48, 77, 1, 15000, 15000),
(68, 19, 1, 50000, 50000),
(69, 22, 1, 40000, 32800),
(70, 12, 1, 45000, 45000),
(71, 11, 1, 45000, 45000),
(72, 42, 1, 400000, 400000),
(73, 18, 1, 250000, 250000),
(74, 37, 1, 10000, 10000),
(75, 52, 1, 50000, 50000),
(76, 1, 1, 12000, 12000),
(77, 52, 1, 50000, 50000),
(78, 63, 1, 40000, 40000),
(79, 62, 1, 40000, 40000),
(80, 63, 1, 40000, 40000),
(81, 13, 2, 100000, 100000),
(82, 63, 1, 40000, 40000),
(83, 63, 1, 40000, 40000);

--
-- Bẫy `order_details`
--
DELIMITER $$
CREATE TRIGGER `delete_before_order_details` BEFORE DELETE ON `order_details` FOR EACH ROW BEGIN
    -- Update orders
    UPDATE orders
    SET
        order_total_after = (
            SELECT SUM(order_detail_price_after * order_detail_quantity)
            FROM order_details
            WHERE order_id = OLD.order_id
        ),
        order_total_before = (
            SELECT SUM(order_detail_price_before * order_detail_quantity)
            FROM order_details
            WHERE order_id = OLD.order_id
        )
    WHERE order_id = OLD.order_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_before_order_details` BEFORE INSERT ON `order_details` FOR EACH ROW BEGIN
    -- Calculate new prices
    SET NEW.order_detail_price_before = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );

    SET NEW.order_detail_price_after = COALESCE(
        (
            SELECT view_product_variants.product_variant_price * (1 - view_product_variants.discount_amount / 100)
            FROM view_product_variants
            WHERE view_product_variants.product_variant_id = NEW.product_variant_id
        ),
        NEW.order_detail_price_before
    );
    
    -- Set default value if order_detail_price_after is NULL
    IF NEW.order_detail_price_after IS NULL THEN
        SET NEW.order_detail_price_after = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );
    END IF;

    -- Update orders
    UPDATE orders
    SET
        order_total_after = (
            SELECT SUM(NEW.order_detail_price_after * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        ),
        order_total_before = (
            SELECT SUM(NEW.order_detail_price_before * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        )
    WHERE order_id = NEW.order_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_before_order_details` BEFORE UPDATE ON `order_details` FOR EACH ROW BEGIN
    -- Calculate new prices
    SET NEW.order_detail_price_before = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );

    SET NEW.order_detail_price_after = COALESCE(
        (
            SELECT view_product_variants.product_variant_price * (1 - view_product_variants.discount_amount / 100)
            FROM view_product_variants
            WHERE view_product_variants.product_variant_id = NEW.product_variant_id
        ),
        NEW.order_detail_price_before
    );
    
    -- Set default value if order_detail_price_after is NULL
    IF NEW.order_detail_price_after IS NULL THEN
        SET NEW.order_detail_price_after = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );
    END IF;

    -- Update orders
    UPDATE orders
    SET
        order_total_after = (
            SELECT SUM(NEW.order_detail_price_after * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        ),
        order_total_before = (
            SELECT SUM(NEW.order_detail_price_before * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        )
    WHERE order_id = NEW.order_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paying_methods`
--

CREATE TABLE `paying_methods` (
  `paying_method_id` int(11) NOT NULL,
  `paying_method_name` varchar(100) NOT NULL,
  `paying_method_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `paying_methods`
--

INSERT INTO `paying_methods` (`paying_method_id`, `paying_method_name`, `paying_method_is_display`) VALUES
(1, 'Ví điện tử MoMo', 1),
(2, 'Thẻ ngân hàng', 1),
(3, 'Thẻ tín dụng', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `product_avt_img` varchar(100) NOT NULL,
  `product_rate` float NOT NULL,
  `product_description` text DEFAULT NULL,
  `product_period` int(11) DEFAULT NULL,
  `product_view_count` int(11) DEFAULT NULL,
  `product_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(1, 1, 'Snack khoai tây', 17, 'P1_avt.jpg', 4.7, NULL, 36, 1000, 1),
(2, 1, 'Snack rong biển', 5, 'P2_avt.jpg', 4, NULL, 36, 1200, 1),
(3, 1, 'Snack ớt', 11, 'P3_avt.jpg', 4, NULL, 24, 950, 1),
(4, 1, 'Snack giòn', 4, 'P4_avt.jpg', 4.5, NULL, 36, 1100, 1),
(5, 1, 'Sanck sườn nướng', 17, 'P5_avt.jpg', 4, NULL, 36, 850, 1),
(6, 2, 'Mì hảo hảo ', 6, 'P6_avt.jpg', 3, NULL, 12, 1, 1),
(7, 2, 'Mì lẩu thái', 3, 'P7_avt.jpg', 5, NULL, 12, 1200, 1),
(8, 2, 'Mì omachi', 3, 'P8_avt.jpg', 4, NULL, 12, 950, 1),
(9, 2, 'Mì 3 miền', 18, 'P9_avt.jpg', 4.6, NULL, 12, 1100, 1),
(10, 2, 'Mì Dalago', 1, 'P10_avt.jpg', 4.3, NULL, 12, 850, 1),
(11, 3, 'Hạt dẻ', 5, 'P11_avt.jpg', 4.2, NULL, 12, 1, 1),
(12, 3, 'Hạt điều ', 1, 'P12_avt.jpg', 4.6, NULL, 24, 1200, 1),
(13, 4, 'Chuối sấy', 21, 'P13_avt.jpg', 4, NULL, 12, 1, 1),
(15, 5, 'Bò sấy', 33, 'P15_avt.jpg', 4.3, NULL, 24, 1, 1),
(16, 5, 'Heo sấy', 43, 'P16_avt.jpg', 3.5, NULL, 12, 1200, 1),
(17, 6, 'Bánh chocopie', 38, 'P17_avt.jpg', 4, NULL, 30, 1, 1),
(18, 6, 'Bánh oreo', 38, 'P18_avt.jpg', 4.9, NULL, 12, 1200, 1),
(19, 7, 'Kẹo CoolAir vị nho\r\n', 1, 'P19_avt.jpg', 4, NULL, 24, 1, 1),
(20, 7, 'Kẹo chupa Chups', 7, 'P20_avt.jpg', 4, NULL, 24, 1200, 1),
(21, 8, 'Sữa TH', 15, 'P21_avt.jpg', 5, NULL, 24, 1, 1),
(22, 8, 'Sữa vinamilk', 13, 'P22_avt.jpg', 4, NULL, 24, 1200, 1),
(23, 9, 'Coca', 19, 'P23_avt.jpg', 4.8, NULL, 12, 0, 1),
(24, 9, 'Pepsi', 14, 'P24_avt.jpg', 4.6, NULL, 12, 1050, 1),
(25, 10, 'Nước táo', 16, 'P25_avt.jpg', 4.6, NULL, 36, 1250, 1),
(26, 10, 'Nước xoài', 20, 'P26_avt.jpg', 4.4, NULL, 24, 950, 1),
(27, 6, 'Bánh nabati', 1, 'P27_avt.jpg', 3.8, NULL, 12, 1200, 1),
(28, 1, 'Snack cay 4x', 42, 'P28_avt.jpg', 4.9, NULL, 24, 200, 1),
(29, 1, 'Snack bắp', 1, 'P29_avt.jpg', 4, NULL, 24, 400, 1),
(30, 3, 'Hạt nho', 1, 'P30_avt.jpg', 4.8, NULL, 24, 200, 1),
(31, 3, 'Hạt bí', 2, 'P31_avt.jpg', 4.3, NULL, 24, 200, 1),
(32, 5, 'Mực sấy', 34, 'P32_avt.jpg', 4.6, NULL, 24, 1000, 1),
(33, 5, 'Trâu sấy', 34, 'P33_avt.jpg', 4.5, NULL, 24, 1000, 1),
(34, 5, 'Khô gà', 32, 'P34_avt.jpg', 4, NULL, 199, 123, 1),
(35, 7, 'Kẹo gumme nho', 1, 'P35_avt.jpg', 4.2, NULL, 24, 1000, 1),
(36, 7, 'Kẹo Alpenlibe', 6, 'P36_avt.jpg', 4, NULL, 24, 800, 1),
(37, 7, 'Kẹo Skittles', 3, 'P37_avt.jpg', 4.5, NULL, 24, 200, 1),
(38, 9, 'Aquafina có ga', 24, 'P38_avt.jpg', 5, NULL, 24, 200, 1),
(39, 9, 'Fanta', 24, 'P39_avt.jpg', 4, NULL, 24, 200, 1),
(40, 9, 'Nước bí đao', 13, 'P40_avt.jpg', 4, NULL, 24, 100, 1),
(41, 9, 'Tăng lực Rocstar', 14, 'P41_avt.jpg', 4, NULL, 24, 100, 1),
(42, 9, 'Redbull', 40, 'P42_avt.jpg', 4, NULL, 24, 100, 1),
(43, 2, 'Mì Yeul', 7, 'P43_avt.jpg', 4, NULL, 24, 1000, 1),
(44, 2, 'Mì đệ nhất', 9, 'P44_avt.jpg', 4.3, NULL, 24, 1200, 1),
(45, 4, 'Ngô sấy ', 22, 'P45_avt.jpg', 4, NULL, 12, 1500, 1),
(46, 4, 'Chuối sấy cao cấp', 23, 'P46_avt.jpg', 4, NULL, 12, 900, 1),
(47, 4, 'Nho sấy', 25, 'P47_avt.jpg', 4.3, NULL, 12, 1300, 1),
(48, 6, 'Bánh solite vị cốm', 1, 'P48_avt.jpg', 4.2, NULL, 12, 500, 1),
(49, 6, 'Bánh solite nhân trứng', 8, 'P49_avt.jpg', 4.5, NULL, 18, 2400, 1),
(50, 6, 'Bánh solite vị dâu', 38, 'P50_avt.jpg', 3.7, NULL, 12, 2500, 1),
(51, 6, 'Bánh doca', 33, 'P51_avt.png', 4.3, NULL, 12, 2200, 1),
(52, 8, 'Sữa LaDy', 6, 'P52_avt.jpg', 4.2, NULL, 12, 2200, 1),
(53, 8, 'Sữa Kun', 6, 'P53_avt.jpg', 4, NULL, 12, 1800, 1),
(54, 8, 'Sữa ovaltine', 7, 'P54_avt.jpg', 4, NULL, 12, 1600, 1),
(55, 10, 'Nước đào', 13, 'P55_avt.jpg', 4.8, NULL, 24, 1500, 1),
(56, 10, 'Nước cam', 40, 'P56_avt.jpg', 4, NULL, 12, 1400, 1),
(57, 10, 'Nước ổi', 14, 'P57_avt.jpg', 4, NULL, 12, 1300, 1),
(58, 3, 'Hạt hướng dương', 3, 'P58_avt.jpg', 4, NULL, 12, 100, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_details`
--

CREATE TABLE `product_details` (
  `product_detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_detail_name` varchar(100) NOT NULL,
  `product_detail_value` text DEFAULT NULL,
  `product_detail_unit` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product_details`
--

INSERT INTO `product_details` (`product_detail_id`, `product_id`, `product_detail_name`, `product_detail_value`, `product_detail_unit`) VALUES
(1, 1, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(2, 1, 'Công suất làm lạnh', '1 HP - 9.500 BTU', NULL),
(3, 1, 'Phạm vi làm lạnh hiệu quả', 'Dưới 15m² (từ 30 đến 45m³)', NULL),
(4, 1, 'Lọc bụi, kháng khuẩn, khử mùi', 'Bộ lọc bụi 2 lớp HDCông nghệ lọc kép Dual Filtratio', NULL),
(5, 1, 'Công nghệ tiết kiệm điện', 'iEco/GearInverter Quattro', NULL),
(6, 1, 'Làm lạnh nhanh', 'Boost', NULL),
(7, 1, 'Tiện ích', 'Chế độ Avoid Me (Breeze Away)Chế độ chỉ sử dụng quạt Fan Only - chỉ làm mát, không làm lạnhChức năng hút ẩmChức năng tự làm sạchFollow me - chức năng cài đặt nhiệt độ tại vị trí remoteHẹn giờ bật tắt máyKhóa remote điều khiểnMàn hình hiển thị nhiệt độ trên dàn lạnhRemote có đèn LED', NULL),
(8, 1, 'Tiêu thụ điện', '0.75 kW/h5 sao (Hiệu suất năng lượng 4.48)', NULL),
(9, 1, 'Dàn lạnh', 'Dài 72.6 cm - Cao 29.1 cm - Dày 21 cm - Nặng 8.2 kg', NULL),
(10, 1, 'Dàn nóng', 'Dài 80 cm - Cao 49.5 cm - Dày 26.2 cm - Nặng 21.7 kg', NULL),
(11, 1, 'Hãng', 'Midea.', NULL),
(12, 2, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(13, 2, 'Công suất làm lạnh', '1.5 HP - 12.000 BTU', NULL),
(15, 2, 'Lọc bụi, kháng khuẩn, khử mùi', 'Bộ lọc HD giúp lọc sạch không khí', NULL),
(16, 2, 'Công nghệ tiết kiệm điện', 'AI InverterEco', NULL),
(17, 2, 'Làm lạnh nhanh', 'Turbo', NULL),
(18, 2, 'Tiện ích', 'Chế độ bảo vệ nguồn điệnChế độ kiểm soát độ ẩmCảm biến nhiệt độ I FeelMàn hình hiển thị nhiệt độ trên dàn lạnhĐảo gió đa chiều tạo luồng không khí lạnh lan tỏa nhanh khắp phòng', NULL),
(19, 2, 'Tiêu thụ điện', '1.13 kW/h5 sao (Hiệu suất năng lượng 4.41)', NULL),
(20, 2, 'Dàn lạnh', 'Dài 78.2 cm - Cao 24.8 cm - Dày 19.6 cm - Nặng 7.5 kg', NULL),
(21, 2, 'Dàn nóng', 'Dài 75.4 cm - Cao 44 cm - Dày 22.4 cm - Nặng 20 kg', NULL),
(22, 2, 'Hãng', 'TCL', NULL),
(23, 3, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(24, 3, 'Công suất làm lạnh', '1 HP - 9.000 BTU', NULL),
(25, 3, 'Phạm vi làm lạnh hiệu quả', 'Dưới 15m² (từ 30 đến 45m³)', NULL),
(26, 3, 'Lọc bụi, kháng khuẩn, khử mùi', 'Lưới lọc Nano Ag', NULL),
(27, 3, 'Công nghệ tiết kiệm điện', 'EcoInverter', NULL),
(28, 3, 'Làm lạnh nhanh', 'Turbo', NULL),
(29, 3, 'Tiện ích', 'Chức năng tự chẩn đoán lỗiChức năng tự làm sạchMàn hình hiển thị nhiệt độ trên dàn lạnhSleep ModeTự khởi động lại khi có điệcầu điện trở lại', NULL),
(30, 3, 'Tiêu thụ điện', '0.745 kW/h5 sao (Hiệu suất năng lượng 4.50 )', NULL),
(31, 3, 'Dàn lạnh', 'Dài 72.5 cm - Cao 28.5 cm - Dày 19.4 cm - Nặng 7.4 kg', NULL),
(32, 3, 'Dàn nóng', 'Dài 80 cm - Cao 49.5 cm - Dày 25.5 cm - Nặng 21.7 kg', NULL),
(33, 3, 'Hãng', 'Funiki', NULL),
(34, 4, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(35, 4, 'Công suất làm lạnh', '1 HP - 9.000 BTU', NULL),
(36, 4, 'Phạm vi làm lạnh hiệu quả', 'Dưới 15m² (từ 30 đến 45m³)', NULL),
(37, 4, 'Công nghệ tiết kiệm điện', 'Công nghệ I-saving', NULL),
(38, 4, 'Làm lạnh nhanh', 'Turbo', NULL),
(39, 4, 'Tiện ích', 'Chức năng tự động làm sạch iCleanCơ chế bảo vệ an toàn kép phát hiện rò rỉ thông minhCảm biến nhiệt độ iFeelMàn hình hiển thị nhiệt độ trên dàn lạnhTự khởi động lại khi có điệcầu điện trở lại', NULL),
(40, 4, 'Tiêu thụ điện', '0.98 kW/h5 sao (Hiệu suất năng lượng 4.31)', NULL),
(41, 4, 'Dàn lạnh', 'Dài 70.8 cm - Cao 28.2 cm - Dày 19.3 cm - Nặng 6.5 kg', NULL),
(42, 4, 'Dàn nóng', 'Dài 72.7 cm - Cao 45.5 cm - Dày 24.2 cm - Nặng 17.5 kg', NULL),
(43, 4, 'Hãng', 'Casper', NULL),
(44, 5, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(45, 5, 'Công suất làm lạnh', '1.5 HP - 12.000 BTU', NULL),
(46, 5, 'Phạm vi làm lạnh hiệu quả', 'Từ 15 - 20m² (từ 40 đến 60 m³)', NULL),
(47, 5, 'Lọc bụi, kháng khuẩn, khử mùi', 'Bộ lọc bụi 2 lớp HDCông nghệ lọc kép Dual Filtratio', NULL),
(48, 5, 'Công nghệ tiết kiệm điện', 'iEco/GearInverter Quattro', NULL),
(49, 5, 'Làm lạnh nhanh', 'Boost', NULL),
(50, 5, 'Tiện ích', 'Chế độ Avoid Me (Breeze Away)Chế độ chỉ sử dụng quạt Fan Only - chỉ làm mát, không làm lạnhChức năng hút ẩmChức năng tự làm sạchFollow me - chức năng cài đặt nhiệt độ tại vị trí remoteHẹn giờ bật tắt máyKhóa remote điều khiểnMàn hình hiển thị nhiệt độ trên dàn lạnhRemote có đèn LED', NULL),
(51, 5, 'Tiêu thụ điện', '1.06 kW/h5 sao (Hiệu suất năng lượng 4.87)', NULL),
(52, 5, 'Dàn lạnh', 'Dài 83.5 cm - Cao 29.5 cm - Dày 20.8 cm - Nặng 9 kg', NULL),
(53, 5, 'Dàn nóng', 'Dài 72 cm - Cao 49.5 cm - Dày 27 cm - Nặng 21.2 kg', NULL),
(54, 5, 'Hãng', 'Midea', NULL),
(55, 6, 'Loại máy', 'Cửa trênLồng đứng', NULL),
(56, 6, 'Khối lượng giặt', '7.5 KgTừ 2 - 3 người', NULL),
(57, 6, 'Kiểu động cơ', 'Truyền động gián tiếp (dây Curoa)', NULL),
(58, 6, 'Công nghệ giặt', 'Công nghệ Fuzzy LogicHệ thống xoáy nước 3 chiều', NULL),
(59, 6, 'Tiện ích', 'Hẹn giờ giặtKhóa trẻ emTự khởi động lại khi có điện', NULL),
(60, 6, 'Bảng điều khiển', 'Tiếng Việt nút nhấn', NULL),
(61, 6, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(62, 6, 'Kích thước - Khối lượng', 'Cao 91.1 cm - Ngang 53.7 cm - Sâu 55 cm - Nặng 29 kg', NULL),
(63, 6, 'Hãng', 'Sharp', NULL),
(64, 7, 'Loại máy', 'Cửa trướcLồng ngangCó Inverter', NULL),
(65, 7, 'Khối lượng giặt', '10 KgTừ 5 - 7 người', NULL),
(66, 7, 'Kiểu động cơ', 'Truyền động trực tiếp', NULL),
(67, 7, 'Công nghệ giặt', 'Công nghệ AI DD bảo vệ sợi vảiCông nghệ giặt tiết kiệm TurboWash', NULL),
(68, 7, 'Tiện ích', 'Cho phép điều khiển máy giặt từ xa qua ứng dụng LG ThinQChẩn đoán lỗi Smart DiagnosisHẹn giờ giặtKhóa trẻ emThêm đồ trong khi giặtVệ sinh lồng giặt', NULL),
(69, 7, 'Bảng điều khiển', 'Song ngữ Anh - Việt có nút xoay, nút nhấn và màn hình hiển thị', NULL),
(70, 7, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(71, 7, 'Kích thước - Khối lượng', 'Cao 85 cm - Ngang 59.2 cm - Sâu 60 cm - Nặng 70 kg', NULL),
(72, 7, 'Hãng', 'LG', NULL),
(73, 8, 'Loại máy', 'Cửa trướcLồng ngangCó Inverter', NULL),
(74, 8, 'Khối lượng giặt', '10 KgTừ 5 - 7 người', NULL),
(75, 8, 'Kiểu động cơ', 'Truyền động trực tiếp - sử dụng trí tuệ nhân tạo', NULL),
(76, 8, 'Công nghệ giặt', 'Công nghệ AI DD bảo vệ sợi vảiCông nghệ giặt 6 motion DDCông nghệ giặt hơi nước Steam (cửa trước)Công nghệ giặt tiết kiệm TurboWash', NULL),
(77, 8, 'Tiện ích', 'Cho phép điều khiển máy giặt từ xa qua ứng dụng SmartThinQHẹn giờ giặtKhóa trẻ emThêm đồ trong khi giặt', NULL),
(78, 8, 'Bảng điều khiển', 'Song ngữ Anh - Việt, có nút xoay, màn hình hiển thị', NULL),
(79, 8, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(80, 8, 'Kích thước - Khối lượng', 'Cao 85 cm - Ngang 60 cm - Sâu 58.5 cm - Nặng 80 kg', NULL),
(81, 8, 'Hãng', 'LG', NULL),
(82, 9, 'Loại máy', 'Cửa trướcLồng ngangCó Inverter', NULL),
(83, 9, 'Khối lượng giặt', '8 KgTừ 3 - 5 người', NULL),
(84, 9, 'Kiểu động cơ', 'Truyền động gián tiếp (dây Curoa)', NULL),
(85, 9, 'Công nghệ giặt', 'Công nghệ cảm biến thông minh 6th SENSESanitize Wash - Chương trình giặt sát khuẩn loại bỏ vi khuẩn', NULL),
(86, 9, 'Tiện ích', 'Chống nhănKhóa trẻ emKhử trùng lồng giặt ở 90°CThêm đồ trong khi giặtTự khởi động lại khi có điện', NULL),
(87, 9, 'Bảng điều khiển', 'Tiếng Anh cảm ứng có màn hình hiển thị', NULL),
(88, 9, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(89, 9, 'Kích thước - Khối lượng', 'Cao 85 cm - Ngang 60 cm - Sâu 56.5 cm - Nặng 63 kg', NULL),
(90, 9, 'Hãng', 'Whirlpool', NULL),
(91, 10, 'Loại máy', 'Cửa trướcLồng ngangCó Inverter', NULL),
(92, 10, 'Khối lượng giặt', '10 KgTừ 5 - 7 người', NULL),
(93, 10, 'Kiểu động cơ', 'Truyền động gián tiếp (dây Curoa)', NULL),
(94, 10, 'Công nghệ giặt', 'AI Dispenser tự động cân chỉnh lượng nước giặt, nước xảAI Wash tối ưu lượng nước giặt xả, lượng nước và thời gian giặtBảng điều khiển AI control tự động ghi nhớ chế độ giặtCông nghệ giặt bong bóng Eco BubbleGiặt hơi nước Hygiene SteamKết nối với điện thoại thông qua ứng dụng SmartThingsQuickDrive giặt xả hiệu quả chỉ trong 39 phútVRT Plus ™ giảm rung ồn đến 30%', NULL),
(95, 10, 'Tiện ích', 'Chống nhănKhóa trẻ emTự động vệ sinh lồng giặtVệ sinh lồng giặt', NULL),
(96, 10, 'Bảng điều khiển', 'Tiếng Việt', NULL),
(97, 10, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(98, 10, 'Kích thước - Khối lượng', 'Cao 85 cm - Ngang 60 cm - Sâu 62.5 cm - Nặng 67 kg', NULL),
(99, 10, 'Hãng', 'Samsung', NULL),
(100, 11, 'Loại máy', 'Google Tivi 58 inch 4K', NULL),
(101, 11, 'Hệ điều hành', 'Google TV', NULL),
(102, 11, 'Ứng dụng phổ biến', 'Clip TV, FPT Play, Netflix, Trình duyệt web, VieON, YouTube', NULL),
(103, 11, 'Công nghệ hình ảnh', 'Game Mode, HDR10, HLG, Smart HDR', NULL),
(104, 11, 'Điều khiển bằng giọng nói', 'Google Assistant có tiếng Việt, Tìm kiếm giọng nói trên YouTube bằng tiếng Việt', NULL),
(105, 11, 'Remote thông minh', 'Remote tích hợp micro tìm kiếm bằng giọng nói', NULL),
(106, 11, 'Chiếu hình từ điện thoại lên TV', 'Chromecast, T-Cast', NULL),
(107, 11, 'Kích thước', 'Ngang 128.5 cm - Cao 80.1 cm - Dày 12.85 cm', NULL),
(108, 11, 'Năm ra mắt', '2022', NULL),
(109, 11, 'Hãng', 'TCL', NULL),
(110, 12, 'Loại máy', 'Smart Tivi QLED 55 inch 4K', NULL),
(111, 12, 'Hệ điều hành', 'Tizen™', NULL),
(112, 12, 'Ứng dụng phổ biến', 'Clip TV, FPT Play, Galaxy Play (Fim+), MP3 Zing, MyTV, Netflix, POPS Kids, Spotify, Trình duyệt web, VieON, YouTube', NULL),
(113, 12, 'Công nghệ hình ảnh', 'Ambient Mode, Brightness/Color Detection, Chuyển động mượt Motion Xcelerator Turbo, Giảm độ trễ chơi game Auto Low Latency Mode (ALLM), HDR10+, Quantum Dot, Quantum HDR, Super Ultra Wide Game View & Game Bar, Supreme UHD Dimming', NULL),
(114, 12, 'Điều khiển bằng giọng nói', 'Bixby có tiếng Việt, Tìm kiếm giọng nói trên YouTube bằng tiếng Việt', NULL),
(115, 12, 'Remote thông minh', 'One Remote sạc qua USB C & ánh sáng', NULL),
(116, 12, 'Chiếu hình từ điện thoại lên TV', 'AirPlay 2, Tap View', NULL),
(117, 12, 'Kích thước', 'Ngang 123.2 cm - Cao 76.4 cm - Dày 24.9 cm', NULL),
(118, 12, 'Năm ra mắt', '2021', NULL),
(119, 12, 'Hãng', 'Samsung', NULL),
(120, 13, 'Màn hình', 'OLED 6.1\" Super Retina XDR', NULL),
(121, 13, 'Hệ điều hành', 'iOS 17', NULL),
(122, 13, 'Camera sau', 'Chính 48 MP & Phụ 12 MP', NULL),
(123, 13, 'Camera trước', '12 MP', NULL),
(124, 13, 'Chip', 'Apple A16 Bionic', NULL),
(125, 13, 'RAM', '6 GB', NULL),
(126, 13, 'Dung lượng lưu trữ', '256 GB', NULL),
(127, 13, 'SIM', '1 Nano SIM & 1 eSIM, Hỗ trợ 5G', NULL),
(128, 13, 'Pin, Sạc', '3349 mAh, 20 W', NULL),
(138, 15, 'CPU', 'i3-1115G4 3GHz', NULL),
(139, 15, 'RAM', '8 GB DDR4 2 khe (1 khe 8 GB onboard + 1 khe trống) 3200 MHz', NULL),
(140, 15, 'Ổ cứng', '256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2242))', NULL),
(141, 15, 'Màn hình', '15.6\" Full HD (1920 x 1080)', NULL),
(142, 15, 'Card màn hình', 'Card tích hợp Intel UHD', NULL),
(143, 15, 'Cổng kết nối', '1 x USB 2.0, 1 x USB 3.2, 1 x USB Type-C (chỉ hỗ trợ truyền dữ liệu), HDMI, Jack tai nghe 3.5 mm', NULL),
(144, 15, 'Hệ điều hành', 'Windows 11 Home SL', NULL),
(145, 15, 'Thiết kế', 'Vỏ nhựa', NULL),
(146, 15, 'Kích thước, khối lượng', 'Dài 359.2 mm - Rộng 236.5 mm - Dày 19.9 mm - Nặng 1.65 kg', NULL),
(147, 15, 'Thời điểm ra mắt', '2023', NULL),
(148, 16, 'CPU', 'i7-12700H 2.30 GHz', NULL),
(149, 16, 'RAM', '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz', NULL),
(150, 16, 'Ổ cứng', '512 GB SSD NVMe PCIe 4.0 (Có thể tháo ra, lắp thanh khác tối đa 1 TB), Hỗ trợ khe cắm HDD SATA 2.5 inch mở rộng (nâng cấp tối đa 1 TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', NULL),
(151, 16, 'Màn hình', '15.6\" Full HD (1920 x 1080) 144Hz', NULL),
(152, 16, 'Card màn hình', 'Card rời RTX 3050 4GB', NULL),
(153, 16, 'Cổng kết nối', '1 x USB Type-C (hỗ trợ USB, DisplayPort, Thunderbolt 4), 3 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45)', NULL),
(154, 16, 'Đặc biệt', 'Có đèn bàn phím', NULL),
(155, 16, 'Hệ điều hành', 'Windows 11 Home SL', NULL),
(156, 16, 'Thiết kế', 'Vỏ nhựa', NULL),
(157, 16, 'Kích thước, khối lượng', 'Dài 360.4 mm - Rộng 271.00 mm - Dày 25.9 mm - Nặng 2.5 kg', NULL),
(158, 16, 'Thời điểm ra mắt', '2022', NULL),
(159, 17, 'Màn hình', '10.2\" Retina IPS LCD', NULL),
(160, 17, 'Hệ điều hành', 'iPadOS 15', NULL),
(161, 17, 'Chip', 'Apple A13 Bionic', NULL),
(162, 17, 'RAM', '3 GB', NULL),
(163, 17, 'Dung lượng lưu trữ', '64 GB', NULL),
(164, 17, 'Kết nối', 'Nghe gọi qua FaceTime', NULL),
(165, 17, 'Camera sau', '8 MP', NULL),
(166, 17, 'Camera trước', '12 MP', NULL),
(167, 17, 'Pin, Sạc', '32.4 Wh (~8600 mAh), 20 W', NULL),
(168, 18, 'Màn hình', '10.9\" Retina IPS LCD', NULL),
(169, 18, 'Hệ điều hành', 'iPadOS 15', NULL),
(170, 18, 'Chip', 'Apple M1', NULL),
(171, 18, 'RAM', '8 GB', NULL),
(172, 18, 'Dung lượng lưu trữ', '64 GB', NULL),
(173, 18, 'Kết nối', '5G, Nghe gọi qua FaceTime', NULL),
(174, 18, 'SIM', '1 Nano SIM & 1 eSIM', NULL),
(175, 18, 'Camera sau', '12 MP', NULL),
(176, 18, 'Camera trước', '12 MP', NULL),
(177, 18, 'Pin, Sạc', '28.6 Wh (~7587 mAh), 20 W', NULL),
(178, 27, 'Màn hình', '8.7\"TFT LCD', NULL),
(179, 27, 'Hệ điều hành', 'Android 11', NULL),
(180, 27, 'Chip', 'MediaTek MT8768T', NULL),
(181, 27, 'RAM', '3 GB', NULL),
(182, 27, 'Dung lượng lưu trữ', '32 GB', NULL),
(183, 27, 'Kết nối', 'Hỗ trợ 4G, Có nghe gọi', NULL),
(184, 27, 'SIM', '1 Nano SIM', NULL),
(185, 27, 'Camera sau', '8 MP', NULL),
(186, 27, 'Camera trước', '2 MP', NULL),
(187, 27, 'Pin, Sạc', '5100 mAh, 15 W', NULL),
(188, 27, 'Hãng', 'Samsung', NULL),
(189, 19, 'Kiểu tủ', 'Multi Door', NULL),
(190, 19, 'Dung tích sử dụng', '488 lít - 4 - 5 người', NULL),
(191, 19, 'Công nghệ tiết kiệm điện', 'Chế độ kỳ nghỉ tiết kiệm điện, Digital Inverter', NULL),
(192, 19, 'Công nghệ làm lạnh', '2 dàn lạnh độc lập Twin Cooling Plus™, Công nghệ làm lạnh No Frost, Làm lạnh nhanh', NULL),
(193, 19, 'Công nghệ kháng khuẩn khử mùi', 'Bộ lọc than hoạt tính Deodorizer', NULL),
(194, 19, 'Công nghệ bảo quản thực phẩm', 'Ngăn rau quả giữ ẩm', NULL),
(195, 19, 'Tiện ích', 'Bảng điều khiển bên ngoài, Chuông báo khi quên đóng cửa, Chế độ kỳ nghỉ, Có khóa, Làm đông nhanh', NULL),
(196, 19, 'Kích thước - Khối lượng', 'Cao 179.3 cm - Rộng 83.3 cm - Sâu 74 cm - Nặng 99 kg', NULL),
(197, 19, 'Nơi sản xuất', 'Trung Quốc', NULL),
(198, 19, 'Năm ra mắt', '2021', NULL),
(199, 19, 'Hãng', 'Samsung', NULL),
(200, 20, 'Kiểu tủ', 'Multi Door', NULL),
(201, 20, 'Dung tích sử dụng', '511 lít - 4 - 5 người', NULL),
(202, 20, 'Công nghệ tiết kiệm điện', 'Chế độ kỳ nghỉ tiết kiệm điện, Origin Inverter', NULL),
(203, 20, 'Công nghệ làm lạnh', 'Công nghệ 2 dàn lạnh độc lập, Tấm hợp kim giữ nhiệt Alloy Cooling', NULL),
(204, 20, 'Công nghệ kháng khuẩn khử mùi', 'Công nghệ PureBio kết hợp tia Plasma', NULL),
(205, 20, 'Công nghệ bảo quản thực phẩm', 'Giữ nguyên hương vị với Flexible Zone, Tăng cường dưỡng chất với Moisture Zone', NULL),
(206, 20, 'Tiện ích', 'Bảng điều khiển bên ngoài, Chuông báo khi quên đóng cửa, Chế độ cấp đông nhanh, Có khóa, Làm lạnh nhanh, Ngăn giữ hương vị không cần rã đông Flexible Zone', NULL),
(207, 20, 'Kích thước - Khối lượng', 'Cao 189.8 cm - Rộng 83.3 cm - Sâu 64.8 cm - Nặng 107 kg', NULL),
(208, 20, 'Nơi sản xuất', 'Trung Quốc', NULL),
(209, 20, 'Năm ra mắt', '2020', NULL),
(210, 20, 'Hãng', 'Toshiba', NULL),
(211, 21, 'Loại nồi', 'Nồi cơm điện tử', NULL),
(212, 21, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(213, 21, 'Công suất', '790 - 940W', NULL),
(214, 21, 'Lòng nồi dày', '1.427 mm, Hợp kim phủ đá Maifan chống dính (Bakuhanseki)', NULL),
(215, 21, 'Điều khiển', 'Nút nhấn có màn hình hiển thị', NULL),
(216, 21, 'Tiện ích', 'Có xửng hấp, Giữ ấm 24 giờ, Hẹn giờ 24 giờ', NULL),
(217, 21, 'Thương hiệu của', 'Hà Lan', NULL),
(218, 21, 'Hãng', 'Philips', NULL),
(219, 22, 'Loại nồi', 'Nồi cơm nắp gài', NULL),
(220, 22, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(221, 22, 'Công suất', '700W', NULL),
(222, 22, 'Lòng nồi dày', '1.5 mm, Hợp kim nhôm phủ chống dính', NULL),
(223, 22, 'Điều khiển', 'Nút gạt', NULL),
(224, 22, 'Tiện ích', 'Có xửng hấp', NULL),
(225, 22, 'Thương hiệu của', 'Singapore', NULL),
(226, 22, 'Hãng', 'BlueStone', NULL),
(227, 23, 'Dung tích tổng', '12 lít', NULL),
(228, 23, 'Dung tích sử dụng', '12 lít', NULL),
(229, 23, 'Điều chỉnh', '80 - 200°C, 0 - 60 phút', NULL),
(230, 23, 'Phụ kiện chính', '2 vỉ nướng, Giỏ chiên, Khay nướng, Khay xiên quay, Tay cầm, Xiên nướng gà', NULL),
(231, 23, 'Chất liệu nồi', 'Khoang lò thép mạ kẽm, Vỏ nhựa ABS', NULL),
(232, 23, 'Công nghệ, công suất', 'Thanh nhiệt điện trở 1800W', NULL),
(233, 23, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(234, 23, 'Bảng điều khiển', 'Nút xoay', NULL),
(235, 23, 'Tiện ích', 'Có đèn báo hoạt động, Nắp kính trong suốt, quan sát được quá trình nấu, Quạt đối lưu, Đèn trong khoang lò', NULL),
(236, 23, 'Năm ra mắt', '2023', NULL),
(237, 23, 'Thương hiệu của', 'Ý', NULL),
(238, 23, 'Hãng', 'Ferroli', NULL),
(239, 24, 'Dung tích tổng', '4 lít', NULL),
(240, 24, 'Dung tích sử dụng', '3.5 lít', NULL),
(241, 24, 'Điều chỉnh', '80 - 200°C, 0 - 30 phút', NULL),
(242, 24, 'Phụ kiện chính', 'Rổ chiên', NULL),
(243, 24, 'Chất liệu nồi', 'Khay chiên phủ chống dính Ceramic', NULL),
(244, 24, 'Công nghệ, công suất', 'Làm nóng điện trở nhiệt 1400W', NULL),
(245, 24, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(246, 24, 'Bảng điều khiển', 'Nút xoay', NULL),
(247, 24, 'Tiện ích', 'Tay cầm bọc nhựa cách nhiệt, Tự ngắt khi quá nhiệt, Tự động ngắt khi kéo lòng nồi', NULL),
(248, 24, 'Năm ra mắt', '2019', NULL),
(249, 24, 'Thương hiệu của', 'Việt Nam', NULL),
(250, 24, 'Hãng', 'Kangaroo', NULL),
(251, 25, 'Loại bếp', 'Bếp từ hồng ngoại, Bếp âm cần lắp CB', NULL),
(252, 25, 'Công suất vùng nấu', 'Hồng ngoại: 2200W - Từ: 2200/3000W', NULL),
(253, 25, 'Chất liệu mặt bếp', 'Kính Ceramic - K+ (Pháp)', NULL),
(254, 25, 'Bảng điều khiển', 'Cảm ứng', NULL),
(255, 25, 'Loại nồi nấu', 'Vùng từ sử dụng nồi có đáy nhiễm từ, vùng hồng ngoại không kén nồi', NULL),
(256, 25, 'Tính năng an toàn', 'Cảnh báo khi không có nồi, Cảnh báo mặt bếp nóng, Khóa bảng điều khiển, Tự ngắt khi bếp nóng quá tải, Tự ngắt khi điện áp quá cao/thấp, Tự tắt bếp khi nước tràn đến bảng điều khiển, Tự tắt khi không sử dụng', NULL),
(257, 25, 'Tiện ích', 'Bảng điều khiển cảm ứng trượt, Chức năng làm nóng nhanh, Có hẹn giờ, Công nghệ Inverter tiết kiệm điện', NULL),
(258, 25, 'Kích thước lỗ đá', 'Ngang 68 cm - Dọc 39 cm', NULL),
(259, 25, 'Thương hiệu của', 'Đức', NULL),
(260, 25, 'Hãng', 'Pramie', NULL),
(261, 26, 'Loại bếp', 'Bếp hồng ngoại 3 vùng nấu, Bếp âm cần lắp CB', NULL),
(262, 26, 'Công suất vùng nấu', 'Trái dưới: 1800W - Trái trên: 1200W - Phải: 1050 - 1950 - 2700W', NULL),
(263, 26, 'Chất liệu mặt bếp', 'Kính Ceramic - Smeg (Ý)', NULL),
(264, 26, 'Bảng điều khiển', 'Cảm ứng', NULL),
(265, 26, 'Loại nồi nấu', 'Tất cả loại nồi', NULL),
(266, 26, 'Tính năng an toàn', 'Cảnh báo mặt bếp nóng, Khóa bảng điều khiển, Tự ngắt khi bếp nóng quá tải, Tự tắt bếp khi nước tràn đến bảng điều khiển', NULL),
(267, 26, 'Tiện ích', 'Có hẹn giờ', NULL),
(268, 26, 'Kích thước lỗ đá', 'Ngang 56 cm - Dọc 49 cm', NULL),
(269, 26, 'Thương hiệu của', 'Ý', NULL),
(270, 26, 'Hãng', 'Smeg', NULL),
(271, 28, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(272, 28, 'Công suất làm lạnh', '1.5 HP - 12.000 BTU', NULL),
(273, 28, 'Phạm vi làm lạnh hiệu quả', 'Từ 15 - 20m² (từ 40 đến 60 m³)', NULL),
(274, 28, 'Lọc bụi, kháng khuẩn, khử mùi', 'Hệ thống làm sạch không khí tích hợp 5 lớp', NULL),
(275, 28, 'Công nghệ tiết kiệm điện', 'EconomyInverter', NULL),
(276, 28, 'Làm lạnh nhanh', 'Super', NULL),
(277, 28, 'Tiện ích', 'Chế độ hoạt động thông minh SmartChế độ vận hành khi ngủChức năng hút ẩmChức năng tự làm sạchChức năng đảo gió 4DCảm biến nhiệt độ iFeelDàn tản nhiệt Blue Fin phủ ion Ag+ kháng khuẩnHoạt động siêu êm QuietHẹn giờ bật tắt máyMàn hình hiển thị nhiệt độ trên dàn lạnhRemote có đèn LEDTự khởi động lại khi có điện', NULL),
(278, 28, 'Tiêu thụ điện', '1.22 kW/h5 sao (Hiệu suất năng lượng 4.66)', NULL),
(279, 28, 'Dàn lạnh', 'Dài 82.2 cm - Cao 25.8 cm - Dày 20.3 cm - Nặng 7.5 kg', NULL),
(280, 28, 'Dàn nóng', 'Dài 72 cm - Cao 48.2 cm - Dày 25.7 cm - Nặng 22.5 kg', NULL),
(281, 29, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(282, 29, 'Công suất làm lạnh', '1.5 HP - 12.000 BTU', NULL),
(283, 29, 'Phạm vi làm lạnh hiệu quả', 'Từ 15 - 20m² (từ 40 đến 60 m³)', NULL),
(284, 29, 'Lọc bụi, kháng khuẩn, khử mùi', 'Bộ lọc Copper Anti-bacteria Filter', NULL),
(285, 29, 'Công nghệ tiết kiệm điện', 'Digital Inverter BoostEco', NULL),
(286, 29, 'Làm lạnh nhanh', 'Fast Cooling', NULL),
(287, 29, 'Tiện ích', 'Chế độ ngủ ngon Good SleepChế độ Wind-Free cho hơi lạnh thoải máiChức năng khử ẩmChức năng tự làm sạch Auto CleanHẹn giờ bật tắt máyMàn hình hiển thị nhiệt độ trên dàn lạnhTự khởi động lại khi có điện', NULL),
(288, 29, 'Tiêu thụ điện', '1.16 kW/h5 sao (Hiệu suất năng lượng 4.60)', NULL),
(289, 29, 'Dàn lạnh', 'Dài 82 cm - Cao 29.9 cm - Dày 21.5 cm - Nặng 9.2 kg', NULL),
(290, 29, 'Dàn nóng', 'Dài 72 cm - Cao 54.8 cm - Dày 26.5 cm - Nặng 22.6 kg', NULL),
(291, 30, 'Loại tivi', 'Smart Tivi QLED75 inch4K', NULL),
(292, 30, 'Hệ điều hành', 'Tizen™', NULL),
(293, 30, 'Ứng dụng phổ biến', 'Amazon Prime videoApple TVClip TVFPT PlayMyTVNetflixSpotifyTrình duyệt webVieONYouTube', NULL),
(294, 30, 'Công nghệ hình ảnh', 'Ambient Mode+Chuyển động mượt Motion Xcelerator Turbo+Chế độ Game Motion PlusChống xé hình FreeSync Premium ProCăn chỉnh hình ảnh tự động bảo vệ mắt EyeComfortGiảm độ trễ chơi game Auto Low Latency Mode (ALLM)Góc nhìn rộng Wide Viewing AngleMàu sắc chuẩn chứng nhận PANTONEQuantum DotQuantum HDR+Real Depth EnhancerSuper Ultra Wide Game View & Game BarSupreme UHD DimmingĐèn nền Direct Full Array 8X 96 vùng kiểm soát', NULL),
(295, 30, 'Điều khiển bằng giọng nói', 'Bixby có tiếng ViệtTìm kiếm giọng nói trên YouTube bằng tiếng Việt', NULL),
(296, 30, 'Remote thông minh', 'One Remote sạc qua USB C & ánh sáng', NULL),
(297, 30, 'Chiếu hình từ điện thoại lên TV', 'AirPlay 2Screen MirroringTap View', NULL),
(298, 30, 'Kích thước', 'Ngang 167.06 cm - Cao 101.89 cm - Dày 31.35 cm', NULL),
(299, 30, 'Năm ra mắt', '2023', NULL),
(300, 30, 'Hãng', 'Samsung', NULL),
(301, 31, 'Loại tivi', 'Google Tivi75 inch4K', NULL),
(302, 31, 'Hệ điều hành', 'Google TV', NULL),
(303, 31, 'Ứng dụng phổ biến', 'FPT PlayGalaxy Play (Fim+)NetflixVieONYouTube', NULL),
(304, 31, 'Công nghệ hình ảnh', 'Dolby VisionGiảm độ trễ chơi game Auto Low Latency Mode (ALLM)HDR10HLGLàm mượt chuyển động XR Motion ClarityNâng cấp hình ảnh 4K X-Reality PROTinh năng Game MenuTính năng chơi game 4K 120fpsTăng cường màu sắc Triluminos ProTăng cường tương phản Dynamic Contrast EnhancerX-tended Dynamic RangeĐồng bộ khung hình/tần số quét chơi game VRR', NULL),
(305, 31, 'Điều khiển bằng giọng nói', 'Google Assistant có tiếng ViệtTìm kiếm giọng nói trên YouTube bằng tiếng Việt', NULL),
(306, 31, 'Remote thông minh', 'Remote tích hợp micro tìm kiếm bằng giọng nói', NULL),
(307, 31, 'Chiếu hình từ điện thoại lên TV', 'AirPlay 2Chromecast', NULL),
(308, 31, 'Kích thước', 'Ngang 167.1 cm - Cao 103.7 cm - Dày 39.9 cm', NULL),
(309, 31, 'Năm ra mắt', '2023', NULL),
(310, 31, 'Hãng', 'Sony', NULL),
(311, 32, 'CPU', 'Apple M3', 'Max300 GB/s memory bandwidth'),
(312, 32, 'RAM', '36 GB', NULL),
(313, 32, 'Ổ cứng', '1 TB SSD', NULL),
(314, 32, 'Màn hình', '14.2\" Liquid Retina XDR display (3024 x 1964)120Hz', NULL),
(315, 32, 'Card màn hình', 'Card tích hợp30 nhân GPU', NULL),
(316, 32, 'Cổng kết nối', '3 x Thunderbolt 4 (hỗ trợ DisplayPort, Thunderbolt 4 (up to 40Gb/s), USB 4 (up to 40Gb/s))HDMIJack tai nghe 3.5 mmMagSafe 3', NULL),
(317, 32, 'Đặc biệt', 'Có đèn bàn phím', NULL),
(318, 32, 'Hệ điều hành', 'macOS Sonoma', NULL),
(319, 32, 'Thiết kế', 'Vỏ nhôm tái chế 100%', NULL),
(320, 32, 'Kích thước, khối lượng', 'Dài 312.6 mm - Rộng 221.2 mm - Dày 15.5 mm - Nặng 1.61 kg', NULL),
(321, 33, 'CPU', 'Apple M1', NULL),
(322, 33, 'RAM', '8 GB', NULL),
(323, 33, 'Ổ cứng', '256 GB SSD', NULL),
(324, 33, 'Màn hình', '13.3\" Retina (2560 x 1600)', NULL),
(325, 33, 'Card màn hình', 'Card tích hợp7 nhân GPU', NULL),
(326, 33, 'Cổng kết nối', '2 x Thunderbolt 3 (USB-C)Jack tai nghe 3.5 mm', NULL),
(327, 33, 'Đặc biệt', 'Có đèn bàn phím', NULL),
(328, 33, 'Hệ điều hành', 'macOS', NULL),
(329, 33, 'Thiết kế', 'Vỏ kim loại nguyên khối', NULL),
(330, 33, 'Kích thước, khối lượng', 'Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 mm đến 16.1 mm - Nặng 1.29 kg', NULL),
(331, 34, 'CPU', 'i3, 1215U, 1.2GHz', NULL),
(332, 34, 'RAM', '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz', NULL),
(333, 34, 'Ổ cứng', '512 GB SSD NVMe PCIe', NULL),
(334, 34, 'Màn hình', '15.6\" Full HD (1920 x 1080)', NULL),
(335, 34, 'Card màn hình', 'Card tích hợp Intel UHD', NULL),
(336, 34, 'Cổng kết nối', '1 x USB Type-C (chỉ hỗ trợ truyền dữ liệu)2 x USB Type-AHDMIJack tai nghe 3.5 mm', NULL),
(337, 34, 'Hệ điều hành', 'Windows 11 Home SL', NULL),
(338, 34, 'Thiết kế', 'Vỏ nhựa', NULL),
(339, 34, 'Kích thước, khối lượng', 'Dài 358.5 mm - Rộng 242 mm - Dày 17.9 mm - Nặng 1.69 kg', NULL),
(340, 34, 'Thời điểm ra mắt', '2023', NULL),
(341, 35, 'Kiểu tủ', 'Ngăn đá trên', NULL),
(342, 35, 'Dung tích sử dụng', '256 lít - 2 - 3 người', NULL),
(343, 35, 'Công nghệ tiết kiệm điện', 'Digital Inverter', NULL),
(344, 35, 'Công nghệ làm lạnh', 'Công nghệ All-around Cooling giúp kiểm soát chặt chẽ sự thay đổi nhiệt độ', NULL),
(345, 35, 'Công nghệ kháng khuẩn khử mùi', 'Bộ lọc than hoạt tính Deodorizer', NULL),
(346, 35, 'Công nghệ bảo quản thực phẩm', 'Ngăn rau củ lớn giữ ẩm Big BoxNgăn đông mềm -1 độ C Optimal Fresh Zone', NULL),
(347, 35, 'Tiện ích', 'Ngăn kéo Easy Slide giúp lấy thực phẩm dễ dàng', NULL),
(348, 35, 'Kích thước - Khối lượng', 'Cao 163.5 cm - Rộng 55.5 cm - Sâu 63.7 cm - Nặng 47.5 kg', NULL),
(349, 35, 'Nơi sản xuất', 'Việt Nam', NULL),
(350, 35, 'Năm ra mắt', '2020', NULL),
(351, 36, 'Kiểu tủ', 'Multi Door', NULL),
(352, 36, 'Dung tích sử dụng', '401 lít - 4 - 5 người', NULL),
(353, 36, 'Công nghệ tiết kiệm điện', 'Chế độ Extra EcoChế độ kỳ nghỉ tiết kiệm điệnJ-tech Inverter', NULL),
(354, 36, 'Công nghệ làm lạnh', 'Làm lạnh đa chiều', NULL),
(355, 36, 'Công nghệ kháng khuẩn khử mùi', 'Bộ lọc với các phân tử Ag+Cu NanoPlasmacluster Ion', NULL),
(356, 36, 'Công nghệ bảo quản thực phẩm', 'Ngăn rau củ giữ ẩm Humidity Control', NULL),
(357, 36, 'Tiện ích', 'Bảng điều khiển bên ngoàiChuông báo khi quên đóng cửaChế độ cấp đông nhanhKhoá trẻ em', NULL),
(358, 36, 'Kích thước - Khối lượng', 'Cao 180 cm - Rộng 79 cm - Sâu 68 cm - Nặng 97 kg', NULL),
(359, 36, 'Nơi sản xuất', 'Trung Quốc', NULL),
(360, 36, 'Năm ra mắt', '2020', NULL),
(361, 37, 'Kiểu tủ', 'Tủ lớn - Side by side', NULL),
(362, 37, 'Dung tích sử dụng', '519 lít - 4 - 5 người', NULL),
(363, 37, 'Công nghệ tiết kiệm điện', 'Linear InverterSmart Inverter', NULL),
(364, 37, 'Công nghệ làm lạnh', 'Làm lạnh đa chiều', NULL),
(365, 37, 'Công nghệ kháng khuẩn khử mùi', 'Bộ lọc khử mùi than hoạt tính', NULL),
(366, 37, 'Công nghệ bảo quản thực phẩm', 'Linear Cooling', NULL),
(367, 37, 'Tiện ích', 'Bảng điều khiển bên ngoài', NULL),
(368, 37, 'Kích thước - Khối lượng', 'Cao 178.6 cm - Rộng 91 cm - Sâu 64.3 cm - Nặng 83 kg', NULL),
(369, 37, 'Nơi sản xuất', 'Trung Quốc', NULL),
(370, 37, 'Năm ra mắt', '2023', NULL),
(371, 38, 'Dung tích tổng', '6 lít', NULL),
(372, 38, 'Dung tích sử dụng', '5.5 lít', NULL),
(373, 38, 'Điều chỉnh', '100 - 200°C0 - 30 phút', NULL),
(374, 38, 'Phụ kiện chính', 'Rổ chiên', NULL),
(375, 38, 'Chất liệu nồi', 'Lòng nồi thép phủ chống dínhVỏ inox 304 và nhựa PP', NULL),
(376, 38, 'Công nghệ, công suất', 'Rapid Air1600W', NULL),
(377, 38, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(378, 38, 'Bảng điều khiển', 'Nút xoay', NULL),
(379, 38, 'Tiện ích', 'Có đèn báo hoạt động Tự ngắt khi quá nhiệt Tự động ngắt khi kéo lòng nồi', NULL),
(380, 38, 'Năm ra mắt', '2021', NULL),
(381, 39, 'Dung tích tổng', '9.5 lít', NULL),
(382, 39, 'Dung tích sử dụng', '9 lít', NULL),
(383, 39, 'Điều chỉnh', '100 - 200°C0 - 30 phút', NULL),
(384, 39, 'Phụ kiện chính', 'Vỉ tách dầu', NULL),
(385, 39, 'Chất liệu nồi', 'Lòng nồi thép phủ chống dínhVỏ inox và nhựa PP', NULL),
(386, 39, 'Công nghệ, công suất', 'Rapid Air1800W', NULL),
(387, 39, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(388, 39, 'Bảng điều khiển', 'Nút xoay', NULL),
(389, 39, 'Tiện ích', 'Có đèn báo hoạt động Quạt đối lưu Tự ngắt khi quá nhiệt', NULL),
(390, 39, 'Năm ra mắt', '2022', NULL),
(391, 40, 'Dung tích tổng', '6.5 lít', NULL),
(392, 40, 'Dung tích sử dụng', '5.5 lít', NULL),
(393, 40, 'Điều chỉnh', '80 - 200°C0 - 60 phút', NULL),
(394, 40, 'Phụ kiện chính', 'Rổ chiên', NULL),
(395, 40, 'Chất liệu nồi', 'Lòng nồi hợp kim nhôm phủ chống dính GreblonVỏ bằng nhựa PP', NULL),
(396, 40, 'Công nghệ, công suất', 'Rapid Air1700W', NULL),
(397, 40, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(398, 40, 'Bảng điều khiển', 'Cảm ứng có màn hình hiển thị', NULL),
(399, 40, 'Tiện ích', '8 chương trình cài đặt sẵn Có thể vệ sinh bằng máy rửa chén Ghi nhớ chương trình nấu Tự ngắt khi quá nhiệt Tự động ngắt khi kéo lòng nồi', NULL),
(400, 40, 'Năm ra mắt', '2020', NULL),
(401, 41, 'Dung tích tổng', '5 lít', NULL),
(402, 41, 'Dung tích sử dụng', '4.5 lít', NULL),
(403, 41, 'Điều chỉnh', '80 - 200°C0 - 60 phút', NULL),
(404, 41, 'Phụ kiện chính', 'Rổ chiên', NULL),
(405, 41, 'Chất liệu nồi', 'Lòng nồi kim loại phủ chống dínhVỏ nhựa chịu nhiệt cao cấp', NULL),
(406, 41, 'Công nghệ, công suất', 'Rapid Air2000W', NULL),
(407, 41, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(408, 41, 'Bảng điều khiển', 'Cảm ứng có màn hình hiển thị', NULL),
(409, 41, 'Tiện ích', '8 chương trình cài đặt sẵn Chân đế chống trượt Tay cầm bọc nhựa cách nhiệt Tính năng tạm dừng Tự ngắt khi quá nhiệt Tự động ngắt khi kéo lòng nồi', NULL),
(410, 41, 'Năm ra mắt', '2019', NULL),
(411, 42, 'Dung tích tổng', '5.5 lít', NULL),
(412, 42, 'Dung tích sử dụng', '5 lít', NULL),
(413, 42, 'Điều chỉnh', '80 - 200°C0 - 60 phút', NULL),
(414, 42, 'Phụ kiện chính', 'Rổ chiên', NULL),
(415, 42, 'Chất liệu nồi', 'Lòng nồi kim loại phủ chống dínhVỏ nhựa và inox', NULL),
(416, 42, 'Công nghệ, công suất', 'Rapid Air2000W', NULL),
(417, 42, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(418, 42, 'Bảng điều khiển', 'Cảm ứng có màn hình hiển thị', NULL),
(419, 42, 'Tiện ích', '8 chương trình cài đặt sẵn Chân đế chống trượt Quạt đối lưu Tự động ngắt khi kéo lòng nồiTự ngắt khi quá nhiệt', NULL),
(420, 42, 'Năm ra mắt', '2020', NULL),
(421, 43, 'Loại máy', 'Cửa trên, Lồng đứng', NULL),
(422, 43, 'Khối lượng giặt', '7 Kg, Từ 2 - 3 người', NULL),
(423, 43, 'Kiểu động cơ', 'Truyền động gián tiếp (dây Curoa)', NULL),
(424, 43, 'Công nghệ giặt', 'Chuyển động giặt đảo chiều gỡ rối quần áo, Chức năng tự cân chỉnh tiết kiệm nước, Công nghệ suy luận ảo Fuzzy Logic, Lồng giặt ngôi sao pha lê, Mâm giặt 864 lỗ tạo tia nước phun ngược ngăn quần áo chạm vào mâm', NULL),
(425, 43, 'Tiện ích', 'Cho phép tùy chỉnh chuyên sâu từng chu trình, Chức năng ghi nhớ các tùy chọn yêu thích, Hẹn giờ bắt đầu giặt, Khóa trẻ em, Nắp máy trợ lực chống kẹt tay, Tự khởi động lại khi có điện, Vệ sinh lồng giặt', NULL),
(426, 43, 'Bảng điều khiển', 'Song ngữ Anh - Việt có nút nhấn', NULL),
(427, 43, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(428, 43, 'Kích thước - Khối lượng', 'Cao 92 cm - Ngang 51.5 cm - Sâu 55 cm - Nặng 33 kg', NULL),
(429, 43, 'Hãng', 'Toshiba', NULL),
(430, 44, 'Loại máy', 'Cửa trước, Lồng ngang, Có Inverter', NULL),
(431, 44, 'Khối lượng giặt', '8.5 Kg, Từ 3 - 5 người', NULL),
(432, 44, 'Kiểu động cơ', 'Truyền động gián tiếp (dây Curoa)', NULL),
(433, 44, 'Công nghệ giặt', 'Công nghệ cân bằng AIDBT, Làm mới quần áo bằng hơi nước Refresh, Lồng giặt lớn 525 mm, Lồng giặt PillowSmart Dual Spray tự làm sạch mặt trong cửa, Vòng đệm cửa kháng khuẩn ABT', NULL),
(434, 44, 'Tiện ích', 'Giặt nhanh 15 phútHẹn giờ giặt, Khóa trẻ em', NULL),
(435, 44, 'Bảng điều khiển', 'Song ngữ Anh - Việt có nút xoay, nút nhấn và màn hình hiển thị', NULL),
(436, 44, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(437, 44, 'Kích thước - Khối lượng', 'Cao 84.1 cm - Ngang 59.5 cm - Sâu 50 cm - Nặng 58 kg', NULL),
(438, 44, 'Hãng', 'Aqua', NULL),
(439, 45, 'Màn hình', 'IPS LCD, 6.56\"HD+', NULL),
(440, 45, 'Hệ điều hành', 'Android 13', NULL),
(441, 45, 'Camera sau', 'Chính 50 MP & Phụ 2 MP', NULL),
(442, 45, 'Camera trước', '5 MP', NULL),
(443, 45, 'Chip', 'MediaTek Helio G85', NULL),
(444, 45, 'RAM', '4 GB', NULL),
(445, 45, 'Dung lượng lưu trữ', '128 GB', NULL),
(446, 45, 'SIM', '2 Nano SIM, Hỗ trợ 4G', NULL),
(447, 45, 'Pin, Sạc', '5000 mAh, 33 W', NULL),
(448, 46, 'Màn hình', 'IPS LCD, 6.64\"Full HD+', NULL),
(449, 46, 'Hệ điều hành', 'Android 13', NULL),
(450, 46, 'Camera sau', 'Chính 50 MP & Phụ 2 MP', NULL),
(451, 46, 'Camera trước', '16 MP', NULL),
(452, 46, 'Chip', 'Snapdragon 680', NULL),
(453, 46, 'RAM', '8 GB', NULL),
(454, 46, 'Dung lượng lưu trữ', '128 GB', NULL),
(455, 46, 'SIM', '2 Nano SIM, Hỗ trợ 4G', NULL),
(456, 46, 'Pin, Sạc', '5000 mAh, 44 W', NULL),
(457, 47, 'Màn hình', 'IPS LCD, 6.74\"HD+', NULL),
(458, 47, 'Hệ điều hành', 'Android 13', NULL),
(459, 47, 'Camera sau', 'Chính 50 MP & Phụ 0.08 MP', NULL),
(460, 47, 'Camera trước', '8 MP', NULL),
(461, 47, 'Chip', 'Unisoc Tiger T612', NULL),
(462, 47, 'RAM', '6 GB', NULL),
(463, 47, 'Dung lượng lưu trữ', '128 GB', NULL),
(464, 47, 'SIM', '2 Nano SIM, Hỗ trợ 4G', NULL),
(465, 47, 'Pin, Sạc', '5000 mAh, 33 W', NULL),
(466, 48, 'Màn hình', '11\", TFT LCD', NULL),
(467, 48, 'Hệ điều hành', 'Android 13', NULL),
(468, 48, 'Chip', 'Snapdragon 695', NULL),
(469, 48, 'RAM', '4 GB', NULL),
(470, 48, 'Dung lượng lưu trữ', '64 GB', NULL),
(471, 48, 'Kết nối', '5G, Có nghe gọi', NULL),
(472, 48, 'SIM', '1 Nano SIM', NULL),
(473, 48, 'Camera sau', '8 MP', NULL),
(474, 48, 'Camera trước', '5 MP', NULL),
(475, 48, 'Pin, Sạc', '7040 mAh, 15 W', NULL),
(476, 48, 'Hãng', 'Samsung', NULL),
(477, 49, 'Màn hình', '11\", IPS LCD', NULL),
(478, 49, 'Hệ điều hành', 'Android 13', NULL),
(479, 49, 'Chip', 'Snapdragon 680 8 nhân', NULL),
(480, 49, 'RAM', '4 GB', NULL),
(481, 49, 'Dung lượng lưu trữ', '128 GB', NULL),
(482, 49, 'Camera sau', '8 MP', NULL),
(483, 49, 'Camera trước', '5 MP', NULL),
(484, 49, 'Pin, Sạc', '8000 mAh, 10 W', NULL),
(485, 50, 'Màn hình', '12.9\", Liquid Retina XDR', NULL),
(486, 50, 'Hệ điều hành', 'iPadOS 16', NULL),
(487, 50, 'Chip', 'Apple M2 8 nhân', NULL),
(488, 50, 'RAM', '8 GB', NULL),
(489, 50, 'Dung lượng lưu trữ', '512 GB', NULL),
(490, 50, 'Kết nối', 'Nghe gọi qua FaceTime', NULL),
(491, 50, 'Camera sau', 'Chính 12 MP & Phụ 10 MP, TOF 3D LiDAR', NULL),
(492, 50, 'Camera trước', '12 MP', NULL),
(493, 50, 'Pin, Sạc', '40.88 Wh (~ 10.835 mAh), 20 W', NULL),
(494, 51, 'Màn hình', '10.1\"IPS LCD', NULL),
(495, 51, 'Hệ điều hành', 'Android 11', NULL),
(496, 51, 'Chip', 'Unisoc T610', NULL),
(497, 51, 'RAM', '3 GB', NULL),
(498, 51, 'Dung lượng lưu trữ', '32 GB', NULL),
(499, 51, 'Kết nối', 'Hỗ trợ 4G, Có nghe gọi', NULL),
(500, 51, 'SIM', '1 Nano SIM', NULL),
(501, 51, 'Camera sau', '8 MP', NULL),
(502, 51, 'Camera trước', '5 MP', NULL),
(503, 51, 'Pin, Sạc', '5000 mAh, 10 W', NULL),
(504, 52, 'Loại nồi', 'Nồi cơm điện tử', NULL),
(505, 52, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(506, 52, 'Công suất', '835W', NULL),
(507, 52, 'Lòng nồi dày', '1.183 mm, Nhôm phủ chống dính', NULL),
(508, 52, 'Điều khiển', 'Nút nhấn có màn hình hiển thị', NULL),
(509, 52, 'Tiện ích', 'Có xửng hấp, Giữ ấm 12 giờHẹn giờ 24 giờ', NULL),
(510, 52, 'Thương hiệu của', 'Nhật Bản', NULL),
(511, 52, 'Hãng', 'Sharp', NULL),
(512, 53, 'Loại nồi', 'Nồi cơm điện tử', NULL),
(513, 53, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(514, 53, 'Công suất', '790W', NULL),
(515, 53, 'Lòng nồi dày', '2.2 mmHợp kim nhôm phủ chống dính', NULL),
(516, 53, 'Điều khiển', 'Nút nhấn có màn hình hiển thị', NULL),
(517, 53, 'Tiện ích', 'Có xửng hấp, Giữ ấm 24 giờ, Hẹn giờ đến 15 giờ', NULL),
(518, 53, 'Thương hiệu của', 'Nhật Bản', NULL),
(519, 53, 'Hãng', 'Sharp', NULL),
(520, 54, 'Loại nồi', 'Nồi cơm điện tử', NULL),
(521, 54, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(522, 54, 'Công suất', '800W', NULL),
(523, 54, 'Lòng nồi dày', '4 mm, Hợp kim nhôm phủ chống dính', NULL),
(524, 54, 'Điều khiển', 'Nút nhấn có màn hình hiển thị', NULL),
(525, 54, 'Tiện ích', 'Có xửng hấp, Giữ ấm lên đến 30 giờ, Hẹn giờ 24 giờ', NULL),
(526, 54, 'Thương hiệu của', 'Nhật Bản', NULL),
(527, 54, 'Hãng', 'Toshiba', NULL),
(528, 55, 'Loại bếp', 'Bếp từ đôi, Bếp âm cần lắp CB', NULL),
(529, 55, 'Công suất vùng nấu', 'Trái: 2000W - Phải: 2000W', NULL),
(530, 55, 'Chất liệu mặt bếp', 'Kính Ceramic', NULL),
(531, 55, 'Bảng điều khiển', 'Cảm ứng', NULL),
(532, 55, 'Loại nồi nấu', 'Chỉ sử dụng loại nồi có đế nhiễm từ', NULL),
(533, 55, 'Tính năng an toàn', 'Khóa bảng điều khiển, Tự ngắt khi bếp nóng quá tải', NULL),
(534, 55, 'Tiện ích', 'Có hẹn giờ', NULL),
(535, 55, 'Kích thước lỗ đá', 'Ngang 69.5 cm - Dọc 39.5 cm', NULL),
(536, 55, 'Thương hiệu của', 'Singapore', NULL),
(537, 55, 'Hãng', 'BlueStone', NULL),
(538, 56, 'Loại bếp', 'Bếp từ đôi, Bếp âm cần lắp CB', NULL),
(539, 56, 'Công suất vùng nấu', 'Trái: 2000/2200W - Phải: 2000/2200W', NULL),
(540, 56, 'Chất liệu mặt bếp', 'Kính Ceramic - Schott Ceran (Đức)', NULL),
(541, 56, 'Bảng điều khiển', 'Cảm ứng', NULL),
(542, 56, 'Loại nồi nấu', 'Chỉ sử dụng loại nồi có đế nhiễm từ', NULL),
(543, 56, 'Tính năng an toàn', 'Cảnh báo mặt bếp nóng, Cảnh báo nồi chảo không phù hợp, Khóa bảng điều khiển, Tự ngắt khi không có nồi, Tự nhận diện kích cỡ đáy nồi', NULL),
(544, 56, 'Tiện ích', 'Bảng điều khiển cảm ứng trượt, Chức năng làm nóng nhanh, Có hẹn giờ, Công nghệ Inverter tiết kiệm điện', NULL),
(545, 56, 'Kích thước lỗ đá', 'Ngang 68 cm - Dọc 38 cm', NULL),
(546, 56, 'Thương hiệu của', 'Đức', NULL),
(547, 56, 'Hãng', 'Hafele', NULL),
(548, 57, 'Loại bếp', 'Bếp từ hồng ngoại, Bếp âm cần lắp CB', NULL),
(549, 57, 'Công suất vùng nấu', 'Trái (Từ): 2000/2400W - Phải (Hồng ngoại): 2000W', NULL),
(550, 57, 'Chất liệu mặt bếp', 'Mặt kính Crystal - Trung Quốc', NULL),
(551, 57, 'Bảng điều khiển', 'Cảm ứng', NULL),
(552, 57, 'Loại nồi nấu', 'Vùng từ sử dụng nồi có đáy nhiễm từ, vùng hồng ngoại không kén nồi', NULL),
(553, 57, 'Tính năng an toàn', 'Cảnh báo nồi chảo không phù hợp, Khóa bảng điều khiển, Tính năng dừng bếp tạm thời, Tự ngắt khi bếp nóng quá tải, Tự ngắt khi không có nồi, Tự nhận diện kích cỡ đáy nồi', NULL),
(554, 57, 'Tiện ích', 'Bảng điều khiển cảm ứng trượt, Chức năng làm nóng nhanh, Có hẹn giờ', NULL),
(555, 57, 'Kích thước lỗ đá', 'Ngang 67.5 cm - Dọc 40.5 cm', NULL),
(556, 57, 'Thương hiệu của', 'Việt Nam', NULL),
(557, 57, 'Hãng', 'Kangaroo', NULL),
(571, 58, 'Loại tivi', 'Smart TV NanoCell75 inch4K', NULL),
(572, 58, 'Hệ điều hành', 'WebOS 22', NULL),
(573, 58, 'Ứng dụng phổ biến', 'Clip TVFPT PlayGalaxy Play (Fim+)MyTVNetflixNhaccuatuiPOPS KidsSpotifyTrình duyệt webTV 360VieONVTVcab ONYouTubeYouTube Kids', NULL),
(574, 58, 'Công nghệ hình ảnh', 'Active HDRChế độ game HGiGChế độ hình ảnh phù hợp nội dungDải màu rộng Nano ColorGiảm độ trễ chơi game Auto Low Latency Mode (ALLM)HDR Dynamic Tone MappingHDR10 ProHLGNâng cấp hình ảnh AI Picture Pro 4KNâng cấp độ phân giải 4K AI UpscalingTương thích bộ mã hóa Video decoder (VP9, AV1)Tương thích HEVC', NULL),
(575, 58, 'Điều khiển bằng giọng nói', 'Alexa (Chưa có tiếng Việt)Google Assistant (Chưa có tiếng Việt)LG Voice Search - tìm kiếm bằng giọng nói tiếng ViệtNhận diện giọng nói LG Voice RecognitionTìm kiếm giọng nói trên YouTube bằng tiếng Việt', NULL),
(576, 58, 'Remote thông minh', 'Magic Remote', NULL),
(577, 58, 'Chiếu hình từ điện thoại lên TV', 'AirPlay 2Screen Share', NULL),
(578, 58, 'Kích thước', 'Ngang 167.8 cm - Cao 104.5 cm - Dày 37.8 cm', NULL),
(579, 58, 'Năm ra mắt', '2022', NULL),
(580, 58, 'Hãng', 'LG', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_imgs`
--

CREATE TABLE `product_imgs` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product_imgs`
--

INSERT INTO `product_imgs` (`image_id`, `product_id`, `image_name`, `image_is_display`) VALUES
(1, 1, 'P1_1.jpg', 1),
(6, 2, 'P2_1.jpg', 1),
(11, 3, 'P3_1.jpg', 1),
(16, 4, 'P4_1.jpg', 1),
(21, 5, 'P5_1.jpg', 1),
(26, 6, 'P6_1.jpg', 1),
(31, 7, 'P7_1.jpg', 1),
(36, 8, 'P8_1.jpg', 1),
(41, 9, 'P9_1.jpg', 1),
(46, 10, 'P10_1.jpg', 1),
(51, 11, 'P11_1.jpg', 1),
(56, 12, 'P12_1.jpg', 1),
(61, 13, 'P13_1.jpg', 1),
(71, 15, 'P15_1.jpg', 1),
(76, 16, 'P16_1.jpg', 1),
(81, 17, 'P17_1.jpg', 1),
(86, 18, 'P18_1.jpg', 1),
(91, 19, 'P19_1.jpg', 1),
(96, 20, 'P20_1.jpg', 1),
(101, 21, 'P21_1.jpg', 1),
(106, 22, 'P22_1.jpg', 1),
(111, 23, 'P23_1.jpg', 1),
(116, 24, 'P24_1.jpg', 1),
(121, 25, 'P25_1.jpg', 1),
(126, 26, 'P26_1.jpg', 1),
(131, 27, 'P27_1.jpg', 1),
(136, 28, 'P28_1.jpg', 1),
(141, 29, 'P29_1.jpg', 1),
(146, 30, 'P30_1.jpg', 1),
(151, 31, 'P31_1.jpg', 1),
(161, 32, 'P32_1.jpg', 1),
(166, 33, 'P33_1.jpg', 1),
(171, 34, 'P34_1.jpg', 1),
(176, 35, 'P35_1.jpg', 1),
(181, 36, 'P36_1.jpg', 1),
(186, 37, 'P37_1.jpg', 1),
(191, 38, 'P38_1.jpg', 1),
(196, 39, 'P39_1.jpg', 1),
(201, 40, 'P40_1.jpg', 1),
(206, 41, 'P41_1.jpg', 1),
(211, 42, 'P42_1.jpg', 1),
(216, 43, 'P43_1.jpg', 1),
(221, 44, 'P44_1.jpg', 1),
(226, 45, 'P45_1.jpg', 1),
(231, 46, 'P46_1.jpg', 1),
(236, 47, 'P47_1.jpg', 1),
(241, 48, 'P48_1.jpg', 1),
(246, 49, 'P49_1.jpg', 1),
(251, 50, 'P50_1.jpg', 1),
(256, 51, 'P51_1.png', 1),
(261, 52, 'P52_1.jpg', 1),
(266, 53, 'P53_1.jpg', 1),
(271, 54, 'P54_1.jpg', 1),
(276, 55, 'P55_1.jpg', 1),
(281, 56, 'P56_1.jpg', 1),
(286, 57, 'P57_1.jpg', 1),
(291, 58, 'P58_1.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_variants`
--

CREATE TABLE `product_variants` (
  `product_variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `product_variant_name` varchar(100) NOT NULL,
  `product_variant_price` float NOT NULL,
  `product_variant_available` int(11) NOT NULL,
  `product_variant_is_stock` tinyint(1) DEFAULT NULL,
  `product_variant_is_bestseller` tinyint(1) DEFAULT NULL,
  `product_variant_added_date` date NOT NULL DEFAULT current_timestamp(),
  `product_variant_is_display` tinyint(1) NOT NULL DEFAULT 1,
  `unit` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product_variants`
--

INSERT INTO `product_variants` (`product_variant_id`, `product_id`, `discount_id`, `product_variant_name`, `product_variant_price`, `product_variant_available`, `product_variant_is_stock`, `product_variant_is_bestseller`, `product_variant_added_date`, `product_variant_is_display`, `unit`) VALUES
(1, 1, 1, '1 gói ', 11000, 100, 1, 0, '2023-11-18', 1, '1 gói'),
(2, 2, 1, '1 gói', 12000, 200, 1, 0, '2023-11-18', 1, '1 gói'),
(3, 3, 1, '1 gói ', 12000, 100, 1, 1, '2023-11-18', 1, '1 gói'),
(4, 4, 1, '1 gói ', 12000, 200, 1, 0, '2023-11-18', 1, '1 gói'),
(5, 5, 1, '1 gói', 8000, 100, 1, 1, '2023-11-18', 1, '1 túi 1kg'),
(6, 6, 2, '1 gói ', 5000, 100, 1, 1, '2023-11-18', 1, '1 gói'),
(7, 7, 2, '1 gói ', 4000, 100, 1, 1, '2023-11-18', 1, '1 gói'),
(8, 8, 2, '1 gói', 8000, 100, 1, 1, '2023-11-18', 1, '1 gói'),
(9, 9, 2, '1 gói ', 5000, 100, 1, 1, '2023-11-18', 1, '1 gói'),
(10, 10, 2, '1 gói ', 7000, 100, 1, 1, '2023-11-18', 1, '1 gói'),
(11, 11, 3, '1 kg', 45000, 100, 1, 1, '2023-11-18', 1, '1 kg'),
(12, 12, 3, '1 kg', 45000, 100, 1, 1, '2023-11-18', 1, '1 kg'),
(13, 13, 4, '1 túi', 100000, 100, 1, 1, '2023-11-18', 1, '1 túi'),
(17, 15, 5, '1 túi', 410000, 100, 1, 1, '2023-11-18', 1, '1 túi 1kg'),
(18, 16, 5, '1 túi', 250000, 100, 1, 1, '2023-11-18', 1, '1 túi 1kg'),
(19, 17, 6, '1 hộp', 50000, 100, 1, 1, '2023-11-18', 1, '1 hộp'),
(22, 18, 6, '1 gói', 40000, 100, 1, 1, '2023-11-18', 1, '1 hộp'),
(24, 27, 6, '1 hộp', 40000, 100, 1, 0, '2023-11-18', 1, '1 hộp'),
(25, 19, 7, '1 gói ', 10000, 100, 1, 1, '2023-11-18', 1, '1 gói'),
(26, 20, 7, '1 gói', 10000, 100, 1, 1, '2023-11-18', 1, '1 gói'),
(27, 21, 8, '4 hộp', 50000, 100, 1, 1, '2023-11-18', 1, '4 hộp'),
(28, 22, 8, '4 hộp', 50000, 100, 1, 1, '2023-11-18', 1, '4 hộp'),
(29, 23, 9, '1 lon', 15000, 100, 1, 1, '2023-11-18', 1, '1 lon'),
(30, 24, 9, '1 lon', 15000, 100, 1, 1, '2023-11-18', 1, '1 lon'),
(32, 25, 10, '1 chai', 20000, 100, 1, 1, '2023-11-18', 1, '1 chai'),
(33, 26, 10, '1 chai', 20000, 100, 1, 1, '2023-11-18', 1, '1 chai'),
(34, 28, 1, '1 gói', 12000, 120, 1, 0, '2023-12-02', 1, '1 gói'),
(37, 29, 2, '1 túi', 10000, 50, 1, 1, '2023-12-02', 1, '1 gói'),
(38, 30, 6, '1 kg', 150000, 10, 1, 1, '2023-12-02', 1, '1 kg'),
(41, 31, 6, '1 kg', 45000, 4, 1, 1, '2023-12-02', 1, '1 kg'),
(42, 32, 11, '1 túi', 400000, 10, 1, 1, '2023-12-02', 1, ''),
(44, 33, 2, '1 túi', 340000, 10, 1, 1, '2023-12-02', 1, ''),
(47, 43, 1, '1 gói ', 11000, 100, 1, 1, '2023-11-19', 1, '1 gói'),
(49, 44, 1, '1 gói', 6000, 100, 1, 1, '2023-11-19', 1, '1 gói'),
(51, 50, 3, '1 hộp', 40000, 100, 1, 1, '2023-11-19', 1, '1 hộp'),
(52, 52, 4, '4 hộp', 50000, 100, 1, 1, '2023-11-19', 1, '4 hộp'),
(55, 53, 4, '4 hộp', 40000, 100, 1, 1, '2023-11-19', 1, '4 hộp'),
(57, 55, 5, '1 chai', 20000, 50, 1, 1, '2023-11-19', 1, '1 chai'),
(58, 45, 2, '1kg ', 50000, 100, 1, 1, '2023-11-19', 1, ''),
(59, 46, 2, '1 kg', 100000, 100, 1, 1, '2023-11-19', 1, '1 túi'),
(60, 47, 2, '1 kg', 389000, 100, 1, 1, '2023-11-19', 1, ''),
(61, 48, 3, '1 hộp', 30000, 100, 1, 1, '2023-11-19', 1, '1 hộp'),
(62, 49, 3, '1 hộp', 40000, 100, 1, 1, '2023-11-19', 1, '1 hộp'),
(63, 51, 3, '1 hộp', 40000, 100, 1, 1, '2023-11-19', 1, '1 hộp'),
(64, 54, 4, '4 hộp', 50000, 100, 1, 1, '2023-11-19', 1, '4 hộp'),
(65, 56, 5, '1 chai', 20000, 50, 1, 1, '2023-11-19', 1, '1 chai'),
(66, 57, 5, '1 chai', 20000, 50, 1, 1, '2023-11-19', 1, '1 chai'),
(67, 34, 11, '1 túi', 160000, 100, 1, 1, '2023-12-02', 1, ''),
(68, 35, 11, '1 gói', 10000, 100, 1, 0, '2023-12-02', 1, '1 gói'),
(71, 36, 2, '1 gói ', 30000, 10, 1, 0, '2023-12-02', 1, '1 gói'),
(72, 37, 2, '1 gói  ', 20000, 10, 1, 1, '2023-12-02', 1, '1 gói'),
(73, 38, 11, '1 chai', 10000, 100, 1, 0, '2023-12-02', 1, '1 lon'),
(74, 39, 11, '1 lon', 15000, 20, 1, 1, '2023-12-02', 1, '1 lon'),
(75, 40, 11, '1 chai', 15000, 30, 1, 1, '2023-12-02', 1, '1 lon'),
(76, 41, 11, '1 lon', 20000, 40, 1, 0, '2023-12-02', 1, '1 lon'),
(77, 42, 11, '1 lon', 15000, 44, 1, 1, '2023-12-02', 1, '1 lon'),
(78, 58, 11, '1 kg', 30000, 100, 1, 0, '2023-12-02', 1, '1 kg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `staff_role` varchar(100) NOT NULL,
  `staff_description` text DEFAULT NULL,
  `staff_added_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `staffs`
--

INSERT INTO `staffs` (`staff_id`, `user_id`, `staff_role`, `staff_description`, `staff_added_date`) VALUES
(1, 11, 'Giám đốc', 'Chịu trách nhiệm quản lý chung công ty', '2026-11-27'),
(2, 12, 'Trưởng phòng kinh doanh', 'Chịu trách nhiệm quản lý hoạt động kinh doanh của công ty', '2026-11-27'),
(3, 13, 'Nhân viên kinh doanh', 'Chịu trách nhiệm bán hàng và phát triển khách hàng', '2026-11-27'),
(4, 14, 'Nhân viên kỹ thuật', 'Chịu trách nhiệm hỗ trợ kỹ thuật cho khách hàng', '2026-11-27'),
(5, 15, 'Nhân viên chăm sóc khách hàng', 'Chịu trách nhiệm chăm sóc khách hàng và giải quyết các vấn đề của khách hàng', '2026-11-27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_logo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `supplier_logo`) VALUES
(1, 'Samsung', 'samung.png'),
(2, 'Sony', 'sony.png'),
(3, 'LG', 'lg.png'),
(4, 'Casper', 'casper.png'),
(5, 'TCL', 'tcl.png'),
(6, 'Sharp', 'sharp.png'),
(7, 'TOSHIBA', 'toshiba.png'),
(8, 'Xiaomi', 'xiaomi.png'),
(9, 'AQUA', 'aqua.png'),
(10, 'Panasonic', 'panasonic.png'),
(11, 'Funiki', 'funiki.png'),
(12, 'BOSCH', 'bosch.png'),
(13, 'BlueStone', 'blustone.png'),
(14, 'Kangaroo', 'kangaroo.png'),
(15, 'Philips', 'philips.png'),
(16, 'Pramie', 'pramie.png'),
(17, 'Media', 'media.png'),
(18, 'Whirlpool', 'whirlpool.png'),
(19, 'Ferroli', 'ferroli.png'),
(20, 'Smeg', 'smeg.png'),
(21, 'iPhone', 'iphone.png'),
(22, 'OPPO\r\n', 'oppo.png'),
(23, 'vivo', 'vivo.png'),
(24, 'SunHouse', 'sunhouse.png'),
(25, 'realme', 'realme.png'),
(26, 'beko', 'beko.png'),
(27, 'HITACHI', 'hitachi.png'),
(28, 'Bear', 'bear.png'),
(29, 'CRYSTAL', 'crystal.png'),
(30, 'LOCK&LOCK', 'lockvslock.png'),
(31, 'CUCKOO', 'cuckoo.png'),
(32, 'hp', 'hp.png'),
(33, 'Lenovo', 'lenovo.png'),
(34, 'MacBook', 'macbook.png'),
(35, 'msi', 'msi.png'),
(36, 'DELL', 'dell.png'),
(37, 'ASUS', 'asus.png'),
(38, 'iPad', 'ipad.png'),
(39, 'Masstel', 'masstel.png'),
(40, 'Hafele', 'hafele.png'),
(41, 'DAIKIN', 'daikin.png'),
(42, 'Nagakawa', 'nagakawa.png'),
(43, 'Acer', 'acer.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_login_name` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_avt_img` varchar(100) DEFAULT NULL,
  `user_birth` date DEFAULT NULL,
  `user_sex` enum('Nữ','Nam') DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone` char(10) NOT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_register_date` date NOT NULL DEFAULT current_timestamp(),
  `user_active` tinyint(1) NOT NULL DEFAULT 1,
  `user_status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_login_name`, `user_password`, `user_name`, `user_avt_img`, `user_birth`, `user_sex`, `user_email`, `user_phone`, `user_address`, `user_register_date`, `user_active`, `user_status`) VALUES
(1, '0987654321', '$2a$08$z6uK/g62SytTVamrrt.9J.C3uDPoqNVN.fl0ZVARVuDu.WAtQcuv2', 'Phan Nguyễn Hải Yến', NULL, '2023-12-05', 'Nữ', 'haiyen@gmail.com', '0987654321', 'Hà Nội', '2023-08-01', 1, 1),
(2, '0987654322', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Trần Thị Bình', NULL, '1991-02-02', 'Nữ', 'user2@example.com', '0987654322', 'Hà Nội', '2023-01-01', 1, 1),
(3, '0987654323', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Lê Quang Yên', NULL, '1990-01-01', 'Nam', 'user3@example.com', '0987654323', 'Hà Nội', '2023-01-01', 1, 1),
(4, '0987654324', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Trương Quang Phú', NULL, '1990-01-01', 'Nam', 'user4@example.com', '0987654324', 'Hà Nội', '2023-01-01', 1, 1),
(5, '0987654325', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Trần Thiên Lộc', NULL, '1990-01-01', 'Nam', 'user5@example.com', '0987654325', 'Hà Nội', '2023-01-01', 1, 1),
(6, '0987654326', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Nguyễn Phú Cường', NULL, '1999-03-03', 'Nam', 'user6@example.com', '0987654326', 'Hà Nội', '2023-01-01', 1, 1),
(7, '0987654327', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Phan Thanh Danh', NULL, '1999-03-03', 'Nam', 'user7@example.com', '0987654327', 'Hà Nội', '2023-01-01', 1, 1),
(8, '0987654328', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Mai Văn Tiên', NULL, '1999-03-03', 'Nam', 'user8@example.com', '0987654328', 'Hà Nội', '2023-01-01', 1, 1),
(9, '0987654329', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Tô Thanh Lộc', NULL, '1999-03-03', 'Nam', 'user9@example.com', '0987654329', 'Hà Nội', '2023-01-01', 1, 1),
(10, '0987654330', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Nguyễn Nhựt Tiến', NULL, '1999-03-03', 'Nam', 'user10@example.com', '0987654330', 'Hà Nội', '2023-01-01', 1, 1),
(11, '0987654331', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Lý Văn Nghĩa', NULL, '1999-03-03', 'Nam', 'user11@example.com', '0987654331', 'Hà Nội', '2023-01-01', 1, 1),
(12, '0987654332', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Hồ Thị Mai', NULL, '1999-03-03', 'Nữ', 'user12@example.com', '0987654332', 'Hà Nội', '2023-01-01', 1, 1),
(13, '0987654333', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Lê Bích Tuyền', NULL, '1999-03-03', 'Nữ', 'user13@example.com', '0987654333', 'Hà Nội', '2023-01-01', 1, 1),
(14, '0987654334', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Lê Hồng Bảo Trinh', NULL, '1999-03-03', 'Nữ', 'user14@example.com', '0987654334', 'Hà Nội', '2023-01-01', 1, 1),
(15, '0987654335', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Nguyễn Hoàng PHương Linh', NULL, '1999-03-03', 'Nữ', 'user15@example.com', '0987654335', 'Hà Nội', '2023-01-01', 1, 1),
(31, '0987296708', '$2a$08$YzCffpozMPsdIMzoZ21M7.lbdOBdOgCobDdKZaZpU8u6RgUeb9zUm', 'Hồng Nhung', NULL, '1999-03-03', 'Nữ', 'Nhung@gmail.com', '0987296708', 'Hà Nội', '2023-12-15', 1, 1),
(32, '0997654321', '$2a$08$m34kubjtYr2Hd5YufiNuUOTkGX92FjTKJ6dklXfgFKiWdCA7fRc.e', 'Nguyễn Thị Lan', NULL, '1999-03-03', 'Nữ', 'Lan@gmail.com', '0997654321', 'Hà Nội', '2023-12-15', 1, 1),
(33, '0887654321', '$2a$08$EX.tL8w9RDCIXlHXR8/yIuzFkaUFqPDiNuE7vZJCNxzD5u1f5KzcK', 'Nguyễn Linh Phương', NULL, '1999-03-03', 'Nữ', 'linhphuong@gmail.com', '0887654321', 'Hà Nội', '2023-12-15', 1, 1),
(34, '0987345654', '$2a$08$F/uleYn4DBgKcH5IngVO6eeTLT7axfVSCFivAwjKwlFq2Jny9TfBW', 'Lê Văn Minh', NULL, '2004-07-13', 'Nam', 'minhlv@gmail.com', '0987345654', 'Hà Nội', '2026-04-07', 1, 1),
(35, '0999777555', '$2a$08$JNKSzto/dDCAS4ali0hlJuso2I2yQEK6WwYJYKMu/oCfODfcrBhUe', 'Minh Lê Văn', NULL, '2016-04-13', 'Nam', 'lminh1371412@gmail.com', '0999777555', 'Hà Nội', '2026-04-15', 1, 0),
(37, '0987789987', '$2a$08$T39pvknm1bfjmTnSZ.zSA.6Oievhzf6s4Gskg3ciZFj3jaAW3EeuK', 'Nguyễn Văn Mạnh ', NULL, '2026-04-10', 'Nam', 'lminh@gmail.com', '0987789987', 'Hà Nội', '2026-04-21', 1, 1);

--
-- Bẫy `users`
--
DELIMITER $$
CREATE TRIGGER `after_insert_users` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO customers (user_id)
    VALUES (NEW.user_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_notification`
--

CREATE TABLE `user_notification` (
  `user_id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `user_notification_is_read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user_notification`
--

INSERT INTO `user_notification` (`user_id`, `notification_id`, `user_notification_is_read`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(2, 1, 0),
(2, 2, 0),
(2, 3, 0),
(2, 4, 0),
(2, 6, 0),
(3, 6, 0),
(4, 6, 0),
(5, 6, 0),
(6, 6, 0),
(7, 6, 0),
(8, 6, 0),
(9, 6, 0),
(10, 6, 0);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_cart`
-- (See below for the actual view)
--
CREATE TABLE `view_cart` (
`customer_id` int(11)
,`cart_quantity` int(11)
,`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`product_period` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`discount_amount` float
,`discount_description` text
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_cate_admin`
-- (See below for the actual view)
--
CREATE TABLE `view_cate_admin` (
`category_id` int(11)
,`category_name` varchar(100)
,`category_img` varchar(100)
,`categorry_type` varchar(50)
,`category_added_date` date
,`category_is_display` tinyint(1)
,`product_count` bigint(21)
,`revenue` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_count_cart`
-- (See below for the actual view)
--
CREATE TABLE `view_count_cart` (
`customer_id` int(11)
,`user_id` int(11)
,`count_cart` bigint(21)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_dashboard`
-- (See below for the actual view)
--
CREATE TABLE `view_dashboard` (
`customer_count` bigint(21)
,`quantity_sold` decimal(42,0)
,`revenue` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_discounts`
-- (See below for the actual view)
--
CREATE TABLE `view_discounts` (
`discount_id` int(11)
,`discount_name` varchar(100)
,`discount_description` text
,`discount_start_date` date
,`discount_end_date` date
,`discount_amount` float
,`discount_is_display` tinyint(1)
,`discount_img` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_getchart_revenue`
-- (See below for the actual view)
--
CREATE TABLE `view_getchart_revenue` (
`year` int(4)
,`month` int(2)
,`order_success` bigint(21)
,`revenue` decimal(32,0)
,`order_cancel` bigint(21)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_getchart_top5_product`
-- (See below for the actual view)
--
CREATE TABLE `view_getchart_top5_product` (
`product_variant_id` int(11)
,`quantity_sold` decimal(32,0)
,`revenue` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_notifications`
-- (See below for the actual view)
--
CREATE TABLE `view_notifications` (
`notification_id` int(11)
,`notification_type_id` int(11)
,`notification_title` varchar(100)
,`notification_subtitle` text
,`notification_content` text
,`notification_date` date
,`notification_is_display` tinyint(1)
,`user_id` int(11)
,`user_notification_is_read` tinyint(1)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_order`
-- (See below for the actual view)
--
CREATE TABLE `view_order` (
`order_id` int(11)
,`customer_id` int(11)
,`staff_id` int(11)
,`order_name` varchar(100)
,`order_phone` varchar(10)
,`order_date` date
,`order_delivery_date` date
,`order_delivery_address` varchar(100)
,`order_note` text
,`order_total_before` int(11)
,`order_total_after` int(11)
,`paying_method_id` int(11)
,`order_paying_date` date
,`order_is_paid` tinyint(1)
,`order_status` enum('Chờ thanh toán','Đang giao hàng','Hoàn thành','Đã hủy')
,`paying_method_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_orders`
-- (See below for the actual view)
--
CREATE TABLE `view_orders` (
`order_id` int(11)
,`customer_id` int(11)
,`staff_id` int(11)
,`order_name` varchar(100)
,`order_phone` varchar(10)
,`order_date` date
,`order_delivery_date` date
,`order_delivery_address` varchar(100)
,`order_note` text
,`order_total_before` int(11)
,`order_total_after` int(11)
,`paying_method_id` int(11)
,`order_paying_date` date
,`order_is_paid` tinyint(1)
,`order_status` enum('Chờ thanh toán','Đang giao hàng','Hoàn thành','Đã hủy')
,`paying_method_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_order_detail`
-- (See below for the actual view)
--
CREATE TABLE `view_order_detail` (
`order_id` int(11)
,`product_variant_id` int(11)
,`order_detail_quantity` int(11)
,`order_detail_price_before` int(11)
,`order_detail_price_after` int(11)
,`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_variant_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_products_admin`
-- (See below for the actual view)
--
CREATE TABLE `view_products_admin` (
`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`product_period` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`discount_amount` float
,`discount_description` text
,`product_count` bigint(21)
,`quantity_sold` decimal(42,0)
,`revenue` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_products_info`
-- (See below for the actual view)
--
CREATE TABLE `view_products_info` (
`product_id` int(11)
,`category_id` int(11)
,`product_name` varchar(100)
,`supplier_id` int(11)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_description` text
,`product_period` int(11)
,`product_view_count` int(11)
,`product_is_display` tinyint(1)
,`product_variant_id` int(11)
,`discount_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_products_resume`
-- (See below for the actual view)
--
CREATE TABLE `view_products_resume` (
`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`product_variant_price` float
,`product_lastdate_added` date
,`discount_amount` float
,`discount_description` text
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_product_feedbacks`
-- (See below for the actual view)
--
CREATE TABLE `view_product_feedbacks` (
`product_variant_name` varchar(100)
,`product_id` int(11)
,`feedback_id` int(11)
,`product_variant_id` int(11)
,`customer_id` int(11)
,`order_id` int(11)
,`feedback_date` date
,`feedback_rate` int(11)
,`feedback_content` text
,`feedback_is_display` tinyint(1)
,`feedback_img_id` int(11)
,`feedback_img_name` varchar(100)
,`user_name` varchar(100)
,`user_avt_img` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_product_variants`
-- (See below for the actual view)
--
CREATE TABLE `view_product_variants` (
`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`product_period` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`discount_amount` float
,`discount_description` text
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_product_variant_detail`
-- (See below for the actual view)
--
CREATE TABLE `view_product_variant_detail` (
`product_variant_id` int(11)
,`product_id` int(11)
,`discount_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_stock` tinyint(1)
,`product_variant_is_bestseller` tinyint(1)
,`product_variant_added_date` date
,`product_variant_is_display` tinyint(1)
,`discount_name` varchar(100)
,`discount_description` text
,`discount_start_date` date
,`discount_end_date` date
,`discount_amount` float
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_user`
-- (See below for the actual view)
--
CREATE TABLE `view_user` (
`user_id` int(11)
,`user_login_name` varchar(100)
,`user_password` varchar(100)
,`user_name` varchar(100)
,`user_avt_img` varchar(100)
,`user_birth` varchar(10)
,`user_sex` enum('Nữ','Nam')
,`user_email` varchar(100)
,`user_phone` char(10)
,`user_address` varchar(255)
,`user_register_date` date
,`user_active` tinyint(1)
,`customer_id` int(11)
,`staff_id` int(11)
,`staff_role` varchar(100)
,`staff_description` text
);

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_cart`
--
DROP TABLE IF EXISTS `view_cart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_cart`  AS SELECT `carts`.`customer_id` AS `customer_id`, `carts`.`cart_quantity` AS `cart_quantity`, `view_product_variants`.`product_id` AS `product_id`, `view_product_variants`.`product_name` AS `product_name`, `view_product_variants`.`product_avt_img` AS `product_avt_img`, `view_product_variants`.`product_rate` AS `product_rate`, `view_product_variants`.`product_view_count` AS `product_view_count`, `view_product_variants`.`product_period` AS `product_period`, `view_product_variants`.`category_id` AS `category_id`, `view_product_variants`.`category_name` AS `category_name`, `view_product_variants`.`product_variant_id` AS `product_variant_id`, `view_product_variants`.`product_variant_name` AS `product_variant_name`, `view_product_variants`.`product_variant_price` AS `product_variant_price`, `view_product_variants`.`product_variant_available` AS `product_variant_available`, `view_product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `view_product_variants`.`discount_amount` AS `discount_amount`, `view_product_variants`.`discount_description` AS `discount_description` FROM (`carts` left join `view_product_variants` on(`carts`.`product_variant_id` = `view_product_variants`.`product_variant_id`)) ORDER BY `carts`.`cart_added_date` DESC ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_cate_admin`
--
DROP TABLE IF EXISTS `view_cate_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_cate_admin`  AS SELECT `categories`.`category_id` AS `category_id`, `categories`.`category_name` AS `category_name`, `categories`.`category_img` AS `category_img`, `categories`.`categorry_type` AS `categorry_type`, `categories`.`category_added_date` AS `category_added_date`, `categories`.`category_is_display` AS `category_is_display`, coalesce(`product_counts`.`product_count`,0) AS `product_count`, coalesce(sum(`order_details`.`order_detail_price_after`),0) AS `revenue` FROM ((`categories` left join (select `products`.`category_id` AS `category_id`,count(0) AS `product_count` from `products` group by `products`.`category_id`) `product_counts` on(`categories`.`category_id` = `product_counts`.`category_id`)) left join `order_details` on(`order_details`.`product_variant_id` in (select `view_products_resume`.`product_variant_id` from (`view_products_resume` join `orders`) where `view_products_resume`.`category_id` = `categories`.`category_id` and `orders`.`order_id` = `order_details`.`order_id` and `orders`.`order_is_paid` = 1 and `orders`.`order_status` = 'Hoàn thành'))) GROUP BY `categories`.`category_id`, `categories`.`category_name` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_count_cart`
--
DROP TABLE IF EXISTS `view_count_cart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_count_cart`  AS SELECT `customers`.`customer_id` AS `customer_id`, `users`.`user_id` AS `user_id`, count(`carts`.`product_variant_id`) AS `count_cart` FROM ((`users` left join `customers` on(`users`.`user_id` = `customers`.`customer_id`)) left join `carts` on(`carts`.`customer_id` = `customers`.`customer_id`)) GROUP BY `customers`.`customer_id` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_dashboard`
--
DROP TABLE IF EXISTS `view_dashboard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_dashboard`  AS SELECT `dashboard_customer`.`customer_count` AS `customer_count`, sum(`dashboard_order`.`quantity_sold`) AS `quantity_sold`, sum(`dashboard_order`.`revenue`) AS `revenue` FROM ((select count(0) AS `customer_count` from `customers`) `dashboard_customer` join (select count(0) AS `quantity_sold`,sum(`orders`.`order_total_after`) AS `revenue` from `orders` where `orders`.`order_is_paid` = 1 and `orders`.`order_status` = 'Hoàn thành' group by `orders`.`order_id`) `dashboard_order`) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_discounts`
--
DROP TABLE IF EXISTS `view_discounts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_discounts`  AS SELECT `discounts`.`discount_id` AS `discount_id`, `discounts`.`discount_name` AS `discount_name`, `discounts`.`discount_description` AS `discount_description`, `discounts`.`discount_start_date` AS `discount_start_date`, `discounts`.`discount_end_date` AS `discount_end_date`, `discounts`.`discount_amount` AS `discount_amount`, `discounts`.`discount_is_display` AS `discount_is_display`, `discounts`.`discount_img` AS `discount_img` FROM `discounts` WHERE cast(`discounts`.`discount_end_date` as date) > current_timestamp() AND cast(`discounts`.`discount_start_date` as date) < current_timestamp() AND `discounts`.`discount_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_getchart_revenue`
--
DROP TABLE IF EXISTS `view_getchart_revenue`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_getchart_revenue`  AS SELECT `success`.`year` AS `year`, `success`.`month` AS `month`, `success`.`order_success` AS `order_success`, `success`.`revenue` AS `revenue`, `cancel`.`order_cancel` AS `order_cancel` FROM ((select year(`orders`.`order_date`) AS `year`,month(`orders`.`order_date`) AS `month`,count(`orders`.`order_id`) AS `order_success`,sum(`orders`.`order_total_after`) AS `revenue` from `orders` where `orders`.`order_is_paid` = 1 group by year(`orders`.`order_date`),month(`orders`.`order_date`)) `success` left join (select year(`orders`.`order_date`) AS `year`,month(`orders`.`order_date`) AS `month`,count(`orders`.`order_id`) AS `order_cancel` from `orders` where `orders`.`order_status` = 'Đã hủy' group by year(`orders`.`order_date`),month(`orders`.`order_date`)) `cancel` on(`cancel`.`year` = `success`.`year` and `cancel`.`month` = `success`.`month`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_getchart_top5_product`
--
DROP TABLE IF EXISTS `view_getchart_top5_product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_getchart_top5_product`  AS SELECT `order_details`.`product_variant_id` AS `product_variant_id`, sum(`order_details`.`order_detail_quantity`) AS `quantity_sold`, sum(`order_details`.`order_detail_price_after` * `order_details`.`order_detail_quantity`) AS `revenue` FROM (`orders` left join `order_details` on(`order_details`.`order_id` = `orders`.`order_id`)) WHERE `orders`.`order_status` = 'Hoàn thành' GROUP BY `order_details`.`product_variant_id` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_notifications`
--
DROP TABLE IF EXISTS `view_notifications`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_notifications`  AS SELECT `notifications`.`notification_id` AS `notification_id`, `notifications`.`notification_type_id` AS `notification_type_id`, `notifications`.`notification_title` AS `notification_title`, `notifications`.`notification_subtitle` AS `notification_subtitle`, `notifications`.`notification_content` AS `notification_content`, `notifications`.`notification_date` AS `notification_date`, `notifications`.`notification_is_display` AS `notification_is_display`, `user_notification`.`user_id` AS `user_id`, `user_notification`.`user_notification_is_read` AS `user_notification_is_read` FROM (`notifications` left join `user_notification` on(`notifications`.`notification_id` = `user_notification`.`notification_id`)) WHERE `notifications`.`notification_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_order`
--
DROP TABLE IF EXISTS `view_order`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order`  AS SELECT `orders`.`order_id` AS `order_id`, `orders`.`customer_id` AS `customer_id`, `orders`.`staff_id` AS `staff_id`, `orders`.`order_name` AS `order_name`, `orders`.`order_phone` AS `order_phone`, `orders`.`order_date` AS `order_date`, `orders`.`order_delivery_date` AS `order_delivery_date`, `orders`.`order_delivery_address` AS `order_delivery_address`, `orders`.`order_note` AS `order_note`, `orders`.`order_total_before` AS `order_total_before`, `orders`.`order_total_after` AS `order_total_after`, `orders`.`paying_method_id` AS `paying_method_id`, `orders`.`order_paying_date` AS `order_paying_date`, `orders`.`order_is_paid` AS `order_is_paid`, `orders`.`order_status` AS `order_status`, `paying_methods`.`paying_method_name` AS `paying_method_name` FROM (`orders` left join `paying_methods` on(`orders`.`paying_method_id` = `paying_methods`.`paying_method_id`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_orders`
--
DROP TABLE IF EXISTS `view_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_orders`  AS SELECT `orders`.`order_id` AS `order_id`, `orders`.`customer_id` AS `customer_id`, `orders`.`staff_id` AS `staff_id`, `orders`.`order_name` AS `order_name`, `orders`.`order_phone` AS `order_phone`, `orders`.`order_date` AS `order_date`, `orders`.`order_delivery_date` AS `order_delivery_date`, `orders`.`order_delivery_address` AS `order_delivery_address`, `orders`.`order_note` AS `order_note`, `orders`.`order_total_before` AS `order_total_before`, `orders`.`order_total_after` AS `order_total_after`, `orders`.`paying_method_id` AS `paying_method_id`, `orders`.`order_paying_date` AS `order_paying_date`, `orders`.`order_is_paid` AS `order_is_paid`, `orders`.`order_status` AS `order_status`, `paying_methods`.`paying_method_name` AS `paying_method_name` FROM (`orders` left join `paying_methods` on(`orders`.`paying_method_id` = `paying_methods`.`paying_method_id`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_order_detail`
--
DROP TABLE IF EXISTS `view_order_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order_detail`  AS SELECT `order_details`.`order_id` AS `order_id`, `order_details`.`product_variant_id` AS `product_variant_id`, `order_details`.`order_detail_quantity` AS `order_detail_quantity`, `order_details`.`order_detail_price_before` AS `order_detail_price_before`, `order_details`.`order_detail_price_after` AS `order_detail_price_after`, `view_product_variants`.`product_id` AS `product_id`, `view_product_variants`.`product_name` AS `product_name`, `view_product_variants`.`product_avt_img` AS `product_avt_img`, `view_product_variants`.`product_variant_name` AS `product_variant_name` FROM (`order_details` left join `view_product_variants` on(`order_details`.`product_variant_id` = `view_product_variants`.`product_variant_id`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_products_admin`
--
DROP TABLE IF EXISTS `view_products_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_products_admin`  AS SELECT `view_product_variants`.`product_id` AS `product_id`, `view_product_variants`.`product_name` AS `product_name`, `view_product_variants`.`product_avt_img` AS `product_avt_img`, `view_product_variants`.`product_rate` AS `product_rate`, `view_product_variants`.`product_view_count` AS `product_view_count`, `view_product_variants`.`product_period` AS `product_period`, `view_product_variants`.`category_id` AS `category_id`, `view_product_variants`.`category_name` AS `category_name`, `view_product_variants`.`product_variant_id` AS `product_variant_id`, `view_product_variants`.`product_variant_name` AS `product_variant_name`, `view_product_variants`.`product_variant_price` AS `product_variant_price`, `view_product_variants`.`product_variant_available` AS `product_variant_available`, `view_product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `view_product_variants`.`discount_amount` AS `discount_amount`, `view_product_variants`.`discount_description` AS `discount_description`, count(`view_product_variants`.`product_variant_id`) AS `product_count`, sum(`r`.`quantity_sold`) AS `quantity_sold`, sum(`r`.`revenue`) AS `revenue` FROM (`view_product_variants` left join (select `order_details`.`product_variant_id` AS `product_variant_id`,count(`order_details`.`product_variant_id`) AS `quantity_sold`,sum(`order_details`.`order_detail_price_after`) AS `revenue` from (`orders` left join `order_details` on(`orders`.`order_id` = `order_details`.`order_id`)) where `orders`.`order_is_paid` <> 0 and `orders`.`order_status` = 'Hoàn thành' group by `order_details`.`product_variant_id`) `r` on(`view_product_variants`.`product_variant_id` = `r`.`product_variant_id`)) GROUP BY `view_product_variants`.`product_id` ORDER BY sum(`r`.`revenue`) DESC ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_products_info`
--
DROP TABLE IF EXISTS `view_products_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_products_info`  AS SELECT `products`.`product_id` AS `product_id`, `products`.`category_id` AS `category_id`, `products`.`product_name` AS `product_name`, `products`.`supplier_id` AS `supplier_id`, `products`.`product_avt_img` AS `product_avt_img`, `products`.`product_rate` AS `product_rate`, `products`.`product_description` AS `product_description`, `products`.`product_period` AS `product_period`, `products`.`product_view_count` AS `product_view_count`, `products`.`product_is_display` AS `product_is_display`, `product_variants`.`product_variant_id` AS `product_variant_id`, `product_variants`.`discount_id` AS `discount_id`, `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_variant_price` AS `product_variant_price`, `product_variants`.`product_variant_available` AS `product_variant_available` FROM (`products` join `product_variants`) WHERE `products`.`product_id` = `product_variants`.`product_id` AND `product_variants`.`product_variant_is_stock` = 1 AND `product_variants`.`product_variant_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_products_resume`
--
DROP TABLE IF EXISTS `view_products_resume`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_products_resume`  AS SELECT `products`.`product_id` AS `product_id`, `products`.`product_name` AS `product_name`, `products`.`product_avt_img` AS `product_avt_img`, `products`.`product_rate` AS `product_rate`, `products`.`product_view_count` AS `product_view_count`, `categories`.`category_id` AS `category_id`, `categories`.`category_name` AS `category_name`, `a`.`product_variant_id` AS `product_variant_id`, `c`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `a`.`min_price` AS `product_variant_price`, `b`.`max_date` AS `product_lastdate_added`, `view_discounts`.`discount_amount` AS `discount_amount`, `view_discounts`.`discount_description` AS `discount_description` FROM (((select `product_variants`.`product_id` AS `product_id`,max(`product_variants`.`product_variant_added_date`) AS `max_date` from `product_variants` group by `product_variants`.`product_id`) `b` left join (((`products` left join (select `product_variants`.`product_id` AS `product_id`,`product_variants`.`discount_id` AS `discount_id`,`product_variants`.`product_variant_id` AS `product_variant_id`,min(`product_variants`.`product_variant_price`) AS `min_price` from `product_variants` group by `product_variants`.`product_id`) `a` on(`products`.`product_id` = `a`.`product_id`)) left join `view_discounts` on(`a`.`discount_id` = `view_discounts`.`discount_id`)) left join `categories` on(`categories`.`category_id` = `products`.`category_id`)) on(`products`.`product_id` = `b`.`product_id`)) left join (select `product_variants`.`product_id` AS `product_id`,`product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller` from `product_variants` where `product_variants`.`product_variant_is_bestseller` = 1 group by `product_variants`.`product_id`) `c` on(`products`.`product_id` = `c`.`product_id`)) WHERE `products`.`product_is_display` = 1 GROUP BY `products`.`product_id` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_product_feedbacks`
--
DROP TABLE IF EXISTS `view_product_feedbacks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_feedbacks`  AS SELECT `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_id` AS `product_id`, `feedbacks`.`feedback_id` AS `feedback_id`, `feedbacks`.`product_variant_id` AS `product_variant_id`, `feedbacks`.`customer_id` AS `customer_id`, `feedbacks`.`order_id` AS `order_id`, `feedbacks`.`feedback_date` AS `feedback_date`, `feedbacks`.`feedback_rate` AS `feedback_rate`, `feedbacks`.`feedback_content` AS `feedback_content`, `feedbacks`.`feedback_is_display` AS `feedback_is_display`, `feedback_imgs`.`feedback_img_id` AS `feedback_img_id`, `feedback_imgs`.`feedback_img_name` AS `feedback_img_name`, `view_user`.`user_name` AS `user_name`, `view_user`.`user_avt_img` AS `user_avt_img` FROM (((`product_variants` left join `feedbacks` on(`product_variants`.`product_variant_id` = `feedbacks`.`product_variant_id`)) left join `feedback_imgs` on(`feedbacks`.`feedback_id` = `feedback_imgs`.`feedback_id`)) left join `view_user` on(`view_user`.`customer_id` = `feedbacks`.`customer_id`)) WHERE `feedbacks`.`feedback_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_product_variants`
--
DROP TABLE IF EXISTS `view_product_variants`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_variants`  AS SELECT `products`.`product_id` AS `product_id`, `products`.`product_name` AS `product_name`, `products`.`product_avt_img` AS `product_avt_img`, `products`.`product_rate` AS `product_rate`, `products`.`product_view_count` AS `product_view_count`, `products`.`product_period` AS `product_period`, `categories`.`category_id` AS `category_id`, `categories`.`category_name` AS `category_name`, `product_variants`.`product_variant_id` AS `product_variant_id`, `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_variant_price` AS `product_variant_price`, `product_variants`.`product_variant_available` AS `product_variant_available`, `product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `view_discounts`.`discount_amount` AS `discount_amount`, `view_discounts`.`discount_description` AS `discount_description` FROM (((`products` left join `product_variants` on(`products`.`product_id` = `product_variants`.`product_id`)) left join `view_discounts` on(`product_variants`.`discount_id` = `view_discounts`.`discount_id`)) left join `categories` on(`categories`.`category_id` = `products`.`category_id`)) WHERE `categories`.`category_id` = `products`.`category_id` AND `products`.`product_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_product_variant_detail`
--
DROP TABLE IF EXISTS `view_product_variant_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_variant_detail`  AS SELECT `product_variants`.`product_variant_id` AS `product_variant_id`, `product_variants`.`product_id` AS `product_id`, `product_variants`.`discount_id` AS `discount_id`, `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_variant_price` AS `product_variant_price`, `product_variants`.`product_variant_available` AS `product_variant_available`, `product_variants`.`product_variant_is_stock` AS `product_variant_is_stock`, `product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `product_variants`.`product_variant_added_date` AS `product_variant_added_date`, `product_variants`.`product_variant_is_display` AS `product_variant_is_display`, `view_discounts`.`discount_name` AS `discount_name`, `view_discounts`.`discount_description` AS `discount_description`, `view_discounts`.`discount_start_date` AS `discount_start_date`, `view_discounts`.`discount_end_date` AS `discount_end_date`, `view_discounts`.`discount_amount` AS `discount_amount` FROM (`product_variants` left join `view_discounts` on(`product_variants`.`discount_id` = `view_discounts`.`discount_id`)) WHERE `product_variants`.`product_variant_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user`  AS SELECT `users`.`user_id` AS `user_id`, `users`.`user_login_name` AS `user_login_name`, `users`.`user_password` AS `user_password`, `users`.`user_name` AS `user_name`, `users`.`user_avt_img` AS `user_avt_img`, date_format(`users`.`user_birth`,'%d/%m/%Y') AS `user_birth`, `users`.`user_sex` AS `user_sex`, `users`.`user_email` AS `user_email`, `users`.`user_phone` AS `user_phone`, `users`.`user_address` AS `user_address`, `users`.`user_register_date` AS `user_register_date`, `users`.`user_active` AS `user_active`, `customers`.`customer_id` AS `customer_id`, `staffs`.`staff_id` AS `staff_id`, `staffs`.`staff_role` AS `staff_role`, `staffs`.`staff_description` AS `staff_description` FROM ((`users` left join `customers` on(`users`.`user_id` = `customers`.`user_id`)) left join `staffs` on(`users`.`user_id` = `staffs`.`user_id`)) ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_login_name` (`admin_login_name`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`customer_id`,`product_variant_id`),
  ADD KEY `fk_carts_product_variants` (`product_variant_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_customers_users` (`user_id`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discount_id`);

--
-- Chỉ mục cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `fk_order_id` (`order_id`),
  ADD KEY `fk_customer_id` (`customer_id`),
  ADD KEY `fk_product_variant_id` (`product_variant_id`);

--
-- Chỉ mục cho bảng `feedback_imgs`
--
ALTER TABLE `feedback_imgs`
  ADD PRIMARY KEY (`feedback_img_id`),
  ADD KEY `fk_feedback_id` (`feedback_id`);

--
-- Chỉ mục cho bảng `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `display_order` (`display_order`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_notifications_notification_types` (`notification_type_id`);

--
-- Chỉ mục cho bảng `notification_types`
--
ALTER TABLE `notification_types`
  ADD PRIMARY KEY (`notification_type_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_orders_customers` (`customer_id`),
  ADD KEY `fk_orders_staffs` (`staff_id`),
  ADD KEY `fk_paying_method_id` (`paying_method_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`,`product_variant_id`),
  ADD KEY `fk_order_details_product_variants` (`product_variant_id`);

--
-- Chỉ mục cho bảng `paying_methods`
--
ALTER TABLE `paying_methods`
  ADD PRIMARY KEY (`paying_method_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_products_categories` (`category_id`),
  ADD KEY `fk_products_suppliers` (`supplier_id`);

--
-- Chỉ mục cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_detail_id`,`product_id`),
  ADD KEY `fk_product_details_products` (`product_id`);

--
-- Chỉ mục cho bảng `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `fk_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`product_variant_id`,`product_id`) USING BTREE,
  ADD KEY `fk_product_variants_products` (`product_id`),
  ADD KEY `fk_products_variants_discounts` (`discount_id`);

--
-- Chỉ mục cho bảng `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `fk_staffs_users` (`user_id`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `user_notification`
--
ALTER TABLE `user_notification`
  ADD PRIMARY KEY (`user_id`,`notification_id`),
  ADD KEY `fk_user_notification_notifications` (`notification_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=761;

--
-- AUTO_INCREMENT cho bảng `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `notification_types`
--
ALTER TABLE `notification_types`
  MODIFY `notification_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT cho bảng `paying_methods`
--
ALTER TABLE `paying_methods`
  MODIFY `paying_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT cho bảng `product_details`
--
ALTER TABLE `product_details`
  MODIFY `product_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=581;

--
-- AUTO_INCREMENT cho bảng `product_imgs`
--
ALTER TABLE `product_imgs`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `product_variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT cho bảng `staffs`
--
ALTER TABLE `staffs`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `fk_carts_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_carts_product_variants` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`);

--
-- Các ràng buộc cho bảng `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `fk_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`);

--
-- Các ràng buộc cho bảng `feedback_imgs`
--
ALTER TABLE `feedback_imgs`
  ADD CONSTRAINT `fk_feedback_id` FOREIGN KEY (`feedback_id`) REFERENCES `feedbacks` (`feedback_id`);

--
-- Các ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_notification_types` FOREIGN KEY (`notification_type_id`) REFERENCES `notification_types` (`notification_type_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_orders_staffs` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`),
  ADD CONSTRAINT `fk_paying_method_id` FOREIGN KEY (`paying_method_id`) REFERENCES `paying_methods` (`paying_method_id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `fk_order_details_product_variants` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Các ràng buộc cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `fk_product_details_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `fk_product_variants_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `fk_products_variants_discounts` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`discount_id`);

--
-- Các ràng buộc cho bảng `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `fk_staffs_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `user_notification`
--
ALTER TABLE `user_notification`
  ADD CONSTRAINT `fk_user_notification_notifications` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`),
  ADD CONSTRAINT `fk_user_notification_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
