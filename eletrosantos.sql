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
    p.valor_pagamento,
    p.metodo_pagamento,
    p.status_pagamento,
    p.transacao_gateway_id,
    ped.data_pedido,
    c.nome,
    c.telefone
FROM pagamentos p
JOIN pedidos ped
    ON p.id_pedido = ped.id_pedido
JOIN clientes c
    ON c.id_cliente = ped.id_cliente;