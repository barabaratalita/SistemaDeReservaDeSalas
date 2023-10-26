use sistema_reserva_salas_db;
 
SELECT DISTINCT numero
FROM (   
SELECT id_sala
	FROM (
		SELECT reserva.id_reserva, reserva.id_sala, reserva_responsavel.responsavel
		FROM reserva
		INNER JOIN reserva_responsavel ON reserva.id_reserva = reserva_responsavel.id_reserva ) AS A
	INNER JOIN doscente ON doscente.do_email = A.responsavel ) AS B
INNER JOIN sala ON sala.id_sala = B.id_sala


