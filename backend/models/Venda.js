import { create, read, readAll, update, executeRawQuery } from '../config/database.js';

const criarVenda = async (vendaData) => {
  try {
    return await create('venda', vendaData);
  } catch (error) {
    console.error('Erro ao criar venda:', error);
    throw error;
  }
};

const criarItemVenda = async (itemVendaData) => {
  try {
    return await create('item_venda', itemVendaData);
  } catch (error) {
    console.error('Erro ao criar item da venda:', error);
    throw error;
  }
};

const addLucroVenda = async (id_venda, lucroVenda) => {
  try {
    return await update('venda', lucroVenda, `id_venda = ${id_venda}`);
  } catch (error) {
    console.error('Erro ao atualizar lucro da venda:', error);
    throw error;
  }
};

const listarVendas = async (id_franquia) => {
  try {
    return await readAll('venda', `id_franquia = ${id_franquia} ORDER BY data_venda DESC`)
  } catch (error) {
    console.error('Erro ao listar todas as vendas', error);
    throw error;
  }
}



const listarVendasGeral = async () => {
  try {
    const sql = `
      SELECT *
      FROM venda
      ORDER BY data_venda DESC
    `;

    return await executeRawQuery(sql);
    
  } catch (error) {
    console.error('Erro ao listar todas as vendas:', error);
    throw error;
  }
};




const obterItemVenda = async (id_venda) => {
  try {
    return await readAll('item_venda', `id_venda = ${id_venda}`)

  } catch (error) {
    console.error('Erro ao obter item_vendas a partir do id_venda:', error);
    throw error;
  }
}

const obterPagamentosPorId = async (id_pagamento) =>{
  try{
   return await readAll('formasPagamentos', `id_pagamento = ${id_pagamento}`)

  }catch(error){
     console.error('Erro ao obter pagamento por id:', error);
    throw error;
  }
}





export { criarVenda, criarItemVenda, addLucroVenda, listarVendas, obterItemVenda, obterPagamentosPorId, listarVendasGeral};
