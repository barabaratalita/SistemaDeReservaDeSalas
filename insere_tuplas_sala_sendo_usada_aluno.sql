/*Quais salas estão atualmente sendo usadas por alunos*/
USE sistema_reserva_salas_db;

SELECT s.id_sala, s.numero, s.lotacao, s.tipo_sala, s.data_show, s.climatizacao, s.obs, s.sala_especial
	FROM sala s
	INNER JOIN reserva r ON s.id_sala = r.id_sala
	INNER JOIN reserva_responsavel rr ON r.id_reserva = rr.id_reserva
	INNER JOIN discente d ON rr.responsavel = d.di_email
    WHERE(r.horario_inicio <= now() AND r.horario_fim >= now());
