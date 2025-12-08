import express from 'express';
import { criarVendaController, listarVendasController } from '../controllers/VendaController.js';
import authMiddleware from '../middlewares/authMiddleware.js';
const router = express.Router();

router.post('/', authMiddleware, criarVendaController);

router.get('/',authMiddleware, listarVendasController);


router.options('/', (req, res) => {
  res.setHeader('Allow', 'GET, POST');
  res.status(204).send();
});

export default router;
