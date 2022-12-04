--Criação da tabela com todos registro dos clientes e dos meses que cada um alugou um filme
create table clientes_mes_aluguel as
SELECT customer_id AS Cliente, EXTRACT(MONTH FROM rental_date) AS mes 
FROM rental

--Baseado na tabela criada anteriormente agora foi selecionado somente o mês correspondente ao primeiro
--aluguel de filme de cada cliente
CREATE TABLE clientes_primeiro_aluguel AS
SELECT a.cliente, (SELECT min(b.mes) 
FROM clientes_mes_aluguel b WHERE b.cliente = a.cliente) AS mes 
FROM clientes_mes_aluguel a GROUP BY a.cliente;

--Agrupamento do total clientes por mês
select mes, count(*)
from clientes_primeiro_aluguel
group by mes

-- verificando o número total de clientes na base
select count(*)
from customer

--Ao todo são 599 clientes na base de clientes, e a distribuição dos meses que cada cliente fez o primeiro aluguel