# SCRIPTS DELETE
-- 1. Remover um item do carrinho do cliente 10 (desistiu da compra)
DELETE FROM carrinhos 
WHERE id_cliente = 10 AND id_produto = 5;

-- 2. Deletei o pagamento recusado do pedido 9 (para limpar o histórico ou tentar novamente)
DELETE FROM Pagamentos 
WHERE id_pedido = 9 AND status_pagamento = 'Recusado';

-- 3. Exclui o envio de um pedido que foi cancelado (Pedido 9)
DELETE FROM Envios 
WHERE id_pedido = 9;

-- 4. Remover uma imagem de produto que não é mais usada (ex: imagem 10)
DELETE FROM imagens_produto 
WHERE id_imagem = 10;

