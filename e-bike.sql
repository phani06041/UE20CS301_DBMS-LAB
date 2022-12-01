-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 16, 2022 at 08:39 AM
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
-- Database: `e-bike`
--

-- --------------------------------------------------------

--
-- Table structure for table `Bike`
--

CREATE TABLE `Bike` (
  `VIN` int(11) NOT NULL,
  `Make` varchar(30) DEFAULT NULL,
  `Model` varchar(30) DEFAULT NULL,
  `Reg_No` varchar(10) DEFAULT NULL,
  `Y_O_M` int(11) DEFAULT NULL,
  `Chasis_No` varchar(20) DEFAULT NULL,
  `Price` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Bike`
--

INSERT INTO `Bike` (`VIN`, `Make`, `Model`, `Reg_No`, `Y_O_M`, `Chasis_No`, `Price`) VALUES
(300, 'Honda', 'CB500X', 'KA20H2010', 2015, '1GNCS18Z3M0115561', 80000),
(301, 'Kawasaki', 'KLX230', 'KA56H2344', 2017, '1HBGH41JXMN109186', 50000),
(302, 'Suzuki', 'GSX-R1000', 'TN70A1653', 2016, 'JYA2UJE0X2A050036', 60000),
(303, 'Yamaha', 'Smax', 'MH04AT4351', 2014, 'WYGZZZ5NZJM131396', 100000),
(304, 'TVS', 'Ntorq 125', 'TN30J5699', 2020, 'JN3MS37A9PW202929', 120000),
(305, 'Mahindra', 'Duro', 'MH02BW1620', 2013, 'MLHNC5110G5200064', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `Cust_ID` int(11) NOT NULL,
  `FName` varchar(255) DEFAULT NULL,
  `LName` varchar(255) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Mobile` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`Cust_ID`, `FName`, `LName`, `Address`, `Email`, `Mobile`) VALUES
(201, 'Sai', 'Shankar', 'Chennai', 'saishankar@gmail.com', NULL),
(202, 'Apoorva', 'Kishore', 'Bangalore', 'apoorvak@gmail.com', NULL),
(203, 'Bala', 'Kumar', 'Chennai', 'balakumar@gmail.com', NULL),
(204, 'Chethan', 'Kumar', 'Kerala', 'chethankumar@gmail.com', NULL),
(205, 'Gowtham', 'Raman', 'Mumbai', 'gowthamraman@wipro.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cust_phone`
--

CREATE TABLE `cust_phone` (
  `Cust_ID` int(11) NOT NULL,
  `phone_No` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cust_phone`
--

INSERT INTO `cust_phone` (`Cust_ID`, `phone_No`) VALUES
(201, '8970654327'),
(201, '9047223778'),
(202, '8903562403'),
(203, '6547892020'),
(203, '6784523450'),
(204, '8760001589'),
(205, '9080102030'),
(205, '9988071233');

-- --------------------------------------------------------

--
-- Table structure for table `Dealer`
--

CREATE TABLE `Dealer` (
  `Dealer_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `PIN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Dealer`
--

INSERT INTO `Dealer` (`Dealer_ID`, `Name`, `street`, `city`, `state`, `PIN`) VALUES
(1, 'Ajit', 'Brigade Road', 'Bangalore', 'Karnataka', 560001),
(2, 'Rudra', 'Bhashyam Circle', 'Bangalore', 'Karnataka', 560001),
(3, 'Arjun', 'Bapuji Nagar', 'Bangalore', 'Karnataka', 560001),
(4, 'Mohamad', 'Chickpet', 'Bangalore', 'Karnataka', 560001),
(5, 'Nirmala', 'Domlur', 'Bangalore', 'Karnataka', 560001),
(6, 'Raghu', 'HSR Layout', 'Bangalore', 'Karnataka', 560001),
(7, 'Likith', 'Hosur Road', 'Bangalore', 'Karnataka', 560001),
(8, 'Kiran', 'Indira Nagar', 'Bangalore', 'Karnataka', 560001),
(9, 'Sherif', 'JP Nagar', 'Bangalore', 'Karnataka', 560001),
(10, 'Tanish', 'Kannur', 'Bangalore', 'Karnataka', 560001),
(11, 'Mahesh', 'Adyar', 'Chennai', 'Karnataka', 560001),
(12, 'Margaret', 'Anna Nagar', 'Chennai', 'Tamil Nadu', 560001),
(13, 'Nadish', 'Broadway', 'Chennai', 'Tamil Nadu', 560001),
(14, 'Virat', 'Chepak', 'Chennai', 'Tamil Nadu', 560001),
(15, 'Vikram', 'Defence Colony', 'Chennai', 'Tamil Nadu', 560001),
(16, 'Deepak', 'Ambewadi', 'Mumbai', 'Maharashtra', 560001),
(17, 'Subash', 'Cumballa Hill', 'Mumbai', 'Maharashtra', 560001),
(18, 'Sudeep', 'Goregaon', 'Mumbai', 'Maharashtra', 560001),
(19, 'Farahn', 'Jacob Circle', 'Mumbai', 'Maharashtra', 560001),
(20, 'Ganish', 'Mandvi', 'Mumbai', 'Maharashtra', 560001);

-- --------------------------------------------------------

--
-- Table structure for table `Invoice`
--

CREATE TABLE `Invoice` (
  `SalesPersonID` int(11) NOT NULL,
  `VIN` int(11) NOT NULL,
  `Cust_ID` int(11) NOT NULL,
  `Bill_Date` date NOT NULL,
  `Total_Bill` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Invoice`
--

INSERT INTO `Invoice` (`SalesPersonID`, `VIN`, `Cust_ID`, `Bill_Date`, `Total_Bill`) VALUES
(100, 300, 201, '2016-04-04', '120998.98'),
(102, 301, 202, '2021-09-10', '132432.98'),
(103, 302, 203, '2012-10-02', '908907.87'),
(105, 304, 204, '2017-03-23', '78900.90'),
(109, 305, 205, '2015-12-27', '88998.99'),
(110, 303, 201, '2022-01-20', '120090.89');

-- --------------------------------------------------------

--
-- Table structure for table `Parts`
--

CREATE TABLE `Parts` (
  `P_ID` int(11) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Service_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Parts`
--

INSERT INTO `Parts` (`P_ID`, `Description`, `Qty`, `Price`, `Service_ID`) VALUES
(700, 'Air Filter', 1, '217.99', 400),
(701, 'Chain Set', 2, '1987.99', 401),
(702, 'Clutch Plate', 3, '517.99', 404),
(703, 'Handle Bar', 4, '2519.99', 405),
(704, 'Horn', 5, '1675.78', 402),
(705, 'Leg Guard', 101, '6217.99', 403);

-- --------------------------------------------------------

--
-- Table structure for table `SalesPerson`
--

CREATE TABLE `SalesPerson` (
  `SalesPersonID` int(11) NOT NULL,
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  `Dealer_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `SalesPerson`
--

INSERT INTO `SalesPerson` (`SalesPersonID`, `FName`, `LName`, `Dealer_ID`) VALUES
(100, 'Raghul', 'Kanna', 1),
(101, 'Akshay', 'Kumar', 2),
(102, 'Anil', 'Kapoor', 15),
(103, 'Barath', 'Kumar', 3),
(104, 'Smiriti', 'Bhai', 4),
(105, 'Rishi', 'Sunak', 5),
(106, 'Srihari', 'Udupa', 11),
(107, 'Pallavi', 'Sharma', 12),
(108, 'Bala', 'Reddy', 13),
(109, 'Sindhya', 'Kapoor', 19),
(110, 'Suma', 'Sampat', 20);

-- --------------------------------------------------------

--
-- Table structure for table `Service_Manager`
--

CREATE TABLE `Service_Manager` (
  `M_emp_id` int(11) NOT NULL,
  `F_Name` varchar(255) DEFAULT NULL,
  `L_Name` varchar(255) DEFAULT NULL,
  `No_of_bikes_serviced` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Service_Manager`
--

INSERT INTO `Service_Manager` (`M_emp_id`, `F_Name`, `L_Name`, `No_of_bikes_serviced`) VALUES
(600, 'Guru', 'Prasad', 2),
(601, 'Kalyan', 'Bhat', 3),
(602, 'Jeevan', 'Kishore', 5),
(603, 'Anjan', 'Jain', 4),
(604, 'Madhan', 'Raj', 6),
(605, 'Yashah', 'Kiran', 7);

-- --------------------------------------------------------

--
-- Table structure for table `Service_Ticket`
--

CREATE TABLE `Service_Ticket` (
  `Service_ID` int(11) NOT NULL,
  `VIN` int(11) DEFAULT NULL,
  `Cust_ID` int(11) DEFAULT NULL,
  `Date_Rec` date DEFAULT NULL,
  `Date_Del` date DEFAULT NULL,
  `M_emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Service_Ticket`
--

INSERT INTO `Service_Ticket` (`Service_ID`, `VIN`, `Cust_ID`, `Date_Rec`, `Date_Del`, `M_emp_id`) VALUES
(400, 300, 201, '2022-01-23', '2022-01-24', 601),
(401, 301, 202, '2022-01-23', '2022-01-24', 604),
(402, 302, 203, '2021-02-23', '2022-02-27', 603),
(403, 303, 204, '2022-04-10', '2022-04-13', 605),
(404, 304, 205, '2022-05-15', '2022-05-24', 605),
(405, 300, 203, '2021-12-26', '2021-12-27', 601);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Bike`
--
ALTER TABLE `Bike`
  ADD PRIMARY KEY (`VIN`),
  ADD UNIQUE KEY `VIN` (`VIN`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`Cust_ID`);

--
-- Indexes for table `cust_phone`
--
ALTER TABLE `cust_phone`
  ADD PRIMARY KEY (`Cust_ID`,`phone_No`);

--
-- Indexes for table `Dealer`
--
ALTER TABLE `Dealer`
  ADD PRIMARY KEY (`Dealer_ID`);

--
-- Indexes for table `Invoice`
--
ALTER TABLE `Invoice`
  ADD PRIMARY KEY (`SalesPersonID`,`VIN`,`Cust_ID`),
  ADD KEY `VIN` (`VIN`),
  ADD KEY `Cust_ID` (`Cust_ID`);

--
-- Indexes for table `Parts`
--
ALTER TABLE `Parts`
  ADD PRIMARY KEY (`P_ID`),
  ADD KEY `Service_ID` (`Service_ID`);

--
-- Indexes for table `SalesPerson`
--
ALTER TABLE `SalesPerson`
  ADD PRIMARY KEY (`SalesPersonID`),
  ADD KEY `Dealer_ID` (`Dealer_ID`);

--
-- Indexes for table `Service_Manager`
--
ALTER TABLE `Service_Manager`
  ADD PRIMARY KEY (`M_emp_id`);

--
-- Indexes for table `Service_Ticket`
--
ALTER TABLE `Service_Ticket`
  ADD PRIMARY KEY (`Service_ID`),
  ADD KEY `VIN` (`VIN`),
  ADD KEY `Cust_ID` (`Cust_ID`),
  ADD KEY `M_emp_id` (`M_emp_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cust_phone`
--
ALTER TABLE `cust_phone`
  ADD CONSTRAINT `cust_phone_ibfk_1` FOREIGN KEY (`Cust_ID`) REFERENCES `Customer` (`Cust_ID`);

--
-- Constraints for table `Invoice`
--
ALTER TABLE `Invoice`
  ADD CONSTRAINT `Invoice_ibfk_1` FOREIGN KEY (`VIN`) REFERENCES `Bike` (`VIN`),
  ADD CONSTRAINT `Invoice_ibfk_2` FOREIGN KEY (`SalesPersonID`) REFERENCES `SalesPerson` (`SalesPersonID`),
  ADD CONSTRAINT `Invoice_ibfk_3` FOREIGN KEY (`Cust_ID`) REFERENCES `Customer` (`Cust_ID`);

--
-- Constraints for table `Parts`
--
ALTER TABLE `Parts`
  ADD CONSTRAINT `Parts_ibfk_1` FOREIGN KEY (`Service_ID`) REFERENCES `Service_Ticket` (`Service_ID`);

--
-- Constraints for table `SalesPerson`
--
ALTER TABLE `SalesPerson`
  ADD CONSTRAINT `SalesPerson_ibfk_1` FOREIGN KEY (`Dealer_ID`) REFERENCES `Dealer` (`Dealer_ID`);

--
-- Constraints for table `Service_Ticket`
--
ALTER TABLE `Service_Ticket`
  ADD CONSTRAINT `Service_Ticket_ibfk_1` FOREIGN KEY (`VIN`) REFERENCES `Bike` (`VIN`),
  ADD CONSTRAINT `Service_Ticket_ibfk_2` FOREIGN KEY (`Cust_ID`) REFERENCES `Customer` (`Cust_ID`),
  ADD CONSTRAINT `Service_Ticket_ibfk_3` FOREIGN KEY (`M_emp_id`) REFERENCES `Service_Manager` (`M_emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
