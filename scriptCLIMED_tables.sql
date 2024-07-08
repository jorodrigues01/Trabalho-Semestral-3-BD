DROP SCHEMA IF EXISTS db_climed;

# Criação do schema
CREATE SCHEMA Db_CLIMED;

# Criação das tabelas
CREATE TABLE Db_CLIMED.Medico (
    CRM INT PRIMARY KEY,
    Nome CHAR(50) NOT NULL,
    Sobrenome CHAR(50) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Percentual INT NOT NULL,

    CONSTRAINT CK_Percentual CHECK ( Percentual <= 100 AND Percentual >= 0)
);

CREATE TABLE Db_CLIMED.Paciente (
    IdPac INT PRIMARY KEY,
    CPF BIGINT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Telefone VARCHAR(20),
    Endereco VARCHAR(50) NOT NULL,
    Idade INT NOT NULL,
    Sexo CHAR(5) NOT NULL
);

CREATE TABLE Db_CLIMED.Especialidade (
    IdEsp INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Indice VARCHAR(50)
);

CREATE TABLE Db_CLIMED.ExerceEsp (
    CRM INT,
    IdEsp INT,
    PRIMARY KEY (CRM, IdEsp),
    FOREIGN KEY (CRM) REFERENCES Medico(CRM) ON DELETE CASCADE,
    FOREIGN KEY (IdEsp) REFERENCES Especialidade(IdEsp) ON DELETE CASCADE
);

CREATE TABLE Db_CLIMED.Consulta (
    IdCon INT AUTO_INCREMENT PRIMARY KEY,
    CRM INT NOT NULL,
    IdEsp INT NOT NULL,
    IdPac INT NOT NULL,
    Dia DATE NOT NULL,
    HoraInicioCon TIME NOT NULL,
    HoraFimCon TIME NOT NULL,
    Pagou BOOLEAN DEFAULT FALSE,
    ValorPago FLOAT,
    FormaPagamento VARCHAR(40),

    FOREIGN KEY (CRM) REFERENCES Medico(CRM) ON DELETE CASCADE,
    FOREIGN KEY (IdEsp) REFERENCES Especialidade(IdEsp) ON DELETE CASCADE,
    FOREIGN KEY (IdPac) REFERENCES Paciente(IdPac) ON DELETE CASCADE,

    CONSTRAINT Horarios_check CHECK ( HoraFimCon > HoraInicioCon )

);

CREATE TABLE Db_CLIMED.Agenda (
    IdAgenda INT AUTO_INCREMENT PRIMARY KEY,
    Dia DATE,
    HoraInicio TIME,
    HoraFim TIME,
    CRM INT,
    IdConsulta INT,

    FOREIGN KEY (CRM) REFERENCES Medico(CRM) ON DELETE CASCADE,
    FOREIGN KEY (IdConsulta) REFERENCES Consulta(IdCon) ON DELETE CASCADE,

    CONSTRAINT CK_Horarios CHECK ( HoraInicio < HoraFim )
);
CREATE INDEX idx_agenda_filter_crm ON Agenda (CRM);
CREATE INDEX idx_agenda_filter_dia ON Agenda (Dia);

CREATE TABLE Db_CLIMED.Diagnostico (
    IdDiagnostico INT PRIMARY KEY,
    TratamentoRecomendado VARCHAR(50) NOT NULL,
    RemediosReceitados VARCHAR(50),
    Observacoes VARCHAR(50),
    IdCon INT NOT NULL,

    FOREIGN KEY (IdCon) REFERENCES Consulta(IdCon) ON DELETE CASCADE
);

CREATE TABLE Db_CLIMED.Doenca (
    IdDoenca INT PRIMARY KEY,
    Nome VARCHAR(50) UNIQUE NOT NULL 
);

CREATE TABLE Db_CLIMED.Diagnostica (
    IdDiagnostico INT,
    IdDoenca INT,

    PRIMARY KEY (IdDiagnostico, IdDoenca),
    FOREIGN KEY (IdDiagnostico) REFERENCES Diagnostico(IdDiagnostico) ON DELETE CASCADE,
    FOREIGN KEY (IdDoenca) REFERENCES Doenca(IdDoenca) ON DELETE CASCADE
);
