--Seleção do tituto do filme e para ver a lista de mais alugados foi preciso passar pelo inventario
-- e depois ver a lista de solicitações
SELECT film.title, COUNT(*) AS TOTAL
FROM film LEFT JOIN inventory
ON inventory.film_id = film.film_id
LEFT JOIN rental
ON rental.inventory_id = inventory.inventory_id
GROUP BY film.title
ORDER BY TOTAL DESC
LIMIT 2