-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 16, 2021 at 07:54 AM
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
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` int NOT NULL,
  `entity_id` int NOT NULL,
  `day` varchar(256) NOT NULL,
  `open` varchar(256) NOT NULL,
  `close` varchar(256) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`id`, `entity_id`, `day`, `open`, `close`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'Sunday', '09:00', '17:12', NULL, NULL, NULL),
(2, 3, 'Monday', '10:00', '17:15', NULL, NULL, NULL),
(3, 3, 'Tuesday', '06:00', '16:15', NULL, NULL, NULL),
(4, 3, 'Wednesday', '15:15', '18:15', NULL, NULL, NULL),
(8, 1, 'Sunday', '11:21', '17:27', NULL, NULL, NULL),
(9, 1, 'Monday', '09:00', '20:00', NULL, NULL, NULL),
(12, 2, 'Thursday', '16:29', '18:30', NULL, NULL, NULL),
(13, 2, 'Friday', '09:01', '16:30', NULL, NULL, NULL),
(14, 2, 'Saturday', '09:30', '17:30', NULL, NULL, NULL),
(15, 1, 'Tuesday', '11:30', '21:30', NULL, NULL, NULL),
(16, 1, 'Wednesday', '11:30', '17:20', NULL, NULL, NULL),
(19, 1, 'Thursday', '11:30', '17:20', NULL, NULL, NULL),
(20, 1, 'Friday', '11:30', '17:20', NULL, NULL, NULL),
(21, 1, 'Saturday', '11:30', '17:20', NULL, NULL, NULL),
(22, 2, 'Monday', '11:30', '17:20', NULL, NULL, NULL),
(23, 2, 'Tuesday', '11:30', '17:20', NULL, NULL, NULL),
(24, 2, 'Wednesday', '11:30', '17:20', NULL, NULL, NULL),
(25, 3, 'Thrusday', '11:30', '17:20', NULL, NULL, NULL),
(26, 3, 'Friday', '11:30', '17:20', NULL, NULL, NULL),
(27, 3, 'Saturday', '11:30', '17:20', NULL, NULL, NULL),
(28, 2, 'Sunday', '11:00', '16:00', NULL, NULL, NULL),
(29, 34, 'Sunday', '08:00', '22:00', NULL, NULL, NULL),
(30, 34, 'Monday', '07:00', '11:00', NULL, NULL, NULL),
(31, 34, 'Tuesday', '09:00', '19:00', NULL, NULL, NULL),
(32, 34, 'Wednesday', '10:00', '17:00', NULL, NULL, NULL),
(33, 34, 'Thursday', '04:00', '19:00', NULL, NULL, NULL),
(34, 34, 'Friday', '05:00', '18:00', NULL, NULL, NULL),
(35, 34, 'Saturday', '08:00', '22:00', NULL, NULL, NULL),
(45, 36, 'Sunday', '09:00', '10:00', NULL, NULL, NULL),
(46, 36, 'Monday', '12:00', '13:00', NULL, NULL, NULL),
(47, 36, 'Tuesday', '14:00', '15:00', NULL, NULL, NULL),
(48, 36, 'Wednesday', '16:00', '17:00', NULL, NULL, NULL),
(49, 36, 'Thursday', '18:00', '19:00', NULL, NULL, NULL),
(50, 36, 'Friday', '09:00', '12:00', NULL, NULL, NULL),
(51, 36, 'Saturday', '10:00', '13:00', NULL, NULL, NULL),
(52, 35, 'Sunday', '09:00', '18:00', NULL, NULL, NULL),
(53, 35, 'Monday', '09:00', '18:00', NULL, NULL, NULL),
(54, 35, 'Tuesday', '09:00', '18:00', NULL, NULL, NULL),
(55, 35, 'Wednesday', '09:00', '18:00', NULL, NULL, NULL),
(56, 35, 'Thursday', '09:00', '18:00', NULL, NULL, NULL),
(57, 35, 'Friday', '09:00', '18:00', NULL, NULL, NULL),
(58, 35, 'Saturday', '09:00', '18:00', NULL, NULL, NULL),
(59, 38, 'Sunday', '09:00', '18:00', NULL, NULL, NULL),
(60, 38, 'Monday', '09:00', '18:00', NULL, NULL, NULL),
(61, 38, 'Tuesday', '09:00', '18:00', NULL, NULL, NULL),
(62, 38, 'Wednesday', '09:00', '18:00', NULL, NULL, NULL),
(63, 38, 'Thursday', '09:00', '18:00', NULL, NULL, NULL),
(64, 38, 'Friday', '09:00', '18:00', NULL, NULL, NULL),
(65, 38, 'Saturday', '09:00', '21:00', NULL, NULL, NULL),
(66, 39, 'Sunday', '09:00', '18:00', NULL, NULL, NULL),
(67, 39, 'Monday', '09:00', '18:00', NULL, NULL, NULL),
(68, 39, 'Tuesday', '09:00', '18:00', NULL, NULL, NULL),
(69, 39, 'Wednesday', '09:00', '18:00', NULL, NULL, NULL),
(70, 39, 'Thursday', '09:00', '18:00', NULL, NULL, NULL),
(71, 39, 'Friday', '09:00', '18:00', NULL, NULL, NULL),
(72, 39, 'Saturday', '09:00', '18:00', NULL, NULL, NULL),
(73, 40, 'Sunday', '09:00', '18:00', NULL, NULL, NULL),
(74, 40, 'Monday', '09:00', '18:00', NULL, NULL, NULL),
(75, 40, 'Tuesday', '09:00', '18:00', NULL, NULL, NULL),
(76, 40, 'Wednesday', '09:00', '18:00', NULL, NULL, NULL),
(77, 40, 'Thursday', '09:00', '18:00', NULL, NULL, NULL),
(78, 40, 'Friday', '09:00', '18:00', NULL, NULL, NULL),
(79, 40, 'Saturday', '09:00', '18:00', NULL, NULL, NULL),
(80, 41, 'Sunday', '09:00', '18:00', NULL, NULL, NULL),
(81, 41, 'Monday', '09:00', '18:00', NULL, NULL, NULL),
(82, 41, 'Tuesday', '09:00', '18:00', NULL, NULL, NULL),
(83, 41, 'Wednesday', '09:00', '18:00', NULL, NULL, NULL),
(84, 41, 'Thursday', '09:00', '18:00', NULL, NULL, NULL),
(85, 41, 'Friday', '09:00', '18:00', NULL, NULL, NULL),
(86, 41, 'Saturday', '09:00', '18:00', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
