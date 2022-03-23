CREATE DATABASE IF NOT EXISTS music;
USE music;

SHOW CREATE TABLE artist;

CREATE TABLE artist (
	artist_id INT AUTO_INCREMENT,
    artist_name VARCHAR(125) NOT NULL,
    formed YEAR,
    PRIMARY KEY (artist_id)
);

CREATE TABLE album (
	album_id INT AUTO_INCREMENT,
    album_name VARCHAR(125) NOT NULL,
	artist_id INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);

CREATE TABLE track (
	track_id SMALLINT AUTO_INCREMENT,
    track_name VARCHAR(125) NOT NULL,
	album_id INT NOT NULL,
    PRIMARY KEY (track_id),
    FOREIGN KEY (album_id) REFERENCES album(album_id)
);

INSERT INTO artist (artist_name, formed) VALUES ("The Strokes", 1998),
("Arctic Monkeys", 2002),
("Tame Impala", 2007),
("Rex Orange County", 2016),
("King Krule", 2013),
("Tom Misch", 2012),
("John Mayer", 2001);


INSERT INTO album (album_name, artist_id) VALUES ("Is This It", 1),
("Comedown Machine", 1),
("Tranquility Base Hotel & Casino", 2),
("AM", 2),
("The Slow Rush", 3),
("Lonerism", 3),
("Pony", 4),
("Apricot Princess", 4),
("The Ooz", 5),
("Man Alive!", 5),
("What Kinda Music", 6),
("Geography", 6),
("Born and Raised", 7),
("Continuum", 7);

INSERT INTO track (track_name, album_id) VALUES ("Is This It", 1),
("The Modern Age", 1),
("Soma", 1),
("Barely Legal", 1),
("Someday", 1),
("Alone, Together", 1),
("Last Nite", 1),
("Hard to Explain", 1),
("New York City Cops", 1),
("Trying Your Luck", 1),
("Take It or Leave It", 1);

INSERT INTO track (track_name, album_id) VALUES ("Tap Out", 2),
("All the Time", 2),
("One Way Trigger", 2),
("Welcome to Japan", 2),
("80's Comedown Machine", 2),
("50/50", 2),
("Slow Animals", 2),
("Partners In Crime", 2),
("Chances", 2),
("Happy Ending", 2),
("Call It Fate, Call It Karma", 2);

SELECT * FROM artist ORDER BY artist_name;

SELECT * FROM artist ORDER BY artist_name ASC;
SELECT * FROM artist ORDER BY artist_name DESC;

SELECT * FROM artist ORDER BY formed, artist_name;

SELECT * FROM artist
WHERE artist_name LIKE "T%"
ORDER BY formed DESC, artist_name ASC;

SELECT * FROM artist ORDER BY artist_name;
SELECT * FROM artist ORDER BY BINARY artist_name;

SELECT artist_name FROM artist WHERE artist_name < "T";
SELECT artist_name FROM artist WHERE artist_name < "t";
SELECT artist_name FROM artist WHERE artist_name < BINARY "T";
SELECT artist_name FROM artist WHERE artist_name < BINARY "t";

SELECT * FROM track WHERE album_id = 1 LIMIT 3;
SELECT * FROM track WHERE album_id = 1 LIMIT 5,5;
SELECT * FROM track WHERE album_id = 1 LIMIT 5,999999999;
SELECT * FROM track WHERE album_id = 1 LIMIT 5 OFFSET 5;

SELECT artist_name, album_name FROM artist INNER JOIN album
USING (artist_id);

SELECT artist_name, album_name FROM album INNER JOIN artist
USING (artist_id);

SELECT ar.artist_name, al.album_name FROM artist ar, album al
WHERE ar.artist_id = al.artist_id;

SELECT artist_name, album_name FROM artist INNER JOIN album
USING (artist_id)
ORDER BY artist_name;

SELECT artist_name, album_name FROM artist
INNER JOIN album
ON artist.artist_id = album.artist_id;

SHOW CREATE DATABASE music;