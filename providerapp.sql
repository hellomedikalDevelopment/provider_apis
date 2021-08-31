-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 31, 2021 at 09:16 AM
-- Server version: 8.0.25-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `providerapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Primary Care', 'Hospital.jpg', '2021-07-25 02:57:49', NULL, NULL),
(2, 'Dentist', 'Hospital.jpg', '2021-07-25 02:57:49', NULL, NULL),
(3, 'OB-GYN', 'Hospital.jpg', '2021-07-25 02:57:49', NULL, NULL),
(4, 'Dermatologist', 'Hospital.jpg', '2021-07-25 02:57:49', NULL, NULL),
(5, 'Psychiatrist', 'Hospital.jpg', '2021-07-25 02:57:49', NULL, NULL),
(6, 'Eye Doctor', 'Hospital.jpg', '2021-07-25 02:57:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int NOT NULL,
  `state_id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_support`
--

CREATE TABLE `customer_support` (
  `id` int NOT NULL,
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `image1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_support`
--

INSERT INTO `customer_support` (`id`, `name`, `email`, `phone_no`, `subject`, `message`, `user_id`, `image1`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(14, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(15, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(16, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(17, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(18, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(19, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(20, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(21, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(22, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(23, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(24, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(25, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(26, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(27, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(28, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(29, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(30, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(31, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(32, 'sonali', 'sonali@gmail.com', '1234567890', 'test', 'test', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(33, 'asaas', 'muz@g.com', '1234566788', 'assa', 'asddasas', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(34, 'asaas', 'muz@g.com', '1234566788', 'assa', 'asddasas', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(35, 'hhjvjvj', 'muz@g.com', '1212121212', 'asdad', 'asddsd', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(36, 'hhjvjvj', 'muz@g.com', '1212121212', 'asdad', 'asddsd', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(37, 'asdsad', 'muz@g.com', '1212121212', 'asdsad', 'asdsadsa by', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(38, 'asdsd', 'muz@g.com', '1231231231', 'sadas', 'asdasd', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(39, 'asdds', 'muz@g.com', '1212121212', 'asdad', 'asdsadsd', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(40, 'asdds', 'muz@g.com', '1212121212', 'asdad', 'asdsadsd', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(41, 'asd', 'muz@g.com', '1212121212', 'czxc', 'zxcxzcc', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(42, 'reddy', 'reddy@gmail.com', '9876598765', 'thanks dear happy Anniversary happy birthday happy orwyiuw', 'thanks dear happy Anniversary happy birthday happy birthday to dear dear friend happy eyepatch dear dear friend thank you ma’am for your birthday wishes and happy birthday to happy birthday dear happy Anniversary happy birthday happy birthday to happy birthday dear happy Anniversary happy birthday happy birthday to happy birthday dear happy birthday w', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(43, 'Advani', 'test@gmail.com', '9874598745', 'thanks dear happy birthday dear happy dear friend love love miss miss you love you', 'okay I love you dear happy birthday dear happy dear friend love miss miss you dear happy happy birthday dear happy dear friend dear love love you papa love love thank you for the whole birthday love you dear friend love love thank you love miss', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(44, 'Advani', 'test@gmail.com', '9874598745', 'thanks dear happy birthday dear happy dear friend love love miss miss you love you', 'okay I love you dear happy birthday dear happy dear friend love miss miss you dear happy happy birthday dear happy dear friend dear love love you papa love love thank you for the whole birthday love you dear friend love love thank you love miss', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(45, 'test', 'test@gmail.com', '9874598745', 'thanks dear happy birthday dear happy dear friend love love miss', 'thanks dear happy birthday dear happy dear friend love love thank you love you guys too dear dear happy happy birthday dear happy dear friend dear happy happy birthday dear happy happy dear friend love love thank you for all the love miss miss you love you dear friend love', 0, NULL, '2021-08-30 17:33:23', NULL, NULL),
(46, 'Dede', 'dr.dr@gmail.com', '6548965489', 'In general, testing is finding out how well something works.', 'In general, testing is finding out how well something works. In terms of human beings, testing tells what level of knowledge or skill has been acquired. In computer hardware and software development, testing is used at key checkpoints in the overall process to determine whether objectives are being met.', 0, NULL, '2021-08-30 17:33:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_support_image`
--

CREATE TABLE `customer_support_image` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `image` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_support_image`
--

INSERT INTO `customer_support_image` (`id`, `customer_id`, `image`, `video`, `updated_at`, `deleted_at`, `created_at`) VALUES
(1, 17, NULL, '1623738693videoFile-1.mov', '2021-06-15 06:31:34', NULL, '2021-06-15 06:31:34'),
(2, 17, '1623738694banner.png', NULL, '2021-06-15 06:31:35', NULL, '2021-06-15 06:31:35'),
(3, 18, '1623738761R50.png', NULL, '2021-06-15 06:32:41', NULL, '2021-06-15 06:32:41'),
(4, 18, '1623738761image-2.png', NULL, '2021-06-15 06:32:41', NULL, '2021-06-15 06:32:41'),
(5, 19, '1623739662R50.png', NULL, '2021-06-15 06:47:42', NULL, '2021-06-15 06:47:42'),
(6, 19, '1623739662image-2.png', NULL, '2021-06-15 06:47:42', NULL, '2021-06-15 06:47:42'),
(7, 20, '1623739713R50.png', NULL, '2021-06-15 06:48:33', NULL, '2021-06-15 06:48:33'),
(8, 20, '1623739713image-2.png', NULL, '2021-06-15 06:48:33', NULL, '2021-06-15 06:48:33'),
(9, 21, '1623739836R50.png', NULL, '2021-06-15 06:50:36', NULL, '2021-06-15 06:50:36'),
(10, 21, '1623739836image-2.png', NULL, '2021-06-15 06:50:36', NULL, '2021-06-15 06:50:36'),
(11, 22, '1623739962R50.png', NULL, '2021-06-15 06:52:42', NULL, '2021-06-15 06:52:42'),
(12, 22, '1623739962image-2.png', NULL, '2021-06-15 06:52:42', NULL, '2021-06-15 06:52:42'),
(13, 23, '1623740008R50.png', NULL, '2021-06-15 06:53:28', NULL, '2021-06-15 06:53:28'),
(14, 23, '1623740008image-2.png', NULL, '2021-06-15 06:53:28', NULL, '2021-06-15 06:53:28'),
(15, 24, '1623740033R50.png', NULL, '2021-06-15 06:53:53', NULL, '2021-06-15 06:53:53'),
(16, 24, '1623740033image-2.png', NULL, '2021-06-15 06:53:53', NULL, '2021-06-15 06:53:53'),
(17, 25, '1623740076R50.png', NULL, '2021-06-15 06:54:36', NULL, '2021-06-15 06:54:36'),
(18, 25, '1623740076image-2.png', NULL, '2021-06-15 06:54:36', NULL, '2021-06-15 06:54:36'),
(19, 26, '1623740158R50.png', NULL, '2021-06-15 06:55:58', NULL, '2021-06-15 06:55:58'),
(20, 26, '1623740158image-2.png', NULL, '2021-06-15 06:55:58', NULL, '2021-06-15 06:55:58'),
(21, 27, '1623740274R50.png', NULL, '2021-06-15 06:57:54', NULL, '2021-06-15 06:57:54'),
(22, 27, '1623740274image-2.png', NULL, '2021-06-15 06:57:54', NULL, '2021-06-15 06:57:54'),
(23, 28, '1623740384R50.png', NULL, '2021-06-15 06:59:44', NULL, '2021-06-15 06:59:44'),
(24, 28, '1623740384image-2.png', NULL, '2021-06-15 06:59:44', NULL, '2021-06-15 06:59:44'),
(25, 29, '1623750485imagst.png', NULL, '2021-06-15 09:48:05', NULL, '2021-06-15 09:48:05'),
(26, 29, NULL, '1623750485videoFile-1.mov', '2021-06-15 09:48:07', NULL, '2021-06-15 09:48:07'),
(27, 30, '1623751249imagst.png', NULL, '2021-06-15 10:00:49', NULL, '2021-06-15 10:00:49'),
(28, 30, NULL, '1623751249videoFile-1.mov', '2021-06-15 10:00:50', NULL, '2021-06-15 10:00:50'),
(29, 31, NULL, '1623751471videoFile-1.mov', '2021-06-15 10:04:32', NULL, '2021-06-15 10:04:32'),
(30, 32, '1624608365english_flag-image.png', NULL, '2021-06-25 08:06:05', NULL, '2021-06-25 08:06:05'),
(31, 33, NULL, NULL, '2021-06-25 08:22:30', NULL, '2021-06-25 08:22:30'),
(32, 33, NULL, NULL, '2021-06-25 08:22:30', NULL, '2021-06-25 08:22:30'),
(33, 33, NULL, NULL, '2021-06-25 08:22:30', NULL, '2021-06-25 08:22:30'),
(34, 34, NULL, NULL, '2021-06-25 08:26:50', NULL, '2021-06-25 08:26:50'),
(35, 34, NULL, NULL, '2021-06-25 08:26:50', NULL, '2021-06-25 08:26:50'),
(36, 34, NULL, NULL, '2021-06-25 08:26:50', NULL, '2021-06-25 08:26:50'),
(37, 34, NULL, NULL, '2021-06-25 08:26:50', NULL, '2021-06-25 08:26:50'),
(38, 35, NULL, NULL, '2021-06-25 08:30:46', NULL, '2021-06-25 08:30:46'),
(39, 35, NULL, NULL, '2021-06-25 08:30:46', NULL, '2021-06-25 08:30:46'),
(40, 35, NULL, NULL, '2021-06-25 08:30:46', NULL, '2021-06-25 08:30:46'),
(41, 36, NULL, NULL, '2021-06-25 08:33:49', NULL, '2021-06-25 08:33:49'),
(42, 36, NULL, NULL, '2021-06-25 08:33:49', NULL, '2021-06-25 08:33:49'),
(43, 36, NULL, NULL, '2021-06-25 08:33:49', NULL, '2021-06-25 08:33:49'),
(44, 37, NULL, NULL, '2021-06-25 08:40:15', NULL, '2021-06-25 08:40:15'),
(45, 37, NULL, NULL, '2021-06-25 08:40:15', NULL, '2021-06-25 08:40:15'),
(46, 37, NULL, NULL, '2021-06-25 08:40:15', NULL, '2021-06-25 08:40:15'),
(47, 38, NULL, NULL, '2021-06-25 08:43:10', NULL, '2021-06-25 08:43:10'),
(48, 39, NULL, NULL, '2021-06-25 08:44:22', NULL, '2021-06-25 08:44:22'),
(49, 40, NULL, NULL, '2021-06-25 08:46:12', NULL, '2021-06-25 08:46:12'),
(50, 41, NULL, NULL, '2021-06-25 08:48:03', NULL, '2021-06-25 08:48:03'),
(51, 42, NULL, NULL, '2021-07-04 10:52:07', NULL, '2021-07-04 10:52:07'),
(52, 43, NULL, NULL, '2021-07-07 10:53:05', NULL, '2021-07-07 10:53:05'),
(53, 43, NULL, NULL, '2021-07-07 10:53:05', NULL, '2021-07-07 10:53:05'),
(54, 44, NULL, NULL, '2021-07-07 10:53:42', NULL, '2021-07-07 10:53:42'),
(55, 45, NULL, NULL, '2021-07-07 10:54:43', NULL, '2021-07-07 10:54:43'),
(56, 46, NULL, NULL, '2021-08-03 17:18:10', NULL, '2021-08-03 17:18:10'),
(57, 46, NULL, NULL, '2021-08-03 17:18:10', NULL, '2021-08-03 17:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `hello_clinics`
--

CREATE TABLE `hello_clinics` (
  `id` int NOT NULL,
  `user_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `working_hours` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `repeat` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hello_clinics`
--

INSERT INTO `hello_clinics` (`id`, `user_id`, `name`, `email`, `phone`, `department`, `working_hours`, `to`, `from`, `repeat`) VALUES
(1, '1', 'bhavya clicnic', 'bhavya.scorpsoft@gmail.com', '7895014982', '', 's:20:\"[\"monday\",\"tuesday\"]\";', '', '', ''),
(2, '2', 'bhavya clicnic', 'bhavya2.scorpsoft@gmail.com', '7895014981', 'abc', 's:20:\"[\"monday\",\"tuesday\"]\";', '9:15AM', '10:00PM', '0'),
(3, '3', 'bhavya clicnic', 'bhavya.scorpsoft23@gmail.com', '7895014923', 'zczxccx', 's:20:\"[\"monday\",\"tuesday\"]\";', '1', '2', '0'),
(4, '4', 'bhavya clicnic', 'g@g.com', '7895014536', 'zczxccx', 's:20:\"[\"monday\",\"tuesday\"]\";', '1', '2', '0'),
(5, '5', 'bhavya clicnic', 'g2@g2.com', '7895014585', 'zczxccx', 's:20:\"[\"monday\",\"tuesday\"]\";', '1', '2', '0'),
(6, '11', 'bhavya clicnic', '56g4@g2.com', '7895052365', '', 'N;', '1', '2', '0'),
(7, '14', 'rinku', 'ffffddllf@g.com', '2525252525', '', 'N;', '', '', '0'),
(8, '15', 'yhhhhh', 'bbbbb@g.com', '6969696969', '', 'N;', '', '', '0'),
(9, '16', 'dfff', 'ddddddd@ssddd.com', '9696969699', '', 'N;', '', '', '0'),
(10, '17', 'xxxxfds', 'cxd@d.com', '2369856969', '', 'N;', '', '', '0'),
(11, '18', 'rfdd', 'xxd@g.com', '2525296325', '', 'N;', '', '', '0'),
(12, '19', 'xdf', 'ffdd@g.com', '2596389696', 'XYZ Department', 's:8:\"Saturday\";', '08:30 PM', '08:30 AM', '1'),
(13, '20', 'xxcc', 'ffff@g.com', '1236589869', 'ABC Department', 'N;', '', '', '0'),
(14, '21', 'xss', 'xxxx@d.com', '1234569852', '', 'N;', '', '', '0'),
(15, '22', 'hello', 'hello@g.com', '2539656959', '', 'N;', '', '', '0'),
(16, '23', 'dxxx', 'dd@d.com', '5555555554', '', 'N;', '', '', '0'),
(17, '24', 'xxxxd', 'vvvvv@f.com', '1235863259', '', 'N;', '', '', '0'),
(18, '25', 'bhavya clicnic', '889g4@g2.com', '5595052365', 'asdasdad', 's:20:\"[\"monday\",\"tuesday\"]\";', '1', '2', '0'),
(19, '26', 'bhavya clicnic', '44@g2.com', '1234567892', 'asdasdad', 's:20:\"[\"monday\",\"tuesday\"]\";', '1', '2', '0'),
(20, '27', 'bhavya clicnic', '88@g2.com', '1234567772', 'asdasdad', 's:9:\"asdasdasd\";', '1', '2', '0'),
(21, '28', 'dhiman', 'dhiman@g.com', '8295086363', 'XYZ Department', 's:42:\"[Sunday, , , , Thursday, Friday, Saturday]\";', '10:21 PM', '10:18 AM', '0'),
(22, '29', 'own', 'own@g.com', '3698527410', 'XYZ Department', 's:0:\"\";', '', '', '0'),
(23, '30', 'sanjay saini', 'sainirohit755@gmail.com', '7895014983', 'ABC Department', 's:0:\"\";', '', '', '0'),
(24, '31', 'Assad', 'asd@g.com', '1234567890', '123 Department', 's:40:\"[Sunday, Monday, , , Thursday, Friday, ]\";', '08:48 PM', '06:30 AM', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hello_users`
--

CREATE TABLE `hello_users` (
  `id` int NOT NULL,
  `role` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hello_users`
--

INSERT INTO `hello_users` (`id`, `role`, `email`, `password`, `country`, `state`, `city`, `postcode`, `otp`, `status`) VALUES
(1, 'bhavya clicnic', 'bhavya.scorpsoft@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(2, 'bhavya clicnic', 'bhavya2.scorpsoft@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(3, 'bhavya clicnic', 'bhavya.scorpsoft23@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(4, 'bhavya clicnic', 'g@g.com', 'e10adc3949ba59abbe56e057f20f883e', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(5, 'bhavya clicnic', 'g2@g2.com', 'e10adc3949ba59abbe56e057f20f883e', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(6, 'bhavya clicnic', 'g3@g2.com', 'e10adc3949ba59abbe56e057f20f883e', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(7, 'bhavya clicnic', 'g3@g.com', 'e10adc3949ba59abbe56e057f20f883e', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(8, 'bhavya clicnic', 'g4@g.com', 'e10adc3949ba59abbe56e057f20f883e', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(9, 'bhavya clicnic', 'g4@g2.com', 'e10adc3949ba59abbe56e057f20f883e', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(10, 'bhavya clicnic', 'fdg4@g2.com', 'e10adc3949ba59abbe56e057f20f883e', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(11, 'bhavya clicnic', '56g4@g2.com', 'e10adc3949ba59abbe56e057f20f883e', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(12, 'muzz', 'muz@g.com', '25d55ad283aa400af464c76d713c07ad', 'Tunisia', 'Misrata', 'Misrata', '123569', NULL, 0),
(13, 'rinku', 'ffffddf@g.com', 'e10adc3949ba59abbe56e057f20f883e', 'Tunisia', 'Misrata', 'Misrata', '123569', NULL, 0),
(14, 'rinku', 'ffffddllf@g.com', 'e10adc3949ba59abbe56e057f20f883e', 'Tunisia', 'Misrata', 'Misrata', '123569', NULL, 0),
(15, 'yhhhhh', 'bbbbb@g.com', 'e10adc3949ba59abbe56e057f20f883e', 'Turkey', 'Sebha', 'Tripoli', '25239', NULL, 0),
(16, 'dfff', 'ddddddd@ssddd.com', 'e10adc3949ba59abbe56e057f20f883e', 'Tunisia', 'Zawiyta', 'Misrata', '253698', NULL, 0),
(17, 'xxxxfds', 'cxd@d.com', 'e10adc3949ba59abbe56e057f20f883e', 'Tunisia', 'Sebha', 'Aibayda', '1236589', NULL, 0),
(18, 'rfdd', 'xxd@g.com', 'e10adc3949ba59abbe56e057f20f883e', 'Libya', 'Sebha', 'Aibayda', '8888888', NULL, 0),
(19, 'xdf', 'ffdd@g.com', 'e10adc3949ba59abbe56e057f20f883e', 'Turkey', 'Aibayda', 'Zawiyta', '123596', NULL, 0),
(20, 'xxcc', 'ffff@g.com', 'e10adc3949ba59abbe56e057f20f883e', 'Turkey', 'Zawiyta', 'Zawiyta', '12395', NULL, 0),
(21, 'xss', 'xxxx@d.com', 'e10adc3949ba59abbe56e057f20f883e', 'Tunisia', 'Aibayda', 'Tripoli', '236985', NULL, 0),
(22, 'hello', 'hello@g.com', 'e10adc3949ba59abbe56e057f20f883e', 'Libya', 'Behhazi', 'Sebha', '1155255', NULL, 0),
(23, 'dxxx', 'dd@d.com', 'e10adc3949ba59abbe56e057f20f883e', 'Tunisia', 'Zawiyta', 'Zawiyta', '8888', NULL, 0),
(24, 'xxxxd', 'vvvvv@f.com', 'e10adc3949ba59abbe56e057f20f883e', 'Tunisia', 'Aibayda', 'Aibayda', '280', NULL, 0),
(25, 'bhavya clicnic', '889g4@g2.com', 'e10adc3949ba59abbe56e057f20f883e', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(26, 'bhavya clicnic', '44@g2.com', 'e10adc3949ba59abbe56e057f20f883e', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(27, 'bhavya clicnic', '88@g2.com', 'e10adc3949ba59abbe56e057f20f883e', 'india', 'up', 'saharanpur', '247001', NULL, 0),
(28, 'dhiman', 'dhiman@g.com', 'e10adc3949ba59abbe56e057f20f883e', 'Libya', 'Misrata', 'Zawiyta', '125364', NULL, 0),
(29, 'own', 'own@g.com', 'e10adc3949ba59abbe56e057f20f883e', 'Libya', 'Misrata', 'Misrata', '77777', NULL, 0),
(30, 'sanjay saini', 'sainirohit755@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'Turkey', 'Derna', 'Tripoli', '247001', NULL, 0),
(31, 'Assad', 'asd@g.com', 'e10adc3949ba59abbe56e057f20f883e', 'Libya', 'Sebha', 'Zawiyta', '12345', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(0, 'adeladmin', 0, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `otp`, `created_at`, `updated_at`, `deleted_at`) VALUES
('sankhyan.amit@gmail.com', '1528', '2021-05-19 15:38:25', '2021-05-20 08:28:05', NULL),
('muz@g.com', '2304', '2021-05-20 08:27:48', '2021-05-29 06:13:30', NULL),
('asd@f.com', '5117', '2021-05-25 20:59:01', '2021-05-25 09:00:05', NULL),
('ravik.ravik@gmail.com', '6223', '2021-05-28 12:13:24', '2021-07-28 05:40:46', NULL),
('varunbansal1715@gmail.com', '1863', '2021-06-03 03:36:12', '2021-06-24 12:20:47', NULL),
('sonalisaini998@gmail.com', '6655', '2021-06-04 04:16:32', '2021-06-04 00:05:21', NULL),
('sonalisaini020@gmail.com', '6518', '2021-06-04 00:13:56', '2021-06-04 00:13:56', NULL),
('doc@g.com', '8754', '2021-06-09 16:06:59', '2021-06-09 04:07:10', NULL),
('abc@gmail.com', '3968', '2021-06-21 11:31:34', '2021-06-28 10:08:17', NULL),
('reddy.reddy@gmail.com', '5322', '2021-06-28 11:40:42', '2021-06-28 11:40:42', NULL),
('gagansood777@gmail.com', '5199', '2021-07-23 06:20:27', '2021-07-23 06:20:27', NULL),
('doc12@g.com', '8929', '2021-07-28 18:01:35', '2021-07-28 07:11:04', NULL),
('bharat@gmail.com', '7302', '2021-08-23 06:14:03', '2021-08-23 06:14:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int NOT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `account_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `is_login` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `first_name`, `last_name`, `email`, `phone_no`, `gender`, `age`, `country`, `state`, `city`, `zipcode`, `password`, `remember_token`, `profile_image`, `account_status`, `is_login`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Gagan', 'Sood', 'gagansood7771@gmail.com', 'Sood', 'Sood', 21, 'Sood', 'Sood', 'Sood', 'Sood', '$2y$10$zfpQPQplN53zF9uYBP.5O.0tDYWRfdqA0Qf.WrYqWMafRYF/nWid6', 'eyJpdiI6Ik5TTEVVK2RFaGlhUGRXa0dmdjVYckE9PSIsInZhbHVlIjoiT3UrU1YvK0ZPbTVkTnJFZk1iVWVKdz09IiwibWFjIjoiZTRhZmNmYmZlZmM3MjE4MWE5ZDJhM2VkNWQ0N2E3ODMwNDRmOTBjNDUxNzZiNmUyNTc0MWI0MjA4NTZiNzJkYSJ9', '', '1', 1, '2021-07-22 20:07:34', '2021-07-23 07:08:44', NULL),
(4, 'Gagan', 'Sood', 'gagansood7779@gmail.com', '8221962777', 'Male', 24, 'India', 'Haryana', 'Yamunanagar', '135001', '$2y$10$C.Wjb3cU/WgIXlndsPjjqu4wxI.LzIjFfuhLYRQEjWAr2jJ5GfcuS', 'eyJpdiI6Ik55NU9FZ29tZVpUR1JTWlplQXIrcHc9PSIsInZhbHVlIjoidTJQaEF1ditGbVFLK2k5S1Y2MDVKdz09IiwibWFjIjoiNTY1YjMzN2Y5ZTFjNzNjM2MyZjg5MDkxOWM5MDgwMTU3ZmE5M2Y0NzY0OWQ2ZjBiYjJiZTZkOTE4ZTY0OGZhNyJ9', '', '1', 0, '2021-07-24 09:00:53', '2021-07-24 09:00:53', NULL),
(5, 'Shivam', 'Sood', 'gagansood777@gmail.com', '8221962777', 'Male', 24, 'India', 'Haryana', 'Yamunanagar', '135001', '$2y$10$2FNiK8zWBGV5H9XXLN9H4uXRshJ0J7.mPFLRnRw2RszhKtKgT7F1q', 'eyJpdiI6Imo0WDd0dVdqNGhWM09iU1NDY2ZVc1E9PSIsInZhbHVlIjoiZXlUQ1NxMnowY1d4YTVGdC9WcGJ2Zz09IiwibWFjIjoiNGJiM2I4ZmEyYzM2MTE3OWU1OTBlNWM1YTcxZTRkMGUwZmFjMjU5NzFiZDE2NzQ2MDk0YmNhZDk4NmJlMjFhZSJ9', '1627179053WhatsApp Image 2021-07-24 at 3.04.19 PM.jpeg', '1', 1, '2021-07-24 10:20:58', '2021-07-25 02:10:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_screen_ads`
--

CREATE TABLE `patient_screen_ads` (
  `id` int NOT NULL,
  `screen_id` int NOT NULL,
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_screen_ads`
--

INSERT INTO `patient_screen_ads` (`id`, `screen_id`, `name`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'image1', 'Hospital.jpg', '2021-07-25 02:33:26', NULL, NULL),
(2, 1, 'image2', 'Hospital.jpg', '2021-07-25 02:33:26', NULL, NULL),
(3, 1, 'image3', 'Hospital.jpg', '2021-07-25 02:33:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int NOT NULL,
  `provider_type` enum('1','2','3','4') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '''2''=Clinic'',''1''=Doctor''',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `visit_type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_from` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_to` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reapeat_schedule` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dr_choice` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reapeat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialization` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `training` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `languages` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aboutyourself` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `profile_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `account_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `provider_type`, `name`, `email`, `phone_no`, `gender`, `address_type`, `visit_type`, `department`, `country`, `state`, `town_city`, `zipcode`, `building_no`, `password`, `remember_token`, `open_from`, `open_to`, `reapeat_schedule`, `dr_choice`, `area`, `reapeat`, `specialization`, `training`, `languages`, `education`, `affilation`, `license`, `certification`, `aboutyourself`, `profile_image`, `account_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, '1', 'Amit Sankhyan', 'sankhyan.amiiiiit@gmail.com', '7018915635', 'Male', '', '', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$Xvl24nORVkct3LSGlm0Mc.5pAKRiWEkBbmWGBBZEpBa7i0lnJt5Pm', 'eyJpdiI6Im42cVpKNlIwTExHUk9wL3UxcHBxU1E9PSIsInZhbHVlIjoiYU1iSjZMNStxdS9WbVhTQUowWlVHZz09IiwibWFjIjoiMjllODQ2N2MwNDAyZGVjYWM3ZjgxMDI1OTJmOWY4YzIxNWJkOTM3NWQyMDFmZWE0NGZlMThhNzRlMjNmY2I3OSJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, 'test', NULL, 'new,new2', 'test', 'M,T,W', 'sdsdsddds', 'M,T,W', 'dfdf', 'fdfd', 'dfdf', 'default.jpg', '1', '2021-05-22 06:21:16', '2021-05-30 05:51:33', NULL),
(9, '1', 'andrew', 'andrew@gmail.com', '7018915635', NULL, '', '', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$UDjizbyGn7YmHLCLy76TX.joCpy4mUqWK8qPzs6bBz65NE07t2PJu', 'eyJpdiI6IklaK3pYanlCTU9wai91ZmdwK1g0ZXc9PSIsInZhbHVlIjoiUHRSTGZUa3cyWG9WNnBnVU9HSno5UT09IiwibWFjIjoiZDMwMjA3MzVlZTMwNmRkNWE5YTM5ODMxNWFmOGYwM2RlOWQ3OWM5OGEwODk2ZWUwNzA5MzgzNDI2OWY1N2I5MCJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'new,new2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-05-23 17:28:58', '2021-05-23 17:28:58', NULL),
(11, '1', 'juum', 'muzz@g.com', '7018915635', 'Male', '2', '[3,4]', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$CfiLsRIJF6.sRWT.LKYSEOEX.Mc5KyA/5MyAPsmsYAR4uCDxCnsPS', 'eyJpdiI6Im90UnNUV3Z6V1QvQ3Fuazd3Ym0vWlE9PSIsInZhbHVlIjoiOHNjZllWam9oOVR0NXBVamI1eUlKUT09IiwibWFjIjoiMDc3YmU1NzRhYTA1MmRjNTBiNmIxMWVlMGU1MGRhZDNiNDZiZGFkMjk5Zjk3ZTM3ZmQ3NWFmNTgwZDNlN2U2NCJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'new,new2', NULL, 'M,T,W', 'sdsdsddds', 'M,T,W', 'dfdf', 'fdfd', 'dfdf', 'default.jpg', '1', '2021-05-23 17:55:21', '2021-06-29 07:40:30', NULL),
(12, '1', 'ghvvhgj', 'hh@g.com', '1234567890', 'Female', '', '', 'QWE Department', 'Turkey', 'Misrata', 'Aibayda', '1234567', '123123', '$2y$10$jGWv4pXQdRS/i08BzDpo6ObUDjhHKRgQHUX8ASD48DZjtZeHQnxZ6', 'eyJpdiI6IjI0QWdOMzNRT21PVWI2U3JOMFQwYWc9PSIsInZhbHVlIjoiU25Vb3krc292VUlHVzdZSi9pQVBUdz09IiwibWFjIjoiYTFiNWU0ZTFlNGQ2ODRmYzlhYTAxMzBiZTQyZWI2YThmMjlhZTQzZGIxYWU2ZGM4N2E3Nzg5OWRhMTJmMTNmMyJ9', NULL, NULL, '', '', '12213', NULL, 'Heart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-05-23 18:22:31', '2021-05-23 18:22:31', NULL),
(13, '1', 'adss', 'asd@g.com', '7778775898', 'Female', '', '', 'XYZ Department', 'Turkey', 'Zawiyta', 'Zawiyta', '7778', 'sfdsz', '$2y$10$rg39nByr4eFRFxj9jzBLsuYAXlC8UUi6NPrrUsvZjB01Ylibs1IP.', 'eyJpdiI6Ildpb0tmTm9VNnExNWxRMGR3eDhzWFE9PSIsInZhbHVlIjoidC8rc1VldUZjcytvRGNRV0V2Tjl1Zz09IiwibWFjIjoiZGQ0ZWMxYmE0YmJjYTVjNDJkM2I3YWY2YzlkNzM4ZmQ4ZDg4MDk4NjhkYTIzNzlkMmU2NzAwZjQ1MDg2NmI4YiJ9', NULL, NULL, 'M,T,W', '1', 'xxxxxgfaaa', NULL, 'Heart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-05-23 19:44:52', '2021-05-23 19:44:52', NULL),
(14, '1', 'jass', 'jass@g.com', '7018915635', NULL, '', '', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$X8Dn.Y5eCu3WMOcttkHOUuXD9N5YoVQ0Gm1dTMwvptTII71QwtMPm', 'eyJpdiI6IlJZVUtYTDZBRXJNb2FYVHV4a0YxWXc9PSIsInZhbHVlIjoiVzJhUWI4RDdNRlN5WDhZY0RPVjZSZz09IiwibWFjIjoiMTMyMGU2NDYyNjVlOGIzNmMzZDcxMmY1NDcwMjRlNGJhOGY3OWZiNmU1Y2U0M2E0Mjk3NTY5NWY0NDMzZDdjZiJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-05-24 03:43:33', '2021-05-24 03:43:33', NULL),
(15, '1', 'new jass', 'jassnew@g.com', '7018915635', NULL, '', '', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$1/ezrllzJM13GDLguqVnw.T5uK/kbGvDUL8b./dNOLh77Q0sUZuoa', 'eyJpdiI6Ik5GcDB2TFkyRDVGZitOSExCUDlRaEE9PSIsInZhbHVlIjoiMEFMN0wyOThPeDJTTU4rUFFCN1h0dz09IiwibWFjIjoiYzdiOWJmYzBmNmUyY2VlMWYzOTE4MjhjMzk2ODVhMGQzM2U1ZWM3MmQ2Zjg0MjA2YjBhYTAzZGZkYmUyMDdjNiJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-05-24 03:49:37', '2021-05-24 03:49:37', NULL),
(16, '2', 'xxxxx bss wha even', 'as@v.com', '1478522588', NULL, '', '', 'QWE Department', 'Libya', 'Sebha', 'Zawiyta', '158411', 'fdderff', '$2y$10$S/T67dnB1NrHU0KLbLATcepCkPUfNsef7EBDkm8v6ifwWyiglZGbu', 'eyJpdiI6Ii9wVmZrTHRpYytWZGFrWjRHOHN1dHc9PSIsInZhbHVlIjoiams5ZmNxU3hzSHhkODJCQ252cGZRdz09IiwibWFjIjoiZTZkMGI2MzI5NmUzMmUwNDA3ZWNhYWIzOTM5MDY2NzJlOWFkMWQzZTZmNzQxZDRlNmZjYjkwYzU1Y2ViNTcxMiJ9', '04:25 PM', '05:25 PM', '', NULL, 'fvsvedd', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-05-25 20:55:29', '2021-05-25 20:55:29', NULL),
(17, '3', 'dgdg', 'asd@f.com', '1472583815', NULL, '', '', NULL, 'Tunisia', 'Zawiyta', 'Sebha', '1478523', 'gfcvffcf', '$2y$10$ToKH4wrRnp9GbXtVzbjMMuDFYeh3DKs2F3ea3S5yWfIFOzvh5sODy', 'eyJpdiI6IlBiS3hqcGd0ZTF6SU1IUm84R2hEdFE9PSIsInZhbHVlIjoibnRIY3psb2E3UkVlYytIcGJOOVFCZz09IiwibWFjIjoiOTdjYTZlMjg0MjVlNThkNDJjMGYwNDliMWIwYzJkYzA2YTg5NWUwNmNkZTBhNjkyNDIyY2Y0NmRlMWQwMTYzNyJ9', NULL, NULL, '', NULL, 'd  ge dgr', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-05-25 20:56:25', '2021-05-25 20:56:25', NULL),
(18, '1', 'varun', 'varunbansal1715@gmail.com', '90344841715', 'Male', '', '[2]', 'ABC Department', 'Libya', 'Misrata', 'Zawiyta', '43888888', 'testing', '$2y$10$s1bLXi15IHKPZ2M4obeuHeLPlqcO6p.IHo144w6abw8h2DAeKPDcG', 'eyJpdiI6ImUrSlZCSnhUL3ZnQXA0aDlJVjNBaFE9PSIsInZhbHVlIjoiNFZzUGtodnhuUWJmbWRuc0NVOFdBZz09IiwibWFjIjoiYzBiZDhmZmM5OTJkNGNiMmYyMzMzODViOGU5NTEzNThhMDg3MjJmYWFiMmU5MWYwY2E2MzY5Nzk5NzM2ZjNlYSJ9', NULL, NULL, '', '1', 'fggg', NULL, 'Heart, Eyes', NULL, NULL, 'khalsa collection', 'HOSPA, HOS1, HOSPC, HOS2', NULL, NULL, 'hii', '1625653076scaled_image_picker8262320937560906350.png', '1', '2021-05-26 18:09:31', '2021-07-25 05:29:32', NULL),
(20, '1', 'Ram', 'ram@gmail.com', '825882235558', 'Others', '', '', 'QWE Department', 'Libya', 'Derna', 'Sebha', '85888', 'ok', '$2y$10$oRC3WVKc1PGO.osZrABfbuxg5IMej2yv1S1ruteEsDW7tsY67.CX6', 'eyJpdiI6IkxPSUhLVk1jeWNpNkRHYTV4UEdKOFE9PSIsInZhbHVlIjoia0RLbjVybk80YTd3QXhkdkx3VUU4UT09IiwibWFjIjoiY2NmMGEzNjQyOWI1ZTUyYTM1Nzk5ZTQ0Mjc0NmJlOTdkM2ZlMDFlMDdhODY1MDFlMTgzNTMyMDIxZGVmYjZiOSJ9', NULL, NULL, '', '1', 'ok', NULL, 'Heart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-05-28 12:16:54', '2021-05-28 12:16:54', NULL),
(21, '1', 'Munich', 'mm@g.com', '1234567898', 'Female', '', '', 'XYZ Department', 'Turkey', 'Behhazi', 'Aibayda', '1234', 'sdfsdf', '$2y$10$9R7h4JIWJfnGdudgxXe70.adiu3NyDGNtBwWDAwqD6HWyNw8TmuFO', 'eyJpdiI6ImVKMnpub2FoTS9Vcm5wMFUwNytGYmc9PSIsInZhbHVlIjoiRzdyaEQ0dHh2SmhqNHExZFJ4NlJudz09IiwibWFjIjoiNGFjZTc1YWEwNmZkNTc0NGMzZTQ2YTQ4ZTBlMjc3YjZmYTExZGViMTBjN2FjMmRmNmFhNDQxZmI2YjJlZjE1OCJ9', NULL, NULL, '', '1', 'dfdf', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-05-30 07:06:39', '2021-05-30 07:06:39', NULL),
(22, '4', 'dsd', 'ds@g.com', '1234567887', NULL, '', '', NULL, 'Turkey', 'Zawiyta', 'Misrata', '435345', 'gdfgdf', '$2y$10$DPfJ.LNx4zVLex8YMXEjdeLOtxgB9MMUWl1vHNFRIk4qAeIZ8AB9m', 'eyJpdiI6ImR1ZGcreWxqLzdJMXpFVkxpaWN2a2c9PSIsInZhbHVlIjoidHVibFJpN0hIZyt5WDMwa3B4cThHdz09IiwibWFjIjoiNjcwNzdiMWM3ZDM1M2FmYTcwOTJjYzYwMjhhODQxZDFjMTFjZmRjMmI3YzkyYTE5ZDZlNGY4NDQzYmU0ZWU3OCJ9', NULL, NULL, '', NULL, '35345', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-05-30 08:56:52', '2021-05-30 08:56:52', NULL),
(23, '1', 'Muzz Ali', 'muz1@g.com', '123213123123', 'Male', '', '', 'Test', 'Turkey', 'Zawiyta', 'Misrata', '123123', 'sdasdd', '$2y$10$MwKfc9c7ypcu0Gk66A3hEen9LfR7fgrAOJCsIvW3K7AH13wrTaWKS', 'eyJpdiI6ImNmWFFBc0w1N0Z0RmwyN2hJWms2UGc9PSIsInZhbHVlIjoiZHhBajhLdlVadVg3aU9VRHBaMHZQdz09IiwibWFjIjoiYzVmYTE5MzBlY2I5ODMyYzNkYzlkOGVjZjIxMDEwNGRkN2M1MDhlNzRiNzc0YzY4ZTE0ODcyMzgxNzQ1NGViMCJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, 'sdsad123', NULL, 'Dental, Heart', 'asdsadasdas', 'English, Hindi', 'asdasdasdasd', 'HOS1, HOS2', '1232131212asdasdasdd', 'adadasdsad', 'asdasdasdsad', '1622403147image_picker_3763E9D2-9727-4151-89D8-D9A024725222-56945-00002D94C916D059.jpg', '1', '2021-05-30 18:10:38', '2021-05-30 07:32:27', NULL),
(24, '1', 'Ravi', 'ravi@g.com', '12321312323', 'Female', '', '', 'ABC Department', 'Libya', 'Behhazi', 'Misrata', '12344', 'dfgdfg', '$2y$10$U.1BfBK/1WcUAvjyJPoxtu88N2k3BY2C6xyOSIkpFWnGNdITfd3.2', 'eyJpdiI6IjJQbzdiWlAydFhWT042SHVOdlZ1U2c9PSIsInZhbHVlIjoiUndZdm1lZDMrd0t3K0wyQTlLaXoyZz09IiwibWFjIjoiZWVjYTdhY2E1YTNhZWM5OWRiMGVhZGE4MmQ2OTYwYTg3YTI1MmZkYTgyMzkzNTUzYmQzMWQwZWJjZDhmNjU5NSJ9', NULL, NULL, '', '1', 'fgdfgdf', NULL, 'Dental, Eyes', 'sdfsdfsf', 'English, Hindi', 'sdfdsfsdfdsf', 'HOS1, HOSPC', 'dsfsdf23', 'sfsdfsdf', 'sdfsdf', '1622404083image_picker3590735693362755133.jpg', '1', '2021-05-30 19:38:41', '2021-05-30 07:48:03', NULL),
(25, '1', 'sonali', 'sonalisaini998@gmail.com', '9045433492', 'F', '', '', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$konVOr6sWKbvkr7mScbgOe1pm/LKpd/G2x6ZVQxVfVMkxJAudIDU2', 'eyJpdiI6ImtoZnpUaW0wOSttMllWMTlZaFpjbnc9PSIsInZhbHVlIjoidG04MDI3U2JOU3pWeGpuejFyakorQT09IiwibWFjIjoiNTU3MjY5N2E0OGM3ZjJiYWViMDkwMWE3NTlkZDMyYjBjMDhiNTVlMDRiYzNmZWU2OGI4ZjYyMmJiZjQ4ZmI3NiJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-04 04:14:31', '2021-06-04 04:14:31', NULL),
(27, '1', 'sonalisaini', 'sonalisaini@gmail.com', '9045433492', 'F', '', '', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$K.Sk8qG7RMSkkL1JtcjjeeZLOtB1iOHqtdZ12GHqxI0V30IsBSSq6', 'eyJpdiI6IjFuOEdCZDBJdEZydnp0b1JCUVhGVHc9PSIsInZhbHVlIjoib1BCd0c4NEs5T1MyZW5tc0NTT1ozQT09IiwibWFjIjoiY2M4OTQ0ZWMwNGM0MDIxN2U3NDM4YjQ4ZmRkYzBlYjM3ODVlZjFjYjYxMWU0MTY1ZDlmMTJiOTc1ZjU5MThmNCJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-07 03:57:02', '2021-06-07 03:57:02', NULL),
(28, '1', 'newdoc', 'doc@g.com', '32234223123', 'Female', '', '', 'QWE Department', 'Turkey', 'Aibayda', 'Zawiyta', '2332', 'sdfsdfsdf', '$2y$10$2Am8FENiORyUWOKDIVo8POTAOqc5YVK3hiTsr.IIVuGqna2YXlTfO', 'eyJpdiI6IldVZm1uOEEwWWs3SUt2eW9IK2pVVHc9PSIsInZhbHVlIjoiTzFvWUNPYlhMWUl6RlJ4VVBPWFN1QT09IiwibWFjIjoiNzAwMGYzMjFiMDhhMDI2YWE1ODViMDg0Njg0ZWMzODk3MWNhZGZmNGMzMWI2MjNlNjViNWY0YmVjZjcwNmRlMCJ9', NULL, NULL, '', '1', '3fsfsdf', NULL, 'Dental', 'asdasd', 'English, Hindi, French', 'sadsad', 'HOS1, HOSPC, HOS2', 'sdfsdfd', 'sdfsdf', 'sdfsdf', '1623092318image_picker_C1F0F3EF-544E-4913-B235-B25D47ACE2BE-79499-00005652304CB213.jpg', '1', '2021-06-07 18:27:34', '2021-06-07 06:58:45', NULL),
(29, '1', 'hello', 'he@g.com', '1258458584', 'Male', '', '', 'ABC Department', 'Libya', 'Behhazi', 'Behhazi', '7444', 'fwddxs', '$2y$10$CleDTJJ2KhOyuWuheD3x2ectvQZ3LXurQYeIeTl4iE6I0Kcg2v.dG', 'eyJpdiI6ImZnWEVleWxYNTFhSGkwSm1ZOHRXcWc9PSIsInZhbHVlIjoiSzZZdGdyUXFxYlFnd0FXSGVUZjh2QT09IiwibWFjIjoiYTY5MGM2NjY1Y2UwZjRhMzE3Njg3NGM2MzJjYzFhNTY3ZjRlN2NmNGZkMDVkZTk3YjExZmQzZDA1OTU1OTc5NyJ9', NULL, NULL, '', '1', 'dsds', NULL, 'Heart', 'ghbjjn', 'English, Hindi', 'hnhjbjnn', 'HOSPA, HOS1', 'ghbn nn', 'hjvnjn', 'hhjbnn', '', '1', '2021-06-08 04:48:37', '2021-06-08 04:57:25', NULL),
(30, '1', 'myname', 'my@g.com', '1234567654', 'Male', '', '', 'ABC Department', 'Turkey', 'Misrata', 'Tripoli', '121321', 'asdsad', '$2y$10$/qj7Ircb5iONskA4pOI.ZegrZ5kwuKeEMgMU.g44txqOd8vF5an3u', 'eyJpdiI6IkZZaW9TMzRTME1NUG9mbzBBTVdQQ3c9PSIsInZhbHVlIjoiWTl2N3RDSHEyK2lscVEzLzAwTk9GQT09IiwibWFjIjoiMjJmMDg1ODYzN2Y1ZDEzMDFiNWQ3NDk5MGRhZGVlYjQ1ZTJlMmJlZWQ5NmU1YWM3NTliZjIwODlkMjA3ZjRmMiJ9', NULL, NULL, '', '', 'cssdcds', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-09 08:00:51', '2021-06-09 08:00:51', NULL),
(31, '1', 'doc', 'do@g.com', '12345623232', 'Female', '', '', 'QWE Department', 'Turkey', 'Tripoli', 'Sebha', '12123', 'asdasd', '$2y$10$uBS9NFDrGWrJM/GHr1.pe.CivInKskB4GhGFKCwK9qr7A1WXK/9G2', 'eyJpdiI6InltWDVxV1F1M0lxNGJkRUFDUVpvK3c9PSIsInZhbHVlIjoibDVwQmFWMFU4SFVMZ2h2TC95MGpFZz09IiwibWFjIjoiMjk1YTk1ODA5NGI1YTQ2OTcyYmQwYzU0ZGYzMmMxNzY2ZjA2NjI3NzhlMzcwYjg0ZDc2ZmVmNjM5YzNlMTQxZSJ9', NULL, NULL, '', '', 'dasdasd', NULL, 'Lungs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-09 15:19:38', '2021-06-09 15:19:38', NULL),
(32, '1', 'gg', 'gg2@g.com', '1414141114', 'Male', '', '', 'ABC Department', 'Libya', 'Misrata', 'Behhazi', '8444', 'fwdesdd', '$2y$10$Ww9ZpOgVJTO54BYJwwEC8eEKzDHxZia.UNUaqFHl6p65ww9S.EV4K', 'eyJpdiI6Ik15VDNLeENOdzRPYUZ2Uk04VE1naVE9PSIsInZhbHVlIjoiODBySlN6K2RPNXhQcG5ISkt1N2VVZz09IiwibWFjIjoiZmRmNDI1ZGNiYzFkYjYzM2RjY2Q4OTc3M2UwY2Y1OWU5OTBjZjRjMzJmZTFkMjg1OTA4MTAyNDNkNDAzMDRhNCJ9', NULL, NULL, '', '', 'fedsdfra', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-10 06:04:48', '2021-06-10 06:04:48', NULL),
(33, '1', 'hh', 'hhb@g.com', '1414141414', 'Male', '', '', 'ABC Department', 'Libya', 'Zawiyta', 'Behhazi', '548484', 'fedsds', '$2y$10$CrVsLrfzvvE9HFwiw0L40uHIAc9Zu7wCKjaZdvZvo7ySzQaIXDKEG', 'eyJpdiI6IlV2cktNOEdOVEtKR0k3ZWxmaktHU1E9PSIsInZhbHVlIjoiamVNdWxuQTJIZCtJNEIwQkpEellqQT09IiwibWFjIjoiZGM4M2QwMDVlMmViM2VmNDgwNzk1YmM2YzUzZTIwNzM2MmFiNWVkNzA4OWQxZDU1MGI4ODRhMmNkNzlkZGM0NiJ9', NULL, NULL, '', '', 'feda de sdds', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-10 06:16:10', '2021-06-10 06:16:10', NULL),
(34, '1', 'abc', 'abc@g.com', '1253535353', 'Male', '', '', 'ABC Department', 'Tunisia', 'Misrata', 'Behhazi', '1414141', 'faxessddw', '$2y$10$iK3AQgDzv8dQXyHpLbXOFearaecuT8Vh9wOFu7AVio7Qp2xTB15LG', 'eyJpdiI6InpJQzR2Y2hxTklsVkx1cXFHaDR5Z1E9PSIsInZhbHVlIjoicTZvcHJ4cGZlT2J6cmlFVVIrb3FEQT09IiwibWFjIjoiN2ExNWNkY2MzODI4ZGYxNjkxN2VkOWYyOWQ0Y2I0NDNiNGY2NjA1MWJjMTQwNzMyZmQ5M2U2YjBhMzY3MWYyMiJ9', NULL, NULL, '', '', 'dsxsxd', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-10 06:19:35', '2021-06-10 06:19:35', NULL),
(35, '1', 'ram', 'ram@g.com', '1231231231', 'Others', '', '', 'XYZ Department', 'Turkey', 'Misrata', 'Tripoli', '123', 'adsad12', '$2y$10$AkwjeRZ6Hhl/SxrZGg4aUu1tmFHIQN/QJygNAbXrOhFnOFNRLJQBC', 'eyJpdiI6IlhvRzJCZ3BOMHFQRkJiUzVYeDZOWkE9PSIsInZhbHVlIjoiY2F2RFBhVHpQbld3RUxiQjJSRTJ5QT09IiwibWFjIjoiNDYwZTlhY2JlOTUzZTIxMjBlNmFhNDY2OTg4ZjhmZGY1ZjA1OWJhN2Y2NmFjNDc4MGMzYjUyNTE0NjA1YTE1MSJ9', NULL, NULL, '', '1', '123sdsf', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-12 16:45:13', '2021-06-12 16:45:13', NULL),
(36, '1', 'mm', 'mmm@g.com', '21466126661', 'Male', '', '', '123 Department', 'Libya', 'Aibayda', 'Aibayda', '1232', 'asdsad', '$2y$10$VsytZs63Ycvr5Lyd0cYbqOWZsdldYt7lBr9gw2htHADOyTdYoU3Lu', 'eyJpdiI6InlqQUNBa1dGS2NsVFJjdytkdStvOFE9PSIsInZhbHVlIjoiUitZS2h4aW1LVWFwbHRhcXcxL1Rjdz09IiwibWFjIjoiZGZlNWUyM2U1MjFhYzQwMTc4YzU4N2IyZDkyZDliMjUyNmZmNDJmNjllM2Q2Mzk4N2MwNzRhNGI1N2UzOTIwOCJ9', NULL, NULL, '', '1', 'daasd', NULL, 'Lungs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-13 07:06:30', '2021-06-13 07:06:30', NULL),
(37, '1', 'sonalisaini1', 'sonali@gmail.com', '9045433492', 'F', '', '', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$9KsB8G3zJdKQY5ZX05A5gOf99OIhPS.0ekLflNXMwrRxVX35rqPzm', 'eyJpdiI6InhLVUR3Z1dxc1gzYkRsbVdaVWpUYUE9PSIsInZhbHVlIjoiK1lWYVBKVUFXbnVOUzJnTFd2MjZFZz09IiwibWFjIjoiNzg2MDIyZTMyZTk4ZjJjNTE0ZTY4YjQ5NmJhYjViNjM3MzEyNGRlZWI0YWYyOGNhNzkxNmM4MDk4MTczM2Y2ZCJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-13 08:32:05', '2021-06-13 08:32:05', NULL),
(38, '1', 'newone', 'newone@g.com', '2121123213123', 'Male', '', '', '123 Department', 'Tunisia', 'Derna', 'Aibayda', '1232133', 'adasd', '$2y$10$dsuDmyoYHrGmVv.zib2Xu.q.J//Av2xs5CdZS2q.3X3W4rJd7tuhm', 'eyJpdiI6IjBpbFZ1d2ZBb0M1VmhXRVZVcUkyZnc9PSIsInZhbHVlIjoiSEhUUW1NbXpLaSt3d1htcEZtNTk0QT09IiwibWFjIjoiOTk2NGM5NWM5MmJkZDNkYzViOWIyZDQ4NWMzOWIxOGI3MmY0ZGNhZTJlOWJhZWNjYWUxN2JlY2RkZmMzNGE5NyJ9', NULL, NULL, '', '', 'ssdasd', NULL, 'Eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-13 08:35:51', '2021-06-13 08:35:51', NULL),
(39, '1', 'app', 'app@g.com', '1212121212', 'Female', '', '', 'ABC Department', 'Libya', 'Zawiyta', 'Misrata', '12312', 'asdsad', '$2y$10$SquvYtyB0n/2pqLlRfj5I.TgmabOQiCIOAqhS/xZz4ApwiZlqXKXO', 'eyJpdiI6IlhRK2hWRXkxVjViODg5UVVhQTJwbUE9PSIsInZhbHVlIjoiV2NzRUlQSlZOV2ovZ3lDNU5SeGdydz09IiwibWFjIjoiZmQzZjc0NzZiNzhkNzFhY2YwOTcwZTE1NTkwOTVkMWUxNDA5ZDg1YzgyNzMxOTY3Zjk3YWUzNDc1MWJkN2EyYSJ9', NULL, NULL, '', '', 'asdsad', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-13 14:40:35', '2021-06-13 14:40:35', NULL),
(41, '1', 'hh', 'hk@g.com', '1212121212', 'Male', '', '', '123 Department', 'Tunisia', 'Sebha', 'Zawiyta', '12121212', 'asdasdsad', '$2y$10$o67vS3pjDtI1BNiigGnEyuB75KtYxshhvwK1RL/129QBpbGTPhBda', 'eyJpdiI6IjFLL2VhcCt3YUZtVEx5T29XZDdkOHc9PSIsInZhbHVlIjoiSWhKMTd1NHBGY0ZnUVZjSlRXeWxhdz09IiwibWFjIjoiODZlZjM5OTU5YWJiOTZhYWJkOTdiODk3ZmY5NWI0YjFlOTI0NjhkOTQwZTFjNTQ5ODI4NDZjYjNmYzEyNGVhNCJ9', NULL, NULL, '', '', 'asdasd', NULL, 'Eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-14 05:05:09', '2021-06-14 05:05:09', NULL),
(42, '1', 'sonalisaini1', 'sonal@gmail.com', '9045433492', 'F', '', '', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$PYWPDoCH73NsyoYjYB5PzesQlD9Q/i/g9mzyJvoshXETNLLVPQM2y', 'eyJpdiI6ImJ1MnhhaVA4TXk3MitGRXUvc2NxS2c9PSIsInZhbHVlIjoiaHRnR0lVeEFnTE9Ba05uYmxUVnlJQT09IiwibWFjIjoiMTg1ODRlNzVjNDI0Y2JiNjRhMjc1M2NjMGM5MTliOTA0MTVhMTkxNjNiMDE0OGI5OTlkMzc4MjAxOWYwYWQyZSJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '0', '2021-06-14 07:11:38', '2021-06-14 07:11:38', NULL),
(43, '1', 'mm', 'm2@g.com', '112233445566', 'Male', '', '', 'ABC Department', 'Libya', 'Tripoli', 'Behhazi', '12121212', 'asdsadsd', '$2y$10$E0FrH6hljlhlXSRHr63bI.59fRmdEJK66LRB9EJ/SU6mGacg98CPW', 'eyJpdiI6IjZVQ2VsVGtVamRjbHJYRTVTR01ISmc9PSIsInZhbHVlIjoiamNGTVpSMEhUZTJKMGV1ekRRL2JNdz09IiwibWFjIjoiYTZlNGEzZWE4ZmNkYTZjNTUwNThjYTg5MzA3OTNlOTJkNjg4Y2Q1NGYzOTJiNWFkNDUyNDk5MWM3MTA5ZTNhNCJ9', NULL, NULL, '', '', 'asdad', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-14 07:27:43', '2021-06-14 07:27:43', NULL),
(44, '1', 'sonalisaini1', 'sonalisaini020@gmail.com', '9045433492', 'F', '', '', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$rqg6NrcDJo0wAfWTlF.x4uL7sWUX0V9FMwyBP/NG/zXnAE.2tCQSu', 'eyJpdiI6ImdKMXJWbysyZlJMWGpEZ3BiOEtyNkE9PSIsInZhbHVlIjoiQ2xYRERGTTZDN1dBU0FpQTdycktQUT09IiwibWFjIjoiZGNhOTcwYmVlYmZhMmEwYTI4YjU2ZjU3MDcyMWQ4NmEyNjc0N2E4YzY5OWJjZmQzOTVlOWQxOWIxYTNmOTU1YyJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '0', '2021-06-14 10:12:40', '2021-06-14 10:12:40', NULL),
(45, '2', 'cc', 'cc@g.com', '1122112211', NULL, '', '', '123 Department', 'Turkey', 'Misrata', 'Behhazi', '12213', 'asdasd', '$2y$10$FQyZYD5YBinjAddnll0fi.oMqF9GutjKtf63WBoj8vVPjPqLcbWbW', 'eyJpdiI6Imc2WmJsQWM1U1JxWFVDekVnY3Z4enc9PSIsInZhbHVlIjoiS2kwZ2NHRk5CRDJYcGU3ejB0SUhsZz09IiwibWFjIjoiYzRkNzM5MzcxMGFlZDY3MmYxNDQ2ZWRkZjg0OTdhOWE0N2QyNmU1N2IwZTAxYmVjOGJiNTM2ZWUzNzMyMjcwZSJ9', '08:24 AM', '07:24 PM', '', NULL, 'asdasda', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-17 17:54:27', '2021-06-17 17:54:27', NULL),
(46, '1', 'newdoc', 'newdoc@g.com', '1212121212', 'Male', '', '', 'XYZ Department', 'Turkey', 'Zawiyta', 'Aibayda', '12121212', 'asdasd', '$2y$10$AiegLdJ4Kpyg4e77Z5SgmuhyyeERbvwSLySK31Rb6VGtOYPA7dhNe', 'eyJpdiI6InZBMU9VdjJhRFdBcGFXc3BQNFRPRnc9PSIsInZhbHVlIjoicTlwNHh1d2VVdWpKZ0ZEbGlkb1BnUT09IiwibWFjIjoiYmFmYzZjMTgwZmM4MTllYTc3YzIwYTRjNDAyZDNjZjc5OTc0YzdlMTU1Yzg2OWM4NmZlMjhlYjM5NWQ2YzFlYyJ9', NULL, NULL, '', '', 'asdasd', NULL, 'Eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-19 08:22:57', '2021-06-19 08:22:57', NULL),
(47, '1', 'juum maan', 'muz@g.com', '1212121218', 'Male', '2', '[1, 2]', 'XYZ Department', 'Libya', 'Zawiyta', 'Zawiyta', '121212', 'asdsad', '$2y$10$1FhlNsHSuU5Ip6ueb45htO1K/pNZe0uj4WE5JS9pUXTF/XJ9Jhx4a', 'eyJpdiI6IjRJd1dqdDNJcVUrUDk2RzhqdkVmRFE9PSIsInZhbHVlIjoiUjRheTkyZHVhcVJMakhscWR4dlorUT09IiwibWFjIjoiMDkzOWQzMzU2ZTc1NDA3NTVhOTAzZjNlM2ZmZTFkZTcxZDRhOTg3YzlhZjg4NmI2YTBmZmViZWExODc2MDFmYiJ9', NULL, NULL, 'M,T,W', '', 'asdasd', NULL, 'Eyes, Lungs', NULL, 'M,T,W', 'sdsdsddds', 'M,T,W', 'dfdf', 'fdfd', 'dfdfhhzuzhshsgsususgsvsgyshsvsgshshsgshshsgshhshdhdhdhdhdvdgdhsvsvhshebsvsgshsbsvshsbbsbshsbsvsgevvevsvevebegevevevhebdbsusjejehehuehdbdhshehehdgshshehshsbsgyshsgsgshsbshehhshsgshsbshhedfdfhhzuzhshsgsususgsvsgyshsvsgshshsgshshsgshhshdhdhdhdhdvdgdhsvsvhshebsvsgshsbsvshsbbsbshsbsvsgevvevsvevebegevevevhebdbsusjejehehuehdbdhshehehdgshshehshsbsgyshsgsgshsbshehhshsgshsbshhe', '1628003613image_picker_FBACE302-C17D-4235-BAB9-8B664972AB9E-36062-00001BF221BABB96.jpg', '1', '2021-06-19 19:12:09', '2021-08-22 01:11:37', NULL),
(48, '1', 'abc', 'abc2@g.com', '1122112211', 'Male', '', '', 'ABC Department', 'Turkey', 'Zawiyta', 'Zawiyta', '123213', 'asdasdasdasd', '$2y$10$qB189h3DjGGfmOnPD77Nq./hvIK.qUh7lzsfTo69UJAIDzLNJefiu', 'eyJpdiI6IlZaR2dJZ0h6MFdUU0NCWTlXblRXSWc9PSIsInZhbHVlIjoiTG8wZERBU2N1Q1BYSGZZa1hZMEwrZz09IiwibWFjIjoiMTYyMDQzMmE0MzM1ZDRkY2U1MWQwYWJjYmZhZGViZDdiNzUxY2JkMDgwYTI3OTNlNWI3ZjUwNGEzZjZiMWVhYiJ9', NULL, NULL, '', '1', 'adasdada', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-20 12:43:40', '2021-06-20 12:43:40', NULL),
(49, '1', 'rm', 'rm@g.com', '1212122121', 'Male', '', '', 'ABC Department', 'Libya', 'Misrata', 'Misrata', '141414', 'fedass', '$2y$10$jeNZecFLWOX4DxcVpJ6f3e/6T1zFLmcsNYpmqHtA1nOkg7Arba4Ve', 'eyJpdiI6Ik1OSlFwK0VHdUowdWhBdmNXK0x3WEE9PSIsInZhbHVlIjoiK1hRNmpEN3VlME9kZXFVblZlczJXUT09IiwibWFjIjoiOTFhM2E5YjQ3YzRmZDNlNWZhOTU4NjNlZmViYzkxNjUyYTdmNjQ2N2IyYzAyM2JjODU0NjcxY2MyYmU5NWZlYyJ9', NULL, NULL, '', '', 'xaxsdd', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-20 13:22:02', '2021-06-20 13:22:02', NULL),
(50, '1', 'asd', 'asd1@g.com', '1212121212', 'Male', '', '', 'ABC Department', 'Libya', 'Tripoli', 'Tripoli', '121212', 'asdd', '$2y$10$mPOhiT7zIh6CghsTUDT8P.XHMdJqyn9pbG3Ogm/ZDIOsUsQtjw6ge', 'eyJpdiI6Im5Ld09MajJIN3YxUFhQQW9aU1pqUUE9PSIsInZhbHVlIjoicVgxWWVvMFJDcFVWV2dkU2xnR21zQT09IiwibWFjIjoiZjAzNjhlYTRmMTZjZGM5ZWM0MmM0OTllMjVjNTgyMTFiM2Q2MzRlNTYyMjU5YmM0NzBkYWQ1NzkxNDQ3OThjNCJ9', NULL, NULL, '', '', 'asdad', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-20 16:30:36', '2021-06-20 16:30:36', NULL),
(51, '1', 'Raj', 'raj@gmail.com', '8548752483', 'Female', '', '', 'QWE Department', 'Turkey', 'Aibayda', 'Aibayda', '85214', 'fine', '$2y$10$iEZmV45ISpluRUZGULTcYebxP7v6IuiGlY3SbXZA.IDcaV1le2pHC', 'eyJpdiI6Ijg5UllmNFdidm5qeWlxamlzZ094QlE9PSIsInZhbHVlIjoiNFcwVW9lUFRFbXZ0dTBwNnRGQ2xyQT09IiwibWFjIjoiOGNlMTQzMWE3MDY2ZDhlODc4NjY0ODEyZmU5MGY4ZmM1NzY3OTRlOTA5YWYzMDNkYTU2NWYzMmQ2NDk5OWIyMiJ9', NULL, NULL, '', '', 'ok', NULL, 'Heart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-21 05:33:15', '2021-06-21 05:33:15', NULL),
(53, '2', 'Apollo Clinic', 'apollo@gmail.com', '8794568795', NULL, '', '', 'ABC Department', 'Turkey', 'Aibayda', 'Zawiyta', '207808', 'ghhcf', '$2y$10$QMG35N2zFVRk6uLYLv0c7efLMe96mBcJzsKq8Yf7G3W9LsfU95PzK', 'eyJpdiI6Im93WTFPM3lsQ0JRLzhOWitmR1B3SkE9PSIsInZhbHVlIjoiZ2NZc0pnQkhrMnI2Zy8vc1gwYjZnQT09IiwibWFjIjoiZGM5Yzc1NDIyOThkM2E1MDY2ZjdhYmQwYzNkMmEzN2UyYzM1Y2M1MGE1ODg5OWRmYTNmYTMyZWFjNjg0Nzc5NyJ9', '06:00 AM', '07:30 PM', '', NULL, 'okay', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-21 10:06:06', '2021-06-21 10:06:06', NULL),
(54, '3', 'abc', 'abc@gmail.com', '8888999955', NULL, '', '', NULL, 'Turkey', 'Sebha', 'Aibayda', '567789', 'c11', '$2y$10$V6GsO1ieH759xqmVgLdpcO4qX/g.Fqx.HbUtEpKcZvBbJcDqUxgC2', 'eyJpdiI6IjBYa3oxZHJEdmxvMlZ5ckFGSlMzOXc9PSIsInZhbHVlIjoiZmUzcVJNWFlQMDdlUTFXck9GelM0UT09IiwibWFjIjoiNWQyNTY3MTg2M2Q5MTVhOTJlYzI5NTM5ZTQwNjE3M2YzMTFlODUwOTE1ZDg2YzAwYjEwMWViMTIwYzE0NTUyMyJ9', NULL, NULL, '', NULL, 'okay', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-21 11:27:54', '2021-06-21 11:27:54', NULL),
(55, '4', 'def', 'def@gmail.com', '8888999911', NULL, '', '', NULL, 'Tunisia', 'Aibayda', 'Zawiyta', '553535', 'df23', '$2y$10$DeogfuD3ZFBSQoSSLES.jO2R8piNZOPyUaneFGWTgpaYSSkI3IM1u', 'eyJpdiI6IkRJWGU2OTlwOWtTZHJDYWt0MTdZNEE9PSIsInZhbHVlIjoibnhPbWhhOEJENStnMzc2aGVoNEpyUT09IiwibWFjIjoiZDYxMTQ2NzhhZjE2MmIzYzJhZmUwNzZkZjg3MWFjMTU2MTBhOGQxODMyNTI1Y2RiNzIyNjM4MDk1N2JmMGVhNiJ9', NULL, NULL, '', NULL, 'thanks', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-21 11:32:54', '2021-06-21 11:32:54', NULL),
(56, '1', 'Dr Reddy', 'reddy@gmail.com', '9876598765', 'Female', '', '[1, 2]', 'XYZ Department', 'Libya', 'Derna', 'Zawiyta', '85085', 'zinnia tower', '$2y$10$CYPhr9Oo5eh3YAAHt8ZyBe.IdBuups99t4BWU/83e.Rney15f4yV2', 'eyJpdiI6IjhFZ2FReGFYZ3cyOGZ0OXFaaTZ3ZFE9PSIsInZhbHVlIjoiUkxNcXFUdHhDNUpQK1hySG9xR28zQT09IiwibWFjIjoiOWY1ODUyYWRkNzg4NGFkMjkwZGNiNTJkZjcyNTE5MzY4ZDNiN2JiNDI4Y2NmYWM3MTFjNWY0NGI0N2NjYmExMyJ9', NULL, NULL, '', '1', 'Baghdad', NULL, 'Heart', 'THANKS', 'English, Hindi, Arabic', 'MS , MD', 'HOSPA, HOSPC', '4676335', 'okay', 'I am a very happy person and happy birthday to my', '1625395603image_picker_9E994EDB-411D-4D9D-89A4-76FBC1EC2A20-10736-00000996EAB86864.jpg', '1', '2021-06-21 11:47:26', '2021-07-04 12:14:43', NULL),
(57, '1', 'Dr. testing', 'testing@gmail.com', '0987654321', 'Male', '', '', 'ABC Department', 'Tunisia', 'Misrata', 'Tripoli', '12345', '123', '$2y$10$r9FwR..mP.a1qrfUoXtXWOyip1eUmSk5G1CaGwAAQaf.BP8MNzteO', 'eyJpdiI6IndwUk82dThrQ25jZ0RkTTdreS9lY1E9PSIsInZhbHVlIjoiZXQzSmw4K1QwZ1NHUVRyKzQ0U2J3dz09IiwibWFjIjoiNTE0NzA0NzM1MTQ5M2ZjN2UxZGE4MjNhNGI2YTE5MGUxMmU1ZGJmNDljYjM5YmI4NjExZGQ4Zjk4NWE0Yjk2ZCJ9', NULL, NULL, '', '1', 'area testing', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-21 12:15:51', '2021-06-21 12:15:51', NULL),
(58, '1', 'hello', 'hhw@g.com', '1231222222', 'Male', '', '', 'XYZ Department', 'Turkey', 'Sebha', 'Zawiyta', '121212', 'asdasd', '$2y$10$LVHy.cJGWFHRohGBLPRqme/dQzEN.msb7YXB7rA3uBcBSKM9pCo/i', 'eyJpdiI6IjFUVXBTSWlpWHV3K3JmblVmWi9acXc9PSIsInZhbHVlIjoia0p4ZWVEbTRSQ3RHV05ZaDFLM3NiUT09IiwibWFjIjoiYmQyZDZjZWI5Mjc1ZGRlZmQ3OTUxOWJkZDVlNTM5NTUzYjc2MTExMmNiM2IwZjJmNzhmYzY1MDZkNTE0YWNhMyJ9', NULL, NULL, '', '', 'asdad', NULL, 'Eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-21 12:19:47', '2021-06-21 12:19:47', NULL),
(59, '1', 'muz', 'rohit@g.com', '7018915635', 'M', '1', '\"1,2\"', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$tF5n13qF11hcSV.iZMYY9erWmC60ZRp9MU8JisiH5gbr.vDJS29PO', 'eyJpdiI6IituajRqWkIyZUtpQ0hyN1kvdzFmRUE9PSIsInZhbHVlIjoiSS96STBNUDlKR2dnYWFKb0dKTmpYdz09IiwibWFjIjoiNTk1YjFkNzVkYWRjYjY5ZTZhNWU3ZjNiMjNlNGIwNzU5NjM5YjZkZDZlMGExZmY3MDdiNDRhYzU1ZjczMWIyNyJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-26 07:54:36', '2021-06-26 07:54:36', NULL),
(60, '1', 'juum', 'rohit666@g.com', '7018915635', 'Male', '2', '[3,4]', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$BmKR7RyzGvuGIBFMvUrlxub3LJcU.LonvVfIyWa52hR10z3lhFVgO', 'eyJpdiI6Im5NVTlSSmVLU3h0YmJqUUtkR1kzd0E9PSIsInZhbHVlIjoiMWJRQ05JUW5mY1RvVHF3L1NvbVkyQT09IiwibWFjIjoiNTllODBkZmVkMmRhNWZkNDIxZWY1Y2JlZTRlZWEzZDMwZmIxZmEwNDcwNGRiZDAwOTZlOTc5MWM2ZDljYTZkYiJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'new,new2', NULL, 'M,T,W', 'sdsdsddds', 'M,T,W', 'dfdf', 'fdfd', 'dfdf', '1627923329Screenshot from 2021-08-02 19-16-58.png', '1', '2021-06-26 07:57:30', '2021-08-02 04:55:29', NULL),
(61, '1', 'dname', 'dname@g.com', '1212121212', 'Male', '1', '[In-Person, Video-Visit]', 'XYZ Department', 'Turkey', 'Sebha', 'Misrata', '121212', 'asdsad', '$2y$10$z9hp5rUpHZr8HCC9FXlnm.TFendXkQHp3ICedBErskMXqNxFdY2E6', 'eyJpdiI6ImxvMGlwV1gwZTBzYmw2V3FrQlZRK0E9PSIsInZhbHVlIjoiZ2tnOXMrNGM2bUtOaG9Ud3BOQXd1QT09IiwibWFjIjoiNDkwMTM1ZjU4ZjYwMmQ3ZjBkOWQ1NzBkN2NjMDMxMDFmODFkNDhjMDlkOWYzNjkyOTQ4ZGM1MzVhMWUwNTg0MiJ9', NULL, NULL, '', '', 'sadasd', NULL, 'Eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-26 16:00:09', '2021-06-26 16:00:09', NULL),
(62, '1', 'anc', 'aas@g.com', '1212121212', 'Male', '2', '[In-Person]', 'ABC Department', 'Turkey', 'Sebha', 'Tripoli', '1212', 'asdasd', '$2y$10$qsV/eKnomdG8s487nM/nUuqgjacoioqVEfAtrNRFJQNuLf17S2vp.', 'eyJpdiI6Ikt1U3U2cHU3Ui9Ed25SaG1WUEFZaEE9PSIsInZhbHVlIjoiT1IyZ1hPNy9GUkZpY1J2TUxtZElhZz09IiwibWFjIjoiZTUxMjcxZTQ0Y2M3ZTdlYmRiODI2OTEwYzA0MTRmMzY1MDhkMGNlMTE2MTE3YzNjMGI2NjNkZmIzYTBiYjQ3NiJ9', NULL, NULL, '', '1', 'sdasd', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-26 16:37:44', '2021-06-26 16:37:44', NULL),
(63, '1', 'asd', 'asda@g.com', '1212121212', 'Female', '1', '[In-Person, Video-Visit]', '123 Department', 'Turkey', 'Zawiyta', 'Aibayda', '121212', 'asdsad', '$2y$10$2OyjGb7ekuxPdUNCQBuGZOAyOEmtoEPejPNljBBhU/ar8iJaKMrUO', 'eyJpdiI6IjFtN2NOMnpwRDFPSVE3STdjSFE0MGc9PSIsInZhbHVlIjoiVzBHUy9RenBXUjNZZTEzV1BQcEdBQT09IiwibWFjIjoiMWY2ZDA1ODM4YmU5NzkxNTk5MWNkMTM5NjgyYzliZDdlNmNjN2NhYjI4MmYxY2MzNTZiYWYxMGQzYjM0ODVjYyJ9', NULL, NULL, '', '', 'asdasd', NULL, 'Heart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-26 16:59:23', '2021-06-26 16:59:23', NULL),
(64, '1', 'Reddy', 'reddy.reddy@gmail.com', '5858585858', 'Female', '1', '[In-Person, Video-Visit]', '123 Department', 'Turkey', 'Sebha', 'Behhazi', '2580', 'zinnia', '$2y$10$57Wb9TDeNwa4fNJeje6awOmV2Sg5U9HJLZkr81A5R2gvpVsgEMmFa', 'eyJpdiI6IjRFVmZQNTZ0MUFwWnprNDIzUUVmTUE9PSIsInZhbHVlIjoiUE1RcW1JRVo2Q1BUNTEwQ1ZObFNOdz09IiwibWFjIjoiMzA4ZTI3NjNhMzM0NTk0OTAyZWQ0YWY2YTNjMmQ1MGRhMzJmNWZhZjgwMGZiYmIxMTJjMmZjYWIzMmE2NWUwMiJ9', NULL, NULL, '', '', 'FYI', NULL, 'Heart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-28 09:25:44', '2021-06-28 09:25:44', NULL),
(65, '1', 'xyz', 'xyz@gmail.com', '9873598735', 'Female', '1', '[In-Person, Video-Visit]', 'ABC Department', 'Libya', 'Sebha', 'Derna', '2580', 'zinnia', '$2y$10$8afzYItdLe0KrD6OOPUm0OXh2cv.MY4An1wNJ1n9bwmY.pyEADexy', 'eyJpdiI6IlMxZm91OXlwOGNKcllmalFZbW5MRlE9PSIsInZhbHVlIjoiS08ra013cmc4M3FrRFdkN09oeko0dz09IiwibWFjIjoiN2U4MWY0NGI4Zjk4ZmZkZTRlNzA0NDEwNjlmODU1MDgzMjY3MjIzMDhkNTg1OTBjZjdiZWM2NDIzYjVjOWZkNCJ9', NULL, NULL, '', '', 'Avenu', NULL, 'Eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-28 10:10:25', '2021-06-28 10:10:25', NULL),
(66, '2', 'hi', 'hh1@g.com', '1212121212', NULL, '1', '1', '123 Department', 'Turkey', 'Zawiyta', 'Misrata', '112211', 'asdasdasd', '$2y$10$5YkfQ1LusjV2hRMYKOkZ6egq3daJCl9QqyMVLGkHPb9wK.zaylB8W', 'eyJpdiI6IjU4VlhrRnF6TEZZSnd6VHE5VFlWa2c9PSIsInZhbHVlIjoiN0pPMnltRnF1M2h4bnN6a1JWdXM4QT09IiwibWFjIjoiOTYzNzQ0NTJjOWVjMjUzYjE3ZmY0MmRiYzdjYWQ5MTQyOGI0OTRiNGEwMTk1NzBmMmQ3MTExNzE1MjYyNmZkZCJ9', '07:00 AM', '06:36 PM', '', NULL, 'sadasdasd', NULL, 'Dentist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-28 11:11:52', '2021-06-28 11:11:52', NULL),
(67, '1', 'DataSet', 'drdr@g.com', '1212121212', 'Others', '1', '[In-Person, Video-Visit]', '123 Department', 'Turkey', 'Zawiyta', 'Sebha', '1212121212', 'sdasd', '$2y$10$UFSjsrY5654SyBJEAxrtPuHHer2hAbNCwY5jJQSHI.DB3uhdksttK', 'eyJpdiI6Ik5XVFlYQVJ0bGc1QUVxbEFjRVl1WkE9PSIsInZhbHVlIjoiNmV5bm5YYWxVamhsbUh6L1BqTzFvQT09IiwibWFjIjoiNGExODA1MDI3OWM4NjMwZjc4Y2U0ZmZhNGRmZWM5MzhiYjNjOTBkZWRiZGE0NDIxMTRlMzEwNWVmMmUzNGQ4MSJ9', NULL, NULL, '', '', 'dasdsad', NULL, 'Lungs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-30 08:20:35', '2021-06-30 08:20:35', NULL),
(68, '1', 'drpp', 'drp@g.com', '1212121212', 'Male', '1', '[2]', 'ABC Department', 'Tunisia', 'Derna', 'Sebha', '1212121', 'sdsad', '$2y$10$yOoaGf5CsAatieCKbASq7uV4kF2uLJgGNaMK9AhNtMDFwHnHuMOcy', 'eyJpdiI6IlMrS0xIeU5vUEVuRUhRRForRUZNSnc9PSIsInZhbHVlIjoiOVZQejdMLzVPUFl5SnZVVkROL0t3QT09IiwibWFjIjoiYTdhZjg5OGQ0MjYzOGE5ZmY1MDBiNzI3NjBiNDM5NDY3OWQwMjExNjcyOGI3OWQxM2QzMDFhNjU4MzczM2Y0YyJ9', NULL, NULL, 'M,T,W', '1', 'asds', NULL, 'new,new2', NULL, 'M,T,W', 'sdsdsddds', 'M,T,W', 'dfdf', 'fdfd', 'dfdf', 'default.jpg', '1', '2021-06-30 08:28:41', '2021-07-01 05:57:14', NULL),
(69, '2', 'muzc', 'muzc@g.com', '1234561212', NULL, '1', '1', '123 Department', 'Turkey', 'Sebha', 'Misrata', '1212121212', '1212121212', '$2y$10$qG6NngQrHZkK69GyWYfKz.UXPZJ.ozPYz7IPpA4NCMyAwwUlDyC/S', 'eyJpdiI6Ijd1U1p0UksraHB6KzdwS0tNM3hQUHc9PSIsInZhbHVlIjoid0pMRlFyQXczeTl0UzJWMHlmcVBoQT09IiwibWFjIjoiMzUxNWJiOGYxMTliYTlhMGUwM2FkM2VhZGNkNDA3ZTliMzQyNjFhM2ZkNmM0ZGNlNjk5M2E4YmMwZmE4ODJhNCJ9', '07:14 AM', '06:15 PM', '', NULL, '1212121212', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-06-30 09:45:17', '2021-06-30 09:45:17', NULL),
(70, '1', 'muz1', 'muz11@g.com', '1122112211', 'Male', '1', '[1, 2]', 'ABC Department', 'Turkey', 'Aibayda', 'Zawiyta', '121212', 'asdsad', '$2y$10$YGN3uQVaeZziUr2tm4pItePC85qYsLeyCFQ83ZyX9os71kW3T2s3.', 'eyJpdiI6IlFBMkZqWVRNa2hmc0N6bFFvWVRwR2c9PSIsInZhbHVlIjoiU0VnTXNkNXovWHJnR0pKdmxkREp4UT09IiwibWFjIjoiYjU5ZTBjYjhmM2ZiYWUwNTI4MGZhZGE3MjI5Y2I4YzVjYTA0M2NiZWJhM2VlOGNjYzY1YjI4ZjU3MDIwNmU4YSJ9', NULL, NULL, '', '', 'sadada', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-07-01 17:32:10', '2021-07-02 04:55:54', NULL),
(71, '1', 'Dr Raju', 'Raju@gmail.com', '85468572450', 'Male', '1', '[2]', 'QWE Department', 'Turkey', 'Aibayda', 'Sebha', '85484', 'park', '$2y$10$Bbr51sXckLymsh1.LN0isOHgzuhWK506HJ0qZYF3SgXZIrzorNKKC', 'eyJpdiI6IlJkb0sxcUoza3p0YndNaFhEc0J3SkE9PSIsInZhbHVlIjoiaTNoTXdUeXhsWnRnR3RlMW1OSncwQT09IiwibWFjIjoiNzM0OTk3NzAxNjE0ZDM1NDRmYjY5Njk5YjYyNjFiNDk4ODEzZWYyM2IxZmZjNGIyYjU0NjhlMWNiNDU4YmJkMCJ9', NULL, NULL, '', '', 'Test', NULL, 'Lungs', 'Despite a fragile ceasefire and recent flare-ups of violence, an inaugural economic forum organised by the Italian-', NULL, 'Despite a fragile ceasefire and recent flare-ups of violence, an inaugural economic forum organised by the Italian-', NULL, '4567777', 'Despite a fragile ceasefire and recent flare-ups of violence, an inaugural economic forum organised by the Italian-', 'Despite a fragile ceasefire and recent flare-ups of violence, an inaugural economic forum organised by the ItalianDespite a fragile ceasefire and recent flare-ups of violence, an inaugural economic forum organised by the Italian-', '1625374758image_picker_1105632A-5BD0-4BBB-9715-DBC0952E141C-3171-000001EC1EE47D3E.jpg', '1', '2021-07-03 08:10:08', '2021-07-04 05:02:56', NULL),
(72, '2', 'Fortis', 'clinic@gmail.com', '9876598765', NULL, '1', '1', 'QWE Department', 'Tunisia', 'Misrata', 'Misrata', '25802', 'tower', '$2y$10$VsEWLyst7eValYO0IZzpO.M2.3ZqutHdR7d45d8EkD7871STQaohy', 'eyJpdiI6Indrall2S1JiK3ROK1RFeGZDbDc2blE9PSIsInZhbHVlIjoiNVNIb2ZRZUxIZFBla0Q0R1VzSHFadz09IiwibWFjIjoiOTU3Yjk3ZDRmODZhYTcyY2FiMTFlZDhhZWRkNmUyMjZjY2MxNjkyYTA1MmM5ODk2Y2NlMmNhYTQzZjU3M2I3MyJ9', '07:00 AM', '07:00 PM', '', NULL, 'thanks', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-07-04 11:02:03', '2021-07-04 11:02:03', NULL),
(73, '1', 'data', 'data@g.com', '1212121212', 'Female', '1', '[1, 2]', '123 Department', 'Turkey', 'Zawiyta', 'Misrata', '12344', 'asdadd', '$2y$10$9kXAikk5yBH1Zizo5BX8xecHGsqgmzqmDMmktm236DzmOemuS1o56', 'eyJpdiI6ImhBZ25JYTBwWTZaTWUwR1JqVXQwUmc9PSIsInZhbHVlIjoiZmNCZ2wzeDBDM2VSQVBGRDJHZjVtZz09IiwibWFjIjoiMTAxYzNhNWRhYzNmYTcyYTk2MGU0NzIwZjE2NmQwNGVjNGRlZTc0ZTUyZTM2OWQ5NDA1M2U2NTBjYjkzN2ZhNCJ9', NULL, NULL, '', '', 'asdd', NULL, 'Lungs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-07-04 18:03:30', '2021-07-04 06:28:11', NULL),
(74, '2', 'Fortis', 'fortis@gmail.com', '2233445566', 'Male', '1', '[3,4]', 'ABC Department', 'Libya', 'Aibayda', 'Zawiyta', '31322', 'Ambadeep building', '$2y$10$rd43DaAJ2zrru93dqZLVTe7Zu4xfpRzpYGmRvb.vjERe6yauhfEBS', 'eyJpdiI6IkZNbUhvSXhLZC83dzRMaUdEcnJqR1E9PSIsInZhbHVlIjoiZ1Vidkw3cmhNS3pjUWVTeFdWZjZtZz09IiwibWFjIjoiOTFlYTc3OTkzMjY5MWYxOTlkMmQ5ZWJjMTFkMWJhMGYyNjVkOWFjMGFlYTA4ZWYzZDc1ZDcyMGUzYzczODBiNCJ9', '07:00 AM', '06:00 PM', 'M,T,W', NULL, '5 Avenue', NULL, 'new,new2', NULL, 'M,T,W', 'sdsdsddds', 'M,T,W', 'dfdf', 'fdfd', 'dfdfdaasdnkjaskjdakjsndashdjkaskdhkasdkjasndkjsjndjsndkjsndkjsasbdwudhwehriuhkwndweguwjdkwefiuweknwekfjgwefhkwefiuwetuwfwehrfuyweefieyweurjlwefhywetriuwenf.efnoise7fefl;efjsfiwefiwemdfdfdaasdnkjaskjdakjsndashdjkaskdhkasdkjasndkjsjndjsndkjsndkjsasbdwudhwehriuhkwndweguwjdkwefiuweknwekfjgwefhkwefiuwetuwfwehrfuyweefieyweurjlwefhywetriuwenf.efnoise7fefl;efjsfiwefiwemdfdfdaasdnkjaskjdakjsndashdjkaskdhkasdkjasndkjsjndjsndkjsndkjsasbdwudhwehriuhkwndweguwjdkwefiuweknwekfjgwefhkwefiuwetuwfwehrfuyweefieyweurjlwefhywetriuwenf.efnoise7fefl;efjsfiwefiwem', '', '1', '2021-07-06 13:44:46', '2021-07-07 05:19:36', NULL),
(75, '1', 'mmm', 'm1111@g.com', '7018915635', 'M', '1', '[1,2]', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$WdwQsdllu.HkXGmrlHdm3ee6M/nzfb0ylmcIwyVNIAKtnDz5JETCC', 'eyJpdiI6InhSYXEvdEl6V255VmZJN2tNMVpWS1E9PSIsInZhbHVlIjoibjNnU1k1T1dkcytPQjdjZTV6b2YrQT09IiwibWFjIjoiODRiNmFkMzI1NTYyMDBhZjIyOTBhMTNmMTIwOGM5NWU1MGQ2OGJlM2IxYzdlZDhkNjJkZDQ5YzRhODZlY2I3MyJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-07-07 04:51:30', '2021-07-07 04:51:30', NULL),
(76, '1', 'mmm', 'm1112@g.com', '7018915635', 'M', '1', '[2]', 'Test', 'India', 'HP', 'Shimla', '123', 'asdsad', '$2y$10$.o2f9vSQWVHx/RQGmrEhae7Hrb73zvgxq5rq675oHvAk5ZNmxasTe', 'eyJpdiI6IlQwTVEzV2Fvb1VRV2kzMllmaEVTS2c9PSIsInZhbHVlIjoiQ2FDM085Umg0STEwam1tVm00bm5RZz09IiwibWFjIjoiYTFlMDhkNzExZTM0MmFjZGY3MGM3OGI3NTA3NzA2ZjMwZjAzMDMwM2ExM2Y4YzhjNDJiYzNmYWJlODAxZWU4YyJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, 'asdd', NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-07 04:55:42', '2021-07-07 05:23:52', NULL),
(77, '1', 'mmm', 'm1113@g.com', '7018915635', 'M', '1', '[1,2]', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$PiQxqCNHPXWUVUT7JfVTuuq1bu9fuHLOfSy56RZKhCwbWUo0/5e6y', 'eyJpdiI6ImYwZytqalVVck1keUlpZGUzUytvTGc9PSIsInZhbHVlIjoiaGFJaHZsaTRtQy9rcjNUL3A2WVowZz09IiwibWFjIjoiMGU2MWM1MWE4OWUxZGFiMjAwMWVlODY2Mzc5M2E1ODQwNjc2Yzc0Mjg5ZjE3ZTNhZWNmZTQzMjk3NjMzMDExYyJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-07-07 05:03:26', '2021-07-07 05:03:26', NULL),
(78, '1', 'muz', 'rohit6566@g.com', '7018915635', 'M', '1', '[1,2]', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$v25cDMY95f/LhAjN.laFd.LS2qri8ENQT6jzY6UROzqFfdjKEVlhC', 'eyJpdiI6ImVtYzRNUGxjbVZGbStDcTQrcXFEZWc9PSIsInZhbHVlIjoiU3pvL0g5T1JhWDB1dys4cldxN3VhQT09IiwibWFjIjoiMTRhMWIxZTZhMDhkNTA5N2Y4MGUzZTNlNjQxZGQ0MTI1NTFiOGRkNDhhMTM3YTk2NDdhOTUzYzhmM2FmN2M2OSJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-07-07 05:06:54', '2021-07-07 05:06:54', NULL),
(79, '1', 'muz', 'rohit656w6@g.com', '7018915635', 'M', '1', '[1,2]', 'Test', 'India', 'HP', 'Shimla', NULL, NULL, '$2y$10$bM20Da73Axre0xN17WFh0OUSA431I3PCMIAh4YsSZx/agOpPQsa6u', 'eyJpdiI6InJKaTFPYUxLZWF4NFpSb09QN1ArQ0E9PSIsInZhbHVlIjoiM1FmWE1HTHhpcWd1MThhQnRJb0xCdz09IiwibWFjIjoiZDIxNWYzYjI0YjZmMGRkZmY5ZmJhYjE3NjkzYzRkYWRiZTkxODUxNjgxYTg1ZmFmZjAxZjZlODllNzg3YTVlYyJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, NULL, NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', '1', '2021-07-07 05:07:36', '2021-07-07 05:07:36', NULL),
(80, '1', 'mmm', 'm1114@g.com', '7018915635', 'M', '1', '[1, 2]', 'Test', 'India', 'HP', 'Shimla', '1221', 'aasdd', '$2y$10$SSgWsT.cDau4pAdJe2xF9.OAoA8GkuJJ50ImE.cfopb824iSs9kuC', 'eyJpdiI6IkNTTHJTNTFiV0FMMHZKNWVWU3UycHc9PSIsInZhbHVlIjoiaXlIMUFFNlY2RnhJRGNqUGlWMVRHUT09IiwibWFjIjoiYjk0MzE5Yzg0MTVmYjZhNzg5ZTU2NWM1YjQ2Nzg1NjgzMTk5NzFiN2U4MjQyMDFlNTY4Y2ZiNzAzZDYwZWJmMSJ9', '09:00:00', '14:00:00', 'M,T,W', NULL, 'sadad', NULL, 'abc,def', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-07 05:17:27', '2021-08-22 01:22:33', NULL),
(81, '1', 'Dr Advani', 'test@gmail.com', '919874598745', 'Female', '2', '[1, 2]', 'QWE Department', 'Turkey', 'Aibayda', 'Sebha', '31322', 'Zinnia', '$2y$10$CgnaSZfuZ5544xG0mO7wHuEuu4Zl4tvwQbwbP.7XiNSE4BN30vME6', 'eyJpdiI6IkxlTDRQY3RRUmJNSDkxWWpmZjd4UEE9PSIsInZhbHVlIjoiTUpZZzlpS1l5Mmo4RVZuL1NScU9Cdz09IiwibWFjIjoiODlkZTFhNmFlOTc5MDI4MTdkYzkwNGU3MWJiNTg3MDM0MzEyOTg1OTBlN2QwZjBmYmM5MGUwMTMwN2U5ZDVmNiJ9', NULL, NULL, '', '', '5 Avenue', NULL, 'Heart, Lungs', 'specialist', 'English, Hindi, Arabic', 'MBBS, MD', 'HOSPA, HOSPC', '55443322', 'master', 'I have completed my MBBS from a reputed college and now I am pursuing my MD I have worked in many hospitals and clinics I have a very good record of work my patient are always happy with me as all the surgeries performed by me are successful I have always treated my patient with utmost care and responsibility', '1625651649image_picker_0C3F4B89-1FD5-4F87-8705-6D4A2FD1879C-13420-00000C2306387CA6.jpg', '1', '2021-07-07 09:44:15', '2021-07-07 11:19:04', NULL),
(82, '1', 'Uma', 'uma@ymail.com', '2583691475', 'Female', '1', '[1, 2]', 'ABC Department', 'Libya', 'Derna', 'Zawiyta', '25463', '25', '$2y$10$3oFH4cfhkyl56XBUvFUpOuXTk0bDM2/Iocj8uR0tiRM9C90dHMFfi', 'eyJpdiI6ImVpcldGdW9KWkNQK0ZCaFdlaSszaVE9PSIsInZhbHVlIjoiWHp2MkdsRFcxQVZGY3pNUHRXb29Udz09IiwibWFjIjoiNjUzYjI4YThlMjllYTJjZjQxNzQ5ZWU1N2VjNjIzNDcwMTFiNTJkNDkxNjQ1ZDA5MDk3OWU5NTc3NTA2YTg1OCJ9', NULL, NULL, '', '', 'Park', NULL, 'Lungs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-07 10:15:40', '2021-07-07 10:15:40', NULL),
(83, '1', 'Prady', 'p@gmail.com', '1234567890225388', 'Male', '1', '[1, 2]', 'ABC Department', 'Turkey', 'Aibayda', 'Aibayda', '1234546', 'dvvgg', '$2y$10$rp87fIqTWNyq7Q5QiA0bXuccMTKLI8PndQhZ/QlnQVgNFMOe2Vn46', 'eyJpdiI6IlViaFQwLzByaS9YczF1WDdRdUhKYlE9PSIsInZhbHVlIjoiYk8yTzVpYlBzNGRSVUozVk5uZXRWZz09IiwibWFjIjoiMGE1NGJlZWVlMjZjOTk2N2Q1ZjQ3NTVlYWMwYWQ1NWZiMmI3YjZlYjMxZTk3MGRhMDYxZDFiYzI3YWU5N2FlYSJ9', NULL, NULL, '', '', 'sggssg', NULL, 'Dental, Eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-09 09:42:58', '2021-07-18 05:14:28', NULL),
(84, '2', 'muzname', 'muzname@g.com', '1234567891', NULL, '1', '1', 'XYZ Department', 'Tunisia', 'Behhazi', 'Tripoli', '123123', 'asdasd', '$2y$10$jr70z6YVG8/.6.fsaKzKFuGf2mAX/C/Vp8Kst6bww7M.lwndI7gHK', 'eyJpdiI6IjM4b3k2RXFzWGRabk9LbERPSzBlNGc9PSIsInZhbHVlIjoiYm5GejZvRTVSWVhCQ3poSFVxam15Zz09IiwibWFjIjoiMDZkOWE4MWJmMWZhN2Q3YzdhMDY4YzM2M2QzMzlmZWUxOTA2NDA5ZDY5Mzc0YjgzZGRmNDUyNTgxZDFkZjBmYiJ9', '10:53 PM', '06:53 PM', '', NULL, 'sadadsd', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-19 17:23:25', '2021-07-19 17:23:25', NULL),
(85, '1', 'hub', 'hub@g.com', '5566556655', 'Male', '1', '[1, 2]', 'XYZ Department', 'Turkey', 'Derna', 'Behhazi', '78787', 'asdas', '$2y$10$18Qaup4e9ih8nfYtXoa4KuV1.azYw0YhFXiohG0Rs600jhjNJ8Cjq', 'eyJpdiI6Ill3SWtVUHdNRFU3dHJ0aHdWYzZINEE9PSIsInZhbHVlIjoid1ZCbXdHVmZndzdBMVFmbFN2dVpjdz09IiwibWFjIjoiNDY2MjkzNjVjMTViZWUzYTc5NTdjYWQzZjNjMDBiYjlkZTczZDRjYzU4MTNkYzRiMzU0MjU3ODU0YjIwYzQxZiJ9', NULL, NULL, '', '1', 'asd', NULL, 'Eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-22 16:05:51', '2021-07-24 06:54:03', NULL),
(86, '1', 'rohit', 'rohit.offsureit@gmail.com', '7895014982', 'Male', '1', '[1, 2]', 'ABC Department', 'Libya', 'Misrata', 'Tripoli', '247001', '112', '$2y$10$xQyY3DxI/7S3Vv5FJYgx9.qJ8JRnxvCJVixlLastVnHYknVOAF1l.', 'eyJpdiI6IjEwWEg0VVkvaXgyOC8wQVR2WEg4M3c9PSIsInZhbHVlIjoiVSsvcnRHV3dlTnprY09VTHVPRmRtdz09IiwibWFjIjoiNjFlMTZmM2M1ZmY5ZDE5NmZhYmMyNDJkOTljZWJlODZlMmMwN2FmZjU5YzQ0ZTNmOWI1YTRiNmUzODY5ZmIyMCJ9', NULL, NULL, '', '1', 'mayur vihar', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-24 07:38:36', '2021-07-24 07:38:36', NULL),
(87, '1', 'Test1', 'test_test@gmail.com', '9874598745', 'Male', '2', '[1, 2]', 'ABC Department', 'Tunisia', 'Behhazi', 'Behhazi', '31322', 'ABC building', '$2y$10$Uu6np2kERW6UM6uQLuShAeLVU0JmYWgAu1shK9hnZyyGJy8ndO3.W', 'eyJpdiI6Im9mUmRzZk50QThlNFZGdnZpUUxqWGc9PSIsInZhbHVlIjoieTYzWVpHNVo2U1hPWmxVNUQ2TnFnZz09IiwibWFjIjoiN2Q3NTA3YzAzNTBiNWE2MzlhNzJiYThjMGJmMWNmZjY1NzUwOWE5ZDM0ZTFkZjYzNGRlMDI2MjMwY2ZiZGQ5ZSJ9', NULL, NULL, '', '1', 'abc area', NULL, 'Heart', 'certificate', 'English, Arabic, French', 'MBBS, MD', 'HOSPA, HOSPC', '45678', 'test', 'a person licensed to practice medicine, as a physician, surgeon, dentist, or veterinarian. a person who has been awarded a doctor\'s degree: He is a Doctor of Philosophy.', '1627159824image_picker_4F7AC403-B0FC-4C3A-8498-468E7CEF9B8F-33120-000019D1162C2F4A.jpg', '1', '2021-07-24 20:47:10', '2021-07-24 08:50:24', NULL),
(88, '1', 'neha', 'neha@gmail.com', '9876543211', 'Male', '1', '[1]', 'ABC Department', 'Tunisia', 'Misrata', 'Tripoli', '12345', '123', '$2y$10$R/BCmzLn2TKHlEHkJUz1XuXMpMGKZdFJdiuYZBw5RQaaZVki0BQEK', 'eyJpdiI6ImI4V0pReThaQjkyUDI0TFU1K2pBYlE9PSIsInZhbHVlIjoiMWVUaEhTNXplTFYvZlFtN3NuZytpdz09IiwibWFjIjoiYzhlNDM3ZmJjYjM2NWY0OGFhM2QxNDRlM2MxZWVkZTFkMjdkNjlmN2JkM2ExNTE2YjU1YmRjMDRiZGJmMjMxMSJ9', NULL, NULL, '', '1', 'Radaur Road', NULL, 'Eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1627202803scaled_image_picker2855438795684058322.png', '1', '2021-07-25 05:39:58', '2021-07-25 08:46:43', NULL),
(89, '1', 'mm', 'mm12@g.com', '1212121212', 'Female', '1', '[1, 2]', '123 Department', 'Turkey', 'Zawiyta', 'Behhazi', '12122', 'asdasdsd', '$2y$10$wz34lvu9XiqvkEnCLujmBO3xvMkFvj7qptiy2pQGVEsu1I1sZUCaa', 'eyJpdiI6IjdVMFJNRVNTN1UwVjNSL0p4WTZVdWc9PSIsInZhbHVlIjoiTjYrVUtSMlAxUjB1OFI0dVdHRExZdz09IiwibWFjIjoiYWIwYWU3MTgyMWFkNjI3NDdkMmFjMzliYWJmOGQzMWZjOWIxNDJkMDkxYmYxMjU0NTU0YTY2ZjZkNjUxYTNlZiJ9', NULL, NULL, '', '1', 'sadasds', NULL, 'Nephrology, Cardiology, Medicine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-25 10:06:16', '2021-07-26 05:53:06', NULL),
(90, '1', 'suman', 'suman@gmail.com', '1234567890', 'Female', '2', '[1, 2]', 'ABC Department', 'Libya', 'Behhazi', 'Behhazi', '123456', '123', '$2y$10$eoopKwiJxq.3HTxw.ni.cODisvtN0IfN4SwJIxEEjmWEhhqtGWnJ2', 'eyJpdiI6Ik54T1h0c1cwRW5CZSsyWXdtd3RBYnc9PSIsInZhbHVlIjoiQWZjNElmK2c2cWlUelh3S21qSXNvUT09IiwibWFjIjoiOGE5ZmIzZTk3ZTYyNzE2MzUxMjllMzAyYTljMzk2MzNiZjlkNzdkNzk5MTQyYmY4MzNkZWJiOTllNjY0M2U2NiJ9', NULL, NULL, '', '1', 'abc', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-25 13:14:03', '2021-07-25 06:35:18', NULL),
(91, '1', 'Ram', 'ram@ymail.com', '8524085693', 'Male', '1', '[1, 2]', 'Cardiology', 'Turkey', 'Aibayda', 'Aibayda', '25416', 'Park 22', '$2y$10$QLWu9Ws66tg/eSO/Y9njC.Z8NkA9npqJyWS0N/fPdBP5rt6i6b6GO', 'eyJpdiI6IkxxU3QwZ2VMOWkxOGxWWTFKem8wOHc9PSIsInZhbHVlIjoiSmJnd0dGNkNDV3VobW93RHpoS3FHdz09IiwibWFjIjoiZWZhNDhjZDEyY2Q3YzhkYmJmNGU0NzU1ZDM4MzJmNmMzNzg4MWRiMjM0YWM1YjNlZDBmMmM5ZjYyMDA4ZGNjNSJ9', NULL, NULL, '', '1', 'Abc', NULL, 'Lungs', NULL, 'Arabic, French', NULL, NULL, NULL, NULL, NULL, '1627959520image_picker_9835488B-AE75-4492-B600-293D35B7A166-25841-000005A42DE6D17F.jpg', '1', '2021-07-25 16:05:52', '2021-08-03 02:59:06', NULL),
(92, '1', 'Test', 'test1@gmail.com', '9865298652', 'Female', '1', '[1, 2]', 'ABC Department', 'Turkey', 'Tripoli', 'Aibayda', '31322', 'tower', '$2y$10$AFAl.jVSTBaHqKi8M.zU/.oDGZSkb9MVdt7lugXfrDyqAlEzDGUru', 'eyJpdiI6ImJWN3J6TVlXN0Fxa0FVWmE0aFl3Q3c9PSIsInZhbHVlIjoiNVVsVUljZ05QR0Q5NHpac2pXTThlQT09IiwibWFjIjoiZmZiMGRmYTM3MmUyYjM5NTAxYTc0YTBhMTM0NjY3YWI0M2VlNGE5NGFlZmViZDkwYjc4ZmE2ZjgwMzViNzI4YSJ9', NULL, NULL, '', '1', 'Ray Gardens', NULL, 'Lungs', 'Training', 'English, Arabic, French', 'MBBS , MD', 'HOSPA, HOSPC', '4262772', 'Certificate', 'Middle English doctour teacher, doctor, from Anglo-French & Medieval Latin; Anglo-French, from Medieval Latin doctor, from Latin, teacher, from docēre to teach — more at DOCILE', '1627231767image_picker_706A72E8-4C9F-4A3E-B3A1-73CB63394D15-33851-00001A63B3637449.jpg', '1', '2021-07-25 16:43:12', '2021-07-27 03:17:53', NULL),
(93, '1', 'hm', 'hm@gmail.com', '1234567890', 'Male', '1', '[1, 2]', 'ABC Department', 'Libya', 'Tripoli', 'Behhazi', '12345', '123', '$2y$10$sDCOst9L1QZ/lpE570NoouQBEORYf9cBqDHtFfRVSpCuVP7dOSQfy', 'eyJpdiI6ImNHZzNWK0huQUZBdUFsL3NQeDZpTlE9PSIsInZhbHVlIjoic2RJZ2JIWUlHNWEvNHJDQVpWWWw3Zz09IiwibWFjIjoiZGExMmJlZGI0Mzk0OWIyNGMxYjczMzBlOTZmYTIzYTZkNTE1YjJhMzhhNzZhMGZlYTQyYjZhMmM3ZTFmNmE2MSJ9', NULL, NULL, '', '1', 'abc', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-25 18:41:10', '2021-07-25 06:41:38', NULL),
(94, '1', 'test', 'test@test.com', '1234567890', 'Male', '1', '[1, 2]', 'ABC Department', 'Libya', 'Tripoli', 'Misrata', '123', '123', '$2y$10$06zox09yWWNbSQPi6WUh7.kFGLxMzJ5r7wEiqos8eKk7OauBlgbiK', 'eyJpdiI6InY1L2JueFgweWZBb1JnbC84TnpRbFE9PSIsInZhbHVlIjoiWGh4U2pBZEZMSTloNGQzMC95TW14QT09IiwibWFjIjoiYjE4MDdjNjhiNzEzNzZhYzI5ZjVhMmM4NDZiNWZkOGQ0ZDk5YTcwYmI0YjA1NjI1ZTY4OTNhYzllODYzNTg2NyJ9', NULL, NULL, '', '1', 'test', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-25 18:47:15', '2021-07-25 08:07:42', NULL),
(95, '1', 'Ravi', 'ravik.ravik@gmail.com', '8524136486', 'Male', '1', '[1, 2]', 'Gynaecology', 'Turkey', 'Derna', 'Aibayda', '15215', 'Test', '$2y$10$mU4dwPLOafDJ4nfqUbmMzeG/Gzez8NFHTUq604PjAEjHO.CmLsWzu', 'eyJpdiI6ImcwNkJhNHUvU0VpQlhkUVhlZWdwUUE9PSIsInZhbHVlIjoidzlQV0xWVFIvaG9sdTd6enpHMlc1UT09IiwibWFjIjoiYjE5M2RkYTY0ZmMwZTYzNGE3MTFmMDQ1N2ViZmIyMDllNTFhMGE5YTdkMjc3Y2MzNzhjZjU1MTdlMmU3NWY1YSJ9', NULL, NULL, '', '1', 'Lake garden', NULL, 'Heart, Eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1628061458image_picker_8C84815B-59F0-42FB-ADFB-B7C453DD3E16-30598-0000068031098524.jpg', '1', '2021-07-28 05:36:54', '2021-08-04 07:17:38', NULL);
INSERT INTO `providers` (`id`, `provider_type`, `name`, `email`, `phone_no`, `gender`, `address_type`, `visit_type`, `department`, `country`, `state`, `town_city`, `zipcode`, `building_no`, `password`, `remember_token`, `open_from`, `open_to`, `reapeat_schedule`, `dr_choice`, `area`, `reapeat`, `specialization`, `training`, `languages`, `education`, `affilation`, `license`, `certification`, `aboutyourself`, `profile_image`, `account_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(96, '1', 'Dr Rastogi', 'test2@gmail.com', '3692536925', 'Female', '2', '[1, 2]', 'ABC Department', 'Tunisia', 'Behhazi', 'Behhazi', '31322', 'abc building', '$2y$10$rmG4EsBbXbptheGJUA52wualdjvD1QPlhhVd0fb.6HkUxcWV.sQk6', 'eyJpdiI6Ik9DT1VleWFtVHRINi94REtrdGo0dkE9PSIsInZhbHVlIjoiQ1U4V0cxaFFkY0dXc3c3ZVpsSlRTQT09IiwibWFjIjoiNjYxODczZjBkYWYzZDgzYWIwMmY5NjRlZmNmZjcwMzNlNDM0NTgyZDgzMWFiNmQ1NTliYzdlMGJlNWNiYTVkOSJ9', NULL, NULL, '', '1', 'abc area', NULL, 'Heart', 'training testing', 'English, Hindi, Arabic, French', 'MBBS MD', 'HOSPA, HOS1', '45456', 'certificate testing', 'Doctors are qualified and trained medical professionals who can diagnose and treat various health conditions of human beings. Doctors render the noble service of curing the sick and injured. With prompt medical intervention, doctors save human live', '1627466577image_picker_C2BF548A-B9BE-478C-819D-3959E339DD66-36617-00001C20CE622C46.jpg', '1', '2021-07-28 09:25:10', '2021-07-28 10:02:57', NULL),
(97, '1', 'Dr Raj', 'test3@gmail.com', '2356823568', 'Male', '1', '[1, 2]', 'ABC Department', 'Turkey', 'Tripoli', 'Tripoli', '31322', 'abc building', '$2y$10$bLt/NcuDeiSVCdTYPxWnq.UTg8SAIpgR3iZzZ/L23bA38YKl5uBHy', 'eyJpdiI6IkJ4aXNRWGtMVlhXY240Wmw4aGQ0bEE9PSIsInZhbHVlIjoiMlRoc0N5UC9nd3QrYUNDTnQ4TmFaZz09IiwibWFjIjoiMzFiYzcxNmVmNWE4YTI3ZGI5N2MxMWZkYzJlMDY2ZGM2OGQ0YmU0YTRhMWY4ZTc3ZWVhZGJlNjYyN2IyY2JlYyJ9', NULL, NULL, '', '1', 'abc area', NULL, 'Heart', 'training testing', 'English, Hindi, Arabic, French', 'MBBS MD', 'HOSPA, HOS1, HOSPC, HOS2', '45678', 'certificate testing', 'A transitive verb is a verb that requires a direct object, which is a noun, pronoun, or noun phrase that follows the verb and completes the sentence\'s meaning by indicating the person or thing that receives the action of the verb.', '1627547879image_picker_341627BA-1AFE-4401-BCB2-4B2FFF2559AC-37665-00001CF8C52D7BFD.jpg', '1', '2021-07-28 10:53:28', '2021-07-29 08:37:59', NULL),
(98, '1', 'doc', 'doc12@g.com', '1231231212', 'Female', '1', '[1, 2]', 'Cardiology', 'Turkey', 'Aibayda', 'Misrata', '1234', 'asdsadad', '$2y$10$/jqgHmPXcUw/Bzf6nCCih.6TK/1/5kWb7hVRo5ifsUkH4F3aluub.', 'eyJpdiI6IlRyT0kwZEo2dER0WWtLdnVGUGpHS3c9PSIsInZhbHVlIjoicDFJZElNclI2UWIvSmFzNkllVHNXZz09IiwibWFjIjoiNWFlZjc4MGVkYTk1ZWZhMTQ4YmI3MjNlZGYwMGRjYzFiY2U0MmFiYTdlOTZkOGNlMWVmZjU3Njg0ZjkzODgwYSJ9', NULL, NULL, '', '1', 'asdasda', NULL, 'Dental, Heart, Eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-28 15:28:25', '2021-07-29 03:34:41', NULL),
(99, '1', 'Dr Mahesh', 'dr@gmail.com', '9874598745', 'Male', '1', '[1, 2]', 'ABC Department', 'Turkey', 'Behhazi', 'Behhazi', '31322', 'abc building', '$2y$10$1NK/Uhc/Ivp63No/7SrW4emduj7ATLJhy5WPoAd1y.EQvHr0byF3G', 'eyJpdiI6IjBydTFKQnpoS0JUQXphL1pXQXpadVE9PSIsInZhbHVlIjoiVnNIaGZWcWxMNkdsSkswT0NoWC9qQT09IiwibWFjIjoiZWI1OTgyYTBhZjYzNzYzNDkzZmVlN2NkNWY2ZmYzOGNkMTEwZmZkMDM1M2M0MWQ4NDBhOTVmYjRmZTg5ZjI1MiJ9', NULL, NULL, '', '1', 'abc area', NULL, 'Heart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-29 08:41:02', '2021-07-29 08:41:02', NULL),
(100, '1', 'Dr AV', 'drdr@gmail.com', '9874598745', 'Female', '1', '[1, 2]', 'Cardiology', 'Tunisia', 'Behhazi', 'Behhazi', '31322', 'abc building', '$2y$10$P8KdbUG1FfQAJfzNc9SYQewk4coCDQBLIXyvD8ARmMfrvYLgy9wga', 'eyJpdiI6IllYR1UzYnBSVFpWaDhBbVozWkdFL1E9PSIsInZhbHVlIjoiSXFwZDVGOXg0QjlCQWpVS2krRlhtdz09IiwibWFjIjoiMDRjZGY0OTEzM2U5NmMyMzNiMDMzY2MzOGMyM2M0NzhmYWQ2MmYwN2QwZmZiZjBkYjM1YmNmMDRkMDQ2NTdkNiJ9', NULL, NULL, '', '1', 'abc area', NULL, 'Heart', 'Training testing', 'English, Hindi, Arabic, French', 'MBBS MD', 'HOSPA, HOS1, HOSPC, HOS2', '45678', 'certificate testing', 'Testing is the process of executing a program with the aim of finding errors. To make our software perform well it should be error-free. If testing is done successfully it will remove all the errors from the software.', '1627578654image_picker_92B235CE-1C7D-4FDB-A4EF-EEF4D93889CA-38092-00001D61E285735A.jpg', '1', '2021-07-29 14:50:40', '2021-07-29 05:11:57', NULL),
(101, '1', 'new testing', 'new@gmail.com', '1122334455', 'Male', '1', '[1, 2]', 'Oncology', 'Libya', 'Tripoli', 'Tripoli', '123456', '111', '$2y$10$X3DPmH1arim97Hhv3R6SOuq/1rtmEYVn9tqBUB16doAODl/geiV46', 'eyJpdiI6IjB0U29LWmZ4UHg0RmdCd05kaGpIcUE9PSIsInZhbHVlIjoiMTFQR0o1UERqUnVFNGFlSmg0aDd3Zz09IiwibWFjIjoiMzRjOGQ3MWI5MjRmZGIyMTAyMTU2OTI5MTdhMjQ4ZDcwNjk0M2RkNGU4NjAxNzA4MzAxNzg4NzdlODg0YjlhNCJ9', NULL, NULL, '', '1', 'rdr', NULL, 'Heart', 'avc', 'English, Arabic', NULL, 'HOSPA', NULL, NULL, NULL, '1627633222scaled_image_picker1592643524815273641.png', '1', '2021-07-30 08:11:51', '2021-07-30 10:29:40', NULL),
(102, '1', 'finaltest', 'final@gmail.com', '1234567890', 'Male', '1', '[1, 2]', 'Cardiology', 'Libya', 'Misrata', 'Misrata', '123456', '123', '$2y$10$/AIhRCg6sArVxLW3clgqHeQs7cEnUvs.yumOs73mMlJMsQIuZk.ja', 'eyJpdiI6ImtQakM2NzJFUTAxR1RaN1RKWjFOOGc9PSIsInZhbHVlIjoibXJXcm53WFc3MUxJTEtyWmlyWDlVQT09IiwibWFjIjoiY2VlYTZkNWFlM2I4ZjM4ZmVmMDA1Y2ZjNDA4OGZjODJjMWEyZDJkNDQyYTVmNmJlZWUyM2MyY2VhOGYwYzRiOSJ9', NULL, NULL, '', '1', 'aa', NULL, 'Heart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-30 12:36:44', '2021-07-30 12:45:18', NULL),
(103, '1', 'Dr D K', 'dr@nmail.com', '9871298712', 'Female', '1', '[1, 2]', 'Oncology', 'Libya', 'Tripoli', 'Tripoli', '31322', 'abc building', '$2y$10$uWPZ8tapkLI3tZmaEb62Au4b938Kgctzq06dki8hzKnZG.Ma.e7Ka', 'eyJpdiI6InVLRnUzYkJreUc5dW9wTkJnUmFhZkE9PSIsInZhbHVlIjoiZ2tZcjB2WlFhQklqQWVEdTJBUkJEUT09IiwibWFjIjoiYzAyODUwODY3MGFjMzBmZmZlNzBkZDNlYjVkYzI2NWU4NTQwYmJmZWE5ODNkMTFmMGIwMmRjZjg2NWUyYjIyNCJ9', NULL, NULL, '', '1', 'abc area', NULL, 'Lungs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-30 14:08:06', '2021-07-30 14:08:06', NULL),
(104, '1', 'ddss', 'as@g.com', '1414141414', 'Male', '1', '[1]', 'Oncology', 'Tunisia', 'Zawiyta', 'Derna', '14141', 'xdxxxdx', '$2y$10$DtKe9Rv/4PZPIrm0y0AiV.sEJGAtABWDBymM44A929W9vqfLWkcGm', 'eyJpdiI6ImZtQ2FuQ3FlS2RyYXZPNUxBNTBDY3c9PSIsInZhbHVlIjoiQWFYS0dQdGtSSHp5Y0plUGNjQ1I1UT09IiwibWFjIjoiOTA5OGY1ZGRhOWE4ODliMjE1ZTlmYzllOTNiZmFjM2NlNTlkMmQzYzk2MDFiMGI3YjljODllOTEwMTU5ZDZkNyJ9', NULL, NULL, '', '', 'xsxx', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-07-30 18:25:10', '2021-07-30 18:25:10', NULL),
(105, '1', 'asd', 'qw@g.com', '1414141414', 'Male', '1', '[1, 2]', 'Medicine', 'Tunisia', 'Aibayda', 'Aibayda', '141414141', 'sssss', '$2y$10$wjJE07SuVM5mIs.z4ppyaub61cPCkmaLdEqJVKbxoIaSJR/ZI4uhu', 'eyJpdiI6IlNkemhYUlZtWG4vM3FKc1NTN2Q5Wmc9PSIsInZhbHVlIjoiQTJyRHpGYjJCamNGbW95U2g0M213Zz09IiwibWFjIjoiYzZiZWE3NjlmYmYyMWU2ODhmNDA5YzEyN2RmNDVkZDdmMTA3NWQ0Nzc5YmI2ODgwODBhOTI0OWM3NzAxMjU4ZiJ9', NULL, NULL, '', '1', 'ddss', NULL, 'Dental', 'thuuj', 'English, Hindi', 'gghjbv', 'HOSPA, HOS1, HOSPC, HOS2', '45ggji', 'vvhji', 'chhch bc cl of  goal scv  bc hfhhbhhhhhhbhhhhhhhhhhbjjjjjjjkkkkkkkkkkkkkkk', '', '1', '2021-07-30 18:26:07', '2021-08-03 03:04:22', NULL),
(106, '1', 'asdsd', 'asd15@g.com', '1212121218', 'Male', '1', '[1, 2]', 'Oncology', 'Turkey', 'Derna', 'Sebha', '123213', 'asdasd', '$2y$10$PGMrQYg2ikAlQNmCYvfwI.seq9ZRbIBONHlK4n18S7W/dF6k3c99u', 'eyJpdiI6Im96bEZNRmdzZG9PMUUvaUFOWmVQRWc9PSIsInZhbHVlIjoiQWF0bFc4ZDB4VFNYSGlJaEgyTVpCUT09IiwibWFjIjoiMmRjMjQ4ZjY4NmFkYmRhMGNiZGNmNjM0MjIzZmIyMzA5M2UxMjE1ZmY4ODdjOTI2MjA2Y2NlYmEyMTkxNjA2MCJ9', NULL, NULL, '', '1', 'asdsad', NULL, 'Dental', NULL, NULL, NULL, NULL, NULL, NULL, 'nbjbvmnbmnbmnbmbmbmnbmnbmnbmnbmnbmnbmnbmnbmnbmnbmnbmnbmnbmnbmnbmnbmnfdghjkljgfdssghjklhgfdssghjklhgfdsghjkljhgfddfhjkl;jhgfdsfghjkljhgfdsghjkl;jhgfdsfghjkljhgfdghjkljhgfdghjklhgfdsghjklhgfdsghjkhgfdsghjklhgfdsghjkljhgfdghjkl;jhgfdsfghjklhgfdsghjkl;jhgfdghjk', '1627923184image_picker_91990672-DBA5-406F-A960-4C89CF17A8FF-55386-000385BBBC392AC5.jpg', '1', '2021-08-02 15:28:36', '2021-08-02 04:56:00', NULL),
(107, '1', 'doc', 'docab@g.com', '1212112121', 'Others', '1', '[1, 2]', 'Gynaecology', 'Libya', 'Aibayda', 'Behhazi', '1212121', 'asdasdsad', '$2y$10$aylBvXKE/48vKt5Yjf5j8e00qIgmNLXbHx5bYdFAetF7imPSwcnVG', 'eyJpdiI6IlRKRXYxeHhyanY0Y2pQN0ZtQnUyeHc9PSIsInZhbHVlIjoiaGpxQ0NOOUNwek16TytvZW9PWGRvZz09IiwibWFjIjoiNGNmMTNjMTNjMWM3M2E3NzMzYzVkNTEwY2ZhOWYzZDJmNTUzNzEzM2EwNDY2ZjExMDZlNWMwNGYzYjY0MjExZSJ9', NULL, NULL, '', '1', 'sadasdad', NULL, 'Physiotherapist, Dermatologist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-08-03 15:44:27', '2021-08-22 04:43:34', NULL),
(109, '1', 'Dr Dr', 'dr.dr@gmail.com', '6548965489', 'Female', '2', '[1, 2]', 'Gastrointestinal', 'Tunisia', 'Sebha', 'Behhazi', '31322', 'abc building', '$2y$10$f/dkZrkcPKDYvUj61m6oseOlqhYSC1E3dCNMSMotsfLxsOk3O84jO', 'eyJpdiI6IjJnMjlRcUJvTXRKWmcvUXdWWTFxZnc9PSIsInZhbHVlIjoiYkYzeDl1czZ3YVRsWmFIMHZ2dzVMQT09IiwibWFjIjoiZGM2MTlhNTg3OTBhOWNmNTIzODc3YjgxZDA3ZDA0OWMwM2UwZDMyZWVhOWE2MzlkYjhkM2UwMTRkMjBjZjBkZSJ9', NULL, NULL, '', '1', 'abc area', NULL, 'Heart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-08-03 17:21:08', '2021-08-03 17:21:08', NULL),
(110, '1', 'Dr test', 'testtest@gmail.com', '9874598745', 'Female', '1', '[1, 2]', 'Nephrology', 'Turkey', 'Misrata', 'Tripoli', '31322', 'abc building', '$2y$10$7fFCLPLAiXBEDtohzblsLe3z0kJvJ/SnhoNQi.scjYZfz5SGCYrpa', 'eyJpdiI6IjlrcXo3T1dmVXVnZmFjb3lwVnM3bnc9PSIsInZhbHVlIjoiUVJOSGdnV0ViUEk4K1AzN0J3RmFvQT09IiwibWFjIjoiMGJlYzIzMzczMDVjNTk5NjY4NWZlNzc1ZmRiODdmZmNhMzA3MDk4ZGQxNzFjMTA5NDlkZjA0YzFkZWM2ZjYyYSJ9', NULL, NULL, '', '1', 'abc area', NULL, 'Lungs', 'thanks for', 'English, Hindi, Arabic, French', 'thanks for', 'HOSPA, HOS1, HOSPC, HOS2', '45678', 'certificate testing', 'thanks for your help thanks again dear dear happy birthday dear dear happy Anniversary happy birthday happy birthday to happy birthday dear friend love miss you love you guys too dear love love thank you for all the prayers love miss you love', '', '1', '2021-08-04 08:48:58', '2021-08-04 10:39:39', NULL),
(111, '1', 'mydoc', 'mydd@g.com', '12312312', 'Male', '1', '[1, 2]', 'Gynaecology', 'Turkey', 'Misrata', 'Sebha', '123123', 'wqeweqw', '$2y$10$.1WjBPGqz1Y2c271exstWe8hF71TYcTblIreY49mFVFyGlvPzFhPW', 'eyJpdiI6InJEU0QzejM4ZWYvSWxrY2F6b1lUc2c9PSIsInZhbHVlIjoidnBhTHJPcWI0a2lrQ1MvaDNSRW5Ydz09IiwibWFjIjoiYzYyNGM5ZDFkNzE3MTM2YWYxMmVhY2I0ZTQ4ZTA1M2U0ZDFkZjEyMDUyMGYxNTgxMWNiY2E5N2NkMDRkYWE1ZCJ9', NULL, NULL, '', '1', 'qwqwe', NULL, 'Dermatologist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-08-19 17:36:37', '2021-08-19 17:36:37', NULL),
(112, '1', 'hhelo', 'dochh@g.com', '585854422', 'Others', '1', '[1]', 'Nephrology', 'Libya', 'Sebha', 'Derna', '558880', 'saasaa', '$2y$10$QuYGVKVucVDgeV1q9STi9.Xi.H255Jb57NHhuZcrFwagpTvt/5ocS', 'eyJpdiI6ImhSMm5sbVlNaWV5QkMrTDF6MWhMZFE9PSIsInZhbHVlIjoiZFVUQ09zYlFneTFWUjZZeFQ2bHhjQT09IiwibWFjIjoiNGIwZmZkZGUyZTg1YTA3MDdjNTljNjM0ZDk2ODkyNDEwMWRkOWQzY2EyYzFkNzkwOGI1ZmMwNDlkOTU3OWFlZCJ9', NULL, NULL, '', '1', 'szdasjj', NULL, 'Neurosurgeon, Radiologist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1629643393image_picker_755208B5-B7C0-4242-8461-E616F2C894FF-4399-0000025FCC315917.jpg', '1', '2021-08-19 17:57:35', '2021-08-22 02:44:21', NULL),
(113, '1', 'nezar', 'nizarmilad16@gmail.com', '00905393010784', 'Male', '1', '[1]', 'Medicine', 'Libya', 'Tripoli', 'Tripoli', '370180', '25/5', '$2y$10$8yOnilCKy2RcYcrpfAPzYeJSWY7tl9dyZnNIGi0klUmXR8MP1y2vS', 'eyJpdiI6IkpobkVPY3NOVWFhTWZKRXpMdG1HekE9PSIsInZhbHVlIjoiaU92ZXdqT0grMlR3R3pwd2VidkRNUT09IiwibWFjIjoiZmNhOWNlZDM0MDMyYzRlNzQ0ODFjZDI3ODQ3YTM3NmRiOGViYzA3NzZjYzY5ODE1OTRiN2U4YjhlNmE3N2RjNCJ9', NULL, NULL, '', '', 'bin ashour', NULL, 'ICU', '10 years', 'English, Arabic, French', 'medicine  degree master FİCM', NULL, '125430', 'Arab Üniversity', NULL, '', '1', '2021-08-19 19:13:48', '2021-08-19 07:16:09', NULL),
(114, '1', 'Dr Bharat', 'bharat@gmail.com', '9870150358', 'Male', '1', '[1, 2]', 'Cardiology', 'Tunisia', 'Sebha', 'Sebha', '31322', 'abc building', '$2y$10$lpB6b/nH.yBntDsRi6WSi.cIe1.Hbotj/A4mDyABDlTK7AsxaV8na', 'eyJpdiI6IkhVT0FYTnFhK1djcVNNTEROd0wrQ0E9PSIsInZhbHVlIjoiZGdBRGRhaFpQMHZSL2tTdlplVi92UT09IiwibWFjIjoiZmFkNGFmYTUwNWZkMDVhZGRlYjUwZjM5NWNiYjA0OTQyNWViZmRiN2YzNjk5MGM0YTc3NjMzY2IyNGQzMmQwYiJ9', NULL, NULL, '', '1', 'abc area', NULL, 'Cardiology', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-08-20 05:29:43', '2021-08-20 05:29:43', NULL),
(115, '1', 'Rohit', 'rohit@gmail.com', '2541965289', 'Male', '1', '[1]', 'Medicine', 'Turkey', 'Sebha', 'Behhazi', '52165', 'ok', '$2y$10$8RAlGcdxXCm3u.YfIC6EZu93svEDgDfFnaAlCQ8ur1Lh3hA01bRNi', 'eyJpdiI6IndFRkg5NzBDU0lxcy9HNzJzZUxaS3c9PSIsInZhbHVlIjoiTVdRQ3FzWXBjUUVnS0ZYeEc3QUQvQT09IiwibWFjIjoiNWNlYjQ3NTdhNDc3Y2ZkNzdiYjE0YjUxZWUwODhiZjM5YTcyYjJhM2Y1NjQ0NzRiZWI4MDFhNGY1NDM0ODAzZSJ9', NULL, NULL, '', '1', 'ok', NULL, 'Radiologist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '2021-08-20 05:41:23', '2021-08-20 05:41:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provider_details`
--

CREATE TABLE `provider_details` (
  `id` int NOT NULL,
  `provider_id` int NOT NULL,
  `pro_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialization_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `training` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_gender` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `languages` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `languages_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider_details`
--

INSERT INTO `provider_details` (`id`, `provider_id`, `pro_name`, `pro_email`, `pro_phone`, `department`, `specialization`, `specialization_list`, `country`, `state`, `city`, `zipcode`, `address`, `education`, `training`, `provider_gender`, `languages`, `languages_list`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 06:21:16', '2021-05-22 06:21:16', NULL),
(8, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-23 17:28:58', '2021-05-23 17:28:58', NULL),
(9, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-23 17:32:04', '2021-05-23 17:32:04', NULL),
(10, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-23 17:55:21', '2021-05-23 17:55:21', NULL),
(11, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-23 18:22:31', '2021-05-23 18:22:31', NULL),
(12, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-23 19:44:52', '2021-05-23 19:44:52', NULL),
(13, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-24 03:43:33', '2021-05-24 03:43:33', NULL),
(14, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-24 03:49:37', '2021-05-24 03:49:37', NULL),
(15, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-25 20:55:29', '2021-05-25 20:55:29', NULL),
(16, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-25 20:56:25', '2021-05-25 20:56:25', NULL),
(17, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-26 18:09:31', '2021-05-26 18:09:31', NULL),
(18, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 12:09:19', '2021-05-28 12:09:19', NULL),
(19, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 12:16:54', '2021-05-28 12:16:54', NULL),
(20, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-30 07:06:39', '2021-05-30 07:06:39', NULL),
(21, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-30 08:56:52', '2021-05-30 08:56:52', NULL),
(22, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-30 18:10:38', '2021-05-30 18:10:38', NULL),
(23, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-30 19:38:41', '2021-05-30 19:38:41', NULL),
(24, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-04 04:14:31', '2021-06-04 04:14:31', NULL),
(25, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-04 00:13:38', '2021-06-04 00:13:38', NULL),
(26, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-07 03:57:02', '2021-06-07 03:57:02', NULL),
(27, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-07 18:27:34', '2021-06-07 18:27:34', NULL),
(28, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 04:48:37', '2021-06-08 04:48:37', NULL),
(29, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 08:00:51', '2021-06-09 08:00:51', NULL),
(30, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 15:19:38', '2021-06-09 15:19:38', NULL),
(31, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-10 06:04:48', '2021-06-10 06:04:48', NULL),
(32, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-10 06:16:10', '2021-06-10 06:16:10', NULL),
(33, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-10 06:19:35', '2021-06-10 06:19:35', NULL),
(34, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-12 16:45:13', '2021-06-12 16:45:13', NULL),
(35, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-13 07:06:30', '2021-06-13 07:06:30', NULL),
(36, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-13 08:32:05', '2021-06-13 08:32:05', NULL),
(37, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-13 08:35:51', '2021-06-13 08:35:51', NULL),
(38, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-13 14:40:35', '2021-06-13 14:40:35', NULL),
(39, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-13 18:26:01', '2021-06-13 18:26:01', NULL),
(40, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-14 05:05:09', '2021-06-14 05:05:09', NULL),
(41, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-14 07:11:38', '2021-06-14 07:11:38', NULL),
(42, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-14 07:27:43', '2021-06-14 07:27:43', NULL),
(43, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-14 10:12:40', '2021-06-14 10:12:40', NULL),
(44, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-17 17:54:27', '2021-06-17 17:54:27', NULL),
(45, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-19 08:22:57', '2021-06-19 08:22:57', NULL),
(46, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-19 19:12:09', '2021-06-19 19:12:09', NULL),
(47, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-20 12:43:40', '2021-06-20 12:43:40', NULL),
(48, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-20 13:22:02', '2021-06-20 13:22:02', NULL),
(49, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-20 16:30:36', '2021-06-20 16:30:36', NULL),
(50, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21 05:33:15', '2021-06-21 05:33:15', NULL),
(51, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21 07:19:01', '2021-06-21 07:19:01', NULL),
(52, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21 10:06:06', '2021-06-21 10:06:06', NULL),
(53, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21 11:27:54', '2021-06-21 11:27:54', NULL),
(54, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21 11:32:54', '2021-06-21 11:32:54', NULL),
(55, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21 11:47:26', '2021-06-21 11:47:26', NULL),
(56, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21 12:15:51', '2021-06-21 12:15:51', NULL),
(57, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21 12:19:47', '2021-06-21 12:19:47', NULL),
(58, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-26 07:54:36', '2021-06-26 07:54:36', NULL),
(59, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-26 07:57:30', '2021-06-26 07:57:30', NULL),
(60, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-26 16:00:09', '2021-06-26 16:00:09', NULL),
(61, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-26 16:37:44', '2021-06-26 16:37:44', NULL),
(62, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-26 16:59:23', '2021-06-26 16:59:23', NULL),
(63, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-28 09:25:44', '2021-06-28 09:25:44', NULL),
(64, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-28 10:10:25', '2021-06-28 10:10:25', NULL),
(65, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-28 11:11:52', '2021-06-28 11:11:52', NULL),
(66, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-30 08:20:35', '2021-06-30 08:20:35', NULL),
(67, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-30 08:28:41', '2021-06-30 08:28:41', NULL),
(68, 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-30 09:45:17', '2021-06-30 09:45:17', NULL),
(69, 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-01 17:32:10', '2021-07-01 17:32:10', NULL),
(70, 71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-03 08:10:08', '2021-07-03 08:10:08', NULL),
(71, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 11:02:03', '2021-07-04 11:02:03', NULL),
(72, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 18:03:30', '2021-07-04 18:03:30', NULL),
(73, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-06 13:44:46', '2021-07-06 13:44:46', NULL),
(74, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-07 04:51:30', '2021-07-07 04:51:30', NULL),
(75, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-07 04:55:42', '2021-07-07 04:55:42', NULL),
(76, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-07 05:03:26', '2021-07-07 05:03:26', NULL),
(77, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-07 05:06:54', '2021-07-07 05:06:54', NULL),
(78, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-07 05:07:36', '2021-07-07 05:07:36', NULL),
(79, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-07 05:17:27', '2021-07-07 05:17:27', NULL),
(80, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-07 09:44:15', '2021-07-07 09:44:15', NULL),
(81, 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-07 10:15:40', '2021-07-07 10:15:40', NULL),
(82, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-09 09:42:58', '2021-07-09 09:42:58', NULL),
(83, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-19 17:23:25', '2021-07-19 17:23:25', NULL),
(84, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-22 16:05:51', '2021-07-22 16:05:51', NULL),
(85, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-24 07:38:36', '2021-07-24 07:38:36', NULL),
(86, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-24 20:47:10', '2021-07-24 20:47:10', NULL),
(87, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-25 05:39:58', '2021-07-25 05:39:58', NULL),
(88, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-25 10:06:16', '2021-07-25 10:06:16', NULL),
(89, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-25 13:14:03', '2021-07-25 13:14:03', NULL),
(90, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-25 16:05:52', '2021-07-25 16:05:52', NULL),
(91, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-25 16:43:12', '2021-07-25 16:43:12', NULL),
(92, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-25 18:41:10', '2021-07-25 18:41:10', NULL),
(93, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-25 18:47:15', '2021-07-25 18:47:15', NULL),
(94, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-28 05:36:54', '2021-07-28 05:36:54', NULL),
(95, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-28 09:25:10', '2021-07-28 09:25:10', NULL),
(96, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-28 10:53:28', '2021-07-28 10:53:28', NULL),
(97, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-28 15:28:25', '2021-07-28 15:28:25', NULL),
(98, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-29 08:41:02', '2021-07-29 08:41:02', NULL),
(99, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-29 14:50:40', '2021-07-29 14:50:40', NULL),
(100, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-30 08:11:51', '2021-07-30 08:11:51', NULL),
(101, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-30 12:36:44', '2021-07-30 12:36:44', NULL),
(102, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-30 14:08:06', '2021-07-30 14:08:06', NULL),
(103, 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-30 18:25:10', '2021-07-30 18:25:10', NULL),
(104, 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-30 18:26:07', '2021-07-30 18:26:07', NULL),
(105, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-02 15:28:36', '2021-08-02 15:28:36', NULL),
(106, 107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-03 15:44:27', '2021-08-03 15:44:27', NULL),
(107, 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-03 16:57:28', '2021-08-03 16:57:28', NULL),
(108, 109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-03 17:21:08', '2021-08-03 17:21:08', NULL),
(109, 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-04 08:48:58', '2021-08-04 08:48:58', NULL),
(110, 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-19 17:36:37', '2021-08-19 17:36:37', NULL),
(111, 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-19 17:57:35', '2021-08-19 17:57:35', NULL),
(112, 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-19 19:13:48', '2021-08-19 19:13:48', NULL),
(113, 114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-20 05:29:43', '2021-08-20 05:29:43', NULL),
(114, 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-20 05:41:23', '2021-08-20 05:41:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provider_images`
--

CREATE TABLE `provider_images` (
  `id` int NOT NULL,
  `provider_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider_images`
--

INSERT INTO `provider_images` (`id`, `provider_id`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, '10', '1622398022list_images.png', '2021-05-30 18:07:02', '2021-07-05 17:37:17', '2021-07-05 17:37:17'),
(10, '10', '1622398031list_images.png', '2021-05-30 18:07:11', '2021-05-30 18:07:11', NULL),
(11, '10', '1622398037list_images.png', '2021-05-30 18:07:17', '2021-05-30 18:07:17', NULL),
(12, '10', '1622398053list_images.png', '2021-05-30 18:07:33', '2021-05-30 18:07:33', NULL),
(13, '10', '1622398061list_images.png', '2021-05-30 18:07:41', '2021-05-30 18:07:41', NULL),
(14, '10', '1622398067list_images.png', '2021-05-30 18:07:47', '2021-05-30 18:07:47', NULL),
(15, '10', '1622398077list_images.png', '2021-05-30 18:07:57', '2021-05-30 18:07:57', NULL),
(16, '10', '1622398096list_images.png', '2021-05-30 18:08:16', '2021-05-30 18:08:16', NULL),
(17, '10', '1622398106list_images.png', '2021-05-30 18:08:26', '2021-05-30 18:08:26', NULL),
(18, '10', '1622398115list_images.png', '2021-05-30 18:08:35', '2021-05-30 18:08:35', NULL),
(19, '10', '1622398120list_images.png', '2021-05-30 18:08:40', '2021-05-30 18:08:40', NULL),
(20, '23', '1622398326list_images.png', '2021-05-30 18:12:06', '2021-05-30 18:12:06', NULL),
(21, '23', '1622398481image_picker_C2176297-289C-4325-9176-8AB771DE5F5E-56945-00002950DCE2650D.jpg', '2021-05-30 18:14:41', '2021-05-30 18:14:41', NULL),
(22, '23', '1622398481image_picker_8540DE26-BAB1-4950-B939-2DF758EC4DB9-56945-0000294FBC5C9738.jpg', '2021-05-30 18:14:41', '2021-05-30 18:14:41', NULL),
(23, '23', '1622398481image_picker_A723CF8F-25BA-4E7C-A880-52DC0A3C5827-56945-0000294EA208C981.jpg', '2021-05-30 18:14:41', '2021-05-30 18:14:41', NULL),
(24, '24', '1622404083image_picker7298113189349165711.jpg', '2021-05-30 19:48:03', '2021-05-30 19:48:03', NULL),
(25, '28', '1623092319image_picker_8579BD8E-8E74-4716-B5B6-42372AF9D9D0-79499-0000565C8BAC790B.png', '2021-06-07 18:58:40', '2021-06-07 18:58:40', NULL),
(26, '28', '1623092320image_picker_64C99076-8A67-48E8-B5BC-B2569A2520A3-79499-0000565B489D26D2.jpg', '2021-06-07 18:58:41', '2021-06-07 18:58:41', NULL),
(27, '28', '1623092321image_picker_2783034B-7CAD-4404-99C1-E6EF8F1B66ED-79499-00005659F82F164A.jpg', '2021-06-07 18:58:43', '2021-06-07 18:58:43', NULL),
(28, '28', '1623092323image_picker_FF8FE54D-FDB7-4B10-A777-663E228AF9CF-79499-00005658AED919A4.jpg', '2021-06-07 18:58:45', '2021-06-07 18:58:45', NULL),
(29, '28', '1623092325image_picker_9BE47D2C-05EB-4333-BF10-8855989D5EF7-79499-00005657830BE2E1.png', '2021-06-07 18:58:45', '2021-06-07 18:58:45', NULL),
(30, '29', '1623128157image_picker_D21B6C89-AC8B-40F6-8AB7-D202260A6D32-5864-000002AD350DED1F.jpg', '2021-06-08 04:55:59', '2021-06-08 04:55:59', NULL),
(31, '29', '1623128159image_picker_157A86A5-720D-4A21-A254-74AA26222720-5864-000002AD286BB567.jpg', '2021-06-08 04:56:00', '2021-06-08 04:56:00', NULL),
(32, '29', '1623128160image_picker_52EA7793-41C7-4CFD-B032-DBFC394288AD-5864-000002AD19B419A4.jpg', '2021-06-08 04:56:03', '2021-06-08 04:56:03', NULL),
(33, '29', '1623128163image_picker_23A6E6C4-9349-4AFC-8B55-0B5C52F49293-5864-000002AD109B9F17.jpg', '2021-06-08 04:56:10', '2021-06-08 04:56:10', NULL),
(34, '29', '1623128170image_picker_F437856D-6100-4191-80D1-5016DE05B303-5864-000002AD04822881.jpg', '2021-06-08 04:56:13', '2021-06-08 04:56:13', NULL),
(35, '51', '1624254064image_picker_9597572F-FAA5-405F-95A9-60E120E2F0C2-4948-000002962A8584DA.jpg', '2021-06-21 05:41:04', '2021-06-21 05:41:04', NULL),
(36, '51', '1624254087image_picker_9597572F-FAA5-405F-95A9-60E120E2F0C2-4948-000002962A8584DA.jpg', '2021-06-21 05:41:27', '2021-06-21 05:41:27', NULL),
(37, '51', '1624254102image_picker_9597572F-FAA5-405F-95A9-60E120E2F0C2-4948-000002962A8584DA.jpg', '2021-06-21 05:41:42', '2021-06-21 05:41:42', NULL),
(38, '52', '1624260292image_picker_8B6AC17D-3DAA-416C-91CA-78784864B91A-4201-000003A05D004550.png', '2021-06-21 07:24:52', '2021-06-21 07:24:52', NULL),
(39, '52', '1624260292image_picker_A7A25569-9AA7-407D-A3A1-ED3A113A461A-4201-000003A052AC66EA.jpg', '2021-06-21 07:24:53', '2021-06-21 07:24:53', NULL),
(40, '52', '1624260344image_picker_4963F2C3-C3D0-4AA5-B5FA-205E901E7B16-4201-000003A0A5D45A08.jpg', '2021-06-21 07:25:44', '2021-06-21 07:25:44', NULL),
(41, '52', '1624260344image_picker_3ED62623-0DDB-4F1F-9664-E4A9128D15F3-4201-000003A092C55C0F.jpg', '2021-06-21 07:25:46', '2021-06-21 07:25:46', NULL),
(42, '47', '1624274568image_picker_89FE0C4A-5801-4A94-BC10-F4E6EA0C53B6-42348-00001C126EE9051E.jpg', '2021-06-21 11:22:50', '2021-07-05 18:59:17', '2021-07-05 18:59:17'),
(43, '47', '1624274570image_picker_CAD73E2B-0921-4F12-B1DD-54A005A9BAD9-42348-00001C1184857079.jpg', '2021-06-21 11:22:51', '2021-07-05 18:59:18', '2021-07-05 18:59:18'),
(44, '47', '1624274571image_picker_79426D9A-D428-4722-A91C-F3298D56224B-42348-00001C10A23BA578.jpg', '2021-06-21 11:22:56', '2021-07-05 18:59:19', '2021-07-05 18:59:19'),
(45, '47', '1624274576image_picker_4BABB606-AC1A-4BCA-BE0B-E2A5AF509D7B-42348-00001C0EB22B6886.jpg', '2021-06-21 11:22:57', '2021-07-05 18:59:20', '2021-07-05 18:59:20'),
(46, '47', '1624274842image_picker_21199E90-A912-45AD-9A0F-E8915A9D48A4-42348-00001C582C0A602C.jpg', '2021-06-21 11:27:22', '2021-07-05 18:59:21', '2021-07-05 18:59:21'),
(47, '47', '1624274842image_picker_333B67D7-73CD-488D-A175-90DDB271BA9A-42348-00001C57223C1949.jpg', '2021-06-21 11:27:26', '2021-07-05 18:59:23', '2021-07-05 18:59:23'),
(48, '47', '1624275015image_picker_21199E90-A912-45AD-9A0F-E8915A9D48A4-42348-00001C582C0A602C.jpg', '2021-06-21 11:30:15', '2021-07-05 18:59:23', '2021-07-05 18:59:23'),
(49, '47', '1624275015image_picker_333B67D7-73CD-488D-A175-90DDB271BA9A-42348-00001C57223C1949.jpg', '2021-06-21 11:30:20', '2021-07-05 18:59:25', '2021-07-05 18:59:25'),
(50, '47', '1624610977scaled_image_picker6029071698908205477.jpg', '2021-06-25 08:49:37', '2021-07-05 18:18:03', '2021-07-05 18:18:03'),
(51, '47', '1624610977scaled_image_picker8105166034837734298.jpg', '2021-06-25 08:49:37', '2021-07-05 18:59:26', '2021-07-05 18:59:26'),
(52, '18', '1624944324scaled_image_picker4218220301610937271.png', '2021-06-29 05:25:24', '2021-06-29 05:25:24', NULL),
(53, '18', '1624944392scaled_image_picker4218220301610937271.png', '2021-06-29 05:26:32', '2021-07-07 10:16:38', '2021-07-07 10:16:38'),
(54, '56', '1625311418image_picker_CD1BE2C8-02EB-4B17-802E-E7A644E84CA6-10125-000008FF016BC426.jpg', '2021-07-03 11:23:38', '2021-07-03 11:23:38', NULL),
(55, '71', '1625374656image_picker_60800B5B-EBE2-44C5-9481-A5C93201E820-3171-000001EB9919815B.jpg', '2021-07-04 04:57:36', '2021-07-04 04:57:36', NULL),
(56, '71', '1625374758image_picker_3ACFE7BE-B38D-4CA9-B79D-21B4383022C3-3171-000001EC32ABFC15.jpg', '2021-07-04 04:59:18', '2021-07-04 04:59:18', NULL),
(57, '71', '1625374816image_picker_836DEFEC-C6B3-4A08-9287-0153087DFF10-3171-000001EC7D2A27B6.jpg', '2021-07-04 05:00:16', '2021-07-04 05:00:16', NULL),
(58, '71', '1625374816image_picker_0130407C-9135-48B8-98FC-D6F29BF2E713-3171-000001EC73B68264.png', '2021-07-04 05:00:16', '2021-07-04 05:00:16', NULL),
(59, '71', '1625374816image_picker_60859D2B-DE80-409E-A68C-AB6AA3713DCB-3171-000001EC680F656D.jpg', '2021-07-04 05:00:16', '2021-07-04 05:00:16', NULL),
(60, '71', '1625374816image_picker_6E8DFADC-117E-4B9D-822D-62FF0CBA89A5-3171-000001EC606226BF.jpg', '2021-07-04 05:00:16', '2021-07-04 05:00:16', NULL),
(61, '56', '1625393639image_picker_C4E82B35-1525-46AC-AC11-E73754FE5496-10736-0000098CEF81334E.jpg', '2021-07-04 10:13:59', '2021-07-04 10:13:59', NULL),
(62, '56', '1625400883image_picker_EAF376A9-9585-46DD-A97A-D4B96FA7E016-10797-000009ACE1BBFB5A.jpg', '2021-07-04 12:14:43', '2021-07-04 12:14:43', NULL),
(63, '47', '1625412528image_picker_A5E6B268-8881-4200-AAA7-538CFEC9935A-24268-000055427075402D.jpg', '2021-07-04 15:28:48', '2021-07-05 18:59:14', '2021-07-05 18:59:14'),
(64, '47', '1625412528http:', '2021-07-04 15:28:48', '2021-07-05 18:43:00', '2021-07-05 18:43:00'),
(65, '47', '1625412528http:', '2021-07-04 15:28:48', '2021-07-05 18:42:59', '2021-07-05 18:42:59'),
(66, '47', '1625412528http:', '2021-07-04 15:28:48', '2021-07-05 18:42:57', '2021-07-05 18:42:57'),
(67, '47', '16254141241624610977scaled_image_picker8105166034837734298.jpg', '2021-07-04 15:55:24', '2021-07-05 18:42:56', '2021-07-05 18:42:56'),
(68, '47', '16254141241624610977scaled_image_picker6029071698908205477.jpg', '2021-07-04 15:55:24', '2021-07-05 18:42:55', '2021-07-05 18:42:55'),
(69, '47', '16254141241624275015image_picker_333B67D7-73CD-488D-A175-90DDB271BA9A-42348-00001C57223C1949.jpg', '2021-07-04 15:55:24', '2021-07-05 18:42:52', '2021-07-05 18:42:52'),
(70, '47', '16254141241624275015image_picker_21199E90-A912-45AD-9A0F-E8915A9D48A4-42348-00001C582C0A602C.jpg', '2021-07-04 15:55:24', '2021-07-05 18:42:41', '2021-07-05 18:42:41'),
(71, '47', '16254141241624274842image_picker_333B67D7-73CD-488D-A175-90DDB271BA9A-42348-00001C57223C1949.jpg', '2021-07-04 15:55:24', '2021-07-05 18:42:40', '2021-07-05 18:42:40'),
(72, '47', '16254141241624274842image_picker_21199E90-A912-45AD-9A0F-E8915A9D48A4-42348-00001C582C0A602C.jpg', '2021-07-04 15:55:24', '2021-07-05 18:42:38', '2021-07-05 18:42:38'),
(73, '47', '16254141241624274576image_picker_4BABB606-AC1A-4BCA-BE0B-E2A5AF509D7B-42348-00001C0EB22B6886.jpg', '2021-07-04 15:55:24', '2021-07-05 18:42:37', '2021-07-05 18:42:37'),
(74, '47', '16254141241624274571image_picker_79426D9A-D428-4722-A91C-F3298D56224B-42348-00001C10A23BA578.jpg', '2021-07-04 15:55:24', '2021-07-05 18:42:35', '2021-07-05 18:42:35'),
(75, '47', '16254141241624274570image_picker_CAD73E2B-0921-4F12-B1DD-54A005A9BAD9-42348-00001C1184857079.jpg', '2021-07-04 15:55:24', '2021-07-05 18:42:34', '2021-07-05 18:42:34'),
(76, '47', '16254141241624274568image_picker_89FE0C4A-5801-4A94-BC10-F4E6EA0C53B6-42348-00001C126EE9051E.jpg', '2021-07-04 15:55:24', '2021-07-05 18:42:31', '2021-07-05 18:42:31'),
(77, '47', '16254169151624610977scaled_image_picker6029071698908205477.jpg', '2021-07-04 16:41:55', '2021-07-05 18:59:28', '2021-07-05 18:59:28'),
(78, '47', '16254169151624275015image_picker_333B67D7-73CD-488D-A175-90DDB271BA9A-42348-00001C57223C1949.jpg', '2021-07-04 16:41:59', '2021-07-05 18:59:29', '2021-07-05 18:59:29'),
(79, '47', '16254169191624275015image_picker_21199E90-A912-45AD-9A0F-E8915A9D48A4-42348-00001C582C0A602C.jpg', '2021-07-04 16:42:00', '2021-07-05 18:59:30', '2021-07-05 18:59:30'),
(80, '47', '16254169201624274842image_picker_333B67D7-73CD-488D-A175-90DDB271BA9A-42348-00001C57223C1949.jpg', '2021-07-04 16:42:04', '2021-07-05 18:59:12', '2021-07-05 18:59:12'),
(81, '47', '16254169241624274842image_picker_21199E90-A912-45AD-9A0F-E8915A9D48A4-42348-00001C582C0A602C.jpg', '2021-07-04 16:42:05', '2021-07-05 18:59:31', '2021-07-05 18:59:31'),
(82, '47', '16254169251624274576image_picker_4BABB606-AC1A-4BCA-BE0B-E2A5AF509D7B-42348-00001C0EB22B6886.jpg', '2021-07-04 16:42:07', '2021-07-05 18:59:11', '2021-07-05 18:59:11'),
(83, '47', '16254169271624274571image_picker_79426D9A-D428-4722-A91C-F3298D56224B-42348-00001C10A23BA578.jpg', '2021-07-04 16:42:11', '2021-07-05 18:59:09', '2021-07-05 18:59:09'),
(84, '47', '16254169311624274570image_picker_CAD73E2B-0921-4F12-B1DD-54A005A9BAD9-42348-00001C1184857079.jpg', '2021-07-04 16:42:12', '2021-07-05 18:59:32', '2021-07-05 18:59:32'),
(85, '47', '16254169321624274568image_picker_89FE0C4A-5801-4A94-BC10-F4E6EA0C53B6-42348-00001C126EE9051E.jpg', '2021-07-04 16:42:15', '2021-07-05 18:59:34', '2021-07-05 18:59:34'),
(86, '73', '1625421882image_picker_9F469280-D0AA-434F-AD02-492188356605-47834-00005CCD11AF7A01.jpg', '2021-07-04 18:04:42', '2021-07-04 18:04:42', NULL),
(87, '73', '1625421882image_picker_F0BB1F69-F063-4BE4-8969-6454DF80BF53-47834-00005CCA8B4EF9D4.jpg', '2021-07-04 18:04:42', '2021-07-04 18:04:42', NULL),
(88, '73', '16254221451625421882image_picker_F0BB1F69-F063-4BE4-8969-6454DF80BF53-47834-00005CCA8B4EF9D4.jpg', '2021-07-04 18:09:05', '2021-07-04 18:09:05', NULL),
(89, '73', '16254221451625421882image_picker_9F469280-D0AA-434F-AD02-492188356605-47834-00005CCD11AF7A01.jpg', '2021-07-04 18:09:05', '2021-07-04 18:09:05', NULL),
(90, '73', '162542329016254221451625421882image_picker_9F469280-D0AA-434F-AD02-492188356605-47834-00005CCD11AF7A01.jpg', '2021-07-04 18:28:10', '2021-07-04 18:28:10', NULL),
(91, '73', '16254232901625421882image_picker_F0BB1F69-F063-4BE4-8969-6454DF80BF53-47834-00005CCA8B4EF9D4.jpg', '2021-07-04 18:28:10', '2021-07-04 18:28:10', NULL),
(92, '73', '16254232901625421882image_picker_9F469280-D0AA-434F-AD02-492188356605-47834-00005CCD11AF7A01.jpg', '2021-07-04 18:28:11', '2021-07-04 18:28:11', NULL),
(93, '47', '1625511650image_picker_55C4D672-51AB-4A2C-8DC1-E8A65BBF200D-31664-0000819B9658292B.jpg', '2021-07-05 19:00:50', '2021-07-05 19:13:12', '2021-07-05 19:13:12'),
(94, '47', '1625512411image_picker_E0F01241-8E2C-4068-8F78-136C8808D28E-31664-00008259631FA818.jpg', '2021-07-05 19:13:31', '2021-07-05 19:15:14', '2021-07-05 19:15:14'),
(95, '47', '1625512411image_picker_33D67FDD-04D0-468E-9088-34B6A6EFA4D4-31664-0000825A63A81886.jpg', '2021-07-05 19:13:31', '2021-07-05 19:13:44', '2021-07-05 19:13:44'),
(96, '47', '1625512453image_picker_F06C920C-CD0B-4CE3-8998-B9A35F3173EF-31664-00008263B1DAC67E.jpg', '2021-07-05 19:14:13', '2021-07-06 17:46:48', '2021-07-06 17:46:48'),
(97, '47', '1625593613image_picker_B26575E4-F2A8-4F7B-BD68-2218A3358FA9-5915-0000089F91C7F83C.jpg', '2021-07-06 17:46:53', '2021-07-06 18:00:57', '2021-07-06 18:00:57'),
(98, '47', '1625593613image_picker_4F6A0347-194B-47D6-B84D-ECC066FF512E-5915-000008A084775381.jpg', '2021-07-06 17:46:53', '2021-07-06 17:46:53', NULL),
(99, '47', '1625594439scaled_image_picker2683089190887528633.jpg', '2021-07-06 18:00:39', '2021-07-19 12:52:17', '2021-07-19 12:52:17'),
(100, '76', '1625635211image_picker_5DAC8084-F936-4327-AA07-63694837AF80-17906-000017EB95965536.jpg', '2021-07-07 05:20:11', '2021-07-07 05:23:45', '2021-07-07 05:23:45'),
(101, '76', '1625635211image_picker_9E1F49B7-0C0E-413F-9C53-776E0BC635B4-17906-000017EC5CEFAE6A.jpg', '2021-07-07 05:20:11', '2021-07-07 05:23:47', '2021-07-07 05:23:47'),
(102, '76', '1625635381image_picker_BE2D6742-2AA5-445C-9030-6B4065ED019B-17906-00001809F1C0E07F.jpg', '2021-07-07 05:23:01', '2021-07-07 05:23:01', NULL),
(103, '76', '1625635381image_picker_95F1B497-EC07-4DF8-AE54-1A9BB39BFF02-17906-0000180B23C59ECA.jpg', '2021-07-07 05:23:01', '2021-07-07 05:23:01', NULL),
(104, '80', '1625635664image_picker_77FAF52F-906A-40D0-B6D6-BC339DB949F2-17906-0000184554DA0160.jpg', '2021-07-07 05:27:44', '2021-07-07 08:56:40', '2021-07-07 08:56:40'),
(105, '80', '1625635664image_picker_3F898972-A240-4D91-B6C0-7920E88E7AEF-17906-000018463C13E39A.jpg', '2021-07-07 05:27:45', '2021-07-07 05:27:45', NULL),
(106, '80', '1625635665image_picker_8D5AE95D-AAA9-4EBC-AB3D-A3C02213C3CB-17906-0000184708720E98.jpg', '2021-07-07 05:27:45', '2021-07-07 05:27:45', NULL),
(107, '80', '1625648108image_picker_9152B28B-6B5A-4C89-884A-5E07A17165AA-10195-00000614E1D5D4D2.jpg', '2021-07-07 08:55:08', '2021-07-07 08:55:08', NULL),
(108, '80', '1625648108image_picker_BBA8DB30-0312-4A8C-890C-F67423040597-10195-00000614E82F956B.jpg', '2021-07-07 08:55:09', '2021-07-07 09:04:01', '2021-07-07 09:04:01'),
(109, '80', '1625648109image_picker_6BF2BBBD-B828-4003-9216-9BCCD2EBB89C-10195-00000614F052543B.jpg', '2021-07-07 08:55:09', '2021-07-07 08:56:41', '2021-07-07 08:56:41'),
(110, '81', '1625651649image_picker_193BB18B-B7CD-46E1-9075-1E2C7F663C30-13420-00000C25646359F8.jpg', '2021-07-07 09:54:09', '2021-07-07 09:54:09', NULL),
(111, '81', '1625651649image_picker_B7C7EEBA-ADC8-473E-BB0F-1B1285143123-13420-00000C257C036934.jpg', '2021-07-07 09:54:09', '2021-07-07 09:54:09', NULL),
(112, '80', '1626109877image_picker_7281076E-52A2-4DCF-975E-2C11C8BB7FF2-34263-00000A6C493872BA.jpg', '2021-07-12 17:11:17', '2021-07-12 17:11:17', NULL),
(113, '87', '1627159824image_picker_F1AFC352-32E8-469C-B023-98174AB9B40E-33120-000019D1C1CD64C3.jpg', '2021-07-24 20:50:24', '2021-07-24 20:50:24', NULL),
(114, '92', '1627231593image_picker_0C982E8F-9B49-4059-B02D-985F8A7C50C2-33851-00001A62D1720CC8.jpg', '2021-07-25 16:46:33', '2021-07-25 16:46:33', NULL),
(115, '47', '1627275007image_picker_735E9FB1-AF66-4303-9838-55386883CAB0-10351-000006C852874B9A.jpg', '2021-07-26 04:50:07', '2021-07-26 04:50:17', '2021-07-26 04:50:17'),
(116, '47', '1627275007image_picker_08AB10E4-F856-412D-9696-2957053F8A05-10351-000006C85CBFDE84.jpg', '2021-07-26 04:50:07', '2021-07-26 04:50:07', NULL),
(117, '47', '1627275007image_picker_FBC6DB41-A5A0-43CC-ABF1-FA25E118648E-10351-000006C8646FB28E.jpg', '2021-07-26 04:50:07', '2021-07-26 04:50:31', '2021-07-26 04:50:31'),
(118, '96', '1627464712image_picker_D2287CD6-121A-4B52-97E4-88771A4320B8-36617-00001C18B69830D0.jpg', '2021-07-28 09:31:52', '2021-07-28 09:31:52', NULL),
(119, '96', '1627464712image_picker_EE60D177-0349-4EE9-9C5D-34FCD27DC715-36617-00001C18C4D1D13B.jpg', '2021-07-28 09:31:52', '2021-07-28 09:31:52', NULL),
(120, '97', '1627547879image_picker_23317B6C-0408-47A6-A70D-97F2BE6AA51E-37665-00001CF90FA4EE2D.jpg', '2021-07-29 08:37:59', '2021-07-29 08:37:59', NULL),
(121, '97', '1627547879image_picker_41F8AE0B-BC1E-43BF-BB91-B53D37697F99-37665-00001CF9298B4300.jpg', '2021-07-29 08:37:59', '2021-07-29 08:37:59', NULL),
(122, '100', '1627578717image_picker_DCE01C26-AE77-468A-90D2-28AD361A0D12-38092-00001D6299645934.jpg', '2021-07-29 17:11:57', '2021-07-29 17:11:57', NULL),
(123, '100', '1627578717image_picker_E01C4B72-FBB5-4FA9-8E0F-C3BE4BDD3B4A-38092-00001D62A43935EE.jpg', '2021-07-29 17:11:57', '2021-07-29 17:11:57', NULL),
(124, '101', '1627633222scaled_image_picker1468312724946878859.jpg', '2021-07-30 08:20:22', '2021-07-30 08:20:22', NULL),
(125, '101', '1627633222scaled_image_picker3769701766756581462.png', '2021-07-30 08:20:22', '2021-07-30 08:20:22', NULL),
(126, '106', '1627923175image_picker_D7DE409F-385A-428E-9F92-5FEF0B9E2801-55386-000385B7AA527F6D.jpg', '2021-08-02 16:52:55', '2021-08-02 16:52:55', NULL),
(127, '106', '1627923175image_picker_9A719E0A-B62B-4520-94CC-70C28569AA3A-55386-000385B8D0072F35.jpg', '2021-08-02 16:52:55', '2021-08-02 16:52:55', NULL),
(128, '106', '1627923175image_picker_CA44D957-14F4-4203-AE88-08739CD7B5EF-55386-000385B99DFB1020.jpg', '2021-08-02 16:52:55', '2021-08-02 16:52:55', NULL),
(129, '106', '1627923203image_picker_B59A4B56-8DC8-423D-AFA3-6FD06C2B2E54-55386-000385C031A0E474.jpg', '2021-08-02 16:53:23', '2021-08-02 16:53:23', NULL),
(130, '106', '1627923223image_picker_BCAD1CBA-11CD-49F3-B659-63A534D70F90-55386-000385C3D72DED34.jpg', '2021-08-02 16:53:43', '2021-08-02 16:53:43', NULL),
(131, '106', '1627923223image_picker_F9C54E36-0210-4C85-9791-B0D75998A66A-55386-000385C4C4EAE75C.jpg', '2021-08-02 16:53:43', '2021-08-02 16:53:43', NULL),
(132, '60', '1627923329Screenshot from 2021-08-02 18-07-05.png', '2021-08-02 16:55:29', '2021-08-02 16:55:29', NULL),
(133, '106', '1627923360image_picker_D7D4B423-067B-4E37-A8CF-29C010E6FF21-55386-000385E26CAD3F49.jpg', '2021-08-02 16:56:00', '2021-08-02 16:56:00', NULL),
(134, '106', '1627923360image_picker_8E46B13E-AD96-4F2A-BDB6-3C6EE5BB04DF-55386-000385E32A7F4B0E.jpg', '2021-08-02 16:56:00', '2021-08-02 16:56:00', NULL),
(135, '106', '1627923360image_picker_400C762E-1E40-4A72-A710-A012DD4B2CE8-55386-000385E3F5125585.jpg', '2021-08-02 16:56:00', '2021-08-02 16:56:00', NULL),
(136, '106', '1627923360image_picker_EFCC2678-4646-42E2-9E15-3A7342E16031-55386-000385E4D0A403A6.jpg', '2021-08-02 16:56:00', '2021-08-02 16:56:00', NULL),
(137, '91', '1627959520image_picker_531F47FE-1A4A-479D-ABB8-BDBECDD5FD0C-25841-000005A44F26BF14.jpg', '2021-08-03 02:58:40', '2021-08-03 02:58:40', NULL),
(138, '91', '1627959520image_picker_1D2F97EF-A1FD-4897-B323-F50D09361137-25841-000005A456653041.jpg', '2021-08-03 02:58:40', '2021-08-03 02:58:40', NULL),
(139, '91', '1627959520image_picker_29C29F3C-07A7-4380-A368-333E0BB03989-25841-000005A4618A6ED1.jpg', '2021-08-03 02:58:40', '2021-08-03 02:58:40', NULL),
(140, '105', '1627959862image_picker_18699EC9-DB1C-4EFE-92A7-6A0D759375DB-19007-00000D00367385C3.jpg', '2021-08-03 03:04:22', '2021-08-03 03:04:22', NULL),
(141, '105', '1627959862image_picker_E19C5C4B-3C0A-4C57-9D0F-96EFEE008BFE-19007-00000D004189AD40.jpg', '2021-08-03 03:04:22', '2021-08-03 03:04:22', NULL),
(142, '105', '1627959862image_picker_5AAC4E29-92E8-47EA-92CB-FADD7B07F3E7-19007-00000D0048E8E074.jpg', '2021-08-03 03:04:22', '2021-08-03 03:04:22', NULL),
(143, '105', '1627959862image_picker_ABDB8986-BB68-4F87-B301-B5E0AC5F60EA-19007-00000D00503EDECD.jpg', '2021-08-03 03:04:22', '2021-08-03 03:04:22', NULL),
(144, '105', '1627959862image_picker_D4E4F8E0-CE24-40F2-AEDC-B2D6155E7DF9-19007-00000D00580DE8CD.jpg', '2021-08-03 03:04:22', '2021-08-03 03:04:22', NULL),
(145, '108', '1628010058image_picker_84A30F9A-6522-4667-BCA7-A94C657BF341-42150-000021424EA1373E.jpg', '2021-08-03 17:00:58', '2021-08-03 17:00:58', NULL),
(146, '108', '1628010058image_picker_7CE56AE8-FED3-47F1-A716-430C6D4D1EF5-42150-0000214259E909C5.jpg', '2021-08-03 17:00:58', '2021-08-03 17:00:58', NULL),
(147, '95', '1628061458image_picker_EB6E8321-407E-4616-AD1B-7BB051452ABA-30598-0000068052738BE3.jpg', '2021-08-04 07:17:38', '2021-08-04 07:17:38', NULL),
(148, '95', '1628061458image_picker_A46823DD-2C8A-4671-BA25-5E824655220D-30598-0000068067EF2FC0.jpg', '2021-08-04 07:17:38', '2021-08-04 07:17:38', NULL),
(149, '110', '1628073579image_picker_A5572890-1278-42F0-881A-B669C880E858-42764-000021A9C1689E4A.jpg', '2021-08-04 10:39:39', '2021-08-04 10:39:39', NULL),
(150, '110', '1628073579image_picker_B30EB7FD-1438-4C45-848A-2F98E4A8BB81-42764-000021B9BA3967DD.jpg', '2021-08-04 10:39:39', '2021-08-04 10:39:39', NULL),
(151, '112', '1629402618image_picker_4E125C0F-96F2-4B98-92A7-F9388F30B452-64624-00001BC582B292B8.jpg', '2021-08-19 19:50:18', '2021-08-19 19:50:18', NULL),
(152, '112', '1629402618image_picker_B384A59C-48FA-4EDF-9987-B8E016E959E5-64624-00001BC589059A9D.jpg', '2021-08-19 19:50:18', '2021-08-19 19:50:18', NULL),
(153, '112', '1629402618image_picker_94E8A19B-B2CE-44E2-979F-6C42A742C9DB-64624-00001BC5963C1B5C.jpg', '2021-08-19 19:50:18', '2021-08-19 19:50:18', NULL),
(154, '112', '1629402618image_picker_30DFFD1F-34BD-4CA6-BFEF-77646DCB6E0F-64624-00001BC5A3560A39.jpg', '2021-08-19 19:50:18', '2021-08-19 19:50:18', NULL),
(155, '47', '1629637897image_picker_818C1A45-21D2-4505-96C2-454E7F654674-15257-00008248E2E00DE3.jpg', '2021-08-22 13:11:37', '2021-08-22 13:11:37', NULL),
(156, '80', '1629638553scaled_image_picker5380657196304062086.jpg', '2021-08-22 13:22:33', '2021-08-22 13:22:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provider_sheduals`
--

CREATE TABLE `provider_sheduals` (
  `id` int NOT NULL,
  `providers_id` int DEFAULT NULL,
  `date_wise` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `day_wise` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video_date_wise` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video_day_wise` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `day_delete` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider_sheduals`
--

INSERT INTO `provider_sheduals` (`id`, `providers_id`, `date_wise`, `day_wise`, `video_date_wise`, `video_day_wise`, `day_delete`, `deleted_at`, `updated_at`) VALUES
(166, 86, '{\"07-29-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[],\"repeat\":\"[Sun, Mon, Tue, Wed, Thu, Fri, Sat]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[]}}],\"08-01-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"04:29 PM\",\"to\":\"05:30 PM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"05:30 PM\",\"to\":\"06:30 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":[{\"from\":\"04:29 PM\",\"to\":\"05:30 PM\"}],\"Mon\":[{\"from\":\"04:29 PM\",\"to\":\"05:30 PM\"}],\"Tue\":[{\"from\":\"04:29 PM\",\"to\":\"05:30 PM\"}],\"Wed\":[{\"from\":\"04:29 PM\",\"to\":\"05:30 PM\"}],\"Thu\":[{\"from\":\"04:29 PM\",\"to\":\"05:30 PM\"}],\"Fri\":[{\"from\":\"04:29 PM\",\"to\":\"05:30 PM\"}],\"Sat\":[{\"from\":\"04:29 PM\",\"to\":\"05:30 PM\"}]}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":[{\"from\":\"05:30 PM\",\"to\":\"06:30 PM\"}],\"Mon\":[{\"from\":\"05:30 PM\",\"to\":\"06:30 PM\"}],\"Tue\":[{\"from\":\"05:30 PM\",\"to\":\"06:30 PM\"}],\"Wed\":[{\"from\":\"05:30 PM\",\"to\":\"06:30 PM\"}],\"Thu\":\"\",\"Fri\":\"\",\"Sat\":\"\"}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"08-01-2021\",\"status\":null,\"message\":null,\"provider_id\":\"86\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"04:29 PM\",\"to\":\"05:30 PM\"}],\"repeat\":\"[]\"},{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"05:30 PM\",\"to\":\"06:30 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed]\"}]}', 'null', NULL, '2021-07-29 11:01:19.000000'),
(167, 98, '{\"07-31-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"07:58 PM\",\"to\":\"08:58 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed, Thu, Fri, Sat]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"10:58 PM\",\"to\":\"11:58 PM\"}],\"repeat\":\"[]\"}}],\"07-30-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"07:58 PM\",\"to\":\"08:58 PM\"}],\"repeat\":\"[]\"}}],\"07-29-2021\":[{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"08:01 PM\",\"to\":\"08:05 PM\"}],\"repeat\":\"[]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":[{\"from\":\"07:58 PM\",\"to\":\"08:58 PM\"}],\"Mon\":[{\"from\":\"07:58 PM\",\"to\":\"08:58 PM\"}],\"Tue\":[{\"from\":\"07:58 PM\",\"to\":\"08:58 PM\"}],\"Wed\":[{\"from\":\"07:58 PM\",\"to\":\"08:58 PM\"}],\"Thu\":[{\"from\":\"07:58 PM\",\"to\":\"08:58 PM\"}],\"Fri\":[{\"from\":\"07:58 PM\",\"to\":\"08:58 PM\"}],\"Sat\":[{\"from\":\"07:58 PM\",\"to\":\"08:58 PM\"}]}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":[{\"from\":\"10:58 PM\",\"to\":\"11:58 PM\"}],\"Mon\":[{\"from\":\"10:58 PM\",\"to\":\"11:58 PM\"}],\"Tue\":[{\"from\":\"10:58 PM\",\"to\":\"11:58 PM\"}],\"Wed\":[{\"from\":\"10:58 PM\",\"to\":\"11:58 PM\"}],\"Thu\":[{\"from\":\"10:58 PM\",\"to\":\"11:58 PM\"}],\"Fri\":[{\"from\":\"10:58 PM\",\"to\":\"11:58 PM\"}],\"Sat\":[{\"from\":\"10:58 PM\",\"to\":\"11:58 PM\"}]}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"07-29-2021\",\"status\":null,\"message\":null,\"provider_id\":\"98\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"08:01 PM\",\"to\":\"08:05 PM\"}],\"repeat\":\"[]\"}]}', '{\"08-01-2021\":{\"1\":\"video\"},\"08-02-2021\":{\"1\":\"video\"}}', NULL, '2021-07-29 14:31:45.000000'),
(168, 100, '{\"07-30-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"10:45 AM\",\"to\":\"11:45 AM\"},{\"from\":\"11:45 AM\",\"to\":\"12:45 PM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"11:45 AM\",\"to\":\"12:45 PM\"}],\"repeat\":\"[]\"}}],\"07-29-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"10:50 AM\",\"to\":\"11:50 AM\"},{\"from\":\"12:50 PM\",\"to\":\"02:50 PM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"12:50 PM\",\"to\":\"02:50 PM\"}],\"repeat\":\"[]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":\"\",\"Mon\":\"\",\"Tue\":\"\",\"Wed\":\"\",\"Thu\":\"\",\"Fri\":\"\",\"Sat\":\"\"}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":\"\",\"Mon\":\"\",\"Tue\":\"\",\"Wed\":\"\",\"Thu\":\"\",\"Fri\":\"\",\"Sat\":\"\"}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"07-29-2021\",\"status\":null,\"message\":null,\"provider_id\":\"100\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"10:50 AM\",\"to\":\"11:50 AM\"},{\"from\":\"12:50 PM\",\"to\":\"02:50 PM\"}],\"repeat\":\"[]\"},{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"12:50 PM\",\"to\":\"02:50 PM\"}],\"repeat\":\"[]\"}]}', 'null', NULL, '2021-07-29 17:20:45.000000'),
(169, 101, '{\"07-31-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:40 AM\",\"to\":\"04:00 PM\"},{\"from\":\"04:30 PM\",\"to\":\"08:30 PM\"},{\"from\":\"09:00 PM\",\"to\":\"09:30 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed, Thu, Fri, Sat]\"},\"video\":{\"timing\":[{\"from\":\"08:59 PM\",\"to\":\"09:00 PM\"}]}}],\"08-07-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:40 AM\",\"to\":\"04:00 PM\"},{\"from\":\"04:30 PM\",\"to\":\"08:30 PM\"},{\"from\":\"09:00 PM\",\"to\":\"09:30 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed, Thu, Fri, Sat]\"},\"video\":{\"timing\":[{\"from\":\"08:59 PM\",\"to\":\"09:00 PM\"}]}}],\"08-01-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:40 AM\",\"to\":\"04:00 PM\"},{\"from\":\"04:30 PM\",\"to\":\"08:30 PM\"},{\"from\":\"09:00 PM\",\"to\":\"09:30 PM\"}],\"repeat\":\"[Sun, Wed, Sat]\"},\"video\":{\"timing\":[{\"from\":\"08:59 PM\",\"to\":\"09:00 PM\"}]}}],\"07-30-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:40 AM\",\"to\":\"04:00 PM\"},{\"from\":\"04:30 PM\",\"to\":\"08:30 PM\"},{\"from\":\"09:00 PM\",\"to\":\"09:30 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed, Thu, Fri, Sat]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"08:59 PM\",\"to\":\"09:00 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed, Thu, Fri, Sat]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":[{\"from\":\"08:40 AM\",\"to\":\"04:00 PM\"},{\"from\":\"04:30 PM\",\"to\":\"08:30 PM\"},{\"from\":\"09:00 PM\",\"to\":\"09:30 PM\"}],\"Mon\":[{\"from\":\"08:40 AM\",\"to\":\"04:00 PM\"},{\"from\":\"04:30 PM\",\"to\":\"08:30 PM\"},{\"from\":\"09:00 PM\",\"to\":\"09:30 PM\"}],\"Tue\":[{\"from\":\"08:40 AM\",\"to\":\"04:00 PM\"},{\"from\":\"04:30 PM\",\"to\":\"08:30 PM\"},{\"from\":\"09:00 PM\",\"to\":\"09:30 PM\"}],\"Wed\":[{\"from\":\"08:40 AM\",\"to\":\"04:00 PM\"},{\"from\":\"04:30 PM\",\"to\":\"08:30 PM\"},{\"from\":\"09:00 PM\",\"to\":\"09:30 PM\"}],\"Thu\":[{\"from\":\"08:40 AM\",\"to\":\"04:00 PM\"},{\"from\":\"04:30 PM\",\"to\":\"08:30 PM\"},{\"from\":\"09:00 PM\",\"to\":\"09:30 PM\"}],\"Fri\":[{\"from\":\"08:40 AM\",\"to\":\"04:00 PM\"},{\"from\":\"04:30 PM\",\"to\":\"08:30 PM\"},{\"from\":\"09:00 PM\",\"to\":\"09:30 PM\"}],\"Sat\":[{\"from\":\"08:40 AM\",\"to\":\"04:00 PM\"},{\"from\":\"04:30 PM\",\"to\":\"08:30 PM\"},{\"from\":\"09:00 PM\",\"to\":\"09:30 PM\"}]}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":[{\"from\":\"08:59 PM\",\"to\":\"09:00 PM\"}],\"Mon\":[{\"from\":\"08:59 PM\",\"to\":\"09:00 PM\"}],\"Tue\":[{\"from\":\"08:59 PM\",\"to\":\"09:00 PM\"}],\"Wed\":[{\"from\":\"08:59 PM\",\"to\":\"09:00 PM\"}],\"Thu\":[{\"from\":\"08:59 PM\",\"to\":\"09:00 PM\"}],\"Fri\":[{\"from\":\"08:59 PM\",\"to\":\"09:00 PM\"}],\"Sat\":[{\"from\":\"08:59 PM\",\"to\":\"09:00 PM\"}]}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"07-30-2021\",\"status\":null,\"message\":null,\"provider_id\":\"101\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:40 AM\",\"to\":\"04:00 PM\"},{\"from\":\"04:30 PM\",\"to\":\"08:30 PM\"},{\"from\":\"09:00 PM\",\"to\":\"09:30 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed, Thu, Fri, Sat]\"},{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"08:59 PM\",\"to\":\"09:00 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed, Thu, Fri, Sat]\"}]}', 'null', NULL, '2021-07-30 10:32:55.000000'),
(170, 102, '{\"07-30-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:00 AM\",\"to\":\"04:00 PM\"},{\"from\":\"05:00 PM\",\"to\":\"08:30 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed, Thu, Fri, Sat]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"08:35 PM\",\"to\":\"09:30 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed, Thu, Fri, Sat]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":[{\"from\":\"08:00 AM\",\"to\":\"04:00 PM\"},{\"from\":\"05:00 PM\",\"to\":\"08:30 PM\"}],\"Mon\":[{\"from\":\"08:00 AM\",\"to\":\"04:00 PM\"},{\"from\":\"05:00 PM\",\"to\":\"08:30 PM\"}],\"Tue\":[{\"from\":\"08:00 AM\",\"to\":\"04:00 PM\"},{\"from\":\"05:00 PM\",\"to\":\"08:30 PM\"}],\"Wed\":[{\"from\":\"08:00 AM\",\"to\":\"04:00 PM\"},{\"from\":\"05:00 PM\",\"to\":\"08:30 PM\"}],\"Thu\":[{\"from\":\"08:00 AM\",\"to\":\"04:00 PM\"},{\"from\":\"05:00 PM\",\"to\":\"08:30 PM\"}],\"Fri\":[{\"from\":\"08:00 AM\",\"to\":\"04:00 PM\"},{\"from\":\"05:00 PM\",\"to\":\"08:30 PM\"}],\"Sat\":[{\"from\":\"08:00 AM\",\"to\":\"04:00 PM\"},{\"from\":\"05:00 PM\",\"to\":\"08:30 PM\"}]}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":[{\"from\":\"08:35 PM\",\"to\":\"09:30 PM\"}],\"Mon\":[{\"from\":\"08:35 PM\",\"to\":\"09:30 PM\"}],\"Tue\":[{\"from\":\"08:35 PM\",\"to\":\"09:30 PM\"}],\"Wed\":[{\"from\":\"08:35 PM\",\"to\":\"09:30 PM\"}],\"Thu\":[{\"from\":\"08:35 PM\",\"to\":\"09:30 PM\"}],\"Fri\":[{\"from\":\"08:35 PM\",\"to\":\"09:30 PM\"}],\"Sat\":[{\"from\":\"08:35 PM\",\"to\":\"09:30 PM\"}]}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"07-30-2021\",\"status\":null,\"message\":null,\"provider_id\":\"102\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:00 AM\",\"to\":\"04:00 PM\"},{\"from\":\"05:00 PM\",\"to\":\"08:30 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed, Thu, Fri, Sat]\"},{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"08:35 PM\",\"to\":\"09:30 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed, Thu, Fri, Sat]\"}]}', 'null', NULL, '2021-07-30 12:46:39.000000'),
(171, 103, '{\"07-30-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"07:45 AM\",\"to\":\"09:46 AM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"09:47 AM\",\"to\":\"11:47 AM\"}],\"repeat\":\"[]\"}}],\"07-31-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"07:55 AM\",\"to\":\"08:55 AM\"}],\"repeat\":\"[Tue, Sat]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"07:55 AM\",\"to\":\"08:55 AM\"}],\"repeat\":\"[Tue, Thu, Sat]\"}}],\"08-02-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"07:45 AM\",\"to\":\"09:46 AM\"}],\"repeat\":\"[Mon, Wed]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"09:47 AM\",\"to\":\"11:47 AM\"}],\"repeat\":\"[Mon, Wed, Fri]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":\"\",\"Mon\":[{\"from\":\"07:45 AM\",\"to\":\"09:46 AM\"}],\"Tue\":[{\"from\":\"07:55 AM\",\"to\":\"08:55 AM\"}],\"Wed\":[{\"from\":\"07:45 AM\",\"to\":\"09:46 AM\"}],\"Thu\":[{\"from\":\"07:55 AM\",\"to\":\"08:55 AM\"}],\"Fri\":[{\"from\":\"07:45 AM\",\"to\":\"09:46 AM\"}],\"Sat\":[{\"from\":\"07:55 AM\",\"to\":\"08:55 AM\"}]}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":\"\",\"Mon\":[{\"from\":\"09:47 AM\",\"to\":\"11:47 AM\"}],\"Tue\":[{\"from\":\"07:55 AM\",\"to\":\"08:55 AM\"}],\"Wed\":[{\"from\":\"09:47 AM\",\"to\":\"11:47 AM\"}],\"Thu\":[{\"from\":\"07:55 AM\",\"to\":\"08:55 AM\"}],\"Fri\":[{\"from\":\"09:47 AM\",\"to\":\"11:47 AM\"}],\"Sat\":[{\"from\":\"07:55 AM\",\"to\":\"08:55 AM\"}]}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"08-02-2021\",\"status\":null,\"message\":null,\"provider_id\":\"103\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"07:45 AM\",\"to\":\"09:46 AM\"}],\"repeat\":\"[Mon, Wed]\"},{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"09:47 AM\",\"to\":\"11:47 AM\"}],\"repeat\":\"[Mon, Wed, Fri]\"}]}', '{\"08-14-2021\":[],\"08-05-2021\":[\"person\",\"video\"]}', NULL, '2021-07-31 02:54:48.000000'),
(172, 106, '{\"08-02-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[],\"repeat\":\"[Sun, Mon, Tue, Wed, Thu, Fri, Sat]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[]}}],\"08-04-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"09:04 PM\",\"to\":\"10:04 PM\"},{\"from\":\"10:13 PM\",\"to\":\"11:06 PM\"}],\"repeat\":\"[]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":[{\"from\":\"09:04 PM\",\"to\":\"10:04 PM\"}],\"Mon\":[{\"from\":\"09:04 PM\",\"to\":\"10:04 PM\"}],\"Tue\":[{\"from\":\"09:04 PM\",\"to\":\"10:04 PM\"}],\"Wed\":[{\"from\":\"09:04 PM\",\"to\":\"10:04 PM\"}],\"Thu\":[{\"from\":\"09:04 PM\",\"to\":\"10:04 PM\"}],\"Fri\":[{\"from\":\"09:04 PM\",\"to\":\"10:04 PM\"}],\"Sat\":[{\"from\":\"09:04 PM\",\"to\":\"10:04 PM\"}]}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":\"\",\"Mon\":\"\",\"Tue\":\"\",\"Wed\":\"\",\"Thu\":\"\",\"Fri\":\"\",\"Sat\":\"\"}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"08-04-2021\",\"status\":null,\"message\":null,\"provider_id\":\"106\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"09:04 PM\",\"to\":\"10:04 PM\"},{\"from\":\"10:13 PM\",\"to\":\"11:06 PM\"}],\"repeat\":\"[]\"}]}', '{\"08-03-2021\":[\"person\"]}', NULL, '2021-08-02 16:54:39.000000'),
(173, 91, '{\"08-04-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:20 AM\",\"to\":\"10:20 AM\"},{\"from\":\"11:20 AM\",\"to\":\"01:20 PM\"},{\"from\":\"02:20 PM\",\"to\":\"04:20 PM\"}],\"repeat\":\"[Wed, Fri]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"05:18 PM\",\"to\":\"07:21 PM\"}],\"repeat\":\"[Wed]\"}}],\"08-10-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:20 AM\",\"to\":\"10:20 AM\"}],\"repeat\":\"[Tue, Sat]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"06:20 PM\",\"to\":\"07:21 PM\"}],\"repeat\":\"[Sat]\"}}],\"08-14-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:20 AM\",\"to\":\"10:20 AM\"},{\"from\":\"11:20 AM\",\"to\":\"01:20 PM\"},{\"from\":\"02:20 PM\",\"to\":\"04:20 PM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"08:20 PM\",\"to\":\"10:20 PM\"}],\"repeat\":\"[]\"}}],\"08-21-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:20 AM\",\"to\":\"10:20 AM\"},{\"from\":\"11:20 AM\",\"to\":\"01:20 PM\"},{\"from\":\"02:20 PM\",\"to\":\"04:20 PM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"08:20 PM\",\"to\":\"10:20 PM\"}],\"repeat\":\"[Sun, Sat]\"}}],\"08-03-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:20 AM\",\"to\":\"10:20 AM\"},{\"from\":\"11:20 AM\",\"to\":\"01:20 PM\"},{\"from\":\"02:20 PM\",\"to\":\"04:20 PM\"}],\"repeat\":\"[Sun, Mon, Wed, Fri, Sat]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":[{\"from\":\"08:20 AM\",\"to\":\"10:20 AM\"},{\"from\":\"11:20 AM\",\"to\":\"01:20 PM\"},{\"from\":\"02:20 PM\",\"to\":\"04:20 PM\"}],\"Mon\":[{\"from\":\"08:20 AM\",\"to\":\"10:20 AM\"},{\"from\":\"11:20 AM\",\"to\":\"01:20 PM\"},{\"from\":\"02:20 PM\",\"to\":\"04:20 PM\"}],\"Tue\":[{\"from\":\"08:20 AM\",\"to\":\"10:20 AM\"}],\"Wed\":[{\"from\":\"08:20 AM\",\"to\":\"10:20 AM\"},{\"from\":\"11:20 AM\",\"to\":\"01:20 PM\"},{\"from\":\"02:20 PM\",\"to\":\"04:20 PM\"}],\"Thu\":\"\",\"Fri\":[{\"from\":\"08:20 AM\",\"to\":\"10:20 AM\"},{\"from\":\"11:20 AM\",\"to\":\"01:20 PM\"},{\"from\":\"02:20 PM\",\"to\":\"04:20 PM\"}],\"Sat\":[{\"from\":\"08:20 AM\",\"to\":\"10:20 AM\"},{\"from\":\"11:20 AM\",\"to\":\"01:20 PM\"},{\"from\":\"02:20 PM\",\"to\":\"04:20 PM\"}]}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":[{\"from\":\"08:20 PM\",\"to\":\"10:20 PM\"}],\"Mon\":\"\",\"Tue\":\"\",\"Wed\":[{\"from\":\"05:18 PM\",\"to\":\"07:21 PM\"}],\"Thu\":\"\",\"Fri\":\"\",\"Sat\":[{\"from\":\"08:20 PM\",\"to\":\"10:20 PM\"}]}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"08-03-2021\",\"status\":null,\"message\":null,\"provider_id\":\"91\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:20 AM\",\"to\":\"10:20 AM\"},{\"from\":\"11:20 AM\",\"to\":\"01:20 PM\"},{\"from\":\"02:20 PM\",\"to\":\"04:20 PM\"}],\"repeat\":\"[Sun, Mon, Wed, Fri, Sat]\"}]}', '{\"08-21-2021\":[],\"08-15-2021\":[\"video\"]}', NULL, '2021-08-03 03:02:36.000000'),
(174, 105, '{\"08-03-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"09:02 AM\",\"to\":\"10:02 AM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[]}}],\"08-04-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"09:02 AM\",\"to\":\"10:02 AM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"03:19 PM\",\"to\":\"05:19 PM\"}],\"repeat\":\"[]\"}}],\"08-05-2021\":[{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"10:03 AM\",\"to\":\"11:03 AM\"}],\"repeat\":\"[]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":[{\"from\":\"09:02 AM\",\"to\":\"10:02 AM\"}],\"Mon\":[{\"from\":\"09:02 AM\",\"to\":\"10:02 AM\"}],\"Tue\":[{\"from\":\"09:02 AM\",\"to\":\"10:02 AM\"}],\"Wed\":[{\"from\":\"09:02 AM\",\"to\":\"10:02 AM\"}],\"Thu\":[{\"from\":\"09:02 AM\",\"to\":\"10:02 AM\"}],\"Fri\":[{\"from\":\"09:02 AM\",\"to\":\"10:02 AM\"}],\"Sat\":[{\"from\":\"09:02 AM\",\"to\":\"10:02 AM\"}]}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":\"\",\"Mon\":\"\",\"Tue\":\"\",\"Wed\":\"\",\"Thu\":\"\",\"Fri\":\"\",\"Sat\":\"\"}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"08-05-2021\",\"status\":null,\"message\":null,\"provider_id\":\"105\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"10:03 AM\",\"to\":\"11:03 AM\"}],\"repeat\":\"[]\"}]}', '{\"08-06-2021\":[\"person\"],\"08-07-2021\":[\"person\"],\"08-08-2021\":[\"person\"],\"08-09-2021\":[\"person\"]}', NULL, '2021-08-05 03:35:57.000000'),
(175, 107, '{\"08-05-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"09:25 PM\",\"to\":\"10:26 PM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[]}}],\"08-03-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"09:26 PM\",\"to\":\"10:26 PM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"11:36 PM\",\"to\":\"11:43 PM\"}],\"repeat\":\"[]\"}}],\"08-04-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"09:41 PM\",\"to\":\"09:47 PM\"}],\"repeat\":\"[]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":\"\",\"Mon\":\"\",\"Tue\":\"\",\"Wed\":\"\",\"Thu\":\"\",\"Fri\":\"\",\"Sat\":\"\"}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":\"\",\"Mon\":\"\",\"Tue\":\"\",\"Wed\":\"\",\"Thu\":\"\",\"Fri\":\"\",\"Sat\":\"\"}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"08-04-2021\",\"status\":null,\"message\":null,\"provider_id\":\"107\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"09:41 PM\",\"to\":\"09:47 PM\"}],\"repeat\":\"[]\"}]}', 'null', NULL, '2021-08-03 16:11:30.000000'),
(176, 47, '{\"08-03-2021\":[{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"09:34 PM\",\"to\":\"09:59 PM\"}],\"repeat\":\"[]\"}},{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"06:09 PM\",\"to\":\"06:11 PM\"},{\"from\":\"08:09 PM\",\"to\":\"10:11 PM\"}]}}],\"08-04-2021\":[{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"09:34 PM\",\"to\":\"11:34 PM\"}],\"repeat\":\"\"}}],\"08-16-2021\":[{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"10:30 PM\",\"to\":\"10:36 PM\"},{\"from\":\"10:36 PM\",\"to\":\"10:46 PM\"}],\"repeat\":\"[]\"}}],\"08-21-2021\":[{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"10:51 AM\",\"to\":\"02:09 PM\"},{\"from\":\"04:52 PM\",\"to\":\"07:53 PM\"}],\"repeat\":\"[]\"}}],\"08-24-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"06:09 PM\",\"to\":\"06:11 PM\"},{\"from\":\"08:09 PM\",\"to\":\"10:11 PM\"}],\"repeat\":\"[]\"}}],\"08-25-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"06:09 PM\",\"to\":\"06:11 PM\"},{\"from\":\"08:09 PM\",\"to\":\"10:11 PM\"}],\"repeat\":\"[]\"}}],\"08-28-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"05:09 PM\",\"to\":\"05:25 PM\"},{\"from\":\"08:09 PM\",\"to\":\"08:27 PM\"}],\"repeat\":\"[]\"}}],\"08-22-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"07:41 AM\",\"to\":\"10:42 AM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"12:46 PM\",\"to\":\"03:46 PM\"},{\"from\":\"05:46 PM\",\"to\":\"07:46 PM\"},{\"from\":\"08:33 PM\",\"to\":\"11:46 PM\"}],\"repeat\":\"[]\"}}],\"08-27-2021\":[{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"06:06 PM\",\"to\":\"08:06 PM\"},{\"from\":\"10:06 PM\",\"to\":\"11:07 PM\"}],\"repeat\":\"[]\"}}],\"08-29-2021\":[{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"06:08 PM\",\"to\":\"08:08 PM\"}],\"repeat\":\"[]\"}}],\"08-26-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"06:14 PM\",\"to\":\"07:14 PM\"},{\"from\":\"08:13 PM\",\"to\":\"09:14 PM\"}],\"repeat\":\"[]\"}}],\"08-23-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"06:09 PM\",\"to\":\"06:11 PM\"},{\"from\":\"08:09 PM\",\"to\":\"10:11 PM\"}],\"repeat\":\"[Mon, Tue, Wed]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"03:59 PM\",\"to\":\"04:59 PM\"},{\"from\":\"06:37 PM\",\"to\":\"07:37 PM\"}],\"repeat\":\"[]\"}}]}', '[{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":\"\",\"Mon\":\"\",\"Tue\":\"\",\"Wed\":\"\",\"Thu\":\"\",\"Fri\":\"\",\"Sat\":\"\"}}},{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":\"\",\"Mon\":[{\"from\":\"06:09 PM\",\"to\":\"06:11 PM\"},{\"from\":\"08:09 PM\",\"to\":\"10:11 PM\"}],\"Tue\":[{\"from\":\"06:09 PM\",\"to\":\"06:11 PM\"},{\"from\":\"08:09 PM\",\"to\":\"10:11 PM\"}],\"Wed\":[{\"from\":\"06:09 PM\",\"to\":\"06:11 PM\"},{\"from\":\"08:09 PM\",\"to\":\"10:11 PM\"}],\"Thu\":\"\",\"Fri\":\"\",\"Sat\":\"\"}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"08-23-2021\",\"status\":null,\"message\":null,\"provider_id\":\"47\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"06:09 PM\",\"to\":\"06:11 PM\"},{\"from\":\"08:09 PM\",\"to\":\"10:11 PM\"}],\"repeat\":\"[Mon, Tue, Wed]\"},{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"03:59 PM\",\"to\":\"04:59 PM\"},{\"from\":\"06:37 PM\",\"to\":\"07:37 PM\"}],\"repeat\":\"[]\"}]}', 'null', NULL, '2021-08-22 13:08:29.000000'),
(177, 108, '{\"08-03-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"10:31 AM\",\"to\":\"11:31 AM\"},{\"from\":\"01:31 PM\",\"to\":\"03:32 PM\"}],\"repeat\":\"[Tue, Sat]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"04:31 PM\",\"to\":\"06:32 PM\"}],\"repeat\":\"[Tue, Thu]\"}}],\"08-04-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"},{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"}],\"repeat\":\"[Wed, Fri]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"}],\"repeat\":\"[Wed, Fri]\"}}],\"08-08-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:41 AM\",\"to\":\"12:40 PM\"}],\"repeat\":\"[Sun]\"}}],\"08-09-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"},{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"10:42 AM\",\"to\":\"12:44 PM\"}],\"repeat\":\"[Mon, Thu]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":[{\"from\":\"08:41 AM\",\"to\":\"12:40 PM\"}],\"Mon\":[{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"},{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"}],\"Tue\":[{\"from\":\"10:31 AM\",\"to\":\"11:31 AM\"},{\"from\":\"01:31 PM\",\"to\":\"03:32 PM\"}],\"Wed\":[{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"},{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"}],\"Thu\":[{\"from\":\"10:31 AM\",\"to\":\"11:31 AM\"},{\"from\":\"01:31 PM\",\"to\":\"03:32 PM\"}],\"Fri\":[{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"},{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"}],\"Sat\":[{\"from\":\"10:31 AM\",\"to\":\"11:31 AM\"},{\"from\":\"01:31 PM\",\"to\":\"03:32 PM\"}]}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":\"\",\"Mon\":[{\"from\":\"10:42 AM\",\"to\":\"12:44 PM\"}],\"Tue\":[{\"from\":\"04:31 PM\",\"to\":\"06:32 PM\"}],\"Wed\":[{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"}],\"Thu\":[{\"from\":\"10:42 AM\",\"to\":\"12:44 PM\"}],\"Fri\":[{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"}],\"Sat\":\"\"}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"08-09-2021\",\"status\":null,\"message\":null,\"provider_id\":\"108\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"},{\"from\":\"08:32 AM\",\"to\":\"10:32 AM\"}],\"repeat\":\"[]\"},{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"10:42 AM\",\"to\":\"12:44 PM\"}],\"repeat\":\"[Mon, Thu]\"}]}', '{\"08-15-2021\":[\"person\"]}', NULL, '2021-08-03 17:14:06.000000'),
(178, 95, '{\"08-13-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"12:42 PM\",\"to\":\"01:43 PM\"},{\"from\":\"01:51 PM\",\"to\":\"02:52 PM\"}],\"repeat\":\"[Fri]\"}}],\"08-04-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"12:42 PM\",\"to\":\"01:43 PM\"},{\"from\":\"01:51 PM\",\"to\":\"02:52 PM\"}],\"repeat\":\"[Wed, Fri]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"03:44 PM\",\"to\":\"04:44 PM\"},{\"from\":\"05:44 PM\",\"to\":\"06:45 PM\"}],\"repeat\":\"[Tue, Thu]\"}}],\"08-07-2021\":[{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"11:46 AM\",\"to\":\"12:45 PM\"}],\"repeat\":\"[]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":\"\",\"Mon\":\"\",\"Tue\":\"\",\"Wed\":[{\"from\":\"12:42 PM\",\"to\":\"01:43 PM\"},{\"from\":\"01:51 PM\",\"to\":\"02:52 PM\"}],\"Thu\":\"\",\"Fri\":[{\"from\":\"12:42 PM\",\"to\":\"01:43 PM\"},{\"from\":\"01:51 PM\",\"to\":\"02:52 PM\"}],\"Sat\":\"\"}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":\"\",\"Mon\":\"\",\"Tue\":[{\"from\":\"03:44 PM\",\"to\":\"04:44 PM\"},{\"from\":\"05:44 PM\",\"to\":\"06:45 PM\"}],\"Wed\":\"\",\"Thu\":[{\"from\":\"03:44 PM\",\"to\":\"04:44 PM\"},{\"from\":\"05:44 PM\",\"to\":\"06:45 PM\"}],\"Fri\":\"\",\"Sat\":\"\"}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"08-07-2021\",\"status\":null,\"message\":null,\"provider_id\":\"95\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"11:46 AM\",\"to\":\"12:45 PM\"}],\"repeat\":\"[]\"}]}', '{\"08-12-2021\":[\"video\"]}', NULL, '2021-08-04 07:16:08.000000'),
(179, 112, '{\"08-19-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"04:57 PM\",\"to\":\"07:54 PM\"},{\"from\":\"03:56 PM\",\"to\":\"03:59 PM\"}],\"repeat\":\"[Sun, Mon, Tue]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[]}}],\"08-22-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"04:57 PM\",\"to\":\"07:54 PM\"},{\"from\":\"03:56 PM\",\"to\":\"03:59 PM\"},{\"from\":\"08:09 PM\",\"to\":\"11:09 PM\"}],\"repeat\":\"[]\"}}],\"08-23-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"04:57 PM\",\"to\":\"07:54 PM\"}],\"repeat\":\"[]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":[{\"from\":\"04:57 PM\",\"to\":\"07:54 PM\"},{\"from\":\"03:56 PM\",\"to\":\"03:59 PM\"}],\"Mon\":[{\"from\":\"04:57 PM\",\"to\":\"07:54 PM\"},{\"from\":\"03:56 PM\",\"to\":\"03:59 PM\"}],\"Tue\":[{\"from\":\"04:57 PM\",\"to\":\"07:54 PM\"},{\"from\":\"03:56 PM\",\"to\":\"03:59 PM\"}],\"Wed\":\"\",\"Thu\":\"\",\"Fri\":\"\",\"Sat\":\"\"}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":\"\",\"Mon\":\"\",\"Tue\":\"\",\"Wed\":\"\",\"Thu\":\"\",\"Fri\":\"\",\"Sat\":\"\"}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"08-23-2021\",\"status\":null,\"message\":null,\"provider_id\":\"112\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"04:57 PM\",\"to\":\"07:54 PM\"}],\"repeat\":\"[]\"}]}', 'null', NULL, '2021-08-22 18:34:29.000000'),
(180, 114, '{\"08-20-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"02:30 PM\",\"to\":\"03:30 PM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"11:30 AM\",\"to\":\"12:30 PM\"}],\"repeat\":\"[]\"}}],\"08-21-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"09:15 AM\",\"to\":\"11:30 AM\"}],\"repeat\":\"[]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"07:16 AM\",\"to\":\"08:17 AM\"}],\"repeat\":\"[]\"}}],\"08-23-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"02:30 PM\",\"to\":\"03:30 PM\"}],\"repeat\":\"[Mon, Fri]\"}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"11:30 AM\",\"to\":\"12:30 PM\"}],\"repeat\":\"[Mon, Fri]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":\"\",\"Mon\":[{\"from\":\"02:30 PM\",\"to\":\"03:30 PM\"}],\"Tue\":\"\",\"Wed\":\"\",\"Thu\":\"\",\"Fri\":[{\"from\":\"02:30 PM\",\"to\":\"03:30 PM\"}],\"Sat\":\"\"}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":\"\",\"Mon\":[{\"from\":\"11:30 AM\",\"to\":\"12:30 PM\"}],\"Tue\":\"\",\"Wed\":\"\",\"Thu\":\"\",\"Fri\":[{\"from\":\"11:30 AM\",\"to\":\"12:30 PM\"}],\"Sat\":\"\"}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"08-23-2021\",\"status\":null,\"message\":null,\"provider_id\":\"114\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"02:30 PM\",\"to\":\"03:30 PM\"}],\"repeat\":\"[Mon, Fri]\"},{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":[{\"from\":\"11:30 AM\",\"to\":\"12:30 PM\"}],\"repeat\":\"[Mon, Fri]\"}]}', 'null', NULL, '2021-08-20 05:52:33.000000'),
(181, 113, '{\"08-22-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"06:02 PM\",\"to\":\"06:15 PM\"}],\"repeat\":\"[Mon, Sat]\"}}],\"08-20-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"09:35 AM\",\"to\":\"09:41 AM\"}],\"repeat\":\"[Sat]\"}}],\"08-24-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"06:02 PM\",\"to\":\"06:15 PM\"}],\"repeat\":\"[Sun, Mon, Tue, Wed]\"}}],\"08-25-2021\":[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"06:02 PM\",\"to\":\"06:15 PM\"}],\"repeat\":\"[Mon, Tue, Wed]\"}}]}', '[{\"person\":{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":{\"Sun\":[{\"from\":\"06:02 PM\",\"to\":\"06:15 PM\"}],\"Mon\":[{\"from\":\"06:02 PM\",\"to\":\"06:15 PM\"}],\"Tue\":[{\"from\":\"06:02 PM\",\"to\":\"06:15 PM\"}],\"Wed\":[{\"from\":\"06:02 PM\",\"to\":\"06:15 PM\"}],\"Thu\":\"\",\"Fri\":\"\",\"Sat\":[{\"from\":\"09:35 AM\",\"to\":\"09:41 AM\"}]}}},{\"video\":{\"clinicName\":\"ab\",\"type\":\"video\",\"timing\":{\"Sun\":\"\",\"Mon\":\"\",\"Tue\":\"\",\"Wed\":\"\",\"Thu\":\"\",\"Fri\":\"\",\"Sat\":\"\"}}}]', NULL, '{\"type\":\"Independent\",\"date\":\"08-25-2021\",\"status\":null,\"message\":null,\"provider_id\":\"113\",\"data\":[{\"clinicName\":\"ab\",\"type\":\"person\",\"timing\":[{\"from\":\"06:02 PM\",\"to\":\"06:15 PM\"}],\"repeat\":\"[Mon, Tue, Wed]\"}]}', 'null', NULL, '2021-08-21 15:03:21.000000');

-- --------------------------------------------------------

--
-- Table structure for table `screens`
--

CREATE TABLE `screens` (
  `id` int NOT NULL,
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `screens`
--

INSERT INTO `screens` (`id`, `name`) VALUES
(1, 'home');

-- --------------------------------------------------------

--
-- Table structure for table `screen_ads`
--

CREATE TABLE `screen_ads` (
  `id` int NOT NULL,
  `screen_id` int NOT NULL,
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `screen_ads`
--

INSERT INTO `screen_ads` (`id`, `screen_id`, `name`, `image`) VALUES
(1, 1, 'image1', 'Hospital.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `set_schedule`
--

CREATE TABLE `set_schedule` (
  `providers_id` int NOT NULL,
  `all_data` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `set_schedule`
--

INSERT INTO `set_schedule` (`providers_id`, `all_data`, `created_at`, `updated_at`, `deleted_at`) VALUES
(28, '[{\"1\":{\"providers_id\":\"28\",\"set_schedule_check\":\"1\",\"schedule_date\":\"08-12-2021\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"2\":{\"providers_id\":\"28\",\"set_schedule_check\":\"1\",\"schedule_date\":\"13-12-2021\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"3\":{\"providers_id\":\"28\",\"set_schedule_check\":\"1\",\"schedule_date\":\"14-12-2021\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"4\":{\"providers_id\":\"28\",\"set_schedule_check\":\"1\",\"schedule_date\":\"15-12-2021\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"5\":{\"providers_id\":\"28\",\"set_schedule_check\":\"1\",\"schedule_date\":\"20-12-2021\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"6\":{\"providers_id\":\"28\",\"set_schedule_check\":\"1\",\"schedule_date\":\"21-12-2021\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"7\":{\"providers_id\":\"28\",\"set_schedule_check\":\"1\",\"schedule_date\":\"22-12-2021\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"8\":{\"providers_id\":\"28\",\"set_schedule_check\":\"1\",\"schedule_date\":\"27-12-2021\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"9\":{\"providers_id\":\"28\",\"set_schedule_check\":\"1\",\"schedule_date\":\"28-12-2021\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"10\":{\"providers_id\":\"28\",\"set_schedule_check\":\"1\",\"schedule_date\":\"29-12-2021\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"11\":{\"providers_id\":\"28\",\"set_schedule_check\":\"1\",\"schedule_date\":\"03-01-2022\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"12\":{\"providers_id\":\"28\",\"set_schedule_check\":\"1\",\"schedule_date\":\"04-01-2022\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"13\":{\"providers_id\":\"28\",\"set_schedule_check\":\"1\",\"schedule_date\":\"05-01-2022\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}}]', '2021-06-12 15:00:59', '2021-06-12 17:04:50', NULL),
(10, '[{\"1\":{\"providers_id\":\"10\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-20-2021\",\"morning_time_from\":\"08:53 AM\",\"morning_time_to\":\"10:53 AM\",\"mid_time_from\":\"11:53 AM\",\"mid_time_to\":\"04:54 PM\",\"evening_time_from\":\"08:54 PM\",\"evening_time_to\":\"01:54 AM\",\"repeat_schedule\":\"Sunday, Monday, Tuesday\"}},{\"2\":{\"providers_id\":\"10\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-27-2021\",\"morning_time_from\":\"08:53 AM\",\"morning_time_to\":\"10:53 AM\",\"mid_time_from\":\"11:53 AM\",\"mid_time_to\":\"04:54 PM\",\"evening_time_from\":\"08:54 PM\",\"evening_time_to\":\"01:54 AM\",\"repeat_schedule\":\"Sunday, Monday, Tuesday\"}},{\"3\":{\"providers_id\":\"10\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-04-2021\",\"morning_time_from\":\"08:53 AM\",\"morning_time_to\":\"10:53 AM\",\"mid_time_from\":\"11:53 AM\",\"mid_time_to\":\"04:54 PM\",\"evening_time_from\":\"08:54 PM\",\"evening_time_to\":\"01:54 AM\",\"repeat_schedule\":\"Sunday, Monday, Tuesday\"}},{\"4\":{\"providers_id\":\"10\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-11-2021\",\"morning_time_from\":\"08:53 AM\",\"morning_time_to\":\"10:53 AM\",\"mid_time_from\":\"11:53 AM\",\"mid_time_to\":\"04:54 PM\",\"evening_time_from\":\"08:54 PM\",\"evening_time_to\":\"01:54 AM\",\"repeat_schedule\":\"Sunday, Monday, Tuesday\"}},{\"5\":{\"providers_id\":\"10\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-14-2021\",\"morning_time_from\":\"08:53 AM\",\"morning_time_to\":\"10:53 AM\",\"mid_time_from\":\"11:53 AM\",\"mid_time_to\":\"04:54 PM\",\"evening_time_from\":\"08:54 PM\",\"evening_time_to\":\"01:54 AM\",\"repeat_schedule\":\"Sunday, Monday, Tuesday\"}}]', '2021-06-12 17:05:11', '2021-06-13 07:16:29', NULL),
(19, '[{\"1\":{\"providers_id\":\"19\",\"set_schedule_check\":\"1\",\"schedule_date\":\"14-12-2021\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\",Tuesday, Wednesday, , ,\"}},{\"2\":{\"providers_id\":\"19\",\"set_schedule_check\":\"1\",\"schedule_date\":\"21-12-2021\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\",Tuesday, Wednesday, , ,\"}},{\"3\":{\"providers_id\":\"19\",\"set_schedule_check\":\"1\",\"schedule_date\":\"28-12-2021\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\",Tuesday, Wednesday, , ,\"}},{\"4\":{\"providers_id\":\"19\",\"set_schedule_check\":\"1\",\"schedule_date\":\"04-01-2022\",\"morning_time_from\":\"9:55 Am\",\"morning_time_to\":\"10:50 Am\",\"mid_time_from\":\"2:00 Pm\",\"mid_time_to\":\"3:00 Pm\",\"evening_time_from\":\"5:00 Pm\",\"evening_time_to\":\"6:00 Pm\",\"repeat_schedule\":\",Tuesday, Wednesday, , ,\"}}]', '2021-06-12 17:10:04', '2021-06-12 17:10:04', NULL),
(38, '[{\"1\":{\"providers_id\":\"38\",\"set_schedule_check\":\"1\",\"schedule_date\":\"01-05-1970\",\"morning_time_from\":\"06:45 AM\",\"morning_time_to\":\"09:30 AM\",\"mid_time_from\":\"02:06 PM\",\"mid_time_to\":\"04:06 PM\",\"evening_time_from\":\"06:06 PM\",\"evening_time_to\":\"09:06 PM\",\"repeat_schedule\":\"Monday, Tuesday, Wednesday\"}},{\"2\":{\"providers_id\":\"38\",\"set_schedule_check\":\"1\",\"schedule_date\":\"01-12-1970\",\"morning_time_from\":\"06:45 AM\",\"morning_time_to\":\"09:30 AM\",\"mid_time_from\":\"02:06 PM\",\"mid_time_to\":\"04:06 PM\",\"evening_time_from\":\"06:06 PM\",\"evening_time_to\":\"09:06 PM\",\"repeat_schedule\":\"Monday, Tuesday, Wednesday\"}},{\"3\":{\"providers_id\":\"38\",\"set_schedule_check\":\"1\",\"schedule_date\":\"01-19-1970\",\"morning_time_from\":\"06:45 AM\",\"morning_time_to\":\"09:30 AM\",\"mid_time_from\":\"02:06 PM\",\"mid_time_to\":\"04:06 PM\",\"evening_time_from\":\"06:06 PM\",\"evening_time_to\":\"09:06 PM\",\"repeat_schedule\":\"Monday, Tuesday, Wednesday\"}},{\"4\":{\"providers_id\":\"38\",\"set_schedule_check\":\"1\",\"schedule_date\":\"01-26-1970\",\"morning_time_from\":\"06:45 AM\",\"morning_time_to\":\"09:30 AM\",\"mid_time_from\":\"02:06 PM\",\"mid_time_to\":\"04:06 PM\",\"evening_time_from\":\"06:06 PM\",\"evening_time_to\":\"09:06 PM\",\"repeat_schedule\":\"Monday, Tuesday, Wednesday\"}}]', '2021-06-13 08:37:04', '2021-06-13 08:37:04', NULL),
(35, '[{\"1\":{\"providers_id\":\"35\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-20-2021\",\"morning_time_from\":\"7:15 AM\",\"morning_time_to\":\"9:15 AM\",\"mid_time_from\":null,\"mid_time_to\":null,\"evening_time_from\":\"6:16 PM\",\"evening_time_to\":\"10:16 PM\",\"repeat_schedule\":\"Tuesday\"}},{\"2\":{\"providers_id\":\"35\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-27-2021\",\"morning_time_from\":\"7:15 AM\",\"morning_time_to\":\"9:15 AM\",\"mid_time_from\":null,\"mid_time_to\":null,\"evening_time_from\":\"6:16 PM\",\"evening_time_to\":\"10:16 PM\",\"repeat_schedule\":\"Tuesday\"}},{\"3\":{\"providers_id\":\"35\",\"set_schedule_check\":\"1\",\"schedule_date\":\"08-03-2021\",\"morning_time_from\":\"7:15 AM\",\"morning_time_to\":\"9:15 AM\",\"mid_time_from\":null,\"mid_time_to\":null,\"evening_time_from\":\"6:16 PM\",\"evening_time_to\":\"10:16 PM\",\"repeat_schedule\":\"Tuesday\"}},{\"4\":{\"providers_id\":\"35\",\"set_schedule_check\":\"1\",\"schedule_date\":\"08-10-2021\",\"morning_time_from\":\"7:15 AM\",\"morning_time_to\":\"9:15 AM\",\"mid_time_from\":null,\"mid_time_to\":null,\"evening_time_from\":\"6:16 PM\",\"evening_time_to\":\"10:16 PM\",\"repeat_schedule\":\"Tuesday\"}},{\"5\":{\"providers_id\":\"35\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-15-2021\",\"morning_time_from\":\"7:15 AM\",\"morning_time_to\":\"9:15 AM\",\"mid_time_from\":null,\"mid_time_to\":null,\"evening_time_from\":\"6:16 PM\",\"evening_time_to\":\"10:16 PM\",\"repeat_schedule\":\"Tuesday\"}}]', '2021-06-13 10:24:33', '2021-06-13 10:24:33', NULL),
(39, '{\"2\":{\"3\":{\"providers_id\":\"39\",\"set_schedule_check\":\"2\",\"schedule_date\":\"06-28-2021\",\"morning_time_from\":\"07:30 AM\",\"morning_time_to\":\"09:11 AM\",\"mid_time_from\":\"01:11 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday\"}},\"4\":{\"5\":{\"providers_id\":\"39\",\"set_schedule_check\":\"2\",\"schedule_date\":\"07-12-2021\",\"morning_time_from\":\"07:30 AM\",\"morning_time_to\":\"09:11 AM\",\"mid_time_from\":\"01:11 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday\"}},\"5\":{\"6\":{\"providers_id\":\"39\",\"set_schedule_check\":\"2\",\"schedule_date\":\"06-13-2021\",\"morning_time_from\":\"07:30 AM\",\"morning_time_to\":\"09:11 AM\",\"mid_time_from\":\"01:11 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday\"}}}', '2021-06-13 14:41:59', '2021-06-13 14:41:59', NULL),
(40, '[{\"1\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-14-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"2\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-15-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"3\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-16-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"4\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-21-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"5\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-22-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"6\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-23-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"7\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-28-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"8\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-29-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"9\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-30-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"10\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-05-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"11\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-06-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"12\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-07-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"13\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-12-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"14\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-13-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"15\":{\"providers_id\":\"40\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-14-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}}]', '2021-06-13 18:53:37', '2021-06-13 18:53:37', NULL),
(41, '[{\"1\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-14-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"2\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-15-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"3\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-16-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"4\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-21-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"5\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-22-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"6\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-23-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"7\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-28-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"8\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-29-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"9\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"06-30-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"10\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-05-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"11\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-06-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"12\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-07-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"13\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-12-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"14\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-13-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}},{\"15\":{\"providers_id\":\"41\",\"set_schedule_check\":\"1\",\"schedule_date\":\"07-14-2021\",\"morning_time_from\":\"07:40 AM\",\"morning_time_to\":\"09:47 AM\",\"mid_time_from\":\"01:47 PM\",\"mid_time_to\":\"03:11 PM\",\"evening_time_from\":\"07:11 PM\",\"evening_time_to\":\"10:11 PM\",\"repeat_schedule\":\"Monday,Tuesday,Wednesday\"}}]', '2021-06-14 05:08:57', '2021-06-14 05:08:57', NULL),
(43, '', '2021-06-14 07:28:28', '2021-06-14 07:28:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int NOT NULL,
  `country_id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orignal_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_admin` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_active` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1-deactive, 2-active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `first_name`, `last_name`, `name`, `email`, `email_verified_at`, `password`, `orignal_password`, `phone_no`, `age`, `gender`, `country`, `state`, `city`, `zip`, `otp`, `language`, `address`, `image`, `is_admin`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `is_active`) VALUES
(2, NULL, 'Sim', 'Admin', 'Sim Admin', 'admin@gmail.com', NULL, '$2y$10$ZF3N77CatYle.WHEYUae1u79eL/JbYDrt3XN9XikwbuhrfT2y4pcW', '12345678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3412 SECTOR 46 C', '', NULL, 'HoiPrE314YcRaPdsQeBMv1uksj6wsrWVKg73dNmoWDGiQgJXlA5J8H0T4myX', '2020-08-04 01:38:39', '2021-04-01 19:13:35', NULL, '2'),
(7, '17', 'Tarun', 'Employee', 'Tarun Employee', 'employee@gmail.com', NULL, '$2y$10$6MsEBA2QMxRCP04229h2pOghEkmyHQVZD5Mv93JvGyNSqq/baXzvu', '12345678', '9092599927', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11175 TESOTA LOOP STREET', '1600514318.jpeg', 1, NULL, '2020-08-09 23:09:42', '2020-11-16 11:53:43', NULL, '2'),
(17, '2', 'Tarun', 'Manager', 'Tarun Manager', 'manager@gmail.com', NULL, '$2y$10$6MsEBA2QMxRCP04229h2pOghEkmyHQVZD5Mv93JvGyNSqq/baXzvu', '12345678', '68793836', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3412 SECTOR 46 C', '', 2, 'WoMYVoAr5fznqY3c5BTfEKucFDPPb19sO20gi0eorfuia5NECTi9ibDaCaDb', '2020-09-04 06:21:48', '2021-01-21 11:15:18', NULL, '2'),
(18, '2', 'Pradeep', 'Joam', 'Pradeep Joam', 'nonstop1420@gmail.com', NULL, '$2y$10$ic7EndzmW2AXUjvYV5L6q.bBAMQDQjyRDc2RfiQXwiqmeJCEhyCUi', '68793836', '9092599926', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11175 TESOTA LOOP STREET', '', 2, NULL, '2020-09-21 03:24:52', '2021-01-21 11:15:23', NULL, '2'),
(19, '17', 'WARD', 'NO.2', 'WARD NO.2', 'NITIN_TAUROUS@YAHOO.COM', NULL, '$2y$10$I8avsrsIiFkZac46A6Uh.eSLAdmzNRi0QUT4HpY.sBnL7fUF.Mho2', '10012254', '09855213737', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HIRA MAHAL COLONY', '', 1, NULL, '2020-09-30 01:54:52', '2020-11-16 11:50:17', NULL, '2'),
(20, '17', 'Rahul', 'singla', 'Rahul singla', 'nitin_tarous@yahoo.com', NULL, '$2y$10$rU9WuBOCS6cnpg77M.X5lO2BKdFntaXzi8eisJrRiVCXirTHmyJtW', '15348657', '9888434314', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Nabha', '', 1, NULL, '2020-09-30 01:55:10', '2020-10-07 06:34:10', '2020-10-07 06:34:10', '2'),
(21, '2', 'Sachin', 'Shope', 'Sachin Shope', 'sachin@gmail.com', NULL, '$2y$10$fzp07uAZFXw2twwET4Pv4.xNmTDdEh6KCRarn4RzabHGiChDJ/bqm', '46712115', '08168295841', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3412 SECTOR 46 C', '', 2, NULL, '2020-10-05 03:54:35', '2021-01-21 11:15:27', NULL, '2'),
(22, '17', 'Tarun', 'Malhotra', 'Tarun Malhotra', 't1@gmail.com', NULL, '$2y$10$sP0u9Vd9TOLTjDs5bXJIfevLFuk0sW9bfV/cYg6A1v.pBIxZL.OoO', '52077902', '09950495686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAMDWARE KE SAMANE KALIBERI', '', 1, NULL, '2020-10-07 06:30:01', '2020-10-07 06:34:13', '2020-10-07 06:34:13', '2'),
(23, '2', 'Tarun', 'Malhotra', 'Tarun Malhotra', 't2@gmail.com', NULL, '$2y$10$/KSkcl6YvIx4eVo7XsYXNObReGMRYbtfZXR61I0J.1r/pgXdkVUQy', '75296483', '099504956862', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAMDWARE KE SAMANE KALIBERI', '', 2, NULL, '2020-10-07 06:58:23', '2020-10-07 08:20:00', '2020-10-07 08:20:00', '2'),
(24, '2', 'Sachin', 'Shope', 'Sachin Shope', 't44@gmail.com', NULL, '$2y$10$h9RpXvsBCY56gg.38iLv5exY6QAQ4DtczDil3YEjkWhtcvspwEA26', '92179536', '08168295844', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3412 SECTOR 46 C', '', 1, NULL, '2020-10-07 08:20:21', '2020-10-07 08:21:12', '2020-10-07 08:21:12', '2'),
(25, '2', 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tt23@gmail.com', NULL, '$2y$10$njO8M35luTqn8FbAYx52HuEPyhSktgMr3wg2fh2uCnUx6nBk9/UYm', '35756722', '09950495687', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAMDWARE KE SAMANE KALIBERI', '', 1, NULL, '2020-10-07 08:21:39', '2020-11-06 16:10:34', NULL, '2'),
(26, '2', 'Test', 'Manager', 'Test Manager', 'test@manager.com', NULL, '$2y$10$E3bHLsyOAZ0lww3YASRP9e1IbVWO.RUs1qsVG.DitkpeuX1s/XKem', '68754090', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123 test area', '', 2, NULL, '2020-10-19 00:50:23', '2020-11-05 23:40:04', '2020-11-05 23:40:04', '2'),
(27, '2', 'Peter', 'Thomas', 'Peter Thomas', 'peter.thomas@sophicservices.com', NULL, '$2y$10$NmlduUQHieMAomTsh.FjXuXQvfD/qp.JOFqkzAufhiSA4/g/zJEDK', '18987468', '2817834384', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'USA', '', 2, 'qu6S4vKwOqM4Tftgec48E8WuW0xgkHLvDfsdTzWK6xrtWpjUPmGNeUVLhfuD', '2020-10-26 21:41:57', '2020-11-05 03:29:01', '2020-11-05 03:29:01', '2'),
(29, '2', 'Manange', 'Managw', 'Manange Managw', 'ARUNKUMAR632AK@GMAIL.COM', NULL, '$2y$10$plAn8.IqSvIaVSrft6cmpOnQtkBR7X.Z0rV6umZOJBnTAarUe/0Ze', '17994266', '7883838', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KIRTI NAGAR', '', 2, NULL, '2020-10-29 13:32:57', '2020-10-29 13:33:10', '2020-10-29 13:33:10', '2'),
(30, '2', 'Tim', 'Paul', 'Tim Paul', 'tim@gmail.com', NULL, '$2y$10$y8aHaK.kQLJVJluyrDukt.WfeO3B4JXyug2SWMYWl3wWwDmLQWsea', '57748559', '7009833033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Street Wall', '', 2, NULL, '2020-10-29 13:35:43', '2021-01-21 11:15:32', NULL, '2'),
(31, '2', 'Tim', 'Joy', 'Tim Joy', 'billy@gmail.com', NULL, '$2y$10$bvH6i9WB4N3vgBfKjdjZ.eOSfWnN6dm22e3ylcqF9e/0/QrDrUESq', '95632479', '898989899', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Eastern street', '', 2, NULL, '2020-10-29 15:04:43', '2021-01-21 11:15:37', NULL, '2'),
(32, '2', 'Sophic', 'Manager', 'Sophic Manager', 'sim.bawa@sophicservices.com', NULL, '$2y$10$N1v1H8tXw4qZogenA/NR1ezx4z1Gw/RhYZTMou3tzbS1fi8BlJlO.', '69731713', '6478772831', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Canada', '1604530110.png', 2, 'ExYaeLT1hF8GuBs1fq0EV5zDm5E8I0W0jCd8ajjJjK62yxEkj3oAcWwepTc4', '2020-11-05 03:30:56', '2021-01-21 11:15:42', NULL, '2'),
(33, '2', 'test', 'test', 'test test', 'singh@gmail.com', NULL, '$2y$10$p0I1l/qDHvuN9K5kQPUSwOhzYtXiKE3wu8Hl9OnGqHB6R9n2mTfmW', '88066493', '6479776002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Canada', '', 1, NULL, '2020-11-05 03:31:55', '2020-11-11 07:29:05', NULL, '2'),
(34, '32', 'Barru', 'Collins', 'Barru Collins', 'barru.collins@sophicservices.com', NULL, '$2y$10$QY7VJ6vRbzUkrHzQBC8d3.98S1KtnC4v5xho6uz6E0fS6K.75e.fm', '15590963', '7508289077', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'india', '', 1, NULL, '2020-11-05 03:44:25', '2020-11-05 03:44:25', NULL, '2'),
(46, '32', 'Kevin', 'Daniels', 'Kevin Daniels', 'kevin.daniels@sophicservices.com', NULL, '$2y$10$w09bnT4BRjVlY/BkJ32vve36q2nk5U1TgF46nvwZ3/QXNrh0UFLZa', '70708971', '1234567895', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', '', 1, 'zFHPG8PTIdHkvRMbNPWiJSIlQYsAsh9cxRdoIIwl4Io9ltEohy5BkzmbYoXU', '2020-11-05 23:41:47', '2020-11-05 23:41:47', NULL, '2'),
(47, '32', 'Ethan', 'Morris', 'Ethan Morris', 'ethan.morris@sophicservices.com', NULL, '$2y$10$LOQiq6xlOED7.SL8wLRnfe46UIX.AD88ZU6WdOr1vOgwbUUtMHNsW', '82266380', '1234565789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', '', 1, 'Wo7gaXuaMnuvCKTAqmC6ZFgigYsAUfpBkkUwawXxvJX1ZEe4KDgtdQJLVlN5', '2020-11-05 23:42:24', '2020-11-05 23:42:24', NULL, '2'),
(48, '32', 'Steve', 'Singh', 'Steve Singh', 'steve.singh@sophicservices.com', NULL, '$2y$10$3zRaWMwJecUjUqajcTWpMegvRDT5f7bC3kjMh1mKr/avE09NY5gUO', '35869138', '1234567893', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', '', 1, 'D0M708pHFKYb9mXLCWSvd9kYjclW0iQC7TtSFE0ClzXw5XSAHMF315yOv537', '2020-11-05 23:43:00', '2020-11-11 07:30:40', NULL, '2'),
(49, '32', 'Brad', 'Johnson', 'Brad Johnson', 'brad.johnson@sophicservices.com', NULL, '$2y$10$F3.qt08/5jsWq7gMMwY5U.SD2P9vZSdYASC5sLx1AGgEQIjEk7J..', '21374282', '1234567853', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', '', 1, 'usc1vgma5ZV5H4vPEQ0Sqg67SbsqR487Mi2ePovEzbyh5sszmPhStTddyMGI', '2020-11-05 23:44:34', '2020-11-05 23:44:34', NULL, '2'),
(50, '17', 'Tarun112', 'Malhotra12', 'Tarun112 Malhotra12', 't111@gmail.com2', NULL, '$2y$10$G6qjypDMRrF2Te6bHC8aN.CNTR3cQYgSJe4oxpg0GELYWuGYgLOky', '62416724', '+9199511049568612', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAMDWARE KE SAMANE KALIBERI112', '', 1, NULL, '2020-11-06 16:57:01', '2020-11-06 16:57:32', '2020-11-06 16:57:32', '2'),
(51, '2', 'Tarun34', 'Malhotra34', 'Tarun34 Malhotra34', 't34@gmail.com', NULL, '$2y$10$zfhaalKmaoKje0gVEq.4P.xw7zYPxF.73bFNJeApLEyfkQsJVJNXG', '25435839', '+9199335049344', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAMDWARE KE SAMANE KALIBERI34', '', 1, NULL, '2020-11-06 16:58:21', '2020-11-06 16:58:57', '2020-11-06 16:58:57', '2'),
(52, '17', 'Tarun', 'Malhotra', 'Tarun Malhotra', 't@gmail.com', NULL, '$2y$10$XYAoc0VImbpzK/vx/NvYOuzfv7nKwTZqxQb4C9KdPtmfRQpGG9Evq', '90089883', '+919950495686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAMDWARE KE SAMANE KALIBERI', '', 1, NULL, '2020-11-10 09:27:52', '2020-11-16 11:50:17', NULL, '2'),
(54, '2', 'Tarun', 'Employee', 'Tarun Employee', 'employee@gmail.com', NULL, '$2y$10$23ilEsZSvn5TvXhwUUo9cubAkzdJ85hgGiseGlpVRocMGOPq5Pt4e', '15831268', '+9199502495686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAMDWARE KE', '', 1, NULL, '2020-11-16 10:52:44', '2020-11-16 10:56:49', '2020-11-16 10:56:49', '2'),
(55, '2', 'Tarun', 'Employee', 'Tarun Employee', 'employee@gmail.com', NULL, '$2y$10$1H5tOpl/K14qsJr5IpyqAe9XDeLmnDo1.8XB21/dDJmVsRNTCt2QG', '87500348', '+91995602495686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAMDWARE KE', '', 1, NULL, '2020-11-16 10:56:54', '2020-11-16 10:58:00', '2020-11-16 10:58:00', '2'),
(56, '2', 'Tarun', 'Employee', 'Tarun Employee', 'employee@gmail.com', NULL, '$2y$10$/GYln9VGQH4AChq7SNLR0O/caiN5r/2AhsW8GhAi/GlGyqdzFgHOG', '84698307', '+919956502495686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAMDWARE KE', '', 1, NULL, '2020-11-16 10:58:07', '2020-11-16 11:24:14', '2020-11-16 11:24:14', '2'),
(57, '17', 'Tarun', 'Malhotra', 'Tarun Malhotra', 'employee@gmail.com', NULL, '$2y$10$UqIUBuMgYDkshZpfobCyP.jHp6G62PueKVWs2j5kgtM5y10xVb/Qq', '79614846', '+9199250495686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAMDWARE KE SAMANE KALIBERI', '', 1, NULL, '2020-11-16 11:27:52', '2020-11-16 11:32:39', '2020-11-16 11:32:39', '2'),
(58, '17', 'Tarun', 'Malhotra', 'Tarun Malhotra', 'employee@gmail.com', NULL, '$2y$10$3y94FNZM5bkPEE6h7ANqwerIfB/Scj2EvofYClwhIERLpUpQaEUy2', '46741002', '+9199250495686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAMDWARE KE SAMANE KALIBERI', '', 1, NULL, '2020-11-16 11:32:48', '2020-11-16 11:33:12', '2020-11-16 11:33:12', '2'),
(59, '2', 'Tarun', 'Malhotra', 'Tarun Malhotra', 'employee@gmail.com', NULL, '$2y$10$cdKgKeqgpjfG8QKiEJjAYeL4Bpz0vUT6Cn7kEbyvk/col0rRiuJ.e', '79597143', '+9199510495686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAMDWARE', '', 1, NULL, '2020-11-16 11:34:56', '2020-11-16 11:35:19', '2020-11-16 11:35:19', '2'),
(60, '32', 'Peter', 'Thomas', 'Peter Thomas', 'peter.thomas@sophicservices.com', NULL, '$2y$10$xnWHnGximMOUBF7sc7bzsuVspZtYD.uqu34ZtanvhshTXg2awlrcG', '95831399', '1235467892', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', '', 1, 'av8UNdrfuJ4kvOQpAOTySo7eJxkFqLIBVj6ZqATEhtwRXe860dfp2tx8ptRK', '2020-11-16 23:17:52', '2020-11-16 23:17:52', NULL, '2'),
(61, '2', 'Becky', 'Riley', 'Becky Riley', 'becky@paradigmpromotion.com', NULL, '$2y$10$6P9imWpk/nXesHkAsXmPFOioQNRN14eW99Huwg7h/bXP6A3l15lvq', '87053413', '6146202325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'USA', '1610988121.jpeg', 2, NULL, '2021-01-18 21:37:20', '2021-01-21 11:15:47', NULL, '2'),
(62, '2', 'DEMO', 'demo', 'demo demo', 'demo@demo.com', NULL, '$2y$10$6BozLaBppnMjh/Q.RXDOOOY60uv6ct6qBGmTajrQEneYSNI4h.jsy', '22358546', '9876543210', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'demo', '', 2, NULL, '2021-01-20 15:37:50', '2021-01-21 12:51:34', NULL, '1'),
(63, '2', 'demo1`', 'demo1', 'demo1` demo1', 'demo1@demo.com', NULL, '$2y$10$9ZAvYHb1YT3X.hWXxZRiZunOCEw5OiTqZsHTS7isUeT1kSCGgGz4a', '73169749', '9854621307', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'askldjh', '', 2, NULL, '2021-01-20 18:01:38', '2021-01-21 09:01:30', '2021-01-21 09:01:30', '2'),
(64, '2', 'Aaron', 'Dinar', 'Aaron Dinar', 'aaron@prestigepromotions.ca', NULL, '$2y$10$Dy4h.Gd/OqEl4UQRI0rzUeNs2yRpOSNEZs5tcZosAwnYB176XGoia', '96100632', '6474041425', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Canada', '1611171260.png', 2, NULL, '2021-01-21 00:27:35', '2021-01-21 11:15:58', NULL, '2'),
(65, '2', 'dummy', 'test', 'dummy test', 'dummy@gmail.com', NULL, '$2y$10$LyBphm4LznYwVsRQzkECIurDrbcrMhNpvmaHda2oJV7z4H3hbMVNi', '67832732', '7546986432', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asd', '', 2, NULL, '2021-01-21 11:46:48', '2021-01-28 23:04:55', NULL, '1'),
(66, '2', 'David', 'Winternheimer', 'David Winternheimer', 'davidw@pacificstarlabs.com', NULL, '$2y$10$b6DO1dT/uOwazVnerHfvkOzQdVX/0Pxu/39aXG/DAGVjzQGad8SKi', '69662867', '3105382094', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'United States', '1613078885.png', 2, 'f6tP9DvFdVSKP3dljlXdaI00hIBUnGZeGUqLBeTFSGNHvlLasRxDqwhAhD1Q', '2021-02-12 02:25:42', '2021-02-12 02:28:05', NULL, '2'),
(67, '2', 'Amritpreet', 'Singh', 'Amritpreet Singh', 'fortech.amritpreet@gmail.com', NULL, '$2y$10$5A5l8TR0VR6pDvcKflB5l.H96ygxQkpKRhLlgxQ6P5T7bpMVODnRu', '12345678', '9876543215', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mohali', '', 2, '2zJuNu3pUDc55R55lDZUZHPVC8QSpdtlT10cPecffKwGA7xMt9ipDobknyFg', '2021-02-24 11:58:26', '2021-02-24 17:45:06', NULL, '2'),
(68, '2', 'Martin', 'Martin', 'Martin Martin', 'info@happease.me', NULL, '$2y$10$Xff1GgdDdo1f5wn3nzKiLeQLAT50qAeH4U9tlMohk9puxVbbxV30e', '58112718', '420776161927', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Amsterdam, The Netherlands', '1616008023.svg', 2, 'QdWrTasuRFp4Uwj6jOwLyqkTRO71ukLPGJ5LcxSREmeDbsRciuQxdsJd9Mh9', '2021-03-17 23:03:37', '2021-03-17 23:07:03', NULL, '2'),
(69, '32', 'Tom', 'Duncan', 'Tom Duncan', 'tom.duncan@sophicservices.com', NULL, '$2y$10$tBxinqEmziEVVNdFgDe0C.DlJPN/8voGIFVKsUhWmbunGVNOks37y', '18871009', '017245617860', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'India', '', 1, NULL, '2021-05-03 18:12:52', '2021-05-03 18:12:52', NULL, '1'),
(70, NULL, NULL, NULL, NULL, 'tarun@gmail.com', NULL, '12345678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2021-07-11 06:19:27', '2021-07-11 06:19:27', NULL, '1'),
(71, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun1@gmail.com', NULL, NULL, NULL, '8168295841', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', NULL, NULL, NULL, '', NULL, NULL, '2021-07-11 11:27:47', '2021-07-11 11:27:47', NULL, '1'),
(72, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun1@gmail.com', NULL, NULL, NULL, '8168295841', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', NULL, NULL, NULL, '', NULL, NULL, '2021-07-11 11:29:09', '2021-07-11 11:29:09', NULL, '1'),
(73, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun1@gmail.com', NULL, NULL, NULL, '8168295841', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', NULL, NULL, NULL, '', 1, NULL, '2021-07-11 11:29:52', '2021-07-11 11:29:52', NULL, '1'),
(74, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun1@gmail.com', NULL, '$2y$10$jOgfL/228QzhuMiY7wLKceSLbbZvz/DsyoCrypG0wycFnF7zAV1K.', NULL, '8168295841', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', NULL, NULL, NULL, '', 1, NULL, '2021-07-11 11:31:06', '2021-07-17 23:21:13', '2021-07-17 23:21:13', '1'),
(75, '75', 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun6@gmail.com', NULL, '$2y$10$VPr15NX74.nqjSuELr6U0OUQrLqI4T6GdzJ2bpPKbS00OYvFBif3.', '12345678', '8168295846', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', '3818', 'English', NULL, '1626583791.jpg', 1, NULL, '2021-07-11 11:33:29', '2021-07-17 23:20:15', NULL, '2'),
(76, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun2@gmail.com', NULL, '$2y$10$kbAF21gRkH0z4s3kMbzZyeykmjKTK95WxSyYwnmiFfBH7mmsYVOfG', '12345678', '8168295841', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', NULL, NULL, NULL, '', 1, NULL, '2021-07-11 11:38:01', '2021-07-11 11:38:01', NULL, '2'),
(77, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun3@gmail.com', NULL, '$2y$10$44wkPIFe98xxRX5sKZD8SeHCiVhKLJDLXdO0V5MATqXdxn4XI7XXy', '12345678', '8168295841', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', NULL, NULL, NULL, '', 1, NULL, '2021-07-11 11:39:35', '2021-07-11 11:39:35', NULL, '2'),
(78, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun4@gmail.com', NULL, '$2y$10$i.PErC13jGyqq5nq.MsUxOEOz2BQ1fNLDQWpn81SZhbRBwj2V/T1K', '12345678', '8168295842', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', NULL, NULL, NULL, '', 1, NULL, '2021-07-11 11:40:08', '2021-07-11 11:40:08', NULL, '2'),
(79, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun5@gmail.com', NULL, '$2y$10$inM2EcSN4q6iqcXZPDk3e.yJYLa1pRrjAAfSIBgCL5jq3x30quNC.', '12345678', '8168295845', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', NULL, NULL, NULL, '', 1, NULL, '2021-07-11 11:48:07', '2021-07-11 11:48:07', NULL, '2'),
(80, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun6@gmail.com', NULL, '$2y$10$AO.rJO5ksjLlLC0JLE0aQ..Z.2WPMS.qTsYrEfmdd0BIB58r9WSWC', '12345678', '8168295846', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', '3552', NULL, NULL, '', 1, NULL, '2021-07-11 12:41:56', '2021-07-17 23:19:15', NULL, '2'),
(81, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun7@gmail.com', NULL, '$2y$10$QPYJ2T55jxkIkSNu3zjBa.mvFMfgwI37OIekL0qgK1/cNQp/luzt6', '12345678', '8168295847', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', '9039', NULL, NULL, '', 1, NULL, '2021-07-11 14:27:50', '2021-07-11 15:28:30', '2021-07-11 15:28:30', '1'),
(82, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun7@gmail.com', NULL, '$2y$10$XhoUoy/FfewntLyVGJ2B3u18gXSra.0RtmI1J6QQ4klxj1CWAhM4a', '777279', '8168295847', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', '6988', NULL, NULL, '', 1, NULL, '2021-07-11 15:29:55', '2021-07-17 23:22:14', NULL, '1'),
(83, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun8@gmail.com', NULL, '$2y$10$PcAOB9j6aw/TyIJLonoNdu.J5wq.lPvptChJh718/jztn2lJBsjp.', '12345678', '8168295848', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', '2857', NULL, NULL, '', 1, NULL, '2021-07-12 14:17:29', '2021-07-12 14:17:29', NULL, '1'),
(84, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun21@gmail.com', NULL, '$2y$10$na66bdNXwUA8dxBw1n/ckusk6TkML80o5SYFMAVQxUKG5Z.GJ2C0W', '12345678', '816829584121', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', '5908', NULL, NULL, '1626583555.jpg', 1, NULL, '2021-07-17 23:15:55', '2021-07-17 23:15:55', NULL, '1'),
(85, NULL, 'Tarun', 'Malhotra', 'Tarun Malhotra', 'tarun22@gmail.com', NULL, '$2y$10$GByTWr3MCfoJdO1amxCd1exVe.xgRvXda9ONfulesoLnmpB22ezmy', '12345678', '8168295', '25', 'Female', 'India', 'Punjab', 'Mohali', '160059', '4347', NULL, NULL, 'default.png', 1, NULL, '2021-08-30 22:16:04', '2021-08-30 22:16:04', NULL, '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_support`
--
ALTER TABLE `customer_support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_support_image`
--
ALTER TABLE `customer_support_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hello_clinics`
--
ALTER TABLE `hello_clinics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hello_users`
--
ALTER TABLE `hello_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_screen_ads`
--
ALTER TABLE `patient_screen_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_details`
--
ALTER TABLE `provider_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_images`
--
ALTER TABLE `provider_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_sheduals`
--
ALTER TABLE `provider_sheduals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `screens`
--
ALTER TABLE `screens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `screen_ads`
--
ALTER TABLE `screen_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_support`
--
ALTER TABLE `customer_support`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `customer_support_image`
--
ALTER TABLE `customer_support_image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `hello_clinics`
--
ALTER TABLE `hello_clinics`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `hello_users`
--
ALTER TABLE `hello_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient_screen_ads`
--
ALTER TABLE `patient_screen_ads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `provider_details`
--
ALTER TABLE `provider_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `provider_images`
--
ALTER TABLE `provider_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `provider_sheduals`
--
ALTER TABLE `provider_sheduals`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `screens`
--
ALTER TABLE `screens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `screen_ads`
--
ALTER TABLE `screen_ads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `screen_ads`
--
ALTER TABLE `screen_ads`
  ADD CONSTRAINT `screen_ads_ibfk_1` FOREIGN KEY (`screen_id`) REFERENCES `screens` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
