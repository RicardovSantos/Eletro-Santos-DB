# SCRIPTS DE CONSULTAS E FILTROS

-- 1: Pedidos detalhados
-- Objetivo: Listar os últimos pedidos, mostrando o nome do cliente e o valor, excluindo os cancelados.
SELECT 
    c.nome AS Cliente,
    p.data_pedido,
    p.status_pedido,
    p.valor_total
FROM Pedidos p
JOIN clientes c 
ON p.id_cliente = c.id_cliente
WHERE p.status_pedido != 'Cancelado' -- não mostrar os cancelados
ORDER BY p.data_pedido DESC
LIMIT 6;

-- 2: Produtos e seus Fornecedores,(Controle de Estoque).
-- Objetivo: Ver produtos com estoque menor que 50, quem fornece e a marca.
SELECT 
    p.nome_produto AS produto,
    p.estoque,
    p.preco,
    m.nome_marca,
    fo.nome_fornecedor
FROM produtos p
JOIN marcas m ON p.id_marca = m.id_marca
JOIN fornecedores fo ON p.id_fornecedor = fo.id_fornecedor
WHERE p.estoque <= 50
ORDER BY p.estoque ASC;


-- 3: Envios pendentes por Transportadora
-- Objetivo: Verificar quais pedidos estão com a transportadora e quando devem chegar.
SELECT 
    e.codigo_rastreio,
    e.metodo_envio,
    e.previsao_entrega,
    p.valor_total
FROM Envios e
JOIN Pedidos p 
ON e.id_pedido = p.id_pedido
WHERE e.metodo_envio = 'Transportadora'
ORDER BY e.previsao_entrega ASC
LIMIT 8;

-- 4: Equipe de Funcionários e seus Cargos
-- Objetivo: Listar todos os funcionários ativos e seus respectivos cargos (papéis).
SELECT 
    f.nome AS Funcionario,
    f.email,
    p.nome_papel AS Cargo,
    p.descricao AS Descricao_Cargo
FROM funcionarios f
JOIN papeis p 
ON f.id_papel = p.id_papel
WHERE f.Ativo = 1
ORDER BY f.nome ASC
LIMIT 20;

select * from funcionarios;