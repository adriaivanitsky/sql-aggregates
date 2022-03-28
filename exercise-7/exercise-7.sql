-- customer ranking by total film time watched
-- similar to exercise 6

SELECT
  customer.email,
  RANK() OVER (ORDER BY SUM(film.length) DESC)
FROM
  rental
INNER JOIN inventory
ON inventory.inventory_id = rental.inventory_id
LEFT JOIN film
ON film.film_id = inventory.film_id
INNER JOIN customer
ON customer.customer_id = rental.customer_id
GROUP BY customer.email
ORDER BY rank ASC;