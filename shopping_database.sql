-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2019 at 01:08 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shopping_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int(3) NOT NULL AUTO_INCREMENT,
  `item_id` int(3) NOT NULL,
  `cart_quantity` int(3) NOT NULL,
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `ctrg_id` int(3) NOT NULL AUTO_INCREMENT,
  `ctrg_name` varchar(20) NOT NULL,
  PRIMARY KEY (`ctrg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ctrg_id`, `ctrg_name`) VALUES
(1, 'Clothes'),
(2, 'Games'),
(3, 'Footwear');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ctrg name view`
--
CREATE TABLE IF NOT EXISTS `ctrg name view` (
`item_id` int(3)
,`item_name` text
,`item_price` int(4)
,`dfsd dfd` varchar(20)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `ctrg price view`
--
CREATE TABLE IF NOT EXISTS `ctrg price view` (
`item_price` decimal(32,0)
,`dfsd dfd` varchar(20)
);
-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `item_id` int(3) NOT NULL AUTO_INCREMENT,
  `item_name` text NOT NULL,
  `item_price` int(4) NOT NULL,
  `ctrg_id` int(3) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `cat_id` (`ctrg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `item_price`, `ctrg_id`) VALUES
(3, 'T-Shirt ', 200, 1),
(4, 'Shirt ', 400, 1),
(5, 'Shoes', 400, 3),
(6, 'Slippers', 250, 3),
(7, 'PUB-G', 800, 2),
(8, 'Counter Strike', 200, 2);

-- --------------------------------------------------------

--
-- Structure for view `ctrg name view`
--
DROP TABLE IF EXISTS `ctrg name view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ctrg name view` AS select `a`.`item_id` AS `item_id`,`a`.`item_name` AS `item_name`,`a`.`item_price` AS `item_price`,`c`.`ctrg_name` AS `dfsd dfd` from (`items` `a` join `category` `c` on((`a`.`ctrg_id` = `c`.`ctrg_id`))) WITH CASCADED CHECK OPTION;

-- --------------------------------------------------------

--
-- Structure for view `ctrg price view`
--
DROP TABLE IF EXISTS `ctrg price view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ctrg price view` AS select sum(`a`.`item_price`) AS `item_price`,`c`.`ctrg_name` AS `dfsd dfd` from (`items` `a` join `category` `c` on((`a`.`ctrg_id` = `c`.`ctrg_id`))) group by `c`.`ctrg_name`;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`ctrg_id`) REFERENCES `category` (`ctrg_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
