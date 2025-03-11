const express = require("express");
const bcrypt = require("bcryptjs");
const { User, Role } = require("../models"); // Import your models
const jwt = require("jsonwebtoken");


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

  router.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;

    // 1️⃣ Check if the user exists
    const user = await User.findOne({ where: { email } });
    if (!user) {
      return res.status(401).json({ message: "Invalid email or password" });
    }

    // 2️⃣ Compare passwords
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(401).json({ message: "Invalid email or password" });
    }

    // 3️⃣ Generate JWT token
    const token = jwt.sign(
      { userId: user.id, email: user.email, roleId: user.roleId }, 
      "hmm", // Use an environment variable for security
      { expiresIn: "1h" }
    );

    // 4️⃣ Send token to client
    res.status(200).json({ message: "Login successful", token });

  } catch (error) {
    console.error("Login Error:", error);
    res.status(500).json({ message: "Internal server error" });
  }
});

 
module.exports = router;

 