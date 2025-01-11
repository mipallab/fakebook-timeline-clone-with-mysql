-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2025 at 08:05 AM
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
-- Database: `clonefakebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `profile_picture_url` varchar(500) DEFAULT NULL,
  `comment_text` text DEFAULT NULL,
  `comment_image` varchar(225) DEFAULT NULL,
  `comment_video_url` varchar(500) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `trash` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `parent_comment_id`, `name`, `profile_picture_url`, `comment_text`, `comment_image`, `comment_video_url`, `status`, `trash`, `created_at`, `updated_at`) VALUES
(11, 25, NULL, 'Tousa Sorkar', 'towa.jpg', 'Nicee ❤️❤️❤️❤️', 'user.png', NULL, 1, 0, '2025-01-09 18:38:10', NULL),
(12, 25, 11, 'Sreyshe Sarkar', 'srayshe.jpg', 'hello', 'user.png', NULL, 1, 0, '2025-01-09 18:38:10', NULL),
(13, 26, NULL, 'Ananto Roy', '1736574143_919148949_7831046259.png', 'seii broo...', NULL, '1736576645_420862719_0431782569.mp4', 1, 0, '2025-01-11 05:42:23', NULL),
(14, 26, NULL, 'Majadul Islam Pallab', '1736574659_660114893_3029654817.png', 'seibro', NULL, NULL, 1, 0, '2025-01-11 05:50:59', NULL),
(23, 27, NULL, 'রাহিমুল ইসলাম সৌরভ।', '1736576039_1178551238_9460237518.jpg', 'সেই।।কড়া।। ', NULL, NULL, 1, 0, '2025-01-11 06:13:59', NULL),
(24, 27, NULL, 'রাহিমুল ইসলাম সৌরভ।', '1736576311_785919180_3285617490.jpg', '', '1736576311_914142075_3870249165.jpg', NULL, 1, 0, '2025-01-11 06:18:31', NULL),
(25, 27, NULL, 'রাহিমুল ইসলাম সৌরভ।', '1736576532_1361659896_9734621508.jpg', '', '1736576532_1061776062_3084751926.png', NULL, 1, 0, '2025-01-11 06:22:12', NULL),
(26, 27, NULL, 'Majadul Islam Pallab', '1736576645_1323709174_4325671809.jpg', '', '1736576645_1947753728_9673281540.png', '1736576645_420862719_0431782569.mp4', 1, 0, '2025-01-11 06:24:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `profile_picture_url` varchar(500) NOT NULL,
  `post_text` text DEFAULT NULL,
  `post_video_url` varchar(500) DEFAULT NULL,
  `post_image` varchar(500) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `trash` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `profile_picture_url`, `post_text`, `post_video_url`, `post_image`, `status`, `trash`, `created_at`, `updated_at`) VALUES
(10, 'Majadul Islam Pallab', 'user.png', 'Hello bangladesh', '[]', '[]', 1, 0, '2024-12-25 18:09:12', NULL),
(17, 'Mohammad Torikul Mula Sujan', 'user.png', '', '[\"676c4f58a524d9.78841631.mp4\"]', '[]', 1, 0, '2024-12-25 18:30:48', NULL),
(18, 'মাজেদুল ইসলাম পল্লব', 'user.png', 'Hello', '[]', '[]', 1, 0, '2024-12-26 13:22:48', NULL),
(19, 'মাজেদুল ইসলাম পল্লব', 'user.png', '', '[]', '[\"676d5b13b799f5.22556069.jpg\",\"676d5b13b7dde5.74058300.jpg\",\"676d5b13b82db9.20558005.jpg\",\"676d5b13b86802.44454466.jpg\"]', 1, 0, '2024-12-26 13:33:07', NULL),
(20, 'Rakib Bhai Jinda bad', '1735485454_1191809018_5601784293.jpg', 'bangla amar jononi amr', '[]', '[\"6771680e1321d5.52925391.jpg\",\"6771680e135c47.40574775.jpg\",\"6771680e139a31.53099432.jpg\"]', 1, 0, '2024-12-29 15:17:34', NULL),
(21, 'Kitchen Cleaning', '1735488110_2034063311_7152096834.jpg', 'Hello \r\ngelo \r\ntheko', '[]', '[]', 1, 0, '2024-12-29 16:01:50', NULL),
(22, 'Sunny Maruf', '1735655449_1913643578_5793482106.jpg', 'Hello \r\nbangladesh', '[\"67740019769391.45759307.mp4\"]', '[\"67740019760f24.84859445.jpg\",\"67740019765199.56608268.jpg\"]', 1, 0, '2024-12-31 14:30:49', NULL),
(23, 'মাজেদুল ইসলাম পল্লব', '1735735330_652982029_2647918503.jpg', '', '[]', '[]', 1, 0, '2025-01-01 12:42:10', NULL),
(24, 'মাজেদুল ইসলাম পল্লব', '1735735463_1660451897_5167843902.jpg', '', '[]', '[\"677538a7c05148.69034728.jpg\"]', 1, 0, '2025-01-01 12:44:23', NULL),
(25, 'Majadul Islam Pallab', '1735916034_1856459865_1672035498.jpg', '', '[]', '[\"6777fa02a3e000.12546799.jpg\",\"6777fa02a429b0.30102030.jpg\"]', 1, 0, '2025-01-03 14:53:54', NULL),
(26, 'Amdadul Haque', '1736519178_1556109210_7591342068.png', 'Hii fakebook. কী অবস্থা \r\nকী খবর।', '[]', '[\"c691f2c9-dff6-4469-b353-5f0bb081e97a.webp\"]', 1, 0, '2025-01-10 14:26:18', NULL),
(27, 'মাজেদুল ইসলাম পল্লব', '1736575870_898193359_9670431258.png', 'কী খবর বন্ধুরা। কী অবস্থা সবার।', '[]', '[]', 1, 0, '2025-01-11 06:11:10', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
