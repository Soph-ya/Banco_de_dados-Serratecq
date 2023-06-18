------------------------------- NOTA FISCAL (PARA O CLIENTE): ---------------------------------------------------------------

SELECT 
	razao_social,
	endereco,
	cnpj,
	cod_pedido,
	cod_cliente,
	nome_completo,
	cpf_cliente,
	endereco_cliente,
	email_cliente,
	usuario,
	observacao,
	nome_produto,
	ip.valor_unitario,
	qtd_item_pedido,
	valor_total
	
	FROM documento.pedido p
LEFT JOIN documento.empresa e ON e.id_empresa = p.id_empresa
LEFT JOIN documento.usuario u ON u.id_usuario = p.id_usuario
LEFT JOIN documento.cliente c ON c.id_usuario = u.id_usuario
LEFT JOIN documento.funcionario f ON f.id_usuario = u.id_usuario 
LEFT JOIN documento.item_pedido ip ON ip.id_pedido = p.id_pedido
LEFT JOIN documento.produto prod ON prod.id_produto = ip.id_produto
LEFT JOIN documento.categoria cat ON cat.id_categoria = prod.id_categoria
WHERE p.tipo = 'V';

------------------------------- NOTA FISCAL (PARA A EMPRESA): ---------------------------------------------------------------

SELECT 
	razao_social,
	endereco,
	cnpj,
	cod_pedido,
	cod_cliente
	nome_completo,
	cpf_cliente,
	endereco_cliente,
	email_cliente,
	cod_funcionario,
	nome_funcionario,
	cpf_funcionario,
	usuario,
	observacao,
	nome_produto,
	tipo,
	ip.valor_unitario,
	qtd_item_pedido,
	valor_total,
	(ip.custo * qtd_item_pedido) AS total_custo,
	((ip.valor_unitario * qtd_item_pedido) - (ip.custo * qtd_item_pedido)) AS lucro
	
	FROM documento.pedido p
LEFT JOIN documento.empresa e ON e.id_empresa = p.id_empresa
LEFT JOIN documento.usuario u ON u.id_usuario = p.id_usuario
LEFT JOIN documento.cliente c ON c.id_usuario = u.id_usuario
LEFT JOIN documento.funcionario f ON f.id_usuario = u.id_usuario 
LEFT JOIN documento.item_pedido ip ON ip.id_pedido = p.id_pedido
LEFT JOIN documento.produto prod ON prod.id_produto = ip.id_produto
LEFT JOIN documento.categoria cat ON cat.id_categoria = prod.id_categoria