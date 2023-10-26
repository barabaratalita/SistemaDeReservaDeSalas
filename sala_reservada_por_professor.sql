
use sistema_reserva_salas_db;

WITH A AS (
    SELECT *
    FROM reserva
    INNER JOIN reserva_responsavel ON reserva.id_reserva = reserva_responsavel.id_reserva
); 

WITH B AS ( 
    SELECT DISTINCT id_sala
    FROM A
    INNER JOIN doscente ON A.responsavel = doscente.email
);

SELECT DISTINCT numero
    FROM B
    INNER JOIN sala ON B.id_sala = sala.id_sala

