-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2025 at 03:18 PM
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
(6, 16, NULL, 'Jane Smith', 'user.png', 'Great post!', NULL, NULL, 1, 0, '2024-12-27 14:18:28', NULL),
(8, 16, 6, 'Alice', 'user.png', 'Thank you!', NULL, NULL, 1, 0, '2024-12-27 14:23:32', NULL),
(9, 16, 6, 'Alex', 'user.png', 'Thank you!', NULL, NULL, 1, 0, '2024-12-27 14:24:43', NULL),
(10, 16, 6, 'Jhon', 'user.png', 'Lorem Ipsum dollor sit summit', NULL, NULL, 1, 0, '2024-12-27 14:25:27', NULL),
(11, 25, NULL, 'Tousa Sorkar', 'towa.jpg', 'Nicee ❤️❤️❤️❤️', 'user.png', NULL, 1, 0, '2025-01-09 18:38:10', NULL),
(12, 25, 11, 'Sreyshe Sarkar', 'srayshe.jpg', 'hello', 'user.png', NULL, 1, 0, '2025-01-09 18:38:10', NULL);

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

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `comment_id`, `user_name`, `created_at`) VALUES
(2, 16, NULL, 'Bob', '2024-12-27 14:27:38'),
(3, 16, NULL, 'Jhon', '2024-12-27 14:28:06'),
(4, 16, NULL, 'Rahul', '2024-12-27 14:28:58'),
(5, NULL, 6, 'Charlie', '2024-12-27 14:30:10');

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
(11, 'Majadul Islam Pallab', 'user.png', '', '[]', '[\"676c4abf529ee2.79455224.jpg\"]', 1, 0, '2024-12-25 18:11:11', NULL),
(12, 'Majadul Islam Pallab', 'user.png', '', '[]', '[\"676c4b07cf67d2.38350432.jpg\",\"676c4b07cfae01.75795673.jpg\",\"676c4b07cfebf7.25739722.jpg\",\"676c4b07d026d0.41270901.jpg\"]', 1, 0, '2024-12-25 18:12:23', NULL),
(13, 'Majadul Islam Pallab', 'user.png', '', '[]', '[\"676c4b161fc6f2.42690868.jpg\",\"676c4b16200070.37829591.jpg\",\"676c4b16204301.98121907.jpg\",\"676c4b16208f87.93079496.jpg\"]', 1, 0, '2024-12-25 18:12:38', NULL),
(14, 'Majadul Islam Pallab', 'user.png', '', '[\"676c4b3e48dd31.47139955.mp4\",\"676c4b3e492fb7.92082734.mp4\",\"676c4b3e498938.60849932.mp4\"]', '[\"676c4b3e475c01.51990517.jpg\",\"676c4b3e479ed1.36918555.jpg\",\"676c4b3e4834a8.26191792.jpg\",\"676c4b3e488956.80206119.jpg\"]', 1, 0, '2024-12-25 18:13:18', NULL),
(15, 'GadgetHub', 'user.png', 'gsdfg', '[\"676c4e8a01eee2.43903332.mp4\",\"676c4e8a022a08.69766449.mp4\",\"676c4e8a026264.81774709.mp4\"]', '[\"676c4e8a00fa84.21505364.jpg\",\"676c4e8a012d02.49373467.jpg\",\"676c4e8a016e90.39740548.jpg\",\"676c4e8a01abc7.90528047.jpg\"]', 1, 0, '2024-12-25 18:27:22', NULL),
(16, 'GadgetHub', 'user.png', 'gsdfg', '[\"676c4eaaa61d30.84610775.mp4\",\"676c4eaaa66d74.20316105.mp4\",\"676c4eaaa6d251.19088843.mp4\"]', '[\"676c4eaaa4f625.65957211.jpg\",\"676c4eaaa52a85.26521678.jpg\",\"676c4eaaa58138.11771103.jpg\",\"676c4eaaa5c8f7.45468456.jpg\"]', 1, 0, '2024-12-25 18:27:54', NULL),
(17, 'Mohammad Torikul Mula Sujan', 'user.png', '', '[\"676c4f58a524d9.78841631.mp4\"]', '[]', 1, 0, '2024-12-25 18:30:48', NULL),
(18, 'মাজেদুল ইসলাম পল্লব', 'user.png', 'Hello', '[]', '[]', 1, 0, '2024-12-26 13:22:48', NULL),
(19, 'মাজেদুল ইসলাম পল্লব', 'user.png', '', '[]', '[\"676d5b13b799f5.22556069.jpg\",\"676d5b13b7dde5.74058300.jpg\",\"676d5b13b82db9.20558005.jpg\",\"676d5b13b86802.44454466.jpg\"]', 1, 0, '2024-12-26 13:33:07', NULL),
(20, 'Rakib Bhai Jinda bad', '1735485454_1191809018_5601784293.jpg', 'bangla amar jononi amr', '[]', '[\"6771680e1321d5.52925391.jpg\",\"6771680e135c47.40574775.jpg\",\"6771680e139a31.53099432.jpg\"]', 1, 0, '2024-12-29 15:17:34', NULL),
(21, 'Kitchen Cleaning', '1735488110_2034063311_7152096834.jpg', 'Hello \r\ngelo \r\ntheko', '[]', '[]', 1, 0, '2024-12-29 16:01:50', NULL),
(22, 'Sunny Maruf', '1735655449_1913643578_5793482106.jpg', 'Hello \r\nbangladesh', '[\"67740019769391.45759307.mp4\"]', '[\"67740019760f24.84859445.jpg\",\"67740019765199.56608268.jpg\"]', 1, 0, '2024-12-31 14:30:49', NULL),
(23, 'মাজেদুল ইসলাম পল্লব', '1735735330_652982029_2647918503.jpg', '', '[]', '[]', 1, 0, '2025-01-01 12:42:10', NULL),
(24, 'মাজেদুল ইসলাম পল্লব', '1735735463_1660451897_5167843902.jpg', '', '[]', '[\"677538a7c05148.69034728.jpg\"]', 1, 0, '2025-01-01 12:44:23', NULL),
(25, 'Majadul Islam Pallab', '1735916034_1856459865_1672035498.jpg', '', '[]', '[\"6777fa02a3e000.12546799.jpg\",\"6777fa02a429b0.30102030.jpg\"]', 1, 0, '2025-01-03 14:53:54', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
