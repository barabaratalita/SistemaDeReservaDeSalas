/* sala com lotaçao maior que 10 que nao esteja reservada*/

USE sistema_reserva_salas_db;

SELECT s.id_sala, s.numero, s.lotacao
FROM sala s
WHERE s.lotacao > 10 ;