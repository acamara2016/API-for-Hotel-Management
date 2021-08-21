-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2021 at 06:56 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acamara`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `Invoice_id` int(11) NOT NULL,
  `Invoice_Payment_method` varchar(255) NOT NULL,
  `Invoice_Payment_Customer_Name` varchar(255) NOT NULL,
  `Amount` float DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Fname` varchar(45) DEFAULT NULL,
  `Lname` varchar(45) DEFAULT NULL,
  `Type` enum('public','private') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `Invoice_id`, `Invoice_Payment_method`, `Invoice_Payment_Customer_Name`, `Amount`, `Date`, `Fname`, `Lname`, `Type`) VALUES
(2, 1, 'VISA', 'Adama Camara', NULL, '2021-08-19 10:00:28', 'Adama', 'Camara', 'private');

--
-- Triggers `bill`
--
DELIMITER $$
CREATE TRIGGER `charge_customer` AFTER INSERT ON `bill` FOR EACH ROW BEGIN 
    UPDATE `invoice` SET `Status` = 'Accepted' WHERE `invoice`.`id` = NEW.Invoice_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `check`
--

CREATE TABLE `check` (
  `id` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Customer_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `check`
--

INSERT INTO `check` (`id`, `Date`, `Customer_Name`) VALUES
(1, '2021-08-19 10:00:28', 'Adama Camara');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `clientCompId` varchar(255) NOT NULL,
  `clientCompName` varchar(255) DEFAULT NULL,
  `clientCity` varchar(255) DEFAULT NULL,
  `clientCompPassword` varchar(16) DEFAULT NULL,
  `moneyOwed` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`clientCompId`, `clientCompName`, `clientCity`, `clientCompPassword`, `moneyOwed`) VALUES
('CL#4c5658248594', 'Company B', 'Moncton', 'password', 0),
('CL#bf810574b9b7', 'Company A', 'Halifax', 'password', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Name` varchar(255) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `SSN` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Name`, `Email`, `Country`, `SSN`) VALUES
('Adama Camara', 'papusking9@gmail.com', 'Mali', 'ad496482'),
('Leroy Jenkins', 'Leroy@gmail.com', 'Leroy@gmail.com', 'leroyssn932'),
('Meguchan Motai', 'email2020@gmail.com', 'Canada Halifax', 'sn42895434'),
('undefined', 'undefined', 'undefined', 'undefined');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `idHotel` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `admin` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`idHotel`, `Name`, `Location`, `admin`, `password`) VALUES
('Azalai-username', 'Azalai Hotel', 'Bamako Hippodrome, Rue 32, Porte 110', 'ADMIN', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `Status` enum('Pending','Accepted','Error') DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `Payment_method` varchar(255) NOT NULL,
  `Payment_Customer_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `Status`, `description`, `Payment_method`, `Payment_Customer_Name`) VALUES
(1, 'Pending', 'Our very first customer of the Hotel', 'VISA', 'Adama Camara');

-- --------------------------------------------------------

--
-- Table structure for table `line`
--

CREATE TABLE `line` (
  `lineNo` int(11) NOT NULL,
  `poNo` varchar(255) NOT NULL,
  `partNo` int(11) NOT NULL,
  `linePrice` float DEFAULT NULL,
  `lineUnit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `line`
--

INSERT INTO `line` (`lineNo`, `poNo`, `partNo`, `linePrice`, `lineUnit`) VALUES
(1, 'PO#3bbed344c8f9', 1, 78, 5),
(2, 'PO#3bbed344c8f9', 2, 7.99, 2);

-- --------------------------------------------------------

--
-- Table structure for table `part`
--

CREATE TABLE `part` (
  `partNo` int(11) NOT NULL,
  `partName` varchar(255) DEFAULT NULL,
  `partDescription` varchar(255) DEFAULT NULL,
  `currentPrice` float NOT NULL,
  `part_QOH` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part`
--

INSERT INTO `part` (`partNo`, `partName`, `partDescription`, `currentPrice`, `part_QOH`) VALUES
(1, 'Gold 1/8 ounces', 'Refined gold from Peru', 78, 12),
(2, 'Wood', 'Wood from my backyard', 7.99, 103);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `method` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `Customer_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`method`, `date`, `Customer_Name`) VALUES
('VISA', '2021-08-19 10:52:30', 'Adama Camara');

-- --------------------------------------------------------

--
-- Table structure for table `purchase order`
--

CREATE TABLE `purchase order` (
  `poNo` varchar(255) NOT NULL,
  `datePO` datetime DEFAULT NULL,
  `status` enum('Pending','Processed') DEFAULT NULL,
  `clientCompId` varchar(255) NOT NULL,
  `poPrice` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase order`
--

INSERT INTO `purchase order` (`poNo`, `datePO`, `status`, `clientCompId`, `poPrice`) VALUES
('PO#3bbed344c8f9', '2021-05-20 07:44:03', 'Pending', 'CL#bf810574b9b7', NULL),
('PO#fbaccce0bfd2', '2021-05-21 07:44:03', 'Pending', 'CL#4c5658248594', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `Customer_Name` varchar(255) NOT NULL,
  `Today Price_id` int(11) NOT NULL,
  `Today Price_Hotel_idHotel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `start`, `end`, `Customer_Name`, `Today Price_id`, `Today Price_Hotel_idHotel`) VALUES
(1, '2021-08-18 19:53:26', '2021-08-20 19:53:26', 'Adama Camara', 1, 'Azalai-username'),
(2, '2021-08-17 04:02:22', '2021-08-20 23:02:22', 'Adama Camara', 1, 'Azalai-username'),
(4, '2021-08-20 09:53:22', '2021-08-22 09:53:22', 'Leroy Jenkins', 1, 'Azalai-username');

--
-- Triggers `reservation`
--
DELIMITER $$
CREATE TRIGGER `decrease_room_availability` AFTER INSERT ON `reservation` FOR EACH ROW update `Today Price` set `Today Price`.`Availablerooms` = `Today Price`.`Availablerooms`-1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `idRoom` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `occupancy` enum('YES','NO') NOT NULL,
  `ready` enum('YES','NO') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`idRoom`, `level`, `occupancy`, `ready`) VALUES
(0, 3, 'NO', 'YES'),
(1, 1, 'NO', 'YES'),
(2, 1, 'NO', 'YES'),
(3, 1, 'NO', 'YES'),
(4, 2, 'NO', 'YES'),
(5, 2, 'YES', 'NO'),
(6, 3, 'NO', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `rooms_has_check`
--

CREATE TABLE `rooms_has_check` (
  `Rooms_idRoom` int(11) NOT NULL,
  `Check_id` int(11) NOT NULL,
  `Check_Customer_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rooms_has_check`
--

INSERT INTO `rooms_has_check` (`Rooms_idRoom`, `Check_id`, `Check_Customer_Name`) VALUES
(5, 1, 'Adama Camara');

--
-- Triggers `rooms_has_check`
--
DELIMITER $$
CREATE TRIGGER `room_check_trigger` AFTER INSERT ON `rooms_has_check` FOR EACH ROW BEGIN 
    UPDATE `rooms` SET `occupancy` = 'YES', `ready` = 'NO' WHERE `rooms`.`idRoom` = NEW.Rooms_idRoom;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `today price`
--

CREATE TABLE `today price` (
  `Price` float DEFAULT NULL,
  `Availablerooms` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `id` int(11) NOT NULL,
  `Hotel_idHotel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `today price`
--

INSERT INTO `today price` (`Price`, `Availablerooms`, `Date`, `id`, `Hotel_idHotel`) VALUES
(72, 19, '2021-08-17 00:45:50', 1, 'Azalai-username');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`,`Invoice_id`,`Invoice_Payment_method`,`Invoice_Payment_Customer_Name`),
  ADD KEY `fk_Bill_Invoice1_idx` (`Invoice_id`,`Invoice_Payment_method`,`Invoice_Payment_Customer_Name`);

--
-- Indexes for table `check`
--
ALTER TABLE `check`
  ADD PRIMARY KEY (`id`,`Customer_Name`),
  ADD KEY `fk_Check_Customer1_idx` (`Customer_Name`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`clientCompId`),
  ADD UNIQUE KEY `clientCompName_UNIQUE` (`clientCompName`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`idHotel`),
  ADD UNIQUE KEY `idHotel_UNIQUE` (`idHotel`),
  ADD UNIQUE KEY `Name_UNIQUE` (`Name`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`,`Payment_method`,`Payment_Customer_Name`),
  ADD KEY `fk_Invoice_Payment1_idx` (`Payment_method`,`Payment_Customer_Name`);

--
-- Indexes for table `line`
--
ALTER TABLE `line`
  ADD PRIMARY KEY (`lineNo`,`poNo`),
  ADD KEY `fk_Line_Purchase Order1_idx` (`poNo`),
  ADD KEY `fk_Line_Part1_idx` (`partNo`),
  ADD KEY `fk_Line_Part1` (`partNo`,`linePrice`);

--
-- Indexes for table `part`
--
ALTER TABLE `part`
  ADD PRIMARY KEY (`partNo`,`currentPrice`),
  ADD UNIQUE KEY `partNo_UNIQUE` (`partNo`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`method`,`Customer_Name`),
  ADD KEY `fk_Payment_Customer1_idx` (`Customer_Name`);

--
-- Indexes for table `purchase order`
--
ALTER TABLE `purchase order`
  ADD PRIMARY KEY (`poNo`,`clientCompId`),
  ADD KEY `fk_Purchase Order_Client_idx` (`clientCompId`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`,`Customer_Name`,`Today Price_id`,`Today Price_Hotel_idHotel`),
  ADD KEY `fk_Reservation_Customer1_idx` (`Customer_Name`),
  ADD KEY `fk_Reservation_Today Price1_idx` (`Today Price_id`,`Today Price_Hotel_idHotel`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`idRoom`);

--
-- Indexes for table `rooms_has_check`
--
ALTER TABLE `rooms_has_check`
  ADD PRIMARY KEY (`Rooms_idRoom`,`Check_id`,`Check_Customer_Name`),
  ADD KEY `fk_Rooms_has_Check_Check1_idx` (`Check_id`,`Check_Customer_Name`),
  ADD KEY `fk_Rooms_has_Check_Rooms1_idx` (`Rooms_idRoom`);

--
-- Indexes for table `today price`
--
ALTER TABLE `today price`
  ADD PRIMARY KEY (`id`,`Hotel_idHotel`),
  ADD KEY `fk_Today Price_Hotel1_idx` (`Hotel_idHotel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `check`
--
ALTER TABLE `check`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `line`
--
ALTER TABLE `line`
  MODIFY `lineNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `part`
--
ALTER TABLE `part`
  MODIFY `partNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `today price`
--
ALTER TABLE `today price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `fk_Bill_Invoice1` FOREIGN KEY (`Invoice_id`,`Invoice_Payment_method`,`Invoice_Payment_Customer_Name`) REFERENCES `invoice` (`id`, `Payment_method`, `Payment_Customer_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `check`
--
ALTER TABLE `check`
  ADD CONSTRAINT `fk_Check_Customer1` FOREIGN KEY (`Customer_Name`) REFERENCES `customer` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_Invoice_Payment1` FOREIGN KEY (`Payment_method`,`Payment_Customer_Name`) REFERENCES `payment` (`method`, `Customer_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `line`
--
ALTER TABLE `line`
  ADD CONSTRAINT `fk_Line_Part1` FOREIGN KEY (`partNo`,`linePrice`) REFERENCES `part` (`partNo`, `currentPrice`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Line_Purchase Order1` FOREIGN KEY (`poNo`) REFERENCES `purchase order` (`poNo`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_Payment_Customer1` FOREIGN KEY (`Customer_Name`) REFERENCES `customer` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `purchase order`
--
ALTER TABLE `purchase order`
  ADD CONSTRAINT `fk_Purchase Order_Client` FOREIGN KEY (`clientCompId`) REFERENCES `client` (`clientCompId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_Reservation_Customer1` FOREIGN KEY (`Customer_Name`) REFERENCES `customer` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reservation_Today Price1` FOREIGN KEY (`Today Price_id`,`Today Price_Hotel_idHotel`) REFERENCES `today price` (`id`, `Hotel_idHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rooms_has_check`
--
ALTER TABLE `rooms_has_check`
  ADD CONSTRAINT `fk_Rooms_has_Check_Check1` FOREIGN KEY (`Check_id`,`Check_Customer_Name`) REFERENCES `check` (`id`, `Customer_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Rooms_has_Check_Rooms1` FOREIGN KEY (`Rooms_idRoom`) REFERENCES `rooms` (`idRoom`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `today price`
--
ALTER TABLE `today price`
  ADD CONSTRAINT `fk_Today Price_Hotel1` FOREIGN KEY (`Hotel_idHotel`) REFERENCES `hotel` (`idHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
