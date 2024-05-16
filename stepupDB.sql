-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2024 at 11:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stepup`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `total_price`) VALUES
(1, 7, '2024-05-08 16:01:20', 4000.00),
(2, 7, '2024-05-08 16:14:23', 4000.00),
(3, 7, '2024-05-08 16:19:25', 4000.00),
(4, 7, '2024-05-08 16:28:54', 900.00),
(5, 7, '2024-05-08 16:30:49', 27400.00),
(6, 0, '2024-05-08 16:49:30', 4000.00),
(7, 0, '2024-05-08 16:50:12', 4000.00),
(8, 0, '2024-05-09 12:47:00', 4000.00),
(9, 10, '2024-05-09 13:43:25', 140.00),
(10, 10, '2024-05-09 13:43:44', 900.00),
(11, 10, '2024-05-09 13:44:31', 169.99),
(12, 7, '2024-05-09 13:45:03', 169.99),
(13, 7, '2024-05-09 13:55:43', 4900.00),
(14, 0, '2024-05-09 13:56:08', 900.00),
(15, 0, '2024-05-09 14:01:10', 4000.00),
(16, 0, '2024-05-09 14:01:49', 169.99),
(17, 0, '2024-05-09 14:06:50', 169.99),
(18, 11, '2024-05-09 16:11:26', 169.99),
(19, 0, '2024-05-09 17:01:26', 4000.00),
(20, 11, '2024-05-09 17:42:11', 1699.90),
(21, 11, '2024-05-10 15:37:39', 4900.00),
(22, 7, '2024-05-10 15:39:28', 140.00),
(23, 7, '2024-05-10 15:43:07', 3900.00),
(24, 7, '2024-05-10 15:45:38', 3900.00),
(25, 7, '2024-05-10 15:47:49', 900.00),
(26, 11, '2024-05-10 15:55:35', 400.00),
(27, 11, '2024-05-10 16:13:26', 3900.00),
(28, 11, '2024-05-11 18:10:19', 35100.00),
(29, 11, '2024-05-11 23:02:02', 2700.00),
(30, 11, '2024-05-11 23:02:23', 169.99),
(31, 11, '2024-05-11 23:02:51', 900.00),
(32, 11, '2024-05-11 23:04:28', 500.00),
(33, 11, '2024-05-11 23:04:32', 500.00),
(34, 11, '2024-05-11 23:05:30', 4000.00),
(35, 11, '2024-05-12 18:45:58', 1679.96),
(36, 11, '2024-05-12 20:16:53', 509.97),
(37, 11, '2024-05-12 20:57:26', 4500.00),
(38, 11, '2024-05-13 10:00:53', 36000.00),
(39, 11, '2024-05-13 10:12:33', 900.00),
(40, 11, '2024-05-13 10:23:32', 900.00),
(41, 11, '2024-05-13 10:23:33', 900.00),
(42, 11, '2024-05-13 10:23:34', 900.00),
(43, 11, '2024-05-13 10:23:34', 900.00),
(44, 11, '2024-05-13 10:23:34', 900.00),
(45, 11, '2024-05-13 10:23:35', 900.00),
(46, 11, '2024-05-13 10:23:35', 900.00),
(47, 11, '2024-05-13 10:23:35', 900.00),
(48, 11, '2024-05-13 10:24:58', 3900.00),
(49, 11, '2024-05-13 10:39:22', 500.00),
(50, 11, '2024-05-13 21:39:52', 4000.00),
(51, 7, '2024-05-15 18:34:00', 200.00),
(52, 1, '2024-05-15 18:38:51', 400.00),
(54, 11, '2024-05-15 22:40:17', 900.00),
(55, 11, '2024-05-15 22:44:13', 115.00),
(56, 4, '2024-05-15 22:51:33', 230.00),
(57, 24, '2024-05-15 23:23:56', 3900.00),
(58, 7, '2024-05-16 08:48:15', 900.00),
(59, 7, '2024-05-16 08:48:48', 3900.00),
(60, 11, '2024-05-16 09:43:01', 4800.00),
(61, 25, '2024-05-16 10:37:43', 420.00),
(62, 7, '2024-05-17 00:03:57', 2300.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `detail_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`detail_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 1, 1, 4000.00),
(2, 2, 1, 1, 4000.00),
(3, 3, 1, 1, 4000.00),
(4, 4, 3, 1, 900.00),
(5, 5, 1, 1, 4000.00),
(6, 5, 2, 6, 3900.00),
(7, 6, 1, 1, 4000.00),
(8, 7, 1, 1, 4000.00),
(9, 8, 1, 1, 4000.00),
(10, 9, 6, 1, 140.00),
(11, 10, 3, 1, 900.00),
(12, 11, 4, 1, 169.99),
(13, 12, 4, 1, 169.99),
(14, 13, 1, 1, 4000.00),
(15, 13, 3, 1, 900.00),
(16, 14, 3, 1, 900.00),
(17, 15, 1, 1, 4000.00),
(18, 16, 4, 1, 169.99),
(19, 17, 4, 1, 169.99),
(20, 18, 4, 1, 169.99),
(21, 19, 1, 1, 4000.00),
(22, 20, 4, 10, 169.99),
(23, 21, 1, 1, 4000.00),
(24, 21, 3, 1, 900.00),
(25, 22, 6, 1, 140.00),
(26, 23, 2, 1, 3900.00),
(27, 24, 2, 1, 3900.00),
(28, 25, 3, 1, 900.00),
(29, 26, 7, 1, 400.00),
(30, 27, 2, 1, 3900.00),
(31, 28, 2, 9, 3900.00),
(32, 29, 3, 3, 900.00),
(33, 30, 4, 1, 169.99),
(34, 31, 3, 1, 900.00),
(35, 34, 1, 1, 4000.00),
(36, 35, 8, 2, 500.00),
(37, 35, 4, 4, 169.99),
(38, 36, 4, 3, 169.99),
(39, 37, 3, 5, 900.00),
(40, 38, 1, 9, 4000.00),
(41, 39, 3, 1, 900.00),
(42, 48, 2, 1, 3900.00),
(43, 49, 8, 1, 500.00),
(44, 50, 1, 1, 4000.00),
(45, 51, 10, 1, 200.00),
(46, 52, 7, 1, 400.00),
(48, 54, 3, 1, 900.00),
(49, 55, 14, 1, 115.00),
(50, 56, 14, 2, 115.00),
(51, 57, 2, 1, 3900.00),
(52, 58, 3, 1, 900.00),
(53, 59, 2, 1, 3900.00),
(54, 60, 2, 1, 3900.00),
(55, 60, 3, 1, 900.00),
(56, 61, 5, 3, 140.00),
(57, 62, 3, 1, 900.00),
(58, 62, 10, 1, 200.00),
(59, 62, 7, 3, 400.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `category` varchar(25) NOT NULL,
  `price` varchar(1000) NOT NULL,
  `img` varchar(300) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `img`, `stock`, `is_active`) VALUES
(1, 'Nike Airmax 1', 'Sports Shoe', '4000', 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/ed95a1f5-5f45-45c1-9a0d-6aed6e0a7cd9/air-max-1-shoes-bRwLfj.png', 19, 1),
(2, 'New balance 550', 'Shoes', '3900', 'https://i.pinimg.com/originals/58/7d/82/587d82a229ceba80432497d594206c06.png', 18, 1),
(3, 'Shark Slides', 'Slippers', '900', 'https://static.nike.com/a/images/t_default/99486859-0ff3-46b4-949b-2d16af2ad421/custom-nike-dunk-high-by-you-shoes.png', 13, 1),
(4, 'NIKE Men\'s Shoes', 'shoes', '169.99', 'https://m.media-amazon.com/images/I/41MvtTS3T6L._AC_SY575_.jpg', 0, 1),
(5, 'Nike Unisex Modern Sweats', 'shoes', '140', 'https://m.media-amazon.com/images/I/61xUUCRv7IL._AC_SY575_.jpg', 7, 1),
(6, 'Nike Unisex', 'shoes', '140', 'https://m.media-amazon.com/images/I/61xUUCRv7IL._AC_SY575_.jpg', 15, 1),
(7, 'Adidas Shoes', 'shoes', '400', 'https://www.transparentpng.com/thumb/adidas-shoes/a4xO3G-adidas-shoes-adidas-shoe-kids-superstar-daddy-grade.png', 6, 1),
(8, 'Adidas Men Shoes', 'shoes', '500', 'https://freepngimg.com/thumb/categories/1498.png', 7, 1),
(10, 'CAT SHOES', 'Shoes', '200', 'https://www.footcourt-eg.com/cdn/shop/products/cat-shoes-285457-961352.jpg?v=1681423005&width=600', 8, 1),
(11, 'Club C vintage', 'Shoes', '70', 'https://reebok.bynder.com/transform/ae423c95-95e1-452e-9831-68fbf33330bb/100000317_TPP_eCom-tif?io=transform:fit,width:500&quality=100', 15, 1),
(12, 'Nano X4', 'Shoes', '150', 'https://reebok.bynder.com/transform/8af8c2cb-8980-49cb-8d95-8d65b8d7bd38/100074179_SLC_eCom-tif?io=transform:fit,width:1000&quality=100', 11, 1),
(13, 'Air Jordan 1 Retro', 'Shoes', '150', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/312b0732-3206-40fa-b578-7bfb62c0675a/air-jordan-1-retro-high-og-mens-shoes-JHpxkn.png', 10, 1),
(14, 'Nike Dunk', 'Shoes', '115', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b1bcbca4-e853-4df7-b329-5be3c61ee057/dunk-low-retro-mens-shoes-5FQWGR.png', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(25) NOT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `active`) VALUES
(11, 'Abonga', 'abonga@gmail.com', 'Abonga123', 1),
(12, 'abonga', 'abonga@gmail.com', 'Abonga123', 1),
(13, 'ed', 'a5@gmail.com', 'Abdooo906', 1),
(14, 'd', 'a5@gmail.com', 'aa999999', 1),
(15, 'aliMohamed', 'ali@gmail.com', 'ali20044', 1),
(16, 'admin', 'admin@gmail.com', 'admin', 1),
(17, 'ErenYeager', 'eren@gmail.com', 'eren1234', 1),
(18, 'ErenYeager', 'eren@gmail.com', 'Eren1234', 1),
(19, 'Gojo', 'theStrongest@gmail.com', 'gojo123', 1),
(20, 'Levi', 'levi@gmail.com', 'levi123', 1),
(21, 'Levi', 'levi@gmail.com', 'levi123', 1),
(22, 'Mohamed', 'mo7a@gmail.com', 'mo7a123456', 1),
(23, 'Hassan', 'hassan@gmail.com', 'hassan123', 0),
(24, 'Hana', 'hana@gmail.com', 'hana1234', 1),
(25, 'abdo', 'abdo13@gmail.com', 'Abdooo123', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
