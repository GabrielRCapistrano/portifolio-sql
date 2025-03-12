-- Lista dos 10 clientes que mais compraram nos últimos 6 meses
SELECT 
    c.id, 
    c.nome, 
    COUNT(v.id) AS total_pedidos, 
    SUM(v.total) AS valor_gasto
FROM clientes c
JOIN vendas v ON c.id = v.cliente_id
WHERE v.data_venda >= CURDATE() - INTERVAL 6 MONTH
GROUP BY c.id, c.nome
ORDER BY valor_gasto DESC
LIMIT 10;
