use sakila;
-- 1. Select all the actors with the first name ‘Scarlett’.
select distinct first_name from sakila.actor
where (first_name = 'Scarlett');

-- 2.How many films (movies) are available for rent and how many films have been rented?
SELECT SUM(film_id) as 'Available Movies', SUM(rental_rate) as 'Rental Rate'
FROM sakila.film;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration?
SELECT MAX(length) as 'max length', MIN(length) as 'min length'
from sakila.film;

-- 4.What's the average movie duration expressed in format (hours, minutes)?
select distinct length, title from sakila.film; -- > minutes

-- 5. How many distinct (different) actors' last names are there?
select count(distinct actor_id) from sakila.film_actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT abs(DATEDIFF(min(rental_date), max(rental_date))) FROM rental;

-- 7.Show rental info with additional columns month and weekday. Get 20 results?
SELECT *, month(rental_date), weekday(rental_date) as weekday FROM rental;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,
    CASE
        WHEN weekday(rental_date) < 6 then 'workday'
        ELSE 'weekend'
        END AS 'day_type'
    FROM rental;

-- 9. Get release years.
select distinct release_year from sakila.film; -- all were release 2006

-- 10. Get all films with ARMAGEDDON in the title.
select distinct title from sakila.film
where title LIKE 'ARMA%' or '%ARMA';


-- 11. Get all films which title ends with APOLLO.
select distinct title from sakila.film
where title LIKE '%APOLLO';

-- 12. Get 10 the longest films.
select distinct title from sakila.film;
SELECT title FROM film -- > same as line on top, but shorter
WHERE length(title) = (SELECT max(length(title)) FROM film);

-- 13. How many films include Behind the Scenes content?

SELECT count(*) FROM film WHERE special_features LIKE '%Behind the Scenes%';
