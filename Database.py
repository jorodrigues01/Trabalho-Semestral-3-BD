import mysql.connector
import pandas as pd

class Database:
    def __init__(self):
        self.connection = mysql.connector.connect(user='root',
                                                  password='bd24',
                                                  host='localhost',
                                                  database='db_climed')
        self.resultadoQuery = None


    def printaConsultas(self):
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


        self.resultadoQuery = pd.read_sql(query, self.connection)

        if not self.resultadoQuery.empty:
            return self.resultadoQuery.to_string(index=False)




    def printaAgendaPorFiltro(self, opcao, filtro):
        if opcao == 'Medico':
            filtroQuery = f"CRM = {filtro}"
        else:
            filtroQuery = f"Dia = '{filtro}'"

        query = f'''
        SELECT *
        FROM Agenda
        WHERE {filtroQuery}
        '''

        self.resultadoQuery = pd.read_sql(query, self.connection)

        if not self.resultadoQuery.empty:
            return self.resultadoQuery.to_string(index=False)

        return 'Nenhum registro existente!'

