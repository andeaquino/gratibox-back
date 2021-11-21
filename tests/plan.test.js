import '../src/setup.js';
import supertest from 'supertest';
import app from '../src/app.js';
import connection from '../src/database.js';
import { createToken } from './factories/userFactory.js';
import { createPlan } from './factories/planFactory.js';

let token;

afterAll(async () => {
  await connection.query(`DELETE FROM sub_products`);
  await connection.query(`DELETE FROM adresses`);
  await connection.query(`DELETE FROM subscriptions`);
  await connection.query(`DELETE FROM users`);
});

beforeAll(async () => {
  token = await createToken();
});

describe('POST /plan', () => {
  it('return 401 for user not authorized', async () => {
    const plan = createPlan();

    const result = await supertest(app).post('/plan').send(plan);
    expect(result.status).toEqual(401);
  });

  it('return 403 for bad params', async () => {
    const plan = {};

    const result = await supertest(app)
      .post('/plan')
      .set('Authorization', `Bearer ${token}`)
      .send(plan);
    expect(result.status).toEqual(403);
  });

  it('return 201 for good params', async () => {
    const plan = createPlan();

    const result = await supertest(app)
      .post('/plan')
      .set('Authorization', `Bearer ${token}`)
      .send(plan);
    expect(result.status).toEqual(201);
  });

  it('return 409 if user already has a plan', async () => {
    const plan = createPlan();

    const result = await supertest(app)
      .post('/plan')
      .set('Authorization', `Bearer ${token}`)
      .send(plan);
    expect(result.status).toEqual(409);
  });
});

describe('GET /plan', () => {
  it('return 401 for user not authorized', async () => {
    const result = await supertest(app).get(`/plan`);
    expect(result.status).toEqual(401);
  });

  it('return 404 for plan not found', async () => {
    const token = await createToken();

    const result = await supertest(app)
      .get(`/plan`)
      .set('Authorization', `Bearer ${token}`);
    expect(result.status).toEqual(404);
  });

  it('return 200 for sucess', async () => {
    const result = await supertest(app)
      .get(`/plan`)
      .set('Authorization', `Bearer ${token}`);
    expect(result.status).toEqual(200);
  });
});
