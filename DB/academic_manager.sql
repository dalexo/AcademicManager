-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2017 at 01:47 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `academic manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseId` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `cost` int(11) NOT NULL,
  `description` varchar(256) COLLATE utf8_bin NOT NULL,
  `startingDate` date NOT NULL,
  `endingDate` date NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseId`, `title`, `cost`, `description`, `startingDate`, `endingDate`, `isActive`) VALUES
(1, 'Web Development', 2000, 'HTML, CSS & Javascript in Depth', '2016-10-03', '2017-06-02', 1),
(2, 'CCNA', 2300, 'Cisco Official Certification Course', '2016-09-19', '2017-06-16', 1),
(3, 'English', 1300, 'Lower Certification', '2016-10-03', '2017-05-19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `personId` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `surname` varchar(128) COLLATE utf8_bin NOT NULL,
  `type` enum('Admin','Secretary','Teacher','Student') COLLATE utf8_bin NOT NULL,
  `dateOfBirth` date NOT NULL,
  `sex` enum('Male','Female') COLLATE utf8_bin NOT NULL,
  `email` varchar(128) COLLATE utf8_bin NOT NULL,
  `phoneNumber` varchar(128) COLLATE utf8_bin NOT NULL,
  `address` varchar(128) COLLATE utf8_bin NOT NULL,
  `taxNumber` varchar(128) COLLATE utf8_bin NOT NULL,
  `bankAccount` varchar(128) COLLATE utf8_bin NOT NULL,
  `username` varchar(128) COLLATE utf8_bin NOT NULL,
  `password` varchar(128) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`personId`, `name`, `surname`, `type`, `dateOfBirth`, `sex`, `email`, `phoneNumber`, `address`, `taxNumber`, `bankAccount`, `username`, `password`) VALUES
(1, 'Leonardo', 'Di Caprio', 'Student', '1972-11-25', 'Male', 'leodic@gmail.com', '6908585672', 'Sunset Boulevard 52', '2134567890', 'GR5590978923124567', 'leodic', '12345678'),
(3, 'Michael', 'Jackson', 'Student', '1965-09-19', 'Male', 'micjac@gmail.com', '6906969690', 'Kiriakidou 11', '2108156890', 'GR30112987384592100', 'micjac', '12345678'),
(4, 'George', 'Michael', 'Student', '1964-07-09', 'Male', 'geomic@gmail.com', '2108547852', 'Kolokotroni 55', '2103897345', 'GR53006732000098763', 'geomic', '12345678'),
(5, 'David', 'Bowie', 'Teacher', '1957-12-11', 'Male', 'dbowie@yahoo.com', '2106711512', 'Panepistimiou 13', '2101981123', 'GR69005300000098762', 'davbow', '12345678'),
(6, 'Whitney', 'Hiouston', 'Secretary', '1966-05-31', 'Female', 'whitneyh@hotmail.com', '6908877651', 'Grammou 6', '2118890768', 'GR320058009011110000872', 'whitney', '12345678'),
(7, 'Bruce', 'Lee', 'Teacher', '1951-01-03', 'Male', 'brulee@gmail.com', '4456789123', 'Patision 66', '6789005432', 'GB55879000001155662', 'brulee', '12345678'),
(8, 'Mike', 'Tyson', 'Teacher', '1965-01-15', 'Male', 'miktys@gmail.com', '0090807050', 'Heaven 32', '9087654321', 'US77890110000530099112', 'miktys', '12345678'),
(9, 'Madonna', 'Madonna', 'Student', '1967-11-13', 'Female', 'madonna@gmail.com', '6968674321', 'Sunset 88', '2324257610', 'US55679011112099003', 'madonna', '12345678'),
(10, 'Tony', 'Montana', 'Teacher', '2048-02-13', 'Male', 'drugs@gmail.com', '6909001234', 'Cartel 9', '2134567890', 'GR0022375812093467', 'cocaine', '12345678'),
(11, 'Luke', 'Skywalker', 'Admin', '1955-01-28', 'Male', 'jedi@gmail.com', '6932425261', 'Rebel Camp 4', '2341538753', 'GR238719094328734', 'admin', 'admin'),
(12, 'Darth', 'Vader', 'Student', '1945-06-18', 'Male', 'sithlord@yahoo.com', '6974358721', 'Deathstar 10', '1452348790', 'GR9012894783762341', 'sith', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `teaching`
--

CREATE TABLE `teaching` (
  `personId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `teaching`
--

INSERT INTO `teaching` (`personId`, `courseId`) VALUES
(5, 1),
(7, 2),
(8, 2),
(10, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseId`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`personId`);

--
-- Indexes for table `teaching`
--
ALTER TABLE `teaching`
  ADD PRIMARY KEY (`personId`,`courseId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `courseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `personId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
