-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2025 at 03:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `littlelemon`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`) VALUES
('balayasaswi352@gmail.com', 'Balu@123'),
('bhuvaneshwarchowdarygurram@gmail.com', 'qwertyuiop'),
('bkavala@gitam.in', 'Balu@1234'),
('eldenlord0007@gmail.com', 'password@123'),
('fsd@gmail.com', 'asdf'),
('lokesh@gmail.com', 'lokesh123'),
('pvsraj27@gmail.com', 'sai1847');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `image1` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `description`, `price`, `image`, `image1`) VALUES
(1, 'MARVEL SPIDER-MAN 2', 'Be Greater. Together. The incredible power of the symbiote forces Peter Parker and Miles Morales into a desperate fight as they balance their lives, friendships, and their duty to protect in an exciting chapter of the critically acclaimed Spider-Man franchise on PC.\r\n\r\n', 11.00, 'images/sp222.jpeg\r\n', 'images/sp24.jpg'),
(2, 'Resident Evil 4 REMAKE', 'Reimagined for 2023 to bring state-of-the-art survival horror. Resident Evil 4 preserves the essence of the original game, while introducing modernized gameplay, a reimagined storyline, and vividly detailed graphics to make this the latest survival horror game where life and death, terror and catharsis intersect.', 12.00, 'images/re4.jpg', 'images/re41.jpg'),
(3, 'ELDEN RING', 'Elden Ring is an action RPG which takes place in the Lands Between, sometime after the Shattering of the titular Elden Ring. Players must explore and fight their way through the vast open-world to unite all the shards, restore the Elden Ring, and become Elden Lord.', 9.00, 'images/ring.jpg', 'images/elden.jpg'),
(4, 'GOD OF WAR', 'God of War is a third-person action-adventure video game. It features an over-the-shoulder free camera (a departure from the previous installments which featured a fixed cinematic camera, with the exception of 2007\'s two-dimensional side-scroller Betrayal).', 7.00, 'images/war.png', 'images/god.jpg'),
(5, 'CYBERPUNK 2077', 'Cyberpunk 2077 is an open-world, action-adventure RPG set in the megalopolis of Night City, where you play as a cyberpunk mercenary wrapped-up in a do-or-die fight for survival.', 10.00, 'images/2077.jpg', 'images/20771.jpg'),
(6, 'SILENT HILL 2', 'Investigating a letter from his late wife, James returns to where they made so many memories - Silent Hill. What he finds is a ghost town, prowled by disturbing monsters and cloaked in deep fog.', 18.00, 'images/sh22.jpg', 'images/sh2.jpg'),
(7, 'GHOST OF TSUSHIMA', 'Set in 1274 on the Tsushima Island, the last samurai, Jin Sakai, must master a new fighting style, the way of the Ghost, to defeat the Mongol forces and fight for the freedom and independence of Japan.', 16.00, 'images/gh.jpeg', 'images/ghost.jpg'),
(8, 'BLASPHEMOUS', 'Blasphemous begins in the Brotherhood of the Silent Sorrow, a religious order opposed to His Holiness Escribar\'s authority, after all its members have been massacred. The last of their kind, the Penitent One, is resurrected by the Miracle and departs on a pilgrimage.', 20.00, 'images/bla.jpg', 'images/blas.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`email`, `name`) VALUES
('balayasaswi352@gmail.com', 'ELDEN RING'),
('balayasaswi352@gmail.com', 'Resident Evil 4 REMAKE'),
('balayasaswi352@gmail.com', 'GOD OF WAR'),
('eldenlord0007@gmail.com', 'Resident Evil 4 REMAKE'),
('eldenlord0007@gmail.com', NULL),
('eldenlord0007@gmail.com', NULL),
('eldenlord0007@gmail.com', NULL),
('eldenlord0007@gmail.com', NULL),
('eldenlord0007@gmail.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD KEY `email` (`email`),
  ADD KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`name`) REFERENCES `menu` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
