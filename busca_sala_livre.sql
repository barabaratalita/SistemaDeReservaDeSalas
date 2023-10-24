/* Quais salas estão disponíveis*/

use sistema_reserva_salas_db;

with salas_reservadas as (
	SELECT r.id_sala
		FROM reserva r
			WHERE /*periodo: 2023-10-22 18:18 - 2023-10-22 19:18 */
				 (date(r.horario_inicio) >= date("2023-10-22 15:18") 
					and date(r.horario_inicio) <= date("2023-10-22 20:18"))
				or
				 date(r.horario_fim) >= date("2023-10-22 15:18")
)

/* Pega todas as salas que nao pertencem ao conjunto das reservadas.: salas - salas_reservadas */ 
SELECT DISTINCT s.id_sala, s.numero, s.lotacao, s.tipo_sala, s.data_show, s.obs, s.sala_especial
	FROM sala s LEFT JOIN salas_reservadas sr
		ON
		        s.id_sala = sr.id_sala
		WHERE
			sr.id_sala IS NULL