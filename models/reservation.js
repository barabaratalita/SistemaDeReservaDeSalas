const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize'); // Configure a conexão com o banco de dados

const Reserva = sequelize.define('Reserva', {
  IDReserva: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  Responsavel: DataTypes.STRING,
  MotivoDaReserva: DataTypes.STRING,
  HorarioInicio: DataTypes.TIME,
  HorarioFim: DataTypes.TIME,
  TokenReserva: DataTypes.STRING,
});

// Associação entre Reserva e SalaLaboratorio
Reserva.belongsTo(SalaLaboratorio, { foreignKey: 'IDSala' }); // Relaciona a reserva à sala/laboratório


// Associações entre Reserva e outras tabelas
Reserva.belongsTo(Usuario, { foreignKey: 'IDUsuario' }); // Relaciona a reserva ao usuário
Reserva.belongsTo(Professor, { foreignKey: 'IDProfessor' }); // Relaciona a reserva ao professor

module.exports = Reserva;
