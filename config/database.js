const { Sequelize } = require("sequelize");
const { Client } = require("pg"); // Use pg to test connection
require("dotenv").config();

const client = new Client({
  connectionString: process.env.DB_URL, 
  ssl: { rejectUnauthorized: false } // Force SSL
});

// Test raw connection first
client.connect()
  .then(() => console.log("✅ Raw DB connection successful"))
  .catch((err) => console.error("❌ Raw DB connection error:", err))
  .finally(() => client.end());

const sequelize = new Sequelize(process.env.DB_URL, {
  dialect: "postgres",
  dialectOptions: {
    ssl: { require: true, rejectUnauthorized: false },
  },
  logging: false, 
});

sequelize
  .authenticate()
  .then(() => console.log("✅ Sequelize connected!"))
  .catch((err) => {
    console.error("❌ Sequelize connection error:", err);
    process.exit(1);
  });

module.exports = sequelize;