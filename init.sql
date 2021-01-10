-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 14, 2020 at 06:03 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(10) NOT NULL,
  `username` varchar(11) NOT NULL,
  `passw` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `passw`) VALUES
(111, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `deduction`
--

DROP TABLE IF EXISTS `deduction`;
CREATE TABLE IF NOT EXISTS `deduction` (
  `empid` int(10) NOT NULL,
  `pfund` int(10) NOT NULL,
  `incometax` int(10) NOT NULL,
  `ar` int(10) DEFAULT NULL,
  `ptax` int(10) DEFAULT NULL,
  `tdeduction` int(11) DEFAULT NULL,
  `finalsalary` int(20) DEFAULT NULL,
  `additional` int(10) DEFAULT NULL,
  KEY `empid` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deduction`
--

INSERT INTO `deduction` (`empid`, `pfund`, `incometax`, `ar`, `ptax`, `tdeduction`, `finalsalary`, `additional`) VALUES
(101, 3500, 2500, 1000, 2000, 9000, 70500, NULL),
(102, 2500, 4000, 1000, 2000, 9500, 62000, NULL),
(104, 2500, 3500, 1000, 2000, 9000, 55500, NULL),
(105, 2500, 3500, 1000, 2000, 9000, 70500, NULL),
(201, 1200, 3200, 1000, 2000, 7400, 80100, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `deptid` int(10) NOT NULL,
  `deptname` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`deptid`, `deptname`, `location`) VALUES
(121, 'Research', 'hubli'),
(122, 'marketing', 'hubli'),
(123, 'finance', 'hubli');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `empid` int(10) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `doj` date NOT NULL,
  `address` varchar(200) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `designation` varchar(15) NOT NULL,
  `accountno` bigint(25) NOT NULL,
  `adhar` bigint(25) NOT NULL,
  `pan` varchar(25) NOT NULL,
  `deptid` int(10) NOT NULL,
  PRIMARY KEY (`empid`),
  KEY `deptid` (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empid`, `fname`, `lname`, `dob`, `doj`, `address`, `mobile`, `gender`, `designation`, `accountno`, `adhar`, `pan`, `deptid`) VALUES
(101, 'Pradeep', 'S', '1988-02-12', '2000-02-21', 'vidya nagar hubli', 9880110154, 'm', 'Manager', 123456987542, 456831541658, 'AJBG1234848', 121),
(102, 'Vishwanath', 'K', '1987-12-03', '1999-02-21', 'Shreya nagar hubli', 8050639845, 'm', 'Finance head', 2511561485, 6548213654648, 'AJGC165465457', 123),
(104, 'Kiran', 'M', '1985-02-12', '1998-02-12', 'industrial estate hubli', 872241480, 'm', 'research head', 1216846469841, 116466565233, 'AJGB65464614', 121),
(105, 'Geeta', 's', '1986-02-12', '1998-02-21', 'shreya properties hubli', 9880110318, 'f', 'finance Manager', 3215646148848, 36484654985, 'AJGC54454846654', 123),
(201, 'rohini', 'k', '2019-12-04', '2019-12-06', 'shreya nagar', 988011154, 'f', 'manager', 1255144464, 324424, '12121', 121);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE IF NOT EXISTS `salary` (
  `empid` int(10) NOT NULL,
  `bsalary` int(10) NOT NULL,
  `hra` int(10) NOT NULL,
  `sa` int(10) NOT NULL,
  `bonous` int(10) NOT NULL,
  `da` int(10) NOT NULL,
  `inscentive` int(10) NOT NULL,
  `tsalary` int(10) NOT NULL,
  KEY `empid` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`empid`, `bsalary`, `hra`, `sa`, `bonous`, `da`, `inscentive`, `tsalary`) VALUES
(101, 60000, 2000, 3500, 5000, 3000, 6000, 79500),
(101, 60000, 2000, 3500, 5000, 3000, 6000, 79500),
(102, 55000, 2000, 3500, 4500, 3000, 3500, 71500),
(102, 55000, 2000, 3500, 4500, 3000, 3500, 71500),
(104, 50000, 2000, 3500, 3500, 3000, 2500, 64500),
(104, 50000, 2000, 3500, 3500, 3000, 2500, 64500),
(105, 65000, 2000, 3500, 2500, 3000, 3500, 79500),
(105, 65000, 2000, 3500, 2500, 3000, 3500, 79500),
(201, 50000, 2500, 3500, 3500, 3000, 25000, 87500),
(201, 50000, 2500, 3500, 3500, 3000, 25000, 87500);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deduction`
--
ALTER TABLE `deduction`
  ADD CONSTRAINT `deduction_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `employee` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`deptid`) REFERENCES `department` (`deptid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `employee` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;