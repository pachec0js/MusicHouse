USE musicHouse;

INSERT INTO despesas (
    id_franquia, categoria, descricao, valor, data_pagamento, status
) VALUES

(2, 'Aluguel', 'Aluguel mensal da loja', 8500.00, '2025-11-05', 'Paga', NULL),
(2, 'Energia', 'Conta de energia elétrica – Enel', 1290.50, '2025-11-10', NULL, 'Pendente', NULL),
(2, 'Água', 'Conta de água – Sabesp', 230.90, '2025-11-12', '2025-11-13', 'Paga', NULL),
(2, 'Internet', 'Plano empresarial 500mbps – Vivo', 199.99, '2025-11-15', NULL, 'Pendente', NULL),
(2, 'Limpeza', 'Compra de desinfetantes, panos e álcool 70%', 320.00, '2025-11-06', 'Paga', 8),
(2, 'Embalagens', 'Reabastecimento de sacolas e caixas', 780.00, '2025-11-08', NULL, 'Pendente', 6),
(2, 'Escritório', 'Papel A4, toners e canetas', 455.70,  '2025-11-10', 'Paga', 4),
(2, 'Manutenção', 'Troca de luminárias e revisão elétrica', 620.00, '2025-11-03', NULL, 'Atrasada', 7),
(2, 'Suprimentos', 'Reposição de materiais diversos para rotina da loja', 540.50, '2025-11-07', NULL, 'Atrasada', 1),
(2, 'Higiene', 'Sabonete líquido, papel toalha e rolos de papel', 198.90, '2025-11-10', 'Paga', 3),
(2, 'Tecnologia', 'Assinatura de sistema e manutenção de computadores', 410.00, '2025-11-14', NULL, 'Pendente', 10),
(2, 'Serviços', 'Consultoria administrativa mensal', 950.00, '2025-11-05', NULL, 'Atrasada', 9);
