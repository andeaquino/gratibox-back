import express from 'express';
import { signUp } from './controllers/signUp.js';
import { signIn } from './controllers/signIn.js';

const routes = express.Router();

routes.post('/sign-up', signUp);
routes.post('/sign-in', signIn);

export default routes;
