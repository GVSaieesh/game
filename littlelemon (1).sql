-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2025 at 04:33 AM
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
('bkavala@gitam.in', 'Balu@1234'),
('balayasaswi352@gmail.com', 'Balu@123'),
('fsd@gmail.com', 'asdf'),
('lokesh@gmail.com', 'lokesh123'),
('bhuvaneshwarchowdarygurram@gmail.com', 'qwertyuiop'),
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
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `description`, `price`, `image`) VALUES
(1, 'Bruschetta', 'Bruschetta is a traditional Italian appetizer consisting of grilled bread rubbed with garlic and topped with a mixture of fresh tomatoes, basil, olive oil, and balsamic vinegar.\r\n\r\nSometimes, variations include mozzarella, olives, or prosciutto for added flavor.', 11.00, 'images/Bruschetta.png\r\n'),
(2, 'GreenSalad', 'Greek salad is a healthy and refreshing Mediterranean dish made with fresh cucumbers, tomatoes, red onions, olives, and feta cheese, all tossed in a simple dressing of olive oil, lemon juice, and oregano.', 12.00, 'images/Greensalad.png'),
(3, 'Grilledfish', 'Grilled fish is a delicious and nutritious dish made by cooking fresh fish over an open flame, grill, or pan. It is often seasoned with herbs, lemon juice, garlic, and olive oil, enhancing its natural flavors.', 9.00, 'images/Grilledfish.png'),
(4, 'Lemondessert', 'Lemon salad is a light and refreshing dish made with fresh greens, juicy tomatoes, cucumbers, and olives, all tossed in a zesty lemon dressing. The dressing, made with lemon juice, olive oil, garlic, and herbs, adds a tangy and aromatic flavor.', 7.00, 'images/Lemondessert.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
