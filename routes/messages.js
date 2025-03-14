const express = require("express");
const jwt = require("jsonwebtoken");
const { Message, User } = require("../models"); // ✅ Use Sequelize model
const router = express.Router();
const { Op } = require("sequelize");

 
// ✅ Middleware to Authenticate Users
const authenticateUser = (req, res, next) => {
  const token = req.headers.authorization?.split(" ")[1];

  if (!token) return res.status(401).json({ error: "Unauthorized" });

  try {
    const decoded = jwt.verify(token, "hmm");
    req.user = decoded;
    next();
  } catch (error) {
    return res.status(403).json({ error: "Invalid token" });
  }
};

// ✅ Send a Message
router.post("/", authenticateUser, async (req, res) => {
    try {
      const { content, receiverId } = req.body;
      const senderId = req.user.userId;
  
      console.log("Incoming message:", { content, senderId, receiverId }); // Debugging log
  
      const message = await Message.create({ content, senderId, receiverId });
  
      res.status(201).json(message);
    } catch (error) {
      console.error("Message Error:", error);
      res.status(500).json({ error: "Failed to send message" });
    }
  });

// ✅ Get Messages for Logged-in User

router.get("/", async (req, res) => {
  try {
      const messages = await Message.findAll({
          include: [
              { model: User, as: "sender", attributes: ["id", "firstName", "lastName"] },
              { model: User, as: "receiver", attributes: ["id", "firstName", "lastName"] },
          ],
          order: [["createdAt", "DESC"]],
      });

      res.json(messages);
  } catch (error) {
      console.error("Error fetching messages:", error);
      res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = router;