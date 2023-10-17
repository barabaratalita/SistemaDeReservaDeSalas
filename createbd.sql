
/*  criar a base de dos caso nao exista*/
CREATE DATABASE IF NOT EXISTS sistema_reserva_salas_db;

/* criando as tabelas*/

create table usuario(
    email varchar(30) primary key,
    nome varchar(30),
    senha varchar(),
    contato_telefone char(14) ,
    token_recuperacao_senha varchar()
)

create table discente(
    di_email varchar(30) references usuario(email),
    matricula integer
    
)
create table doscente(
    do_email varchar(30) references usuario(email),
    siap integer

)
create table fucionario_tercerizado(
    fu_email varchar(30)  references usuario(email),
    cpf char(11)
)

create table tecnicos_adm(
    tec_email varchar(30)  references usuario(email),
    cpf char(11)
)

create table sala(

    id_sala integer primary key,
    numero integer,
    lotacao integer,
    tipo_sala varchar(),
    data_show boolean,
    crimatizacao boolean,
    obs varchar(),
    sala_especial boolean
)

create table reserva(

    id_reserva integer primary key,
    id_sala integer  references sala(id_sala),
    motivo_reserva varchar(),
    recursos_adicionais varchar(),
    horario_inicio timestamp,
    horario_fim timestamp,
    token_reserva varchar(),
    confirmado boolean
)


create table reserva_responsavel(
    id_reserva integer references reserva(id_reserva), 
    responsavel varchar() references usuario(email)
    )


create table limpeza_manutencao(

    cpf_funcionario char(11) references fucionario_tercerizado(cpf),
    id_sala integer references sala(id_sala),
    data_hora timestamp
)

/* criando as consultas*/

