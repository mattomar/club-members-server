const { Sequelize } = require("sequelize");
require("dotenv").config();

const sequelize = new Sequelize(process.env.DB_URL, {
  dialect: "postgres",
  dialectOptions: {
    ssl: {
      require: true,
      rejectUnauthorized: false, // Required for NeonDB
    },
  },
  logging: false, // Optional: Disable logs
});

// Test connection
sequelize
  .authenticate()
  .then(() => console.log("✅ Database connected!"))
  .catch((err) => {
    console.error("❌ Connection error:", err);
    process.exit(1); // Force the app to stop if DB connection fails
  });

module.exports = sequelize;