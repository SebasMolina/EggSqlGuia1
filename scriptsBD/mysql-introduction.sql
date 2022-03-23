CREATE DATABASE music;
USE music;
SELECT DATABASE();
SHOW CHARACTER SET;
SHOW TABLES;
SHOW COLUMNS FROM artist;
SHOW COLUMNS FROM album;
DESCRIBE artist;
DESCRIBE album;
DESC artist;
DESC album;

CREATE TABLE artist (
	artist_id INT AUTO_INCREMENT,
    artist_name VARCHAR(128) NOT NULL,
    PRIMARY KEY (artist_id)
);

CREATE TABLE album (
	album_id INT AUTO_INCREMENT,
    album_name VARCHAR(128) NOT NULL,
	artist_id INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);

INSERT INTO artist VALUES (1 , "The Strokes");
INSERT INTO artist VALUES (2 , "Arctic Monkeys");
INSERT INTO artist VALUES (3 , "Tame Impala");
INSERT INTO artist VALUES (4 , "Rex Orange County");
INSERT INTO artist VALUES (5 , "King Krule");
INSERT INTO artist VALUES (6 , "Tom Misch");
INSERT INTO artist VALUES (7 , "John Mayer");

INSERT INTO album VALUES (1 , "Is This It", 1);
INSERT INTO album VALUES (2 , "Comedown Machine", 1);
INSERT INTO album VALUES (3 , "Tranquility Base Hotel & Casino", 2);
INSERT INTO album VALUES (4 , "AM", 2);
INSERT INTO album VALUES (5 , "The Slow Rush", 3);
INSERT INTO album VALUES (6 , "Lonerism", 3);
INSERT INTO album VALUES (7 , "Pony", 4);
INSERT INTO album VALUES (8 , "Apricot Princess", 4);
INSERT INTO album VALUES (9 , "The Ooz", 5);
INSERT INTO album VALUES (10 , "Man Alive!", 5);
INSERT INTO album VALUES (11 , "What Kinda Music", 6);
INSERT INTO album VALUES (12 , "Geography", 6);
INSERT INTO album VALUES (13 , "Born and Raised", 7);
INSERT INTO album VALUES (14 , "Continuum", 7);

INSERT INTO artist VALUES (1 , "The Strokes"),
(2 , "Arctic Monkeys"),
(3 , "Tame Impala"),
(4 , "Rex Orange County"),
(5 , "King Krule"),
(6 , "Tom Misch"),
(7 , "John Mayer");

INSERT INTO album VALUES (1 , "Is This It", 1),
(2 , "Comedown Machine", 1),
(3 , "Tranquility Base Hotel & Casino", 2),
(4 , "AM", 2),
(5 , "The Slow Rush", 3),
(6 , "Lonerism", 3),
(7 , "Pony", 4),
(8 , "Apricot Princess", 4),
(9 , "The Ooz", 5),
(10 , "Man Alive!", 5),
(11 , "What Kinda Music", 6),
(12 , "Geography", 6),
(13 , "Born and Raised", 7),
(14 , "Continuum", 7);

INSERT IGNORE INTO artist VALUES (1 , "The Strokes"),
(2 , "Arctic Monkeys"),
(3 , "Tame Impala"),
(4 , "Rex Orange County"),
(5 , "King Krule"),
(6 , "Tom Misch"),
(7 , "John Mayer");

INSERT IGNORE INTO album VALUES (1 , "Is This It", 1),
(2 , "Comedown Machine", 1),
(3 , "Tranquility Base Hotel & Casino", 2),
(4 , "AM", 2),
(5 , "The Slow Rush", 3),
(6 , "Lonerism", 3),
(7 , "Pony", 4),
(8 , "Apricot Princess", 4),
(9 , "The Ooz", 5),
(10 , "Man Alive!", 5),
(11 , "What Kinda Music", 6),
(12 , "Geography", 6),
(13 , "Born and Raised", 7),
(14 , "Continuum", 7);

INSERT INTO artist (artist_name, artist_id) VALUES ("Frank Ocean", 8);

INSERT INTO album (artist_id, album_id, album_name) VALUES (8 , 15, "Blonde");
INSERT INTO album (artist_id, album_id, album_name) VALUES (8 , 16, "Channel Orange");

SELECT * FROM artist;
SELECT * FROM album;

SELECT * FROM music.artist;
SELECT * FROM music.album;

SET sql_safe_updates = 0; # false
SET sql_safe_updates = 1; # true

DELETE FROM artist;
DELETE FROM album;

TRUNCATE TABLE artist;
TRUNCATE TABLE album;

DELETE FROM album WHERE album_id > 10;
DELETE FROM album WHERE album_id = 10;

DELETE FROM album WHERE artist_id = 1;
DELETE FROM artist WHERE artist_id = 1;

UPDATE artist SET artist_name = UPPER(artist_name);
UPDATE album SET album_name = LOWER(album_name);

UPDATE artist SET artist_name = UPPER(artist_name) WHERE artist_id = 1;
UPDATE album SET album_name = LOWER(album_name) WHERE album_id = 1;

ALTER TABLE album CHANGE album_name name_album VARCHAR(128) NOT NULL;
ALTER TABLE album CHANGE name_album album_name VARCHAR(128) NOT NULL;

ALTER TABLE album MODIFY album_name VARCHAR(128) NULL;

ALTER TABLE artist ADD formed YEAR;
UPDATE artist SET formed = 2002 WHERE artist_id = 2;

ALTER TABLE artist DROP formed;

DROP TABLE artist;
DROP TABLE album;

DROP DATABASE music;

SELECT artist_name FROM artist;
SELECT album_name FROM album;

SELECT * FROM artist WHERE artist_name = "Tame Impala";
SELECT * FROM album WHERE album_name = "Pony";

SELECT * FROM artist WHERE artist_name <> "Tame Impala";
SELECT * FROM album WHERE album_name <> "Pony";

SELECT artist_name FROM artist WHERE artist_name < "M";
SELECT artist_name FROM artist WHERE artist_name > "M";

SELECT album_name FROM album WHERE album_name LIKE "The%";
SELECT album_name FROM album WHERE album_name LIKE "%cess";
SELECT album_name FROM album WHERE album_name LIKE "T__ %";
SELECT album_name FROM album WHERE album_name LIKE "%slow%";

SELECT * FROM album WHERE NOT (album_id = 1 OR album_id = 3);
SELECT * FROM album WHERE NOT (album_id = 1) AND NOT (album_id = 3);
SELECT * FROM album WHERE album_id != 1 AND album_id != 3;
SELECT * FROM album WHERE album_id != 1 AND NOT (album_id = 3);

SELECT * FROM album WHERE album_id > 2
AND NOT (album_id = 4 OR album_id = 6);

SELECT * FROM album WHERE album_id > 2
AND (NOT album_id) = 4 OR album_id = 6;
SELECT album_name FROM album WHERE album_name NOT LIKE "L%";
SELECT album_name FROM album WHERE
album_name LIKE "S%" AND album_name NOT LIKE "%)";

SELECT * FROM artist ORDER BY artist_name;

SELECT artist_name FROM artist WHERE
artist_name LIKE "T%" XOR
artist_name LIKE "%s";

SELECT album_name FROM album WHERE
album_name > "C" AND album_name < "M";

SELECT album_name FROM album WHERE
album_name LIKE "L%" OR
album_name LIKE "S%" OR
album_name LIKE "P%";

SELECT album_name FROM album WHERE
album_name LIKE "L%" OR
(album_name LIKE "C%" AND album_name LIKE "%m");

SELECT artist_name, album_name FROM artist INNER JOIN album
USING (artist_id);