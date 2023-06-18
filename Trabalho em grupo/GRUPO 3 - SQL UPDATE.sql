-------------------------UPDATE-------------------------------------------------------------------------------------------

UPDATE 	documento.pedido SET valor_total = (SELECT SUM((ip.custo * qtd_item_pedido))
	FROM documento.item_pedido ip WHERE id_pedido = 1) WHERE id_pedido = 1;

UPDATE 	documento.pedido SET valor_total = (SELECT SUM((ip.valor_unitario * qtd_item_pedido))
	FROM documento.item_pedido ip WHERE id_pedido = 2) WHERE id_pedido = 2;

UPDATE 	documento.pedido SET valor_total = (SELECT SUM((ip.valor_unitario * qtd_item_pedido))
	FROM documento.item_pedido ip WHERE id_pedido = 3) WHERE id_pedido = 3;

UPDATE 	documento.pedido SET valor_total = (SELECT SUM((ip.valor_unitario * qtd_item_pedido))
	FROM documento.item_pedido ip WHERE id_pedido = 4) WHERE id_pedido = 4;

UPDATE 	documento.pedido SET valor_total = (SELECT SUM((ip.custo * qtd_item_pedido))
	FROM documento.item_pedido ip WHERE id_pedido = 5) WHERE id_pedido = 5;