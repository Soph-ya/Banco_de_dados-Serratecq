SELECT 'CREATE DATABASE exercicio_aula' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'exercicio_aula');

CREATE SCHEMA IF NOT EXISTS exercicio;


CREATE TABLE IF NOT EXISTS  exercicio.empresa (

id_empresa serial PRIMARY KEY,
razao_social VARCHAR(100),
endereco VARCHAR(150),
cnpj CHAR(14)

);


CREATE TABLE IF NOT EXISTS  exercicio.cliente  (

id_cliente SERIAL PRIMARY KEY,
nome_cliente VARCHAR (100),
endereco VARCHAR(120),
telefone VARCHAR(20),
cpf VARCHAR(11)

);

CREATE TABLE IF NOT EXISTS exercicio.marca (

id_marca serial PRIMARY KEY,
nome_marca VARCHAR(80),
contato VARCHAR(100),
ativo BOOLEAN

);
CREATE TABLE IF NOT EXISTS  exercicio.produto (

id_produto serial PRIMARY KEY,
nome_produto VARCHAR(150),
qtd_estoque INT,
preco REAL,
custo REAL,
imposto REAL,
id_marca INT REFERENCES exercicio.marca

);


CREATE TABLE IF NOT EXISTS  exercicio.documento (

id_documento SERIAL PRIMARY KEY,
serie VARCHAR(3),
id_cliente INT REFERENCES exercicio.cliente,
id_empresa INT REFERENCES exercicio.empresa,
valor_total REAL,
data_emissao TIMESTAMP,
numero_doc VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS  exercicio.documento_itens (

id_item SERIAL PRIMARY KEY,
id_produto INT REFERENCES exercicio.produto,
id_documento INT REFERENCES exercicio.documento,
valor_unitario REAL,
qtd_item INT,
custo REAL,
valor_desconto REAL,
valor_imposto REAL

);









INSERT INTO exercicio.empresa (razao_social, endereco, cnpj)
VALUES	('Magnus GondenFire', 'Rua Padre Manoel da Nóbrega 204, nº 530, São Francisco, Caruaru - PE', '12345678000195'),
	('Blackburn Roupas e Acessórios', 'Rua João de Brito, nº 964, Alto da Boa Vista, Gurupo - TO', '52659856600015');


INSERT INTO exercicio.cliente (nome_cliente, endereco, telefone, cpf)
VALUES	('Thomas P. McFadden', 'Rua Angelino Ferreira de Souza, 1824
	Londrina-PR', '(43) 8590-2315', '69501699145'),
	('Luan Rocha Lima', 'Rua Doutor Fábio Teixeira Coelho, 1602
	Poços de Caldas-MG', '(35) 6699-2509', '76202717599'),
	('Martim Almeid_a Correia', 'Rua Antônio de Oliveira Filho, 926
	Jacareí-SP', '(12) 9648-5622', '40120666251'),
	('Julieta Souza Costa', 'Rodovia SP-127, 1906
	Piracicaba-SP', '(19) 3742-5504', '44363505176'),
	('Kai Cardoso Rodrigues', 'Rua Professor Leonel Faggin, 488
	Piracicaba-SP', '(19) 3051-8683', '39095219321'),
	('Breno Ribeiro Gomes', 'Rua Itaqui, 774
	Viamão-RS', '(51) 8671-2160', '22705375562'),
	('Fábio Almeid_a Sousa', 'Rua Jucelly Ferreira, 134
	Natal-RN', '(84) 5258-3800', '81814963294'),
	('Lavinia Barbosa Pinto', 'Rua Nadir Outeiro Alves, 1153
	Colombo-PR', '(41) 5372-6648', '99892808355'),
	('Kaua Melo Souza', 'Quadra SHIS QI 05 Chácaras 53 a 61, 1950
	Lago Sul-DF', '(61) 4667-7753', '14792982472'),
	('Marina Rodrigues Silva', 'Rua Ub 28, 672
	São José dos Campos-SP', '(12) 3079-4210', '41269369202');
	


INSERT INTO exercicio.marca (nome_marca, contato, ativo)
VALUES	('Nike','nike@email.com',true),
	('H&M','hem@email.com',false),
	('Zara','zara@email.com',true),
	('Louis Vuitton','luiz@email.com',true),
	('Adid_as','adid_as@email.com',false),
	('Uniqlo','uniquo@email.com',true),
	('Hermès','hermes@email.com',true),
	('Rolex','rolex@email.com',true),
	('Gucci','gucci@email.com',true),
	('Cartier','cartier@email.com',false),
	('Nike','nike@email.com',true);


INSERT INTO exercicio.produto (nome_produto, qtd_estoque, preco, custo, imposto, id_marca)
VALUES	('Top', 40, 300.00, 100.00, 30.00, 1),
	('Blusa listrada',30, 120.00, 50.00, 30.00, 6),
	('Bota tratorada',50,2900.00,800.00,250.00,3),
	('Bolsa de mão',20,9000.00,1500.00,900.00, 4),
	('Casaco corta-vento',20,500.00,200.00,50.00,1),
	('Calça cargo',30,450.00,200.00,45.00,4),
	('Vestid_o longo',24,3200.00,900.00,320.00,3),
	('Conjunto pulseiras zircônia',50,4000.00,1200.00,400.00,8),
	('Relógio',3,3500,1200,130,8),
	('Perfume',5,380.00,120.00,80.00,9),
	('Conjunto Lingerie',25,300,120,30,6);

INSERT INTO exercicio.documento (serie, id_cliente, id_empresa, valor_total,data_emissao,numero_doc)
VALUES	('012', 10, 1, 1200, '2021-09-02 16:15:00','8927428153'),
	('123', 4, 2, 9000, '2021-09-08 11:10:00','2390574698'),
	('321', 7, 2, 950, '2021-09-22 12:00:00','9383108779'),
	('213', 10,2, 6100, '2021-08-15 15:05:00','0668544490'),
	('231', 4, 1, 3200, '2021-08-01 16:26:00','3850500526'),
	('032', 8, 1, 300, '2021-08-02 19:30:00','6906501568'),
	('023', 5, 2, 7500, '2021-07-09 10:15:00','8059800306'),
	('230', 4, 2, 450, '2021-07-06 10:40:00','7276233269'),
	('103', 2, 1, 3200, '2021-07-12 18:30:00','3579337562'),
	('102', 4, 1, 3650, '2021-11-30 19:57:00','5155870356'),
	('321', 4, 2, 24000, '2021-12-20 13:36:00','2185721776');

INSERT INTO exercicio.documento_itens (id_produto, id_documento, valor_unitario, qtd_item, custo, valor_desconto,valor_imposto)
VALUES	( 4, 2, 9000, 1, 1500, 0, 900),
	( 6, 8, 450, 1, 200, 0, 45),
	( 1, 1, 300, 3, 300, 0, 90),
	( 11, 3, 300, 3, 360, 0, 90),
	( 1, 5, 3500, 1, 1200, 0, 30),
	( 1, 7, 3500, 2, 2400, 0, 60),
	( 5, 10, 500, 2, 400, 0, 100),
	( 8, 11, 4000, 3, 3600, 0, 1200),
	( 7, 4, 3200, 3, 2700, 0, 960),
	( 5, 9, 500, 1, 200, 0, 50),
	( 11, 6, 300, 1, 120, 0, 30);