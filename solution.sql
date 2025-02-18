CREATE TABLE netflix_titles
(
	Show_id VARCHAR(6),
	type VARCHAR(10),
	title VARCHAR(150),
	director VARCHAR(208),
	casts VARCHAR(1000),
	Country VARCHAR(150),
	date_added VARCHAR(50),
	release_year INT,
	rating VARCHAR (10),
	duration VARCHAR(10),
	listed_in VARCHAR(100),
	description VARCHAR(250) 
);
SELECT * FROM netflix_titles;
SELECT COUNT(*) FROM netflix_titles;

 
 --13 Business problems 
 
 -- 1 How many total records are there in the dataset?
SELECT COUNT(*) FROM netflix_titles;

--2 Find all movies released in 2020.

SELECT * 
	FROM netflix_titles 
	WHERE release_year = 2020 AND type = 'Movie';

--3 List all TV shows directed by 'David Attenborough'.

SELECT * 
	FROM netflix_titles 
	WHERE director = 'David Attenborough' AND type = 'TV Show';

--4 Count the number of movies vs TV shows.

SELECT type, COUNT(*) 
	FROM netflix_titles 
	GROUP BY type;

--5 Get the latest 10 movies added to Netflix.

SELECT *
	FROM netflix_titles 
	WHERE type = 'Movie'  
        ORDER BY date_added DESC LIMIT 10;


--6 Find all titles containing the word ‘Love’.

SELECT * 
	FROM netflix_titles 
	WHERE title LIKE '%Love%';

--7 Find all TV Shows available in India.

SELECT title, country
FROM netflix_titles
WHERE type = 'TV Show' AND country = 'India';

--8 Find movies that are exactly 90 minutes long.

SELECT title, duration
FROM netflix_titles
WHERE type = 'Movie' AND duration = '90 min';

  --9 What are the different genres available on Netflix?
SELECT DISTINCT listed_in
FROM netflix_titles;

--10 Which countries produce the most movies?
SELECT country, COUNT(*) AS movie_count  
FROM netflix_titles  
WHERE type = 'Movie'  
AND country IS NOT NULL  
GROUP BY country  
ORDER BY movie_count DESC  
LIMIT 5;

--11 List All Movies that are Documentaries
SELECT * 
FROM netflix
WHERE listed_in LIKE '%Documentaries';

--12 Find All Content Without a Director
SELECT * 
FROM netflix
WHERE director IS NULL;

--13 Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years
SELECT * 
FROM netflix
WHERE casts LIKE '%Salman Khan%'
  AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;

