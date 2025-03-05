module.exports = (sequelize, DataTypes) => {
  const Role = sequelize.define("Role", {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
  });

  // Insert roles when the model initializes
  Role.sync().then(async () => {
    const roles = ["Guest", "Member", "Admin"];
    for (const role of roles) {
      await Role.findOrCreate({ where: { name: role } });
    }
    console.log("Roles ensured in the database!");
  });
  
  return Role;
};