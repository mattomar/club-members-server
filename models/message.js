module.exports = (sequelize, DataTypes) => {
    const Message = sequelize.define("Message", {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      content: {
        type: DataTypes.TEXT,
        allowNull: false,
      },
    });
  
    Message.associate = (models) => {
      Message.belongsTo(models.User, {
        foreignKey: "senderId",
        as: "sender",
      });
  
      Message.belongsTo(models.User, {
        foreignKey: "receiverId",
        as: "receiver",
      });
    };
  
    return Message;
  };