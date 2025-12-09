DROP DATABASE IF EXISTS musicHouse;
CREATE DATABASE IF NOT EXISTS musicHouse;

USE musicHouse;

CREATE TABLE franquias (
    id_franquia INT AUTO_INCREMENT PRIMARY KEY,
    codigo_postal VARCHAR(20) NOT NULL,
    endereco_completo VARCHAR(250) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    email_contato VARCHAR(100) NOT NULL,
    telefone_contato VARCHAR(100) NOT NULL,
    status ENUM('Ativo', 'Inativo') NOT NULL DEFAULT 'Ativo',
    data_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO franquias (
    codigo_postal,
    endereco_completo,
    cidade,
    email_contato,
    telefone_contato,
    status
) VALUES ('01000-000'
, 'Av. Paulista, 1000 - Bela Vista',
 'São Paulo - SP', 'sp@musichouse.com.br',
 '(11) 98888-1000', 
 'Ativo');

CREATE TABLE credenciais (
    id_credenciais INT AUTO_INCREMENT PRIMARY KEY,
    cargo VARCHAR(150) NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

INSERT INTO credenciais (cargo, descricao, salario) VALUES
('Administrador Matriz', 'Usuário da Matriz com acesso total e controle de todas as filiais.', 12000.00),
('Gerente de Loja', 'Usuário responsável por gerenciar uma filial específica.', 6000.00),
('Caixa', 'Usuário do PDV responsável por realizar vendas e registrar pagamentos.', 2500.00),
('Supervisor', 'Supervisona a loja e abre o catalogo na franquia.', 2800.00);

CREATE TABLE funcionarios (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(300) NOT NULL,
    cpf CHAR(11) NOT NULL,
    rg VARCHAR(9),
    data_nascimento DATE,
    sexo ENUM('Masculino','Feminino','Outro') DEFAULT 'Outro',
    estado_civil ENUM('Solteiro','Casado','Divorciado','Viúvo','Outro') DEFAULT 'Solteiro',
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    id_franquia INT NOT NULL,
    id_credencial INT NOT NULL,
    fotoFuncionario TEXT,
    token TEXT,
	reset_token VARCHAR(100),
    reset_expires DATETIME,
    senha TEXT NOT NULL,
    primeiroLogin BOOLEAN DEFAULT true,  
    status ENUM('Ativo', 'Inativo') DEFAULT 'Ativo',
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_func_franquia FOREIGN KEY (id_franquia) REFERENCES franquias(id_franquia),
    CONSTRAINT fk_func_cred FOREIGN KEY (id_credencial) REFERENCES credenciais(id_credenciais)
);

CREATE TABLE formasPagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('pix', 'debito', 'credito') NOT NULL
);

INSERT INTO formasPagamentos (tipo) VALUES
('debito'), ('credito'), ('pix');

CREATE TABLE caixas (
    id_sessao_caixa INT AUTO_INCREMENT PRIMARY KEY,
    id_franquia INT NOT NULL,
    id_funcionario INT NOT NULL,
    status ENUM('aberto','fechado') NOT NULL DEFAULT 'aberto',
    data_abertura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_fechamento TIMESTAMP NULL,
    CONSTRAINT fk_caixa_franquia FOREIGN KEY (id_franquia) REFERENCES franquias(id_franquia),
    CONSTRAINT fk_caixa_func FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_registro)
) ;

CREATE TABLE venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_franquia INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_sessao_caixa INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    parcelamento VARCHAR(50) NULL,
    lucro DECIMAL(10,2) NULL,
    desconto DECIMAL(10,2),
    id_pagamento INT NOT NULL,
    status ENUM('Aberta', 'Paga', 'Cancelada') NOT NULL DEFAULT 'Paga',
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_venda_franquia FOREIGN KEY (id_franquia) REFERENCES franquias(id_franquia),
    CONSTRAINT fk_venda_func FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_registro),
    CONSTRAINT fk_venda_sessao FOREIGN KEY (id_sessao_caixa) REFERENCES caixas(id_sessao_caixa),
    CONSTRAINT fk_venda_pagto FOREIGN KEY (id_pagamento) REFERENCES formasPagamentos(id_pagamento)
);

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL UNIQUE,
    descricao VARCHAR(300) NOT NULL,
    icone TEXT NOT NULL,
    iconeSite TEXT NOT NULL
);

INSERT INTO categorias (nome, descricao, icone, iconeSite) VALUES 
('Cordas', 'Toque que emociona.', 'iconCordas.png', 'Guitar'),
('Percussão', 'Ritmo que pulsa.', 'iconPercussao.png', 'Drum'),
('Teclas', 'Na pontas dos dedos.', 'iconTeclas.png', 'Piano'),
('Sopro', 'Som que vem do fôlego.', 'iconSopro.png', 'AudioLines'),
('Foles', 'Som do ar em movimento.', 'iconFoles.png', 'Wind'),
('Áudio', 'Clareza em cada nota.', 'iconAudio.png', 'Speaker'),
('Acessórios', 'O apoio do seu som.', 'iconAcessorio.png', 'Plug');

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    sku VARCHAR(6) NOT NULL UNIQUE,
    nome VARCHAR(200) NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    materiais VARCHAR(300) NOT NULL,
    detalhes VARCHAR(300) NOT NULL,
    nome_cor VARCHAR(70) NOT NULL,
    cor VARCHAR(70) NOT NULL,
    desconto INT NULL,
    id_categoria INT NOT NULL,
    valor DECIMAL (10,2) NOT NULL,
    custo_producao DECIMAL(10,2),
    imagem TEXT NOT NULL,
    CONSTRAINT fk_prod_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE variacoes_produto (
    id_variacao INT AUTO_INCREMENT PRIMARY KEY,
    sku VARCHAR(6) NOT NULL UNIQUE,
    id_produto INT NOT NULL,
    nome_cor VARCHAR(150) NOT NULL,
    cor TEXT NOT NULL,
    valor DECIMAL (10,2) NOT NULL,
    custo_producao DECIMAL(10,2),
    desconto INT NULL,
    imagem TEXT,
    status ENUM('Ativo', 'Inativo') DEFAULT 'Ativo',
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_var_prod FOREIGN KEY (id_produto) 
        REFERENCES produtos(id_produto)
        ON DELETE CASCADE
);

CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_franquia INT NOT NULL,
    sku VARCHAR(6) NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    aviso INT NOT NULL DEFAULT 10,
    CONSTRAINT fk_est_franquia FOREIGN KEY (id_franquia) REFERENCES franquias(id_franquia)
);

CREATE TABLE item_venda (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    sku_produto VARCHAR(6) NULL,
    sku_variacao VARCHAR(6) NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2),
    lucro DECIMAL(10, 2),
    valor_total DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_item_venda FOREIGN KEY (id_venda) REFERENCES venda(id_venda)
);

CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cnpj VARCHAR(30) UNIQUE NOT NULL,
    objeto_fornecido TEXT NOT NULL,
    custo DECIMAL(10,2) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO fornecedores (nome, cnpj, objeto_fornecido, custo, email, endereco)
VALUE
('Madeiras Nobres Brasil', '12.345.678/0001-90', 'Madeira de mogno', 8500.00, 'contato@madeirasnobres.com', 'Rua das Árvores 120, Manaus - AM'),
('Metalúrgica SomForte', '98.765.432/0001-55', 'Ligas de latão', 4200.50, 'vendas@somforte.com', 'Av. Industrial 455, São Bernardo do Campo - SP'),
('Eletrônicos AudioChip', '54.321.987/0001-12', 'Circuitos integrados', 6700.90, 'suporte@audiochip.com', 'Rua Tecnologia 77, Campinas - SP'),
('Cordas Harmonia Ltda', '23.456.789/0001-21', 'Cordas de aço e nylon', 1900.00, 'contato@harmonia.com', 'Av. das Artes 310, Curitiba - PR'),
('Acabamentos LuthierCoat', '45.678.912/0001-43', 'Vernizes, seladoras e tintas', 2500.75, 'vendas@luthiercoat.com', 'Rua Pintores 500, Joinville - SC'),
('Estojos ProCase', '67.891.234/0001-65', 'Estojos rígidos e bags acolchoados', 3100.30, 'comercial@procase.com', 'Av. Central 980, Belo Horizonte - MG'),
('Parafusos & Ferragens São Luís', '11.222.333/0001-44', 'Parafusos', 1350.00, 'contato@ferragenssl.com', 'Rua do Metal 201, São Luís - MA'),
('Plásticos e Compostos Melodia', '77.888.999/0001-10', 'Plásticos moldáveis', 1600.40, 'suporte@melodiaplast.com', 'Av. das Indústrias 1450, Sorocaba - SP'),
('Espumas Acústicas AcustiFlex', '32.165.498/0001-77', 'Espumas e materiais internos', 980.00, 'vendas@acustiflex.com', 'Rua Acústica 222, Porto Alegre - RS'),
('Eletrônica Premium Wiring', '44.556.778/0001-88', 'Fios, cabos blindados', 750.50, 'contato@premiumwiring.com', 'Rua Energia 420, Rio de Janeiro - RJ');


CREATE TABLE produtos_fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    id_fornecedor INT NOT NULL,
    codigo_fornecedor VARCHAR(100),
    custo DECIMAL(10,2),
    ativo TINYINT(1) NOT NULL DEFAULT 1,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_prod_for (id_produto, id_fornecedor),
    CONSTRAINT fk_pf_prod FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    CONSTRAINT fk_pf_forn FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

CREATE TABLE movimentacoes_estoque (
    id_movimentacao INT AUTO_INCREMENT PRIMARY KEY,
    id_estoque INT NOT NULL,
    id_franquia INT NOT NULL,
    id_funcionario INT NOT NULL,
    tipo_movimentacao ENUM('entrada','saida') NOT NULL,
    quantidade_anterior INT NOT NULL,
    quantidade_movimentada INT NOT NULL,
    quantidade_atual INT NOT NULL,
    observacao TEXT,
    data_movimentacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_mov_estoque FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque),
    CONSTRAINT fk_mov_franquia FOREIGN KEY (id_franquia) REFERENCES franquias(id_franquia),
    CONSTRAINT fk_mov_func FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_registro)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(300) NOT NULL,
    cpf CHAR(11) UNIQUE,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(20),
    data_nascimento DATE,
    status ENUM('Ativo','Inativo') NOT NULL DEFAULT 'Ativo',
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ;

CREATE TABLE enderecos_cliente (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    apelido VARCHAR(60),
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(20),
    complemento VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(20) NOT NULL,
    principal TINYINT(1) NOT NULL DEFAULT 0,
    criada_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_end_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
) ;

CREATE TABLE cupons (
    id_cupom INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(30) NOT NULL UNIQUE,
    tipo ENUM('percentual','valor_fixo') NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    minimo_compra DECIMAL(10,2) DEFAULT 0,
    validade DATE,
    ativo TINYINT(1) NOT NULL DEFAULT 1,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ;

CREATE TABLE venda_cupom (
    id_venda INT NOT NULL,
    id_cupom INT NOT NULL,
    PRIMARY KEY (id_venda, id_cupom),
    CONSTRAINT fk_vc_venda FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    CONSTRAINT fk_vc_cupom FOREIGN KEY (id_cupom) REFERENCES cupons(id_cupom)
);
CREATE TABLE despesas (
    id_despesa INT AUTO_INCREMENT PRIMARY KEY,
    id_franquia INT NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_criacao DATE NOT NULL,
    data_pagamento DATE NOT NULL,
    status ENUM('Paga', 'Pendente', 'Atrasada') NOT NULL,
    FOREIGN KEY (id_franquia) REFERENCES franquias(id_franquia)
);

CREATE TABLE chamados (
    id_chamado INT AUTO_INCREMENT PRIMARY KEY,
    id_franquia INT NOT NULL,
    id_funcionario INT NOT NULL, 
    titulo VARCHAR(200) NOT NULL,
    descricao TEXT NOT NULL,
    categoria ENUM(
        'Sistema',
        'Financeiro',
        'Produto',
        'Estoque',
        'Venda',
        'Funcionário',
        'Outros'
    ) NOT NULL,
    prioridade ENUM('Baixa', 'Média', 'Alta', 'Crítica') NOT NULL DEFAULT 'Média',
    status ENUM('Aberto','Em andamento','Aguardando resposta','Resolvido','Cancelado')
           NOT NULL DEFAULT 'Aberto',
    data_abertura TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_chamado_franquia FOREIGN KEY (id_franquia)
        REFERENCES franquias(id_franquia),
    CONSTRAINT fk_chamado_func FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios(id_registro) 






        CREATE TABLE `pedidos_filiais` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_franquia` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_estoque` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `observacao` text NOT NULL,
  `status` enum('Pendente','Aprovado','Recusado') DEFAULT 'Pendente',
  `prioridade` enum('Alta','Média','Baixa') DEFAULT 'Média',
  `data_pedido` timestamp NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_pedido`),
  KEY `fk_franquia` (`id_franquia`),
  KEY `fk_funcionario` (`id_funcionario`),
  KEY `fk_estoque` (`id_estoque`),
  CONSTRAINT `fk_estoque` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`id_estoque`),
  CONSTRAINT `fk_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`),
  CONSTRAINT `fk_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
);