-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 31, 2018 at 12:07 PM
-- Server version: 5.6.38-log
-- PHP Version: 5.4.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sg0118a09`
--

-- --------------------------------------------------------

--
-- Table structure for table `coursemaster`
--

CREATE TABLE IF NOT EXISTS `coursemaster` (
  `Course_Id` varchar(10) NOT NULL DEFAULT '',
  `Course_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Course_Id`),
  UNIQUE KEY `Course_Id` (`Course_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coursemaster`
--

INSERT INTO `coursemaster` (`Course_Id`, `Course_Name`) VALUES
('C0001', 'Std VII'),
('C0002', 'Std VIII'),
('C0003', 'Std IX'),
('C0004', 'Std X');

-- --------------------------------------------------------

--
-- Table structure for table `studentmaster`
--

CREATE TABLE IF NOT EXISTS `studentmaster` (
  `Student_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_FirstName` varchar(50) DEFAULT NULL,
  `Course_Id` varchar(10) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Student_LastName` varchar(50) DEFAULT NULL,
  `Residential_Address` varchar(256) DEFAULT NULL,
  `PhoneNo` varchar(11) DEFAULT NULL,
  UNIQUE KEY `Student_Id` (`Student_Id`),
  KEY `Course_Id` (`Course_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `studentmaster`
--
ALTER TABLE `studentmaster`
  ADD CONSTRAINT `studentmaster_ibfk_1` FOREIGN KEY (`Course_Id`) REFERENCES `coursemaster` (`Course_Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
