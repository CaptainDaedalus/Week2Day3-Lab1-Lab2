USE sakila;

-- In the table actor, which are the actors whose last names are not repeated?
-- For example if you would sort the data in the table actor by last_name,
-- you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd.
-- These three actors have the same last name.
-- So we do not want to include this last name in our output.
-- Last name "Astaire" is present only one time with actor "Angelina Astaire",
-- hence we would want this in our output list.
SELECT last_name
	FROM actor
    GROUP BY (last_name)
    HAVING count(last_name) = 1;

-- Which last names appear more than once?
-- We would use the same logic as in the previous question but this time we want to include
-- the last names of the actors where the last name was present more than once
SELECT last_name
	FROM actor
    GROUP BY (last_name)
    HAVING count(last_name) > 1;

-- Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, count(*) as processed FROM rental
	GROUP BY staff_id;

-- Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(*) as "Number of Releases"
	FROM film
	GROUP BY release_year;

-- Using the film table, find out for each rating how many films were there.
SELECT rating, COUNT(*) as "Number of Films"
	FROM film
	GROUP BY rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating, round(avg(length), 2) as average_length
	FROM film
	GROUP BY rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, round(avg(length), 2) as average_length
	FROM film
	GROUP BY rating
    HAVING average_length > 120;

-- Rank films by length (filter out the rows that have nulls or 0s in length column).
SELECT *, RANK() OVER (ORDER BY length) AS ranking 
	FROM film
	WHERE length > 0 AND NOT ISNULL(length);

-- In your output, only select the columns title, length, and the rank.
SELECT title, length, RANK() OVER (ORDER BY length) AS ranking 
	FROM film
	WHERE length > 0 AND NOT ISNULL(length);
    