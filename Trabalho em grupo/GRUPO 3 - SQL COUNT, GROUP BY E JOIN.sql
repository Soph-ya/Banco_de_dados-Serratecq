----------------------------------COUNT E GROUP BY---------------------------------------------------------------------------

--Quantidade de vendas e de compras:
SELECT tipo, COUNT(qtd_item_pedido) quantidade FROM documento.item_pedido ip
LEFT JOIN documento.pedido p ON p.id_pedido = ip.id_pedido
GROUP BY tipo

--Relação total de produto vendido
SELECT
	nome_categoria,
	nome_produto,
	prod.id_produto,
	SUM(qtd_item_pedido) total_vendido
	
FROM documento.item_pedido ip
LEFT JOIN documento.produto prod ON prod.id_produto = ip.id_produto
LEFT JOIN documento.categoria cat ON cat.id_categoria = prod.id_categoria
LEFT JOIN documento.pedido p ON p.id_pedido = ip.id_pedido 
WHERE tipo = 'V'
GROUP BY nome_produto, nome_categoria, prod.id_produto
ORDER BY nome_categoria