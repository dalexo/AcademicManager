-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 26 Ιαν 2017 στις 19:11:49
-- Έκδοση διακομιστή: 10.1.16-MariaDB
-- Έκδοση PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `academicmanager`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `course`
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

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `person`
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
-- Άδειασμα δεδομένων του πίνακα `person`
--

INSERT INTO `person` (`personId`, `name`, `surname`, `type`, `dateOfBirth`, `sex`, `email`, `phoneNumber`, `address`, `taxNumber`, `bankAccount`, `username`, `password`) VALUES
(1, 'Michail', 'Samartzis', 'Student', '1986-12-03', 'Male', 'micsamartzis@gmail.com', '6947452273', 'Navarhou Votsi', '12345', '', 'micsamartzis', '12345'),
(2, 'Michail', 'Samartzis', 'Student', '1986-12-03', 'Male', 'micsamartzis@gmail.com', '6947452273', 'Navarhou Votsi', '12345', '', 'micsamartzis', '12345');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `teaching`
--

CREATE TABLE `teaching` (
  `personId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseId`);

--
-- Ευρετήρια για πίνακα `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`personId`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `course`
--
ALTER TABLE `course`
  MODIFY `courseId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT για πίνακα `person`
--
ALTER TABLE `person`
  MODIFY `personId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
