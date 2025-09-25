CREATE DATABASE movies_data
use movies_data
select * from [dbo].[movies]

SELECT COUNT(*) AS TotalMovies
FROM movies;
SELECT SUM(Global_BoxOfficeUSD) AS Total_Revenue
FROM movies;
SELECT AVG(IMDbRating) AS Average_Rating
FROM movies;

SELECT AVG(BudgetUSD) AS Average_Budget
FROM movies;


SELECT DISTINCT Genre FROM movies ORDER BY Genre;

SELECT DISTINCT Country FROM  movies ORDER BY Country;
SELECT DISTINCT Director FROM  movies ORDER BY Director;
SELECT Genre, COUNT(*) AS TotalMoviesByGenre
FROM movies
GROUP BY Genre
ORDER BY TotalMoviesByGenre DESC;


SELECT ReleaseYear, SUM(Global_BoxOfficeUSD) AS YearlyRevenue
FROM movies
GROUP BY ReleaseYear
ORDER BY ReleaseYear;

SELECT Genre, SUM(Global_BoxOfficeUSD) AS share
FROM movies
GROUP BY Genre
ORDER BY Genre;

SELECT TOP 10 
    Title as MovieName, 
SUM(Global_BoxOfficeUSD) AS GlobalRevenue  FROM Movies
group by Title
ORDER BY GlobalRevenue DESC;

SELECT 
    CASE
        WHEN IMDbRating >= 8 THEN 'Excellent'
        WHEN IMDbRating >= 6 THEN 'Good'
        WHEN IMDbRating >= 4 THEN 'Average'
        ELSE 'Poor'
    END AS RatingCategory,
    ROUND(AVG(IMDbRating), 2) AS Avg_IMDb_Rating,
    COUNT(*) AS TotalMovies
FROM Movies
GROUP BY 
    CASE
        WHEN IMDbRating >= 8 THEN 'Excellent'
        WHEN IMDbRating >= 6 THEN 'Good'
        WHEN IMDbRating >= 4 THEN 'Average'
        ELSE 'Poor'
    END
ORDER BY Avg_IMDb_Rating DESC;

SELECT 
    SUM(Global_BoxOfficeUSD) - SUM(BudgetUSD) AS Profit
FROM Movies;
SELECT 
    ROUND(
        ( (SUM(Global_BoxOfficeUSD) - SUM(BudgetUSD)) * 100.0 / SUM(BudgetUSD) )
    , 2) AS ROI_Percentage
FROM Movies;


