const express = require("express");
const bcrypt = require("bcryptjs");
const { User, Role } = require("../models"); // Import your models

const router = express.Router();
router.post("/signup", async (req, res) => {
    try {
      const { firstName, lastName, email, password } = req.body; // ✅ Fix here
  
      // 1️⃣ Check if email exists
      const existingUser = await User.findOne({ where: { email } });
      if (existingUser) {
        return res.status(400).json({ message: "Email already in use" });
      }
  
      // 2️⃣ Hash the password
      const hashedPassword = await bcrypt.hash(password, 10);
  
      // 3️⃣ Assign the default role (Member)
      const memberRole = await Role.findOne({ where: { name: "Member" } });
  
      // 4️⃣ Create the user
      const newUser = await User.create({
        firstName, // ✅ Fix here
        lastName,  // ✅ Fix here
        email,
        password: hashedPassword,
        roleId: memberRole ? memberRole.id : null, // Handle role assignment
      });
  
      res.status(201).json({ message: "User registered successfully", user: newUser });
  
    } catch (error) {
      console.error("Signup Error:", error);
      res.status(500).json({ message: "Internal server error" });
    }
  });

module.exports = router;