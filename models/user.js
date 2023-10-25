const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize'); // Configure a conexão com o banco de dados

const Usuario = sequelize.define('Usuario', {
  Nome: DataTypes.STRING,
  Email: DataTypes.STRING,
  Senha: DataTypes.STRING,
  Telefone: DataTypes.STRING,
  TokenRecuperacaoSenha: DataTypes.STRING,
});

module.exports = Usuario;
