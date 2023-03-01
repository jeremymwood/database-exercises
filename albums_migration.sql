DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(255) NOT NULL DEFAULT 'NONE',
    album_name VARCHAR(50) NOT NULL DEFAULT 'NONE',
    release_date YEAR(4) NOT NULL DEFAULT 0,
    sales FLOAT NOT NULL DEFAULT 0,
    genre VARCHAR(50) NOT NULL DEFAULT 'NONE',
    PRIMARY KEY (id)
);

# DROP TABLE IF EXISTS `albums`;
# CREATE TABLE `albums` (
#   `id` int(11) NOT NULL AUTO_INCREMENT,
#   `artist` varchar(128) NOT NULL DEFAULT '',
#   `album_name` varchar(128) NOT NULL DEFAULT '',
#   `release_date` int(11) NOT NULL DEFAULT 2000,
#   `sales` decimal(12,6) NOT NULL DEFAULT 0.000000,
#   `genre` varchar(1024) NOT NULL DEFAULT 'Unknown',
#   PRIMARY KEY (`id`),
#   UNIQUE KEY `albums_artist_album_name_uindex` (`artist`,`album_name`)
# )