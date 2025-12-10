import mysql.connector
from faker import Faker
import random
from datetime import datetime, timedelta


db_config = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': '',
    'database': 'musicHouse'
}

fake = Faker('pt_BR')

try:
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    print("Conectado ao banco de dados com sucesso!")
except Exception as e:
    print(f"Erro ao conectar: {e}")
    exit()



def criar_franquias_novas():
    print("🏢 Criando novas franquias...")
    cidades = [
        ('20000-000', 'Rua das Flores, 123', 'Rio de Janeiro - RJ', 'rj@musichouse.com', '2199999999'),
        ('80000-000', 'Av. Batel, 500', 'Curitiba - PR', 'pr@musichouse.com', '4199999999'),
        ('40000-000', 'Rua da Bahia, 100', 'Salvador - BA', 'ba@musichouse.com', '7199999999')
    ]
    ids_franquias = []
    
    for cep, end, cid, email, tel in cidades:
        sql = "INSERT INTO franquias (codigo_postal, endereco_completo, cidade, email_contato, telefone_contato) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(sql, (cep, end, cid, email, tel))
        ids_franquias.append(cursor.lastrowid)
    
    conn.commit()
    return ids_franquias

def contratar_funcionarios(id_franquia):
    cargos = [2, 4, 3, 3] 
    ids_funcs = []
    
    for cargo in cargos:
        nome = fake.name()
        cpf = fake.cpf().replace('.', '').replace('-', '')
        email = fake.email()
        senha_hash = "$2b$10$ExemploDeHashDeSenhaSegura..." 
        
        sql = """INSERT INTO funcionarios 
                 (nome_completo, cpf, email, telefone, id_franquia, id_credencial, senha) 
                 VALUES (%s, %s, %s, %s, %s, %s, %s)"""
        val = (nome, cpf, email, fake.phone_number(), id_franquia, cargo, senha_hash)
        cursor.execute(sql, val)
        ids_funcs.append(cursor.lastrowid)
    
    conn.commit()
    return ids_funcs

def encher_estoque(id_franquia, produtos_base):
    for prod in produtos_base: 
        qtd = random.randint(10, 50)
        sku = prod[1]
        sql = "INSERT INTO estoque (id_franquia, sku, quantidade, aviso) VALUES (%s, %s, %s, %s)"
        cursor.execute(sql, (id_franquia, sku, qtd, 5))
    conn.commit()


novas_franquias = criar_franquias_novas()


cursor.execute("SELECT id_produto, sku, valor, custo_producao FROM produtos")
todos_produtos = cursor.fetchall()

if not todos_produtos:
    print("Erro: Não há produtos cadastrados.")
    exit()


funcionarios_caixa = [] 

for id_franq in novas_franquias:
    print(f"Abastecendo Franquia ID {id_franq}...")
    funcs = contratar_funcionarios(id_franq)
    encher_estoque(id_franq, todos_produtos)
    
    for f_id in funcs:
        cursor.execute("SELECT id_credencial FROM funcionarios WHERE id_registro = %s", (f_id,))
        cred = cursor.fetchone()[0]
        if cred == 3:
            funcionarios_caixa.append({'id': f_id, 'franquia': id_franq})


agora = datetime.now() 
print(f"Simulando histórico de 01/01/2025 até HOJE ({agora})...")

data_inicio = datetime(2025, 1, 1)
delta_dias = (agora - data_inicio).days 

total_vendas_geradas = 0

for i in range(delta_dias + 1):
    dia_atual = data_inicio + timedelta(days=i)
    
  
    if dia_atual > agora:
        break

    if random.random() < 0.4: 
        caixa_da_vez = random.choice(funcionarios_caixa)
        
      
        hora_abertura = dia_atual.replace(hour=9, minute=0, second=0)
        fechamento = dia_atual.replace(hour=18, minute=0, second=0)

   
        if dia_atual.date() == agora.date() and agora.hour < 9:
            continue

        sql_caixa = "INSERT INTO caixas (id_franquia, id_funcionario, status, data_abertura, data_fechamento) VALUES (%s, %s, 'fechado', %s, %s)"
        cursor.execute(sql_caixa, (caixa_da_vez['franquia'], caixa_da_vez['id'], hora_abertura, fechamento))
        id_sessao = cursor.lastrowid
        
 
        num_vendas = random.randint(1, 5)
        
        for _ in range(num_vendas):
           
            hora_venda = hora_abertura + timedelta(hours=random.randint(0, 8), minutes=random.randint(0, 59))
            
       
            if hora_venda > agora:
                hora_venda = agora

            itens_compra = random.sample(todos_produtos, k=random.randint(1, 3))
            
            valor_total_venda = 0
            lucro_total_venda = 0
            
            for prod in itens_compra:
                qtd_item = 1
                preco = float(prod[2])
                custo = float(prod[3]) if prod[3] else 0
                valor_total_venda += (preco * qtd_item)
                lucro_total_venda += ((preco - custo) * qtd_item)
            
            sql_venda = """INSERT INTO venda (id_franquia, id_funcionario, id_sessao_caixa, valor_total, lucro, id_pagamento, status, data_venda) 
                           VALUES (%s, %s, %s, %s, %s, %s, 'Paga', %s)"""
            pagamento = random.choice([1, 2, 3]) 
            cursor.execute(sql_venda, (caixa_da_vez['franquia'], caixa_da_vez['id'], id_sessao, valor_total_venda, lucro_total_venda, pagamento, hora_venda))
            id_venda = cursor.lastrowid
            
            for prod in itens_compra:
                sku = prod[1]
                preco = float(prod[2])
                custo = float(prod[3]) if prod[3] else 0
                lucro_item = (preco - custo)
                
                sql_item = """INSERT INTO item_venda (id_venda, sku_produto, quantidade, preco_unitario, lucro, valor_total)
                              VALUES (%s, %s, 1, %s, %s, %s)"""
                cursor.execute(sql_item, (id_venda, sku, preco, lucro_item, preco))
                
         
                sql_mov = """INSERT INTO movimentacoes_estoque (id_estoque, id_franquia, id_funcionario, tipo_movimentacao, quantidade_anterior, quantidade_movimentada, quantidade_atual, data_movimentacao)
                             VALUES ((SELECT id_estoque FROM estoque WHERE sku = %s AND id_franquia = %s LIMIT 1), %s, %s, 'saida', 10, 1, 9, %s)"""
                try:
                    cursor.execute(sql_mov, (sku, caixa_da_vez['franquia'], caixa_da_vez['id'], caixa_da_vez['id'], hora_venda))
                except:
                    pass
            
            total_vendas_geradas += 1

    conn.commit()

print(f"Pronto! Simulação até {agora}.")
print(f"Total de vendas criadas: {total_vendas_geradas}")

cursor.close()
conn.close()