const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize'); // Configure a conexão com o banco de dados

const Professor = sequelize.define('Professor', {
  Siap: {
    type: DataTypes.STRING,
    primaryKey: true,
  },
  // Outros campos específicos de professores
});

// Associação entre Professor e Usuario
Professor.belongsTo(Usuario);
