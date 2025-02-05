-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2017 at 10:17 AM
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
-- Database: `toys`
--

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `Complaint_Id` varchar(10) NOT NULL,
  `Complaint_Description` varchar(255) DEFAULT NULL,
  `Complaint_Solution` varchar(255) DEFAULT NULL,
  `Product_Id` varchar(6) DEFAULT NULL,
  `Product_Order_Id` int(5) DEFAULT NULL,
  `Staff_Id` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`Complaint_Id`, `Complaint_Description`, `Complaint_Solution`, `Product_Id`, `Product_Order_Id`, `Staff_Id`) VALUES
('X899', 'Missing instructions', 'Replacement instructions sent', 'P234', 1, 'S34'),
('X900', 'Broken stand', 'Replacement product sent', 'P989', 4, 'S34'),
('X901', 'Missing Glass', 'Replacement Glass sent', 'P345', 7, 'S36');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_Id` varchar(10) NOT NULL,
  `Customer_Name` varchar(50) DEFAULT NULL,
  `Customer_Address` varchar(100) DEFAULT NULL,
  `Customer_Phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_Id`, `Customer_Name`, `Customer_Address`, `Customer_Phone`) VALUES
('C121', 'Paul Smith', '30 Lavender Road, London, SE15 2BN', '020 732 8765'),
('C122', 'William Smith', '40 Dolphin Road, London, SE15 2BN', '010 733 8575'),
('C123', 'Pall Walker', '50 Lavender Road, London, SE15 2BN', '030 734 5678'),
('C124', 'Vin Diseal', '60 Lavender Road, London, SE15 2BN', '040 735 1234');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `Order_Id` varchar(10) NOT NULL,
  `Order_Date` date NOT NULL,
  `Order_Total` float(5,3) DEFAULT NULL,
  `Customer_Id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`Order_Id`, `Order_Date`, `Order_Total`, `Customer_Id`) VALUES
('O56722', '2016-03-12', 80.960, 'C121'),
('O56723', '2016-04-13', 80.960, 'C122'),
('O56724', '2016-05-14', 80.960, 'C123'),
('O56725', '2016-06-15', 80.960, 'C124');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_Id` varchar(6) NOT NULL,
  `Product_Name` varchar(20) DEFAULT NULL,
  `Product_Type_Id` int(3) DEFAULT NULL,
  `Product_Type_Quantity` int(5) DEFAULT NULL,
  `Product_Type_Totalprice` float(5,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_Id`, `Product_Name`, `Product_Type_Id`, `Product_Type_Quantity`, `Product_Type_Totalprice`) VALUES
('P234', 'Robot Harry', 1, 1, 9.990),
('P345', 'Ludo', 2, 1, 10.990),
('P989', 'Quizit', 3, 2, 59.980);

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE `product_order` (
  `Product_Order_Id` int(5) NOT NULL,
  `Order_Id` varchar(10) DEFAULT NULL,
  `Product_Id` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_order`
--

INSERT INTO `product_order` (`Product_Order_Id`, `Order_Id`, `Product_Id`) VALUES
(1, 'O56722', 'P234'),
(2, 'O56722', 'P345'),
(3, 'O56722', 'P989'),
(4, 'O56723', 'P234'),
(5, 'O56723', 'P345'),
(6, 'O56723', 'P989'),
(7, 'O56724', 'P234'),
(8, 'O56724', 'P345'),
(9, 'O56724', 'P989'),
(10, 'O56725', 'P234'),
(11, 'O56725', 'P345'),
(12, 'O56725', 'P989');

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `Product_Type_Id` int(3) NOT NULL,
  `Product_Type_Name` varchar(100) DEFAULT NULL,
  `Product_Type_Price` float(5,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`Product_Type_Id`, `Product_Type_Name`, `Product_Type_Price`) VALUES
(1, 'Electronic', 9.990),
(2, 'Board Game', 10.990),
(3, 'Electronic', 29.990);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_Id` varchar(5) NOT NULL,
  `Staff_Name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_Id`, `Staff_Name`) VALUES
('S34', 'Roger Sanderson'),
('S36', 'Jenny Flanders'),
('S40', 'Aditi Rawal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`Complaint_Id`),
  ADD KEY `FK_1` (`Product_Id`),
  ADD KEY `FK_2` (`Product_Order_Id`),
  ADD KEY `FK_3` (`Staff_Id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_Id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`Order_Id`),
  ADD KEY `FK_7` (`Customer_Id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_Id`),
  ADD KEY `FK_6` (`Product_Type_Id`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`Product_Order_Id`),
  ADD KEY `FK_4` (`Order_Id`),
  ADD KEY `FK_5` (`Product_Id`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`Product_Type_Id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `FK_1` FOREIGN KEY (`Product_Id`) REFERENCES `product` (`Product_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_2` FOREIGN KEY (`Product_Order_Id`) REFERENCES `product_order` (`Product_Order_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_3` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_7` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`Customer_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_6` FOREIGN KEY (`Product_Type_Id`) REFERENCES `product_type` (`Product_Type_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `FK_4` FOREIGN KEY (`Order_Id`) REFERENCES `order_details` (`Order_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_5` FOREIGN KEY (`Product_Id`) REFERENCES `product` (`Product_Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
