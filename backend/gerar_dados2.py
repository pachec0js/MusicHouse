import mysql.connector
from faker import Faker
import random
from datetime import datetime, timedelta

# --- CONFIGURAÇÃO DO BANCO ---
db_config = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': '',  # Coloque sua senha se tiver
    'database': 'musicHouse'
}

fake = Faker('pt_BR')

print("🔌 Conectando ao banco de dados...")
try:
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    print("✅ Conectado com sucesso!")
except Exception as e:
    print(f"❌ Erro ao conectar: {e}")
    exit()

# --- ETAPA 1: PREPARAR EQUIPE (RH) ---
print("\n👷 Verificando e contratando funcionários...")

def garantir_caixas(id_franquia, qtd_necessaria):
    cursor.execute("SELECT id_registro FROM funcionarios WHERE id_franquia = %s AND id_credencial = 3", (id_franquia,))
    caixas_existentes = [row[0] for row in cursor.fetchall()]
    
    qtd_atual = len(caixas_existentes)
    
    if qtd_atual < qtd_necessaria:
        falta = qtd_necessaria - qtd_atual
        print(f"   -> Franquia {id_franquia}: Contratando {falta} novos caixas...")
        for _ in range(falta):
            nome = fake.name()
            cpf = fake.cpf().replace('.', '').replace('-', '')
            email = fake.email()
            sql = """INSERT INTO funcionarios 
                     (nome_completo, cpf, email, telefone, id_franquia, id_credencial, senha, status) 
                     VALUES (%s, %s, %s, %s, %s, 3, '$2b$10$dummyhashsenha', 'Ativo')"""
            cursor.execute(sql, (nome, cpf, email, fake.phone_number(), id_franquia))
            caixas_existentes.append(cursor.lastrowid)
        conn.commit()
    else:
        print(f"   -> Franquia {id_franquia}: Equipe OK ({qtd_atual} caixas).")
    return caixas_existentes

caixas_f1 = garantir_caixas(1, 3) # Matriz
caixas_f2 = garantir_caixas(2, 3) # Filial SBC

# --- ETAPA 2: CARREGAR CATÁLOGO COMPLETO ---
print("\n📦 Carregando catálogo...")
catalogo_global = {}

# Produtos Principais
cursor.execute("SELECT sku, valor, custo_producao, nome FROM produtos")
for row in cursor.fetchall():
    catalogo_global[row[0]] = {'valor': row[1], 'custo': row[2], 'nome': row[3]}

# Variações (Importante para não dar erro de Key)
cursor.execute("SELECT sku, valor, custo_producao, nome_cor FROM variacoes_produto")
for row in cursor.fetchall():
    catalogo_global[row[0]] = {'valor': row[1], 'custo': row[2], 'nome': row[3]}

if not catalogo_global:
    print("❌ Erro: Nenhum produto encontrado.")
    exit()

# --- ETAPA 3: SIMULAÇÃO ATÉ HOJE ---
agora = datetime.now() # Data e Hora Exata de agora
print(f"\n🚀 Simulando histórico de 01/01/2025 até HOJE ({agora.strftime('%d/%m/%Y %H:%M')})...")

data_inicio = datetime(2025, 1, 1)
total_dias = (agora - data_inicio).days
vendas_totais = 0

lojas = [
    {'id': 1, 'equipe': caixas_f1},
    {'id': 2, 'equipe': caixas_f2}
]

for dia in range(total_dias + 1):
    data_atual = data_inicio + timedelta(days=dia)
    
    # Se a data simulada for maior que agora, para o loop
    if data_atual > agora:
        break

    if data_atual.day == 1:
        print(f"📅 Processando: {data_atual.strftime('%B %Y')}...")

    chance_abrir = 0.3 if data_atual.weekday() == 6 else 0.95

    for loja in lojas:
        if random.random() < chance_abrir:
            funcionario = random.choice(loja['equipe'])
            hora_abertura = data_atual.replace(hour=9, minute=0)
            hora_fechamento = data_atual.replace(hour=18, minute=0)
            
            # Se for hoje e ainda não abriu (ex: roda o script as 8 da manhã), pula
            if data_atual.date() == agora.date() and agora.hour < 9:
                continue

            # Criar Caixa
            sql_caixa = "INSERT INTO caixas (id_franquia, id_funcionario, status, data_abertura, data_fechamento) VALUES (%s, %s, 'fechado', %s, %s)"
            cursor.execute(sql_caixa, (loja['id'], funcionario, hora_abertura, hora_fechamento))
            id_sessao = cursor.lastrowid
            
            # Gerar Vendas
            movimento = random.randint(2, 6) if data_atual.weekday() < 5 else random.randint(5, 12)
            
            for _ in range(movimento):
                # Pega SKUs que a loja tem em estoque
                cursor.execute("SELECT sku FROM estoque WHERE id_franquia = %s AND quantidade > 0 ORDER BY RAND() LIMIT 3", (loja['id'],))
                skus = [x[0] for x in cursor.fetchall()]
                
                # Filtra SKUs válidos (trava de segurança)
                itens_validos = [s for s in skus if s in catalogo_global]
                if not itens_validos: continue

                valor_total = 0
                lucro_total = 0
                
                for sku in itens_validos:
                    p = catalogo_global[sku]
                    valor_total += float(p['valor'])
                    lucro_total += float(p['valor']) - (float(p['custo']) if p['custo'] else 0)

                # Hora da venda
                hora_venda = hora_abertura + timedelta(hours=random.randint(0, 8), minutes=random.randint(0, 59))
                
                # Se a hora sorteada da venda for no futuro (ex: agora é 15h e sorteou 17h), limita para agora
                if hora_venda > agora: 
                    hora_venda = agora

                sql_venda = "INSERT INTO venda (id_franquia, id_funcionario, id_sessao_caixa, valor_total, lucro, id_pagamento, status, data_venda) VALUES (%s, %s, %s, %s, %s, %s, 'Paga', %s)"
                cursor.execute(sql_venda, (loja['id'], funcionario, id_sessao, valor_total, lucro_total, random.randint(1,3), hora_venda))
                id_venda = cursor.lastrowid
                
                # Itens e Estoque
                for sku in itens_validos:
                    p = catalogo_global[sku]
                    preco = float(p['valor'])
                    custo = float(p['custo']) if p['custo'] else 0
                    
                    cursor.execute("INSERT INTO item_venda (id_venda, sku_produto, quantidade, preco_unitario, lucro, valor_total) VALUES (%s, %s, 1, %s, %s, %s)", 
                                   (id_venda, sku, preco, (preco-custo), preco))
                    
                    # Movimentação e Baixa
                    cursor.execute("SELECT id_estoque, quantidade FROM estoque WHERE id_franquia = %s AND sku = %s", (loja['id'], sku))
                    est = cursor.fetchone()
                    if est:
                        cursor.execute("INSERT INTO movimentacoes_estoque (id_estoque, id_franquia, id_funcionario, tipo_movimentacao, quantidade_anterior, quantidade_movimentada, quantidade_atual, data_movimentacao) VALUES (%s, %s, %s, 'saida', %s, 1, %s, %s)",
                                       (est[0], loja['id'], funcionario, est[1], est[1]-1, hora_venda))
                        cursor.execute("UPDATE estoque SET quantidade = quantidade - 1 WHERE id_estoque = %s", (est[0],))
                
                vendas_totais += 1
    conn.commit()

cursor.close()
conn.close()

print(f"\n✨ PRONTO! Simulamos vendas até o momento exato: {agora}")
print(f"💰 Vendas geradas: {vendas_totais}")