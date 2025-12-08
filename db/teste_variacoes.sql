-- =====================================================
-- CORREÇÃO E INSERÇÃO DE VARIAÇÕES DE PRODUTO
-- IDs recalculados com base na ordem de inserção
-- =====================================================
USE musicHouse;

INSERT INTO variacoes_produto 
(sku, id_produto, nome_cor, cor, valor, custo_producao, desconto, imagem, status)
VALUES

-- ==========================================
-- CATEGORIA 1: CORDAS (IDs 1 ao 13)
-- ==========================================

-- Produto 1: Violão Clássico (Nylon)
('384201', 1, 'Natural Fosco', '#d6b08a', 950.00, 350.00, 0, '/uploads/fotosProdutos/violao-nylon-fosco-frente.png, /uploads/fotosProdutos/violao-nylon-fosco-frente-sem-fundo.png, /uploads/fotosProdutos/violao-nylon-fosco-costa.png, /uploads/fotosProdutos/violao-nylon-fosco-costa-sem-fundo.png', 'Ativo'),
('928473', 1, 'Preto Brilhante', '#1a1a1a', 950.00, 370.00, 0, '/uploads/fotosProdutos/violao-nylon-preto-frente.png, /uploads/fotosProdutos/violao-nylon-preto-frente-sem-fundo.png, /uploads/fotosProdutos/violao-nylon-preto-verso.png, /uploads/fotosProdutos/violao-nylon-preto-verso-sem-fundo.png', 'Ativo'),

-- Produto 2: Violão Aço (Folk)
('572931', 2, 'Sunburst', '#a25a2c', 1350.00, 420.00, 0, '/uploads/fotosProdutos/violao-aco-sunburst-frente.png, /uploads/fotosProdutos/violao-aco-sunburst-frente-sem-fundo.png, /uploads/fotosProdutos/violao-aco-sunburst-verso.png, /uploads/fotosProdutos/violao-aco-sunburst-verso-sem-fundo.png', 'Ativo'),
('148625', 2, 'Natural Claro', '#e1a965', 1350.00, 400.00, 0, '/uploads/fotosProdutos/violao-aco-claro-frente.png, /uploads/fotosProdutos/violao-aco-claro-frente-sem-fundo.png, /uploads/fotosProdutos/violao-aco-claro-verso.png, /uploads/fotosProdutos/violao-aco-claro-verso-sem-fundo.png', 'Ativo'),

-- Produto 3: Guitarra Stratocaster
('639218', 3, 'Bege com Escudo Preto', '#d5c39e', 4200.00, 580.00, 5, '/uploads/fotosProdutos/guitarra-stratocaster-bege-frente.png, /uploads/fotosProdutos/guitarra-stratocaster-bege-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-stratocaster-bege-verso.png, /uploads/fotosProdutos/guitarra-stratocaster-bege-verso-sem-fundo.png', 'Ativo'),
('283915', 3, 'Vermelha Metálica', '#b22222', 4200.00, 590.00, 0, '/uploads/fotosProdutos/guitarra-stratocaster-vermelha-frente.png, /uploads/fotosProdutos/guitarra-stratocaster-vermelha-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-stratocaster-vermelha-verso.png, /uploads/fotosProdutos/guitarra-stratocaster-vermelha-verso-sem-fundo.png', 'Ativo'),
('496307', 3, 'Azul Vintage', '#4682b4', 4200.00, 590.00, 0, '/uploads/fotosProdutos/guitarra-stratocaster-azul-frente.png, /uploads/fotosProdutos/guitarra-stratocaster-azul-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-stratocaster-azul-verso.png, /uploads/fotosProdutos/guitarra-stratocaster-azul-verso-sem-fundo.png', 'Ativo'),

-- Produto 4: Guitarra Les Paul
('801624', 4, 'Cherry Sunburst', '#a03a2b', 5600.00, 650.00, 0, '/uploads/fotosProdutos/guitarra-lespaul-sunburst-frente.png, /uploads/fotosProdutos/guitarra-lespaul-sunburst-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-lespaul-sunburst-verso.png, /uploads/fotosProdutos/guitarra-lespaul-sunburst-verso-sem-fundo.png', 'Ativo'),
('953710', 4, 'Gold Top', '#d4af37', 5600.00, 670.00, 0, '/uploads/fotosProdutos/guitarra-lespaul-gold-frente.png, /uploads/fotosProdutos/guitarra-lespaul-gold-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-lespaul-gold-verso.png, /uploads/fotosProdutos/guitarra-lespaul-gold-verso-sem-fundo.png', 'Ativo'),

-- Produto 6: Baixo Elétrico Jazz Bass (ID 5 pulado pois é o Baixolão, sem variações listadas)
('390862', 6, 'Preto Clássico', '#0d0d0d', 3700.00, 510.00, 0, '/uploads/fotosProdutos/baixo-eletrico-jazz-bass-preto-frente.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-preto-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-preto-verso.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-preto-verso-sem-fundo.png', 'Ativo'),

-- Produto 7: Baixo Elétrico Precision Bass
('627839', 7, 'Branco Vintage', '#f8f8f8', 3900.00, 530.00, 0, '/uploads/fotosProdutos/baixo-eletrico-precision-bass-branco-frente.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-branco-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-branco-verso.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-branco-verso-sem-fundo.png', 'Ativo'),
('512046', 7, 'Azul Marinho', '#001f3f', 3900.00, 540.00, 0, '/uploads/fotosProdutos/baixo-eletrico-precision-bass-azul-frente.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-azul-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-azul-verso.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-azul-verso-sem-fundo.png', 'Ativo'),

-- Produto 8: Viola Caipira 12 Cordas
('749320', 8, 'Natural Polido', '#e3b778', 1600.00, 380.00, 0, '/uploads/fotosProdutos/viola-caipira-12-cordas-polido-frente.png, /uploads/fotosProdutos/viola-caipira-12-cordas-polido-frente-sem-fundo.png, /uploads/fotosProdutos/viola-caipira-12-cordas-polido-verso.png, /uploads/fotosProdutos/viola-caipira-12-cordas-polido-verso-sem-fundo.png', 'Ativo'),
('801357', 8, 'Cerejeira Escura', '#8b3a3a', 1600.00, 390.00, 0, '/uploads/fotosProdutos/viola-caipira-12-cordas-cerejeira-frente.png, /uploads/fotosProdutos/viola-caipira-12-cordas-cerejeira-frente-sem-fundo.png, /uploads/fotosProdutos/viola-caipira-12-cordas-cerejeira-verso.png, /uploads/fotosProdutos/viola-caipira-12-cordas-cerejeira-verso-sem-fundo.png', 'Ativo'),

-- Produto 9: Violino Profissional
('235891', 9, 'Madeira Avermelhada', '#a0522d', 6800.00, 460.00, 0, '/uploads/fotosProdutos/violino-avermelhado-frente.png, /uploads/fotosProdutos/violino-avermelhado-frente-sem-fundo.png, /uploads/fotosProdutos/violino-avermelhado-verso.png, /uploads/fotosProdutos/violino-avermelhado-verso-sem-fundo.png', 'Ativo'),
('783024', 9, 'Marrom Escuro', '#4b2e05', 6800.00, 470.00, 0, '/uploads/fotosProdutos/violino-escuro-frente.png, /uploads/fotosProdutos/violino-escuro-frente-sem-fundo.png, /uploads/fotosProdutos/violino-escuro-verso.png, /uploads/fotosProdutos/violino-escuro-verso-sem-fundo.png', 'Ativo'),

-- Produto 10: Violoncelo Profissional
('986435', 10, 'Natural Envernizado', '#c68642', 12500.00, 750.00, 0, '/uploads/fotosProdutos/violoncelo-natural-frente.png, /uploads/fotosProdutos/violoncelo-natural-frente-sem-fundo.png, /uploads/fotosProdutos/violoncelo-natural-verso.png, /uploads/fotosProdutos/violoncelo-natural-verso-sem-fundo.png', 'Ativo'),
('312759', 10, 'Cereja Profundo', '#6a1b1b', 12500.00, 760.00, 0, '/uploads/fotosProdutos/violoncelo-cereja-frente.png, /uploads/fotosProdutos/violoncelo-cereja-frente-sem-fundo.png, /uploads/fotosProdutos/violoncelo-cereja-verso.png, /uploads/fotosProdutos/violoncelo-cereja-verso-sem-fundo.png', 'Ativo'),

-- Produto 11: Ukulele Soprano
('470128', 11, 'Madeira Clara', '#f5deb3', 480.00, 220.00, 0, '/uploads/fotosProdutos/ukulele-madeira-frente.png, /uploads/fotosProdutos/ukulele-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/ukulele-madeira-verso.png, /uploads/fotosProdutos/ukulele-madeira-verso-sem-fundo.png', 'Ativo'),
('942615', 11, 'Mogno Escuro', '#3b1d0a', 480.00, 230.00, 0, '/uploads/fotosProdutos/ukulele-mogno-frente.png, /uploads/fotosProdutos/ukulele-mogno-frente-sem-fundo.png, /uploads/fotosProdutos/ukulele-mogno-verso.png, /uploads/fotosProdutos/ukulele-mogno-verso-sem-fundo.png', 'Ativo'),

-- Produto 12: Banjo 4 Cordas
('216903', 12, 'Natural', '#d2a679', 1300.00, 310.00, 0, '/uploads/fotosProdutos/banjo-4cordas-natural-frente.png, /uploads/fotosProdutos/banjo-4cordas-natural-frente-sem-fundo.png, /uploads/fotosProdutos/banjo-4cordas-natural-verso.png, /uploads/fotosProdutos/banjo-4cordas-natural-verso-sem-fundo.png', 'Ativo'),

-- Produto 13: Cavaquinho Elétrico
('509387', 13, 'Preto Brilhante', '#000000', 1300.00, 320.00, 0, '/uploads/fotosProdutos/cavaquinho-eletrico-preto-frente.png, /uploads/fotosProdutos/cavaquinho-eletrico-preto-frente-sem-fundo.png, /uploads/fotosProdutos/cavaquinho-eletrico-preto-verso.png, /uploads/fotosProdutos/cavaquinho-eletrico-preto-verso-sem-fundo.png', 'Ativo'),

-- ==========================================
-- CATEGORIA 2: PERCUSSÃO (IDs 14 ao 26)
-- IDs corrigidos: Bateria = 14 (e não 12), etc.
-- ==========================================

-- Produto 14: Bateria Eletrônica Profissional
('379524', 14, 'Cinza Titânio', '#71797e', 3500.00, 980.00, 0, '/uploads/fotosProdutos/bateria-eletrica-cinza-frente.png, /uploads/fotosProdutos/bateria-eletrica-cinza-frente-sem-fundo.png, /uploads/fotosProdutos/bateria-eletrica-cinza-verso.png, /uploads/fotosProdutos/bateria-eletrica-cinza-verso-sem-fundo.png', 'Ativo'),

-- Produto 15: Cajón Flamenco
('821475', 15, 'Madeira Clara', '#deb887', 520.00, 240.00, 0, '/uploads/fotosProdutos/cajon-flamenco-madeira-frente.png, /uploads/fotosProdutos/cajon-flamenco-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/cajon-flamenco-madeira-verso.png, /uploads/fotosProdutos/cajon-flamenco-madeira-verso-sem-fundo.png', 'Ativo'),
('295239', 15, 'Nogal Escuro', '#5a3a1a', 540.00, 250.00, 0, '/uploads/fotosProdutos/cajon-flamenco-nogal-frente.png, /uploads/fotosProdutos/cajon-flamenco-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/cajon-flamenco-nogal-verso.png, /uploads/fotosProdutos/cajon-flamenco-nogal-verso-sem-fundo.png', 'Ativo'),

-- Produto 16: Pandeiro Couro
('473193', 16, 'Aro Dourado', '#cfae30', 420.00, 190.00, 0, '/uploads/fotosProdutos/pandeiro-dourado-frente.png, /uploads/fotosProdutos/pandeiro-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/pandeiro-dourado-verso.png, /uploads/fotosProdutos/pandeiro-dourado-verso-sem-fundo.png', 'Ativo'),
('849632', 16, 'Aro Cromado', '#c0c0c0', 420.00, 195.00, 0, '/uploads/fotosProdutos/pandeiro-cromado-frente.png, /uploads/fotosProdutos/pandeiro-cromado-frente-sem-fundo.png, /uploads/fotosProdutos/pandeiro-cromado-verso.png, /uploads/fotosProdutos/pandeiro-cromado-verso-sem-fundo.png', 'Ativo'),

-- Produto 17: Tamborim Tradicional
('133921', 17, 'Prata', '#c0c0c0', 250.00, 160.00, 0, '/uploads/fotosProdutos/tamborim-prata-frente.png, /uploads/fotosProdutos/tamborim-prata-frente-sem-fundo.png, /uploads/fotosProdutos/tamborim-prata-verso.png, /uploads/fotosProdutos/tamborim-prata-verso-sem-fundo.png', 'Ativo'),
('271339', 17, 'Azul Metálico', '#1e3a8a', 250.00, 170.00, 0, '/uploads/fotosProdutos/tamborim-azul-frente.png, /uploads/fotosProdutos/tamborim-azul-frente-sem-fundo.png, /uploads/fotosProdutos/tamborim-azul-verso.png, /uploads/fotosProdutos/tamborim-azul-verso-sem-fundo.png', 'Ativo'),

-- Produto 18: Congas Quinto
('504856', 18, 'Madeira Natural', '#b8860b', 1600.00, 480.00, 0, '/uploads/fotosProdutos/conga-madeira-frente.png, /uploads/fotosProdutos/conga-madeira-frente-sem-fundo.png', 'Ativo'),
('639442', 18, 'Vermelho Vinil', '#570000', 1600.00, 490.00, 0, '/uploads/fotosProdutos/conga-vermelho-frente.png, /uploads/fotosProdutos/conga-vermelho-frente-sem-fundo.png', 'Ativo'),

-- Produto 19: Bongôs Profissional
('811223', 19, 'Madeira Clara', '#d2b48c', 1100.00, 320.00, 0, '/uploads/fotosProdutos/bongo-madeira-frente.png, /uploads/fotosProdutos/bongo-madeira-frente-sem-fundo.png', 'Ativo'),
('513958', 19, 'Marrom Escuro', '#4b2e05', 1100.00, 330.00, 0, '/uploads/fotosProdutos/bongo-marrom-frente.png, /uploads/fotosProdutos/bongo-marrom-frente-sem-fundo.png', 'Ativo'),

-- Produto 20: Surdo Marcação
('722326', 20, 'Alumínio Escovado', '#929187', 1800.00, 410.00, 0, '/uploads/fotosProdutos/surdo-aluminio-frente.png, /uploads/fotosProdutos/surdo-aluminio-frente-sem-fundo.png, /uploads/fotosProdutos/surdo-aluminio-verso.png, /uploads/fotosProdutos/surdo-aluminio-verso-sem-fundo.png', 'Ativo'),
('493107', 20, 'Preto Fosco', '#2b2b2b', 1800.00, 420.00, 0, '/uploads/fotosProdutos/surdo-preto-frente.png, /uploads/fotosProdutos/surdo-preto-frente-sem-fundo.png, /uploads/fotosProdutos/surdo-preto-verso.png, /uploads/fotosProdutos/surdo-preto-verso-sem-fundo.png', 'Ativo'),

-- Produto 21: Triângulo Tradicional
('239701', 21, 'Metálico', '#ecb520', 160.00, 80.00, 0, '/uploads/fotosProdutos/triangulo-metalico-frente.png, /uploads/fotosProdutos/triangulo-metalico-frente-sem-fundo.png, /uploads/fotosProdutos/triangulo-metalico-verso.png, /uploads/fotosProdutos/triangulo-metalico-verso-sem-fundo.png', 'Ativo'),
('594813', 21, 'Cromado', '#a4a39e', 160.00, 85.00, 0, '/uploads/fotosProdutos/triangulo-cromado-frente.png, /uploads/fotosProdutos/triangulo-cromado-frente-sem-fundo.png, /uploads/fotosProdutos/triangulo-cromado-verso.png, /uploads/fotosProdutos/triangulo-cromado-verso-sem-fundo.png', 'Ativo'),

-- Produto 22: Tantan Madeira
('371249', 22, 'Natural Envernizado', '#d9a066', 890.00, 380.00, 0, '/uploads/fotosProdutos/tantan-envernizado-frente.png, /uploads/fotosProdutos/tantan-envernizado-frente-sem-fundo.png, /uploads/fotosProdutos/tantan-envernizado-cima.png, /uploads/fotosProdutos/tantan-envernizado-cima-sem-fundo.png', 'Ativo'),
('942810', 22, 'Cerejeira', '#8b3a3a', 890.00, 385.00, 0, '/uploads/fotosProdutos/tantan-cerejeira-frente.png, /uploads/fotosProdutos/tantan-cerejeira-frente-sem-fundo.png, /uploads/fotosProdutos/tantan-cerejeira-cima.png, /uploads/fotosProdutos/tantan-cerejeira-cima-sem-fundo.png', 'Ativo'),

-- Produto 23: Reco-reco de Madeira
('816432', 23, 'Natural', '#deb887', 350.00, 110.00, 0, '/uploads/fotosProdutos/reco-reco-madeira-frente.png, /uploads/fotosProdutos/reco-reco-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/reco-reco-madeira-cima.png, /uploads/fotosProdutos/reco-reco-madeira-cima-sem-fundo.png', 'Ativo'),
('504297', 23, 'Madeira Escura', '#4e342e', 350.00, 120.00, 0, '/uploads/fotosProdutos/reco-reco-escuro-cima.png, /uploads/fotosProdutos/reco-reco-escuro-cima-sem-fundo.png, /uploads/fotosProdutos/reco-reco-escuro-frente.png, /uploads/fotosProdutos/reco-reco-escuro-frente-sem-fundo.png', 'Ativo'),

-- Produto 24: Xilofone Estudante
('358901', 24, 'Colorido', '#eb3b28', 680.00, 150.00, 0, '/uploads/fotosProdutos/xilofone-colorido-frente.png, /uploads/fotosProdutos/xilofone-colorido-frente-sem-fundo.png, /uploads/fotosProdutos/xilofone-colorido-em-pe.png, /uploads/fotosProdutos/xilofone-colorido-em-pe-sem-fundo.png', 'Ativo'),
('628430', 24, 'Natural Educacional', '#b3c9c6', 680.00, 160.00, 0, '/uploads/fotosProdutos/xilofone-educacional-frente.png, /uploads/fotosProdutos/xilofone-educacional-frente-sem-fundo.png, /uploads/fotosProdutos/xilofone-educacional-verso.png, /uploads/fotosProdutos/xilofone-educacional-verso-sem-fundo.png', 'Ativo'),

-- Produto 25: Marimba Orquestral
('975621', 25, 'Madeira Escura', '#a06b34', 5800.00, 750.00, 0, '/uploads/fotosProdutos/marimba-escura-frente.png, /uploads/fotosProdutos/marimba-escura-frente-sem-fundo.png, /uploads/fotosProdutos/marimba-escura-verso.png, /uploads/fotosProdutos/marimba-escura-verso-sem-fundo.png', 'Ativo'),
('134759', 25, 'Nogal Premium', '#632001', 5800.00, 780.00, 0, '/uploads/fotosProdutos/marimba-nogal-frente.png, /uploads/fotosProdutos/marimba-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/marimba-nogal-verso.png, /uploads/fotosProdutos/marimba-nogal-verso-sem-fundo.png', 'Ativo'),

-- ==========================================
-- CATEGORIA 3: TECLAS (IDs 27 ao 33)
-- ==========================================

-- Produto 27: Piano Acústico (De Cauda)
('341681', 27, 'Branco Pérola', '#f5f5f0', 58000.00, 2900.00, 0, '/uploads/fotosProdutos/piano-acustico-cauda-branco-frente.png, /uploads/fotosProdutos/piano-acustico-cauda-branco-frente-sem-fundo.png, /uploads/fotosProdutos/piano-acustico-cauda-branco-verso.png, /uploads/fotosProdutos/piano-acustico-cauda-branco-verso-sem-fundo.png', 'Ativo'),
('765584', 27, 'Mogno Envernizado', '#4a1f0a', 58000.00, 2950.00, 0, '/uploads/fotosProdutos/piano-acustico-cauda-mogno-frente.png, /uploads/fotosProdutos/piano-acustico-cauda-mogno-frente-sem-fundo.png, /uploads/fotosProdutos/piano-acustico-cauda-mogno-verso.png, /uploads/fotosProdutos/piano-acustico-cauda-mogno-verso-sem-fundo.png', 'Ativo'),

-- Produto 28: Piano Acústico (Vertical)
('105372', 28, 'Nogal Escuro', '#3e2723', 28500.00, 2300.00, 0, '/uploads/fotosProdutos/piano-acustico-vertical-nogal-frente.png, /uploads/fotosProdutos/piano-acustico-vertical-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/piano-acustico-vertical-nogal-verso.png, /uploads/fotosProdutos/piano-acustico-vertical-nogal-verso-sem-fundo.png', 'Ativo'),
('982603', 28, 'Preto Fosco', '#1a1a1a', 28500.00, 2250.00, 0, '/uploads/fotosProdutos/piano-acustico-vertical-preto-frente.png, /uploads/fotosProdutos/piano-acustico-vertical-preto-frente-sem-fundo.png, /uploads/fotosProdutos/piano-acustico-vertical-preto-verso.png, /uploads/fotosProdutos/piano-acustico-vertical-preto-verso-sem-fundo.png', 'Ativo'),

-- Produto 29: Piano Digital (Portátil)
('508436', 29, 'Preto Clássico', '#0d0d0d', 4200.00, 1800.00, 0, '/uploads/fotosProdutos/piano-digital-portatil-preto-frente.png, /uploads/fotosProdutos/piano-digital-portatil-preto-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-portatil-preto-verso.png, /uploads/fotosProdutos/piano-digital-portatil-preto-verso-sem-fundo.png', 'Ativo'),
('650921', 29, 'Branco Neve', '#f8f8ff', 4200.00, 1820.00, 0, '/uploads/fotosProdutos/piano-digital-portatil-branco-frente.png, /uploads/fotosProdutos/piano-digital-portatil-branco-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-portatil-branco-verso.png, /uploads/fotosProdutos/piano-digital-portatil-branco-verso-sem-fundo.png', 'Ativo'),

-- Produto 30: Piano Digital (De Móvel / Armário)
('289374', 30, 'Nogal Escuro', '#3b2e2a', 6400.00, 1900.00, 0, '/uploads/fotosProdutos/piano-digital-movel-nogal-frente.png, /uploads/fotosProdutos/piano-digital-movel-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-movel-nogal-verso.png, /uploads/fotosProdutos/piano-digital-movel-nogal-verso-sem-fundo.png', 'Ativo'),
('964802', 30, 'Preto Satin', '#2b2b2b', 6400.00, 1920.00, 0, '/uploads/fotosProdutos/piano-digital-movel-preto-frente.png, /uploads/fotosProdutos/piano-digital-movel-preto-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-movel-preto-verso.png, /uploads/fotosProdutos/piano-digital-movel-preto-verso-sem-fundo.png', 'Ativo'),

-- Produto 31: Teclado Arranjador (Avançado 76/88 Teclas)
('834721', 31, 'Preto com Display Azul', '#101820', 7500.00, 2000.00, 0, '/uploads/fotosProdutos/teclado-arranjador-preto-frente.png, /uploads/fotosProdutos/teclado-arranjador-preto-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-arranjador-preto-verso.png, /uploads/fotosProdutos/teclado-arranjador-preto-verso-sem-fundo.png', 'Ativo'),
('413580', 31, 'Cinza Grafite', '#545454', 7500.00, 2050.00, 0, '/uploads/fotosProdutos/teclado-arranjador-cinza-frente.png, /uploads/fotosProdutos/teclado-arranjador-cinza-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-arranjador-cinza-verso.png, /uploads/fotosProdutos/teclado-arranjador-cinza-verso-sem-fundo.png', 'Ativo'),

-- Produto 32: Teclado Controlador MIDI (25 Teclas)
('247690', 32, 'Preto Compacto', '#181818', 980.00, 900.00, 0, '/uploads/fotosProdutos/teclado-controlador-midi-preto-frente.png, /uploads/fotosProdutos/teclado-controlador-midi-preto-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-controlador-midi-preto-verso.png, /uploads/fotosProdutos/teclado-controlador-midi-preto-verso-sem-fundo.png', 'Ativo'),
('958301', 32, 'Branco Studio', '#f3f3f3', 980.00, 920.00, 0, '/uploads/fotosProdutos/teclado-controlador-midi-branco-frente.png, /uploads/fotosProdutos/teclado-controlador-midi-branco-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-controlador-midi-branco-verso.png, /uploads/fotosProdutos/teclado-controlador-midi-branco-verso-sem-fundo.png', 'Ativo'),

-- Produto 33: Sintetizador (Digital)
('736294', 33, 'Preto Espacial', '#0c0c0c', 8900.00, 1500.00, 0, '/uploads/fotosProdutos/sintetizador-digital-preto-frente.png, /uploads/fotosProdutos/sintetizador-digital-preto-frente-sem-fundo.png, /uploads/fotosProdutos/sintetizador-digital-preto-verso.png, /uploads/fotosProdutos/sintetizador-digital-preto-verso-sem-fundo.png', 'Ativo'),
('182653', 33, 'Cinza Metálico', '#757575', 8900.00, 1520.00, 0, '/uploads/fotosProdutos/sintetizador-digital-cinza-frente.png, /uploads/fotosProdutos/sintetizador-digital-cinza-frente-sem-fundo.png, /uploads/fotosProdutos/sintetizador-digital-cinza-verso.png, /uploads/fotosProdutos/sintetizador-digital-cinza-verso-sem-fundo.png', 'Ativo'),
('394820', 33, 'Vermelho Studio', '#a61b1b', 8900.00, 1550.00, 0, '/uploads/fotosProdutos/sintetizador-digital-vermelho-frente.png, /uploads/fotosProdutos/sintetizador-digital-vermelho-frente-sem-fundo.png, /uploads/fotosProdutos/sintetizador-digital-vermelho-verso.png, /uploads/fotosProdutos/sintetizador-digital-vermelho-verso-sem-fundo.png', 'Ativo'),

-- ==========================================
-- CATEGORIA 4: SOPRO (IDs 34 ao 42)
-- ==========================================

-- Produto 34: Flauta Doce (Contralto)
('184762', 34, 'Madeira Clara', '#d2b48c', 350.00, 180.00, 0, '/uploads/fotosProdutos/flauta-doce-madeira-frente.png, /uploads/fotosProdutos/flauta-doce-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/flauta-doce-madeira-verso.png, /uploads/fotosProdutos/flauta-doce-madeira-verso-sem-fundo.png', 'Ativo'),
('509347', 34, 'Ébano Escuro', '#2c2c2c', 360.00, 200.00, 0, '/uploads/fotosProdutos/flauta-doce-ebano-frente.png, /uploads/fotosProdutos/flauta-doce-ebano-frente-sem-fundo.png, /uploads/fotosProdutos/flauta-doce-ebano-verso.png, /uploads/fotosProdutos/flauta-doce-ebano-verso-sem-fundo.png', 'Ativo'),

-- Produto 35: Flauta Transversal (Profissional)
('936124', 35, 'Prateada', '#c0c0c0', 2300.00, 850.00, 0, '/uploads/fotosProdutos/flauta-transversal-prata-frente.png, /uploads/fotosProdutos/flauta-transversal-prata-frente-sem-fundo.png, /uploads/fotosProdutos/flauta-transversal-prata-verso.png, /uploads/fotosProdutos/flauta-transversal-prata-verso-sem-fundo.png', 'Ativo'),
('283619', 35, 'Dourada Luxo', '#d4af37', 2500.00, 900.00, 0, '/uploads/fotosProdutos/flauta-transversal-dourado-frente.png, /uploads/fotosProdutos/flauta-transversal-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/flauta-transversal-dourado-verso.png, /uploads/fotosProdutos/flauta-transversal-dourado-verso-sem-fundo.png', 'Ativo'),

-- Produto 36: Saxofone (Alto)
('724819', 36, 'Lacado Dourado', '#ffd700', 5100.00, 1800.00, 0, '/uploads/fotosProdutos/saxofone-alto-dourado-frente.png, /uploads/fotosProdutos/saxofone-alto-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/saxofone-alto-dourado-verso.png, /uploads/fotosProdutos/saxofone-alto-dourado-verso-sem-fundo.png', 'Ativo'),
('512306', 36, 'Preto Níquel', '#2b2b2b', 5200.00, 1850.00, 0, '/uploads/fotosProdutos/saxofone-alto-preto-frente.png, /uploads/fotosProdutos/saxofone-alto-preto-frente-sem-fundo.png, /uploads/fotosProdutos/saxofone-alto-preto-verso.png, /uploads/fotosProdutos/saxofone-alto-preto-verso-sem-fundo.png', 'Ativo'),

-- Produto 37: Trompete (Bb)
('748125', 37, 'Lacado Dourado', '#daa520', 3900.00, 1500.00, 0, '/uploads/fotosProdutos/trompete-bb-dourado-frente.png, /uploads/fotosProdutos/trompete-bb-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/trompete-bb-dourado-verso.png, /uploads/fotosProdutos/trompete-bb-dourado-verso-sem-fundo.png', 'Ativo'),
('514903', 37, 'Prateado', '#dcdcdc', 3950.00, 1520.00, 0, '/uploads/fotosProdutos/trompete-bb-prateado-frente.png, /uploads/fotosProdutos/trompete-bb-prateado-frente-sem-fundo.png, /uploads/fotosProdutos/trompete-bb-prateado-verso.png, /uploads/fotosProdutos/trompete-bb-prateado-verso-sem-fundo.png', 'Ativo'),
('821390', 37, 'Rose Gold', '#b76e79', 4100.00, 1550.00, 0, '/uploads/fotosProdutos/trompete-bb-rose-frente.png, /uploads/fotosProdutos/trompete-bb-rose-frente-sem-fundo.png, /uploads/fotosProdutos/trompete-bb-rose-verso.png, /uploads/fotosProdutos/trompete-bb-rose-verso-sem-fundo.png', 'Ativo'),

-- Produto 38: Clarinete (Bb)
('284510', 38, 'Madeira Negra', '#1b1b1b', 2800.00, 980.00, 0, '/uploads/fotosProdutos/clarinete-bb-madeira-frente.png, /uploads/fotosProdutos/clarinete-bb-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/clarinete-bb-madeira-verso.png, /uploads/fotosProdutos/clarinete-bb-madeira-verso-sem-fundo.png', 'Ativo'),
('956201', 38, 'Ébano Fosco', '#3a3a3a', 2850.00, 990.00, 0, '/uploads/fotosProdutos/clarinete-bb-ebano-frente.png, /uploads/fotosProdutos/clarinete-bb-ebano-frente-sem-fundo.png, /uploads/fotosProdutos/clarinete-bb-ebano-verso.png, /uploads/fotosProdutos/clarinete-bb-ebano-verso-sem-fundo.png', 'Ativo'),

-- Produto 39: Gaita (Harmônica) Diatônica
('490836', 39, 'Corpo Metálico Prateado', '#b0b0b0', 480.00, 220.00, 0, '/uploads/fotosProdutos/gaita-harmonica-prata-frente.png, /uploads/fotosProdutos/gaita-harmonica-prata-frente-sem-fundo.png, /uploads/fotosProdutos/gaita-harmonica-prata-verso.png, /uploads/fotosProdutos/gaita-harmonica-prata-verso-sem-fundo.png', 'Ativo'),
('703982', 39, 'Corpo Preto', '#101010', 490.00, 230.00, 0, '/uploads/fotosProdutos/gaita-harmonica-preto-frente.png, /uploads/fotosProdutos/gaita-harmonica-preto-frente-sem-fundo.png, /uploads/fotosProdutos/gaita-harmonica-preto-verso.png, /uploads/fotosProdutos/gaita-harmonica-preto-verso-sem-fundo.png', 'Ativo'),

-- Produto 40: Fagote (Modelo Profissional)
('875624', 40, 'Madeira Vermelha', '#8b3a3a', 10200.00, 2500.00, 0, '/uploads/fotosProdutos/fagote-vermelho-frente.png, /uploads/fotosProdutos/fagote-vermelho-frente-sem-fundo.png, /uploads/fotosProdutos/fagote-vermelho-verso.png, /uploads/fotosProdutos/fagote-vermelho-verso-sem-fundo.png', 'Ativo'),
('312587', 40, 'Mogno Escuro', '#4b2e05', 10300.00, 2550.00, 0, '/uploads/fotosProdutos/fagote-mogno-frente.png, /uploads/fotosProdutos/fagote-mogno-frente-sem-fundo.png, /uploads/fotosProdutos/fagote-mogno-verso.png, /uploads/fotosProdutos/fagote-mogno-verso-sem-fundo.png', 'Ativo'),

-- Produto 41: Trompa (Modelo Profissional)
('936701', 41, 'Lacado Dourado', '#d4af37', 7200.00, 1900.00, 0, '/uploads/fotosProdutos/trompa-dourado-frente.png, /uploads/fotosProdutos/trompa-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/trompa-dourado-verso.png, /uploads/fotosProdutos/trompa-dourado-verso-sem-fundo.png', 'Ativo'),
('451029', 41, 'Rose Gold', '#b76e79', 7400.00, 1950.00, 0, '/uploads/fotosProdutos/trompa-rose-frente.png, /uploads/fotosProdutos/trompa-rose-frente-sem-fundo.png, /uploads/fotosProdutos/trompa-rose-verso.png, /uploads/fotosProdutos/trompa-rose-verso-sem-fundo.png', 'Ativo'),

-- Produto 42: Corneta (Modelo Profissional)
('864203', 42, 'Prateada', '#c0c0c0', 3400.00, 1300.00, 0, '/uploads/fotosProdutos/corneta-prata-frente.png, /uploads/fotosProdutos/corneta-prata-frente-sem-fundo.png, /uploads/fotosProdutos/corneta-prata-verso.png, /uploads/fotosProdutos/corneta-prata-verso-sem-fundo.png', 'Ativo'),
('527640', 42, 'Dourada Tradicional', '#daa520', 3500.00, 1320.00, 0, '/uploads/fotosProdutos/corneta-dourada-frente.png, /uploads/fotosProdutos/corneta-dourada-frente-sem-fundo.png, /uploads/fotosProdutos/corneta-dourada-verso.png, /uploads/fotosProdutos/corneta-dourada-verso-sem-fundo.png', 'Ativo'),

-- ==========================================
-- CATEGORIA 5: FOLES (IDs 43 ao 45)
-- ==========================================

-- Produto 43: Acordeon (Sanfona) 80 Baixos
('328571', 43, 'Preto Clássico', '#0a0a0a', 9600.00, 3100.00, 0, '/uploads/fotosProdutos/acordeon-preto-frente.png, /uploads/fotosProdutos/acordeon-preto-frente-sem-fundo.png, /uploads/fotosProdutos/acordeon-preto-verso.png, /uploads/fotosProdutos/acordeon-preto-verso-sem-fundo.png', 'Ativo'),
('459732', 43, 'Vermelho Rubi', '#9b111e', 9800.00, 3200.00, 0, '/uploads/fotosProdutos/acordeon-vermelho-frente.png, /uploads/fotosProdutos/acordeon-vermelho-frente-sem-fundo.png, /uploads/fotosProdutos/acordeon-vermelho-verso.png, /uploads/fotosProdutos/acordeon-vermelho-verso-sem-fundo.png', 'Ativo'),
('847921', 43, 'Branco Pérola', '#f8f6f0', 9900.00, 3250.00, 0, '/uploads/fotosProdutos/acordeon-branco-frente.png, /uploads/fotosProdutos/acordeon-branco-frente-sem-fundo.png, /uploads/fotosProdutos/acordeon-branco-verso.png, /uploads/fotosProdutos/acordeon-branco-verso-sem-fundo.png', 'Ativo'),

-- Produto 44: Harmonium Tradicional Indiano
('176304', 44, 'Madeira Clara', '#deb887', 2400.00, 850.00, 0, '/uploads/fotosProdutos/harmonium-madeira-frente.png, /uploads/fotosProdutos/harmonium-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/harmonium-madeira-verso.png, /uploads/fotosProdutos/harmonium-madeira-verso-sem-fundo.png', 'Ativo'),
('592817', 44, 'Nogal Escuro', '#4e342e', 2600.00, 880.00, 0, '/uploads/fotosProdutos/harmonium-nogal-frente.png, /uploads/fotosProdutos/harmonium-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/harmonium-nogal-verso.png, /uploads/fotosProdutos/harmonium-nogal-verso-sem-fundo.png', 'Ativo'),

-- Produto 45: Bandoneón Clássico Argentino
('701294', 45, 'Preto Tradicional', '#0f0f0f', 5600.00, 1450.00, 0, '/uploads/fotosProdutos/bandoneon-preto-frente.png, /uploads/fotosProdutos/bandoneon-preto-frente-sem-fundo.png, /uploads/fotosProdutos/bandoneon-preto-verso.png, /uploads/fotosProdutos/bandoneon-preto-verso-sem-fundo.png', 'Ativo'),
('835620', 45, 'Madeira Envernizada', '#5a3a1a', 5800.00, 1500.00, 0, '/uploads/fotosProdutos/bandoneon-madeira-frente.png, /uploads/fotosProdutos/bandoneon-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/bandoneon-madeira-verso.png, /uploads/fotosProdutos/bandoneon-madeira-verso-sem-fundo.png', 'Ativo'),

-- ==========================================
-- CATEGORIA 6: ÁUDIO (IDs 46 ao 51)
-- ==========================================

-- Produto 46: Amplificador de Guitarra (Combo)
('591732', 46, 'Preto Clássico', '#0f0f0f', 3100.00, 1200.00, 0, '/uploads/fotosProdutos/amplificador-de-guitarra-preto-frente.png, /uploads/fotosProdutos/amplificador-de-guitarra-preto-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-guitarra-preto-verso.png, /uploads/fotosProdutos/amplificador-de-guitarra-preto-verso-sem-fundo.png', 'Ativo'),
('804529', 46, 'Creme Vintage', '#f3e5ab', 3200.00, 1250.00, 0, '/uploads/fotosProdutos/amplificador-de-guitarra-branco-frente.png, /uploads/fotosProdutos/amplificador-de-guitarra-branco-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-guitarra-branco-verso.png, /uploads/fotosProdutos/amplificador-de-guitarra-branco-verso-sem-fundo.png', 'Ativo'),

-- Produto 47: Amplificador de Guitarra (Cabeçote)
('439678', 47, 'Preto Metálico', '#1c1c1c', 3400.00, 1350.00, 0, '/uploads/fotosProdutos/cabecote-amplificador-guitarra-preto-frente.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-preto-frente-sem-fundo.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-preto-verso.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-preto-verso-sem-fundo.png', 'Ativo'),
('273816', 47, 'Cromado', '#b5b5b5', 3500.00, 1400.00, 0, '/uploads/fotosProdutos/cabecote-amplificador-guitarra-cromado-frente.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-cromado-frente-sem-fundo.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-cromado-verso.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-cromado-verso-sem-fundo.png', 'Ativo'),

-- Produto 48: Amplificador de Baixo (Combo)
('957230', 48, 'Preto', '#101010', 2800.00, 1100.00, 0, '/uploads/fotosProdutos/amplificador-de-baixo-preto-frente.png, /uploads/fotosProdutos/amplificador-de-baixo-preto-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-baixo-preto-verso.png, /uploads/fotosProdutos/amplificador-de-baixo-preto-verso-sem-fundo.png', 'Ativo'),
('368524', 48, 'Cinza Grafite', '#484848', 2900.00, 1150.00, 0, '/uploads/fotosProdutos/amplificador-de-baixo-cinza-frente.png, /uploads/fotosProdutos/amplificador-de-baixo-cinza-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-baixo-cinza-verso.png, /uploads/fotosProdutos/amplificador-de-baixo-cinza-verso-sem-fundo.png', 'Ativo'),

-- Produto 49: Amplificador de Violão (Acústico)
('712486', 49, 'Madeira Clara', '#c19a6b', 2200.00, 950.00, 0, '/uploads/fotosProdutos/amplificador-de-violao-madeira-frente.png, /uploads/fotosProdutos/amplificador-de-violao-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-violao-madeira-verso.png, /uploads/fotosProdutos/amplificador-de-violao-madeira-verso-sem-fundo.png', 'Ativo'),
('143905', 49, 'Mogno Escuro', '#4a2c1d', 2300.00, 980.00, 0, '/uploads/fotosProdutos/amplificador-de-violao-mogno-frente.png, /uploads/fotosProdutos/amplificador-de-violao-mogno-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-violao-mogno-verso.png, /uploads/fotosProdutos/amplificador-de-violao-mogno-verso-sem-fundo.png', 'Ativo'),

-- Produto 50: Caixa Acústica (Passiva)
('625478', 50, 'Preta Tradicional', '#1a1a1a', 1800.00, 1050.00, 0, '/uploads/fotosProdutos/caixa-acustica-passiva-preto-frente.png, /uploads/fotosProdutos/caixa-acustica-passiva-preto-frente-sem-fundo.png, /uploads/fotosProdutos/caixa-acustica-passiva-preto-verso.png, /uploads/fotosProdutos/caixa-acustica-passiva-preto-verso-sem-fundo.png', 'Ativo'),

-- Produto 51: Mesa de Som (Digital)
('492631', 51, 'Preto Futurista', '#121212', 8900.00, 2800.00, 0, '/uploads/fotosProdutos/mesa-de-som-digital-preto-frente.png, /uploads/fotosProdutos/mesa-de-som-digital-preto-frente-sem-fundo.png, /uploads/fotosProdutos/mesa-de-som-digital-preto-verso.png, /uploads/fotosProdutos/mesa-de-som-digital-preto-verso-sem-fundo.png', 'Ativo');