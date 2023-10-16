-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 16, 2023 at 12:16 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `id_admin`, `deleted_at`, `created_at`) VALUES
(16, 'google', 2, '2023-10-15 21:47:26', '2023-10-15 22:08:01'),
(17, 'Facebook', 2, '2023-10-15 22:09:40', '2023-10-15 22:09:40'),
(18, 'meta', 2, '2023-10-15 22:38:53', '2023-10-15 22:38:53'),
(19, 'alikar2', 2, '2023-10-15 23:22:53', '2023-10-15 23:22:53');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `id_invite` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `id_invite`, `status`, `time`) VALUES
(8, 37, 'invite', '2023-10-15 22:24:31'),
(9, 38, 'invite', '2023-10-15 22:39:06'),
(10, 37, 'valide', '2023-10-15 22:39:46'),
(11, 39, 'invite', '2023-10-15 23:23:36'),
(12, 39, 'valide', '2023-10-15 23:24:19');

-- --------------------------------------------------------

--
-- Table structure for table `invite`
--

CREATE TABLE `invite` (
  `id` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_emp` int(11) NOT NULL,
  `id_cmp` int(11) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'invite'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invite`
--

INSERT INTO `invite` (`id`, `id_admin`, `id_emp`, `id_cmp`, `status`) VALUES
(37, 2, 47, 17, 'valide'),
(38, 2, 48, 17, 'valide'),
(39, 2, 49, 19, 'valide');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `profile` varchar(10) NOT NULL,
  `id_admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `profile`, `id_admin`) VALUES
(2, 'Mohamed', 'Kandad', 'Tersea.admin@gmail.com', 'Tersea@@123', 'admin', NULL),
(35, 'Mohamed22', 'Kandad22', 'kandad@gmail.com', '123456', 'admin', 2),
(47, 'Mohamed22', 'Kandad', 'kandadkljk@gmail.com', '123333', 'emp', NULL),
(48, 'Mohamed', 'Kandad', 'kandadlll@gmail.com', '', 'emp', NULL),
(49, 'chafik', 'jhjh', 'kandad.dev@gmail.com', 'ljkj', 'emp', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_idAdminCreate` (`id_admin`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_idInvite` (`id_invite`);

--
-- Indexes for table `invite`
--
ALTER TABLE `invite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_admin_invite` (`id_admin`),
  ADD KEY `pk_emp_invite` (`id_emp`),
  ADD KEY `pk_cmp` (`id_cmp`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_idAdmin` (`id_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `invite`
--
ALTER TABLE `invite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `pk_idAdminCreate` FOREIGN KEY (`id_admin`) REFERENCES `users` (`id`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `pk_idInvite` FOREIGN KEY (`id_invite`) REFERENCES `invite` (`id`);

--
-- Constraints for table `invite`
--
ALTER TABLE `invite`
  ADD CONSTRAINT `pk_admin_invite` FOREIGN KEY (`id_admin`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pk_cmp` FOREIGN KEY (`id_cmp`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `pk_emp_invite` FOREIGN KEY (`id_emp`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `pk_idAdmin` FOREIGN KEY (`id_admin`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
