const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize'); // Configure a conexão com o banco de dados

const TecnicoAdministrativo = sequelize.define('TecnicoAdministrativo', {
  CPF: {
    type: DataTypes.STRING,
    primaryKey: true,
  },
  // Outros campos específicos de técnicos administrativos
});

// Associação entre TecnicoAdministrativo e Usuario
TecnicoAdministrativo.belongsTo(Usuario);
