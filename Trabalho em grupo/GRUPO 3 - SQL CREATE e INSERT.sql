CREATE SCHEMA documento;

CREATE TABLE IF NOT EXISTS documento.empresa (
    id_empresa SERIAL PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    endereco VARCHAR(120) NOT NULL,
    cnpj VARCHAR(14) NOT NULL
);

CREATE TABLE IF NOT EXISTS documento.usuario(
	id_usuario SERIAL PRIMARY KEY,
	usuario VARCHAR(20) NOT NULL UNIQUE,
	tipo_usuario VARCHAR(1)	
);

CREATE TABLE IF NOT EXISTS documento.cliente(
	id_cliente SERIAL PRIMARY KEY,
	cod_cliente VARCHAR(6) NOT NULL UNIQUE,
	nome_completo VARCHAR(150) NOT NULL,
	id_usuario INT REFERENCES documento.usuario,
	email_cliente VARCHAR(150) NOT NULL UNIQUE,
	cpf_cliente CHAR(11) NOT NULL UNIQUE,
	data_nascimento DATE NOT NULL,
	endereco_cliente VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS documento.funcionario(
	id_funcionario SERIAL PRIMARY KEY,
	cod_funcionario VARCHAR(6) NOT NULL UNIQUE,
	nome_funcionario VARCHAR(150) NOT NULL,
	id_usuario INT REFERENCES documento.usuario,
	cpf_funcionario CHAR(11) NOT NULL UNIQUE
	
);

CREATE TABLE IF NOT EXISTS documento.categoria(
	id_categoria SERIAL PRIMARY KEY,
	cod_categoria VARCHAR(6) NOT NULL UNIQUE,
	nome_categoria VARCHAR(50) NOT NULL,
	desc_categoria VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS documento.produto(
	id_produto SERIAL primary key,
	cod_produto VARCHAR(6) UNIQUE,
	nome_produto VARCHAR(100) NOT NULL,
	desc_produto VARCHAR(100),
	qtd_estoque INT,
	valor_unitario REAL NOT NULL,
	data_fab DATE,
	id_categoria INT REFERENCES documento.categoria,
	custo REAL
);

CREATE TABLE IF NOT EXISTS documento.pedido(
	id_pedido SERIAL primary key,
	cod_pedido VARCHAR(6),
	valor_total REAL,
	data_emissao TIMESTAMP,
	observacao VARCHAR(100),
	tipo VARCHAR(1),
	id_usuario INT REFERENCES documento.usuario,
	id_empresa INT REFERENCES documento.empresa
);

CREATE TABLE IF NOT EXISTS documento.item_pedido(
	id_item_pedido SERIAL primary key,
	qtd_item_pedido INT NOT NULL,
	valor_unitario REAL NOT NULL,
	id_produto INT REFERENCES documento.produto,
	id_pedido INT REFERENCES documento.pedido NOT NULL,
	custo REAL NOT NULL
);

----------------------------------INSERTS:----------------------------------------------------------------------------------

INSERT INTO documento.empresa (razao_social, endereco, cnpj ) 
VALUES ('Engelima', 'Rua farini 42 - Botafogo - Rio de Janeiro','12345678000190');

INSERT INTO documento.usuario(usuario, tipo_usuario) 
VALUES	('Adm01','F'),
	('Adm02','F'),
	('Adm03','F'),
	('Adm04','F'),
	('Adm05','F'),
	('Cliente01','C'),
	('Cliente02','C'),
	('Cliente03','C'),
	('Cliente04','C'),
	('Cliente05','C');
	
INSERT INTO documento.cliente(cod_cliente, nome_completo, id_usuario, email_cliente, cpf_cliente, data_nascimento, endereco_cliente) 
VALUES	('000001','Roberto Alexandre Baptista', 6,'roberto-baptista82@bol.com','17859176335','2003-01-07',
		'Avenida Doutor Saulo Coelho,711, Rubem Berta,Porto Alegre - RS'),
	('000002','Filipe Daniel Gonçalves', 7,'filipe_goncalves@simoesmendonca.adv.br','91910841480','1945-02-24',
		'Rua Castro Alves, 451, Jardim dos Migrantes, Ji-Paraná - RO'),
	('000003','Stella Isabel Vitória Barros', 8,'stella.isabel.barros@technew.ind.br','83840956633','1959-03-06',
		'Rua José Maria Carneiro, 741, Dr. Airton Rocha, Boa Vista - RR'),
	('000004','Yasmin Elza Alessandra Alves', 9,'yasmin-alves98@lifefp.com.br','42765290423','1981-03-06',
		'Rua 1060, 705, Conjunto Ceará, Fortaleza - CE'),
	('000005','Sueli Lívia Heloisa Viana', 10,'sueli_viana@paulistadovale.org.br','96052553910','1988-03-05',
		'Rua Santo Antônio, 957, Rocas, Natal - RN');

INSERT INTO documento.funcionario(cod_funcionario, nome_funcionario, cpf_funcionario, id_usuario) 
VALUES	('000011','Felipe Sebastião Rezende','63563040575', 1),
	('000012','Vanessa Santos Drumond','02776227949', 2),
	('000013','Emanuel Matos Monteiro','83356981390', 3),
	('000014','Levi  Augusto da Mata','50077206908', 4),
	('000015','Yasmin Fernandes Rodrigues','26223603630', 5);

INSERT INTO documento.categoria (cod_categoria, nome_categoria, desc_categoria)
VALUES	('000221','Materiais Elétricos','Produtos e equipamentos que circulam a energia elétrica de um imóvel'),
	('000222','Materiais Hidráulicos','Peças que compor o sistema de distribuição de água e esgoto de um imóvel'),
	('000223','Materiais de Contrução', 'Produtos utilizados na construção civil de um imóvel');

INSERT INTO documento.produto(cod_produto, nome_produto, desc_produto, qtd_estoque, valor_unitario, data_fab, id_categoria, custo)
VALUES	('000331','Tijolo de Bloco','Blocos cerâmicos',10000,0.79,'2023-01-05',3, 0.20),
	('000332','Argamassa','Argamassa para porcelanato branco',300,36.90,'2022-02-20',3, 14.76),
	('000333','Telha','Telha de cerâmica',5000, 2.59,'2020-03-17',3, 1.03),
	('003334','Cimento','Cimento comum cinza 50kg',1000,31.90,'2022-10-04',3, 12.76),
	('003335','Caixa D água','Caixa de polietileno 500L',100,359.90,'2021-12-21',3, 143.96),
	('003336','Chuveiro elétrico','Chuveiro elétrico 6800w 220v',100,68.98,'2022-06-23',2, 27.59),
	('003337','Cano PVC','Cano PVC marrom 3m 20mm',90,14.29,'2021-03-20',2, 5.07),
	('003338','Joelho PVC','Joelho PVC marrom 90° 25mm',50,0.89,'2021-12-21',2, 0.30),
	('003339','Caixa Cifonada','Caixa cifonada branca 100x50mm',150,34.90,'2022-04-11',2, 13.96),
	('003340','Registro','Base registro de pressão 25mm',35,91.90,'2023-01-21',2, 36.76),
	('003341','Eletrotubo','Eletrotubo Corrugado 25m ',40,73.90,'2023-02-13',1, 29.56),
	('003342','Conector','Conector tripolar cerâmico 6mm branco',35,7.99,'2023-03-07',1, 3.19),
	('003343','Disjuntor','Disjuntor biolar curva 20A',20,39.90,'2022-01-15',1, 15.96),
	('003344','Conjunto interruptor e tomada','Interruptor e tomada 2p+t 10v',96,11.49,'2023-03-03',1, 4.59),
	('003345','Caixa de luz','Kit caixa de luz 4x2 cinza',50,9.49,'2022-12-21',1, 3.79);

INSERT INTO documento.pedido(cod_pedido, data_emissao, observacao, tipo, id_usuario, id_empresa) 
VALUES  ('010001','2022-02-05 18:22:00', 'Nota Fiscal referente ao pedido 010001', 'C', 1, 1),
	('010002','2022-03-13 13:10:00', 'Nota Fiscal referente ao pedido 010002', 'V', 6, 1),
	('010003','2022-01-04 14:15:00', 'Nota Fiscal referente ao pedido 010003', 'V', 7, 1),
	('010004','2022-02-09 11:00:00', 'Nota Fiscal referente ao pedido 010004', 'V', 9, 1),
	('010005','2022-01-26 22:15:00', 'Nota Fiscal referente ao pedido 010005', 'C', 2, 1);


INSERT INTO documento.item_pedido( qtd_item_pedido, valor_unitario, id_produto, id_pedido, custo) 
VALUES  
	(10, (SELECT valor_unitario FROM documento.produto WHERE id_produto=4), 4, 1,
		(SELECT custo FROM documento.produto WHERE id_produto=4)),
		
	(20, (SELECT valor_unitario FROM documento.produto WHERE id_produto=5), 5, 1,
		(SELECT custo FROM documento.produto WHERE id_produto=5)),
		
	(2, (SELECT valor_unitario FROM documento.produto WHERE id_produto=1), 1, 2,
		(SELECT custo FROM documento.produto WHERE id_produto=1)),
		
	(3, (SELECT valor_unitario FROM documento.produto WHERE id_produto=5), 5, 2,
		(SELECT custo FROM documento.produto WHERE id_produto=5)),
		
	(1, (SELECT valor_unitario FROM documento.produto WHERE id_produto=3), 3, 3,
		(SELECT custo FROM documento.produto WHERE id_produto=3)),
		
	(2, (SELECT valor_unitario FROM documento.produto WHERE id_produto=1), 1, 3,
		(SELECT custo FROM documento.produto WHERE id_produto=1)),
		
	(2, (SELECT valor_unitario FROM documento.produto WHERE id_produto=4), 4, 4,
		(SELECT custo FROM documento.produto WHERE id_produto=4)),
		
	(1, (SELECT valor_unitario FROM documento.produto WHERE id_produto=5), 5, 4,
		(SELECT custo FROM documento.produto WHERE id_produto=5)),
		
	(20, (SELECT valor_unitario FROM documento.produto WHERE id_produto=1), 1, 5,
		(SELECT custo FROM documento.produto WHERE id_produto=1)),
		
	(30, (SELECT valor_unitario FROM documento.produto WHERE id_produto=3), 3, 5,
		(SELECT custo FROM documento.produto WHERE id_produto=3));

