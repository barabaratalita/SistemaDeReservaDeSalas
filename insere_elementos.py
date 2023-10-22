from datetime import datetime, timedelta

def get_query_usuario():
    
    query_usuario = ""
    for i in range(40):

        query_usuario += f"""\ninsert into usuario(email, nome, senha, contato_telefone, token_recuperacao_senha)
                                        values('email{i}@email.com','nome {i}', 'jsk232d3333dddsdl', '009909093', null);"""

    return query_usuario


def get_query_discente():

    query_discente = ""
    for i in range(10):
        query_discente += f"""\ninsert into discente(di_email, matricula) values ('email{i}@email.com', {i});"""

    return query_discente

def get_query_doscente():
    
    query_doscente = ""
    for i in range(10, 20):
        query_doscente += f"""\ninsert into doscente(do_email, siape) values ('email{i}@email.com', {i});"""

    return query_doscente

def get_query_fucionario_tercerizado():

    query_fucionario_tercerizado = ""
    for i in range(20,30):
        query_fucionario_tercerizado += f"""\ninsert into fucionario_tercerizado(fu_email, cpf) values ('email{i}@email.com', {i});"""

    return query_fucionario_tercerizado

def get_query_tecnicos_adm():

    query_tecnicos_adm = ""
    for i in range(30,40):
        query_tecnicos_adm += f"""\ninsert into tecnicos_adm(tec_email, cpf) values ('email{i}@email.com', '00000000000');"""

    return query_tecnicos_adm

def cria_query_usuarios():

    query_usuarios = get_query_usuario() + get_query_discente() + get_query_doscente() + get_query_fucionario_tercerizado() + get_query_tecnicos_adm()
    with open("insere_usuarios.sql", "w") as insere_usuarios_sql:
        insere_usuarios_sql.write(query_usuarios)



def get_query_reserva_salas():

    query_sala = ""
    qtd_reserva = 0
    data_atual = datetime.now()

    reservas_salas = ""
    for i in range(10):

        sala_especial = "false"
        data_show = "true"
        if i % 2 == 0:
            sala_especial = "true"
            data_show = "false"

        query_sala += f"""insert into sala(id_sala, numero, lotacao, tipo_sala, data_show, crimatizacao, obs, sala_especial)
                            values ({i}, {i}, {i+10}, null, {data_show}, {data_show}, null, {sala_especial});"""
        
        query_reserva = ""
        for j in range(5):

            horario_inicio = str(data_atual + timedelta(hours=j))
            horario_fim = str(data_atual + timedelta(hours=3+j))

            query_reserva += f"""
            insert into reserva(id_reserva, id_sala, motivo_reserva, recursos_adicionais, horario_inicio, horario_fim,  token_reserva, confirmado)
            values ({qtd_reserva}, {i}, null, null, '{horario_inicio}', '{horario_fim}', null, true);
            insert into reserva_responsavel(id_reserva, responsavel) values ({qtd_reserva}, '{get_responsavel_valido(qtd_reserva)}');
            """
            qtd_reserva += 1
        
        reservas_salas += query_reserva
            
    return query_sala + reservas_salas


def get_responsavel_valido(position):

    responsaveis = []
    for i in range(10,20):
        responsaveis.append(f"email{i}@email.com1")

    p = position
    if position >= 10:
        voltas = 10/position
        p = int((voltas - int(voltas))*10)

    return responsaveis[p]


def cria_query_reservas_salas():

    query_reservas_salas = get_query_reserva_salas()
    with open("cria_reservas_salas.sql", "w") as cria_reservas_salas:
        cria_reservas_salas.write(query_reservas_salas)
    

if __name__ == "__main__":

    cria_query_usuarios()
    cria_query_reservas_salas()



"""
sala(id_sala, numero, lotacao,  tipo_sala, data_show, crimatizacao, obs, sala_especial)

reserva(id_reserva, id_sala, email_responsavel, motivo_reserva,  recursos_adicionais, horario_inicio, horario_fim,  token_reserva, confirmado)
	id_sala referencia sala(id_sala)

reserva_responsavel(id_reserva, responsavel)
	responsavel referencia usuario(email)
	id_reserva referencia reserva(id_reserva)

limpeza_manutencao(  cpf_funcionario, id_sala, data_hora)
	cpf_fucionario referencia fucionario_tercerizado(cpf)
	id_sala referencia sala(id_sala
"""