SELECT  f.title, f.rental_rate, f.replacement_cost
FROM film f
JOIN  inventory i ON f.film_id = i.film_id
WHERE i.inventory_id IN 
(SELECT inventory_id FROM rental
 WHERE MONTH(return_date) = 5 AND YEAR(return_date) = 2005);
 
# I am not sure if you wanted return date or rental date the instructions said rental date but had an example of return date
# if you wanted it the other way the last line would be  WHERE MONTH(rental_date) = 5 AND YEAR(rental_date) = 2005);

SELECT  f.title,f.rental_rate, MAX(p.amount) AS maximum_profit
FROM film f
JOIN  inventory i ON f.film_id = i.film_id
JOIN  rental r ON r.inventory_id = i.inventory_id
JOIN  payment p ON p.rental_id = r.rental_id
GROUP BY f.title ORDER BY maximum_profit DESC;