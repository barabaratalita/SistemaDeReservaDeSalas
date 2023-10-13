
/*  criar a base de dos caso nao exista*/
CREATE DATABASE IF NOT EXISTS sistema_reserva_salas_db;

/* criando as tabelas*/

create table usuario(
    nome varchar(30),
    email varchar(30),
    senha varchar(),
    contato_telefone char(14) ,
    token_recuperacao_senha varchar()
)

create table discente(
    di_email varchar(30),
    matricula integer
    
)
create table doscente(
    do_email varchar(30),
    siap integer

)
create table fucionario_tercerizado(
    fu_email varchar(30)
    cpf char(11)
)

create table tecnicos_adm(
    tec_email varchar(30)
    cpf char(11)
)

create table sala(

    id_sala,
    numero integer,
    lotacao integer,
    tipo_sala varchar(),
    data_show boolean,
    crimatizacao boolean,
    obs varchar(),
    sala_especial boolean
)

create table reserva(

    id_reserva integer,
    id_sala integer,
    responsavel varchar(),
    motivo_reserva varchar(),
    recursos_adicionais varchar(),
    horario_inicio timestamp,
    horario_fim timestamp,
    token_reserva varchar(),
    confirmado boolean
)

create table limpeza_manutencao(

    cpf_funcionario char(11),
    id_sala integer,
    data_hora timestamp
)


