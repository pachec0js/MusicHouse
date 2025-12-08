import { readAll, executeRawQuery } from "../config/database.js";


const franquiasAtivas = async () => {
    try {
        return await readAll("franquias", `status = 'Ativo'`)
    } catch (err) {
        console.error('Erro ao listar franquias ativas: ', err);
        throw (err)
    }
}

const faturamentoGlobal = async () => {
    try {
        const sql = `
            SELECT 
                COALESCE(SUM(valor_total), 0) AS faturamento
            FROM venda
            WHERE status = 'Paga'
              AND MONTH(data_venda) = MONTH(CURRENT_DATE())
              AND YEAR(data_venda) = YEAR(CURRENT_DATE())
        `;

        const result = await executeRawQuery(sql);
        return result[0].faturamento;
    } catch (err) {
        console.error('Erro ao somar faturamento do mês atual', err);
        throw err;
    }
}

const listarTodosFuncionariosGlobal = async () => {
    try {
        return readAll('funcionarios', `status = 'Ativo'`)
    } catch (err) {
        console.error('erro ao listar todos os funcionários')
        throw err
    }
}

const listarContasPagar = async () => {
    try {
        return readAll('despesas', `status != 'Paga'`)
    } catch (err) {
        console.error('erro ao listar Contas a Pagar')
        throw err
    }
}

const listarLucroPorFilial = async (id) => {
    try {
        return readAll('venda', `id_franquia = ${id}`)
    } catch (err) {
        console.error('erro ao listar Contas a Pagar')
        throw err
    }
}

const listarPedidosEstoque = async () => {
    try {
        return readAll('pedidos_filiais', `status = 'Pendente'`)
    } catch (err) {
        console.error('erro ao listar Pedidos Estoque')
        throw err
    }
}

const listarEstoqueMatriz = async () => {
    try {
        return readAll('estoque', `id_franquia = ${1}`)
    } catch (err) {
        console.error('erro ao listar Estoque Matriz')
        throw err
    }
}

const listarFiliaisAtivas = async () => {
    try {
        return readAll('franquias', `status = 'Ativo'`)
    } catch (err) {
        console.error('erro ao listar franquias ativas')
        throw err
    }
}

const listarVendas = async () => {
    try {
        return readAll('venda')
    } catch (err) {
        console.error('erro ao listar vendas')
        throw err
    }
}

const listarItemVendasPorSku = async ({ skuProd, skuVariacao }) => {
    try {
        return readAll('item_venda', skuProd ? `sku_produto = '${skuProd}'` : `sku_variacao = '${skuVariacao}'`)
    } catch (err) {
        console.error('erro ao item venda por sku')
        throw err
    }
}

const descobrirTipoSku = async (sku) => {
    const prod = await readAll('item_venda', `sku_produto = '${sku}'`);
    if (prod.length > 0) return "produto";
    const vari = await readAll('item_venda', `sku_variacao = '${sku}'`);
    if (vari.length > 0) return "variacao";
    return "404";
};

export {
    franquiasAtivas, faturamentoGlobal, listarTodosFuncionariosGlobal, listarContasPagar, listarLucroPorFilial, listarPedidosEstoque,
    listarEstoqueMatriz, listarFiliaisAtivas, listarVendas, listarItemVendasPorSku, descobrirTipoSku
}