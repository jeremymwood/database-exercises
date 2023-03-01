SELECT * FROM albums;
UPDATE albums
SET sales = sales * 10;
SELECT * FROM albums;

SELECT * FROM albums WHERE release_date < 1980;
UPDATE albums
SET release_date = release_date + 100;
SELECT * FROM albums WHERE release_date > 2000;

SELECT * FROM albums WHERE artist = 'Michael Jackson';
UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';
SELECT * FROM albums WHERE artist = 'Peter Jackson';
