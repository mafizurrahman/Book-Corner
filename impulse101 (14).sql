-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2024 at 03:30 AM
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
-- Database: `impulse101`
--

-- --------------------------------------------------------

--
-- Table structure for table `bid`
--

CREATE TABLE `bid` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_image` blob NOT NULL,
  `lowest_bid` decimal(10,2) NOT NULL,
  `bid_ending_time` datetime NOT NULL,
  `farmer_phone` bigint(10) NOT NULL
) ;

--
-- Dumping data for table `bid`
--

INSERT INTO `bid` (`product_id`, `product_name`, `product_description`, `product_image`, `lowest_bid`, `bid_ending_time`, `farmer_phone`) VALUES
(9, 'Cristies', 'Only 2 copies available.\r\nThis book published in 1990. ', 0x494d472d303337362e6a7067, 12.00, '2024-11-30 15:41:00', 22222222);

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `bid_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `bid_amount` decimal(10,2) DEFAULT NULL,
  `farmer_phone` bigint(10) DEFAULT NULL,
  `buyer_address` varchar(50) NOT NULL
) ;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`bid_id`, `product_id`, `bid_amount`, `farmer_phone`, `buyer_address`) VALUES
(27, 9, 133.00, 22222222, '22222222'),
(28, 9, 400.00, 22222222, '261781213, 12th St. Fountain HIll'),
(29, 9, 90.00, 22222222, 'south2 street');

--
-- Triggers `bids`
--
DELIMITER $$
CREATE TRIGGER `prevent_bid_amount_decrease` BEFORE UPDATE ON `bids` FOR EACH ROW BEGIN
    IF NEW.bid_amount < OLD.bid_amount THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Bid amount can only be increased, not decreased';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `prevent_negative_bid` BEFORE INSERT ON `bids` FOR EACH ROW BEGIN
    IF NEW.bid_amount < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Hey,Bid amount cannot be negative';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `book_discussion_chat`
--

CREATE TABLE `book_discussion_chat` (
  `id` int(11) NOT NULL,
  `buyer_phone` varchar(15) DEFAULT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `file_path` varchar(255) DEFAULT NULL,
  `file_type` enum('image','file') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_discussion_chat`
--

INSERT INTO `book_discussion_chat` (`id`, `buyer_phone`, `message`, `timestamp`, `file_path`, `file_type`) VALUES
(1, '8328599272', 'he', '2024-11-10 17:13:43', NULL, NULL),
(2, '11111111', 'how are you?\r\n', '2024-11-10 17:15:38', NULL, NULL),
(3, '11111111', 'hi', '2024-11-10 17:20:20', 'uploads/logo.png', 'image'),
(4, '8328599272', 'Nice to meet you', '2024-11-10 17:25:16', 'uploads/logoq.png', 'image'),
(5, '11111111', 'Have you guys read this book?', '2024-11-11 00:00:39', '', ''),
(6, '11111111', 'hi\r\n', '2024-11-13 05:06:17', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `buyerregistration`
--

CREATE TABLE `buyerregistration` (
  `buyer_id` int(255) NOT NULL,
  `buyer_name` varchar(30) NOT NULL,
  `buyer_phone` bigint(10) NOT NULL,
  `buyer_addr` text NOT NULL,
  `buyer_comp` varchar(100) NOT NULL,
  `buyer_license` varchar(100) NOT NULL,
  `buyer_bank` int(16) NOT NULL,
  `buyer_pan` varchar(10) NOT NULL,
  `buyer_mail` varchar(20) NOT NULL,
  `buyer_username` varchar(20) NOT NULL,
  `buyer_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `buyerregistration`
--

INSERT INTO `buyerregistration` (`buyer_id`, `buyer_name`, `buyer_phone`, `buyer_addr`, `buyer_comp`, `buyer_license`, `buyer_bank`, `buyer_pan`, `buyer_mail`, `buyer_username`, `buyer_password`) VALUES
(15, 'Abhishek', 1234567890, ' Raj Uday 234', 'Elysian.org', '02082000', 2147483647, '1234567890', 'abhi@hmil.com', 'admin', 'm8bf5+Y='),
(16, 'Arpit', 7666610976, 'Bhat Mansion', 'Mafia Pvt Ltd', '99', 12345, '987', 'abcd@gmail.com', 'redhawk', 'm9HW6O8B'),
(17, 'calista', 2589631472, '4/2,rose building .wadala', 'apple', 'w3566908', 8947, '2436467897', 'rose21@gmail.com', 'melissa', 'nM7d+e0b41E='),
(18, 'Lokesh', 9029788504, 'SEC -13 , PALM BEACH ROAD', '', 'MAHARASHTRA', 0, '1234567890', 'abhi@hmil.com', 'lokesh', 'yw=='),
(19, 'ansh', 9819104641, 'fam', 'Elysian.org', 'MAHARASHTRA', 2147483647, '1234567890', 'abhi@hmil.com', 'ansh', 'y5CB'),
(20, 'bhabalomkar421', 8828071232, 'bj', 'c company', 'just **** off', 1, '1', 'xyz@domain.com', '501807', 'yw=='),
(21, 'Nazara', 987654321, '714 University Drive, Apt #017', 'The Arbors', '123', 2232122, '23671', 'naz@gmail.com', 'Naazara', 'z5aBvLk='),
(23, 'Mafizur Rahman', 2543407697, '1825 S 3RD ST APT 10006A', 'The Arbors', '123', 12345, '23671', 'rmafizur10@gmail.com', 'Mafizur_Rahman1', 'm8bf5+Y='),
(24, 'Swapnil', 123456781, '1825 S 3RD ST\r\n1006A', 'The Arbors', '', 2232122, '1122', 'das@gmail.com', 'swapnil', 'y5OAvA=='),
(27, 'Rahman', 1273829311, '1825 S 3RD ST APT 10006A', '', '', 1122333322, '1122', 'rmafizur120@gmail.co', 'es', 'y5OAvA=='),
(28, 'Chen', 1122334455, '714 University Drive, Apt# 017', '', '', 223212212, '0121231', '213rmafiz121ur10@gma', '12chen', 'y5OAvA=='),
(29, 'Elvin Li', 2123407697, '14 Prairie Drive, Apt# 017', '', '', 2147483647, '1122112', '342rmaf@gmail.com', 'Elvin', 'y5OAvA=='),
(30, 'Ratul', 8328599272, '702 Santee St.\r\nApt 4201', '', '', 0, '', 'mrahman123@pvamu.edu', 'ratul', 'y5CBug=='),
(31, 'Li', 11111111, '702 Santee St.\r\nApt 4201', '', '', 0, '', 'm1@pvamu.edu', 'Li', 'y5CBug=='),
(32, 'Max', 11111112, '714 University Drive, Apt# 017', '', '', 0, '', 'rmafizur102@gmail.co', 'MAX', 'y5CBug=='),
(33, 'Daisy', 11111113, '702 Santee St.\r\nApt 4201', '', '', 0, '', 'mrahm3an13@pvamu.edu', 'Daisy', 'y5CBug==');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `product_id` int(255) NOT NULL,
  `phonenumber` bigint(10) NOT NULL,
  `qty` int(10) NOT NULL DEFAULT 1,
  `subtotal` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`product_id`, `phonenumber`, `qty`, `subtotal`) VALUES
(32, 8169193101, 10, 10),
(23, 1273829311, 1250, 56),
(43, 1122334455, 3, 30),
(23, 1122334455, 1, 56),
(48, 8328599271, 1, 22),
(50, 8328599271, 1, 34),
(52, 11111113, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_title` varchar(100) NOT NULL
) ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Educational'),
(2, 'Business'),
(3, 'Romantic');

-- --------------------------------------------------------

--
-- Table structure for table `debate_registrations`
--

CREATE TABLE `debate_registrations` (
  `id` int(11) NOT NULL,
  `debate_id` int(11) NOT NULL,
  `buyer_phone` varchar(15) NOT NULL,
  `side` enum('A','B') NOT NULL,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `debate_registrations`
--

INSERT INTO `debate_registrations` (`id`, `debate_id`, `buyer_phone`, `side`, `registered_at`) VALUES
(1, 1, '8328599272', 'A', '2024-11-10 17:53:53'),
(2, 1, '11111111', 'A', '2024-11-10 17:54:45'),
(3, 1, '11111112', 'B', '2024-11-10 17:57:38'),
(4, 1, '11111113', 'B', '2024-11-10 17:59:18'),
(5, 2, '11111113', 'A', '2024-11-10 18:10:16'),
(6, 2, '11111111', 'A', '2024-11-13 05:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `debate_topics`
--

CREATE TABLE `debate_topics` (
  `id` int(11) NOT NULL,
  `topic_title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `side_a_name` varchar(100) NOT NULL,
  `side_b_name` varchar(100) NOT NULL,
  `debate_date` date NOT NULL,
  `debate_time` time NOT NULL,
  `max_participants` int(11) DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `debate_topics`
--

INSERT INTO `debate_topics` (`id`, `topic_title`, `description`, `link`, `side_a_name`, `side_b_name`, `debate_date`, `debate_time`, `max_participants`) VALUES
(1, 'Topic 1', 'Programming will vanish after 10 years', 'http://example.com', 'Pro', 'Con', '2024-11-15', '15:00:00', 2),
(2, 'Topic 2', 'SWOT analysis is not good for company', 'http://example.com', 'Agree', 'Disagree', '2024-11-16', '16:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `farmerregistration`
--

CREATE TABLE `farmerregistration` (
  `farmer_id` int(255) NOT NULL,
  `farmer_name` varchar(255) NOT NULL,
  `farmer_phone` bigint(10) NOT NULL,
  `farmer_address` text NOT NULL,
  `farmer_state` varchar(50) NOT NULL,
  `farmer_district` varchar(50) NOT NULL,
  `farmer_pan` varchar(10) NOT NULL,
  `farmer_bank` int(16) NOT NULL,
  `farmer_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `farmerregistration`
--

INSERT INTO `farmerregistration` (`farmer_id`, `farmer_name`, `farmer_phone`, `farmer_address`, `farmer_state`, `farmer_district`, `farmer_pan`, `farmer_bank`, `farmer_password`) VALUES
(1, 'Nazara', 8169193101, 'Mars', 'Texas', 'Dallas', '1234567890', 2147483647, 'm8bf5+Y='),
(3, 'Mehnaz', 8169193102, 'SEC -13 , PALM BEACH ROAD', 'Texas', 'Dallas', '123ABC', 45745425, 'nMPb4g=='),
(4, 'Ram', 8169193103, 'Moon', 'Texas', 'Dallas', '123ABC', 211324654, 'm8bf5+Y='),
(5, 'Lokesh', 8169193104, 'SEC -13 , PALM BEACH ROAD', 'Texas', 'Dallas', '1325355', 45745425, 'yw=='),
(6, 'Ramlal', 8169193105, 'Address 1', 'Texas', 'Houston', '1234567899', 2147483647, 'yw=='),
(7, 'Chirag', 8169193106, 'Address 2', 'Texas', 'Houston', '5341874510', 2147483647, 'yw=='),
(8, 'Gladina', 8169193107, 'Address 3', 'Texas', 'Houston', '6846516843', 2147483647, 'yw=='),
(9, 'neeta', 8169193108, 'add1', 'Texas', 'Dallas', '3263062', 56878613, 'yw=='),
(10, 'meeta', 8169193109, 'add2', 'Colorado', 'Denver', '2983473057', 2147483647, 'yw=='),
(11, 'melissa', 8169193110, 'add3', 'Colorado', 'Kullu', '65416541', 454586125, 'yw=='),
(12, 'jon', 8169193111, 'add5', 'Colorado', 'Chamba', '24685435', 248654352, 'yw=='),
(13, 'daenarys', 8169193112, 'add5', 'Colorado', 'Solan', '45674852', 3216415, 'yw=='),
(14, 'drogon', 8169193113, 'add7', 'Texas', 'Solan', '246856873', 2147483647, 'yw=='),
(16, 'Bran', 8169193114, 'add10\r\n', 'Texas', 'Lakshadweep', '3549685416', 65464851, 'yw=='),
(17, 'lyanna', 8169193115, 'add10', 'Texas', 'Lakshadweep', '2456435', 21544232, 'yw=='),
(18, 'catelyn', 8169193116, 'add115', 'MADHYA PRADESH', 'Rewa', '574542', 3846835, 'yw=='),
(19, 'Sansa', 8169193117, 'add 17', 'GOA', 'North Goa', '2456843', 3468651, 'yw=='),
(20, 'Rachel', 8169193118, 'add20', 'GOA', 'North Goa', '274635213', 27486513, 'yw=='),
(21, 'Joanna', 8169193119, 'add16', 'GOA', 'South Goa', '24756215', 24568536, 'yw=='),
(22, 'Arya', 8169193120, 'add17', 'GOA', 'South Goa', '2458742884', 249685547, 'yw=='),
(23, 'Andy', 8169193121, 'add19', 'HARYANA', 'Rohtak', '255451025', 54564684, 'yw=='),
(25, 'stark', 8169193122, 'add29', 'DAMAN AND DIU', 'Diu', '54584646.', 541564564, 'yw=='),
(26, 'hound', 8169193123, 'add23', 'DAMAN AND DIU', 'Daman', '2545498', 524845638, 'yw=='),
(27, 'Ryte Richard', 8169193124, 'add45', 'TAMIL NADU', 'Nagapattinam *', '54584636', 254685746, 'yw=='),
(29, 'John', 8169193125, 'Address 7', 'Texas', 'Dallas', '656', 168, 'yw=='),
(30, 'Rogan', 8169193126, 'Address56', 'JHARKAND', 'Garhwa *', '54664851', 6455415, 'yw=='),
(31, 'Swaarop', 8169193127, 'Address 23', 'JHARKAND', 'Garhwa *', '6416545', 4646544, 'yw=='),
(32, 'Jesudas', 8169193128, 'Address 56', 'JHARKAND', 'Palamu', '4515214', 544613515, 'yw=='),
(33, 'same', 8169193129, 'addeees', 'JAMMU AND KASHMIR', 'Kupwara', '1232122121', 121321, 'yw=='),
(34, 'Mitesh Chhadva', 8169193130, '19/502,Fam chs ltd\r\nSector 11  koparkhairne', 'MAHARASHTRA', 'Nandurbar *', '656861651', 5465415, 'yw=='),
(35, 'Manali', 8169193131, '19/502,Fam chs ltd\r\n', 'JAMMU AND KASHMIR', 'Kupwara', '656861651', 5465415, 'yw=='),
(36, 'Manya', 8169193132, '19/502,Fam chs \r\nameri', 'JAMMU AND KASHMIR', 'Baramula', '6568616510', 54654101, 'yw=='),
(37, 'surli', 8169193133, '19/502,Fam chs \r\nameri', 'JAMMU AND KASHMIR', 'Baramula', '6568616510', 54654101, 'yw=='),
(38, 'asha', 8169193134, 'superman', 'JAMMU AND KASHMIR', 'Srinagar', '123123123', 3213213, 'yw=='),
(39, 'asjij', 8169193135, 'ameica', 'JAMMU AND KASHMIR', 'Srinagar', '121212121', 1212, 'yw=='),
(40, 'arama', 8169193136, 'australia', 'JAMMU AND KASHMIR', 'Badgam', '121212', 121211, 'yw=='),
(41, 'andami', 8169193137, 'askkkey', 'JAMMU AND KASHMIR', 'Badgam', '121218', 12127, 'yw=='),
(42, 'human', 8169193138, 'ansh', 'JAMMU AND KASHMIR', 'Badgam', '121218', 12127, 'yw=='),
(43, 'varma', 8169193139, 'jupiter', 'JAMMU AND KASHMIR', 'Badgam', '12131311', 22, 'yw=='),
(44, 'ashhhish', 8169193140, 'asmaan', 'HIMACHAL PRADESH', 'Chamba', '1212222222', 2147483647, 'yw=='),
(45, 'ashhhish', 8169193141, 'asmaan', 'HIMACHAL PRADESH', 'Chamba', '1212222222', 2147483647, 'yw=='),
(46, 'ruchi', 8169193142, 'juhinagar', 'HIMACHAL PRADESH', 'Kangra', '22', 1, 'yw=='),
(47, 'name', 8169193143, 'toonpur', 'HIMACHAL PRADESH', 'Kangra', '11', 11, 'yw=='),
(48, 'kargil', 8169193144, 'toonpur super', 'HIMACHAL PRADESH', 'Lahul & Spiti', '1212dw11', 223, 'yw=='),
(49, 'admi', 8169193145, 'asam\r\n', 'HIMACHAL PRADESH', 'Kangra', '121211', 222, 'yw=='),
(50, 'robot', 8169193146, 'asa1', 'HIMACHAL PRADESH', 'Lahul & Spiti', '12121', 2221, 'yw=='),
(51, 'robot shah', 8169193147, 'arya', 'HIMACHAL PRADESH', 'Lahul & Spiti', '12121', 2221, 'yw=='),
(52, 'robot farmer', 8169193148, 'doremon', 'HIMACHAL PRADESH', 'Kullu', '12121', 2221189, 'yw=='),
(53, 'robot schema', 8169193149, 'doremon nobita', 'HIMACHAL PRADESH', 'Kullu', '12129+', 222118, 'yw=='),
(54, 'ashhhish chanchali', 8169193150, 'asmeta', 'HIMACHAL PRADESH', 'Mandi', '1212222222', 2147483647, 'yw=='),
(55, 'ashhhish chanchali', 8169193151, 'asmeta', 'HIMACHAL PRADESH', 'Mandi', '1212222222', 2147483647, 'yw=='),
(56, 'arpita', 8169193152, 'asmeta upra', 'HIMACHAL PRADESH', 'Hamirpur', '1212222222', 2147483647, 'yw=='),
(57, 'robot aunty', 8169193153, 'iten', 'HIMACHAL PRADESH', 'Una', '121129', 22219, 'yw=='),
(58, 'Kira', 8169193154, 'add', 'ARUNACHAL PRADESH', 'Upper Siang *', '12', 1, 'yZE='),
(59, 'Arpit', 8169193155, 'Lenyadri Tower', 'MAHARASHTRA', 'Thane', '111', 999, 'yw=='),
(60, 'Raghu', 8169193156, 'West City', 'ANDHRA PRADESH', 'Adilabad', '1234', 4321, 'yw=='),
(61, 'Raghav', 8169193157, '9 Palk Street', 'CHANDIGARH', 'Chandigarh', '109', 991, 'yw=='),
(62, 'Keshav', 8169193158, 'Sarojnagar', 'GOA', 'North Goa', '342', 332, 'yw=='),
(63, 'Suraj', 8169193159, 'Moraj', 'CHHATTISGARH', 'Kawardha *', '789', 987, 'yw=='),
(64, 'Midoriya', 8169193160, 'Hosu', 'DAMAN AND DIU', 'Diu', '191', 818, 'yw=='),
(65, 'Dhole', 8169193161, 'North Silvasa', 'DADRA AND NAGAR HAVELI', 'Dadra & Nagar Haveli', '777', 666, 'yw=='),
(66, 'Yash', 8169193162, 'Ambika Heights', 'GOA', 'South Goa', '537', 361, 'yw=='),
(67, 'Karan', 8169193163, 'Nilgiri Gardens', 'PUDUCHERRY', 'Yanam', '2014', 1014, 'yw=='),
(68, 'Arun', 8169193164, 'Harbour View', 'JAMMU AND KASHMIR', 'Punch', '1024', 3014, 'yw=='),
(69, 'Khan', 8169193165, 'SBI colony', 'ARUNACHAL PRADESH', 'Tawang', '2048', 1048, 'yw=='),
(70, 'Kahn', 8169193166, 'Baba Niwas', 'MADHYA PRADESH', 'Sheopur *', '4096', 5096, 'yw=='),
(71, 'Iqbal', 8169193167, 'Hiranandani', 'HARYANA', 'Panchkula *', '2047', 1047, 'yw=='),
(72, 'Archit', 8169193168, 'Army Colony', 'DELHI', 'Central *', '8192', 7192, 'yw=='),
(73, 'Kumar', 8169193169, 'Masjid Rd', 'DELHI', 'West *', '1192', 2192, 'yw=='),
(74, 'Eeshan', 8169193170, 'BARC Colony', 'GOA', 'South Goa', '2192', 3192, 'yw=='),
(75, 'Gavin', 8169193171, 'Oxfordshire', 'DELHI', 'South *', '3192', 4192, 'yw=='),
(76, 'Meg', 8169193172, 'Chelsea', 'TAMIL NADU', 'Madurai', '343', 433, 'yw=='),
(77, 'Hodaka', 8169193173, 'Touto', 'JAMMU AND KASHMIR', 'Rajauri', '1729', 2729, 'yw=='),
(78, 'Rohan', 8169193174, 'Spurs', 'BIHAR', 'Purnia', '1777', 7171, 'yw=='),
(79, 'Navin', 8169193175, 'Hoenn', 'GOA', 'North Goa', '3412', 5020, 'yw=='),
(80, 'Ansh', 8169193176, 'Liverpool', 'CHANDIGARH', 'Chandigarh', '7129', 8100, 'yw=='),
(81, 'Umesh', 8169193177, 'Everton', 'DELHI', 'North West *', '6654', 7896, 'yw=='),
(82, 'Bhuvan', 8169193178, 'Leicester', 'HIMACHAL PRADESH', 'Shimla', '1010', 2020, 'yw=='),
(83, 'Pavan', 8169193179, 'Munich', 'JHARKAND', 'ORISSA', '9291', 7374, 'yw=='),
(84, 'Suman', 8169193180, 'Watford', 'GOA', 'South Goa', '9293', 8453, 'yw=='),
(85, 'Ashish', 8169193181, 'Crystal Palace', 'KERALA', 'Kasaragod', '4545', 5454, 'yw=='),
(86, 'Lal', 8169193182, 'West Ham', 'KARNATAKA', 'Belgaum', '9999', 9998, 'yw=='),
(87, 'Ranvir', 8169193183, 'Newcastle', 'MAHARASHTRA', 'Jalna', '8818', 2818, 'yw=='),
(88, 'Suresh', 8169193184, 'Real Madrid', 'MEGHALAYA', 'West Garo Hills', '9001', 8017, 'yw=='),
(89, 'Anish', 8169193185, 'Bournmouth', 'PUDUCHERRY', 'Yanam', '5543', 2999, 'yw=='),
(90, 'Lahiru', 8169193186, 'Barcelona', 'GUJARAT', 'Kachchh', '3139', 8199, 'yw=='),
(91, 'Jasmeet', 8169193187, 'Manchester city', '0', 'Kachchh', '7777', 6666, 'yw=='),
(92, 'bhabalomkar421', 8828071232, '1', 'MADHYA PRADESH', 'Sheopur *', '1', 1, 'yw=='),
(95, 'Chy', 2543407692, '714 University Drive, Apt# 017         ', '0', 'Select District', '2367111233', 983374326, 'y5OAvA=='),
(96, 'Das', 112233445, 'Kagabola, Kagabala, Moulvibazar Sadar    ', 'Texas', 'Houston', '012123321', 214748364, 'y5OAvA=='),
(97, 'Antora', 111122223, 'prairieveiw', 'Texas', 'Garland', '789453', 278913, 'y5ODvw=='),
(98, 'Marry Kim', 11111111, '1825 S 3RD ST1006A  ', 'Texas', 'Dallas', '2543407692', 2147483647, 'l8PA9+MAvFAwUg=='),
(99, 'Mafizur Rahman', 2543407697, '1825 S 3RD ST APT 10006A', 'Texas', 'Austin', '012986544', 1298472, 'y5OAvA=='),
(100, 'Tom', 2543107697, '700 University Drive', 'Texas', 'Houston', '12345', 0, 'y5CBug=='),
(101, 'Mafizur Rahman', 8328599271, '1825 S 3RD ST APT 10006A', 'Texas', 'Houston', '12', 12345, 'y5CBug=='),
(102, 'Swathi', 22222222, '700 University Drive', 'Texas', 'Houston', '', 0, 'y5CBug==');

-- --------------------------------------------------------

--
-- Table structure for table `meet_and_greet`
--

CREATE TABLE `meet_and_greet` (
  `id` int(11) NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `meet_link` varchar(255) NOT NULL,
  `meet_date` date DEFAULT NULL,
  `meet_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `phonenumber` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meet_and_greet`
--

INSERT INTO `meet_and_greet` (`id`, `farmer_id`, `title`, `description`, `meet_link`, `meet_date`, `meet_time`, `created_at`, `phonenumber`) VALUES
(2, 102, 'wdw', 'wdq', 'https://www.google.com', '2024-11-09', '22:38:00', '2024-11-10 16:36:10', ''),
(3, 102, 'Monday Night Coffee with Swathi', 'Hey, lets meet for my new book \"BY BORN\"', 'https://www.google.com', '2024-11-29', '23:45:00', '2024-11-10 16:39:11', ''),
(4, 102, 'Thursday Night Book', 'Hello  new book coming!!!!!!!!!!!!1', 'https://www.google.com', '2024-11-28', '11:11:00', '2024-11-13 05:11:27', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `qty` int(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `delivery` varchar(10) NOT NULL,
  `phonenumber` bigint(10) NOT NULL,
  `total` int(10) NOT NULL,
  `payment` varchar(10) NOT NULL,
  `buyer_phonenumber` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `product_id`, `qty`, `address`, `delivery`, `phonenumber`, `total`, `payment`, `buyer_phonenumber`) VALUES
(55, 23, 1, ' Raj Uday 234', 'Buyer', 8169193101, 56, 'cod', 1234567890),
(56, 28, 1, ' Raj Uday 234', 'Buyer', 8169193101, 45, 'cod', 1234567890),
(57, 31, 1, 'I am Hungry', 'Buyer', 8169193101, 25, 'cod', 1234567890),
(58, 3, 2, ' Raj Uday 234', 'Farmer', 8169193101, 10, 'paytm', 1234567890),
(60, 32, 1, 'Working', 'Buyer', 8169193101, 10, 'cod', 1234567890),
(61, 38, 1, '714 University Drive, Apt #017', 'Farmer', 1234567890, 12, 'paytm', 987654321),
(62, 39, 1, '1825 S 3RD ST APT 10006A', 'Courier', 2543407697, 123, 'paytm', 2543407697),
(63, 41, 1, '1825 S 3RD ST APT 10006A', 'Farmer', 2543407692, 123, 'cod', 1273829311),
(66, 43, 1, '714 University Drive, Apt# 017', 'Farmer', 112233445, 10, 'paytm', 1122334455),
(67, 44, 1, 'College Drive, Apt# 017', 'Courier', 11111111, 12, 'cod', 1122334455),
(68, 45, 1, '714 University Drive, Apt# 017', 'Farmer', 2543407697, 12, 'cod', 1122334455),
(69, 44, 1, '714 University Drive, Apt# 017', 'Farmer', 11111111, 12, 'cod', 1122334455),
(70, 44, 1, '714 University Drive, Apt# 017', 'Farmer', 11111111, 12, 'cod', 1122334455),
(71, 45, 1, '1825 S 3RD ST APT 10006A', 'Farmer', 2543407697, 12, 'cod', 2543407697),
(72, 45, 1, '1825 S 3RD ST APT 10006A', 'Buyer', 2543407697, 12, 'paytm', 2543407697),
(73, 52, 1, '12st. tx, usa', 'Farmer', 22222222, 10, 'paytm', 22222222),
(74, 52, 1, '122 st', 'Farmer', 22222222, 10, 'cod', 22222222),
(75, 50, 1, '702 Santee St.\r\nApt 4201', 'Farmer', 8328599271, 34, 'cod', 8328599272);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `farmer_fk` int(255) NOT NULL,
  `product_title` varchar(100) NOT NULL,
  `product_cat` varchar(100) NOT NULL,
  `product_type` varchar(100) NOT NULL,
  `product_expiry` varchar(25) NOT NULL,
  `product_image` text NOT NULL,
  `product_stock` int(100) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_keywords` text NOT NULL,
  `product_delivery` varchar(5) NOT NULL
) ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `farmer_fk`, `product_title`, `product_cat`, `product_type`, `product_expiry`, `product_image`, `product_stock`, `product_price`, `product_desc`, `product_keywords`, `product_delivery`) VALUES
(47, 101, 'AI for Today', '1', 'Development', '', '978-3-030-90594-1.jpeg', 12, 10, 'This is about software engineering.', 'best book', 'yes'),
(48, 101, 'Software engineering', '1', 'programming', '', 's_hero2x.jpeg', 2, 22, 'Programming book', 'best', 'yes'),
(49, 101, 'Insiider edge', '2', 'Marketing Strategy', '', 'The-Insiders-Edge-view-442x705.jpg', 12, 43, 'Insider edge good for business', 'good', 'yes'),
(50, 101, 'Thinking and Grow', '2', 'Finance', '', 'think-and-grow-rich-book.jpg', 4, 34, 'Start Thinking and Grow Business is the best book for business.', 'finance', 'yes'),
(51, 102, 'Reached Sam', '3', 'Teenage', '', 'sam-1663176590.avif', 32, 12, 'It is a romantic book', 'teen', 'yes'),
(52, 102, 'Yours', '3', ' Love', '', 'Technically-Yours-by-Denise-Williams--romance-books-121423-61cae6f7114d48768d32a7c38ba1341b.jpg', 4, 10, 'Yours is a wonderful book', 'love', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_option` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`) VALUES
(1, 'Who wrote the play \"Hamlet\"?', 'Charles Dickens', 'William Shakespeare', 'Jane Austen', 'Mark Twain', 'B'),
(2, 'In George Orwell\'s novel \"1984,\" what is the name of the Party\'s leader?', 'Big Brother', 'The Chief', 'The Boss', 'The Commander', 'A'),
(3, 'Which novel begins with the line \"Call me Ishmael\"?', 'The Great Gatsby', 'Moby-Dick', 'To Kill a Mockingbird', 'Frankenstein', 'B'),
(4, 'In J.R.R. Tolkien\'s \"The Lord of the Rings,\" what is the name of Frodo\'s loyal friend who accompanies him to Mordor?', 'Legolas', 'Aragorn', 'Samwise', 'Gandalf', 'C'),
(5, 'Who is the author of \"Pride and Prejudice\"?', 'Emily Brontë', 'Charlotte Brontë', 'Jane Austen', 'Virginia Woolf', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

CREATE TABLE `quiz_results` (
  `id` int(11) NOT NULL,
  `buyer_phone` varchar(20) NOT NULL,
  `buyer_name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `quiz_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `time_taken` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_results`
--

INSERT INTO `quiz_results` (`id`, `buyer_phone`, `buyer_name`, `score`, `quiz_date`, `time_taken`) VALUES
(1, '11111111', 'Li', 1, '2024-11-11 00:21:29', 155),
(2, '11111111', 'Li', 3, '2024-11-11 00:22:06', 14),
(3, '11111112', 'Max', 2, '2024-11-11 00:23:37', 14),
(4, '22222222', 'Unknown User', 0, '2024-11-11 00:36:43', 97),
(5, '22222222', 'Unknown User', 1, '2024-11-11 00:39:04', 16),
(6, '11111113', 'Daisy', 0, '2024-11-11 00:40:18', 13),
(7, '11111111', 'Li', 3, '2024-11-13 05:09:42', 24);

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `vname` varchar(50) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `noofvisitors` int(60) NOT NULL,
  `phone` bigint(11) NOT NULL,
  `visitorinformation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`vname`, `reason`, `noofvisitors`, `phone`, `visitorinformation`) VALUES
('Shauke', 'To have fun', 1, 112233445, 'we are police'),
('nazara', 'to see products', 2, 112233445, 'we are student'),
('nazara', 'to see products', 2, 112233445, 'we are student'),
('nazara', 'to see products', 9, 254, 'we are police'),
('Archana', 'To see tomato', 3, 112233445, 'we are coming from chicago'),
('', '', 0, 0, ''),
('marjan', 'nothing', 1, 1122334223, 'student'),
('Doglus', 'nothing', 234, 112233445, 'we are coming from chicago'),
('Daisy', 'To see the cultivation ', 12, 11111111, 'We are coming for research'),
('Maliha Rahman12', 'To investigate fruit cultivation', 2, 112233445, 'We are from california state university.');

--
-- Triggers `visitor`
--
DELIMITER $$
CREATE TRIGGER `CheckVisitorNameBeforeInsert` BEFORE INSERT ON `visitor` FOR EACH ROW BEGIN
    DECLARE msg VARCHAR(100);

    IF NEW.vname REGEXP '^[0-9]+$' THEN
        SET msg = 'Visitor name cannot contain only numeric characters';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `MaxVisitor` BEFORE INSERT ON `visitor` FOR EACH ROW BEGIN
     DECLARE number_of_visitor INTEGER;
     DECLARE msg varchar(100);
     SELECT count(noofvisitors) INTO number_of_visitor FROM visitor;
     IF number_of_visitor >= 9 THEN
     set msg ='It allows only less than or equal to 9 members to visit at any time';
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
     END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bid`
--
ALTER TABLE `bid`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bid_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `book_discussion_chat`
--
ALTER TABLE `book_discussion_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buyerregistration`
--
ALTER TABLE `buyerregistration`
  ADD PRIMARY KEY (`buyer_id`),
  ADD UNIQUE KEY `buyer_username` (`buyer_username`),
  ADD UNIQUE KEY `buyer_phone` (`buyer_phone`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `debate_registrations`
--
ALTER TABLE `debate_registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `debate_id` (`debate_id`);

--
-- Indexes for table `debate_topics`
--
ALTER TABLE `debate_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmerregistration`
--
ALTER TABLE `farmerregistration`
  ADD UNIQUE KEY `farmer_id` (`farmer_id`);

--
-- Indexes for table `meet_and_greet`
--
ALTER TABLE `meet_and_greet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`farmer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `phonenumber` (`phonenumber`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `farmer_fk` (`farmer_fk`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bid`
--
ALTER TABLE `bid`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_discussion_chat`
--
ALTER TABLE `book_discussion_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `buyerregistration`
--
ALTER TABLE `buyerregistration`
  MODIFY `buyer_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debate_registrations`
--
ALTER TABLE `debate_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `debate_topics`
--
ALTER TABLE `debate_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `farmerregistration`
--
ALTER TABLE `farmerregistration`
  MODIFY `farmer_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `meet_and_greet`
--
ALTER TABLE `meet_and_greet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `bid` (`product_id`);

--
-- Constraints for table `debate_registrations`
--
ALTER TABLE `debate_registrations`
  ADD CONSTRAINT `debate_registrations_ibfk_1` FOREIGN KEY (`debate_id`) REFERENCES `debate_topics` (`id`);

--
-- Constraints for table `meet_and_greet`
--
ALTER TABLE `meet_and_greet`
  ADD CONSTRAINT `meet_and_greet_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `farmerregistration` (`farmer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
