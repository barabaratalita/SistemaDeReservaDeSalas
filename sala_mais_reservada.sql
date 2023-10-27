use sistema_reserva_salas_db;

SELECT id_sala, contagem_reservas
FROM (
    SELECT id_sala, COUNT(id_reserva) AS contagem_reservas
    FROM reserva
    GROUP BY id_sala
) AS reservas_por_sala
WHERE contagem_reservas = (
    SELECT MAX(contagem_reservas)
    FROM (
        SELECT id_sala, COUNT(id_reserva) AS contagem_reservas
        FROM reserva
        GROUP BY id_sala
    ) AS subquery
);