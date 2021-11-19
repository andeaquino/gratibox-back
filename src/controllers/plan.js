import connection from '../database.js';

const postPlan = async (req, res) => {
  const { planType, planDate, products, name, adress, cep, city, state } =
    req.body;

  if (
    signInSchema.validate({
      planType,
      planDate,
      products,
      name,
      adress,
      cep,
      city,
      state,
    }).error
  ) {
    return res.sendStatus(403);
  }

  try {
    const result = await connection.query(
      `INSERT INTO subscriptions (user_id, plan_id, date_id) VALUES($1, $2, $3) RETURNING id`,
      [req.userId, planType, planDate]
    );

    const subId = result.rows[0].id;
    products.forEach(async (product) => {
      await connection.query(
        `INSERT INTO sub_products (sub_id, products_id) VALUES ($1, $2)`,
        [subId, product]
      );
    });

    await connection.query(
      `INSERT INTO adresses (subscription_id, name, adress, cep, city, state) VALUES ($1, $2, $3, $4, $5, $6)`,
      [subId, name, adress, cep, city, state]
    );

    return res.sendStatus(201);
  } catch {
    res.sendStatus(500);
  }
};
