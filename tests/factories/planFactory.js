import faker from 'faker';

const createPlan = () => {
  const plan = {
    planType: faker.datatype.number({ min: 1, max: 2 }),
    planDate: faker.datatype.number({ min: 1, max: 2 }),
    products: [1, 2, 3],
    name: faker.name.findName(),
    address: faker.address.streetAddress(),
    cep: faker.address.zipCode(),
    city: faker.address.city(),
    state: faker.address.state(),
  };
  return plan;
};

export { createPlan };
