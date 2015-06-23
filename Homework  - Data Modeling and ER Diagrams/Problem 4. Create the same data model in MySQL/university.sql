-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 
-- Версия на сървъра: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `university`
--

-- --------------------------------------------------------

--
-- Структура на таблица `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
`id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- РЕЛАЦИИ ЗА ТАБЛИЦА `courses`:
--   `department_id`
--       `departments` -> `id`
--   `professor_id`
--       `professors` -> `id`
--

-- --------------------------------------------------------

--
-- Структура на таблица `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
`id` int(11) NOT NULL,
  `FacultyId` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- РЕЛАЦИИ ЗА ТАБЛИЦА `departments`:
--   `FacultyId`
--       `faculties` -> `id`
--

-- --------------------------------------------------------

--
-- Структура на таблица `faculties`
--

CREATE TABLE IF NOT EXISTS `faculties` (
`id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `professors`
--

CREATE TABLE IF NOT EXISTS `professors` (
`id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- РЕЛАЦИИ ЗА ТАБЛИЦА `professors`:
--   `department_id`
--       `departments` -> `id`
--

-- --------------------------------------------------------

--
-- Структура на таблица `professor_titles`
--

CREATE TABLE IF NOT EXISTS `professor_titles` (
  `professor_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- РЕЛАЦИИ ЗА ТАБЛИЦА `professor_titles`:
--   `professor_id`
--       `professors` -> `id`
--   `title_id`
--       `titles` -> `id`
--

-- --------------------------------------------------------

--
-- Структура на таблица `students`
--

CREATE TABLE IF NOT EXISTS `students` (
`id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- РЕЛАЦИИ ЗА ТАБЛИЦА `students`:
--   `faculty_id`
--       `faculties` -> `id`
--

-- --------------------------------------------------------

--
-- Структура на таблица `students_courses`
--

CREATE TABLE IF NOT EXISTS `students_courses` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- РЕЛАЦИИ ЗА ТАБЛИЦА `students_courses`:
--   `student_id`
--       `students` -> `id`
--   `course_id`
--       `courses` -> `id`
--

-- --------------------------------------------------------

--
-- Структура на таблица `titles`
--

CREATE TABLE IF NOT EXISTS `titles` (
`id` int(11) NOT NULL,
  `Title` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
 ADD PRIMARY KEY (`id`), ADD KEY `department_id` (`department_id`), ADD KEY `professor_id` (`professor_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
 ADD PRIMARY KEY (`id`), ADD KEY `FacultyId` (`FacultyId`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
 ADD PRIMARY KEY (`id`), ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `professor_titles`
--
ALTER TABLE `professor_titles`
 ADD KEY `professor_id` (`professor_id`), ADD KEY `title_id` (`title_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
 ADD PRIMARY KEY (`id`), ADD KEY `faculty_id` (`faculty_id`);

--
-- Indexes for table `students_courses`
--
ALTER TABLE `students_courses`
 ADD KEY `student_id` (`student_id`), ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `courses`
--
ALTER TABLE `courses`
ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`id`);

--
-- Ограничения за таблица `departments`
--
ALTER TABLE `departments`
ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`FacultyId`) REFERENCES `faculties` (`id`);

--
-- Ограничения за таблица `professors`
--
ALTER TABLE `professors`
ADD CONSTRAINT `professors_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Ограничения за таблица `professor_titles`
--
ALTER TABLE `professor_titles`
ADD CONSTRAINT `professor_titles_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`id`),
ADD CONSTRAINT `professor_titles_ibfk_2` FOREIGN KEY (`title_id`) REFERENCES `titles` (`id`);

--
-- Ограничения за таблица `students`
--
ALTER TABLE `students`
ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`);

--
-- Ограничения за таблица `students_courses`
--
ALTER TABLE `students_courses`
ADD CONSTRAINT `students_courses_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
ADD CONSTRAINT `students_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
