import faker from 'faker';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';
import connection from '../../src/database';

const generateUserBody = (user) => {
  return {
    name: user?.name || faker.name.findName(),
    email: user?.email || faker.internet.email(),
    password: user?.password || faker.internet.password(8),
  };
};

const createUser = async () => {
  const user = generateUserBody();
  const passwordHash = bcrypt.hashSync(user.password, 10);

  const insertedUser = await connection.query(
    `
        INSERT INTO users 
        (name, email, password) 
        VALUES ($1, $2, $3)
        RETURNING id
        ;`,
    [user.name, user.email, passwordHash]
  );

  user.id = insertedUser.rows[0].id;

  return user;
};

const createToken = async () => {
  const user = await createUser();

  const token = jwt.sign({ userId: user.id }, process.env.JWT_SECRET);
  return token;
};

export { createToken, generateUserBody, createUser };
