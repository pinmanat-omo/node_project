-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2023 at 07:44 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `products_ids` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_items`
--

CREATE TABLE `orders_items` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(8,2) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` float(8,2) NOT NULL,
  `sale_price` float(8,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `image` text NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `sale_price`, `quantity`, `image`, `category`, `type`) VALUES
(1, 'LV x YK - กระเป๋ารุ่น Dauphine Mini', '', 4400.00, NULL, 5, 'item-1.jpg', NULL, NULL),
(2, 'เข็มขัดรุ่น LV Initiales ขนาด 30 มม.', '', 540.00, NULL, 3, 'item-2.jpg', NULL, NULL),
(3, 'จี้ LV ขนาดกลาง ไวท์โกลด์และเพชร', '', 11000.00, 9990.00, 5, 'item-3.jpg', NULL, NULL),
(4, 'กล่องใส่น้ำหอมสำหรับเดินทางขนาด 100 มล.', '', 750.00, NULL, 5, 'item-4.jpg', NULL, NULL),
(5, 'กระเป๋า CLASSIQUE TRIOMPHE', '', 3720.00, NULL, 2, 'item-5.jpg', NULL, NULL),
(6, 'เสื้อฮูดทรงคร็อปผ้าเจอร์ซีย์กำมะหยี่ลาย', '', 1545.00, 1500.00, 5, 'item-6.jpg', NULL, NULL),
(7, 'เข็มขัด DOUBLE RING ขนาดกลาง', '', 370.00, NULL, 3, 'item-7.jpg', NULL, NULL),
(8, 'แจ็กเก็ต ปกคลอดีน ผ้าวูล สีออฟไวท์', '', 3720.00, NULL, 5, 'item-8.jpg', NULL, NULL),
(9, 'เสื้อ BRUSHED MOHAIR ASYMMETRICAL TOP', '', 1400.00, NULL, 5, 'item-9.jpg', NULL, NULL),
(10, 'เสื้อคาร์ดิแกน EXTRA FINE WOOL CARDIGAN', '', 1800.00, NULL, 5, 'item-10.jpg', NULL, NULL),
(11, 'เสื้อคาร์ดิแกน EXTRA FINE WOOL CARDIGAN', '', 1100.00, NULL, 5, 'item-11.jpg', NULL, NULL),
(12, 'กระเป๋า OPHIDIA GG SMALL SHOULDER BAG', '', 1400.00, NULL, 5, 'item-12.jpg', NULL, NULL),
(13, 'กระเป๋าสะพายใบเล็ก Chanel', '', 6000.00, NULL, 5, 'item-13.jpg', NULL, NULL),
(14, 'กระเป๋าสะพายใบเล็ก Chanel', '', 5800.00, NULL, 5, 'item-14.jpg', NULL, NULL),
(15, 'กระเป๋าทรงโบว์ลิ่งใบเล็ก Chanel', '', 800.00, NULL, 5, 'item-15.jpg', NULL, NULL),
(16, 'เข็มขัด หนังแกะโลหะสีเงิน Chanel', '', 1700.00, NULL, 5, 'item-16.jpg', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_items`
--
ALTER TABLE `orders_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_items`
--
ALTER TABLE `orders_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
