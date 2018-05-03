-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2018 at 05:53 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intronet`
--
CREATE DATABASE IF NOT EXISTS `intronet` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `intronet`;

-- --------------------------------------------------------

--
-- Table structure for table `attending`
--

CREATE TABLE `attending` (
  `att_event` int(10) UNSIGNED NOT NULL,
  `att_participant` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conference`
--

CREATE TABLE `conference` (
  `conference_id` int(10) UNSIGNED NOT NULL,
  `conference_name` varchar(150) NOT NULL,
  `registration_start_date` date NOT NULL,
  `registration_start_time` time NOT NULL,
  `registration_deadline_date` date NOT NULL,
  `registration_deadline_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `Event_id` int(10) UNSIGNED NOT NULL,
  `Event_name` varchar(45) NOT NULL,
  `startTime` time NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `endTime` time NOT NULL,
  `rounds` int(10) UNSIGNED NOT NULL,
  `roundLength` int(10) UNSIGNED NOT NULL,
  `eventLength` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `event_conference_id` int(10) UNSIGNED NOT NULL,
  `meeting_rounds` int(10) UNSIGNED DEFAULT NULL,
  `poster_rounds` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_poster`
--

CREATE TABLE `meeting_poster` (
  `schedule_id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_table`
--

CREATE TABLE `meeting_table` (
  `schedule_id` int(11) NOT NULL,
  `table_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `organisation`
--

CREATE TABLE `organisation` (
  `organisation_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `org_conference` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `participant_id` int(10) UNSIGNED NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `organisation` int(10) UNSIGNED NOT NULL,
  `weight` int(10) UNSIGNED NOT NULL,
  `part_conference` int(10) UNSIGNED NOT NULL,
  `disability` tinyint(1) NOT NULL,
  `invitation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poster`
--

CREATE TABLE `poster` (
  `Poster_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `presented_by` int(10) UNSIGNED NOT NULL,
  `pos_event` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `preference`
--

CREATE TABLE `preference` (
  `pref_event_id` int(10) UNSIGNED NOT NULL,
  `pref_part_id` int(10) UNSIGNED NOT NULL,
  `preference` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `reg_participant` int(10) UNSIGNED NOT NULL,
  `reg_event` int(10) UNSIGNED NOT NULL,
  `icebreaker_question` varchar(150) DEFAULT NULL,
  `biography` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `Event_id` int(10) UNSIGNED NOT NULL,
  `participant_id` int(10) UNSIGNED NOT NULL,
  `roundNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attending`
--
ALTER TABLE `attending`
  ADD PRIMARY KEY (`att_event`,`att_participant`) USING BTREE,
  ADD KEY `att_participant_idx` (`att_participant`) USING BTREE,
  ADD KEY `att_event_idx` (`att_event`) USING BTREE;

--
-- Indexes for table `conference`
--
ALTER TABLE `conference`
  ADD PRIMARY KEY (`conference_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`Event_id`),
  ADD UNIQUE KEY `event_conference_idx` (`event_conference_id`);

--
-- Indexes for table `meeting_table`
--
ALTER TABLE `meeting_table`
  ADD UNIQUE KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `organisation`
--
ALTER TABLE `organisation`
  ADD PRIMARY KEY (`organisation_id`),
  ADD KEY `org_conference_idx` (`org_conference`) USING BTREE;

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`participant_id`),
  ADD KEY `fk_org_idx` (`organisation`),
  ADD KEY `part_conference` (`part_conference`);

--
-- Indexes for table `poster`
--
ALTER TABLE `poster`
  ADD PRIMARY KEY (`Poster_id`),
  ADD KEY `fk_Poster_Participant1_idx` (`presented_by`),
  ADD KEY `pos_event_idx` (`pos_event`) USING BTREE;

--
-- Indexes for table `preference`
--
ALTER TABLE `preference`
  ADD KEY `pref_event_id` (`pref_event_id`),
  ADD KEY `pref_part_id` (`pref_part_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`reg_participant`,`reg_event`) USING BTREE,
  ADD KEY `reg_event_idx` (`reg_event`) USING BTREE,
  ADD KEY `reg_participant_idx` (`reg_participant`) USING BTREE;

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `Event_id` (`Event_id`),
  ADD KEY `participant_id` (`participant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `conference`
--
ALTER TABLE `conference`
  MODIFY `conference_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `Event_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organisation`
--
ALTER TABLE `organisation`
  MODIFY `organisation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `participant_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poster`
--
ALTER TABLE `poster`
  MODIFY `Poster_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attending`
--
ALTER TABLE `attending`
  ADD CONSTRAINT `att_event` FOREIGN KEY (`att_event`) REFERENCES `event` (`Event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `att_participant` FOREIGN KEY (`att_participant`) REFERENCES `participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_conference_id` FOREIGN KEY (`event_conference_id`) REFERENCES `conference` (`conference_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `organisation`
--
ALTER TABLE `organisation`
  ADD CONSTRAINT `org_conference` FOREIGN KEY (`org_conference`) REFERENCES `conference` (`conference_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `fk_org` FOREIGN KEY (`organisation`) REFERENCES `organisation` (`organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `part_conference` FOREIGN KEY (`part_conference`) REFERENCES `conference` (`conference_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `poster`
--
ALTER TABLE `poster`
  ADD CONSTRAINT `fk_poster_participant1` FOREIGN KEY (`presented_by`) REFERENCES `participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pos_event` FOREIGN KEY (`pos_event`) REFERENCES `event` (`Event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `preference`
--
ALTER TABLE `preference`
  ADD CONSTRAINT `pref_event_id` FOREIGN KEY (`pref_event_id`) REFERENCES `event` (`Event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pref_part_id` FOREIGN KEY (`pref_part_id`) REFERENCES `participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `reg_event` FOREIGN KEY (`reg_event`) REFERENCES `event` (`Event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reg_particiapant` FOREIGN KEY (`reg_participant`) REFERENCES `participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `Event_id` FOREIGN KEY (`Event_id`) REFERENCES `event` (`Event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `participant_id` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
