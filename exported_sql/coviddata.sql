-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 02, 2020 at 10:18 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coviddata`
--

-- --------------------------------------------------------

--
-- Table structure for table `lga_data`
--

DROP TABLE IF EXISTS `lga_data`;
CREATE TABLE IF NOT EXISTS `lga_data` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Default ID of Entry',
  `LGA` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'Local Government Area',
  `lga_pid` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'Local Government Area ID',
  `population` int(20) UNSIGNED NOT NULL COMMENT 'Current population of LGA during the date recorded',
  `active` int(20) UNSIGNED NOT NULL COMMENT 'Current active COVID-19 cases of the LGA',
  `cases` int(20) UNSIGNED NOT NULL COMMENT 'Total COVID19 cases from the beginning until the current recorded date',
  `rate` double NOT NULL COMMENT 'Rate of COVID-19 cases based on averages',
  `new` int(20) NOT NULL COMMENT 'Number of new COVID-19 cases on the date of recorded',
  `band` tinyint(1) NOT NULL COMMENT 'Band',
  `LGADisplay` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'Local Government Area Full Name',
  `data_date` date NOT NULL COMMENT 'Date of data being recorded',
  `file_processed_date` date NOT NULL COMMENT 'Date of file being processed',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=635 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The table is designed for the recorded data of COVID-19';

--
-- Dumping data for table `lga_data`
--

INSERT INTO `lga_data` (`ID`, `LGA`, `lga_pid`, `population`, `active`, `cases`, `rate`, `new`, `band`, `LGADisplay`, `data_date`, `file_processed_date`) VALUES
(556, 'Test', 'VIC242', 128143, 0, 1, 0, 0, 0, 'Alpine', '2020-11-01', '2020-11-02'),
(557, 'Ararat (RC)', 'VIC220', 11845, 0, 7, 0, 0, 0, 'Ararat', '2020-11-01', '2020-11-02'),
(558, 'Ballarat (C)', 'VIC241', 109505, 0, 58, 0, 0, 0, 'Ballarat', '2020-11-01', '2020-11-02'),
(559, 'Banyule (C)', 'VIC188', 131631, 1, 450, 0.8, 0, 1, 'Banyule', '2020-11-01', '2020-11-02'),
(560, 'Bass Coast (S)', 'VIC173', 36320, 0, 10, 0, 0, 0, 'Bass Coast', '2020-11-01', '2020-11-02'),
(561, 'Baw Baw (S)', 'VIC194', 53396, 0, 16, 0, 0, 0, 'Baw Baw', '2020-11-01', '2020-11-02'),
(562, 'Bayside (C)', 'VIC182', 106862, 0, 247, 0, 0, 0, 'Bayside', '2020-11-01', '2020-11-02'),
(563, 'Benalla (RC)', 'VIC199', 14037, 0, 3, 0, 0, 0, 'Benalla', '2020-11-01', '2020-11-02'),
(564, 'Boroondara (C)', 'VIC201', 183199, 0, 272, 0, 0, 0, 'Boroondara', '2020-11-01', '2020-11-02'),
(565, 'Brimbank (C)', 'VIC189', 209523, 7, 2019, 3.3, 0, 1, 'Brimbank', '2020-11-01', '2020-11-02'),
(566, 'Buloke (S)', 'VIC183', 6124, 0, 0, 0, 0, 0, 'Buloke', '2020-11-01', '2020-11-02'),
(567, 'Campaspe (S)', 'VIC239', 37622, 0, 10, 0, 0, 0, 'Campaspe', '2020-11-01', '2020-11-02'),
(568, 'Cardinia (S)', 'VIC212', 112159, 0, 204, 0, 0, 0, 'Cardinia', '2020-11-01', '2020-11-02'),
(569, 'Casey (C)', 'VIC213', 353872, 2, 1063, 0.6, 0, 1, 'Casey', '2020-11-01', '2020-11-02'),
(570, 'Central Goldfields (S)', 'VIC169', 13186, 0, 2, 0, 0, 0, 'Central Goldfields', '2020-11-01', '2020-11-02'),
(571, 'Colac-Otway (S)', 'VIC224', 21564, 0, 137, 0, 0, 0, 'Colac-Otway', '2020-11-01', '2020-11-02'),
(572, 'Corangamite (S)', 'VIC231', 16020, 0, 3, 0, 0, 0, 'Corangamite', '2020-11-01', '2020-11-02'),
(573, 'Darebin (C)', 'VIC205', 164184, 7, 667, 4.3, 0, 1, 'Darebin', '2020-11-01', '2020-11-02'),
(574, 'East Gippsland (S)', 'VIC243', 47316, 0, 7, 0, 0, 0, 'East Gippsland', '2020-11-01', '2020-11-02'),
(575, 'Frankston (C)', 'VIC227', 142643, 1, 248, 0.7, 0, 1, 'Frankston', '2020-11-01', '2020-11-02'),
(576, 'Gannawarra (S)', 'VIC214', 10472, 0, 2, 0, 0, 0, 'Gannawarra', '2020-11-01', '2020-11-02'),
(577, 'Glen Eira (C)', 'VIC177', 156511, 1, 232, 0.6, 0, 1, 'Glen Eira', '2020-11-01', '2020-11-02'),
(578, 'Glenelg (S)', 'VIC223', 19674, 0, 20, 0, 0, 0, 'Glenelg', '2020-11-01', '2020-11-02'),
(579, 'Golden Plains (S)', 'VIC230', 23722, 0, 19, 0, 0, 0, 'Golden Plains', '2020-11-01', '2020-11-02'),
(580, 'Greater Bendigo (C)', 'VIC193', 118093, 0, 99, 0, 0, 0, 'Greater Bendigo', '2020-11-01', '2020-11-02'),
(581, 'Greater Dandenong (C)', 'VIC247', 168201, 2, 540, 1.2, 0, 1, 'Greater Dandenong', '2020-11-01', '2020-11-02'),
(582, 'Greater Geelong (C)', 'VIC215', 258934, 0, 365, 0, 0, 0, 'Greater Geelong', '2020-11-01', '2020-11-02'),
(583, 'Greater Shepparton (C)', 'VIC93', 66498, 0, 52, 0, 0, 0, 'Greater Shepparton', '2020-11-01', '2020-11-02'),
(584, 'Hepburn (S)', 'VIC94', 15975, 0, 2, 0, 0, 0, 'Hepburn', '2020-11-01', '2020-11-02'),
(585, 'Hindmarsh (S)', 'VIC152', 5588, 0, 0, 0, 0, 0, 'Hindmarsh', '2020-11-01', '2020-11-02'),
(586, 'Hobsons Bay (C)', 'VIC235', 97751, 2, 505, 2, 0, 1, 'Hobsons Bay', '2020-11-01', '2020-11-02'),
(587, 'Horsham (RC)', 'VIC153', 19921, 0, 14, 0, 0, 0, 'Horsham', '2020-11-01', '2020-11-02'),
(588, 'Hume (C)', 'VIC198', 233471, 4, 1664, 1.7, 0, 1, 'Hume', '2020-11-01', '2020-11-02'),
(589, 'Indigo (S)', 'VIC191', 16701, 0, 1, 0, 0, 0, 'Indigo', '2020-11-01', '2020-11-02'),
(590, 'Kingston (C)', 'VIC226', 165782, 0, 300, 0, 0, 0, 'Kingston', '2020-11-01', '2020-11-02'),
(591, 'Knox (C)', 'VIC209', 164538, 0, 166, 0, 0, 0, 'Knox', '2020-11-01', '2020-11-02'),
(592, 'Latrobe (C)', 'VIC219', 75561, 0, 56, 0, 0, 0, 'Latrobe', '2020-11-01', '2020-11-02'),
(593, 'Loddon (S)', 'VIC185', 7504, 0, 5, 0, 0, 0, 'Loddon', '2020-11-01', '2020-11-02'),
(594, 'Macedon Ranges (S)', 'VIC228', 50231, 0, 57, 0, 0, 0, 'Macedon Ranges', '2020-11-01', '2020-11-02'),
(595, 'Manningham (C)', 'VIC195', 127573, 0, 166, 0, 0, 0, 'Manningham', '2020-11-01', '2020-11-02'),
(596, 'Mansfield (S)', 'VIC244', 9176, 0, 10, 0, 0, 0, 'Mansfield', '2020-11-01', '2020-11-02'),
(597, 'Maribyrnong (C)', 'VIC234', 93448, 0, 595, 0, 0, 0, 'Maribyrnong', '2020-11-01', '2020-11-02'),
(598, 'Maroondah (C)', 'VIC207', 118558, 0, 104, 0, 0, 0, 'Maroondah', '2020-11-01', '2020-11-02'),
(599, 'Melbourne (C)', 'VIC132', 178955, 1, 883, 0.6, 0, 1, 'Melbourne', '2020-11-01', '2020-11-02'),
(600, 'Melton (C)', 'VIC237', 164895, 5, 1155, 3, 0, 1, 'Melton', '2020-11-01', '2020-11-02'),
(601, 'Mildura (RC)', 'VIC222', 55777, 0, 6, 0, 0, 0, 'Mildura', '2020-11-01', '2020-11-02'),
(602, 'Mitchell (S)', 'VIC211', 46082, 0, 89, 0, 0, 0, 'Mitchell', '2020-11-01', '2020-11-02'),
(603, 'Moira (S)', 'VIC190', 29925, 0, 12, 0, 0, 0, 'Moira', '2020-11-01', '2020-11-02'),
(604, 'Monash (C)', 'VIC210', 202847, 1, 337, 0.5, 0, 1, 'Monash', '2020-11-01', '2020-11-02'),
(605, 'Moonee Valley (C)', 'VIC121', 130294, 0, 812, 0, 0, 0, 'Moonee Valley', '2020-11-01', '2020-11-02'),
(606, 'Moorabool (S)', 'VIC236', 35049, 0, 38, 0, 0, 0, 'Moorabool', '2020-11-01', '2020-11-02'),
(607, 'Moreland (C)', 'VIC131', 185767, 1, 1052, 0.5, 0, 1, 'Moreland', '2020-11-01', '2020-11-02'),
(608, 'Mornington Peninsula (S)', 'VIC204', 167636, 0, 185, 0, 0, 0, 'Mornington Peninsula', '2020-11-01', '2020-11-02'),
(609, 'Mount Alexander (S)', 'VIC105', 19754, 0, 9, 0, 0, 0, 'Mount Alexander', '2020-11-01', '2020-11-02'),
(610, 'Moyne (S)', 'VIC229', 16953, 0, 2, 0, 0, 0, 'Moyne', '2020-11-01', '2020-11-02'),
(611, 'Murrindindi (S)', 'VIC250', 14570, 0, 9, 0, 0, 0, 'Murrindindi', '2020-11-01', '2020-11-02'),
(612, 'Nillumbik (S)', 'VIC216', 65094, 0, 136, 0, 0, 0, 'Nillumbik', '2020-11-01', '2020-11-02'),
(613, 'Northern Grampians (S)', 'VIC166', 11402, 0, 3, 0, 0, 0, 'Northern Grampians', '2020-11-01', '2020-11-02'),
(614, 'Port Phillip (C)', 'VIC208', 115601, 1, 294, 0.9, 0, 1, 'Port Phillip', '2020-11-01', '2020-11-02'),
(615, 'Pyrenees (S)', 'VIC217', 7472, 0, 3, 0, 0, 0, 'Pyrenees', '2020-11-01', '2020-11-02'),
(616, 'Queenscliffe (B)', 'VIC238', 2940, 0, 2, 0, 0, 0, 'Queenscliffe', '2020-11-01', '2020-11-02'),
(617, 'South Gippsland (S)', 'VIC178', 29914, 0, 11, 0, 0, 0, 'South Gippsland', '2020-11-01', '2020-11-02'),
(618, 'Southern Grampians (S)', 'VIC233', 16100, 0, 2, 0, 0, 0, 'Southern Grampians', '2020-11-01', '2020-11-02'),
(619, 'Stonnington (C)', 'VIC203', 117768, 0, 260, 0, 0, 0, 'Stonnington', '2020-11-01', '2020-11-02'),
(620, 'Strathbogie (S)', 'VIC110', 10781, 0, 2, 0, 0, 0, 'Strathbogie', '2020-11-01', '2020-11-02'),
(621, 'Surf Coast (S)', 'VIC225', 33456, 0, 15, 0, 0, 0, 'Surf Coast', '2020-11-01', '2020-11-02'),
(622, 'Swan Hill (RC)', 'VIC180', 20649, 0, 5, 0, 0, 0, 'Swan Hill', '2020-11-01', '2020-11-02'),
(623, 'Towong (S)', 'VIC187', 6040, 0, 0, 0, 0, 0, 'Towong', '2020-11-01', '2020-11-02'),
(624, 'Wangaratta (RC)', 'VIC186', 29187, 0, 2, 0, 0, 0, 'Wangaratta', '2020-11-01', '2020-11-02'),
(625, 'Warrnambool (C)', 'VIC179', 35181, 0, 13, 0, 0, 0, 'Warrnambool', '2020-11-01', '2020-11-02'),
(626, 'Wellington (S)', 'VIC218', 44380, 0, 16, 0, 0, 0, 'Wellington', '2020-11-01', '2020-11-02'),
(627, 'West Wimmera (S)', 'VIC232', 3841, 0, 1, 0, 0, 0, 'West Wimmera', '2020-11-01', '2020-11-02'),
(628, 'Whitehorse (C)', 'VIC196', 178739, 1, 217, 0.6, 0, 1, 'Whitehorse', '2020-11-01', '2020-11-02'),
(629, 'Whittlesea (C)', 'VIC197', 230238, 1, 1206, 0.4, 0, 1, 'Whittlesea', '2020-11-01', '2020-11-02'),
(630, 'Wodonga (RC)', 'VIC192', 42083, 0, 2, 0, 0, 0, 'Wodonga', '2020-11-01', '2020-11-02'),
(631, 'Wyndham (C)', 'VIC221', 270487, 10, 2264, 3.7, 0, 1, 'Wyndham', '2020-11-01', '2020-11-02'),
(632, 'Yarra (C)', 'VIC202', 101495, 1, 462, 1, 0, 1, 'Yarra', '2020-11-01', '2020-11-02'),
(633, 'Yarra Ranges (S)', 'VIC206', 159462, 0, 248, 0, 0, 0, 'Yarra Ranges', '2020-11-01', '2020-11-02'),
(634, 'Yarriambiack (S)', 'VIC200', 6639, 0, 1, 0, 0, 0, 'Yarriambiack', '2020-11-01', '2020-11-02');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
