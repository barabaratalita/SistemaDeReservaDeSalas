const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize'); // Configure a conexão com o banco de dados

const SalaEspecial = sequelize.define('SalaEspecial', {
  ID: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  // Outros atributos específicos de SalaEspecial
});

SalaEspecial.belongsTo(SalaLaboratorio, {
  foreignKey: 'IDSala',
  constraints: false, // Não exija a existência da sala principal
});

module.exports = SalaEspecial;
