USE musicHouse;

-- =====================================================
-- PRODUTOS - CATEGORIA CORDAS (id_categoria = 1)
-- =====================================================

INSERT INTO produtos (
  sku, nome, descricao, materiais, detalhes,
  nome_cor, cor, desconto, id_categoria, valor, custo_producao, imagem
) VALUES
('521394', 'Violão Clássico (Nylon)', 
'A classical wooden acoustic guitar with nylon strings, natural finish, warm studio lighting, professional product photo.', 
'Tampo em spruce, laterais e fundo em mogno.', 
'Violão de estudo com timbre suave e confortável.', 'Natural', '#b35201', NULL, 1, 950.00, 570.00, 
'/uploads/fotosProdutos/violao-nylon-frente.png, /uploads/fotosProdutos/violao-nylon-frente-sem-fundo.png, /uploads/fotosProdutos/violao-nylon-verso.png, /uploads/fotosProdutos/violao-nylon-verso-sem-fundo.png'),

('713625', 'Violão Aço (Folk)', 
'A steel-string acoustic folk guitar with a large body and glossy wood finish, photographed on a neutral background with soft lighting.', 
'Corpo em rosewood e tampo em spruce.', 'Som brilhante, ideal para palco e gravação.', 'Natural Brilhante', '#C49A6C', NULL, 1, 1350.00, 810.00, 
'/uploads/fotosProdutos/violao-aco-frente.png, /uploads/fotosProdutos/violao-aco-frente-sem-fundo.png, /uploads/fotosProdutos/violao-aco-verso.png, /uploads/fotosProdutos/violao-aco-verso-sem-fundo.png'),

('438915', 'Guitarra Stratocaster', 'An electric Stratocaster guitar with a white body and black pickguard, modern lighting, high-quality studio image.', 'Corpo em alder, braço em maple.', 'Três captadores single coil e chave seletora de 5 posições.', 'Branco', '#FFFFFF', NULL, 1, 4200.00, 2520.00, '/uploads/fotosProdutos/guitarra-stratocaster-frente.png, /uploads/fotosProdutos/guitarra-stratocaster-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-stratocaster-verso.png, /uploads/fotosProdutos/guitarra-stratocaster-verso-sem-fundo.png'),

('820491', 'Guitarra Les Paul', 'A Les Paul style electric guitar with a flame maple top, amber color, gold hardware, and dramatic dark background lighting.', 'Top em maple flame, corpo em mogno.', 'Dois captadores humbucker e ponte Tune-o-Matic.', 'Amber Flame', '#D2691E', NULL, 1, 5600.00, 3360.00, '/uploads/fotosProdutos/guitarra-lespaul-frente.png, /uploads/fotosProdutos/guitarra-lespaul-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-lespaul-verso.png, /uploads/fotosProdutos/guitarra-lespaul-verso-sem-fundo.png'),

('179632', 'Baixo Acústico (Baixolão) 4 Cordas', 'A four-string acoustic bass guitar with a large wooden body, natural matte finish, displayed on a wooden floor with studio lighting.', 'Tampo em spruce, corpo em mogno.', 'Captação ativa e braço confortável.', 'Natural Fosco', '#ac6a23', NULL, 1, 2100.00, 1260.00, '/uploads/fotosProdutos/baixolao-frente.png, /uploads/fotosProdutos/baixolao-frente-sem-fundo.png, /uploads/fotosProdutos/baixolao-verso.png, /uploads/fotosProdutos/baixolao-verso-sem-fundo.png'),

('493725', 'Baixo Elétrico Jazz Bass', 'A Jazz Bass electric guitar with sunburst finish, two pickups, chrome hardware, and studio lighting.', 'Corpo em alder, braço em maple.', 'Dois captadores single coil, timbre vintage.', 'Sunburst', '#8B4513', NULL, 1, 3700.00, 2220.00, '/uploads/fotosProdutos/baixo-eletrico-jazz-bass-frente.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-verso.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-verso-sem-fundo.png'),

('260498', 'Baixo Elétrico Precision Bass', 'A Precision Bass electric guitar with black body, maple neck, vintage look, photographed on dark background.', 'Corpo em alder, braço maple e captador split coil.', 'Design clássico e som encorpado.', 'Preto', '#111111', NULL, 1, 3900.00, 2340.00, '/uploads/fotosProdutos/baixo-eletrico-precision-bass-frente.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-verso.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-verso-sem-fundo.png'),

('619874', 'Viola Caipira 12 Cordas', 'A modern 12-string Brazilian viola caipira, polished wood finish, studio lighting, front-facing product photo.', 'Corpo em mogno e tampo em spruce.', 'Braço reforçado, timbre cristalino.', 'Natural Polido', '#D2A679', NULL, 1, 1600.00, 960.00, '/uploads/fotosProdutos/viola-caipira-12-cordas-frente.png, /uploads/fotosProdutos/viola-caipira-12-cordas-frente-sem-fundo.png, /uploads/fotosProdutos/viola-caipira-12-cordas-verso.png, /uploads/fotosProdutos/viola-caipira-12-cordas-verso-sem-fundo.png'),

('982310', 'Violino Profissional', 'A professional violin with dark varnish, fine wood texture, and elegant studio lighting for concert presentation.', 'Madeira maple flame e ébano.', 'Cordas de aço e arco em crina natural.', 'Vermelho Escuro', '#8B0000', NULL, 1, 6800.00, 4080.00, '/uploads/fotosProdutos/violino-frente.png, /uploads/fotosProdutos/violino-frente-sem-fundo.png, /uploads/fotosProdutos/violino-verso.png, /uploads/fotosProdutos/violino-verso-sem-fundo.png'),

('312654', 'Violoncelo Profissional', 'A professional concert cello with dark polished wood, elegant shape, under soft spotlight on stage.', 'Corpo em maple europeu.', 'Som encorpado e sustentado.', 'Vermelho Mogno', '#8B4513', NULL, 1, 12500.00, 7500.00, '/uploads/fotosProdutos/violoncelo-profissional-frente.png, /uploads/fotosProdutos/violoncelo-profissional-frente-sem-fundo.png, /uploads/fotosProdutos/violoncelo-profissional-verso.png, /uploads/fotosProdutos/violoncelo-profissional-verso-sem-fundo.png'),

('897324', 'Ukulele Soprano', 'A small soprano ukulele with light wood finish, tropical vibe, photographed on beige background with warm light.', 'Corpo em mahogany e tampo spruce.', 'Som suave e portátil.', 'Natural Claro', '#E6BE8A', NULL, 1, 480.00, 288.00, '/uploads/fotosProdutos/ukulele-soprano-frente.png, /uploads/fotosProdutos/ukulele-soprano-frente-sem-fundo.png, /uploads/fotosProdutos/ukulele-soprano-verso.png, /uploads/fotosProdutos/ukulele-soprano-verso-sem-fundo.png'),

('235781', 'Banjo 4 Cordas', 'A 4-string traditional banjo with metallic rim and wooden neck, retro look, natural lighting.', 'Aros em alumínio e braço em maple.', 'Som brilhante e percussivo.', 'Natural com Metal', '#C0C0C0', NULL, 1, 1450.00, 870.00, '/uploads/fotosProdutos/banjo-4-cordas-frente.png, /uploads/fotosProdutos/banjo-4-cordas-frente-sem-fundo.png, /uploads/fotosProdutos/banjo-4-cordas-verso.png, /uploads/fotosProdutos/banjo-4-cordas-verso-sem-fundo.png'),

('519843', 'Cavaquinho Elétrico', 'An electric cavaquinho with solid body, embedded pickups, modern lighting on dark studio background.', 'Corpo sólido em mogno e captação ativa.', 'Design moderno, ideal para palco.', 'Bege Claro', '#e0b362', NULL, 1, 1300.00, 780.00, '/uploads/fotosProdutos/cavaquinho-eletrico-frente.png, /uploads/fotosProdutos/cavaquinho-eletrico-frente-sem-fundo.png, /uploads/fotosProdutos/cavaquinho-eletrico-verso.png, /uploads/fotosProdutos/cavaquinho-eletrico-verso-sem-fundo.png');

-- =====================================================
-- PRODUTOS - CATEGORIA PERCUSSÃO (id_categoria = 2)
-- =====================================================
INSERT INTO produtos (
  sku, nome, descricao, materiais, detalhes,
  nome_cor, cor, desconto, id_categoria, valor, custo_producao, imagem
) VALUES
('624981', 'Bateria Eletrônica Profissional (Pads de Mesh)', 
'A professional electronic drum kit with mesh pads, large display module, black finish, photographed in a recording studio.',
'Estrutura em aço e pads com malha dupla.', 
'Módulo digital com 700 sons e conectividade USB/MIDI.', 
'Preto Fosco', '#111111', NULL, 2, 9800.00, 5880.00, '/uploads/fotosProdutos/bateria-eletrica-frente.png, /uploads/fotosProdutos/bateria-eletrica-frente-sem-fundo.png, /uploads/fotosProdutos/bateria-eletrica-verso.png, /uploads/fotosProdutos/bateria-eletrica-verso-sem-fundo.png'),

('835207', 'Cajón Flamenco', 
'A flamenco cajón made of polished wood, front striking surface, placed on a wooden floor with warm lighting.', 
'Madeira compensada de bétula e painel frontal em mogno.', 
'Timbre definido para palmas e graves encorpados.', 
'Natural Polido', '#D2B48C', NULL, 2, 890.00, 534.00, '/uploads/fotosProdutos/cajon-flamenco-frente.png, /uploads/fotosProdutos/cajon-flamenco-frente-sem-fundo.png, /uploads/fotosProdutos/cajon-flamenco-verso.png, /uploads/fotosProdutos/cajon-flamenco-verso-sem-fundo.png'),

('921543', 'Pandeiro Couro', 
'A leather-headed pandeiro with brass jingles, handcrafted style, rustic lighting on wooden surface.', 
'Aros de madeira e platinelas de latão.', 
'Membrana de couro natural, 10 polegadas.', 
'Natural', '#E6BE8A', NULL, 2, 450.00, 270.00, '/uploads/fotosProdutos/pandeiro-couro-frente.png, /uploads/fotosProdutos/pandeiro-couro-frente-sem-fundo.png, /uploads/fotosProdutos/pandeiro-couro-verso-sem-fundo.png, /uploads/fotosProdutos/pandeiro-couro-verso-sem-fundo.png'),

('763201', 'Tamborim Tradicional', 
'A traditional samba tamborim with nylon head, metal rim, placed on a percussion table under studio lighting.', 
'Aro de alumínio e pele de nylon.', 
'Perfeito para bateria de escola de samba.', 
'Prateado', '#99846c', NULL, 2, 240.00, 144.00, '/uploads/fotosProdutos/tamborim-frente.png, /uploads/fotosProdutos/tamborim-frente-sem-fundo.png'),

('149872', 'Congas Quinto', 
'A single quinto conga drum, tall and narrow, dark wood finish with chrome hardware, studio lighting.', 
'Madeira de carvalho com ferragens cromadas.', 
'Altura de 75cm e afinação por chaves.', 
'Mogno Escuro', '#8B4513', NULL, 2, 3100.00, 1860.00, '/uploads/fotosProdutos/conga-frente.png, /uploads/fotosProdutos/conga-frente-sem-fundo.png, /uploads/fotosProdutos/conga-verso.png, /uploads/fotosProdutos/conga-verso-sem-fundo.png'),

('658304', 'Bongôs Profissional', 
'Professional bongo drums with dark polished wood, metal tuning lugs, photographed on black background.', 
'Mogno e ferragens niqueladas.', 
'Tamanhos 7” e 8,5”, pele natural.', 
'Natural Escuro', '#5C4033', NULL, 2, 1350.00, 810.00, '/uploads/fotosProdutos/bongo-frente.png, /uploads/fotosProdutos/bongo-frente-sem-fundo.png, /uploads/fotosProdutos/bongo-verso.png, /uploads/fotosProdutos/bongo-verso-sem-fundo.png'),

('278965', 'Surdo Marcação', 
'A large samba surdo drum for bass rhythm, deep aluminum body, strong visual lighting, street parade vibe.', 
'Corpo em alumínio escovado e pele dupla.', 
'Utilizado em desfiles e blocos de carnaval.', 
'Alumínio', '#B0B0B0', NULL, 2, 1750.00, 1050.00, '/uploads/fotosProdutos/surdo-frente.png, /uploads/fotosProdutos/surdo-frente-sem-fundo.png, /uploads/fotosProdutos/surdo-verso.png, /uploads/fotosProdutos/surdo-verso-sem-fundo.png'),

('987130', 'Triângulo Tradicional', 
'A metal triangle percussion instrument with a simple design, hanging with striker, isolated on white background.', 
'Aço inoxidável.', 
'Inclui baqueta e cordão de fixação.', 
'Metálico', '#C0C0C0', NULL, 2, 90.00, 54.00, '/uploads/fotosProdutos/triangulo-frente.png, /uploads/fotosProdutos/triangulo-frente-sem-fundo.png, /uploads/fotosProdutos/triangulo-verso.png, /uploads/fotosProdutos/triangulo-verso-sem-fundo.png'),

('305478', 'Tantan Madeira', 
'A wooden tantan drum, cylindrical shape, natural finish, used in pagode music, warm studio lighting.', 
'Mogno e couro natural.', 
'Sonoridade grave e suave.', 
'Natural', '#DEB887', NULL, 2, 760.00, 456.00, '/uploads/fotosProdutos/tantan-frente.png, /uploads/fotosProdutos/tantan-frente-sem-fundo.png, /uploads/fotosProdutos/tantan-cima.png, /uploads/fotosProdutos/tantan-cima-sem-fundo.png'),

('498320', 'Reco-reco de Madeira', 
'A wooden reco-reco with carved ridges and a stick, photographed on a light wood surface, warm tones.', 
'Mogno entalhado e baqueta de madeira.', 
'Timbre rústico e artesanal.', 
'Natural Envernizado', '#CDAA7D', NULL, 2, 180.00, 108.00, '/uploads/fotosProdutos/reco-reco-frente.png, /uploads/fotosProdutos/reco-reco-frente-sem-fundo.png, /uploads/fotosProdutos/reco-reco-cima.png, /uploads/fotosProdutos/reco-reco-cima-sem-fundo.png'),

('152937', 'Xilofone Estudante', 
'A small xylophone for students with colorful bars, mallets included, photographed on white background.', 
'Base em madeira com lâminas plásticas coloridas.', 
'Acompanha par de baquetas.', 
'Marrom', '#ecd7b3', NULL, 2, 290.00, 174.00, '/uploads/fotosProdutos/xilofone-frente.png, /uploads/fotosProdutos/xilofone-frente-sem-fundo.png, /uploads/fotosProdutos/xilofone-verso.png, /uploads/fotosProdutos/xilofone-verso-sem-fundo.png'),

('831276', 'Marimba Orquestral', 
'A professional orchestral marimba with wooden resonators and mallets, concert hall background lighting.', 
'Lâminas de rosewood e ressonadores metálicos.', 
'Som encorpado, usado em orquestras.', 
'Madeira Natural', '#8B4513', NULL, 2, 21000.00, 12600.00, '/uploads/fotosProdutos/marimba-orquestral-frente.png, /uploads/fotosProdutos/marimba-orquestral-frente-sem-fundo.png, /uploads/fotosProdutos/marimba-orquestral-verso.png, /uploads/fotosProdutos/marimba-orquestral-verso-sem-fundo.png'),

('489072', 'Glockenspiel Orquestral', 
'A professional orchestral glockenspiel mounted on a frame with mallets, dark concert background lighting.', 
'Lâminas de aço e estrutura tubular.', 
'Sonoridade aguda e cristalina.', 
'Metálico', '#D3D3D3', NULL, 2, 7200.00, 4320.00, '/uploads/fotosProdutos/glockenspiel-profissional-frente.png, /uploads/fotosProdutos/glockenspiel-profissional-frente-sem-fundo.png, /uploads/fotosProdutos/glockenspiel-profissional-verso.png, /uploads/fotosProdutos/glockenspiel-profissional-verso-sem-fundo.png');

-- =====================================================
-- PRODUTOS - CATEGORIA TECLAS (id_categoria = 3)
-- =====================================================

INSERT INTO produtos (
  sku, nome, descricao, materiais, detalhes,
  nome_cor, cor, desconto, id_categoria, valor, custo_producao, imagem
) VALUES
('612489', 'Piano Acústico (De Cauda)',
'A grand acoustic piano with glossy black finish, open lid showing strings, photographed in a concert hall with warm lighting.',
'Tampa e corpo em madeira nobre com acabamento em poliéster preto.',
'88 teclas de marfim sintético, som encorpado e harmônico.',
'Preto Brilhante', '#000000', NULL, 3, 58000.00, 34800.00, '/uploads/fotosProdutos/piano-acustico-cauda-frente.png, /uploads/fotosProdutos/piano-acustico-cauda-frente-sem-fundo.png, /uploads/fotosProdutos/piano-acustico-corda-verso.png, /uploads/fotosProdutos/piano-acustico-corda-verso-sem-fundo.png'),

('204718', 'Piano Acústico (Vertical)',
'An upright acoustic piano made of dark polished wood, photographed against a wall with soft ambient lighting.',
'Estrutura em madeira de nogueira com martelos de feltro.',
'Compacto e ideal para ambientes menores.',
'Mogno Escuro', '#5B3A29', NULL, 3, 28500.00, 17100.00, '/uploads/fotosProdutos/piano-acustico-vertical-frente.png, /uploads/fotosProdutos/piano-acustico-vertical-frente-sem-fundo.png, /uploads/fotosProdutos/piano-acustico-vertical-verso.png, /uploads/fotosProdutos/piano-acustico-vertical-verso-sem-fundo.png'),

('739160', 'Piano Digital (Portátil)',
'A compact digital piano with 88 weighted keys, minimalist black design, displayed in a modern home studio.',
'Corpo em plástico ABS reforçado, teclas semi-pesadas.',
'Inclui saída USB e conexão para fones.',
'Preto Fosco', '#1C1C1C', NULL, 3, 4200.00, 2520.00, '/uploads/fotosProdutos/piano-digital-portatil-frente.png, /uploads/fotosProdutos/piano-digital-portatil-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-portatil-verso.png, /uploads/fotosProdutos/piano-digital-portatil-verso-sem-fundo.png'),

('528903', 'Piano Digital (De Móvel / Armário)',
'A cabinet-style digital piano with built-in stand and pedals, dark wood finish, photographed in a cozy living room setting.',
'Estrutura em MDF revestido e teclas com ação hammer.',
'Sistema estéreo e 10 timbres internos.',
'Madeira Escura', '#3B2F2F', NULL, 3, 6400.00, 3840.00, '/uploads/fotosProdutos/piano-digital-movel-frente.png, /uploads/fotosProdutos/piano-digital-movel-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-movel-verso.png, /uploads/fotosProdutos/piano-digital-movel-verso-sem-fundo.png'),

('481279', 'Teclado Arranjador (Avançado 76/88 Teclas)',
'A professional arranger keyboard with extended 76 keys, multiple controls and display, photographed in a recording studio.',
'Carcaça em alumínio leve, display LCD colorido.',
'Ritmos integrados e gravação em tempo real.',
'Prateado', '#C0C0C0', NULL, 3, 7500.00, 4500.00, '/uploads/fotosProdutos/teclado-arranjador-frente.png, /uploads/fotosProdutos/teclado-arranjador-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-arranjador-verso.png, /uploads/fotosProdutos/teclado-arranjador-verso-sem-fundo.png'),

('967540', 'Teclado Controlador MIDI (25 Teclas)',
'A small 25-key MIDI controller keyboard with drum pads and knobs, modern lighting on white background.',
'Corpo em ABS preto fosco e conexões USB-C.',
'Compatível com DAWs profissionais.',
'Preto Fosco', '#111111', NULL, 3, 980.00, 588.00, '/uploads/fotosProdutos/teclado-controlador-midi-frente.png, /uploads/fotosProdutos/teclado-controlador-midi-frente-sem-frente.png, /uploads/fotosProdutos/teclado-controlador-midi-verso.png, /uploads/fotosProdutos/teclado-controlador-midi-verso-sem-fundo.png'),

('379826', 'Sintetizador (Digital)',
'A modern digital synthesizer with sleek design, LCD display, and touch controls, in a futuristic studio environment.',
'Painel metálico com 61 teclas sensíveis à velocidade.',
'Gerador de som digital com 512 presets.',
'Preto Grafite', '#2F2F2F', NULL, 3, 8900.00, 5340.00, '/uploads/fotosProdutos/sintetizador-digital-frente.png, /uploads/fotosProdutos/sintetizador-digital-frente-sem-fundo.png, /uploads/fotosProdutos/sintetizador-digital-verso.png, /uploads/fotosProdutos/sintetizador-digital-verso-sem-fundo.png');

-- =====================================================
-- PRODUTOS - CATEGORIA SOPRO (id_categoria = 4)
-- =====================================================

INSERT INTO produtos (
  sku, nome, descricao, materiais, detalhes,
  nome_cor, cor, desconto, id_categoria, valor, custo_producao, imagem
) VALUES
('982431', 'Flauta Doce (Contralto)',
'An alto recorder made of dark wood, traditional design, placed on a sheet of classical music with warm lighting.',
'Madeira de ébano e chaves ajustadas.',
'Sonoridade suave e ideal para aprendizado clássico.',
'Mogno Escuro', '#4B3621', NULL, 4, 420.00, 252.00, '/uploads/fotosProdutos/flauta-doce-frente.png, /uploads/fotosProdutos/flauta-doce-frente-sem-fundo.png'),

('134682', 'Flauta Transversal (Profissional)',
'A professional silver flute with open holes and elegant engravings, photographed in a concert hall setting with warm spotlight.',
'Prata banhada com corpo em níquel.',
'Afinada em C, ideal para uso orquestral.',
'Prateado', '#DCDCDC', NULL, 4, 7200.00, 4320.00, '/uploads/fotosProdutos/flauta-transversal-frente.png, /uploads/fotosProdutos/flauta-transversal-frente-sem-fundo.png, /uploads/fotosProdutos/flauta-transversal-verso.png, /uploads/fotosProdutos/flauta-transversal-verso-sem-fundo.png'),

('843965', 'Saxofone (Alto)',
'An alto saxophone with gold lacquer finish, classic curved shape, photographed against a dark studio background with dramatic light.',
'Latão com acabamento dourado e chaves em madrepérola.',
'Timbre clássico e resposta rápida.',
'Dourado', '#FFD700', NULL, 4, 9800.00, 5880.00, '/uploads/fotosProdutos/saxofone-alto-frente.png, /uploads/fotosProdutos/saxofone-alto-frente-sem-fundo.png, /uploads/fotosProdutos/saxofone-alto-verso.png, /uploads/fotosProdutos/saxofone-alto-verso-sem-fundo.png'),

('270319', 'Trompete (Bb)',
'A standard Bb trumpet with gold lacquer finish and silver mouthpiece, placed on a reflective black surface with concert lighting.',
'Corpo em latão com bocal niquelado.',
'Afinado em Si♭, ideal para iniciantes e profissionais.',
'Dourado', '#FFD700', NULL, 4, 5400.00, 3240.00, '/uploads/fotosProdutos/trompete-bb-frente.png, /uploads/fotosProdutos/trompete-bb-frente-sem-fundo.png, /uploads/fotosProdutos/trompete-bb-verso.png, /uploads/fotosProdutos/trompete-bb-verso-sem-fundo.png'),

('761084', 'Clarinete (Bb)',
'A Bb clarinet with black body and silver keys, lying on a wooden table, soft classical lighting.',
'Resina ABS com chaves niqueladas.',
'Sonorização clara e projeção equilibrada.',
'Preto', '#000000', NULL, 4, 3900.00, 2340.00, '/uploads/fotosProdutos/clarinete-bb-frente.png, /uploads/fotosProdutos/clarinete-bb-frente-sem-fundo.png, /uploads/fotosProdutos/clarinete-bb-verso.png, /uploads/fotosProdutos/clarinete-bb-verso-sem-fundo.png'),

('689431', 'Gaita (Harmônica) Diatônica',
'A diatonic harmonica with metal cover and wooden comb, pocket-size, photographed on a rustic wooden surface.',
'Corpo em madeira e tampas cromadas.',
'Tonalidade C, ideal para blues e folk.',
'Metálico', '#C0C0C0', NULL, 4, 350.00, 210.00, '/uploads/fotosProdutos/gaita-harmonica-frente.png, /uploads/fotosProdutos/gaita-harmonica-frente-sem-fundo.png, /uploads/fotosProdutos/gaita-harmonica-verso.png, /uploads/fotosProdutos/gaita-harmonica-verso-sem-fundo.png'),

('245786', 'Fagote (Modelo Profissional)',
'A professional bassoon with rich red wood finish, intricate silver key system, concert hall background lighting.',
'Maple vermelho e sistema Heckel.',
'Instrumento de orquestra com timbre aveludado.',
'Vermelho Escuro', '#8B0000', NULL, 4, 28500.00, 17100.00, '/uploads/fotosProdutos/fagote-frente.png, /uploads/fotosProdutos/fagote-frente-sem-fundo.png, /uploads/fotosProdutos/fagote-verso.png, /uploads/fotosProdutos/fagote-verso-sem-fundo.png'),

('924518', 'Trompa (Modelo Profissional)',
'A professional French horn with full double horn system, gold lacquer finish, photographed in a concert environment.',
'Latão dourado com chaves rotativas.',
'Sonoridade ampla e projeção poderosa.',
'Dourado Envelhecido', '#DAA520', NULL, 4, 16500.00, 9900.00, '/uploads/fotosProdutos/trompa-frente.png, /uploads/fotosProdutos/trompa-frente-sem-fundo.png, /uploads/fotosProdutos/trompa-verso.png, /uploads/fotosProdutos/trompa-verso-sem-fundo.png'),

('378902', 'Corneta (Modelo Profissional)',
'A professional silver cornet, refined design, photographed on stage lighting setup with blurred orchestra background.',
'Corpo em prata com válvulas de pistão rápidas.',
'Timbre suave, ideal para bandas sinfônicas.',
'Prateado', '#C0C0C0', NULL, 4, 8200.00, 4920.00, '/uploads/fotosProdutos/corneta-frente.png, /uploads/fotosProdutos/corneta-frente-sem-fundo.png, /uploads/fotosProdutos/corneta-verso.png, /uploads/fotosProdutos/corneta-verso-sem-fundo.png');

-- =====================================================
-- PRODUTOS - CATEGORIA FOLES (id_categoria = 5)
-- =====================================================

INSERT INTO produtos (
  sku, nome, descricao, materiais, detalhes,
  nome_cor, cor, desconto, id_categoria, valor, custo_producao, imagem
) VALUES
('582971', 'Acordeon (Sanfona) 80 Baixos',
'A full-size 80-bass accordion with pearl buttons and decorative grille, photographed in a folk music studio with soft light.',
'Corpo em madeira compensada, fole em tecido reforçado e botões de madrepérola.',
'Timbre tradicional, ideal para forró, vanerão e música regional.',
'Preto com Branco', '#000000', NULL, 5, 9600.00, 5760.00, '/uploads/fotosProdutos/acordeon-frente.png, /uploads/fotosProdutos/acordeon-frente-sem-fundo.png, /uploads/fotosProdutos/acordeon-verso.png, /uploads/fotosProdutos/acordeon-verso-sem-fundo.png'),

('920516', 'Harmonium Tradicional Indiano',
'A classic Indian harmonium with decorative carvings, extended bellows, photographed in a traditional music room setting.',
'Madeira de teca com entalhes ornamentais.',
'Timbre quente e ressonância profunda.',
'Natural Entalhado', '#CD853F', NULL, 5, 8400.00, 5040.00, '/uploads/fotosProdutos/harmonium-frente.png, /uploads/fotosProdutos/harmonium-frente-sem-fundo.png, /uploads/fotosProdutos/harmonium-verso.png, /uploads/fotosProdutos/harmonium-verso-sem-fundo.png'),

('362094', 'Bandoneón Clássico Argentino',
'A classic Argentine bandoneon with black wooden body, pearl buttons, open bellows, photographed under soft tango-style lighting.',
'Mogno preto com botões de madrepérola.',
'Instrumento típico do tango, som expressivo e melancólico.',
'Preto Piano', '#111111', NULL, 5, 11800.00, 7080.00, '/uploads/fotosProdutos/bandoneon-frente.png, /uploads/fotosProdutos/bandoneon-frente-sem-fundo.png, /uploads/fotosProdutos/bandoneon-verso.png, /uploads/fotosProdutos/bandoneon-verso-sem-fundo.png');

-- =====================================================
-- PRODUTOS - CATEGORIA EQUIPAMENTOS DE ÁUDIO (id_categoria = 6)
-- =====================================================

INSERT INTO produtos (
  sku, nome, descricao, materiais, detalhes,
  nome_cor, cor, desconto, id_categoria, valor, custo_producao, imagem
) VALUES
('142693', 'Amplificador de Guitarra (Combo)',
'A combo guitar amplifier with black tolex finish, silver grille cloth, control knobs on top, photographed in a recording studio with moody lighting.',
'Caixa em MDF revestida com courvin preto e tela prateada.',
'Potência de 40W RMS, ideal para ensaios e pequenos shows.',
'Preto Fosco', '#1C1C1C', NULL, 6, 2800.00, 1680.00, '/uploads/fotosProdutos/amplificador-de-guitarra-frente.png, /uploads/fotosProdutos/amplificador-de-guitarra-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-guitarra-verso.png, /uploads/fotosProdutos/amplificador-de-guitarra-verso-sem-fundo.png'),

('587420', 'Amplificador de Guitarra (Cabeçote)',
'A guitar amp head with metal chassis and glowing tubes, placed on top of a speaker cabinet, illuminated by warm stage lighting.',
'Chassi metálico e válvulas EL34.',
'Cabeçote valvulado de 100W com canal limpo e drive.',
'Preto com Detalhes Dourados', '#2B2B2B', NULL, 6, 6200.00, 3720.00, '/uploads/fotosProdutos/cabecote-amplificador-guitarra-frente.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-frente-sem-fundo.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-verso.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-verso-sem-fundo.png'),

('904315', 'Amplificador de Baixo (Combo)',
'A bass combo amplifier with a large speaker grille, dark design, photographed in a rehearsal room environment.',
'Gabinete em madeira laminada, alto-falante de 15".',
'Som encorpado, equalizador ativo de 3 bandas.',
'Preto Texturizado', '#000000', NULL, 6, 4800.00, 2880.00, '/uploads/fotosProdutos/amplificador-de-baixo-frente.png, /uploads/fotosProdutos/amplificador-de-baixo-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-baixo-verso.png, /uploads/fotosProdutos/amplificador-de-baixo-verso-sem-fundo.png'),

('231867', 'Amplificador de Violão (Acústico)',
'An acoustic guitar amplifier with wooden panel design, control knobs on top, natural light studio photography.',
'Painel frontal em madeira e circuito transistorado.',
'Canal duplo com entrada para microfone e violão.',
'Madeira Natural', '#B8860B', NULL, 6, 3600.00, 2160.00, '/uploads/fotosProdutos/amplificador-de-violao-frente.png, /uploads/fotosProdutos/amplificador-de-violao-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-violao-verso.png, /uploads/fotosProdutos/amplificador-de-violao-verso-sem-fundo.png'),

('512479', 'Caixa Acústica (Passiva)',
'A passive loudspeaker with black grille and metal handles, photographed in a concert setup with stage lights.',
'Gabinete em MDF com grade metálica e alças laterais.',
'Suporta até 300W RMS de potência.',
'Preto Texturizado', '#1E1E1E', NULL, 6, 2100.00, 1260.00, '/uploads/fotosProdutos/caixa-acustica-passiva-frente.png, /uploads/fotosProdutos/caixa-acustica-passiva-frente-sem-fundo.png, /uploads/fotosProdutos/caixa-acustica-passiva-verso.png, /uploads/fotosProdutos/caixa-acustica-passiva-verso-sem-fundo.png'),

('784632', 'Mesa de Som (Digital)',
'A digital audio mixing console with touchscreen and illuminated faders, placed in a modern studio under dim light.',
'Corpo em alumínio escovado e superfície sensível ao toque.',
'32 canais digitais com efeitos integrados.',
'Prata Industrial', '#D3D3D3', NULL, 6, 12500.00, 7500.00, '/uploads/fotosProdutos/mesa-de-som-digital-frente.png, /uploads/fotosProdutos/mesa-de-som-digital-frente-sem-fundo.png, /uploads/fotosProdutos/mesa-de-som-digital-verso.png, /uploads/fotosProdutos/mesa-de-som-digital-verso-sem-fundo.png'),

('345971', 'Microfone Dinâmico (Shure SM58 Style)',
'A dynamic vocal microphone with metal grille and black body, close-up studio shot, isolated on dark background.',
'Corpo em alumínio e cápsula dinâmica cardioide.',
'Ideal para vocais ao vivo e apresentações.',
'Preto e Prata', '#2E2E2E', NULL, 6, 780.00, 468.00, '/uploads/fotosProdutos/microfone-dinamico-frente.png, /uploads/fotosProdutos/microfone-dinamico-frente-sem-fundo.png, /uploads/fotosProdutos/microfone-dinamico-verso.png, /uploads/fotosProdutos/microfone-dinamico-verso-sem-fundo.png'),

('679124', 'Microfone Condensador (Estúdio)',
'A large diaphragm condenser microphone mounted on a shock mount with pop filter, in a professional recording booth.',
'Corpo metálico prateado com suporte anti-vibração.',
'Resposta de frequência de 20Hz a 20kHz.',
'Prateado', '#DCDCDC', NULL, 6, 2100.00, 1260.00, '/uploads/fotosProdutos/microfone-estudio-frente.png, /uploads/fotosProdutos/microfone-estudio-frente-sem-fundo.png, /uploads/fotosProdutos/microfone-estudio-verso.png, /uploads/fotosProdutos/microfone-estudio-verso-sem-fundo.png'),

('912570', 'Monitor de Áudio (De Referência)',
'A studio reference monitor speaker with black matte finish, yellow cone, placed on a mixing desk with computer screens.',
'Gabinete de MDF, tweeter de seda e woofer Kevlar 5”.',
'Sonorização flat ideal para mixagem.',
'Preto com Amarelo', '#222222', NULL, 6, 3800.00, 2280.00, '/uploads/fotosProdutos/monitor-audio-referencia-frente.png, /uploads/fotosProdutos/monitor-audio-referencia-frente-sem-fundo.png, /uploads/fotosProdutos/monitor-audio-referencia-verso.png, /uploads/fotosProdutos/monitor-audio-referencia-verso-sem-fundo.png'),

('159804', 'Monitor de Áudio (De Palco)',
'A wedge-shaped stage monitor speaker on the floor, photographed in a live concert setting with stage lights and cables.',
'Gabinete inclinado com revestimento antiderrapante.',
'Potência de 250W RMS, excelente retorno de palco.',
'Preto Fosco', '#1C1C1C', NULL, 6, 2950.00, 1770.00, '/uploads/fotosProdutos/monitor-audio-palco-frente.png, /uploads/fotosProdutos/monitor-audio-palco-frente-sem-fundo.png, /uploads/fotosProdutos/monitor-audio-palco-verso.png, /uploads/fotosProdutos/monitor-audio-palco-verso-sem-fundo.png'),

('604823', 'Interface de Áudio (4+ Canais)',
'A professional multi-channel audio interface with multiple inputs and outputs, metal rackmount design, illuminated by cool studio light.',
'Carcaça metálica com conexões balanceadas XLR e TRS.',
'Compatível com Windows, macOS e Linux.',
'Prateado', '#C0C0C0', NULL, 6, 4100.00, 2460.00, '/uploads/fotosProdutos/interface-audio-frente.png, /uploads/fotosProdutos/interface-audio-frente-sem-fundo.png, /uploads/fotosProdutos/interface-audio-verso.png, /uploads/fotosProdutos/interface-audio-verso-sem-verso.png'),

('837295', 'Fones (Over-ear de Estúdio)',
'Closed-back over-ear studio headphones with coiled cable, photographed on a mixing desk in soft lighting.',
'Almofadas em couro sintético e drivers de 40mm.',
'Design confortável para longas sessões.',
'Preto Fosco', '#111111', NULL, 6, 890.00, 534.00, '/uploads/fotosProdutos/headset-frente.png, /uploads/fotosProdutos/headset-frente-sem-fundo.png, /uploads/fotosProdutos/headset-verso.png, /uploads/fotosProdutos/headset-verso-sem-fundo.png'),

('498731', 'Fones (In-ear de Palco)',
'Professional in-ear monitor earphones with transparent housing and cable, photographed on a stage background with subtle light reflections.',
'Carcaça transparente e cabos removíveis.',
'Resposta precisa, ideal para músicos ao vivo.',
'Transparente', '#EAEAEA', NULL, 6, 1250.00, 750.00, '/uploads/fotosProdutos/fone-ouvido-frente.png, /uploads/fotosProdutos/fone-ouvido-frente-sem-fundo.png, /uploads/fotosProdutos/fone-ouvido-verso.png, /uploads/fotosProdutos/fone-ouvido-verso-sem-fundo.png');

-- =====================================================
-- PRODUTOS - CATEGORIA ACESSÓRIOS / PERIFÉRICOS (id_categoria = 7)
-- =====================================================

INSERT INTO produtos (
  sku, nome, descricao, materiais, detalhes,
  nome_cor, cor, desconto, id_categoria, valor, custo_producao, imagem
) VALUES
-- Cordas Avulsas
('184523', 'Cordas Avulsas (Violão Aço / Nylon)',
'A set of acoustic guitar strings, steel and nylon, neatly packaged with brand label visible, photographed on a wooden table.',
'Aço niquelado e nylon cristal.',
'Pacote com 6 cordas, som brilhante e durável.',
'Prateado e Transparente', '#E0E0E0', NULL, 7, 75.00, 45.00, '/uploads/fotosProdutos/corda-violao-frente.png, /uploads/fotosProdutos/corda-violao-frente-sem-fundo'),

('537916', 'Cordas Avulsas (Guitarra)',
'Electric guitar string set with colorful ball ends, metallic shine under studio lighting, placed beside a guitar headstock.',
'Aço inoxidável niquelado.',
'Calibre 0.10 – som equilibrado e boa resistência.',
'Metálico', '#B0B0B0', NULL, 7, 80.00, 48.00, '/uploads/fotosProdutos/corda-guitarra-frente.png, /uploads/fotosProdutos/corda-guitarra-frente-sem-fundo.png'),

('972184', 'Cordas Avulsas (Baixo 4c / 5c)',
'Bass guitar string set with thick nickel wound coils, photographed close-up on a dark textured background.',
'Aço niquelado com núcleo hexagonal.',
'Som grave potente e sustain longo.',
'Prateado', '#C0C0C0', NULL, 7, 120.00, 72.00, '/uploads/fotosProdutos/corda-baixo-frente.png, /uploads/fotosProdutos/corda-baixo-frente-sem-fundo.png'),

('405768', 'Cordas Avulsas (Violino)',
'Violin string set in elegant packaging, photographed on a wooden violin body in soft natural light.',
'Aço cromado com alma sintética.',
'Timbre doce e projeção refinada.',
'Prateado', '#CCCCCC', NULL, 7, 130.00, 78.00, '/uploads/fotosProdutos/corda-violino-frente.png, /uploads/fotosProdutos/corda-violino-frente-sem-fundo.png'),

-- Palhetas
('619845', 'Palheta (Nylon)',
'A close-up of nylon guitar picks in different colors and thicknesses, scattered on a wooden table under soft light.',
'Nylon flexível e durável.',
'Pacote com 10 unidades de diferentes espessuras.',
'Sortido', '#AAAAAA', NULL, 7, 25.00, 15.00, '/uploads/fotosProdutos/palheta-nylon.png, /uploads/fotosProdutos/palheta-nylon-sem-fundo.png'),

('826493', 'Palheta (Tortex)',
'Colorful tortex guitar picks with matte texture, arranged in a fan pattern on a clean white background.',
'Tortex antiderrapante.',
'Pacote com 10 unidades de timbre equilibrado e pegada firme.',
'Sortido', '#D3D3D3', NULL, 7, 30.00, 18.00, '/uploads/fotosProdutos/palheta-tortex.png, /uploads/fotosProdutos/palheta-tortex-sem-fundo.png'),

('540128', 'Palheta (Jazz)',
'Small jazz guitar picks with pointed tips, black and red colors, photographed close-up on an amplifier surface.',
'Nylon rígido com ponta afiada.',
'Pacote com 10 unidades de design pequeno para precisão máxima.',
'Preto e Vermelho', '#8B0000', NULL, 7, 35.00, 21.00, '/uploads/fotosProdutos/palheta-jazz.png, /uploads/fotosProdutos/palheta-jazz-sem-fundo.png'),

-- Capotraste
('763910', 'Capotraste (Violão e Guitarra)',
'A sleek aluminum guitar capo clipped onto an acoustic guitar neck, photographed with natural lighting.',
'Alumínio anodizado com mola reforçada.',
'Ajuste rápido e fixação firme.',
'Prata Escovado', '#C0C0C0', NULL, 7, 90.00, 54.00, '/uploads/fotosProdutos/capotraste.png, /uploads/fotosProdutos/capotraste-sem-fundo.png'),

-- Estantes
('231640', 'Estante (De Partitura)',
'A foldable black music stand holding sheet music, photographed in a rehearsal room with soft lighting.',
'Aço leve dobrável com trava de altura.',
'Altura ajustável e base reforçada.',
'Preto Fosco', '#222222', NULL, 7, 250.00, 150.00, '/uploads/fotosProdutos/estande-partitura-frente.png, /uploads/fotosProdutos/estande-partitura-frente-sem-fundo.png, /uploads/fotosProdutos/estande-partitura-verso.png, /uploads/fotosProdutos/estande-partitura-verso-sem-fundo.png'),

('658319', 'Estante (Para Teclado)',
'A double-X keyboard stand supporting an electronic keyboard, photographed on a stage background.',
'Aço tubular com ajuste rápido.',
'Compatível com teclados de até 88 teclas.',
'Preto Brilhante', '#000000', NULL, 7, 310.00, 186.00, '/uploads/fotosProdutos/estande-teclado-frente.png, /uploads/fotosProdutos/estande-teclado-frente-sem-fundo.png, /uploads/fotosProdutos/estande-teclado-verso.png, /uploads/fotosProdutos/estande-teclado-verso-sem-fundo.png'),

-- Pedais de Efeito
('874590', 'Pedal de Efeito (Distortion / Overdrive)',
'Guitar distortion pedal with metal casing and control knobs, glowing LED light, placed on a pedalboard.',
'Carcaça metálica com potenciômetros duplos.',
'Som encorpado e quente, estilo vintage.',
'Laranja Metálico', '#FF8C00', NULL, 7, 520.00, 312.00, '/uploads/fotosProdutos/pedal-distortion.png, /uploads/fotosProdutos/pedal-distorcion-sem-fundo.png'),

('982410', 'Pedal de Efeito (Chorus / Delay)',
'Chorus and delay guitar pedals with colorful designs and multiple control knobs, photographed in studio lighting.',
'Metal anodizado com circuito analógico.',
'Efeitos clássicos para ambiência e modulação.',
'Azul Claro', '#87CEEB', NULL, 7, 580.00, 348.00, '/uploads/fotosProdutos/pedal-chorus-delay.png, /uploads/fotosProdutos/pedal-chorus-delay-sem-fundo.png'),

('490175', 'Pedal de Efeito (Looper)',
'Compact looper pedal with record and play buttons, photographed on a pedalboard setup.',
'Metal com botão de acionamento reforçado.',
'Grava e reproduz loops em tempo real.',
'Vermelho', '#B22222', NULL, 7, 640.00, 384.00, '/uploads/fotosProdutos/pedal-looper.png, /uploads/fotosProdutos/pedal-looper-sem-fundo.png'),

-- Cabos
('304987', 'Cabo P10 (Instrumento)',
'Instrument cable with 1/4 inch (P10) jacks, coiled neatly beside an amplifier, photographed with soft shadows.',
'Fios de cobre com blindagem dupla e conectores niquelados.',
'Comprimento de 5 metros, baixa interferência.',
'Preto', '#1C1C1C', NULL, 7, 90.00, 54.00, '/uploads/fotosProdutos/cabo-p10.png, /uploads/fotosProdutos/cabo-p10-sem-fundo.png'),

('790246', 'Cabo XLR (Microfone)',
'Professional XLR microphone cable with metal connectors, coiled on a studio desk next to a condenser microphone.',
'Condutor em cobre livre de oxigênio.',
'Comprimento de 3 metros, ideal para estúdios.',
'Preto', '#000000', NULL, 7, 110.00, 66.00, '/uploads/fotosProdutos/cabo-xlr.png, /uploads/fotosProdutos/cabo-xlr-sem-fundo.png'),

-- Suportes
('628354', 'Suporte (Para Guitarra/Violão)',
'A-frame guitar stand holding an acoustic guitar, photographed in a cozy music studio setting.',
'Aço dobrável com proteção em borracha.',
'Estável e compacto para transporte.',
'Preto', '#1E1E1E', NULL, 7, 210.00, 126.00, '/uploads/fotosProdutos/suporte-guitarra.png, /uploads/fotosProdutos/suporte-guitarra-sem-fundo.png'),

('562893', 'Suporte (Para Microfone)',
'Adjustable microphone stand with boom arm, holding a studio microphone, illuminated by soft lighting.',
'Aço leve com base redonda e braço telescópico.',
'Ajustável em altura e ângulo.',
'Preto', '#000000', NULL, 7, 260.00, 156.00, '/uploads/fotosProdutos/suporte-microfone.png, /uploads/fotosProdutos/suporte-microfone-sem-fundo.png'),

-- Cases e Bags
('981430', 'Case Rígido (Instrumento)',
'Hard guitar case made of black leather with metal latches, opened slightly showing plush red interior.',
'MDF revestido em couro sintético e interior aveludado.',
'Proteção premium para instrumentos de corda.',
'Preto com Vermelho', '#111111', NULL, 7, 720.00, 432.00, '/uploads/fotosProdutos/case-guitarra.png, /uploads/fotosProdutos/case-guitarra-sem-fundo.png, /uploads/fotosProdutos/case-guitarra-fechada.png, /uploads/fotosProdutos/case-guitarra-fechada-sem-fundo.png'),

('435219', 'Bag Soft (Instrumento)',
'Soft padded gig bag for acoustic guitar with shoulder straps, standing upright on a white background.',
'Tecido impermeável com alças acolchoadas.',
'Bolso frontal e reforço traseiro.',
'Preto', '#000000', NULL, 7, 350.00, 210.00, '/uploads/fotosProdutos/case-tecido.png, /uploads/fotosProdutos/case-tecido-sem-fundo.png, /uploads/fotosProdutos/case-tecido-verso.png, /uploads/fotosProdutos/case-tecido-verso-sem-fundo.png'),

-- Afinadores Eletrônicos
('720158', 'Afinador Eletrônico (Clip)',
'Clip-on guitar tuner attached to the headstock, with illuminated display showing tuning note.',
'Corpo em ABS e visor LCD colorido.',
'Rotação 360° e alta precisão de leitura.',
'Preto', '#1A1A1A', NULL, 7, 150.00, 90.00, '/uploads/fotosProdutos/afinador-clipe.png, /uploads/fotosProdutos/afinador-clipe-sem-fundo.png, /uploads/fotosProdutos/afinador-clipe-verso.png, /uploads/fotosProdutos/afinador-clipe-verso-sem-fundo.png'),

('298504', 'Afinador Eletrônico (Pedal)',
'Pedal tuner with LED display, placed on a pedalboard among other effects pedals, photographed under stage light.',
'Metal resistente com visor de LED brilhante.',
'Bypass silencioso, ideal para shows.',
'Prata e Azul', '#C0C0C0', NULL, 7, 430.00, 258.00, '/uploads/fotosProdutos/afinador-pedal.png, /uploads/fotosProdutos/afinador-pedal-sem-fundo.png'),

-- Baquetas
('854763', 'Baquetas (Madeira - Maple/Hickory)',
'Pair of wooden drumsticks made from maple and hickory, lying on a snare drum surface in a drum kit setup.',
'Madeira tratada de alta densidade.',
'Equilíbrio e resposta natural.',
'Mogno Claro', '#CD853F', NULL, 7, 70.00, 42.00, '/uploads/fotosProdutos/baqueta-madeira.png, /uploads/fotosProdutos/baqueta-madeira-sem-fundo.png'),

('187642', 'Baquetas (Nylon Tip)',
'Drumsticks with nylon tips resting on cymbals, photographed close-up with warm stage lighting.',
'Corpo em hickory e ponta em nylon resistente.',
'Ideal para performances ao vivo e gravações.',
'Natural e Branco', '#EEE8AA', NULL, 7, 85.00, 51.00, '/uploads/fotosProdutos/baqueta-nylon.png, /uploads/fotosProdutos/baqueta-nylon-sem-fundo.png');