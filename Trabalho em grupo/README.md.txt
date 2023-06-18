Precisa ter, segundo o conteúdo programático:

● Cliente
● Endereço
● Pedido
● PedidoItem
● Produto
● Categoria
● NotaFiscal
● Usuário

Requisito:

Uma empresa do comércio varejista deseja realizar a venda de seus produtos pela internet e para isso precisa de um sistema capaz de realizar o controle de estoque e cadastro de clientes. A empresa é responsável pela produção de seus próprios produtos e por isso não precisa registrar dados de fornecedores externos. O sistema não tem como objetivo registrar detalhes da produção. Sendo assim, a seguir são descritos os requisitos e os dados que a empresa julga serem necessários para o funcionamento do sistema:

1. O sistema deve ser capaz de armazenar informações sobre os produtos da empresa, sendo eles: código, nome, descrição, quantidade em estoque, data de fabricação e valor unitário.
2. Ao cadastrar um produto no sistema, os funcionários da empresa devem ser capazes de associá-lo à uma categoria. Cada produto só poderá pertencer à uma categoria.
3. Se o produto já estiver cadastrado no sistema, o colaborador deverá apenas atualizar a quantidade de itens no estoque.
4. Para cada categoria de produto, é necessário registrar: código, nome e descrição.
5. O sistema deverá armazenar dados dos clientes, que devem ser: código, nome completo, nome de usuário, e-mail, cpf, data de nascimento e endereço.
6. Através do sistema, os clientes podem realizar pedidos.
7. Cada pedido deve conter um ou mais produtos, a data em que foi realizado e por quem foi realizado.
8. Um pedido pode ter mais de um item de um mesmo produto, de acordo com a quantidade disponível em estoque.
9. Sobre os funcionários, é necessário guardar apenas um código, nome e cpf
10. A nota fiscal pode conter um pedido ou mais de clientes.
11. Um único pedido pode gerar mais de uma nota fiscal, caso os produtos pedidos tenham data de entrega diferentes ou não haja estoque imediato para algum dos produtos.
12. A nota fiscal deve possuir um campo observação que permite incluir uma nota "Nota Fiscal referente aos pedidos xxx e yyy", onde xxx e yyy são os números dos pedidos referenciados.

Para os alunos entregarem:
1. Diagrama ER (depois da normalização)
2. SQL de criação das tabelas
3. SQL de inserção de dados nas tabelas (pelo menos 5 registros em cada uma)
4. Um comando SQL de atualização em algum registro em uma tabela
5. Um comando SQL de exclusão de algum registro em uma tabela
6. 5 SQLs de consulta
    a. Pelo menos 2 com algum tipo de junção
    b. Pelo menos 1 usando count() e group by()
    c. 1 SQL para construção de nota fiscal