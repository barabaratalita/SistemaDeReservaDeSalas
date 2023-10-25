/* Quais salas foram limpas em determinado dia? */
use sistema_reserva_salas_db;

CREATE TABLE sala_para_limpeza AS (
    SELECT DISTINCT id_sala
    FROM limpeza_manutencao
    WHERE tipo = "limpeza"
); 

CREATE TABLE sala_limpa_data AS ( 
    SELECT sala_para_limpeza.*,reserva.*
    FROM sala_para_limpeza
    INNER JOIN reserva ON sala_para_limpeza.id_sala = reserva.id_sala
    WHERE reserva.data_horario_fim = 'YYYY-MM-DD'
);

CREATE TABLE id_sala_limpa_data AS (
    SELECT sala_limpa_data.*
    FROM sala_limpa_data
    INNER JOIN sala ON sala_limpa_data.id_sala = sala.id_sala
);

CREATE TABLE numero_das_salas AS (
    SELECT DISTINCT numero
    FROM id_sala_limpa_data
);