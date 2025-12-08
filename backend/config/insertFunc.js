import mysql from 'mysql2/promise';
import bcrypt from 'bcryptjs';
import dotenv from 'dotenv';

dotenv.config(); 

const runInsertFunc = async () => {
  console.log('🌱 Iniciando InsertFunc Independente...');
  console.log('Tentando conectar com usuário:', process.env.NODE_DATABASE_USER || 'root (fallback)');

  const connection = await mysql.createConnection({
    host: process.env.NODE_DATABASE_HOST || 'localhost',
    user: process.env.NODE_DATABASE_USER || 'root',
    password: process.env.NODE_DATABASE_PASSWORD || '', 
    database: process.env.NODE_DATABASE_NAME || 'musicHouse'
  });

  try {
    const senhaHash = await bcrypt.hash('okok', 10);

    await connection.execute("DELETE FROM funcionarios WHERE id_registro IN (23, 24, 26, 27);");
    console.log('🧹 Usuários antigos removidos.');

    const usuarios = [
      [24, 'Admin Matriz Teste', '00000000024', '24', '(11) 99999-0024', 1, 1, senhaHash, 0, 'Ativo'],
      [23, 'Gerente Loja Teste', '00000000023', '23', '(11) 99999-0023', 1, 2, senhaHash, 0, 'Ativo'],
      [29, 'Supervisor Teste', '00000000026', '26', '(11) 99999-0026', 1, 4, senhaHash, 0, 'Ativo'],
      [27, 'Operador Caixa Teste', '00000000027', '27', '(11) 99999-0027', 1, 3, senhaHash, 0, 'Ativo']
    ];

    const sql = `
      INSERT INTO funcionarios 
      (id_registro, nome_completo, cpf, email, telefone, id_franquia, id_credencial, senha, primeiroLogin, status) 
      VALUES ?
    `;

    await connection.query(sql, [usuarios]);

    console.log('✅ Todos os usuários (23, 24, 26, 27) foram recriados com a senha "okok" (hash).');
    
  } catch (error) {
    console.error('❌ Erro:', error);
  } finally {
    await connection.end();
    process.exit();
  }
};

runInsertFunc();