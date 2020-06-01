-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2020 at 08:07 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_management`
--
CREATE DATABASE IF NOT EXISTS `student_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `student_management`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `login_time` varchar(200) DEFAULT NULL,
  `logout_time` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `admin`:
--

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `login_time`, `logout_time`) VALUES
('admin', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
CREATE TABLE `assignments` (
  `a_id` varchar(200) NOT NULL,
  `c_id` varchar(200) NOT NULL,
  `marks` int(11) NOT NULL,
  `a_name` varchar(200) NOT NULL,
  `s_id` int(11) NOT NULL,
  `asst_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `assignments`:
--   `asst_id`
--       `assignment_type` -> `asst_id`
--   `c_id`
--       `courses` -> `c_id`
--   `s_id`
--       `students` -> `s_id`
--

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`a_id`, `c_id`, `marks`, `a_name`, `s_id`, `asst_id`) VALUES
('RDBMS1', 'CS1101', 100, 'Normalization', 189302120, 'RDBMS-T'),
('RDBMS2', 'CS1101', 100, 'Normalization', 189303120, 'RDBMS-T');

-- --------------------------------------------------------

--
-- Table structure for table `assignment_type`
--

DROP TABLE IF EXISTS `assignment_type`;
CREATE TABLE `assignment_type` (
  `asst_id` varchar(200) NOT NULL,
  `asst_type_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `assignment_type`:
--

--
-- Dumping data for table `assignment_type`
--

INSERT INTO `assignment_type` (`asst_id`, `asst_type_name`) VALUES
('RDBMS-P', 'RDBMS Practical'),
('RDBMS-T', 'RDBMS Theory');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `s_id` int(11) NOT NULL,
  `c_id` varchar(200) NOT NULL,
  `total_classes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `attendance`:
--   `c_id`
--       `courses` -> `c_id`
--   `s_id`
--       `students` -> `s_id`
--

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`s_id`, `c_id`, `total_classes`) VALUES
(189302120, 'CS1101', 25),
(189303120, 'CS1101', 25);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `c_id` varchar(200) NOT NULL,
  `ct_id` varchar(200) NOT NULL,
  `c_name` varchar(200) NOT NULL,
  `qualifications` varchar(200) NOT NULL,
  `dept_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `courses`:
--   `dept_id`
--       `departments` -> `dept_id`
--   `ct_id`
--       `course_type` -> `ct_id`
--

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`c_id`, `ct_id`, `c_name`, `qualifications`, `dept_id`) VALUES
('CS1101', 'CS1101-T', 'Data Structures and Algorithms', 'Programming in C, Basic Mathematics', 'SCIT-CSE');

-- --------------------------------------------------------

--
-- Table structure for table `course_type`
--

DROP TABLE IF EXISTS `course_type`;
CREATE TABLE `course_type` (
  `ct_id` varchar(200) NOT NULL,
  `ct_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `course_type`:
--

--
-- Dumping data for table `course_type`
--

INSERT INTO `course_type` (`ct_id`, `ct_name`) VALUES
('CS1101-T', 'Theory');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `dept_id` varchar(200) NOT NULL,
  `d_name` varchar(200) NOT NULL,
  `admin_username` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `departments`:
--   `admin_username`
--       `admin` -> `username`
--

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_id`, `d_name`, `admin_username`) VALUES
('SCIT-CCE', 'Computer and Communications', 'admin'),
('SCIT-CSE', 'Computer Science and Technology', 'admin'),
('SCIT-IT', 'Information Technology', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `dept_manage_attendance`
--

DROP TABLE IF EXISTS `dept_manage_attendance`;
CREATE TABLE `dept_manage_attendance` (
  `s_id` int(11) NOT NULL,
  `c_id` varchar(200) NOT NULL,
  `dept_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `dept_manage_attendance`:
--   `c_id`
--       `courses` -> `c_id`
--   `dept_id`
--       `departments` -> `dept_id`
--   `s_id`
--       `students` -> `s_id`
--

--
-- Dumping data for table `dept_manage_attendance`
--

INSERT INTO `dept_manage_attendance` (`s_id`, `c_id`, `dept_id`) VALUES
(189302120, 'CS1101', 'SCIT-CSE'),
(189303120, 'CS1101', 'SCIT-CSE');

-- --------------------------------------------------------

--
-- Table structure for table `mobile_numbers`
--

DROP TABLE IF EXISTS `mobile_numbers`;
CREATE TABLE `mobile_numbers` (
  `mobile_number` bigint(20) NOT NULL,
  `s_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `mobile_numbers`:
--   `s_id`
--       `students` -> `s_id`
--

--
-- Dumping data for table `mobile_numbers`
--

INSERT INTO `mobile_numbers` (`mobile_number`, `s_id`) VALUES
(9653049126, 189302120),
(8709549556, 189303120);

-- --------------------------------------------------------

--
-- Table structure for table `present_absent`
--

DROP TABLE IF EXISTS `present_absent`;
CREATE TABLE `present_absent` (
  `s_id` int(11) NOT NULL,
  `c_id` varchar(200) NOT NULL,
  `date` varchar(200) NOT NULL,
  `p_a` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `present_absent`:
--   `c_id`
--       `courses` -> `c_id`
--   `s_id`
--       `students` -> `s_id`
--

--
-- Dumping data for table `present_absent`
--

INSERT INTO `present_absent` (`s_id`, `c_id`, `date`, `p_a`) VALUES
(189302120, 'CS1101', '21/05/2020', 'p'),
(189303120, 'CS1101', '21/05/2020', 'p');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `s_id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `middle_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) NOT NULL,
  `section` varchar(200) NOT NULL,
  `email_id` varchar(200) NOT NULL,
  `street_addr` varchar(200) NOT NULL,
  `pincode` int(11) NOT NULL,
  `city` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `students`:
--

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`s_id`, `first_name`, `middle_name`, `last_name`, `section`, `email_id`, `street_addr`, `pincode`, `city`) VALUES
(189302120, 'Ritvij', NULL, 'Srivastava', 'D', 'ritvijsrivastava99@gmail.com', 'C-1/131/J, Rail Nagar', 226012, 'Lucknow'),
(189303120, 'Shivam', NULL, 'Raj', 'D', 'shivam.189303120@muj.manipal.edu', 'C-1/131/J, Rail Nagar', 226012, 'Lucknow');

-- --------------------------------------------------------

--
-- Table structure for table `student_has_assignment`
--

DROP TABLE IF EXISTS `student_has_assignment`;
CREATE TABLE `student_has_assignment` (
  `s_id` int(11) NOT NULL,
  `a_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `student_has_assignment`:
--   `a_id`
--       `assignments` -> `a_id`
--   `s_id`
--       `students` -> `s_id`
--

--
-- Dumping data for table `student_has_assignment`
--

INSERT INTO `student_has_assignment` (`s_id`, `a_id`) VALUES
(189302120, 'RDBMS1'),
(189303120, 'RDBMS2');

-- --------------------------------------------------------

--
-- Table structure for table `student_has_course`
--

DROP TABLE IF EXISTS `student_has_course`;
CREATE TABLE `student_has_course` (
  `s_id` int(11) NOT NULL,
  `c_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `student_has_course`:
--   `c_id`
--       `courses` -> `c_id`
--   `s_id`
--       `students` -> `s_id`
--

--
-- Dumping data for table `student_has_course`
--

INSERT INTO `student_has_course` (`s_id`, `c_id`) VALUES
(189302120, 'CS1101'),
(189303120, 'CS1101');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`a_id`),
  ADD KEY `student_assignment_id` (`s_id`),
  ADD KEY `assignment_type_id` (`asst_id`),
  ADD KEY `course_id` (`c_id`);

--
-- Indexes for table `assignment_type`
--
ALTER TABLE `assignment_type`
  ADD PRIMARY KEY (`asst_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD KEY `student_attendance_id` (`s_id`),
  ADD KEY `course_attendance_id` (`c_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `course_dept_id` (`dept_id`),
  ADD KEY `course_type_id` (`ct_id`);

--
-- Indexes for table `course_type`
--
ALTER TABLE `course_type`
  ADD PRIMARY KEY (`ct_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_id`),
  ADD KEY `department_admin` (`admin_username`);

--
-- Indexes for table `dept_manage_attendance`
--
ALTER TABLE `dept_manage_attendance`
  ADD KEY `student_s_id_2` (`s_id`),
  ADD KEY `course_c_id_2` (`c_id`),
  ADD KEY `dept_id_2` (`dept_id`);

--
-- Indexes for table `mobile_numbers`
--
ALTER TABLE `mobile_numbers`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `present_absent`
--
ALTER TABLE `present_absent`
  ADD KEY `student_pa_id` (`s_id`),
  ADD KEY `course_pa_id` (`c_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `student_has_assignment`
--
ALTER TABLE `student_has_assignment`
  ADD KEY `student_s_id_1` (`s_id`),
  ADD KEY `assgn_a_id_1` (`a_id`);

--
-- Indexes for table `student_has_course`
--
ALTER TABLE `student_has_course`
  ADD KEY `student_s_id` (`s_id`),
  ADD KEY `course_c_id` (`c_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignment_type_id` FOREIGN KEY (`asst_id`) REFERENCES `assignment_type` (`asst_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `course_id` FOREIGN KEY (`c_id`) REFERENCES `courses` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_assignment_id` FOREIGN KEY (`s_id`) REFERENCES `students` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `course_attendance_id` FOREIGN KEY (`c_id`) REFERENCES `courses` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_attendance_id` FOREIGN KEY (`s_id`) REFERENCES `students` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `course_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `course_type_id` FOREIGN KEY (`ct_id`) REFERENCES `course_type` (`ct_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `department_admin` FOREIGN KEY (`admin_username`) REFERENCES `admin` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dept_manage_attendance`
--
ALTER TABLE `dept_manage_attendance`
  ADD CONSTRAINT `course_c_id_2` FOREIGN KEY (`c_id`) REFERENCES `courses` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dept_id_2` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_s_id_2` FOREIGN KEY (`s_id`) REFERENCES `students` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mobile_numbers`
--
ALTER TABLE `mobile_numbers`
  ADD CONSTRAINT `student_id` FOREIGN KEY (`s_id`) REFERENCES `students` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `present_absent`
--
ALTER TABLE `present_absent`
  ADD CONSTRAINT `course_pa_id` FOREIGN KEY (`c_id`) REFERENCES `courses` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_pa_id` FOREIGN KEY (`s_id`) REFERENCES `students` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_has_assignment`
--
ALTER TABLE `student_has_assignment`
  ADD CONSTRAINT `assgn_a_id_1` FOREIGN KEY (`a_id`) REFERENCES `assignments` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_s_id_1` FOREIGN KEY (`s_id`) REFERENCES `students` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_has_course`
--
ALTER TABLE `student_has_course`
  ADD CONSTRAINT `course_c_id` FOREIGN KEY (`c_id`) REFERENCES `courses` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_s_id` FOREIGN KEY (`s_id`) REFERENCES `students` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
