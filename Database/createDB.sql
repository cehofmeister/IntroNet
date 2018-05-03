-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2018 at 06:08 PM
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

--
-- Dumping data for table `conference`
--

INSERT INTO `conference` (`conference_id`, `conference_name`, `registration_start_date`, `registration_start_time`, `registration_deadline_date`, `registration_deadline_time`) VALUES
  (1, 'Test1', '2018-04-21', '00:00:00', '2018-04-28', '00:00:00'),
  (2, 'test2', '2018-04-19', '00:00:00', '2018-04-28', '00:00:00'),
  (3, 'Test3', '2018-04-25', '17:24:00', '2018-04-27', '10:47:00'),
  (4, 'Ball state', '2018-04-28', '03:15:00', '2018-05-05', '15:15:00');

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

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`Event_id`, `Event_name`, `startTime`, `startDate`, `endDate`, `endTime`, `rounds`, `roundLength`, `eventLength`, `type`, `event_conference_id`, `meeting_rounds`, `poster_rounds`) VALUES
  (1, 'Test1', '00:00:00', '2018-05-10', '2018-05-23', '01:00:00', 2, 2, 4, '1', 1, 1, 1),
  (3, 'bsuTest', '13:06:00', '2018-05-15', '2018-05-18', '23:55:00', 1, 1, 1, '1', 4, 0, 0);

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

--
-- Dumping data for table `meeting_table`
--

INSERT INTO `meeting_table` (`schedule_id`, `table_number`) VALUES
  (1, 0),
  (2, 0),
  (3, 0),
  (4, 0),
  (5, 0),
  (6, 1),
  (7, 1),
  (8, 1),
  (9, 1),
  (10, 1),
  (11, 0),
  (12, 0),
  (13, 0),
  (14, 0),
  (15, 0),
  (16, 1),
  (17, 1),
  (18, 1),
  (19, 1),
  (20, 1),
  (21, 0),
  (22, 0),
  (23, 0),
  (24, 0),
  (25, 0),
  (26, 1),
  (27, 1),
  (28, 1),
  (29, 1),
  (30, 1),
  (31, 0),
  (32, 0),
  (33, 0),
  (34, 0),
  (35, 0),
  (36, 1),
  (37, 1),
  (38, 1),
  (39, 1),
  (40, 1),
  (41, 0),
  (42, 0),
  (43, 0),
  (44, 0),
  (45, 0),
  (46, 1),
  (47, 1),
  (48, 1),
  (49, 1),
  (50, 1),
  (51, 0),
  (52, 0),
  (53, 0),
  (54, 0),
  (55, 0),
  (56, 1),
  (57, 1),
  (58, 1),
  (59, 1),
  (60, 1),
  (61, 0),
  (62, 0),
  (63, 0),
  (64, 0),
  (65, 0),
  (66, 1),
  (67, 1),
  (68, 1),
  (69, 1),
  (70, 1),
  (71, 0),
  (72, 0),
  (73, 0),
  (74, 0),
  (75, 0),
  (76, 1),
  (77, 1),
  (78, 1),
  (79, 1),
  (80, 1),
  (81, 0),
  (82, 0),
  (83, 0),
  (84, 0),
  (85, 0),
  (86, 1),
  (87, 1),
  (88, 1),
  (89, 1),
  (90, 1),
  (91, 0),
  (92, 0),
  (93, 0),
  (94, 0),
  (95, 0),
  (96, 1),
  (97, 1),
  (98, 1),
  (99, 1),
  (100, 1),
  (111, 0),
  (112, 0),
  (113, 0),
  (114, 0),
  (115, 0),
  (116, 1),
  (117, 1),
  (118, 1),
  (119, 1),
  (120, 1),
  (121, 0),
  (122, 0),
  (123, 0),
  (124, 0),
  (125, 0),
  (126, 1),
  (127, 1),
  (128, 1),
  (129, 1),
  (130, 1),
  (131, 0),
  (132, 0),
  (133, 0),
  (134, 0),
  (135, 0),
  (136, 1),
  (137, 1),
  (138, 1),
  (139, 1),
  (140, 1),
  (141, 0),
  (142, 0),
  (143, 0),
  (144, 0),
  (145, 0),
  (146, 1),
  (147, 1),
  (148, 1),
  (149, 1),
  (150, 1),
  (151, 0),
  (152, 0),
  (153, 0),
  (154, 0),
  (155, 0),
  (156, 1),
  (157, 1),
  (158, 1),
  (159, 1),
  (160, 1),
  (161, 0),
  (162, 0),
  (163, 0),
  (164, 0),
  (165, 0),
  (166, 1),
  (167, 1),
  (168, 1),
  (169, 1),
  (170, 1),
  (171, 0),
  (172, 0),
  (173, 0),
  (174, 0),
  (175, 0),
  (176, 1),
  (177, 1),
  (178, 1),
  (179, 1),
  (180, 1),
  (181, 0),
  (182, 0),
  (183, 0),
  (184, 0),
  (185, 0),
  (186, 1),
  (187, 1),
  (188, 1),
  (189, 1),
  (190, 1),
  (191, 0),
  (192, 0),
  (193, 0),
  (194, 0),
  (195, 0),
  (196, 1),
  (197, 1),
  (198, 1),
  (199, 1),
  (200, 1),
  (201, 0),
  (202, 0),
  (203, 0),
  (204, 0),
  (205, 0),
  (206, 1),
  (207, 1),
  (208, 1),
  (209, 1),
  (210, 1);

-- --------------------------------------------------------

--
-- Table structure for table `organisation`
--

CREATE TABLE `organisation` (
  `organisation_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `org_conference` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `organisation`
--

INSERT INTO `organisation` (`organisation_id`, `name`, `org_conference`) VALUES
  (1, 'Test1', 1),
  (2, 'Test2', 1),
  (3, 'Test3', 1),
  (4, '', 1),
  (5, 'microsoft', 1),
  (6, 'google', 1),
  (7, 'apple', 1);

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

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`participant_id`, `fname`, `lname`, `phone`, `email`, `password`, `organisation`, `weight`, `part_conference`, `disability`, `invitation`) VALUES
  (1, 'Jimmy', 'Schraeder', '5555555555', 'jsschraeder@bsu.edu', '', 1, '', '', 0, 1, 0, ''),
  (2, 'jack', 'bee', '7777777777', 'jsschraeder@bsu.edu', '', 1, '', '', 0, 1, 0, ''),
  (3, 'brian', 'ryan', '5555555556', 'jsschraeder@bsu.edu', '', 1, '', '', 0, 1, 0, ''),
  (4, 'Mister', 'sister', '5555555555', 'jsschraeder@bsu.edu', '', 1, '', '', 0, 1, 0, ''),
  (5, 'james', 'schraeder', '5555555555', 'jsschraeder@bsu.edu', '', 1, '', '', 0, 1, 0, ''),
  (6, 'Ike', 'smith', '5555555556', 'jsschraeder@bsu.edu', '', 1, '', '', 0, 1, 0, '');

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
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `reg_participant` int(10) UNSIGNED NOT NULL,
  `reg_event` int(10) UNSIGNED NOT NULL,
  `weight` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`reg_participant`, `reg_event`, `weight`) VALUES
  (2, 1, 0),
  (3, 1, 0),
  (4, 1, 0),
  (5, 1, 0),
  (6, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `Event_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `roundNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `Event_id`, `participant_id`, `roundNumber`) VALUES
  (1, 1, 2, 1),
  (2, 1, 5, 1),
  (3, 1, 2, 2),
  (4, 1, 4, 2),
  (5, 1, 6, 2),
  (6, 1, 3, 1),
  (7, 1, 4, 1),
  (8, 1, 6, 1),
  (9, 1, 3, 2),
  (10, 1, 5, 2),
  (11, 1, 2, 1),
  (12, 1, 5, 1),
  (13, 1, 2, 2),
  (14, 1, 4, 2),
  (15, 1, 6, 2),
  (16, 1, 3, 1),
  (17, 1, 4, 1),
  (18, 1, 6, 1),
  (19, 1, 3, 2),
  (20, 1, 5, 2),
  (21, 1, 2, 1),
  (22, 1, 5, 1),
  (23, 1, 2, 2),
  (24, 1, 4, 2),
  (25, 1, 6, 2),
  (26, 1, 3, 1),
  (27, 1, 4, 1),
  (28, 1, 6, 1),
  (29, 1, 3, 2),
  (30, 1, 5, 2),
  (31, 1, 2, 1),
  (32, 1, 5, 1),
  (33, 1, 2, 2),
  (34, 1, 4, 2),
  (35, 1, 6, 2),
  (36, 1, 3, 1),
  (37, 1, 4, 1),
  (38, 1, 6, 1),
  (39, 1, 3, 2),
  (40, 1, 5, 2),
  (41, 1, 2, 1),
  (42, 1, 5, 1),
  (43, 1, 2, 2),
  (44, 1, 4, 2),
  (45, 1, 6, 2),
  (46, 1, 3, 1),
  (47, 1, 4, 1),
  (48, 1, 6, 1),
  (49, 1, 3, 2),
  (50, 1, 5, 2),
  (51, 1, 2, 1),
  (52, 1, 5, 1),
  (53, 1, 2, 2),
  (54, 1, 4, 2),
  (55, 1, 6, 2),
  (56, 1, 3, 1),
  (57, 1, 4, 1),
  (58, 1, 6, 1),
  (59, 1, 3, 2),
  (60, 1, 5, 2),
  (61, 1, 2, 1),
  (62, 1, 5, 1),
  (63, 1, 2, 2),
  (64, 1, 4, 2),
  (65, 1, 6, 2),
  (66, 1, 3, 1),
  (67, 1, 4, 1),
  (68, 1, 6, 1),
  (69, 1, 3, 2),
  (70, 1, 5, 2),
  (71, 1, 2, 1),
  (72, 1, 5, 1),
  (73, 1, 2, 2),
  (74, 1, 4, 2),
  (75, 1, 6, 2),
  (76, 1, 3, 1),
  (77, 1, 4, 1),
  (78, 1, 6, 1),
  (79, 1, 3, 2),
  (80, 1, 5, 2),
  (81, 1, 2, 1),
  (82, 1, 5, 1),
  (83, 1, 2, 2),
  (84, 1, 4, 2),
  (85, 1, 6, 2),
  (86, 1, 3, 1),
  (87, 1, 4, 1),
  (88, 1, 6, 1),
  (89, 1, 3, 2),
  (90, 1, 5, 2),
  (91, 1, 2, 1),
  (92, 1, 5, 1),
  (93, 1, 2, 2),
  (94, 1, 4, 2),
  (95, 1, 6, 2),
  (96, 1, 3, 1),
  (97, 1, 4, 1),
  (98, 1, 6, 1),
  (99, 1, 3, 2),
  (100, 1, 5, 2),
  (101, 1, 2, 1),
  (102, 1, 5, 1),
  (103, 1, 2, 2),
  (104, 1, 4, 2),
  (105, 1, 6, 2),
  (106, 1, 3, 1),
  (107, 1, 4, 1),
  (108, 1, 6, 1),
  (109, 1, 3, 2),
  (110, 1, 5, 2),
  (111, 1, 2, 1),
  (112, 1, 5, 1),
  (113, 1, 2, 2),
  (114, 1, 4, 2),
  (115, 1, 6, 2),
  (116, 1, 3, 1),
  (117, 1, 4, 1),
  (118, 1, 6, 1),
  (119, 1, 3, 2),
  (120, 1, 5, 2),
  (121, 1, 2, 1),
  (122, 1, 5, 1),
  (123, 1, 2, 2),
  (124, 1, 4, 2),
  (125, 1, 6, 2),
  (126, 1, 3, 1),
  (127, 1, 4, 1),
  (128, 1, 6, 1),
  (129, 1, 3, 2),
  (130, 1, 5, 2),
  (131, 1, 2, 1),
  (132, 1, 5, 1),
  (133, 1, 2, 2),
  (134, 1, 4, 2),
  (135, 1, 6, 2),
  (136, 1, 3, 1),
  (137, 1, 4, 1),
  (138, 1, 6, 1),
  (139, 1, 3, 2),
  (140, 1, 5, 2),
  (141, 1, 2, 1),
  (142, 1, 5, 1),
  (143, 1, 2, 2),
  (144, 1, 4, 2),
  (145, 1, 6, 2),
  (146, 1, 3, 1),
  (147, 1, 4, 1),
  (148, 1, 6, 1),
  (149, 1, 3, 2),
  (150, 1, 5, 2),
  (151, 1, 2, 1),
  (152, 1, 5, 1),
  (153, 1, 2, 2),
  (154, 1, 4, 2),
  (155, 1, 6, 2),
  (156, 1, 3, 1),
  (157, 1, 4, 1),
  (158, 1, 6, 1),
  (159, 1, 3, 2),
  (160, 1, 5, 2),
  (161, 1, 2, 1),
  (162, 1, 5, 1),
  (163, 1, 2, 2),
  (164, 1, 4, 2),
  (165, 1, 6, 2),
  (166, 1, 3, 1),
  (167, 1, 4, 1),
  (168, 1, 6, 1),
  (169, 1, 3, 2),
  (170, 1, 5, 2),
  (171, 1, 2, 1),
  (172, 1, 5, 1),
  (173, 1, 2, 2),
  (174, 1, 4, 2),
  (175, 1, 6, 2),
  (176, 1, 3, 1),
  (177, 1, 4, 1),
  (178, 1, 6, 1),
  (179, 1, 3, 2),
  (180, 1, 5, 2),
  (181, 1, 2, 1),
  (182, 1, 5, 1),
  (183, 1, 2, 2),
  (184, 1, 4, 2),
  (185, 1, 6, 2),
  (186, 1, 3, 1),
  (187, 1, 4, 1),
  (188, 1, 6, 1),
  (189, 1, 3, 2),
  (190, 1, 5, 2),
  (191, 1, 2, 1),
  (192, 1, 5, 1),
  (193, 1, 2, 2),
  (194, 1, 4, 2),
  (195, 1, 6, 2),
  (196, 1, 3, 1),
  (197, 1, 4, 1),
  (198, 1, 6, 1),
  (199, 1, 3, 2),
  (200, 1, 5, 2),
  (201, 1, 2, 1),
  (202, 1, 5, 1),
  (203, 1, 2, 2),
  (204, 1, 4, 2),
  (205, 1, 6, 2),
  (206, 1, 3, 1),
  (207, 1, 4, 1),
  (208, 1, 6, 1),
  (209, 1, 3, 2),
  (210, 1, 5, 2);

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
  ADD KEY `fk_org_idx` (`organisation`);

--
-- Indexes for table `poster`
--
ALTER TABLE `poster`
  ADD PRIMARY KEY (`Poster_id`),
  ADD KEY `fk_Poster_Participant1_idx` (`presented_by`),
  ADD KEY `pos_event_idx` (`pos_event`) USING BTREE;

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`reg_participant`,`reg_event`) USING BTREE,
  ADD KEY `reg_event_idx` (`reg_event`) USING BTREE,
  ADD KEY `reg_participant_idx` (`reg_participant`) USING BTREE,
  ADD KEY `weight` (`weight`) USING BTREE;

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `conference`
--
ALTER TABLE `conference`
  MODIFY `conference_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `Event_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `organisation`
--
ALTER TABLE `organisation`
  MODIFY `organisation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `participant_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `poster`
--
ALTER TABLE `poster`
  MODIFY `Poster_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

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
  ADD CONSTRAINT `fk_org` FOREIGN KEY (`organisation`) REFERENCES `organisation` (`organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `poster`
--
ALTER TABLE `poster`
  ADD CONSTRAINT `fk_poster_participant1` FOREIGN KEY (`presented_by`) REFERENCES `participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pos_event` FOREIGN KEY (`pos_event`) REFERENCES `event` (`Event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `reg_event` FOREIGN KEY (`reg_event`) REFERENCES `event` (`Event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reg_particiapant` FOREIGN KEY (`reg_participant`) REFERENCES `participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
