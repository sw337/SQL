SELECT first_name, last_name, SUM(amount) AS totalSpent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
WHERE p.rental_id IN 
(SELECT rental_id FROM rental WHERE rental_date BETWEEN'2005-05-25' AND '2005-05-26')
GROUP BY first_name, last_name;

SELECT first_name, last_name
FROM actor a
JOIN film_actor f ON f.actor_id =  a.actor_id
WHERE f.film_id IN 
(SELECT film_id FROM film WHERE rating = 'PG' );


SELECT first_name, last_name, 
(SELECT SUM(amount)  FROM payment WHERE c.customer_id = payment.customer_id) AS totalSpent
FROM customer c
GROUP BY last_name, first_name;


/*
 A subquery is a query that is nested inside another statement that selects information without having
 to join
 
 example: (SELECT rental_id FROM rental WHERE rental_date BETWEEN'2005-05-25' AND '2005-05-26')


A correlated subquery is a type of subquery that is part of the main query but runs as a loop

(SELECT SUM(amount)  FROM payment WHERE c.customer_id = payment.customer_id) AS totalSpent

*\
