const { Sequelize, DataTypes } = require("sequelize");
require("dotenv").config();

const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASS,
  {
    host: process.env.DB_HOST,
    dialect: "postgres",
    dialectOptions: {
      ssl: process.env.DB_SSL === "true" ? { require: true, rejectUnauthorized: false } : false,
    },
    logging: false, // ✅ Optional: Disable logs for cleaner output
  }
);

const db = {};
db.sequelize = sequelize;
db.Sequelize = Sequelize;

// Import Models
db.Role = require("./role")(sequelize, DataTypes);
db.User = require("./user")(sequelize, DataTypes);
db.Message = require("./message")(sequelize, DataTypes);

// Define Relationships
db.Role.hasMany(db.User, { foreignKey: "roleId", as: "users" });
db.User.belongsTo(db.Role, { foreignKey: "roleId", as: "role" });

db.User.hasMany(db.Message, { foreignKey: "senderId", as: "sentMessages" });
db.User.hasMany(db.Message, { foreignKey: "receiverId", as: "receivedMessages" });

db.Message.belongsTo(db.User, { foreignKey: "senderId", as: "sender" });
db.Message.belongsTo(db.User, { foreignKey: "receiverId", as: "receiver" });

// Sync database
sequelize
  .sync({ alter: true })
  .then(() => console.log("✅ Database synced"))
  .catch((err) => console.log("❌ Error syncing database:", err));

module.exports = db;