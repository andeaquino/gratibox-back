import joi from 'joi';

const planSchema = joi.object({
  planType: joi.number().required(),
  planDate: joi.number().required(),
  products: joi.array().required(),
  name: joi.string().required(),
  adress: joi.string().required(),
  cep: joi.string().required(),
  city: joi.string().required(),
  state: joi.string().required(),
});

export { planSchema };
