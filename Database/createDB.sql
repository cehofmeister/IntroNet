-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 29, 2018 at 07:22 PM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `IntroNet`
--
CREATE DATABASE IF NOT EXISTS `IntroNet` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `IntroNet`;

-- --------------------------------------------------------

--
-- Table structure for table `Attending`
--

CREATE TABLE `Attending` (
  `att_event` int(10) UNSIGNED NOT NULL,
  `att_participant` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Conference`
--

CREATE TABLE `Conference` (
  `conference_id` int(10) UNSIGNED NOT NULL,
  `conference_name` varchar(10) NOT NULL,
  `registration_start_date` int(10) UNSIGNED NOT NULL,
  `registration_start_time` int(10) UNSIGNED NOT NULL,
  `registration_deadline_date` int(10) UNSIGNED NOT NULL,
  `registration_deadline_time` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE `Event` (
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
-- Table structure for table `Meeting_round`
--

CREATE TABLE `Meeting_round` (
  `round` int(10) UNSIGNED NOT NULL,
  `table_number` int(11) UNSIGNED NOT NULL,
  `first_person` int(10) UNSIGNED NOT NULL,
  `second_person` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Meeting_table`
--

CREATE TABLE `Meeting_table` (
  `number` int(11) UNSIGNED NOT NULL,
  `tab_event` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Organisation`
--

CREATE TABLE `Organisation` (
  `organisation_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `org_event` int(10) UNSIGNED DEFAULT NULL,
  `conference_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Participant`
--

CREATE TABLE `participant` (
  `participant_id` int(10) UNSIGNED NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `organisation` int(10) UNSIGNED NOT NULL,
  `biography` longtext,
  `icebreaker_question` varchar(45) DEFAULT NULL,
  `weight` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Poster`
--

CREATE TABLE `Poster` (
  `Poster_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `presented_by` int(10) UNSIGNED NOT NULL,
  `pos_event` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Poster_visit`
--

CREATE TABLE `Poster_visit` (
  `round` int(10) UNSIGNED NOT NULL,
  `poster` int(10) UNSIGNED NOT NULL,
  `vis_participant` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Registration`
--

CREATE TABLE `Registration` (
  `reg_participant` int(10) UNSIGNED NOT NULL,
  `reg_event` int(10) UNSIGNED NOT NULL,
  `weight` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Attending`
--
ALTER TABLE `Attending`
  ADD PRIMARY KEY (`att_event`,`att_participant`) USING BTREE,
  ADD KEY `att_participant_idx` (`att_participant`) USING BTREE,
  ADD KEY `att_Event_idx` (`att_event`) USING BTREE;

--
-- Indexes for table `Conference`
--
ALTER TABLE `Conference`
  ADD PRIMARY KEY (`conference_id`);

--
-- Indexes for table `Event`
--
ALTER TABLE `Event`
  ADD PRIMARY KEY (`Event_id`),
  ADD UNIQUE KEY `event_conference_idx` (`event_conference_id`);

--
-- Indexes for table `Meeting_round`
--
ALTER TABLE `Meeting_round`
  ADD PRIMARY KEY (`round`,`table_number`),
  ADD KEY `fk_table_idx` (`table_number`),
  ADD KEY `fk_fperson_idx` (`first_person`),
  ADD KEY `fk_sperson_idx` (`second_person`);

--
-- Indexes for table `Meeting_table`
--
ALTER TABLE `Meeting_table`
  ADD PRIMARY KEY (`number`,`tab_event`),
  ADD KEY `tab_Event_idx` (`tab_event`) USING BTREE;

--
-- Indexes for table `Organisation`
--
ALTER TABLE `Organisation`
  ADD PRIMARY KEY (`organisation_id`),
  ADD KEY `org_Event_idx` (`org_event`) USING BTREE;

--
-- Indexes for table `Participant`
--
ALTER TABLE `Participant`
  ADD PRIMARY KEY (`participant_id`),
  ADD KEY `fk_org_idx` (`organisation`);

--
-- Indexes for table `Poster`
--
ALTER TABLE `Poster`
  ADD PRIMARY KEY (`Poster_id`),
  ADD KEY `fk_Poster_Participant1_idx` (`presented_by`),
  ADD KEY `pos_Event_idx` (`pos_event`) USING BTREE;

--
-- Indexes for table `Poster_visit`
--
ALTER TABLE `Poster_visit`
  ADD PRIMARY KEY (`vis_participant`,`poster`,`round`),
  ADD KEY `vis_participant_idx` (`vis_participant`),
  ADD KEY `poster_idx` (`poster`) USING BTREE;

--
-- Indexes for table `Registration`
--
ALTER TABLE `Registration`
  ADD PRIMARY KEY (`reg_participant`,`reg_event`) USING BTREE,
  ADD UNIQUE KEY `unique_weight` (`weight`),
  ADD KEY `reg_Event_idx` (`reg_event`) USING BTREE,
  ADD KEY `reg_participant_idx` (`reg_participant`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Event`
--
ALTER TABLE `Event`
  MODIFY `Event_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Organisation`
--
ALTER TABLE `Organisation`
  MODIFY `organisation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Poster`
--
ALTER TABLE `Poster`
  MODIFY `Poster_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Attending`
--
ALTER TABLE `Attending`
  ADD CONSTRAINT `att_event` FOREIGN KEY (`att_event`) REFERENCES `Event` (`Event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `att_participant` FOREIGN KEY (`att_participant`) REFERENCES `Participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Event`
--
ALTER TABLE `Event`
  ADD CONSTRAINT `event_conference_id` FOREIGN KEY (`event_conference_id`) REFERENCES `Conference` (`conference_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Meeting_round`
--
ALTER TABLE `Meeting_round`
  ADD CONSTRAINT `fk_fperson` FOREIGN KEY (`first_person`) REFERENCES `Participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sperson` FOREIGN KEY (`second_person`) REFERENCES `Participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table` FOREIGN KEY (`table_number`) REFERENCES `Meeting_table` (`number`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Meeting_table`
--
ALTER TABLE `Meeting_table`
  ADD CONSTRAINT `tab_event` FOREIGN KEY (`tab_event`) REFERENCES `Event` (`Event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Organisation`
--
ALTER TABLE `Organisation`
  ADD CONSTRAINT `org_event` FOREIGN KEY (`org_event`) REFERENCES `Event` (`Event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Participant`
--
ALTER TABLE `Participant`
  ADD CONSTRAINT `fk_org` FOREIGN KEY (`organisation`) REFERENCES `Organisation` (`organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Poster`
--
ALTER TABLE `Poster`
  ADD CONSTRAINT `fk_Poster_Participant1` FOREIGN KEY (`presented_by`) REFERENCES `Participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pos_event` FOREIGN KEY (`pos_event`) REFERENCES `Event` (`Event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Poster_visit`
--
ALTER TABLE `Poster_visit`
  ADD CONSTRAINT `poster` FOREIGN KEY (`poster`) REFERENCES `Poster` (`pos_event`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vis_participant` FOREIGN KEY (`vis_participant`) REFERENCES `Participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Registration`
--
ALTER TABLE `Registration`
  ADD CONSTRAINT `reg_event` FOREIGN KEY (`reg_event`) REFERENCES `Event` (`Event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reg_participant` FOREIGN KEY (`reg_participant`) REFERENCES `Participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;
