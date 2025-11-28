# criação do banco de dados Eletro Santos

-- todas as tabelas clientes, enderecos, papeis, categorias, marcas, fornecedores, imagens, produtos, carrinhos, funcionarios, pedidos, imagens_produto, itens_pedido, pagamentos, envios.
-- são (15) tabelas totais.

# INSTRUÇÕES DE INSTALAÇÃO:
# 1 - "copie o codigo SQL de criação do banco de dados (vai criar todas as tabelas)."
# 2 - "Cole no seu Aplicativo SQL ex. (MySQL Workbench, SQLite estudio ou PGAdmin)."
# 3 - "Excute o script SQL, (seu programa ira criar o esquema com todas as tabelas)."
 
-- Criaçao da tabela Clientes
create table clientes(
 	id_cliente int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null,
    cpf varchar(14) not null,
    senha_hash varchar(255),
    telefone varchar(20),
    data_nascimento date not null,
    data_cadastro timestamp default current_timestamp  -- para salvar a data automaticamente na criação
);
# Criação da tabela enderecos
create table enderecos(
 	id_endereco int primary key auto_increment,
    logradouro varchar(255),
    numero char(20) not null, -- obrigatório para NÚMERO e CEP porque tendo o cep é possivel achar a rua e com o numero já se completa.
    complemento varchar(50),
    bairro varchar(100),
    cidade varchar(100),
    estado char(2),
    cep varchar(9),
    tipo varchar(50), -- tipo (residencia, casa, comercial, postal).
    id_cliente int,
    foreign key (id_cliente) references clientes(id_cliente)
);
# Criação da tabela papeis, (cargos-adiministrador,estoquista,vendedor,coordenador e etc)
create table papeis(
 	id_papel int primary key auto_increment,
    nome_papel varchar(100) not null,
    descricao varchar(255)
);
# criação da tabela Categorias para dividir as categorias (brinquedos, livros, pulseira)
create table categorias(
 	id_categoria int primary key auto_increment,
    nome_categoria varchar(50) not null,
    descricao text
);
# Criação da tabela Marcas para separar as marcas (Dell, Samsung, positivo, Lenovo)
create table marcas(
 	id_marca int primary key auto_increment,
    nome_marca varchar(100)
);
# criação da tabela fornecedores (ligar produto com quem fornece).
create table fornecedores(
 	id_fornecedor int primary key auto_increment,
    nome_fornecedor varchar(100) not null,
    telefone_fornecedor varchar(20) not null,
    razao_social varchar(100),
    cnpj varchar(18),
    email_fornecedor varchar(100) not null
);
# Criação da tabela imagens para que não passa ser reutilizadas em outros produtos
create table imagens(
 	id_imagem int primary key auto_increment,
    url_imagem varchar(255) not null,
    descricao_alt text
);
-- ---- tabelas pais a cima e tabelas dependentes abaixo para evitar erro no mysql
# Criação da tabela produtos
create table produtos(
 	id_produto int primary key auto_increment,
    nome_produto varchar(255) not null,
    descricao text,
    preco decimal(10,2) not null,
    preco_custo decimal(10,2) not null,
    ativo boolean,
    data_criacao timestamp default current_timestamp,
    sku varchar(50) not null,
    estoque int,
    id_categoria int,
    id_marca int,
    id_fornecedor int,
    foreign key (id_categoria) references categorias(id_categoria),
    foreign key (id_marca) references marcas(id_marca),
    foreign key (id_fornecedor) references fornecedores(id_fornecedor)
);
# Criação da tabela carrinho para separar os produtos escolhidos para depois concluir a compra
create table carrinhos(
 	id_carrinho int primary key auto_increment,
    quantidade int,
    data_adicao timestamp default current_timestamp,
    id_cliente int,
    id_produto int,
    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (id_produto) references produtos(id_produto)
);
# Criação da tabela Funcionários para dar acesso a algumas areas como movimentar estoque e tambem ver por quem foi
create table funcionarios(
 	id_funcionario int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(255) not null,
    senha varchar(255) not null,
    telefone varchar(20) not null,
    data_cadastro timestamp default current_timestamp,
    ativo boolean,
    id_papel int,
    foreign key (id_papel) references papeis(id_papel)
);
# crição da tabela pedidos grava o pedido para o pagamento
create table pedidos(
 	id_pedido int primary key auto_increment,
    data_pedido timestamp default current_timestamp,
    status_pedido varchar(50),
    valor_total decimal(10,2),
    id_cliente int,
    id_endereco int,
    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (id_endereco) references enderecos(id_endereco)
);
# Criação da tabela imagens_produto (gerencia qual foto para qual produto) e ordena
create table imagens_produto(
 	id_imagen_produto int primary key auto_increment,
    ordem int,
    id_imagem int,
    id_produto int,
    foreign key (id_imagem) references imagens(id_imagem),
    foreign key (id_produto) references produtos(id_produto)
);
# Criação da tabela itens_pedido para calcular a quantidade dos produtos unitario
create table itens_pedido(
 	id_item_pedido int primary key auto_increment,
    quantidade int,
    preco_unitario decimal(10,2),
    id_produto int,
    id_pedido int,
    foreign key (id_produto) references produtos(id_produto),
    foreign key (id_pedido) references pedidos(id_pedido)
);
# Criação da tabela pagamentos para gravar as informações de pagamento
create table pagamentos(
 	id_pagamento int primary key auto_increment,
    valor_pagamento decimal(10,2),
    metodo_pagamento varchar(50),
    status_pagamento varchar(50),
    data_pagamento timestamp default current_timestamp,
    transacao_gateway_id varchar(255),
    id_pedido int,
    foreign key (id_pedido) references pedidos(id_pedido)
);
# criação da tabela envios para guardar dados do envio
create table envios(
 	id_envios int primary key auto_increment,
    metodo_envio varchar(50),
    codigo_rastreio varchar(50),
    data_envio timestamp default current_timestamp,
    custo_frete decimal(10,2),
    previsao_entrega date,
    id_pedido int,
    foreign key (id_pedido) references pedidos(id_pedido)
);