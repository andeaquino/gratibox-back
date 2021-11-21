import express from 'express';
import auth from './middleware/auth.js';
import { signUp } from './controllers/signUp.js';
import { signIn } from './controllers/signIn.js';
import { listPlan, postPlan } from './controllers/plan.js';

const routes = express.Router();

routes.post('/sign-up', signUp);
routes.post('/sign-in', signIn);

routes.post('/plan', auth, postPlan);
routes.get('/plan', auth, listPlan);

export default routes;
