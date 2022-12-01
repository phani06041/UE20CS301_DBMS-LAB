-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 16, 2022 at 08:54 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TRAIN RESERVATION`
--

-- --------------------------------------------------------

--
-- Table structure for table `COMPARTMENT`
--

CREATE TABLE `COMPARTMENT` (
  `Type` varchar(10) NOT NULL,
  `Compartment No.` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Availability` varchar(10) NOT NULL,
  `Train No.` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `FARE TABLE`
--

CREATE TABLE `FARE TABLE` (
  `Train Type` varchar(10) NOT NULL,
  `Compartment type` varchar(10) NOT NULL,
  `FarePerKM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `PAYMENT_INFO`
--

CREATE TABLE `PAYMENT_INFO` (
  `Transaction_id` int(11) NOT NULL,
  `Bank` varchar(20) NOT NULL,
  `Card No` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `PNR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ROUTE INFO`
--

CREATE TABLE `ROUTE INFO` (
  `From_Station_no` int(11) NOT NULL,
  `From_Station_name` varchar(10) NOT NULL,
  `To_Station_no` int(11) NOT NULL,
  `To_Station_name` varchar(10) NOT NULL,
  `Distance` int(11) NOT NULL,
  `Train No.` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `TICKET`
--

CREATE TABLE `TICKET` (
  `PNR` int(11) NOT NULL,
  `Train No.` int(11) NOT NULL,
  `Travel Date` date NOT NULL,
  `Departure` varchar(10) NOT NULL,
  `Arrival` varchar(10) NOT NULL,
  `Departure time` int(11) NOT NULL,
  `Arrival time` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Train Type` varchar(10) NOT NULL,
  `Compartment type` varchar(10) NOT NULL,
  `Cmpt No.` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `TICKET_PASSENGER`
--

CREATE TABLE `TICKET_PASSENGER` (
  `Seat No` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `PNR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `TRAIN`
--

CREATE TABLE `TRAIN` (
  `Train No.` int(11) NOT NULL,
  `Name` varchar(15) NOT NULL,
  `Arrival` date NOT NULL,
  `Destination` varchar(10) NOT NULL,
  `Availability` varchar(10) NOT NULL,
  `Train Type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE `USER` (
  `User_id` int(11) NOT NULL,
  `User_type` varchar(10) NOT NULL,
  `FName` varchar(10) NOT NULL,
  `LName` varchar(10) NOT NULL,
  `Age` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `Pincode` int(11) NOT NULL,
  `Street_No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `USER-TRAIN`
--

CREATE TABLE `USER-TRAIN` (
  `Train No.` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `DateTimeStamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `USER_PHONE`
--

CREATE TABLE `USER_PHONE` (
  `User_id` int(11) NOT NULL,
  `Phone_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `COMPARTMENT`
--
ALTER TABLE `COMPARTMENT`
  ADD PRIMARY KEY (`Compartment No.`),
  ADD UNIQUE KEY `Train No.` (`Train No.`) USING BTREE;

--
-- Indexes for table `PAYMENT_INFO`
--
ALTER TABLE `PAYMENT_INFO`
  ADD PRIMARY KEY (`Transaction_id`);

--
-- Indexes for table `ROUTE INFO`
--
ALTER TABLE `ROUTE INFO`
  ADD PRIMARY KEY (`From_Station_no`,`To_Station_no`);

--
-- Indexes for table `TICKET`
--
ALTER TABLE `TICKET`
  ADD PRIMARY KEY (`PNR`);

--
-- Indexes for table `TICKET_PASSENGER`
--
ALTER TABLE `TICKET_PASSENGER`
  ADD PRIMARY KEY (`Seat No`);

--
-- Indexes for table `TRAIN`
--
ALTER TABLE `TRAIN`
  ADD PRIMARY KEY (`Train No.`);

--
-- Indexes for table `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`User_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `TRAIN`
--
ALTER TABLE `TRAIN`
  ADD CONSTRAINT `TRAIN_ibfk_1` FOREIGN KEY (`Train No.`) REFERENCES `COMPARTMENT` (`Train No.`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
