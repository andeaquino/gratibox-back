import supertest from 'supertest';
import '../src/setup.js';
import app from '../src/app.js';
import connection from '../src/database.js';
import { createUser, generateUserBody } from './factories/userFactory.js';

describe('POST /sign-in', () => {
  afterAll(async () => {
    await connection.query(`
        DELETE FROM users 
        `);
  });

  it('returns 403 for invalid body', async () => {
    const body = {};

    const result = await supertest(app).post('/sign-in').send(body);
    const status = result.status;
    expect(status).toEqual(403);
  });

  it('returns 200 when account is logged in sucessufully', async () => {
    const user = await createUser();
    const body = { email: user.email, password: user.password };

    const result = await supertest(app).post('/sign-in').send(body);
    const status = result.status;
    expect(status).toEqual(200);
  });

  it('returns 401 when email or password does not match or exist', async () => {
    const user = generateUserBody();
    const body = { email: user.email, password: user.password };

    const result = await supertest(app).post('/sign-in').send(body);
    const status = result.status;
    expect(status).toEqual(401);
  });
});
