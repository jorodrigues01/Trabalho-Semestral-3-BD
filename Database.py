import mysql.connector
import pandas as pd
from tkinter import *

class Database:
    def __init__(self):
        self.connection = mysql.connector.connect(user='root',
                                                  password='',
                                                  host='localhost',
                                                  database='db_climed')
        self.resultadoQuery = None


    def todasConsultas(self):
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
        INSERT INTO Consulta (CRM, IdEsp, IdPac, Dia, HoraInicioCon, HoraFimCon, Pagou, ValorPago, FormaPagamento) 
        VALUES({medico}, {especialidade}, {paciente}, {dia}, {hInicio}, {hFim}, {pago}, {total}, {tipoPagamento});
        '''

        self.resultadoQuery = pd.read_sql(query, self.connection)

        if not self.resultadoQuery.empty:
            return self.resultadoQuery.to_string(index=False)

        return
