const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize'); // Configure a conexão com o banco de dados

const FuncionarioLimpeza = sequelize.define('FuncionarioLimpeza', {
  CPF: {
    type: DataTypes.STRING,
    primaryKey: true,
  },
  // Outros campos específicos de funcionários da limpeza
});

// Associação entre FuncionarioLimpeza e Usuario
FuncionarioLimpeza.belongsTo(Usuario);
