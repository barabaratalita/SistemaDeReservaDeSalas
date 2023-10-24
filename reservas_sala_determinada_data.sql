/*Buscar por reservas de sala em determinada data*/
use sistema_reserva_salas_db;

SELECT s.numero AS numero_sala, r.horario_inicio, r.horario_fim
FROM reserva r
INNER JOIN sala s ON r.id_sala = s.id_sala
WHERE (r.horario_inicio <= '2023-10-22 15:18' AND r.horario_fim >= '2023-10-22 20:18');


    
