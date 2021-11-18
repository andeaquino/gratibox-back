import bcrypt from 'bcrypt';
import connection from '../database.js';
import { signUpSchema } from '../schemas/signUpSchema.js';

const signUp = async (req, res) => {
  const { name, email, password } = req.body;

  if (signUpSchema.validate({ name, email, password }).error) {
    return res.sendStatus(403);
  }

  const passwordHash = bcrypt.hashSync(password, 10);

  try {
    const emailCheck = await connection.query(
      `
        SELECT * FROM users
        WHERE email = $1
        ;`,
      [email]
    );
    if (emailCheck.rowCount !== 0) {
      return res.status(409).send('Invalid email');
    }

    await connection.query(
      `
        INSERT INTO users 
        (name, email, password) 
        VALUES ($1, $2, $3)
        ;`,
      [name, email, passwordHash]
    );

    return res.sendStatus(201);
  } catch {
    return res.sendStatus(500);
  }
};

export { signUp };
