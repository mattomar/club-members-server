require("dotenv").config();
const express = require("express");
const cors = require("cors");
const path = require("path"); // ✅ Import path module
const db = require("./models"); // Import database models
const authRoutes = require("./routes/auth"); // Import auth routes
const messagesRoute = require("./routes/messages");

const app = express();

// ✅ CORS Configuration to Allow Requests from Vercel Frontend
const corsOptions = {
  origin: "https://club-members-ec36rt5mw-mattomars-projects.vercel.app", // ✅ Replace with your frontend URL
  credentials: true, // ✅ Allow cookies/auth headers
  optionsSuccessStatus: 200,
};

app.use(cors(corsOptions)); // ✅ Apply CORS
app.use(express.json()); // For parsing JSON requests

// ✅ Test Route
app.get("/api", (req, res) => {
  res.send("✅ Server is running and accessible from Vercel!");
});

// ✅ Routes
app.use("/api/auth", authRoutes); // Mount authentication routes
app.use("/api/messages", messagesRoute);

// ✅ Sync Database and Start Server
const PORT = process.env.PORT || 5001;

db.sequelize
  .sync()
  .then(() => {
    console.log("✅ Database synced");
    app.listen(PORT, () => console.log(`🚀 Server running on port ${PORT}`));
  })
  .catch((err) => console.error("❌ Error syncing database:", err));
