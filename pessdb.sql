-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2021 at 09:35 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pessdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `incidentId` int(11) NOT NULL,
  `patrolcarId` varchar(10) NOT NULL,
  `timeDispatched` datetime NOT NULL,
  `timeArrived` datetime DEFAULT NULL,
  `timeCompleted` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dispatch`
--

INSERT INTO `dispatch` (`incidentId`, `patrolcarId`, `timeDispatched`, `timeArrived`, `timeCompleted`) VALUES
(62, 'QX1234G', '2021-11-25 16:27:43', '2021-11-25 16:28:21', '2021-11-25 16:28:35'),
(48, 'QX1234G', '2021-11-25 13:54:09', '2021-11-25 13:56:12', '2021-11-25 13:57:22'),
(47, 'QX1234S', '2021-10-30 13:31:35', '2021-10-30 13:32:55', '2021-10-30 13:31:53'),
(42, 'QX1234G', '2021-10-28 14:44:30', '2021-10-28 14:45:14', '2021-10-28 14:45:32'),
(43, 'QX1234B', '2021-10-29 08:39:31', '2021-10-29 08:44:43', '2021-10-29 08:48:30'),
(39, 'QX1234S', '2021-10-24 15:08:05', '2021-10-24 15:09:22', '2021-10-24 15:10:03'),
(63, 'QX1234G', '2021-11-25 16:33:52', '2021-11-25 16:34:02', '2021-11-25 16:34:18');

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incidentId` int(11) NOT NULL,
  `callerName` varchar(30) NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  `incidentTypeId` varchar(3) NOT NULL,
  `incidentLocation` varchar(50) NOT NULL,
  `incidentDesc` varchar(100) NOT NULL,
  `IncidentStatusId` varchar(1) NOT NULL,
  `timeCalled` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incidentId`, `callerName`, `phoneNumber`, `incidentTypeId`, `incidentLocation`, `incidentDesc`, `IncidentStatusId`, `timeCalled`) VALUES
(63, 'rick', '98756485', '050', 'hougang', 'fallen tree on car', '2', '2021-11-25 16:33:52'),
(62, 'rick', '9854 8774', '050', 'hougang', 'fallen tree', '2', '2021-11-25 16:27:43'),
(48, 'john', '12122121', '070', 'hoeeeqq', 'adawdadadad', '2', '2021-11-25 13:54:09'),
(47, 'john', '2012912', '030', 'wqqqq', 'zzz', '2', '2021-10-30 13:31:35'),
(43, 'Jane Chen', '9856 4875', '010', 'hougang ave 7', 'a fire broke out at a shop', '2', '2021-10-29 08:39:31'),
(42, 'jeff', '9855 6654', '010', 'woodland', 'fire at blk 205T woodlands ave 9 ', '2', '2021-10-28 14:44:30'),
(39, 'John', '9653 8715', '050', 'hougang ave 5', 'fallen tree on hougang ave 5 no one is injured\r\ncar smash ', '2', '2021-10-24 15:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `incidenttype`
--

CREATE TABLE `incidenttype` (
  `incidentTypeId` varchar(3) NOT NULL,
  `incidentTypeDesc` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incidenttype`
--

INSERT INTO `incidenttype` (`incidentTypeId`, `incidentTypeDesc`) VALUES
('070', 'Loan shark'),
('010', 'Fire'),
('020', 'Riot'),
('030', 'Burglary'),
('040', 'Domestic Violent'),
('050', 'Fallen Tree'),
('060', 'Traffic accident'),
('999', 'others');

-- --------------------------------------------------------

--
-- Table structure for table `incident_status`
--

CREATE TABLE `incident_status` (
  `statusId` varchar(1) NOT NULL,
  `statusDesc` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_status`
--

INSERT INTO `incident_status` (`statusId`, `statusDesc`) VALUES
('1', 'pending'),
('2', 'dispatched'),
('3', 'free'),
('4', 'arrived');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

CREATE TABLE `patrolcar` (
  `patrolcarId` varchar(10) NOT NULL,
  `patrolcarStatusId` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcarId`, `patrolcarStatusId`) VALUES
('QX1234S', '4'),
('QX1234G', '3'),
('QX1234B', '1'),
('QX1234X', '1'),
('QX1234T', '2'),
('QX1234W', '3');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar_status`
--

CREATE TABLE `patrolcar_status` (
  `statusId` varchar(1) NOT NULL,
  `statusDesc` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcar_status`
--

INSERT INTO `patrolcar_status` (`statusId`, `statusDesc`) VALUES
('1', 'Dispatched'),
('2', 'Patrol'),
('3', 'Free'),
('4', 'Arrived');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`incidentId`,`patrolcarId`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incidentId`);

--
-- Indexes for table `incidenttype`
--
ALTER TABLE `incidenttype`
  ADD PRIMARY KEY (`incidentTypeId`);

--
-- Indexes for table `incident_status`
--
ALTER TABLE `incident_status`
  ADD PRIMARY KEY (`statusId`);

--
-- Indexes for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD PRIMARY KEY (`patrolcarId`);

--
-- Indexes for table `patrolcar_status`
--
ALTER TABLE `patrolcar_status`
  ADD PRIMARY KEY (`statusId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incidentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
