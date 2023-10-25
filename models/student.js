const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize'); // Configure a conexão com o banco de dados

const Aluno = sequelize.define('Aluno', {
  Matricula: {
    type: DataTypes.STRING,
    primaryKey: true,
  },
  // Outros campos específicos de alunos
});

// Associação entre Aluno e Usuario
Aluno.belongsTo(Usuario);
