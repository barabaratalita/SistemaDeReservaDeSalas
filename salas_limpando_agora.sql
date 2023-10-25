/*Quais salas estão atualmente sendo limpas*/

USE sistema_reserva_salas_db;

SELECT l.cpf_funcionario, l.id_sala, l.data_hora_inicio, l.data_hora_fim
    FROM limpeza_manutencao l
    WHERE (l.data_hora_inicio <= now() AND l.data_hora_fim >= now());
 