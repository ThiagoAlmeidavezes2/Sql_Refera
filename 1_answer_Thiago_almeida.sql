with juncao as 
(select film_id, count(*) as total_alugado
from rental r left join inventory i
on r.inventory_id = i.inventory_id
group by film_id)

select f.title, total_alugado
from juncao j inner join film f
on j.film_id = f.film_id
order by total_alugado desc
limit 2




