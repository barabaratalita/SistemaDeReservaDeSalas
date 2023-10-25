const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize'); // Configure a conexão com o banco de dados

const SalaLaboratorio = sequelize.define('SalaLaboratorio', {
  IDSala: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  Numero: DataTypes.STRING,
  Setor: DataTypes.STRING,
  Lotacao: DataTypes.INTEGER,
  TipoSala: DataTypes.STRING,
  DataShow: DataTypes.BOOLEAN,
  Climatizacao: DataTypes.STRING,
  StatusLimpeza: DataTypes.STRING,
  Observacoes: DataTypes.STRING,
});

module.exports = SalaLaboratorio;
