# Music House - Sistema de Gestão para Lojas (ERP/PDV)

## Descrição

Este projeto é um **Sistema de Gestão Integrado** para lojas de produtos físicos, com ênfase em **ERP** e **PDV**. O sistema foi desenvolvido como parte do TCC e visa gerenciar redes de lojas com **Matriz e Filiais**. Ele contém dois módulos principais: um **Sistema Administrativo** (Back-Office) e um **Sistema de Ponto de Venda (PDV)**, otimizados para o controle de vendas, fluxo de caixa e gestão de produtos.

### Funcionalidades

#### 1. **Sistema Administrativo (Back-Office)**
- **Cadastro de Lojas**: Gerenciamento de lojas Matriz e Filiais.
- **Cadastro de Funcionários**: Controle de dados pessoais, vínculos e perfis de acesso.
- **Cadastro de Produtos e Fornecedores**: Gerenciamento de produtos, fornecedores e preços.
- **Relatórios Financeiros**: Visão financeira das lojas e da Matriz.

#### 2. **Sistema de Ponto de Venda (PDV)**
- **Vendas Rápidas**: Interface simples para vendas no balcão.
- **Controle de Caixa**: Abertura, fechamento e registro de transações.
- **Emissão de Comprovante de Venda**: Geração de comprovantes não fiscais.
- **Métodos de Pagamento**: Suporte a Dinheiro, Cartão e Pix.

#### 3. **Gestão Financeira**
- **Fluxo de Caixa**: Gerenciamento de entradas e saídas financeiras.
- **Relatórios de Fluxo de Caixa**: Visão diária, semanal e mensal.
- **Contas a Pagar**: Lançamento manual de despesas, como aluguel, fornecedores e salários.

---

## Estrutura do Projeto

### Arquitetura
O projeto é organizado da seguinte forma:

1. **`app/`**:
   - Páginas principais, incluindo a tela inicial, página 404 e layout global.
   - **Catálogo** e **PDV**.

2. **`components/`**:
   - Componentes reutilizáveis como navegação (`nav-main.jsx`), tabelas de dados (`data-table.jsx`), interface do PDV (`Produtos`, `NavProdutos`), entre outros.

3. **`hooks/`**:
   - Contém hooks personalizados, como `use-mobile.js`.

4. **`lib/`**:
   - Funções auxiliares, como `utils.js`.

### Tecnologias Utilizadas
- **Next.js** (Framework React)
- **Tailwind CSS** (Estilização e Responsividade)
- **Shadcn UI** (Componentes de Interface)

---

## Instalação

### Requisitos
- **Node.js** (versão 16 ou superior)
- **npm** ou **yarn**

### Passos para Execução Local
1. Clone o repositório:
   ```bash
   git clone https://github.com/pachec0js/MusicHouse.git

2. Navegue até o diretório do projeto:
   ```bash
   cd MusicHouse

3. Clone o repositório:
   ```bash
   npm install
    # ou
   yarn install


4. Clone o repositório:
   ```bash
  npm run dev
    # ou
  yarn dev

5. Abra o navegador e acesse http://localhost:3000.

### Em Desenvolvimento

O projeto ainda está em desenvolvimento. As funcionalidades principais do PDV e do sistema administrativo já foram implementadas. A integração com o back-end, relatórios financeiros e a implementação de mais detalhes estão em andamento.

### Licença

Este projeto é de código aberto e distribuído sob a Licença MIT. Veja o arquivo LICENSE para mais detalhes.