import express from 'express';

const porta = process.env.PORT || 8080;

const app = express();

app.get('/', (req, res) => {
  res.status(204).end();
});

const server = app.listen(porta, () => {
  console.log(`Servidor rodando na porta ${porta}`);
});

server.on('error', (err) => {
  console.error(`Erro ao iniciar o servidor: ${err.message}`);
});
