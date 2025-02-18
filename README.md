# Netflix Movies and TV Shows Data Analysis using SQL
![Netflix ](https://github.com/Manikandan-V-26/Netflix_sql_project/blob/main/logo.png)

## Overview
This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to extract valuable insights and answer various business questions based on the dataset. The following README provides a detailed account of the project's objectives, business problems, solutions, findings, and conclusions.

## Objectives

- Analyze the distribution of content types (movies vs TV shows).
- Identify the most common ratings for movies and TV shows.
- List and analyze content based on release years, countries, and durations.
- Explore and categorize content based on specific criteria and keywords.

## Dataset

The data for this project is sourced from the Kaggle dataset:

- **Dataset Link:** [Movies Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

## Schema

```sql
DROP TABLE IF EXISTS netflix;
CREATE TABLE  netflix_titles
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
```

## Business Problems and Solutions

### 1.How many total records are there in the dataset?

```sql
SELECT
COUNT(*) FROM netflix_titles;
```

**Objective:** To determine the total number of records in the dataset, giving an idea of the dataset’s size.

### 2.  Find all movies released in 2020.

```sql
SELECT * 
	FROM netflix_titles 
	WHERE release_year = 2020 AND type = 'Movie';
```

**Objective:** To extract all movies that were specifically released in the year 2020

### 3. List all TV shows directed by 'David Attenborough'.

```sql
SELECT * 
	FROM netflix_titles 
	WHERE director = 'David Attenborough' AND type = 'TV Show';
```

**Objective:** To filter TV Shows directed by a specific person, in this case, David Attenborough.

### 4.  Count the number of movies vs TV shows.

```sql
SELECT type, COUNT(*) 
	FROM netflix_titles 
	GROUP BY type;
```

**Objective:** To compare how many Movies vs TV Shows are available in the dataset.

### 5. Get the latest 10 movies added to Netflix.

```sql

SELECT *
	FROM netflix_titles 
	WHERE type = 'Movie'  
        ORDER BY date_added DESC LIMIT 10;
```

**Objective:** To retrieve the most recently added movies to Netflix.

### 6. Find all titles containing the word ‘Love’.

```sql
SELECT * 
	FROM netflix_titles 
	WHERE title LIKE '%Love%';
```

**Objective:** To find all movies and TV shows with "Love" in the title, useful for keyword-based searches.

### 7. Find all TV Shows available in India.

```sql
SELECT title, country
FROM netflix_titles
WHERE type = 'TV Show' AND country = 'India';
```

**Objective:** To list all TV Shows available in India, helping in region-specific content analysis and recommendations.

### 8.  Find movies that are exactly 90 minutes long.

```sql
SELECT title, duration
FROM netflix_titles
WHERE type = 'Movie' AND duration = '90 min';
```

**Objective:** To identify movies with a duration of exactly 90 minutes, useful for quick watch recommendations and content filtering.

### 9.What are the different genres available on Netflix?

```sql
SELECT DISTINCT listed_in
FROM netflix_titles;
```

**Objective:** To retrieve all unique genres available on Netflix, helping in content classification and analysis.

### 10.Which countries produce the most movies?

```sql
SELECT country, COUNT(*) AS movie_count  
FROM netflix_titles  
WHERE type = 'Movie'  
AND country IS NOT NULL  
GROUP BY country  
ORDER BY movie_count DESC  
LIMIT 5;
```

**Objective:** This query lists the top 5 countries that have produced the most movies.


### 11. List All Movies that are Documentaries

```sql
SELECT * 
FROM netflix
WHERE listed_in LIKE '%Documentaries';
```

**Objective:** Retrieve all movies classified as documentaries.

### 12. Find All Content Without a Director

```sql
SELECT * 
FROM netflix
WHERE director IS NULL;
```

**Objective:** List content that does not have a director.

### 13. Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years

```sql
SELECT * 
FROM netflix
WHERE casts LIKE '%Salman Khan%'
  AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;
```

**Objective:** Count the number of movies featuring 'Salman Khan' in the last 10 years.

## Findings and Conclusion

- **Content Distribution:** The dataset contains a diverse range of movies and TV shows with varying ratings and genres.
- **Common Ratings:** Insights into the most common ratings provide an understanding of the content's target audience.
- **Geographical Insights:** The top countries and the average content releases by India highlight regional content distribution.
- **Content Categorization:** Categorizing content based on specific keywords helps in understanding the nature of content available on Netflix.

This analysis provides a comprehensive view of Netflix's content and can help inform content strategy and decision-making.

### let's connect 
- **LinkedIn**: [Connect with me professionally]()



