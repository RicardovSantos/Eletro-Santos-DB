# popular as tabelas com INSERT.
# Organizei a OBSERVAÇÃO: faça na ordem de dependência para evitar erros (primeiro as tabelas que não têm FK, depois as que dependem delas).

-- Inserindo Marcas (necessário para Produtos)
INSERT INTO marcas(nome_marca)
VALUES 
('apple'),
('Kingston'),
('TP-Link'),
('Lenovo'),
('Asus');

-- Inserindo Categorias (necessário para Produtos).
INSERT INTO categorias(nome_categoria, descricao)
VALUES
('Armazenamento', 'SSDs, HDs e Pen drives'),
('Redes', 'Roteadores, switches e cabos'),
('Games','Jogos e videogames'),
('Computadores','PCs de mesa e de escritorios'),
('Decoração','produtos para decorar o seu setup');

-- Inserindo Papeis (necessário para Funcionarios)
INSERT INTO papeis(nome_papel,descricao)
VALUES 
('Supervisor SAC', 'Responsável pelo atendimento ao cliente'),
('Analista de Logística', 'Cuida do despacho e estoque'),
('Gerente de Marketing', 'Responsável por promoções'),
('Desenvolvedor Jr', 'Manutenção do site'),
('Desenvolvedor Pleno', 'Novas funcionalidades');

-- Inserindo Fornecedores (necessário para Produtos)
INSERT INTO fornecedores(nome_fornecedor,telefone_fornecedor,razao_social,cnpj,email_fornecedor)
VALUES 
('Mega Imports SA','11999990006','MegaImports','98.765.432/0001-10','vendas@megaimports.com'),
('Brasil Hardware','11999990008','BR Hardware','55.666.777/0001-88','comercial@brhard.com'),
('Fast Components','11999990009','FastComp','99.888.777/0001-22','hello@fastcomp.com'),
('Sul Informática','11999990010','SulInfo','33.444.555/0001-66','contato@sulinfo.com.br'),
('TechTudo.com','11999990005','TecnologiPoint','12.345.678/0001-90','contato@techdist.com');

-- Inserindo Clientes (necessário para Pedidos, Endereços, Carrinho)
INSERT INTO clientes(nome,email,cpf,senha_hash,telefone,data_nascimento,data_cadastro)
VALUES
('Roberto Costa','roberto.costa@email.com','111.222.333-55','hash555','11988887775', '1990-05-15', NOW()),
('Ana Pereira','ana.pereira@email.com','222.333.444-66','hash666','11988887776', '1985-08-20', NOW()),
('Carlos Souza','carlos.souza@email.com','333.444.555-77','hash777','11988887777', '1995-12-10', NOW()),
('Beatriz Lima','beatriz.lima@email.com','444.555.666-88','hash888','11988887778', '2000-01-30', NOW()),
('Fernando Dias', 'fernando.dias@email.com', '555.666.777-99', 'hash999', '11988887779', '1988-07-07', NOW());

# Dependentes de Nível 1 (Funcionários, Endereços, Produtos)
-- Inserindo Funcionários

INSERT INTO funcionarios(id_papel,nome,email,Senha,Telefone,data_cadastro,Ativo)
VALUES
(5,'Pedro Lima','lucas@empresa.com','passHash5', '1133334445', NOW(), 1),
(7, 'Mariana Regina', 'mariana@empresa.com', 'passHash6', '1133334446', NOW(), 1),
(9, 'João Siqueira', 'joao@empresa.com', 'passHash8', '1133334448', NOW(), 1),
(10, 'Clara Dev Pleno', 'clara@empresa.com', 'passHash9', '1133334449', NOW(), 1),
(8, 'Ricardo Junior', 'ricardo@empresa.com', 'passHash10', '1133334410', NOW(), 1);

-- Inserindo Endereços
INSERT INTO enderecos(id_cliente,logradouro,numero,complemento,bairro,cidade,estado,cep,tipo)
VALUES
(6, 'Rua das Flores', '123', 'Apto 10', 'Centro', 'São Paulo', 'SP', '01001-000', 'Residencial'),
(7, 'Av. Paulista', '2000', 'Bloco B', 'Bela Vista', 'São Paulo', 'SP', '01310-200', 'Comercial'),
(8,'Rua Augusta', '500', '23', 'Consolação', 'São Paulo', 'SP', '01305-000', 'Residencial'),
(9, 'Rua da Consolação', '800', 'Casa 2', 'Consolação', 'São Paulo', 'SP', '01301-000', 'Residencial'),
(10, 'Av. Faria Lima', '3500', 'Andar 15', 'Itaim', 'São Paulo', 'SP', '04538-132', 'Comercial');

-- Inserindo Produtos
INSERT INTO produtos(id_categoria,id_fornecedor,id_marca,nome_produto,descricao,preco,preco_custo,estoque,sku,data_criacao,ativo)
VALUES
(5, 5, 5, 'Galaxy S25','smartphone de 128GB memoria', 1500.00, 2800.00, 50, 'SAM-S23-128', NOW(),1),
(6, 6, 11, 'MacBook Air M2', 'Notebook Apple 256GB', 8000.00, 6500.00, 20, 'APP-MAC-M2', NOW(),1),
(6, 7, 2, 'Dell Inspiron 15', 'Notebook i5 8GB', 3200.00, 2500.00, 30, 'DEL-INS-15', NOW(),1),
(8, 8, 3, 'Mouse MX Master 3', 'Mouse Ergonômico Sem Fio', 600.00, 400.00, 100, 'LOG-MX-3', NOW(),1),
(7, 9, 12, 'SSD NVMe 1TB', 'Kingston NV2', 400.00, 250.00, 200, 'KIN-SSD-1TB', NOW(),1);

# Dependentes de Nível 2 
-- obs: primeiro a tabela de imagens depois imagens_produto para evitar erro
-- Inserindo Imagens
INSERT INTO imagens(url_imagem, descricao_alt)
VALUES
('/img/s25_front.jpg', 'Frente Galaxy S25'),
('/img/mac_air.jpg', 'Macbook Aberto'),
('/img/dell_inspiron.jpg', 'Dell Inspiron Prata'),
('/img/mx_master.jpg', 'Mouse Logitech'),
('/img/ssd_kingston.jpg', 'Caixa SSD');

-- Inserindo Imagens_Produto
INSERT INTO imagens_produto(id_produto,id_imagem,ordem)
VALUES
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10,10, 1);

-- Inserindo Carrinho
INSERT INTO carrinhos(id_cliente, id_produto, Quantidade, data_adicao)
VALUES
(6,9,2, NOW()),
(7, 8, 1, NOW()),
(8, 7, 1, NOW()),
(9, 6, 1, NOW()),
(10, 5, 2, NOW());

-- Inserindo Pedidos
INSERT INTO Pedidos(id_cliente,id_endereco,data_pedido,status_pedido,valor_total)
VALUES
(6, 6, NOW(), 'Processando', 8000.00),
(7, 7, NOW(), 'Enviado', 3200.00),
(8, 8, NOW(), 'Pendente', 600.00),
(9, 9, NOW(), 'Cancelado', 400.00),
(10, 10, NOW(), 'Entregue', 1000.00);

# Dependentes de Nível 3
-- Inserindo Itens_Pedido
INSERT INTO itens_pedido(id_pedido,id_produto,quantidade,preco_unitario)
VALUES
(6, 6, 1, 8000.00),
(7, 7, 1, 3200.00),
(8, 8, 1, 600.00),
(9, 9, 1, 400.00),
(10, 10, 2, 500.00);

-- Inserindo Pagamentos
INSERT INTO Pagamentos(id_pedido,metodo_pagamento,status_pagamento,valor_pagamento,data_pagamento,transacao_gateway_id)
VALUES
(6, 'PIX', 'Aprovado', 8000.00, NOW(), 'TX-12345-06'),
(7, 'Boleto', 'Aprovado', 3200.00, NOW(), 'TX-12345-07'),
(8, 'Cartão de Crédito', 'Pendente', 600.00, NOW(), 'TX-12345-08'),
(9, 'PIX', 'Recusado', 0.00, NOW(), 'TX-12345-09'),
(10, 'Cartão de Crédito', 'Aprovado', 1000.00, NOW(), 'TX-12345-10');
SELECT * FROM envios;
-- Inserindo Envio
INSERT INTO Envios(id_pedido,metodo_envio,codigo_rastreio,data_envio,previsao_entrega,custo_frete)
VALUES
(6, 'Transportadora', 'BR123456786SP', NOW(), '2025-11-10',20.00),
(7, 'PAC', 'BR123456787SP', NOW(), '2025-11-15', 30.50),
(8, 'SEDEX','BR12345677SP', NOW(), '2025-11-19', 25.00),
(9, 'PAC','BR125347810SP', NOW(), '2025-11-10', 0.00),
(10, 'Transportadora', 'BR1234567810SP', NOW(),'2025-11-08', 8.00);
