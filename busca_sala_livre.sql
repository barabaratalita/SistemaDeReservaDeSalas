/* Quais salas estão disponíveis*/

use sistema_reserva_salas_db;
/*salas reservadas no período  2023-10-22 18:18 - 2023-10-22 19:18*/
SELECT s.numero AS numero_sala, r.horario_inicio, r.horario_fim
    FROM reserva r
    INNER JOIN sala s ON r.id_sala = s.id_sala
    WHERE (r.horario_inicio <= '2023-10-24 19:18' AND r.horario_fim >= '2023-10-24 18:18');

/*Pega todas as salas que nao pertencem ao conjunto das reservadas.: salas - salas_reservadas*/
SELECT s.numero AS numero_sala
    FROM sala s
    LEFT JOIN reserva r ON s.id_sala = r.id_sala
    WHERE (r.id_reserva IS NULL) OR (r.horario_inicio > '2023-10-24 19:18' OR r.horario_fim < '2023-10-24 18:18');






