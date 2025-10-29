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
) VALUES (
    '04567-123',
    'Av. Paulista, 1000 - Bela Vista',
    'São Paulo',
    'contato@vidaplena-sp.com',
    '(11) 99999-8888',
    'Ativo'
);

CREATE TABLE credenciais (
    id_credenciais INT AUTO_INCREMENT PRIMARY KEY,
    cargo VARCHAR(150) NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

INSERT INTO credenciais (cargo, descricao, salario) VALUES
('Administrador', 'Usuário da Matriz com acesso total e controle de todas as filiais.', 12000.00),
('Gerente de Loja', 'Usuário responsável por gerenciar uma filial específica.', 6000.00),
('Caixa', 'Usuário do PDV responsável por realizar vendas e registrar pagamentos.', 2500.00);

CREATE TABLE funcionarios (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(300) NOT NULL,
    cpf CHAR(11) NOT NULL,
    rg VARCHAR(20),
    data_nascimento DATE,
    sexo ENUM('Masculino','Feminino','Outro') DEFAULT 'Outro',
    estado_civil ENUM('Solteiro','Casado','Divorciado','Viúvo','Outro') DEFAULT 'Solteiro',
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    id_franquia INT NOT NULL,
    id_credencial INT NOT NULL,
    fotoFuncionario TEXT NOT NULL,
    senha TEXT NOT NULL,
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
    desconto DECIMAL(10,2),
    id_pagamento INT NOT NULL,
    status ENUM('Aberta', 'Paga', 'Cancelada') NOT NULL DEFAULT 'Aberta',
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
    icone TEXT NOT NULL
);

INSERT INTO categorias (nome, descricao, icone) VALUES 
('Cordas', 'Toque que emociona.', 'iconCordas.png'),
('Percussão', 'Ritmo que pulsa.', 'iconPercussao.png'),
('Teclas', 'Na pontas dos dedos.', 'iconTeclas.png'),
('Sopro', 'Som que vem do fôlego.', 'iconSopro.png'),
('Áudio', 'Clareza em cada nota.', 'iconAudio.png'),
('Acessórios', 'O apoio do seu som.', 'iconAcessorio.png');

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    materiais VARCHAR(300) NOT NULL,
    detalhes VARCHAR(300) NOT NULL,
    cor VARCHAR(70) NOT NULL,
    desconto VARCHAR(50) NULL,
    id_categoria INT NOT NULL,
    valor DECIMAL (10,2) NOT NULL,
    custo_producao DECIMAL(10,2),
    imagem TEXT NOT NULL,
    CONSTRAINT fk_prod_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_franquia INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    minimo INT NOT NULL DEFAULT 0,
    UNIQUE KEY uq_estoque (id_franquia, id_produto),
    CONSTRAINT fk_est_franquia FOREIGN KEY (id_franquia) REFERENCES franquias(id_franquia),
    CONSTRAINT fk_est_prod FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
) ;

CREATE TABLE variacoes_produto (
    id_variacao INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    nome_variacao VARCHAR(150) NOT NULL,
    cor TEXT,
    estoque INT DEFAULT 0,
    imagem TEXT,
    status ENUM('Ativo', 'Inativo') DEFAULT 'Ativo',
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_var_prod FOREIGN KEY (id_produto) 
        REFERENCES produtos(id_produto)
        ON DELETE CASCADE
);

CREATE TABLE item_venda (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_utilitario DECIMAL(10, 2),
    valor_total DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_item_venda FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    CONSTRAINT fk_item_prod FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,       
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

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
) ;

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

CREATE TABLE recebimentos_venda (
    id_recebimento INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_pagamento INT NOT NULL,                 
    valor DECIMAL(10,2) NOT NULL,
    parcelas INT DEFAULT 1,
    autorizacao VARCHAR(100),
    status ENUM('pendente','confirmado','falhou','estornado') DEFAULT 'pendente',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_rec_venda FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    CONSTRAINT fk_rec_forma FOREIGN KEY (id_pagamento) REFERENCES formasPagamentos(id_pagamento)
);

CREATE INDEX idx_func_franquia ON funcionarios(id_franquia);
CREATE INDEX idx_caixas_franquia ON caixas(id_franquia);
CREATE INDEX idx_caixas_func ON caixas(id_funcionario);
CREATE INDEX idx_venda_datas ON venda(data_venda);
CREATE INDEX idx_venda_franquia ON venda(id_franquia);
CREATE INDEX idx_venda_sessao ON venda(id_sessao_caixa);
CREATE INDEX idx_item_venda_venda ON item_venda(id_venda);
CREATE INDEX idx_item_venda_prod ON item_venda(id_produto);
CREATE INDEX idx_prod_categoria ON produtos(id_categoria);
CREATE INDEX idx_pf_prod ON produtos_fornecedores(id_produto);
CREATE INDEX idx_pf_forn ON produtos_fornecedores(id_fornecedor);
CREATE INDEX idx_estoque_franquia_prod ON estoque(id_franquia, id_produto);
CREATE INDEX idx_clientes_email ON clientes(email);
CREATE INDEX idx_end_cliente ON enderecos_cliente(id_cliente);
CREATE INDEX idx_rec_venda ON recebimentos_venda(id_venda);