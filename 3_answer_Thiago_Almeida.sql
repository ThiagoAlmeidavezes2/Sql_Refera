with cliente_data as
(select customer_id, EXTRACT(MONTH FROM min(rental_date)) as data_inicio
from rental
group by customer_id)

select data_inicio, count(*)
from cliente_data
group by data_inicio
order by data_inicio


