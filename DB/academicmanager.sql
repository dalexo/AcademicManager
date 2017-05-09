--
-- Βάση δεδομένων: `academicmanager`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `course`
--

DROP TABLE IF EXISTS course;

CREATE TABLE IF NOT EXISTS `course` (
  `courseId` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `cost` int(11) NOT NULL,
  `description` varchar(256) COLLATE utf8_bin NOT NULL,
  `startingDate` date NOT NULL,
  `endingDate` date NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `isDeleted`tinyint(1) NOT NULL,	
    PRIMARY KEY (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Άδειασμα δεδομένων του πίνακα `course`
--



DELETE FROM course;

INSERT INTO `course` (`courseId`, `title`, `cost`, `description`, `startingDate`, `endingDate`, `isActive`) VALUES
(1, 'Web Development', 2000, 'HTML, CSS & Javascript in Depth', '2016-10-03', '2017-06-02', 1),
(2, 'CCNA', 2300, 'Cisco Official Certification Course', '2016-09-19', '2017-06-16', 1),
(3, 'English', 1300, 'Lower Certification', '2016-10-03', '2017-05-19', 1);


--
-- Προσθήκη της στήλης isDeleted εφόσον δεν υπάρχει στον πίνακα `course`
--


  ALTER TABLE `course` ADD COLUMN IF NOT EXISTS `isDeleted` int(11) NOT NULL default '0';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `person`
--

CREATE TABLE IF NOT EXISTS `person` (
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
  PRIMARY KEY(personId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- DROP the columns below as requested by G.Metaxas
ALTER TABLE person DROP COLUMN IF EXISTS username;
ALTER TABLE person DROP COLUMN IF EXISTS password;


-- Άδειασμα δεδομένων του πίνακα `person`
DELETE FROM person;

INSERT INTO `person` (`personId`, `name`, `surname`, `type`, `dateOfBirth`, `sex`, `email`, `phoneNumber`, `address`, `taxNumber`, `bankAccount`) VALUES
(1, 'Leonardo', 'Di Caprio', 'Student', '1972-11-25', 'Male', 'leodic@gmail.com', '6908585672', 'Sunset Boulevard 52', '2134567890', ''),
(3, 'Michael', 'Jackson', 'Student', '1965-09-19', 'Male', 'micjac@gmail.com', '6906969690', 'Kiriakidou 11', '2108156890', ''),
(4, 'George', 'Michael', 'Student', '1964-07-09', 'Male', 'geomic@gmail.com', '2108547852', 'Kolokotroni 55', '2103897345', ''),
(5, 'David', 'Bowie', 'Teacher', '1957-12-11', 'Male', 'dbowie@yahoo.com', '2106711512', 'Panepistimiou 13', '2101981123', 'GR69005300000098762'),
(6, 'Whitney', 'Hiouston', 'Secretary', '1966-05-31', 'Female', 'whitneyh@hotmail.com', '6908877651', 'Grammou 6', '2118890768', 'GR320058009011110000872'),
(7, 'Bruce', 'Lee', 'Teacher', '1951-01-03', 'Male', 'brulee@gmail.com', '4456789123', 'Patision 66', '6789005432', 'GB55879000001155662'),
(8, 'Mike', 'Tyson', 'Teacher', '1965-01-15', 'Male', 'miktys@gmail.com', '0090807050', 'Heaven 32', '9087654321', 'US77890110000530099112'),
(9, 'Madonna', 'Madonna', 'Student', '1967-11-13', 'Female', 'madonna@gmail.com', '6968674321', 'Sunset 88', '2324257610', ''),
(10, 'Tony', 'Montana', 'Teacher', '2048-02-13', 'Male', 'drugs@gmail.com', '6909001234', 'Cartel 9', '2134567890', 'GR0022375812093467'),
(11, 'Luke', 'Skywalker', 'Admin', '1955-01-28', 'Male', 'jedi@gmail.com', '6932425261', 'Rebel Camp 4', '2341538753', 'GR238719094328734'),
(12, 'Darth', 'Vader', 'Student', '1945-06-18', 'Male', 'sithlord@yahoo.com', '6974358721', 'Deathstar 10', '1452348790', '');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `teaching`
--

CREATE TABLE IF NOT EXISTS `teaching` (
  `personId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  PRIMARY KEY(personId,courseId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- Άδειασμα δεδομένων του πίνακα `teaching`
DELETE FROM teaching;

INSERT INTO `teaching` (`personId`, `courseId`) VALUES
(5, 1),
(5, 3),
(7, 2),
(8, 2),
(10, 3);



--
-- AUTO_INCREMENT για πίνακα `course`
--
ALTER TABLE `course`
  MODIFY `courseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT για πίνακα `person`
--
ALTER TABLE `person`
  MODIFY `personId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;





-- Creation of table users

CREATE TABLE IF NOT EXISTS users (
user_id int NOT NULL AUTO_INCREMENT,
user_email varchar (255) NOT NULL,
user_password char (128),
last_login TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
status_account boolean,
personId int (11),
PRIMARY KEY(user_id),
FOREIGN KEY (personId) REFERENCES Person(personId),
UNIQUE KEY(user_email)
);
