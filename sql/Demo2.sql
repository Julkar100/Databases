-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2017 at 07:18 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `motoring_repairs`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Appointment_Id` int(10) NOT NULL,
  `Appointment_Time` varchar(7) DEFAULT NULL,
  `Appointment_Date` date DEFAULT NULL,
  `Appointment_Cost` float(10,5) DEFAULT NULL,
  `Vehicle_Id` varchar(10) DEFAULT NULL,
  `Mechanic_Id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`Appointment_Id`, `Appointment_Time`, `Appointment_Date`, `Appointment_Cost`, `Vehicle_Id`, `Mechanic_Id`) VALUES
(1, '2.00PM', '2017-01-09', 60.00000, 'LS10 TYU', 1),
(2, '2.00PM', '2017-01-02', 50.00000, 'PR23 TEE', 1),
(3, '3.00PM', '2017-01-02', 60.00000, 'PR78 WER', 2),
(4, '10.00AM', '2017-01-15', 50.00000, 'LS10 TYU ', 2),
(5, '2.00PM', '2017-01-15', 70.00000, 'RL33 900', 3),
(6, '3.00PM', '2017-02-15', 80.00000, 'DR3 AVE', 2),
(7, '3.00PM', '0000-00-00', 60.00000, 'PR78 WER', 1),
(8, '3.00PM', '0000-00-00', 50.00000, 'DR3 AVE', 3),
(9, '11.00AM', '0000-00-00', 55.00000, 'PR78 WER', 2),
(10, '10.00AM', '0000-00-00', 65.00000, 'PR78 WER', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `Dealer_Id` int(10) NOT NULL,
  `Dealer_Name` varchar(30) DEFAULT NULL,
  `Maker_Id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dealer`
--

INSERT INTO `dealer` (`Dealer_Id`, `Dealer_Name`, `Maker_Id`) VALUES
(1, 'Middlesex Ford', 1),
(2, 'Leytonstone Chevy Dealership', 2),
(3, 'Wood Street Honda', 3);

-- --------------------------------------------------------

--
-- Table structure for table `maker`
--

CREATE TABLE `maker` (
  `Maker_Id` int(10) NOT NULL,
  `Maker_Name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maker`
--

INSERT INTO `maker` (`Maker_Id`, `Maker_Name`) VALUES
(1, 'Ford'),
(2, 'Chevy'),
(3, 'Honda');

-- --------------------------------------------------------

--
-- Table structure for table `mechanic`
--

CREATE TABLE `mechanic` (
  `Mechanic_Id` int(10) NOT NULL,
  `Mechanic_Name` varchar(20) DEFAULT NULL,
  `Monthly_Salary` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mechanic`
--

INSERT INTO `mechanic` (`Mechanic_Id`, `Mechanic_Name`, `Monthly_Salary`) VALUES
(1, 'Stephanie Thomas', 1000),
(2, 'Carol Shields', 1000),
(3, 'Sally Perkins', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `Owner_Id` varchar(15) NOT NULL,
  `Owner_Name` varchar(25) DEFAULT NULL,
  `Owner_Address` varchar(150) DEFAULT NULL,
  `Owner_Telephone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`Owner_Id`, `Owner_Name`, `Owner_Address`, `Owner_Telephone`) VALUES
('1985-123', 'Sandra Flanders', '27 Wolfe Road, Greenwich, London, SE10 9HE', '0207 544 9800'),
('1986-108', 'Colin Wilson', '55 Peckham Hill Street, Peckham, London, SE15 THR', '0207 506 9823'),
('1986-333', 'Anna Wells', '109 Flaggstaff Avenue, Nunhead, SE15 TRR', '020 888 1234'),
('1999-001', 'Patrick Fitzgerald', '33 Lark Street, Bermondsey, SE16 8TU', '020 506 1342');

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `Parts_Id` int(10) NOT NULL,
  `Parts_Name` varchar(25) DEFAULT NULL,
  `Parts_Quantity` int(3) DEFAULT NULL,
  `Parts_Type_Id` int(10) NOT NULL,
  `Parts_Price` float(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`Parts_Id`, `Parts_Name`, `Parts_Quantity`, `Parts_Type_Id`, `Parts_Price`) VALUES
(1, 'Starter Motor S456', 1, 1, 25.00000),
(2, 'Air filters A344', 1, 2, 25.00000),
(3, 'Fan blades B456', 5, 3, 50.00000),
(4, 'Gearbox G123', 1, 4, 80.00000),
(5, 'Electrical Grips EG321', 1, 5, 100.00000);

-- --------------------------------------------------------

--
-- Table structure for table `parts_type`
--

CREATE TABLE `parts_type` (
  `Parts_Type_Id` int(10) NOT NULL,
  `Parts_Type_Name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parts_type`
--

INSERT INTO `parts_type` (`Parts_Type_Id`, `Parts_Type_Name`) VALUES
(1, 'Start Motor'),
(2, 'Fan Blades'),
(3, 'Gearbox'),
(4, 'Electrical gripes'),
(5, 'Functioning brakes');

-- --------------------------------------------------------

--
-- Table structure for table `parts_type_referral`
--

CREATE TABLE `parts_type_referral` (
  `Parts_Referral_Id` int(10) NOT NULL,
  `Referral_Id` int(10) DEFAULT NULL,
  `Parts_Type_Id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parts_type_referral`
--

INSERT INTO `parts_type_referral` (`Parts_Referral_Id`, `Referral_Id`, `Parts_Type_Id`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `Referral_Id` int(10) NOT NULL,
  `Referral_Date` date DEFAULT NULL,
  `Referral_Problem` varchar(255) DEFAULT NULL,
  `Dealer_ID` int(10) DEFAULT NULL,
  `Appointment_Id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `referral`
--

INSERT INTO `referral` (`Referral_Id`, `Referral_Date`, `Referral_Problem`, `Dealer_ID`, `Appointment_Id`) VALUES
(1, '2017-01-15', 'Glass Fitting', 1, 1),
(2, '2017-01-31', 'Air bag Fitting', 1, 1),
(3, '2017-02-15', 'Steel cutting', 2, 2),
(4, '2017-01-31', 'Glass fitting', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `repair`
--

CREATE TABLE `repair` (
  `Repair_Id` int(10) NOT NULL,
  `Repair_Details` varchar(255) DEFAULT NULL,
  `Appointment_Id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `repair`
--

INSERT INTO `repair` (`Repair_Id`, `Repair_Details`, `Appointment_Id`) VALUES
(1, 'Starter motor not functioning.', 1),
(2, 'Air-conditioning not functioning.', 1),
(3, 'Air-bag not functioning.', 1),
(4, 'Gearbox not working', 2),
(5, 'Electrical gripes not connecting', 3),
(6, 'Functional breaks not working', 4);

-- --------------------------------------------------------

--
-- Table structure for table `repair_parts`
--

CREATE TABLE `repair_parts` (
  `Repair_Parts_Id` int(10) NOT NULL,
  `Parts_Id` int(10) DEFAULT NULL,
  `Reapir_Id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `repair_parts`
--

INSERT INTO `repair_parts` (`Repair_Parts_Id`, `Parts_Id`, `Reapir_Id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `Vehicle_Id` varchar(10) NOT NULL,
  `Vehicle_Model_Id` int(10) DEFAULT NULL,
  `Owner_Id` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`Vehicle_Id`, `Vehicle_Model_Id`, `Owner_Id`) VALUES
('DR3 AVE', 4, '1999-001'),
('LS10 TYU', 1, '1985-123'),
('PR23 TEE', 2, '1986-108'),
('PR78 WER', 3, '1986-333'),
('RL33 900', 4, '1986-108');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_model`
--

CREATE TABLE `vehicle_model` (
  `Vehicle_Model_Id` int(20) NOT NULL,
  `Vehicle_Model_Name` varchar(25) NOT NULL,
  `Maker_Id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_model`
--

INSERT INTO `vehicle_model` (`Vehicle_Model_Id`, `Vehicle_Model_Name`, `Maker_Id`) VALUES
(1, 'Chevy Sonic', 1),
(2, 'Honda Fit', 2),
(3, 'Ford Focus', 3),
(4, 'Chevy Sonic', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`Appointment_Id`),
  ADD KEY `Fk_11` (`Vehicle_Id`),
  ADD KEY `Fk_12` (`Mechanic_Id`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`Dealer_Id`),
  ADD KEY `Fk_2` (`Maker_Id`);

--
-- Indexes for table `maker`
--
ALTER TABLE `maker`
  ADD PRIMARY KEY (`Maker_Id`);

--
-- Indexes for table `mechanic`
--
ALTER TABLE `mechanic`
  ADD PRIMARY KEY (`Mechanic_Id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`Owner_Id`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`Parts_Id`),
  ADD KEY `Fk_11` (`Parts_Quantity`),
  ADD KEY `Fk_1` (`Parts_Type_Id`);

--
-- Indexes for table `parts_type`
--
ALTER TABLE `parts_type`
  ADD PRIMARY KEY (`Parts_Type_Id`);

--
-- Indexes for table `parts_type_referral`
--
ALTER TABLE `parts_type_referral`
  ADD PRIMARY KEY (`Parts_Referral_Id`),
  ADD KEY `Fk_9` (`Referral_Id`),
  ADD KEY `Fk_10` (`Parts_Type_Id`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`Referral_Id`),
  ADD KEY `Fk_8` (`Dealer_ID`),
  ADD KEY `Fk_9` (`Appointment_Id`);

--
-- Indexes for table `repair`
--
ALTER TABLE `repair`
  ADD PRIMARY KEY (`Repair_Id`),
  ADD KEY `Repair_Id` (`Repair_Id`),
  ADD KEY `Fk_12` (`Appointment_Id`);

--
-- Indexes for table `repair_parts`
--
ALTER TABLE `repair_parts`
  ADD PRIMARY KEY (`Repair_Parts_Id`),
  ADD KEY `Fk_6` (`Parts_Id`),
  ADD KEY `Fk_7` (`Reapir_Id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`Vehicle_Id`),
  ADD KEY `Fk_5` (`Owner_Id`),
  ADD KEY `Fk_3` (`Vehicle_Model_Id`);

--
-- Indexes for table `vehicle_model`
--
ALTER TABLE `vehicle_model`
  ADD PRIMARY KEY (`Vehicle_Model_Id`),
  ADD KEY `Fk_3` (`Maker_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `Fk_5` FOREIGN KEY (`Vehicle_Id`) REFERENCES `vehicle` (`Vehicle_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_6` FOREIGN KEY (`Mechanic_Id`) REFERENCES `mechanic` (`Mechanic_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dealer`
--
ALTER TABLE `dealer`
  ADD CONSTRAINT `FK_1` FOREIGN KEY (`Maker_Id`) REFERENCES `maker` (`Maker_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parts`
--
ALTER TABLE `parts`
  ADD CONSTRAINT `Fk_7` FOREIGN KEY (`Parts_Type_Id`) REFERENCES `parts_type` (`Parts_Type_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parts_type_referral`
--
ALTER TABLE `parts_type_referral`
  ADD CONSTRAINT `Fk_10` FOREIGN KEY (`Referral_Id`) REFERENCES `referral` (`Referral_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_11` FOREIGN KEY (`Parts_Type_Id`) REFERENCES `parts_type` (`Parts_Type_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `referral`
--
ALTER TABLE `referral`
  ADD CONSTRAINT `Fk_8` FOREIGN KEY (`Dealer_ID`) REFERENCES `dealer` (`Dealer_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_9` FOREIGN KEY (`Appointment_Id`) REFERENCES `appointment` (`Appointment_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `repair`
--
ALTER TABLE `repair`
  ADD CONSTRAINT `Fk_12` FOREIGN KEY (`Appointment_Id`) REFERENCES `appointment` (`Appointment_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `repair_parts`
--
ALTER TABLE `repair_parts`
  ADD CONSTRAINT `Fk_13` FOREIGN KEY (`Parts_Id`) REFERENCES `parts` (`Parts_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_14` FOREIGN KEY (`Reapir_Id`) REFERENCES `repair` (`Repair_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `Fk_3` FOREIGN KEY (`Vehicle_Model_Id`) REFERENCES `vehicle_model` (`Vehicle_Model_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_4` FOREIGN KEY (`Owner_Id`) REFERENCES `owner` (`Owner_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle_model`
--
ALTER TABLE `vehicle_model`
  ADD CONSTRAINT `Fk_2` FOREIGN KEY (`Maker_Id`) REFERENCES `maker` (`Maker_Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
