/* Quais salas foram limpas em determinado dia? */
use sistema_reserva_salas_db;

WITH sala_para_limpeza AS (
    SELECT DISTINCT id_sala
    FROM limpeza_manutencao
    WHERE tipo = "limpeza"
); 

WITH sala_limpa_data AS ( 
    SELECT sala_para_limpeza.*,reserva.*
    FROM sala_para_limpeza
    INNER JOIN reserva ON sala_para_limpeza.id_sala = reserva.id_sala
    WHERE reserva.data_horario_fim = 'YYYY-MM-DD'
);

WITH id_sala_limpa_data AS (
    SELECT sala_limpa_data.*
    FROM sala_limpa_data
    INNER JOIN sala ON sala_limpa_data.id_sala = sala.id_sala
);

SELECT DISTINCT numero
    FROM id_sala_limpa_data
