/*Quais salas estão atualmente sendo usadas por alunos*/
use sistema_reserva_salas_db;

select id_sala,id_reserva, horio_inicio, horario_fim
	from reserva r
	INNER JOIN reserva_responsavel rs ON rs.id_reserva = s.id_reserva
    where(r.horario_inicio >= date(now()) and r.horario_fim > date(now()));
     
    