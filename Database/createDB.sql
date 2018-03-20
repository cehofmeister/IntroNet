-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 20, 2018 at 02:42 AM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


--
-- Database: `IntroNet`
--
CREATE DATABASE IF NOT EXISTS `IntroNet` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `IntroNet`;

-- --------------------------------------------------------

--
-- Table structure for table `Attending`
--

CREATE TABLE IF NOT EXISTS `Attending` (
  `att_event` int(10) UNSIGNED NOT NULL,
  `att_participant` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`att_event`,`att_participant`) USING BTREE,
  KEY `att_participant_idx` (`att_participant`) USING BTREE,
  KEY `att_event_idx` (`att_event`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE IF NOT EXISTS `Event` (
  `Event_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Event_name` varchar(45) NOT NULL,
  `Time` time NOT NULL,
  `Date` date NOT NULL,
  `meeting_rounds` int(10) UNSIGNED DEFAULT NULL,
  `poster_rounds` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`Event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Meeting_round`
--

CREATE TABLE IF NOT EXISTS `Meeting_round` (
  `round` int(10) UNSIGNED NOT NULL,
  `table` int(11) NOT NULL,
  `first_person` int(10) UNSIGNED NOT NULL,
  `second_person` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`round`,`table`),
  KEY `fk_table_idx` (`table`),
  KEY `fk_fperson_idx` (`first_person`),
  KEY `fk_sperson_idx` (`second_person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Organisation`
--

CREATE TABLE IF NOT EXISTS `Organisation` (
  `organisation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `org_event` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`organisation_id`),
  KEY `org_event_idx` (`org_event`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Participant`
--

CREATE TABLE IF NOT EXISTS `Participant` (
  `participant_id` int(10) UNSIGNED NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `organisation` int(10) UNSIGNED NOT NULL,
  `biography` longtext,
  `icebreaker_question` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`participant_id`),
  KEY `fk_org_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Poster`
--

CREATE TABLE IF NOT EXISTS `Poster` (
  `Poster_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `presented_by` int(10) UNSIGNED NOT NULL,
  `pos_event` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`Poster_id`),
  KEY `fk_Poster_Participant1_idx` (`presented_by`),
  KEY `pos_event_idx` (`pos_event`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Poster_visit`
--

CREATE TABLE IF NOT EXISTS `Poster_visit` (
  `round` int(10) UNSIGNED NOT NULL,
  `poster` int(10) UNSIGNED NOT NULL,
  `vis_participant` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`vis_participant`,`poster`,`round`),
  KEY `vis_participant_idx` (`vis_participant`),
  KEY `poster_idx` (`poster`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Registration`
--

CREATE TABLE IF NOT EXISTS `Registration` (
  `reg_participant` int(10) UNSIGNED NOT NULL,
  `reg_event` int(10) UNSIGNED NOT NULL,
  `weight` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`reg_participant`,`reg_event`) USING BTREE,
  UNIQUE KEY `unique_weight` (`weight`),
  KEY `reg_event_idx` (`reg_event`) USING BTREE,
  KEY `reg_participant_idx` (`reg_participant`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Table`
--

CREATE TABLE IF NOT EXISTS `Table` (
  `number` int(11) NOT NULL,
  `tab_event` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`number`,`tab_event`),
  KEY `tab_event_idx` (`tab_event`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Constraints for table `Meeting_round`
--
ALTER TABLE `Meeting_round`
  ADD CONSTRAINT `fk_fperson` FOREIGN KEY (`first_person`) REFERENCES `Participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sperson` FOREIGN KEY (`second_person`) REFERENCES `Participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table` FOREIGN KEY (`table`) REFERENCES `Table` (`number`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

--
-- Constraints for table `Table`
--
ALTER TABLE `Table`
  ADD CONSTRAINT `tab_event` FOREIGN KEY (`tab_event`) REFERENCES `Event` (`Event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;