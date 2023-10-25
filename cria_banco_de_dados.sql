/*  criar a base de dos caso nao exista*/
CREATE DATABASE IF NOT EXISTS sistema_reserva_salas_db;
use sistema_reserva_salas_db;

/* criando as tabelas*/

create table usuario(
    email varchar(30) primary key,
    nome varchar(30) not null,
    senha varchar(250) not null,
    contato_telefone varchar(14),
    token_recuperacao_senha varchar(250)
);

ALTER TABLE usuario ADD CONSTRAINT tamanho_min_email CHECK (CHAR_LENGTH(email) >= 5);
ALTER TABLE usuario ADD CONSTRAINT tamanho_min_nome CHECK (CHAR_LENGTH(nome) >= 3);
ALTER TABLE usuario ADD CONSTRAINT tamanho_min_senha CHECK (CHAR_LENGTH(senha) >= 12);

create table discente(
    matricula integer primary key auto_increment,
    di_email varchar(30) not null,
    foreign key(di_email) references usuario(email)   
);

create table doscente(
    siape integer not null primary key,
    do_email varchar(30),
    foreign key(do_email) references usuario(email)
);

create table fucionario_tercerizado(
    cpf varchar(11) not null primary key,
    fu_email varchar(30),
    foreign key(fu_email)  references usuario(email)
    
);

create table tecnicos_adm(
    cpf varchar(11) not null primary key,
    tec_email varchar(30),
    foreign key(tec_email) references usuario(email)
    
);

create table sala(
    id_sala integer not null primary key auto_increment,
    numero integer,
    lotacao integer,
    tipo_sala varchar(250),
    data_show boolean,
    climatizacao boolean,
    obs varchar(250),
    sala_especial boolean
);

create table reserva(
    id_reserva integer not null primary key auto_increment,
    id_sala integer not null,
    motivo_reserva varchar(250),
    recursos_adicionais varchar(250),
    horario_inicio timestamp,
    horario_fim timestamp,
    token_reserva varchar(250),
    confirmado boolean,
    foreign key(id_sala) references sala(id_sala)
);


create table reserva_responsavel(
    id_reserva integer, 
    responsavel varchar(250), 
    foreign key(id_reserva) references reserva(id_reserva),
    foreign key(responsavel) references usuario(email)
);


create table limpeza_manutencao(
    cpf_funcionario varchar(11), 
    id_sala integer,
    data_hora_inicio timestamp,
    data_hora_fim timestamp, 
    foreign key(cpf_funcionario) references fucionario_tercerizado(cpf),
    foreign key(id_sala) references sala(id_sala)
);