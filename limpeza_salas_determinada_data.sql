/* Quais salas foram limpas em determinado dia? */
use sistema_reserva_salas_db;

SELECT DISTINCT numero
FROM (
	SELECT id_sala
    FROM limpeza_manutencao
    WHERE tipo = "limpeza" and data_hora_fim > "2023/10/26" and data_hora_fim < "2023/10/27"
) AS A
INNER JOIN sala ON sala.id_sala = A.id_sala


