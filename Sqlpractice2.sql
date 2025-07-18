-- ENG: Sql exercise for college
-- PT: Exercício de sql para faculdade

use sakila;

-- Q1 
SELECT title FROM film
WHERE length > 120;

-- Q2
 SELECT rating, count(*)
 FROM film
 group by rating;
 
 -- Q3
 SELECT AVG(rental_rate)
 FROM film;
 
 -- Q4
 SELECT max(replacement_cost)
 FROM film ;
 
 -- Q5
 SELECT first_name, last_name FROM ACTOR
 WHERE last_name like 'S%';
 
 -- Q6
SELECT count(*), active
FROM customer
GROUP BY active;

-- Q7
SELECT title
FROM film
WHERE title like '%love%';

-- Q8
Select name from language
limit 3;

-- Q9
SELECT title, length(title)
FROM film
order by length(title) desc
limit 1;

-- Q10
select concat(first_name, ' ', last_name)
from customer;

-- Q11
select customer_id, sum(amount) from payment
group by customer_id;

-- Q12
select rating, AVG(length)
from film
group by rating;

-- Q13
select country from country
order by country asc;

-- Q14
select country_id, count(*) 
from city
group by country_id;

-- Q15
select title, length
from film
order by length desc
limit 1;

select title, length
from film
order by length asc
limit 1;

-- Q16
update film
set rental_rate = 1.99
where rating = 'G' ;

-- Q17
UPDATE customer
SET active = 0
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM rental
    WHERE rental_date > CURDATE() - INTERVAL 6 MONTH
);

-- Q18
update film
set description = 'Descrição não disponível'
where description is null;

-- Q19
UPDATE film
SET replacement_cost = replacement_cost * 1.10
WHERE length > 100;

-- Q20
update actor
set last_name = 'Lira'
where actor_id = 20;

-- Q21
update customer
set email = 'nome_sobrenome@sakilacustomer.org' ;

-- Q22
update rental
set return_date = current_date()
where return_date = null;

-- Q23
update language
set name = 'Português'
where language_id = 2;

-- Q24
update film
set rental_duration = 7
where rating = 'PG-13';

-- Q25
update category
set name = 'Sci-Fi'
where category_id = 2;

-- Q26
delete from payment
where amount < 1.00;

-- Q27
delete from customer
where customer_id = 10;
-- Q28
delete from film
where rating = 'NC-17';

-- Q29
delete from rental
where return_date < '2005-08-21';

-- Q30
delete from actor
where actor_id = 15;

-- Q31
SELECT customer_id, COUNT(*)
FROM rental
GROUP BY customer_id
HAVING COUNT(*) > 25;

-- Q32
-- Encontrar a média da duração para cada rating
SELECT rating, ROUND(AVG(rental_duration)) AS media_duracao
FROM film
GROUP BY rating;

-- Atualizar a duração de aluguel para a média arredondada por rating
UPDATE film
SET rental_duration = (
    SELECT ROUND(AVG(rental_duration))
    FROM film f2
    WHERE f2.rating = film.rating
)
WHERE EXISTS (
    SELECT 1
    FROM film f2
    WHERE f2.rating = film.rating
);

-- Q33
WITH TotalGasto AS (
    SELECT
        customer_id,
        SUM(amount) AS total_gasto
    FROM
        payment
    GROUP BY
        customer_id
)
DELETE FROM payment
WHERE customer_id IN (
    SELECT customer_id
    FROM TotalGasto
    WHERE total_gasto < 50.00
);

-- Q34
SELECT AVG(length)
FROM film;

SELECT title
FROM film
WHERE length > '115.2720';

-- Q35
WITH AtoresMaisFilmes AS (
SELECT film_actor.actor_id, first_name, last_name, COUNT(*)
FROM film_actor
JOIN actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY COUNT(*) DESC
LIMIT 5
)
UPDATE actor
SET last_name = concat('STAR-',last_name)
WHERE actor_id IN (SELECT actor_id FROM AtoresMaisFilmes);
