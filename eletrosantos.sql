-- Active: 1764012638843@@127.0.0.1@3306@eletrosantos
SELECT * FROM carrinhos

SELECT
c.nome,
c.data_nascimento as nascimento,
p.id_pedido,
p.valor_total
FROM
clientes c
INNER JOIN pedidos p 
ON 
c.id_cliente = p.id_pedido; 

SELECT 
    c.nome,
    p.status_pedido,
    p.valor_total,
    i.quantidade,
    prod.nome_produto,  -- Corrigido alias
    prod.preco,
    prod.preco_custo
FROM clientes c
INNER JOIN pedidos p 
    ON c.id_cliente = p.id_cliente          -- Liga Cliente ao Pedido
INNER JOIN itens_pedido i 
    ON p.id_pedido = i.id_pedido            -- Liga Pedido aos Itens (tabela do meio)
INNER JOIN produtos prod 
    ON i.id_produto = prod.id_produto;      -- Liga Itens ao Produto