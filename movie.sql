USE movies;

SELECT * FROM movies;

select * from movies 
where budget =0 
order by gross desc;

SELECT * FROM movies;

# This query selects the top 10 companies by total gross revenue
SELECT * FROM (
    SELECT company, SUM(gross) as total FROM movies 
    GROUP BY company
    ORDER BY total DESC
) AS top_companies
LIMIT 10;

# This query selects the top 10 movies by total gross revenue
SELECT name, SUM(gross) as total FROM movies
GROUP BY name
ORDER BY total DESC
LIMIT 10;

# This query selects the top 10 low budget movies
SELECT * FROM (
    SELECT name, SUM(budget) as total FROM movies 
    GROUP BY name
    ORDER BY total
) AS low_budget_movies
LIMIT 10;

SELECT year, name, SUM(gross) as total FROM movies
GROUP BY year
ORDER BY year, total DESC
LIMIT 1;

# This query select top grossing movies and its gross from year 1980 to 1990
SELECT year, name, total FROM (
    SELECT year, name, SUM(gross) as total, MAX(SUM(gross)) OVER (PARTITION BY year) as max_total FROM movies
    WHERE year >= 1980 AND year <= 1990
    GROUP BY year, name
) as top_movies
WHERE total = max_total
ORDER BY year;
select * from movies;

SELECT * FROM (
    SELECT *,  SUM(gross) as total, MAX(SUM(gross)) OVER (PARTITION BY year) as max_total FROM movies
    WHERE year >= 1980 AND year <= 1990
    GROUP BY year, name
) as top_movies
WHERE total = max_total
ORDER BY year;

SHOW COLUMNS FROM movies;

#To view the number of movies released in each year:
SELECT year, COUNT(*)
FROM movies
GROUP BY year;

#To view the top 5 highest grossing movies in the Action genre
SELECT name, gross
FROM movies
WHERE genre = 'Action'
ORDER BY gross DESC
LIMIT 5;

#To view the top 3 highest grossing movies directed by Steven Spielberg
SELECT name, gross
FROM movies
WHERE director = 'Steven Spielberg'
ORDER BY gross DESC
LIMIT 3;

#To view the average budget of movies released in the 1980s
SELECT AVG(budget) as Average_budget
FROM movies
WHERE year BETWEEN 1980 AND 1989;

#To view the top 3 highest grossing movies starring Harrison Ford
SELECT name, gross
FROM movies
WHERE star = 'Harrison Ford'
ORDER BY gross DESC
LIMIT 3;

#To view the average runtime of movies in the Family genre
SELECT AVG(runtime) as RunTime_in_minutes
FROM movies
WHERE genre = 'Family';

#To view the total gross of all movies produced by Lucasfilm
SELECT SUM(gross) 
FROM movies
WHERE company = 'Lucasfilm';

#To view the average score of movies rated PG-13
SELECT AVG(score)
FROM movies
WHERE rating = 'PG-13';

#To find the average score and budget of movies directed by a specific person
SELECT AVG(score) as Average_Score, AVG(budget) as Average_Budget
FROM movies 
WHERE director = 'Steven Spielberg';

#To find the top 10 most profitable movies (calculated by gross revenue minus budget)
SELECT name, (gross - budget) as profit 
FROM movies 
ORDER BY profit DESC 
LIMIT 10;

#To find the highest profitable movie of each directors
SELECT name, director, MAX(profit) as profit
FROM (
    SELECT name, director, (gross - budget) as profit
    FROM movies
) as subquery
GROUP BY director
ORDER BY profit DESC
LIMIT 0, 1000;
















