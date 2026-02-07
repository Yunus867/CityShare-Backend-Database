-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 23, 2026 at 01:37 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cityshare_restore2`
--

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE `Book` (
  `book_id` int(11) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(150) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `publication_year` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Book`
--

INSERT INTO `Book` (`book_id`, `isbn`, `title`, `author`, `genre`, `publication_year`, `category_id`, `image_path`) VALUES
(1, '9780439554930', 'Harry Potter and the Philosopher\'s Stone', 'J.K. Rowling', 'Fantasy', 1997, 1, 'assets/harry.jpg'),
(2, '9780061120084', 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, NULL, 'assets/tokillabird.jpg'),
(3, '9780140449136', 'The Odyssey', 'Homer', 'Classic', -800, NULL, 'assets/theodyssey.jpg'),
(4, '9780131103627', 'The C Programming Language', 'Kernighan & Ritchie', 'Education', 1978, NULL, 'assets/cprogram.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `BookTag`
--

CREATE TABLE `BookTag` (
  `book_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `BookTag`
--

INSERT INTO `BookTag` (`book_id`, `tag_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Branch`
--

CREATE TABLE `Branch` (
  `branch_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BranchStock`
--

CREATE TABLE `BranchStock` (
  `branch_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL DEFAULT 0,
  `available_qty` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Camera`
--

CREATE TABLE `Camera` (
  `camera_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Camera`
--

INSERT INTO `Camera` (`camera_id`, `name`, `brand`, `model`, `description`, `image_path`) VALUES
(1, 'Nikon Z Series Kit', 'Nikon', 'Z-mount', 'High-end mirrorless camera with zoom lens', 'assets/camera1.jpg'),
(2, 'Nikon Mirrorless Range', 'Nikon', 'Z Series', 'Set of Nikon mirrorless cameras for media projects', 'assets/camera2.jpg'),
(3, 'Compact Street Camera', 'Fujifilm', 'X-Series', 'Lightweight compact camera for field work', 'assets/camera3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `CameraInventory`
--

CREATE TABLE `CameraInventory` (
  `camera_inventory_id` int(11) NOT NULL,
  `library_id` int(11) NOT NULL,
  `camera_id` int(11) NOT NULL,
  `total_units` int(11) NOT NULL,
  `available_units` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CameraInventory`
--

INSERT INTO `CameraInventory` (`camera_inventory_id`, `library_id`, `camera_id`, `total_units`, `available_units`) VALUES
(1, 1, 1, 4, 3),
(2, 1, 2, 2, 1),
(3, 2, 3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`category_id`, `name`) VALUES
(1, 'Book'),
(4, 'Camera'),
(2, 'DVD'),
(3, 'Journal'),
(5, 'Lab'),
(6, 'Sports');

-- --------------------------------------------------------

--
-- Table structure for table `Inventory`
--

CREATE TABLE `Inventory` (
  `inventory_id` int(11) NOT NULL,
  `library_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `total_copies` int(11) NOT NULL,
  `available_copies` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Inventory`
--

INSERT INTO `Inventory` (`inventory_id`, `library_id`, `book_id`, `total_copies`, `available_copies`) VALUES
(1, 1, 1, 5, 3),
(2, 1, 2, 4, 2),
(3, 2, 1, 3, 1),
(4, 2, 3, 6, 6),
(5, 3, 4, 5, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `item`
-- (See below for the actual view)
--
CREATE TABLE `item` (
`item_id` int(11)
,`title` varchar(255)
,`creator` varchar(150)
,`identifier` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `LabEquipment`
--

CREATE TABLE `LabEquipment` (
  `lab_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `LabEquipment`
--

INSERT INTO `LabEquipment` (`lab_id`, `name`, `description`, `image_path`) VALUES
(1, 'Microscope & Glassware Set', 'Microscope with full set of coloured solutions and test tubes', 'assets/labe2.jpg'),
(2, 'Microscope Slide Kit', 'Microscope with prepared slides for biology experiments', 'assets/labe3.jpg'),
(3, 'Clamp Stand & Test Tubes', 'Clamp stand, Bunsen-style burner and test tubes', 'assets/labe4.jpg'),
(4, 'Basic Glassware Set', 'Beakers, flasks and pipette set', 'assets/labe.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `LabInventory`
--

CREATE TABLE `LabInventory` (
  `lab_inventory_id` int(11) NOT NULL,
  `library_id` int(11) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `total_units` int(11) NOT NULL,
  `available_units` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `LabInventory`
--

INSERT INTO `LabInventory` (`lab_inventory_id`, `library_id`, `lab_id`, `total_units`, `available_units`) VALUES
(1, 1, 1, 5, 3),
(2, 2, 2, 3, 1),
(3, 3, 3, 2, 2),
(4, 1, 4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Library`
--

CREATE TABLE `Library` (
  `library_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postcode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Library`
--

INSERT INTO `Library` (`library_id`, `name`, `address`, `postcode`) VALUES
(1, 'Birmingham Central Library', 'Centenary Square, Birmingham', 'B1 2EA'),
(2, 'Selly Oak Library', 'Oak Tree Lane, Birmingham', 'B29 6JA'),
(3, 'Aston Library', 'Aston Road, Birmingham', 'B6 4AB');

-- --------------------------------------------------------

--
-- Table structure for table `Loan`
--

CREATE TABLE `Loan` (
  `loan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `loan_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Loan`
--

INSERT INTO `Loan` (`loan_id`, `user_id`, `inventory_id`, `loan_date`, `due_date`, `return_date`, `created_at`) VALUES
(1, 1, 1, '2025-12-01', '2025-12-15', NULL, '2026-01-22 21:58:11'),
(2, 3, 2, '2025-12-05', '2025-12-19', NULL, '2026-01-22 21:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `LoginAudit`
--

CREATE TABLE `LoginAudit` (
  `login_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_time` datetime NOT NULL DEFAULT current_timestamp(),
  `success` tinyint(1) NOT NULL,
  `failure_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Reservation`
--

CREATE TABLE `Reservation` (
  `reservation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `reservation_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Reservation`
--

INSERT INTO `Reservation` (`reservation_id`, `user_id`, `book_id`, `reservation_date`, `status`, `created_at`) VALUES
(1, 1, 3, '2025-12-10', 'Pending', '2026-01-22 21:58:11'),
(2, 3, 1, '2025-12-11', 'Fulfilled', '2026-01-22 21:58:11'),
(3, 1, 1, '2025-12-01', 'Pending', '2026-01-22 21:58:11'),
(4, 3, 1, '2025-12-05', 'Pending', '2026-01-22 21:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `SportsEquipment`
--

CREATE TABLE `SportsEquipment` (
  `sports_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SportsEquipment`
--

INSERT INTO `SportsEquipment` (`sports_id`, `name`, `description`, `image_path`) VALUES
(1, 'Multi-Sport Equipment Cart', 'Mobile cage containing balls, hoops and cones for PE sessions', 'assets/sp1.jpg'),
(2, 'Indoor Ball Set', 'Mixed set of indoor footballs, basketballs and netballs', 'assets/sp1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `SportsInventory`
--

CREATE TABLE `SportsInventory` (
  `sports_inventory_id` int(11) NOT NULL,
  `library_id` int(11) NOT NULL,
  `sports_id` int(11) NOT NULL,
  `total_units` int(11) NOT NULL,
  `available_units` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SportsInventory`
--

INSERT INTO `SportsInventory` (`sports_inventory_id`, `library_id`, `sports_id`, `total_units`, `available_units`) VALUES
(1, 1, 1, 2, 1),
(2, 2, 2, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Tag`
--

CREATE TABLE `Tag` (
  `tag_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Tag`
--

INSERT INTO `Tag` (`tag_id`, `name`) VALUES
(3, 'Beginner'),
(1, 'Fiction'),
(4, 'Popular'),
(2, 'Science');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_login_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`user_id`, `name`, `email`, `password_hash`, `phone`, `role`, `created_at`, `last_login_at`) VALUES
(1, 'Jayden Paul', 'jayden@mail.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/X4xLdEGjNW.vCGmXe', '07000000000', 'Citizen', '2026-01-23 00:36:44', NULL),
(2, 'Sarah Ahmed', 'sarah@mail.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/X4xLdEGjNW.vCGmXe', '07111111111', 'Librarian', '2026-01-23 00:36:44', NULL),
(3, 'David White', 'david@mail.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/X4xLdEGjNW.vCGmXe', '07222222222', 'Citizen', '2026-01-23 00:36:44', NULL),
(4, 'Admin User', 'admin@cityshare.gov', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/X4xLdEGjNW.vCGmXe', '07999999999', 'Admin', '2026-01-23 00:36:44', NULL);

-- --------------------------------------------------------

--
-- Structure for view `item`
--
DROP TABLE IF EXISTS `item`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `item`  AS SELECT `book`.`book_id` AS `item_id`, `book`.`title` AS `title`, `book`.`author` AS `creator`, `book`.`isbn` AS `identifier` FROM `book` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `fk_book_category` (`category_id`);

--
-- Indexes for table `BookTag`
--
ALTER TABLE `BookTag`
  ADD PRIMARY KEY (`book_id`,`tag_id`),
  ADD KEY `fk_booktag_tag` (`tag_id`);

--
-- Indexes for table `Branch`
--
ALTER TABLE `Branch`
  ADD PRIMARY KEY (`branch_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `BranchStock`
--
ALTER TABLE `BranchStock`
  ADD PRIMARY KEY (`branch_id`,`book_id`),
  ADD KEY `fk_stock_book` (`book_id`);

--
-- Indexes for table `Camera`
--
ALTER TABLE `Camera`
  ADD PRIMARY KEY (`camera_id`);

--
-- Indexes for table `CameraInventory`
--
ALTER TABLE `CameraInventory`
  ADD PRIMARY KEY (`camera_inventory_id`),
  ADD KEY `ci_library_id` (`library_id`),
  ADD KEY `ci_camera_id` (`camera_id`);

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD UNIQUE KEY `library_id` (`library_id`,`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `LabEquipment`
--
ALTER TABLE `LabEquipment`
  ADD PRIMARY KEY (`lab_id`);

--
-- Indexes for table `LabInventory`
--
ALTER TABLE `LabInventory`
  ADD PRIMARY KEY (`lab_inventory_id`),
  ADD KEY `li_library_id` (`library_id`),
  ADD KEY `li_lab_id` (`lab_id`);

--
-- Indexes for table `Library`
--
ALTER TABLE `Library`
  ADD PRIMARY KEY (`library_id`);

--
-- Indexes for table `Loan`
--
ALTER TABLE `Loan`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Indexes for table `LoginAudit`
--
ALTER TABLE `LoginAudit`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `la_user_id` (`user_id`);

--
-- Indexes for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `idx_res_fifo` (`book_id`,`status`,`reservation_date`,`reservation_id`);

--
-- Indexes for table `SportsEquipment`
--
ALTER TABLE `SportsEquipment`
  ADD PRIMARY KEY (`sports_id`);

--
-- Indexes for table `SportsInventory`
--
ALTER TABLE `SportsInventory`
  ADD PRIMARY KEY (`sports_inventory_id`),
  ADD KEY `si_library_id` (`library_id`),
  ADD KEY `si_sports_id` (`sports_id`);

--
-- Indexes for table `Tag`
--
ALTER TABLE `Tag`
  ADD PRIMARY KEY (`tag_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Book`
--
ALTER TABLE `Book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Branch`
--
ALTER TABLE `Branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Camera`
--
ALTER TABLE `Camera`
  MODIFY `camera_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `CameraInventory`
--
ALTER TABLE `CameraInventory`
  MODIFY `camera_inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Inventory`
--
ALTER TABLE `Inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `LabEquipment`
--
ALTER TABLE `LabEquipment`
  MODIFY `lab_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `LabInventory`
--
ALTER TABLE `LabInventory`
  MODIFY `lab_inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Library`
--
ALTER TABLE `Library`
  MODIFY `library_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Loan`
--
ALTER TABLE `Loan`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `LoginAudit`
--
ALTER TABLE `LoginAudit`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `SportsEquipment`
--
ALTER TABLE `SportsEquipment`
  MODIFY `sports_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `SportsInventory`
--
ALTER TABLE `SportsInventory`
  MODIFY `sports_inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Tag`
--
ALTER TABLE `Tag`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Book`
--
ALTER TABLE `Book`
  ADD CONSTRAINT `fk_book_category` FOREIGN KEY (`category_id`) REFERENCES `Category` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `BookTag`
--
ALTER TABLE `BookTag`
  ADD CONSTRAINT `fk_booktag_book` FOREIGN KEY (`book_id`) REFERENCES `Book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_booktag_tag` FOREIGN KEY (`tag_id`) REFERENCES `Tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `BranchStock`
--
ALTER TABLE `BranchStock`
  ADD CONSTRAINT `fk_stock_book` FOREIGN KEY (`book_id`) REFERENCES `Book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stock_branch` FOREIGN KEY (`branch_id`) REFERENCES `Branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CameraInventory`
--
ALTER TABLE `CameraInventory`
  ADD CONSTRAINT `ci_fk_camera` FOREIGN KEY (`camera_id`) REFERENCES `Camera` (`camera_id`),
  ADD CONSTRAINT `ci_fk_library` FOREIGN KEY (`library_id`) REFERENCES `Library` (`library_id`);

--
-- Constraints for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `Library` (`library_id`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `Book` (`book_id`);

--
-- Constraints for table `LabInventory`
--
ALTER TABLE `LabInventory`
  ADD CONSTRAINT `li_fk_lab` FOREIGN KEY (`lab_id`) REFERENCES `LabEquipment` (`lab_id`),
  ADD CONSTRAINT `li_fk_library` FOREIGN KEY (`library_id`) REFERENCES `Library` (`library_id`);

--
-- Constraints for table `Loan`
--
ALTER TABLE `Loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `Inventory` (`inventory_id`);

--
-- Constraints for table `LoginAudit`
--
ALTER TABLE `LoginAudit`
  ADD CONSTRAINT `fk_login_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `Book` (`book_id`);

--
-- Constraints for table `SportsInventory`
--
ALTER TABLE `SportsInventory`
  ADD CONSTRAINT `si_fk_library` FOREIGN KEY (`library_id`) REFERENCES `Library` (`library_id`),
  ADD CONSTRAINT `si_fk_sports` FOREIGN KEY (`sports_id`) REFERENCES `SportsEquipment` (`sports_id`);

-- --------------------------------------------------------

--
-- Multi-item type support for Reservation and Loan tables
--

-- For Reservation table: Add item_id and item_type columns
ALTER TABLE `Reservation` ADD COLUMN `item_id` INT NOT NULL DEFAULT 0;
ALTER TABLE `Reservation` ADD COLUMN `item_type` VARCHAR(50) DEFAULT 'book';
UPDATE `Reservation` SET `item_id` = `book_id` WHERE `book_id` IS NOT NULL;

-- For Loan table: Add item_type column
ALTER TABLE `Loan` ADD COLUMN `item_type` VARCHAR(50) DEFAULT 'book';

-- Drop old foreign key constraint on Reservation.book_id (now using item_id + item_type)
ALTER TABLE `Reservation` DROP FOREIGN KEY `reservation_ibfk_2`;

-- Drop old foreign key constraint on Loan.inventory_id (now supports multiple inventory tables)
ALTER TABLE `Loan` DROP FOREIGN KEY `loan_ibfk_2`;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
