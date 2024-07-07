from tkinter import *
import pandas as pd
import mysql.connector


class tela(Tk):

    def __init__(self):
        Tk.__init__(self)
        #window.geometry("1250x750")
        self.title("CLIMED - Marcação de Consulta")


        self.userInput_frame = Frame(self, width=600, height=250)
        self.userInput_frame.grid(row=0, column=0, padx=50, pady=35)
        self.botaoMarcacao_frame = Frame(self, width=150, height=250)
        self.botaoMarcacao_frame.grid(row=0, column=1, padx=5, pady=30)
        self.agendaInput_frame = Frame(self, width=600, height=250)
        self.agendaInput_frame.grid(row=0, column=2, padx=50, pady=35)
        self.botaoConsultaAgenda_frame = Frame(self, width=150, height=250)
        self.botaoConsultaAgenda_frame.grid(row=0, column=3, padx=5, pady=30)

        texto = Label(self.userInput_frame, text="Aplicação para marcação de consultas \n"
                                       "Preencha os campos abaixo para registrar uma consulta")
        texto.grid(column=0, row=0)

        # Adicionando labels das caixas de texto
        self.medico_label = Label(self.userInput_frame, text='Médico')
        self.medico_label.grid(row=2, column=0)

        self.especialidade_label = Label(self.userInput_frame, text='ID Especialidade')
        self.especialidade_label.grid(row=3, column=0)

        self.paciente_label = Label(self.userInput_frame, text='ID Paciente')
        self.paciente_label.grid(row=4, column=0)

        self.data_label = Label(self.userInput_frame, text='Data')
        self.data_label.grid(row=5, column=0)

        self.horaInicio_label = Label(self.userInput_frame, text='Hora Inicio')
        self.horaInicio_label.grid(row=6, column=0)

        self.horaFim_label = Label(self.userInput_frame, text='Hora Término')
        self.horaFim_label.grid(row=7, column=0)

        self.isPago_label = Label(self.userInput_frame, text='Realizou o pagamento?')
        self.isPago_label.grid(row=8, column=0)

        self.totalConsulta_label = Label(self.userInput_frame, text='Valor Consulta')
        self.totalConsulta_label.grid(row=9, column=0)

        self.tipoPagamento_label = Label(self.userInput_frame, text='Forma de Pagamento')
        self.tipoPagamento_label.grid(row=10, column=0)
        ### adicionar caixa de texto para cada label
        medico_filter = Entry(self.userInput_frame, textvariable=self.medico_label)
        medico_filter.grid(row=2, column=1)

        especialidade_filter = Entry(self.userInput_frame, textvariable=self.especialidade_label)
        especialidade_filter.grid(row=3, column=1)

        paciente_filter = Entry(self.userInput_frame, textvariable=self.paciente_label)
        paciente_filter.grid(row=4, column=1)

        data_filter = Entry(self.userInput_frame, textvariable=self.data_label)
        data_filter.grid(row=5, column=1)

        horaInicio_filter = Entry(self.userInput_frame, textvariable=self.horaInicio_label)
        horaInicio_filter.grid(row=6, column=1)

        horaFim_filter = Entry(self.userInput_frame, textvariable=self.horaFim_label)
        horaFim_filter.grid(row=7, column=1)

        isPago_filter = Listbox(self.userInput_frame, height=1)
        isPago_filter.grid(row=8, column=1, sticky='ns')
        isPago_filter.insert('end', 'False')
        isPago_filter.insert('end', 'True')

        totalConsulta_filter = Entry(self.userInput_frame, textvariable=self.totalConsulta_label)
        totalConsulta_filter.grid(row=9, column=1)

        tipoPagamento_filter = Entry(self.userInput_frame, textvariable=self.tipoPagamento_label)
        tipoPagamento_filter.grid(row=10, column=1)



        botao_1 = Button(self.botaoMarcacao_frame, text="Registrar Consulta", command=self.telaPopup)
        #botao_1.grid(row=2, column=3, pady=5)
        botao_1.grid(row=5, columnspan=5, pady=40)

        self.output = Text(self, state='disabled', height=20, width=150, bg='white')
        self.output.grid(row=7, columnspan=7, padx=50, sticky=S)

    def telaPopup(self):
        popup = Tk()

        self.registraConsulta()

        popup.title('ERRO')
        texto_erro = Label(popup,
                           text='Não é possível registrar consulta! Uma consulta já está marcada para esse horário')
        texto_erro.grid(column=0, row=0)
        botao_close = Button(popup, text='Fechar', command=popup.destroy)
        botao_close.grid(row=1, columnspan=3, pady=5)

        '''
        popup.title('Consulta Marcada')
        texto_erro = Label(popup, text='Consulta registrada com sucesso!')
        texto_erro.grid(column=0, row=0)
        botao_close = Button(popup, text='Fechar', command=popup.destroy)
        botao_close.grid(row=1, columnspan=3, pady=5)
        '''

        popup.mainloop()

    def registraConsulta(self):
        self.output.configure(state='normal')
        self.output.delete("1.0", END)

        self.output.insert(END, 'db.filter_schedule_1(sel_opt, sel_filter)')
        self.output.configure(state='disabled')


tela().mainloop()