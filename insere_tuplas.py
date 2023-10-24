from datetime import datetime, timedelta



def get_de_lista_circular(lista, posicao):

    tamanho_lista = len(lista)
    p = posicao
    if posicao >= tamanho_lista:
        voltas = posicao / tamanho_lista
        p = int((voltas - int(voltas))*tamanho_lista)
    
    return lista[p]

def get_sql_usuario():
    
    sql_usuario = ""
    for i in range(40):

        sql_usuario += f"""
insert into usuario(email, nome, senha, contato_telefone, token_recuperacao_senha)
    values('email{i+1}@email.com','nome {i+1}', 'jsk232d3333dddsdl', '009909093', null);
        """

    return sql_usuario


def get_sql_discente():

    sql_discente = ""
    for i in range(10):
        sql_discente += f"""
insert into discente(matricula, di_email) values ({i+1}, 'email{i+1}@email.com');
        """

    return sql_discente

def get_sql_doscente():
    
    sql_doscente = ""
    for i in range(10, 20):
        sql_doscente += f"""
insert into doscente(siape, do_email) values ({i+1}, 'email{i+1}@email.com');
        """

    return sql_doscente

def get_sql_fucionario_tercerizado():

    sql_fucionario_tercerizado = ""
    for i in range(20,30):
        sql_fucionario_tercerizado += f"""
insert into fucionario_tercerizado(cpf, fu_email) values ('0000000{i+1}', 'email{i+1}@email.com');
        """

    return sql_fucionario_tercerizado

def get_sql_tecnicos_adm():

    sql_tecnicos_adm = ""
    for i in range(30,40):
        sql_tecnicos_adm += f"""
insert into tecnicos_adm(cpf, tec_email) values ('0000000{i+1}', 'email{i+1}@email.com');
        """

    return sql_tecnicos_adm

def cria_sql_usuarios():

    return get_sql_usuario() + get_sql_discente() + get_sql_doscente() + get_sql_fucionario_tercerizado() + get_sql_tecnicos_adm()
    

def get_sql_salas():

    
    qtd_reserva = 0
    data_atual = datetime.now()

    sql_sala = "/*\n insere salas */"
    sql_reservas_salas = "/*\n insere reservas das salas */"
    sql_limpezas_salas = "/*\n insere limpezas das salas */"

    for i in range(10):

        sala_especial = "false"
        data_show = "true"
        if i % 2 == 0:
            sala_especial = "true"
            data_show = "false"

        sql_sala += f"""
insert into sala(id_sala, numero, lotacao, tipo_sala, data_show, climatizacao, obs, sala_especial)
    values ({i+1}, {i+1}, {i+10}, null, {data_show}, {data_show}, null, {sala_especial});
        """
        
        #criar reservas para essa sala 
        sql_reserva = ""
        for j in range(5):

            horario_inicio = str(data_atual + timedelta(hours=j))[0:19]
            horario_fim = str(data_atual + timedelta(hours=3+j))[0:19]

            sql_reserva += f"""
insert into reserva(id_reserva, id_sala, motivo_reserva, recursos_adicionais, horario_inicio, horario_fim,  token_reserva, confirmado)
    values ({qtd_reserva+1}, {i+1}, null, null, '{horario_inicio}', '{horario_fim}', null, true);

insert into reserva_responsavel(id_reserva, responsavel) values ({qtd_reserva+1}, '{get_responsavel_valido(qtd_reserva)}');
"""
            qtd_reserva += 1
        
        #criar limpezas para essa sala
        for k in range(30):

            horario = str(data_atual + timedelta(days=k) + timedelta(hours=i))[0:19]
            sql_limpezas_salas += f"""
insert into limpeza_manutencao(cpf_funcionario, id_sala, data_hora) values ('{get_fucionario(k)}', {i+1}, '{horario}');
            """

        sql_reservas_salas += sql_reserva
            
    return sql_sala + sql_reservas_salas + sql_limpezas_salas

    
def get_responsavel_valido(posicao):

    responsaveis = []
    for i in range(10,20):
        responsaveis.append(f"email{i+1}@email.com")

    return get_de_lista_circular(responsaveis, posicao)

def get_fucionario(posicao):

    funcionarios = []
    for i in range(20,30):
        funcionarios.append(f"0000000{i+1}")

    return get_de_lista_circular(funcionarios, posicao)



if __name__ == "__main__":

    sql_usuarios = cria_sql_usuarios()
    sql_salas = get_sql_salas()

    with open("insere_tuplas.sql", "w") as sql_file:
        sql_file.write("use sistema_reserva_salas_db;\n"+sql_usuarios+sql_salas)

