
/*  criar a base de dos caso nao exista*/
CREATE DATABASE IF NOT EXISTS sistema_reserva_salas_db;

/* criando as tabelas*/

create table usuario(
    email varchar(30) primary key,
    nome varchar(30) not null,
    senha varchar() not null,
    contato_telefone varchar(14) ,
    token_recuperacao_senha varchar(250)
);

ALTER TABLE usuario ADD CONSTRAINT MIN_LENGTH_EMAIL CHECK (CHAR_LENGTH(email) >= 1);
ALTER TABLE usuario ADD CONSTRAINT MIN_LENGTH_NOME CHECK (CHAR_LENGTH(nome) >= 1);
ALTER TABLE usuario ADD CONSTRAINT MIN_LENGTH_SENHA CHECK (CHAR_LENGTH(senha) >= 12);

create table discente(
    matricula integer primary key auto_increment,
    di_email varchar(30) not null,
    foreign key(di_email) references usuario(email)   
);

create table doscente(
    siap integer not null primary key,
    do_email varchar(30),
    foreign key(do_email) references usuario(email)
);

create table fucionario_tercerizado(
    cpf char(11) not null primary key,
    fu_email varchar(30),
    foreign key(fu_email)  references usuario(email)
    
);

create table tecnicos_adm(
    cpf char(11) not null primary key,
    tec_email varchar(30),
    foreign key(tec_email) references usuario(email),
    
);

create table sala(

    id_sala integer not null primary key,
    numero integer,
    lotacao integer,
    tipo_sala varchar(),
    data_show boolean,
    crimatizacao boolean,
    obs varchar(),
    sala_especial boolean
);

create table reserva(

    id_reserva integer not null primary key,
    id_sala integer  references sala(id_sala),
    motivo_reserva varchar(),
    recursos_adicionais varchar(),
    horario_inicio timestamp,
    horario_fim timestamp,
    token_reserva varchar(),
    confirmado boolean
);


create table reserva_responsavel(
    id_reserva integer references reserva(id_reserva), 
    responsavel varchar() references usuario(email)
    );


create table limpeza_manutencao(

    cpf_funcionario char(11) references fucionario_tercerizado(cpf),
    id_sala integer references sala(id_sala),
    data_hora timestamp
);






