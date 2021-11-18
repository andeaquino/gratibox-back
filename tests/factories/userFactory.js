import faker from 'faker';
import bcrypt from 'bcrypt';
import connection from '../../src/database';

const generateClientBody = () => ({
  name: faker.name.findName(),
  email: faker.internet.email(),
  password: faker.internet.password('########'),
});

const createClient = async () => {
  const user = generateClientBody();
  const passwordHash = bcrypt.hashSync(user.password, 10);

  const insertedUser = await connection.query(
    `
        INSERT INTO users 
        (name, email, password) 
        VALUES ($1, $2, $3)
        RETURNING id
        ;`,
    [user.email, user.name, passwordHash]
  );

  user.id = insertedUser.rows[0].id;

  return user;
};

export default { createClient };
