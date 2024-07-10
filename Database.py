import _mysql_connector
import mysql.connector
import pandas as pd
import logging

logging.basicConfig(level=logging.INFO)

class Database:
    def __init__(self):
        self.connection = mysql.connector.connect(user='root',
                                                  password='bd24',
                                                  host='localhost',
                                                  database='db_climed')
        self.resultadoQuery = None

    def exibeConsultas(self):
        query = '''
        SELECT * FROM db_climed.consulta;
        '''

        self.resultadoQuery = pd.read_sql(query, self.connection)

        return self.resultadoQuery.to_string(index=False)

    def registraConsulta(self, medico, especialidade, paciente, dia, hInicio, hFim, total, tipoPagamento, pago='False'):
        for campo in [medico, especialidade, paciente, dia, hInicio, hFim, total, tipoPagamento]:
            if campo == '':
                return 'Certifique-se de preencher todos os campos!'

        query = f'''
        INSERT INTO Consulta (CRM, IdEsp, IdPac, Dia, HoraInicioCon, HoraFimCon, Pagou, ValorPago, FormaPagamento) VALUES 
        ({medico}, {especialidade}, {paciente}, '{dia}', '{hInicio}', '{hFim}', {pago}, {total}, '{tipoPagamento}');
        '''

        try:
            self.resultadoQuery = pd.read_sql(query, self.connection)
        except (_mysql_connector.MySQLInterfaceError, mysql.connector.errors.DatabaseError,
                pd.errors.DatabaseError) as e:
            # Printando no console o log da exceção
            logging.error(f'Falha na sintaxe da query: {e}')

            # Analise da mensagem da exceção para diferenciar o caso de erro
            errorMessage = str(e)

            if '1644 (45000)' in errorMessage:
                return 'O horário selecionado para consulta está indisponível na agenda do médico.'
            elif '1452 (23000)' in errorMessage:
                erro_FK = {
                    'CRM': 'Médico (CRM) não existe na base de dados',
                    'IdEsp': 'Especialidade (ID Especialidade) não existe na base de dados',
                    'IdPac': 'Paciente (ID Paciente) não existe na base de dados'
                }
                return (
                    erro_FK['CRM'] if 'consulta_ibfk_1' in errorMessage else
                    erro_FK['IdEsp'] if 'consulta_ibfk_2' in errorMessage else
                    erro_FK['IdPac']
                )
            elif '1292 (22007)' in errorMessage:
                erro_DataHora = {
                    'Data': 'Formato de Data/Hora incorreta, utilize o formato (AAAA-MM-DD) para data',
                    'Hora': 'Formato de Data/Hora incorreta, utilize o formato (HH:MM) para hora'
                }
                return (
                    erro_DataHora['Data'] if 'Incorrect date value' in errorMessage else
                    erro_DataHora['Hora']
                )
            elif '3819 (HY000)' in errorMessage:
                return 'Horário para o início da consulta é depois do horário de término'
            else:
                return 'Erro de digitação em um dos campos!'

        except TypeError as e:
            # Uma exceção TypeError é lançada quando a inserção é bem sucedida devido a um parâmetro do método pd.read_sql
            return 'Consulta registrada com sucesso!'

    def exibeAgendaPorFiltro(self, opcao, filtro):
        # Verificação do tipo de filtro da agenda
        if opcao == 'Selecione o filtro' or filtro == '':
            return 'Certifique-se de que os campos estão preenchidos corretamente!'
        elif opcao == 'Medico':
            filtroQuery = f'CRM = {filtro}'
        elif opcao == 'Dia':
            filtroQuery = f"Dia = '{filtro}'"
        else:
            filtroQuery = f'IdConsulta = {filtro}'

        query = f'''
        SELECT *
        FROM Agenda
        WHERE {filtroQuery}
        '''

        try:
            self.resultadoQuery = pd.read_sql(query, self.connection)
        except (_mysql_connector.MySQLInterfaceError, mysql.connector.errors.DatabaseError,
                mysql.connector.errors.ProgrammingError, pd.errors.DatabaseError) as e:
            # Printando no console o log da exceção
            logging.error(f'Falha na sintaxe da query: {e}')
            errorMessage = str(e)

            if '1525 (HY000)' in errorMessage:
                return 'Formato de Data/Hora incorreta, utilize o formato (AAAA-MM-DD) para data'
            else:
                return 'Campo filtro com entrada incorreta'

        if not self.resultadoQuery.empty:
            return self.resultadoQuery.to_string(index=False)

        return f'Nenhum registro existente para o filtro {filtro}!'
