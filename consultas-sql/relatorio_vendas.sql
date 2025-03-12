-- Relatório de vendas por categoria nos últimos 30 dias
SELECT 
    c.nome AS categoria, 
    SUM(p.preco * v.quantidade) AS total_vendas, 
    COUNT(DISTINCT v.cliente_id) AS clientes_atendidos
FROM vendas v
JOIN produtos p ON v.produto_id = p.id
JOIN categorias c ON p.categoria_id = c.id
WHERE v.data_venda >= CURDATE() - INTERVAL 30 DAY
GROUP BY c.nome
ORDER BY total_vendas DESC;
