import express from 'express';
import signUp from './controllers/signUp.js';

const routes = express.Router();

routes.post('/sign-up', signUp);
