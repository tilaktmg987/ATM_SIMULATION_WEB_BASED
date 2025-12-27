-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2025 at 09:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atm`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `Card_Number` varchar(30) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `amount` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `Form_No` varchar(30) DEFAULT NULL,
  `Card_Number` varchar(30) DEFAULT NULL,
  `Pin_Number` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `Form_No` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Father_Name` varchar(50) DEFAULT NULL,
  `DOB` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Pin_Code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `signupthree`
--

CREATE TABLE `signupthree` (
  `Form_No` varchar(30) DEFAULT NULL,
  `Account_type` varchar(30) DEFAULT NULL,
  `Card_Number` varchar(30) DEFAULT NULL,
  `Pin_Number` varchar(30) DEFAULT NULL,
  `Facility` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `signuptwo`
--

CREATE TABLE `signuptwo` (
  `Form_No` varchar(30) DEFAULT NULL,
  `Religion` varchar(30) DEFAULT NULL,
  `Category` varchar(30) DEFAULT NULL,
  `Income` varchar(30) DEFAULT NULL,
  `Edu_Qualification` varchar(30) DEFAULT NULL,
  `Occupation` varchar(30) DEFAULT NULL,
  `PAN_No` varchar(30) DEFAULT NULL,
  `Citizenship_No` varchar(30) DEFAULT NULL,
  `National_ID` varchar(30) DEFAULT NULL,
  `Existing_Acc` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
