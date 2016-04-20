module.exports = {
  client: "mysql",
  connection: {
    database: process.env.DB_NAME,
    host:     process.env.DB_HOST,
    user:     process.env.DB_USER,
    password: process.env.DB_PASSWORD,
  },
};
