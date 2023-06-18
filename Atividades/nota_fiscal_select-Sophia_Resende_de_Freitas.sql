SELECT * FROM exercicio.documento doc
LEFT JOIN exercicio.empresa empresa ON empresa.id_empresa = doc.id_empresa
LEFT JOIN exercicio.cliente cliente ON cliente.id_cliente = doc.id_cliente
LEFT JOIN exercicio.documento_itens doc_items on doc_items.id_documento = doc.id_documento
LEFT JOIN exercicio.produto produto ON produto.id_produto = doc_items.id_produto
LEFT JOIN exercicio.marca marca ON marca.id_marca = produto.id_marca
WHERE doc.numero_doc = '2185721776'


SELECT *  FROM exercicio.empresa
SELECT *  FROM exercicio.cliente
SELECT *  FROM exercicio.marca
SELECT *  FROM exercicio.produto
SELECT *  FROM exercicio.marca
SELECT *  FROM exercicio.documento
SELECT *  FROM exercicio.documento_itens