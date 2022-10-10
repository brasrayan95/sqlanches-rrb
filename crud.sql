-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)INSERT INTO
	clientes(nome, lealdade)
VALUES 
	('Georgia', 0);



-- 2)INSERT INTO
	pedidos(status, cliente_id)
VALUES
	('Recebido', 6)



-- 3)INSERT INTO 
	produtos_pedidos(pedido_id, produto_id)
VALUES 
	(6, 1),
	(6, 2),
	(6, 6),
	(6, 8),
	(6, 8);



-- Leitura

-- 1)
SELECT
	cl.id, cl.nome, cl.lealdade, pe.id, pe.status, pe.cliente_id, po.id, po.nome, po.tipo, po.preco, po.pts_de_lealdade 
FROM
	clientes cl
JOIN
	pedidos pe ON pe.id = cl.id
JOIN 
	produtos_pedidos pp ON pp.pedido_id = pe.id
JOIN 
	produtos po ON po.id = pp.produto_id
WHERE
	cl.nome = 'Georgia';



-- Atualização

-- 1)
UPDATE 
	clientes
SET
	lealdade = (SELECT
	sum(po.pts_de_lealdade)
FROM
	clientes cl
JOIN
	pedidos pe ON pe.id = cl.id
JOIN 
	produtos_pedidos pp ON pp.pedido_id = pe.id
JOIN 
	produtos po ON po.id = pp.produto_id
WHERE
	cl.nome = 'Georgia')
WHERE nome = 'Georgia';


-- Deleção

-- 1)
DELETE
	FROM clientes
WHERE 
	nome = 'Marcelo'
RETURNING *;
	

