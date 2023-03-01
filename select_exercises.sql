SELECT album_name FROM albums WHERE artist = 'Pink Floyd';
-- SELECT release_date FROM albums WHERE album_name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

SELECT genre FROM albums WHERE album_name = 'Nevermind';
SELECT album_name FROM albums WHERE release_date BETWEEN 1990 AND 1999;
SELECT album_name FROM albums WHERE sales < 20000000;
SELECT album_name FROM albums WHERE genre = 'Rock';
