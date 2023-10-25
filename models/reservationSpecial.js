const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize'); // Configure a conexão com o banco de dados

const ReservaEspecial = sequelize.define('ReservaEspecial', {
  IDReserva: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  Motivo: DataTypes.STRING,
  RecursosNecessarios: DataTypes.STRING,
  TokenReserva: DataTypes.STRING,
});

// Associação entre ReservaEspecial e SalaEspecial
ReservaEspecial.belongsTo(SalaEspecial, { foreignKey: 'IDSalaEspecial' });

// Associação entre ReservaEspecial e Professor
ReservaEspecial.belongsTo(Professor, { foreignKey: 'Siap' });

module.exports = ReservaEspecial;
