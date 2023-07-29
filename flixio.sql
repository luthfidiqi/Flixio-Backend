-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 29, 2023 at 07:52 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flixio`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `scheduleId` int(11) NOT NULL,
  `dateBooking` date NOT NULL,
  `timeBooking` time NOT NULL,
  `totalTicket` int(11) NOT NULL,
  `totalPayment` int(11) NOT NULL,
  `paymentMethod` varchar(100) NOT NULL,
  `statusPayment` varchar(100) NOT NULL,
  `statusUsed` enum('active','notActive') NOT NULL DEFAULT 'active',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `scheduleId`, `dateBooking`, `timeBooking`, `totalTicket`, `totalPayment`, `paymentMethod`, `statusPayment`, `statusUsed`, `createdAt`, `updatedAt`) VALUES
(1, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:16:55', NULL),
(2, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:17:39', NULL),
(3, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:17:48', NULL),
(4, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:24:33', NULL),
(5, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:29:21', NULL),
(6, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:29:52', NULL),
(7, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:30:28', NULL),
(8, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:31:13', NULL),
(9, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:31:23', NULL),
(10, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:34:04', NULL),
(11, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:35:13', NULL),
(12, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:35:43', NULL),
(13, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:37:19', NULL),
(14, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:37:52', NULL),
(15, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:38:39', NULL),
(16, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:41:35', NULL),
(17, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:41:47', NULL),
(18, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:43:31', NULL),
(19, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:43:37', NULL),
(20, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:46:21', NULL),
(21, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:47:06', NULL),
(22, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:48:34', NULL),
(23, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:49:08', NULL),
(24, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:52:35', NULL),
(25, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:52:56', NULL),
(26, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:03:55', NULL),
(27, 1, '2022-01-01', '09:00:00', 1, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:05:17', NULL),
(28, 1, '2022-01-01', '09:00:00', 1, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:05:28', NULL),
(29, 1, '2022-01-01', '09:00:00', 1, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:05:43', NULL),
(30, 1, '2022-01-01', '09:00:00', 1, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:08:34', NULL),
(31, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:08:42', NULL),
(32, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:11:40', NULL),
(33, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:15:24', NULL),
(34, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:15:52', NULL),
(35, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:16:14', NULL),
(36, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:16:57', NULL),
(37, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:17:12', NULL),
(38, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:18:14', NULL),
(39, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:19:22', NULL),
(40, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:21:10', NULL),
(41, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 07:22:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookingSeat`
--

CREATE TABLE `bookingSeat` (
  `id` int(11) NOT NULL,
  `bookingId` int(11) NOT NULL,
  `seat` varchar(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookingSeat`
--

INSERT INTO `bookingSeat` (`id`, `bookingId`, `seat`, `createdAt`, `updatedAt`) VALUES
(1, 15, 'A1', '2023-07-29 06:38:39', NULL),
(2, 19, 'A1', '2023-07-29 06:43:37', NULL),
(3, 21, 'A2', '2023-07-29 06:47:06', NULL),
(4, 22, 'A1', '2023-07-29 06:48:34', NULL),
(5, 22, 'A2', '2023-07-29 06:48:34', NULL),
(6, 23, 'A1', '2023-07-29 06:49:08', NULL),
(7, 23, 'A2', '2023-07-29 06:49:08', NULL),
(8, 24, 'A1', '2023-07-29 06:52:35', NULL),
(9, 24, 'A2', '2023-07-29 06:52:35', NULL),
(10, 25, 'A1', '2023-07-29 06:52:56', NULL),
(11, 25, 'A2', '2023-07-29 06:52:56', NULL),
(12, 26, 'A1', '2023-07-29 07:03:55', NULL),
(13, 26, 'A2', '2023-07-29 07:03:55', NULL),
(14, 27, 'A1', '2023-07-29 07:05:17', NULL),
(15, 28, 'A1', '2023-07-29 07:05:28', NULL),
(16, 29, 'A1', '2023-07-29 07:05:43', NULL),
(17, 30, 'A1', '2023-07-29 07:08:34', NULL),
(18, 31, 'A1', '2023-07-29 07:08:42', NULL),
(19, 31, 'A2', '2023-07-29 07:08:42', NULL),
(20, 32, 'A1', '2023-07-29 07:11:40', NULL),
(21, 32, 'A2', '2023-07-29 07:11:40', NULL),
(22, 33, 'A1', '2023-07-29 07:15:24', NULL),
(23, 33, 'A2', '2023-07-29 07:15:24', NULL),
(24, 35, 'A1', '2023-07-29 07:16:14', NULL),
(25, 35, 'A2', '2023-07-29 07:16:14', NULL),
(26, 36, 'A1', '2023-07-29 07:16:57', NULL),
(27, 36, 'A2', '2023-07-29 07:16:57', NULL),
(28, 37, 'A1', '2023-07-29 07:17:12', NULL),
(29, 37, 'A2', '2023-07-29 07:17:12', NULL),
(30, 38, 'A1', '2023-07-29 07:18:14', NULL),
(31, 38, 'A2', '2023-07-29 07:18:14', NULL),
(32, 39, 'A1', '2023-07-29 07:19:22', NULL),
(33, 39, 'A2', '2023-07-29 07:19:22', NULL),
(34, 40, 'A1', '2023-07-29 07:21:10', NULL),
(35, 40, 'A2', '2023-07-29 07:21:10', NULL),
(36, 41, 'A1', '2023-07-29 07:22:14', NULL),
(37, 41, 'A2', '2023-07-29 07:22:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `category` varchar(250) NOT NULL,
  `releaseDate` date DEFAULT NULL,
  `cast` varchar(255) NOT NULL,
  `director` varchar(100) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `synopsis` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`id`, `name`, `category`, `releaseDate`, `cast`, `director`, `duration`, `synopsis`, `createdAt`, `updatedAt`) VALUES
(1, 'Spiderman', 'Fantasy, Action', '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2022-03-23 09:46:29', '2023-07-29 07:34:18'),
(2, 'Batman', 'Action', NULL, '', '', '', 'Lorem ipsum', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Asekkkkk', 'hiak', NULL, '', '', '', 'eh ha eh ha eh lol', '2023-07-28 22:15:21', '2023-07-29 00:43:44'),
(4, 'Kazuha x Wonyoung', 'Thriller', NULL, '', '', '', 'Uraaaa', '2023-07-28 22:19:34', NULL),
(6, 'Kazuha x Wonyoung', 'Thriller', NULL, '', '', '', 'Uraaaa', '2023-07-28 22:55:32', NULL),
(7, 'Kazuha x Wonyoung', 'Thriller', NULL, '', '', '', 'Uraaaa', '2023-07-28 23:08:36', NULL),
(8, 'Kazuha x Wonyoung', 'Thriller', NULL, '', '', '', 'Uraaaa', '2023-07-29 00:37:18', NULL),
(14, 'Kazuha x Wonyoung', 'Thriller', NULL, '', '', '', 'Uraaaa', '2023-07-29 01:03:45', NULL),
(15, 'Kazuha x Wonyoung', 'Thriller', NULL, '', '', '', 'Uraaaa', '2023-07-29 01:03:49', NULL),
(16, 'Kazuha x Wonyoung', 'Thriller', NULL, '', '', '', 'Uraaaa', '2023-07-29 01:03:51', NULL),
(17, 'Spiderman', 'Fantasy, Action', '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2023-07-29 07:32:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `movieId` int(11) NOT NULL,
  `premiere` varchar(150) NOT NULL,
  `price` int(11) NOT NULL,
  `location` varchar(100) NOT NULL,
  `dateStart` datetime NOT NULL,
  `dateEnd` datetime NOT NULL,
  `time` varchar(100) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `movieId`, `premiere`, `price`, `location`, `dateStart`, `dateEnd`, `time`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Ebu.Id', 50000, 'Jakarta', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2023-07-29 00:49:47', '2023-07-29 01:08:51'),
(4, 2, 'Ebu.Id', 50000, 'Bogor', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2023-07-29 01:07:20', NULL),
(5, 1, 'Ebu.Id', 50000, 'Bogor', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2023-07-29 01:08:23', NULL),
(6, 1, 'Ebu.Id', 50000, 'Bogor', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2023-07-29 03:00:15', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookingSeat`
--
ALTER TABLE `bookingSeat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `bookingSeat`
--
ALTER TABLE `bookingSeat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
