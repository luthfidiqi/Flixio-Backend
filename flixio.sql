-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 05, 2023 at 04:39 AM
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
  `id` varchar(50) NOT NULL,
  `userId` varchar(50) NOT NULL,
  `scheduleId` varchar(50) NOT NULL,
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

INSERT INTO `booking` (`id`, `userId`, `scheduleId`, `dateBooking`, `timeBooking`, `totalTicket`, `totalPayment`, `paymentMethod`, `statusPayment`, `statusUsed`, `createdAt`, `updatedAt`) VALUES
('1', '0', '1', '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:16:55', NULL),
('2', '0', '1', '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:17:39', NULL),
('3', '0', '1', '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:17:48', NULL),
('4', '0', '1', '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:24:33', NULL),
('5', '0', '1', '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-07-29 06:29:21', NULL),
('5554263a-6a42-403b-9c57-a7c69232a0b7', '1', '2', '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-08-05 04:34:08', NULL),
('6', '1', '2', '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-08-04 13:35:32', NULL),
('bd212e8a-2c7f-4a8f-9237-1474d4b47830', '1', '2', '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-08-05 04:36:45', NULL),
('f401ce07-0956-4f4d-9fdb-ac792ae156b7', '1', '2', '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'success', 'active', '2023-08-05 04:30:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookingSeat`
--

CREATE TABLE `bookingSeat` (
  `id` varchar(50) NOT NULL,
  `bookingId` varchar(50) NOT NULL,
  `seat` varchar(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookingSeat`
--

INSERT INTO `bookingSeat` (`id`, `bookingId`, `seat`, `createdAt`, `updatedAt`) VALUES
('1', '1', 'A1', '2023-07-29 06:16:55', NULL),
('10', '5', 'A2', '2023-07-29 06:29:21', NULL),
('11', '6', 'A1', '2023-08-04 13:35:32', NULL),
('12', '6', 'A2', '2023-08-04 13:35:32', NULL),
('2', '1', 'A2', '2023-07-29 06:16:55', NULL),
('3', '2', 'A1', '2023-07-29 06:17:39', NULL),
('344edc02-1438-4fb1-b26b-cf420bf3d7e9', 'bd212e8a-2c7f-4a8f-9237-1474d4b47830', 'A2', '2023-08-05 04:36:45', NULL),
('4', '2', 'A2', '2023-07-29 06:17:39', NULL),
('5', '3', 'A1', '2023-07-29 06:17:48', NULL),
('6', '3', 'A2', '2023-07-29 06:17:48', NULL),
('7', '4', 'A1', '2023-07-29 06:24:33', NULL),
('8', '4', 'A2', '2023-07-29 06:24:33', NULL),
('8a59a172-a44c-4bd6-b76a-0dbdc846313e', 'bd212e8a-2c7f-4a8f-9237-1474d4b47830', 'A1', '2023-08-05 04:36:45', NULL),
('9', '5', 'A1', '2023-07-29 06:29:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `id` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `category` varchar(250) NOT NULL,
  `image` varchar(255) NOT NULL,
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

INSERT INTO `movie` (`id`, `name`, `category`, `image`, `releaseDate`, `cast`, `director`, `duration`, `synopsis`, `createdAt`, `updatedAt`) VALUES
('1', 'Spiderman', 'Fantasy, Action', 'Flixio/movie/jc6pt9m9ae8mwvuyrz6x.png', '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2022-03-23 09:46:29', '2023-08-04 08:27:18'),
('2', 'Batman', 'Action', '', NULL, '', '', '', 'Lorem ipsum', '2022-03-23 09:46:29', '2022-03-23 09:46:29'),
('3', 'Spiderman', 'Fantasy, Action', '', '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2023-07-29 07:32:39', NULL),
('4', 'Spiderman', 'Fantasy, Action', '', '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2023-08-03 23:37:23', NULL),
('5', 'Spiderman', 'Fantasy, Action', 'Flixio/movie/eijszhinxa1y4vcdo1te.jpeg', '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2023-08-04 07:29:57', '2023-08-04 19:05:44'),
('a0fd4800-38ae-4995-92af-6526d425028f', 'Spiderman', 'Fantasy, Action', 'Flixio/movie/wkui0bztumbziltewrky.png', '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2023-08-05 11:29:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` varchar(50) NOT NULL,
  `movieId` varchar(50) NOT NULL,
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
('1', '1', 'Ebu.Id', 50000, 'Jakarta', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2023-07-29 00:49:47', '2023-07-29 01:08:51'),
('2', '2', 'Ebu.Id', 50000, 'Bogor', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2023-07-29 01:07:20', NULL),
('3', '1', 'Ebu.Id', 50000, 'Bogor', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2023-07-29 01:08:23', NULL),
('4', '1', 'Ebu.Id', 50000, 'Bogor', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2023-07-29 03:00:15', NULL),
('bab2b167-697d-4bcc-8d8b-de6417495ce1', '1', 'Ebu.Id', 50000, 'Bogor', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2023-08-05 04:30:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `firstName` varchar(250) NOT NULL,
  `lastName` varchar(150) NOT NULL,
  `image` varchar(255) NOT NULL,
  `noTelp` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `status` enum('active','notActive') NOT NULL DEFAULT 'notActive',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `image`, `noTelp`, `email`, `password`, `role`, `status`, `createdAt`, `updatedAt`) VALUES
('1', 'Luthfi', 'Asiddiqi', 'Flixio/user/zmpcmxybkhxmc9u61kka.jpeg', '14022', 'luthfidiqi@gmail.com', '$2b$10$U6QsZkVTERGdbQsBgVdOLOo5lCVSZnvpEF5rYqPSf/IG86KxoSKhu', 'admin', 'active', '2023-08-02 15:49:43', '2023-08-04 13:17:08'),
('10', 'Luthfi', 'Asiddiqi', '', '14045', 'kz1qz6@qiott.com', '$2b$10$1reBx0jqA5Scw0Yjk18mtOrQf6fbBqQLjAQ0kFNewu9.U9qNuvLwu', 'user', 'notActive', '2023-08-04 15:41:35', NULL),
('11', 'Luthfi', 'Asiddiqi', '', '14045', '25p4861s1j7@wuuvo.com', '$2b$10$24fd8Ua9Wl2AStXOH9ncz.ImoEj9t.Kkj6L7Ysee3oR8UsktOS3fi', 'user', 'notActive', '2023-08-04 15:42:29', NULL),
('12', 'Luthfi', 'Asiddiqi', '', '14045', 'mm1zp9g3zj@ezztt.com', '$2b$10$UDTYi6nVxxRN23r4Y0tP/uVIsWE12W6kKbcEiX8yddR79ucDdEbGu', 'user', 'notActive', '2023-08-04 16:17:59', NULL),
('13', 'Luthfi', 'Asiddiqi', '', '14045', '83pol9zwj4s@ezztt.com', '$2b$10$fBuWHHiHwgk0MlT3Vu4EPejg8FXmqqN09DRQ7o1jvuOFTYyw1bWze', 'user', 'notActive', '2023-08-04 16:25:28', NULL),
('14', 'Luthfi', 'Asiddiqi', '', '14045', '66129k6pud5@qiott.com', '$2b$10$CxmJf7G1skJelMIOTbG/ku1o90aBLEMqEeU1i6Wjm9YzWqrrgaYM.', 'user', 'notActive', '2023-08-04 16:27:29', NULL),
('15', 'Luthfi', 'Asiddiqi', '', '14045', 'gxt8nc@icznn.com', '$2b$10$au2..u2VVpeesiJ.suubtuikI54aosCZQq4w8lhFkJROB28TPqf5C', 'user', 'notActive', '2023-08-04 16:29:51', NULL),
('16', 'Luthfi', 'Asiddiqi', '', '14045', 'to9f1x@kzccv.com', '$2b$10$50jAtJ.PVEUl/aSY2oF9K.yJ2QwokLtUBZJk72oKkRDNIo//60cxS', 'user', 'notActive', '2023-08-05 03:18:47', NULL),
('17', 'Luthfi', 'Asiddiqi', '', '14045', 'm1fbue8lbqha@wuuvo.com', '$2b$10$IoA9giF0sChEUCrmConvkeXy4oKWSH/NLkYhOO2scZMBdbamrRvoa', 'user', 'notActive', '2023-08-05 03:23:55', NULL),
('18', 'Luthfi', 'Asiddiqi', '', '14045', 'dlf8vnpucfav@icznn.com', '$2b$10$JmcPSJ6ZwhpoVExnRRPwouNNJWn9HVz6PVfILppow0GbiPPJ7cuie', 'user', 'notActive', '2023-08-05 03:28:21', NULL),
('19', 'Luthfi', 'Asiddiqi', '', '14045', 'ycec1mcf7d@ezztt.com', '$2b$10$vSSdA4VncZq22b/jXgCqn.N6cOH5bTui7p7kWfUfAb/r0AQTLbv9C', 'user', 'notActive', '2023-08-05 03:31:06', NULL),
('2', 'Luthfi', '', '', '', 'luthfiqi@gmail.com', '123', 'user', 'active', '2023-08-02 15:50:55', NULL),
('3', 'Luthfi', '', '', '', 'luthfi@gmail.com', '123', 'user', 'notActive', '2023-08-02 16:03:00', NULL),
('4', 'Luthfi', '', '', '', 'luthfii@gmail.com', '123', 'user', 'notActive', '2023-08-03 13:58:44', NULL),
('5', 'Luthfi', 'Asiddiqi', '', '14045', 'luthfi2@gmail.com', '123', 'user', 'notActive', '2023-08-04 10:33:46', NULL),
('6', 'Luthfi', 'Asiddiqi', '', '14045', 'luthfi3@gmail.com', '$2b$10$ShNkLil5sDioloaHlY7V0uu4ClVzBivSVIq4DjPGLxZF4V/Hwcr1S', 'user', 'notActive', '2023-08-04 10:41:34', NULL),
('7', 'Luthfi', 'Asiddiqi', '', '14045', 'acerh6dw@icznn.com', '$2b$10$QIhOZBNsSw8joeegLfeLseHp.x6pTLkCwgpiRO2JivaVbwYcCY6y6', 'user', 'notActive', '2023-08-04 15:05:12', NULL),
('8', 'Luthfi', 'Asiddiqi', '', '14045', 'lpk0rlt1mj@icznn.com', '$2b$10$AiqNWUCcB.yO4ZMUvisvz.Ux1wLvJaRbAFQnQfcAQgcHXIHAu0IDG', 'user', 'active', '2023-08-04 15:06:13', '2023-08-04 15:40:38'),
('9', 'Luthfi', 'Asiddiqi', '', '14045', '7nw0uvd1mr8n@wuuvo.com', '$2b$10$eda2so9iaArHtcb9s1Q1wOaiptJrtMvbrxdQ8gUT81PXOSkA/4Fam', 'user', 'active', '2023-08-04 15:13:32', '2023-08-04 15:15:56'),
('b5d64cf6-5968-4797-9124-678b489778eb', 'Luthfi', 'Asiddiqi', '', '14045', 'itslutas@gmail.com', '$2b$10$564Kgl9Z6qdqCUpMzSCla.pj6ce7p.X2gl4kfM4mKoKLIqOul7aMa', 'user', 'notActive', '2023-08-05 04:14:40', NULL);

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
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
