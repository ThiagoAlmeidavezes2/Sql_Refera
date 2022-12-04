--Criando uma tabela com o id dos 16 filmes mais alugados
create table mais_assistidos as
select film.film_id, count(*) as TOTAL
from film left join inventory
ON inventory.film_id = film.film_id
LEFT JOIN rental
ON rental.inventory_id = inventory.inventory_id
GROUP BY film.film_id
ORDER BY TOTAL DESC
LIMIT 16

--Selecionando o ator com maior participação nos 16 filmes mais assistidos.
SELECT nome_completo AS ator_mais_destaque
FROM (SELECT CONCAT (actor.first_name,' ',actor.last_name) AS nome_completo, COUNT(*) AS total
FROM actor LEFT JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN mais_assistidos
ON film_actor.film_id = mais_assistidos.film_id
GROUP BY nome_completo
ORDER BY TOTAL DESC) AS total
LIMIT 1