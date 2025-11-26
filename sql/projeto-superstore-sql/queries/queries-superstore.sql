#Total de Pedidos
SELECT COUNT(order_id) FROM portfolio.superstore

#Receita Total
SELECT SUM(Sales) FROM portfolio.superstore

#Clientes únicos
SELECT DISTINCT customer_id FROM portfolio.superstore

#Ticket médio
SELECT (SUM(Sales) / COUNT(DISTINCT order_id)) as ticket_medio FROM portfolio.superstore

#Top 10 produtos mais vendidos e sua representatividade em %
WITH vendas_produto AS (
    SELECT product_id, SUM(Sales) AS total_vendas FROM portfolio.superstore GROUP BY product_id
),
top10 AS (
    SELECT product_id, total_vendas FROM vendas_produto ORDER BY total_vendas DESC LIMIT 10
),
totais AS (
    SELECT (SELECT SUM(total_vendas) FROM top10) AS receita_top10, 
	(SELECT SUM(Sales) FROM portfolio.superstore) AS receita_total
)
SELECT
    receita_top10, receita_total, receita_top10 / NULLIF(receita_total, 0) * 100 AS perc_receita_top10 FROM totais;
	SELECT category, SUM(sales) as total FROM portfolio.superstore GROUP BY category ORDER BY total DESC


#Top 10 produtos que mais representam a receita em %
WITH total as (SELECT SUM(sales) as receita_total FROM portfolio.superstore),
por_categoria as (
	SELECT category, SUM(sales) as receita FROM portfolio.superstore GROUP BY category
)
SELECT (
	SELECT receita_total FROM total) as receita_total, pc.category, pc.receita, t.receita_total, (pc.receita / t.receita_total) * 100 AS perc_receita
	FROM por_categoria pc CROSS JOIN total t ORDER BY perc_receita DESC;
	
	SELECT category, AVG(profit / sales) as margem FROM portfolio.superstore GROUP BY category ORDER BY margem DESC

#Margem Média Percentual
WITH base AS (
    SELECT category, sales, profit, (profit / sales) AS margem_pct_linha
    FROM portfolio.superstore WHERE sales <> 0
),
margem_media AS (
    SELECT category, AVG(margem_pct_linha) * 100 AS margem_media_percentual
    FROM base GROUP BY category
)
SELECT * FROM margem_media ORDER BY margem_media_percentual DESC;

#Liderança de faturamento pelo estado (top 2)
SELECT state, SUM(sales) as faturamento FROM portfolio.superstore GROUP BY state ORDER BY faturamento DESC LIMIT 2

#Mês/Ano com pico sazonal
SELECT EXTRACT(YEAR FROM order_date) AS ano, EXTRACT(MONTH FROM order_date) AS mes, SUM(sales) AS faturamento
FROM portfolio.superstore GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY faturamento DESC LIMIT 1;

#Mês/Ano com maior volume
SELECT EXTRACT(YEAR FROM order_date) AS ano, EXTRACT(MONTH FROM order_date) AS mes, SUM(quantity) AS volume
FROM portfolio.superstore GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY volume DESC LIMIT 1;