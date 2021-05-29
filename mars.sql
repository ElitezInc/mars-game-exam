-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2021 at 06:38 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mars`
--

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `id` int(11) NOT NULL,
  `building_type_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`id`, `building_type_id`, `city_id`, `level`, `position`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 2, 1, 1),
(3, 1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `building_type`
--

CREATE TABLE `building_type` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `building_type`
--

INSERT INTO `building_type` (`id`, `name`) VALUES
(1, 'main'),
(2, 'garden'),
(3, 'warehouse'),
(4, 'research_center'),
(5, 'baracks'),
(6, 'house'),
(7, 'dome'),
(8, 'Glass factory'),
(9, 'power plant');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `map_field_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `map_field_id`) VALUES
(1, 'City of Arnoldas', 81),
(2, 'City of user', 82),
(3, 'City of testuser', 83);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `email`, `message`) VALUES
(1, 'nikaflash@gmail.com', 'Pirmoji kontaktine zinute'),
(2, 'betkoks@email.com', 'Sekanti zinute administracijai');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(10) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `answer`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pretium odio a dui sollicitudin tempus. Phasellus et sapien vulputate, suscipit felis id, laoreet mi.', 'Ut sodales elit in dignissim consequat. Nam et massa in odio posuere posuere. In vel leo interdum, feugiat elit non, faucibus tortor. Etiam finibus ipsum leo, a egestas velit vestibulum sit amet.'),
(2, 'Cras aliquam orci nec nulla commodo scelerisque. Quisque scelerisque aliquam justo, sit amet pulvinar lectus sagittis eu. Donec sit amet mauris quis orci maximus hendrerit sit amet vehicula sapien.', 'Duis molestie eget tortor ut placerat. Nam porttitor, eros in tincidunt consectetur, augue urna euismod justo, ac dignissim nulla dolor sed ligula. Quisque scelerisque porta faucibus.'),
(3, 'Fusce ante arcu, consequat nec ultricies vel, consequat nec sapien. Praesent vel dictum risus, ac mattis mi. Cras auctor odio quis rutrum lacinia.', 'Vestibulum a ligula finibus, dapibus eros eu, porttitor nisl.'),
(4, 'uspendisse ac est quis diam aliquam pellentesque sed non est. Nunc porttitor bibendum neque, vel efficitur purus. Fusce vitae tincidunt diam. Vestibulum sagittis finibus vehicula.', 'Aenean in diam sed mauris congue suscipit. Sed lacinia iaculis iaculis. Ut tristique mi non magna ornare, ut mollis lectus aliquam.'),
(5, 'Nulla vulputate enim sit amet leo fermentum efficitur. Nulla semper neque arcu.', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec consequat purus at quam tincidunt, nec consectetur libero sagittis.');

-- --------------------------------------------------------

--
-- Table structure for table `field_type`
--

CREATE TABLE `field_type` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `field_type`
--

INSERT INTO `field_type` (`id`, `name`) VALUES
(1, 'city'),
(2, 'sand'),
(3, 'metal'),
(4, 'clay'),
(5, 'water');

-- --------------------------------------------------------

--
-- Table structure for table `map_field`
--

CREATE TABLE `map_field` (
  `id` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `field_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `map_field`
--

INSERT INTO `map_field` (`id`, `x`, `y`, `field_type_id`, `user_id`) VALUES
(1, 7, 1, 4, NULL),
(2, 16, 1, 3, NULL),
(3, 25, 1, 5, NULL),
(4, 27, 1, 4, NULL),
(5, 28, 1, 5, NULL),
(6, 3, 3, 3, NULL),
(7, 8, 3, 4, NULL),
(8, 15, 3, 4, NULL),
(9, 24, 3, 5, NULL),
(10, 26, 3, 5, NULL),
(11, 2, 5, 2, NULL),
(12, 8, 5, 2, NULL),
(13, 13, 5, 2, NULL),
(14, 22, 5, 3, NULL),
(15, 28, 5, 4, NULL),
(16, 4, 7, 5, NULL),
(17, 7, 7, 5, NULL),
(18, 14, 7, 2, NULL),
(19, 24, 7, 2, NULL),
(20, 26, 7, 2, NULL),
(21, 11, 9, 4, NULL),
(22, 12, 9, 5, NULL),
(23, 21, 9, 3, NULL),
(24, 25, 9, 3, NULL),
(25, 29, 9, 5, NULL),
(26, 30, 9, 5, NULL),
(27, 7, 11, 2, NULL),
(28, 14, 11, 4, NULL),
(29, 16, 11, 2, NULL),
(30, 21, 11, 2, NULL),
(31, 23, 11, 5, NULL),
(32, 8, 13, 3, NULL),
(33, 17, 13, 3, NULL),
(34, 18, 13, 4, NULL),
(35, 20, 13, 4, NULL),
(36, 22, 13, 5, NULL),
(37, 30, 13, 3, NULL),
(38, 10, 15, 5, NULL),
(39, 18, 15, 3, NULL),
(40, 23, 15, 4, NULL),
(41, 25, 15, 2, NULL),
(42, 28, 15, 3, NULL),
(43, 2, 17, 4, NULL),
(44, 11, 17, 3, NULL),
(45, 13, 17, 3, NULL),
(46, 16, 17, 5, NULL),
(47, 20, 17, 5, NULL),
(48, 25, 17, 2, NULL),
(49, 30, 17, 2, NULL),
(50, 7, 19, 5, NULL),
(51, 13, 19, 2, NULL),
(52, 22, 19, 4, NULL),
(53, 26, 19, 4, NULL),
(54, 4, 21, 4, NULL),
(55, 5, 21, 3, NULL),
(56, 10, 21, 5, NULL),
(57, 19, 21, 2, NULL),
(58, 28, 21, 5, NULL),
(59, 9, 23, 2, NULL),
(60, 17, 23, 2, NULL),
(61, 27, 23, 4, NULL),
(62, 9, 25, 3, NULL),
(63, 14, 25, 2, NULL),
(64, 15, 25, 4, NULL),
(65, 16, 25, 2, NULL),
(66, 25, 25, 2, NULL),
(67, 26, 25, 2, NULL),
(68, 2, 27, 2, NULL),
(69, 7, 27, 4, NULL),
(70, 8, 27, 2, NULL),
(71, 12, 27, 2, NULL),
(72, 15, 27, 3, NULL),
(73, 21, 27, 5, NULL),
(74, 26, 27, 4, NULL),
(75, 4, 29, 5, NULL),
(76, 9, 29, 4, NULL),
(77, 10, 29, 3, NULL),
(78, 18, 29, 5, NULL),
(79, 25, 29, 5, NULL),
(80, 28, 29, 4, NULL),
(81, 15, 21, 1, 1),
(82, 19, 27, 1, 2),
(83, 30, 16, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `fromid` int(11) NOT NULL,
  `toid` int(11) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `isread` tinyint(1) NOT NULL,
  `senttime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `resource_type`
--

CREATE TABLE `resource_type` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resource_type`
--

INSERT INTO `resource_type` (`id`, `name`) VALUES
(1, 'sand'),
(2, 'clay'),
(3, 'metal'),
(4, 'water'),
(5, 'glass'),
(6, 'food'),
(7, 'energy');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`) VALUES
(1, 'Arnoldas', 'nikaflash@gmail.com', 'admin123'),
(2, 'user', 'vaznevicius@gmail.com', 'test'),
(3, 'testuser', 'test@email.com', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `user_resource`
--

CREATE TABLE `user_resource` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_resource`
--

INSERT INTO `user_resource` (`id`, `resource_id`, `user_id`, `value`) VALUES
(1, 1, 1, 500),
(2, 2, 1, 500),
(3, 3, 1, 500),
(4, 4, 1, 500),
(5, 5, 1, 500),
(6, 6, 1, 500),
(7, 7, 1, 500),
(8, 1, 2, 500),
(9, 2, 2, 500),
(10, 3, 2, 500),
(11, 4, 2, 500),
(12, 5, 2, 500),
(13, 6, 2, 500),
(14, 7, 2, 500),
(15, 1, 3, 500),
(16, 2, 3, 500),
(17, 3, 3, 500),
(18, 4, 3, 500),
(19, 5, 3, 500),
(20, 6, 3, 500),
(21, 7, 3, 500);

-- --------------------------------------------------------

--
-- Table structure for table `user_unit`
--

CREATE TABLE `user_unit` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `war_unit_type`
--

CREATE TABLE `war_unit_type` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `war_unit_type`
--

INSERT INTO `war_unit_type` (`id`, `type`) VALUES
(1, 'dron'),
(2, 'tank'),
(3, 'jeep');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `building_type`
--
ALTER TABLE `building_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `field_type`
--
ALTER TABLE `field_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `map_field`
--
ALTER TABLE `map_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fromid` (`fromid`),
  ADD KEY `toid` (`toid`);

--
-- Indexes for table `resource_type`
--
ALTER TABLE `resource_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_resource`
--
ALTER TABLE `user_resource`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_unit`
--
ALTER TABLE `user_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `war_unit_type`
--
ALTER TABLE `war_unit_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `building_type`
--
ALTER TABLE `building_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `field_type`
--
ALTER TABLE `field_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `map_field`
--
ALTER TABLE `map_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resource_type`
--
ALTER TABLE `resource_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_resource`
--
ALTER TABLE `user_resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user_unit`
--
ALTER TABLE `user_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `war_unit_type`
--
ALTER TABLE `war_unit_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`fromid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`toid`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
