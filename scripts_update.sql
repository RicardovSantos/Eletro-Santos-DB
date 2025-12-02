# SCRIPTS UPDATE 
-- 1. Corrigir o preço do Galaxy S25 que estava menor que o custo
UPDATE produtos 
SET preco = 3500.00 
WHERE id_produto = 6;

-- 2. Atualizar o status do pedido do cliente 'Carlos Souza' (ID 8) para 'Enviado'
UPDATE Pedidos 
SET status_pedido = 'Enviado' 
WHERE id_cliente = 8 AND status_pedido = 'Pendente';

-- 3. Atualizar o telefone do fornecedor 
UPDATE fornecedores 
SET telefone_fornecedor = '11988889999' 
WHERE id_fornecedor = 5;

-- 4. Mudar o papel do funcionário 'Ricardo Junior' de Desenvolvedor Jr (4) para Pleno (5)
UPDATE funcionarios 
SET id_papel = 5 
WHERE id_funcionario = 10;