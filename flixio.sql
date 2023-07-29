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
(5, 1, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:29:21', NULL);

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
(1, 1, 'A1', '2023-07-29 06:16:55', NULL),
(2, 1, 'A2', '2023-07-29 06:16:55', NULL),
(3, 2, 'A1', '2023-07-29 06:17:39', NULL),
(4, 2, 'A2', '2023-07-29 06:17:39', NULL),
(5, 3, 'A1', '2023-07-29 06:17:48', NULL),
(6, 3, 'A2', '2023-07-29 06:17:48', NULL),
(7, 4, 'A1', '2023-07-29 06:24:33', NULL),
(8, 4, 'A2', '2023-07-29 06:24:33', NULL),
(9, 5, 'A1', '2023-07-29 06:29:21', NULL),
(10, 5, 'A2', '2023-07-29 06:29:21', NULL);

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
(3, 'Spiderman', 'Fantasy, Action', '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2023-07-29 07:32:39', NULL);

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
(2, 2, 'Ebu.Id', 50000, 'Bogor', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2023-07-29 01:07:20', NULL),
(3, 1, 'Ebu.Id', 50000, 'Bogor', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2023-07-29 01:08:23', NULL),
(4, 1, 'Ebu.Id', 50000, 'Bogor', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2023-07-29 03:00:15', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bookingSeat`
--
ALTER TABLE `bookingSeat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
