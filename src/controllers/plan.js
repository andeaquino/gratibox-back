import connection from '../database.js';
import { planSchema } from '../schemas/planSchema.js';

const postPlan = async (req, res) => {
  const { planType, planDate, products, name, address, cep, city, state } =
    req.body;

  if (
    planSchema.validate({
      planType,
      planDate,
      products,
      name,
      address,
      cep,
      city,
      state,
    }).error
  ) {
    return res.sendStatus(403);
  }

  try {
    const checkPlan = await connection.query(
      `SELECT * FROM subscriptions WHERE user_id = $1`,
      [req.userId]
    );
    if (checkPlan.rowCount !== 0)
      return res.status(409).send('User already has a plan');

    const result = await connection.query(
      `INSERT INTO subscriptions (user_id, plan_id, date_id, date) VALUES($1, $2, $3, NOW()) RETURNING id`,
      [req.userId, planType, planDate]
    );

    const subId = result.rows[0].id;
    products.forEach(async (product) => {
      await connection.query(
        `INSERT INTO sub_products (sub_id, product_id) VALUES ($1, $2)`,
        [subId, product]
      );
    });

    await connection.query(
      `INSERT INTO adresses (subscription_id, name, adress, cep, city, state) VALUES ($1, $2, $3, $4, $5, $6)`,
      [subId, name, address, cep, city, state]
    );

    return res.sendStatus(201);
  } catch {
    return res.sendStatus(500);
  }
};

const listPlan = async (req, res) => {
  try {
    const result = await connection.query(
      `
      SELECT
      subscriptions.date,
      plans.name AS "planType",
      dates.date AS "planDate",
      products.name AS "product"
      FROM subscriptions
      JOIN plans
        ON subscriptions.plan_id = plans.id
      JOIN dates
        ON subscriptions.date_id = dates.id
      JOIN sub_products
        ON sub_products.sub_id = subscriptions.id
      JOIN products
        ON products.id = sub_products.product_id
      WHERE subscriptions.user_id = $1
      ;`,
      [req.userId]
    );

    if (result.rowCount === 0) return res.sendStatus(404);

    const products = result.rows.map((plan) => plan.product);
    const plan = {
      planType: result.rows[0].planType,
      planDate: result.rows[0].planDate,
      products,
    };

    res.status(200).send({ plan });
  } catch {
    return res.sendStatus(500);
  }
};

export { postPlan, listPlan };
