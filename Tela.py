from tkinter import *
from Database import Database

dbase = Database()

class tela(Tk):
    def __init__(self):
        Tk.__init__(self)
        #window.geometry("1250x750")
        self.title("CLIMED - Marcação de Consulta")
        self.texto = Label(self, text="Aplicação para marcação de consultas na clínica CLIMED")
        self.texto.grid(row=0, column=0)

        ### Frame Inputs Consutla
        self.userInput_frame = Frame(self, width=600, height=250)
        self.userInput_frame.grid(row=1, column=0, padx=50, pady=35)

        self.textoConsulta = Label(self.userInput_frame, text="Preencha os campos abaixo para registrar uma consulta")
        self.textoConsulta.grid(row=0, column=0)

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
        self.medico_filter = Entry(self.userInput_frame, textvariable=self.medico_label)
        self.medico_filter.grid(row=2, column=1)

        self.especialidade_filter = Entry(self.userInput_frame, textvariable=self.especialidade_label)
        self.especialidade_filter.grid(row=3, column=1)

        self.paciente_filter = Entry(self.userInput_frame, textvariable=self.paciente_label)
        self.paciente_filter.grid(row=4, column=1)

        self.data_filter = Entry(self.userInput_frame, textvariable=self.data_label)
        self.data_filter.grid(row=5, column=1)

        self.horaInicio_filter = Entry(self.userInput_frame, textvariable=self.horaInicio_label)
        self.horaInicio_filter.grid(row=6, column=1)

        self.horaFim_filter = Entry(self.userInput_frame, textvariable=self.horaFim_label)
        self.horaFim_filter.grid(row=7, column=1)

        self.isPago_filter = Entry(self.userInput_frame, textvariable=self.isPago_label)
        self.isPago_filter.grid(row=8, column=1)

        self.totalConsulta_filter = Entry(self.userInput_frame, textvariable=self.totalConsulta_label)
        self.totalConsulta_filter.grid(row=9, column=1)

        self.tipoPagamento_filter = Entry(self.userInput_frame, textvariable=self.tipoPagamento_label)
        self.tipoPagamento_filter.grid(row=10, column=1)

        ### Frame Botoes
        self.botaoMarcacao_frame = Frame(self, width=150, height=250)
        self.botaoMarcacao_frame.grid(row=1, column=1, padx=5, pady=30)

        self.botao_1 = Button(self.botaoMarcacao_frame, text='Registrar Consulta', command=self.registraConsulta)
        self.botao_1.grid(row=6, columnspan=5, pady=10)
        self.botao_2 = Button(self.botaoMarcacao_frame, text='Exibir todas as Consultas', command=self.exibeTabelaConsulta)
        self.botao_2.grid(row=7, columnspan=5)

        ### Frame Input Agenda
        self.agendaInput_frame = Frame(self, width=600, height=250)
        self.agendaInput_frame.grid(row=1, column=2, padx=50, pady=35)

        self.textoAgenda = Label(self.agendaInput_frame, text='Consultar Agenda')
        self.textoAgenda.grid(row=0, column=0)

        listaOpcoes = ['Medico', 'Dia']
        self.opcaoSelect = StringVar(self.agendaInput_frame)
        self.opcaoSelect.set("Selecione o filtro")
        self.opcoes = OptionMenu(self.agendaInput_frame, self.opcaoSelect, *listaOpcoes)
        self.opcoes.grid(row=2, column=0, pady=40, padx=20)
        self.pesquisa_filter = Entry(self.agendaInput_frame)
        self.pesquisa_filter.grid(row=2, column=1)

        ### Frame Botao Agenda
        self.botaoConsultaAgenda_frame = Frame(self, width=150, height=250)
        self.botaoConsultaAgenda_frame.grid(row=1, column=3, padx=5, pady=30)

        botao_3 = Button(self.botaoConsultaAgenda_frame, text="Consultar", command=self.buscaAgendaPorFiltro)
        botao_3.grid(row=6, column=0, pady=20)

        ### Campo output
        self.output = Text(self, state='disabled', height=20, width=180, bg='white')
        self.output.grid(row=7, columnspan=7, padx=50, sticky=S)

    def telaPopup(self):
        popup = Tk()

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

    def exibeTabelaConsulta(self):
        self.output.configure(state='normal')
        self.output.delete("1.0", END)
        self.output.insert(END, dbase.printaConsultas())
        self.output.configure(state='disabled')

    def registraConsulta(self):
        self.output.configure(state='normal')
        self.output.delete("1.0", END)

        medicoValue = self.medico_filter.get()
        especialidadeValue = self.especialidade_filter.get()
        pacienteValue = self.paciente_filter.get()
        dataValue = self.data_filter.get()
        horaInicioValue = self.horaInicio_filter.get()
        horaFimValue = self.horaFim_filter.get()
        isPagoValue = self.isPago_filter.get()
        totalConsultaValue = self.totalConsulta_filter.get()
        tipoPagamentoValue = self.tipoPagamento_filter.get()

        self.output.insert(END, dbase.registraConsulta(medicoValue, especialidadeValue, pacienteValue,
                                                       dataValue, horaInicioValue, horaFimValue,
                                                       totalConsultaValue, tipoPagamentoValue, isPagoValue))
        self.output.configure(state='disabled')

        self.medico_filter.delete(0, END)
        self.especialidade_filter.delete(0, END)
        self.paciente_filter.delete(0, END)
        self.data_filter.delete(0, END)
        self.horaInicio_filter.delete(0, END)
        self.horaFim_filter.delete(0, END)
        self.isPago_filter.delete(0, END)
        self.totalConsulta_filter.delete(0, END)
        self.tipoPagamento_filter.delete(0, END)

    def buscaAgendaPorFiltro(self):
        self.output.configure(state='normal')
        self.output.delete("1.0", END)
        opcaoValue = self.opcaoSelect.get()
        filtroValue = self.pesquisa_filter.get()
        self.output.insert(END, dbase.printaAgendaPorFiltro(opcaoValue, filtroValue))
        self.output.configure(state='disabled')
        self.pesquisa_filter.delete(0, END)

tela().mainloop()