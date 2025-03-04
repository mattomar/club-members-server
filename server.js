require("dotenv").config();
const express = require("express");
const cors = require("cors");
const db = require("./models"); // Import database models

const app = express();

// Middleware
app.use(cors());
app.use(express.json()); // For parsing JSON requests

// Test Route
app.get("/", (req, res) => {
  res.send("✅ Server is running!");
});

// Sync Database and Start Server
const PORT = process.env.PORT || 5000;

db.sequelize
  .sync()
  .then(() => {
    console.log("✅ Database synced");
    app.listen(PORT, () => console.log(`🚀 Server running on port ${PORT}`));
  })
  .catch((err) => console.error("❌ Error syncing database:", err));