/* sala com lotaçao maior que 10 que nao esteja reservada*/

USE sistema_reserva_salas_db;

SELECT s.id_sala, s.numero, s.lotacao
FROM sala s
LEFT JOIN reserva r ON s.id_sala = r.id_sala
WHERE s.lotacao > 10 AND r.id_sala IS NULL;