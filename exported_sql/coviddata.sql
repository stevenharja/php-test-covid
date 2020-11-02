-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 02, 2020 at 10:54 PM
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

--
-- Dumping data for table `lga_data`
--

INSERT INTO `lga_data` (`ID`, `LGA`, `lga_pid`, `population`, `active`, `cases`, `rate`, `new`, `band`, `LGADisplay`, `data_date`, `file_processed_date`) VALUES
(635, 'Alpine (S)', 'VIC242', 12814, 0, 1, 0, 0, 0, 'Alpine', '2020-11-01', '2020-11-02'),
(636, 'Ararat (RC)', 'VIC220', 11845, 0, 7, 0, 0, 0, 'Ararat', '2020-11-01', '2020-11-02'),
(637, 'Ballarat (C)', 'VIC241', 109505, 0, 58, 0, 0, 0, 'Ballarat', '2020-11-01', '2020-11-02'),
(638, 'Banyule (C)', 'VIC188', 131631, 1, 450, 0.8, 0, 1, 'Banyule', '2020-11-01', '2020-11-02'),
(639, 'Bass Coast (S)', 'VIC173', 36320, 0, 10, 0, 0, 0, 'Bass Coast', '2020-11-01', '2020-11-02'),
(640, 'Baw Baw (S)', 'VIC194', 53396, 0, 16, 0, 0, 0, 'Baw Baw', '2020-11-01', '2020-11-02'),
(641, 'Bayside (C)', 'VIC182', 106862, 0, 247, 0, 0, 0, 'Bayside', '2020-11-01', '2020-11-02'),
(642, 'Benalla (RC)', 'VIC199', 14037, 0, 3, 0, 0, 0, 'Benalla', '2020-11-01', '2020-11-02'),
(643, 'Boroondara (C)', 'VIC201', 183199, 0, 272, 0, 0, 0, 'Boroondara', '2020-11-01', '2020-11-02'),
(644, 'Brimbank (C)', 'VIC189', 209523, 7, 2019, 3.3, 0, 1, 'Brimbank', '2020-11-01', '2020-11-02'),
(645, 'Buloke (S)', 'VIC183', 6124, 0, 0, 0, 0, 0, 'Buloke', '2020-11-01', '2020-11-02'),
(646, 'Campaspe (S)', 'VIC239', 37622, 0, 10, 0, 0, 0, 'Campaspe', '2020-11-01', '2020-11-02'),
(647, 'Cardinia (S)', 'VIC212', 112159, 0, 204, 0, 0, 0, 'Cardinia', '2020-11-01', '2020-11-02'),
(648, 'Casey (C)', 'VIC213', 353872, 2, 1063, 0.6, 0, 1, 'Casey', '2020-11-01', '2020-11-02'),
(649, 'Central Goldfields (S)', 'VIC169', 13186, 0, 2, 0, 0, 0, 'Central Goldfields', '2020-11-01', '2020-11-02'),
(650, 'Colac-Otway (S)', 'VIC224', 21564, 0, 137, 0, 0, 0, 'Colac-Otway', '2020-11-01', '2020-11-02'),
(651, 'Corangamite (S)', 'VIC231', 16020, 0, 3, 0, 0, 0, 'Corangamite', '2020-11-01', '2020-11-02'),
(652, 'Darebin (C)', 'VIC205', 164184, 7, 667, 4.3, 0, 1, 'Darebin', '2020-11-01', '2020-11-02'),
(653, 'East Gippsland (S)', 'VIC243', 47316, 0, 7, 0, 0, 0, 'East Gippsland', '2020-11-01', '2020-11-02'),
(654, 'Frankston (C)', 'VIC227', 142643, 1, 248, 0.7, 0, 1, 'Frankston', '2020-11-01', '2020-11-02'),
(655, 'Gannawarra (S)', 'VIC214', 10472, 0, 2, 0, 0, 0, 'Gannawarra', '2020-11-01', '2020-11-02'),
(656, 'Glen Eira (C)', 'VIC177', 156511, 1, 232, 0.6, 0, 1, 'Glen Eira', '2020-11-01', '2020-11-02'),
(657, 'Glenelg (S)', 'VIC223', 19674, 0, 20, 0, 0, 0, 'Glenelg', '2020-11-01', '2020-11-02'),
(658, 'Golden Plains (S)', 'VIC230', 23722, 0, 19, 0, 0, 0, 'Golden Plains', '2020-11-01', '2020-11-02'),
(659, 'Greater Bendigo (C)', 'VIC193', 118093, 0, 99, 0, 0, 0, 'Greater Bendigo', '2020-11-01', '2020-11-02'),
(660, 'Greater Dandenong (C)', 'VIC247', 168201, 2, 540, 1.2, 0, 1, 'Greater Dandenong', '2020-11-01', '2020-11-02'),
(661, 'Greater Geelong (C)', 'VIC215', 258934, 0, 365, 0, 0, 0, 'Greater Geelong', '2020-11-01', '2020-11-02'),
(662, 'Greater Shepparton (C)', 'VIC93', 66498, 0, 52, 0, 0, 0, 'Greater Shepparton', '2020-11-01', '2020-11-02'),
(663, 'Hepburn (S)', 'VIC94', 15975, 0, 2, 0, 0, 0, 'Hepburn', '2020-11-01', '2020-11-02'),
(664, 'Hindmarsh (S)', 'VIC152', 5588, 0, 0, 0, 0, 0, 'Hindmarsh', '2020-11-01', '2020-11-02'),
(665, 'Hobsons Bay (C)', 'VIC235', 97751, 2, 505, 2, 0, 1, 'Hobsons Bay', '2020-11-01', '2020-11-02'),
(666, 'Horsham (RC)', 'VIC153', 19921, 0, 14, 0, 0, 0, 'Horsham', '2020-11-01', '2020-11-02'),
(667, 'Hume (C)', 'VIC198', 233471, 4, 1664, 1.7, 0, 1, 'Hume', '2020-11-01', '2020-11-02'),
(668, 'Indigo (S)', 'VIC191', 16701, 0, 1, 0, 0, 0, 'Indigo', '2020-11-01', '2020-11-02'),
(669, 'Kingston (C)', 'VIC226', 165782, 0, 300, 0, 0, 0, 'Kingston', '2020-11-01', '2020-11-02'),
(670, 'Knox (C)', 'VIC209', 164538, 0, 166, 0, 0, 0, 'Knox', '2020-11-01', '2020-11-02'),
(671, 'Latrobe (C)', 'VIC219', 75561, 0, 56, 0, 0, 0, 'Latrobe', '2020-11-01', '2020-11-02'),
(672, 'Loddon (S)', 'VIC185', 7504, 0, 5, 0, 0, 0, 'Loddon', '2020-11-01', '2020-11-02'),
(673, 'Macedon Ranges (S)', 'VIC228', 50231, 0, 57, 0, 0, 0, 'Macedon Ranges', '2020-11-01', '2020-11-02'),
(674, 'Manningham (C)', 'VIC195', 127573, 0, 166, 0, 0, 0, 'Manningham', '2020-11-01', '2020-11-02'),
(675, 'Mansfield (S)', 'VIC244', 9176, 0, 10, 0, 0, 0, 'Mansfield', '2020-11-01', '2020-11-02'),
(676, 'Maribyrnong (C)', 'VIC234', 93448, 0, 595, 0, 0, 0, 'Maribyrnong', '2020-11-01', '2020-11-02'),
(677, 'Maroondah (C)', 'VIC207', 118558, 0, 104, 0, 0, 0, 'Maroondah', '2020-11-01', '2020-11-02'),
(678, 'Melbourne (C)', 'VIC132', 178955, 1, 883, 0.6, 0, 1, 'Melbourne', '2020-11-01', '2020-11-02'),
(679, 'Melton (C)', 'VIC237', 164895, 5, 1155, 3, 0, 1, 'Melton', '2020-11-01', '2020-11-02'),
(680, 'Mildura (RC)', 'VIC222', 55777, 0, 6, 0, 0, 0, 'Mildura', '2020-11-01', '2020-11-02'),
(681, 'Mitchell (S)', 'VIC211', 46082, 0, 89, 0, 0, 0, 'Mitchell', '2020-11-01', '2020-11-02'),
(682, 'Moira (S)', 'VIC190', 29925, 0, 12, 0, 0, 0, 'Moira', '2020-11-01', '2020-11-02'),
(683, 'Monash (C)', 'VIC210', 202847, 1, 337, 0.5, 0, 1, 'Monash', '2020-11-01', '2020-11-02'),
(684, 'Moonee Valley (C)', 'VIC121', 130294, 0, 812, 0, 0, 0, 'Moonee Valley', '2020-11-01', '2020-11-02'),
(685, 'Moorabool (S)', 'VIC236', 35049, 0, 38, 0, 0, 0, 'Moorabool', '2020-11-01', '2020-11-02'),
(686, 'Moreland (C)', 'VIC131', 185767, 1, 1052, 0.5, 0, 1, 'Moreland', '2020-11-01', '2020-11-02'),
(687, 'Mornington Peninsula (S)', 'VIC204', 167636, 0, 185, 0, 0, 0, 'Mornington Peninsula', '2020-11-01', '2020-11-02'),
(688, 'Mount Alexander (S)', 'VIC105', 19754, 0, 9, 0, 0, 0, 'Mount Alexander', '2020-11-01', '2020-11-02'),
(689, 'Moyne (S)', 'VIC229', 16953, 0, 2, 0, 0, 0, 'Moyne', '2020-11-01', '2020-11-02'),
(690, 'Murrindindi (S)', 'VIC250', 14570, 0, 9, 0, 0, 0, 'Murrindindi', '2020-11-01', '2020-11-02'),
(691, 'Nillumbik (S)', 'VIC216', 65094, 0, 136, 0, 0, 0, 'Nillumbik', '2020-11-01', '2020-11-02'),
(692, 'Northern Grampians (S)', 'VIC166', 11402, 0, 3, 0, 0, 0, 'Northern Grampians', '2020-11-01', '2020-11-02'),
(693, 'Port Phillip (C)', 'VIC208', 115601, 1, 294, 0.9, 0, 1, 'Port Phillip', '2020-11-01', '2020-11-02'),
(694, 'Pyrenees (S)', 'VIC217', 7472, 0, 3, 0, 0, 0, 'Pyrenees', '2020-11-01', '2020-11-02'),
(695, 'Queenscliffe (B)', 'VIC238', 2940, 0, 2, 0, 0, 0, 'Queenscliffe', '2020-11-01', '2020-11-02'),
(696, 'South Gippsland (S)', 'VIC178', 29914, 0, 11, 0, 0, 0, 'South Gippsland', '2020-11-01', '2020-11-02'),
(697, 'Southern Grampians (S)', 'VIC233', 16100, 0, 2, 0, 0, 0, 'Southern Grampians', '2020-11-01', '2020-11-02'),
(698, 'Stonnington (C)', 'VIC203', 117768, 0, 260, 0, 0, 0, 'Stonnington', '2020-11-01', '2020-11-02'),
(699, 'Strathbogie (S)', 'VIC110', 10781, 0, 2, 0, 0, 0, 'Strathbogie', '2020-11-01', '2020-11-02'),
(700, 'Surf Coast (S)', 'VIC225', 33456, 0, 15, 0, 0, 0, 'Surf Coast', '2020-11-01', '2020-11-02'),
(701, 'Swan Hill (RC)', 'VIC180', 20649, 0, 5, 0, 0, 0, 'Swan Hill', '2020-11-01', '2020-11-02'),
(702, 'Towong (S)', 'VIC187', 6040, 0, 0, 0, 0, 0, 'Towong', '2020-11-01', '2020-11-02'),
(703, 'Wangaratta (RC)', 'VIC186', 29187, 0, 2, 0, 0, 0, 'Wangaratta', '2020-11-01', '2020-11-02'),
(704, 'Warrnambool (C)', 'VIC179', 35181, 0, 13, 0, 0, 0, 'Warrnambool', '2020-11-01', '2020-11-02'),
(705, 'Wellington (S)', 'VIC218', 44380, 0, 16, 0, 0, 0, 'Wellington', '2020-11-01', '2020-11-02'),
(706, 'West Wimmera (S)', 'VIC232', 3841, 0, 1, 0, 0, 0, 'West Wimmera', '2020-11-01', '2020-11-02'),
(707, 'Whitehorse (C)', 'VIC196', 178739, 1, 217, 0.6, 0, 1, 'Whitehorse', '2020-11-01', '2020-11-02'),
(708, 'Whittlesea (C)', 'VIC197', 230238, 1, 1206, 0.4, 0, 1, 'Whittlesea', '2020-11-01', '2020-11-02'),
(709, 'Wodonga (RC)', 'VIC192', 42083, 0, 2, 0, 0, 0, 'Wodonga', '2020-11-01', '2020-11-02'),
(710, 'Wyndham (C)', 'VIC221', 270487, 10, 2264, 3.7, 0, 1, 'Wyndham', '2020-11-01', '2020-11-02'),
(711, 'Yarra (C)', 'VIC202', 101495, 1, 462, 1, 0, 1, 'Yarra', '2020-11-01', '2020-11-02'),
(712, 'Yarra Ranges (S)', 'VIC206', 159462, 0, 248, 0, 0, 0, 'Yarra Ranges', '2020-11-01', '2020-11-02'),
(713, 'Yarriambiack (S)', 'VIC200', 6639, 0, 1, 0, 0, 0, 'Yarriambiack', '2020-11-01', '2020-11-02');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
