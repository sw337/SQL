SELECT category.name, film.title, film.description, film.release_year
FROM film_category
JOIN category ON film_category.category_id = category.category_id
JOIN film ON film.film_id = film_category.film_id
WHERE category.Name = 'Documentary' AND film.description LIKE "%drama%"; 

SELECT  film.title, CONCAT_WS( ',',actor.first_name,  actor.last_name) AS whole_name
FROM film_actor
JOIN  actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
WHERE actor.first_name = 'JULIA' AND actor.last_name = 'MCQUEEN'; 

SELECT  film.title, CONCAT_WS( ',',actor.first_name,  actor.last_name) AS whole_name
FROM film_actor
JOIN  actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
WHERE film.title = 'AMADEUS HOLY'; 

SELECT * 
FROM film
JOIN  inventory ON film.film_id = inventory.film_id
JOIN rental ON rental.inventory_id =  inventory.inventory_id 
JOIN customer ON rental.customer_id = customer.customer_id
WHERE customer.first_name = 'KATHLEEN' AND customer.last_name = 'ADAMS'; 

# What  customers have rented out the most movies?
# What city do most of our customers live in?
# What category of movies is the most popular?