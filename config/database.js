const { Sequelize } = require("sequelize");
require("dotenv").config();

const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASS,
  {
    host: process.env.DB_HOST,
    dialect: "postgres",
    dialectOptions: {
      ssl: {
        require: true,
        rejectUnauthorized: false, 
      },
    },
    logging: false,
  }
);

sequelize
  .authenticate()
  .then(() => console.log("✅ Database connected!"))
  .catch((err) => {
    console.error("❌ Connection error:", err);
    process.exit(1);
  });

module.exports = sequelize;
