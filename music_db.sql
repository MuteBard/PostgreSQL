CREATE TABLE album (
	id serial PRIMARY KEY,
	name varchar,
	artist_id integer REFERENCES people (id),
	year date

);

CREATE TABLE song (
	id serial PRIMARY KEY,
	name varchar,
	writer_id integer REFERENCES people (id)

);

CREATE TABLE track (
	id serial PRIMARY KEY,
	album integer REFERENCES album (id),
	song integer REFERENCES song (id),
	duration numeric
);

CREATE TABLE people (
	id serial PRIMARY KEY,
	name varchar
);

insert into people values
	-- ARTISTS
	(default, 'Jacoo'),
	(default, 'XI'),
	(default, 'Nym'),
	(default, 'Ed Harrison'),
	(default, 'Nujabes'),

	--WRITERS
	(default, 'Jacoo Music'),
	(default, 'Legit Liquid'),
	(default, 'Beastly Mudkip'),
	(default, 'Justin') ,
	(default, 'Konectt');

insert into song values
	(default, 'In the shadows... looking for a light', 6),
	(default, 'Breathe', 6),
	(default, 'Eternity', 6),
	(default, 'Dreamcatcher', 6),
	(default, 'Withering', 6),
	(default, 'Sunrise Plaza', 6),

	(default, 'Akasha', 7),
	(default, 'ADpiano', 7),
	(default, 'Vanitas', 7),
	(default, 'Agartha', 7),

	(default, 'Sleep',9),
	(default, 'Duel at Diablo',9),
	(default, 'Lesser Known Good',9),
	(default, 'Thistle feat. Emancipato',9),

	(default, 'Annul', 9),
	(default, 'Departure', 9),
	(default, 'Tin Soldiers', 9),
	(default, 'Scrap IO', 9),
	(default, 'Tachi', 9),
	(default, 'Automata', 9),
	(default, 'Imbrium', 9),

	(default, 'Yes ft Pase Rock', 10),
	(default, 'Another Reflection', 10),
	(default, 'Tsurugi No Mai', 10),
	(default, 'Lady Brown', 10),
	(default, 'Reflection Eternal', 10),
	(default, 'Counting Stars', 10);



insert into album values
	-- (default, 'album name', artist key, date)
	 (default, 'Dark', 2, '1960-12-21'),
	 (default, 'Light', 2, '1965-7-14'),
	 (default, 'Water', 3, '1970-4-18'),
	 (default, 'Fire', 3, '1975-10-16'),
	 (default, 'Electric', 4, '1980-10-2'),
	 (default, 'Ground', 4, '1985-8-4'),
	 (default, 'Dragon', 5, '1990-6-3'),
	 (default, 'Steel', 5, '1995-3-5'),
	 (default, 'Fairy', 6, '1972-12-1'),
	 (default, 'Poison', 6, '1962-9-3');


insert into track values
	-- (default, album key, song key, duration)

	(default, 1, 1, 2.34),
	(default, 1, 2, 2.15),
	(default, 1, 3, 2.20),
	(default, 1, 4, 2.58),
	(default, 2, 5, 2.39),
	(default, 2, 6, 3.18),
	(default, 2, 7, 3.56),
	(default, 2, 8, 3.00),
	(default, 3, 9, 3.50),
	(default, 3, 10, 3.40),
	(default, 3, 11, 4.28),
	(default, 3, 12, 4.08),
	(default, 4, 13, 4.52),
	(default, 4, 14, 4.30),
	(default, 4, 15, 4.53),
	(default, 5, 16, 4.30),
	(default, 5, 17, 5.16),
	(default, 6, 18, 5.38),
	(default, 6, 19, 5.42),
	(default, 7, 20, 5.43),
	(default, 7, 21, 5.34),
	(default, 8, 22, 1.32),
	(default, 8, 23, 1.52),
	(default, 9, 24, 1.56),
	(default, 9, 25, 6.22),
	(default, 10, 26, 6.04),
	(default, 10, 27, 6.08);

--What are tracks for a given album?
SELECT
  id
FROM
  track
WHERE
  album = 1

-- What are the albums produced by a given artist?
SELECT
  *
FROM
  album
WHERE
  album.artist_id = 1

-- What is the track with the longest duration?
SELECT
	track.id, track.duration
FROM
	track
ORDER BY
	track.duration
DESC LIMIT 1



-- What are the albums released in the 60s? 70s? 80s? 90s?
SELECT
  *
FROM
  album
WHERE
  year
Between '1960-1-1' AND '1969-12-31';

SELECT
  *
FROM
  album
WHERE
  year
Between '1970-1-1' AND '1979-12-31';

SELECT
  *
FROM
  album
WHERE
  year
Between '1980-1-1' AND '1989-12-31';

SELECT
  *
FROM
  album
WHERE
  year
Between '1990-1-1' AND '1999-12-31';

-- How many albums did a given artist produce in the 90s?

SELECT
  COUNT(id)
FROM
  (SELECT
    album
  FROM
    album
  WHERE
    year
  Between '1990-1-1' AND '1999-12-31')x



-- What year is each artist's latest album?
SELECT
  artist_id, COUNT(id)
FROM
  album
WHERE
  year
BETWEEN
  '1990-1-1' AND '1999-12-31'
GROUP BY
  artist_id
-- What is the title of each artist's latest album? *Hint: try using a combination of order by, a subselect, and a distinct on*
SELECT
  *
FROM
  album
where
  year in
  (select distinct max(year)
   from
      album
   group by
      artist_id);

-- List all albums along with its total duration based on summing the duration of its tracks.
--
--if the album number is the same, sum the durations
select album.name, sum(track.duration) as album_sum
from track, album
where album.id = track.album
group by album.name
order by album_sum;

-- What is the album with the longest duration?
select album.name, sum(track.duration) as album_sum
from track, album
where album.id = track.album
group by album.name
order by album_sum
desc limit 1;

-- Who are the 5 most prolific artists based on the number of albums they have recorded?
select
	people.name, count(album.id) as album_count
from
	album, people
	--whenever 2, include connecting statment
where
	album.artist_id = people.id
group by
	people.name
order by
	album_count
desc limit 5

--find the count of the number of albums for each artist
select
	people.name, count(album.id) as album_count
from
	album, people
	--whenever 2, include connecting statment
where
	album.artist_id = people.id
group by
	people.name
order by
	album_count


-- What are all the tracks a given artist has recorded?


-- What are the top 5 most often recorded songs?

-- Who are the top 5 song writers whose songs have been most often recorded?

----what is every song that each writer has written?
select people.name, count(song.id) as songs
from song, people
where song.writer_id = people.id
group by people.name
order by songs desc limit 5;

-- Who is the most prolific song writer based on the number of songs he has written?
select people.name, count(song.id) as songs
from song, people
where song.writer_id = people.id
group by people.name
order by songs desc limit 1;
