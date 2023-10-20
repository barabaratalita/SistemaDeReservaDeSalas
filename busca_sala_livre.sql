/* Quais salas estão disponíveis*/

/* Cria uma tabela com as salas que estao reservadas para agora */
salas_reservadas as (
	SELECT s.id_sala,
		FROM sala s, reserva r
			WHERE
				 r.id_sala = s.id_sala
				 and (date(r.horario_inicio) <=  date(NOW())
				 and date(r.horario_fim) >= date(NOW())
)

/* Pega todas as salas que nao pertencem ao conjunto das reservadas.: salas - salas_reservadas */ 
SELECT s.id_sala, s.numero, s.lotacao, s.tipo_sala, s.data_show, s.climatizacao, s.obs, s.sala_especial
	FROM sala s, salas_reservadas sr
		WHERE
			s.id_sala != sr.id_sala