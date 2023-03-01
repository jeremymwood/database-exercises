-- Adminer 4.7.6 MySQL du mp

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist` varchar(128) NOT NULL DEFAULT '',
  `album_name` varchar(128) NOT NULL DEFAULT '',
  `release_date` int(11) NOT NULL DEFAULT 2000,
  `sales` decimal(12,6) NOT NULL DEFAULT 0.000000,
  `genre` varchar(1024) NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY (`id`),
  UNIQUE KEY `albums_artist_album_name_uindex` (`artist`,`album_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `albums` (`id`, `artist`, `album_name`, `release_date`, `sales`, `genre`) VALUES
(1,	'Michael Jackson',	'Thriller',	1982,	50.200000,	'Pop, post-disco, funk, rock'),
(2,	'AC/DC',	'Back in Black',	1980,	30.100000,	'Hard rock'),
(4,	'Pink Floyd',	'The Dark Side of the Moon',	1973,	24.800000,	'Progressive rock'),
(5,	'Eagles',	'Their Greatest Hits (1971–1975)',	1976,	41.200000,	'Country rock, soft rock, folk rock'),
(6,	'Eagles',	'Hotel California',	1976,	31.800000,	'Soft rock'),
(8,	'Fleetwood Mac',	'Rumours',	1977,	29.300000,	'Soft rock'),
(10,	'Led Zeppelin',	'Led Zeppelin IV',	1971,	30.400000,	'Hard rock, heavy metal, folk roc'),
(11,	'Michael Jackson',	'Bad',	1987,	21.100000,	'Pop, rhythm and blues, funk and '),
(12,	'Meat Loaf',	'Bat Out of Hell',	1977,	22.000000,	'Hard rock, glam rock, progressive rock'),
(14,	'Various artists',	'Dirty Dancing',	1987,	24.100000,	'Pop, rock, R&B'),
(18,	'Metallica',	'Metallica',	1991,	22.700000,	'Heavy metal'),
(20,	'Guns N\' Roses',	'Appetite for Destruction',	1987,	22.800000,	'Hard rock'),
(21,	'Bob Marley & The Wailers',	'Legend: The Best of Bob Marley & The Wailers',	1984,	22.900000,	'Reggae'),
(22,	'Bruce Springsteen',	'Born in the U.S.A.',	1984,	22.000000,	'Heartland rock'),
(24,	'Dire Straits',	'Brothers in Arms',	1985,	21.100000,	'Roots rock, blues rock, soft rock'),
(26,	'Madonna',	'The Immaculate Collection ',	1990,	19.800000,	'Pop, dance'),
(27,	'Pink Floyd',	'The Wall',	1979,	18.900000,	'Progressive rock'),
(28,	'The Beatles',	'Sgt. Pepper\'s Lonely Hearts Club Band',	1967,	18.300000,	'Rock'),
(29,	'Michael Jackson',	'Dangerous',	1991,	17.000000,	'New jack swing, R&B and pop'),
(30,	'The Beatles',	'Abbey Road',	1969,	16.800000,	'Rock'),
(32,	'Michael Jackson',	'Thriller2',	1900,	2.000000,	'stuff');