-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT 
	pe.id,
	pe.status,
	pe.cliente_id,
	po.id,
	po.nome,
	po.tipo,
	round(CAST(po.preco AS NUMERIC), 2) preço,
	po.pts_de_lealdade
FROM
	pedidos pe
JOIN
	produtos_pedidos pp ON pe.id = pp.pedido_id
JOIN
	produtos po ON po.id = pp.produto_id;
-- 2)
SELECT
	pe.id
FROM
	pedidos pe
JOIN
	produtos_pedidos pp ON pe.id = pp.pedido_id
JOIN
	produtos po ON po.id = pp.produto_id
WHERE 
	nome LIKE '%Fritas%';
-- 3)
SELECT
	clientes.nome AS gostam_de_fritas,
FROM
	pedidos pe
JOIN
	produtos_pedidos pp ON pe.id = pp.pedido_id
JOIN
	produtos po ON po.id = pp.produto_id
JOIN
	clientes ON clientes.id = pe.cliente_id 
WHERE 
	po.nome LIKE '%Fritas%';
-- 4)
SELECT
	SUM(preco)
FROM
	pedidos pe
JOIN
	produtos_pedidos pp ON pe.id = pp.pedido_id
JOIN
	produtos po ON po.id = pp.produto_id
JOIN
	clientes ON clientes.id = pe.cliente_id
WHERE
	clientes.nome = 'Laura';
-- 5)--n consegui terminar

SELECT
	po.nome,
	count()
FROM
	pedidos pe
JOIN
	produtos po ON pe.id = po.id;

