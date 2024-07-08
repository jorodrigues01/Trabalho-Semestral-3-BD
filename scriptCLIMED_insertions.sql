# Populando a base de dados
INSERT INTO db_climed.paciente (IdPac, CPF, Nome, Telefone, Endereco, Idade, Sexo) VALUES
(1, 12345678901, 'Diego Pituca', '(11) 55555-5555', 'Rua A, 123', 35, 'M'),
(2, 23456789012, 'Maria', '(11) 66666-6666', 'Rua B, 456', 45, 'F'),
(3, 34567890123, 'Paulo', '(11) 77777-7777', 'Rua C, 789', 25, 'M'),
(4, 45678901234, 'Luísa', '(11) 88888-8888', 'Rua D, 012', 55, 'F'),
(5, 56789012345, 'Ana', '(11) 99999-9999', 'Rua E, 345', 30, 'F'),
(6, 67890123456, 'João', '(12) 10101-0101', 'Rua F, 678', 40, 'M'),
(7, 78901234567, 'Fernanda', '(13) 20202-0202', 'Rua G, 901', 29, 'F'),
(8, 89012345678, 'Carlos', '(14) 30303-0303', 'Rua H, 234', 38, 'M'),
(9, 90123456789, 'Juliana', '(15) 40404-0404', 'Rua I, 567', 27, 'F'),
(10, 12345098765, 'Rafael', '(16) 50505-0505', 'Rua J, 890', 33, 'M'),
(11, 23456109876, 'Bruna', '(17) 60606-0606', 'Rua K, 123', 26, 'F'),
(12, 34567210987, 'Gustavo', '(18) 70707-0707', 'Rua L, 456', 48, 'M'),
(13, 45678321098, 'Camila', '(19) 80808-0808', 'Rua M, 789', 31, 'F'),
(14, 56789432109, 'Vinicius', '(20) 90909-0909', 'Rua N, 012', 52, 'M'),
(15, 67890543210, 'Larissa', '(21) 11111-1111', 'Rua O, 345', 24, 'F'),
(16, 78901654321, 'Ricardo', '(22) 22222-2222', 'Rua P, 678', 47, 'M'),
(17, 89012765432, 'Mariana', '(23) 33333-3333', 'Rua Q, 901', 36, 'F'),
(18, 90123876543, 'Felipe', '(24) 44444-4444', 'Rua R, 234', 39, 'M'),
(19, 12345987654, 'Sabrina', '(25) 55555-5555', 'Rua S, 567', 28, 'F'),
(20, 23456098765, 'Thiago', '(26) 66666-6666', 'Rua T, 890', 41, 'M'),
(21, 34567109876, 'Letícia', '(27) 77777-7777', 'Rua U, 123', 34, 'F'),
(22, 45678210987, 'Pedro', '(28) 88888-8888', 'Rua V, 456', 37, 'M'),
(23, 56789321098, 'Aline', '(29) 99999-9999', 'Rua W, 789', 32, 'F'),
(24, 67890432109, 'Igor', '(30) 12121-1212', 'Rua X, 012', 53, 'M'),
(25, 78901543210, 'Roberta', '(31) 23232-2323', 'Rua Y, 345', 29, 'F'),
(26, 89012654321, 'Marcelo', '(32) 34343-3434', 'Rua Z, 678', 45, 'M'),
(27, 90123765432, 'Beatriz', '(33) 45454-4545', 'Rua AA, 901', 25, 'F'),
(28, 12345876543, 'Eduardo', '(34) 56565-5656', 'Rua BB, 234', 42, 'M'),
(29, 23456987654, 'Patrícia', '(35) 67676-6767', 'Rua CC, 567', 27, 'F'),
(30, 34567098765, 'Fernando', '(36) 78787-7878', 'Rua DD, 890', 46, 'M');

INSERT INTO Medico (CRM, Nome, Sobrenome, Telefone, Percentual) VALUES
(123456, 'Gregory', 'House', '(11) 91234-5678', 80),
(234567, 'Maria', 'Santos', '(11) 98765-4321', 75),
(345678, 'Carlos', 'Oliveira', '(11) 99999-9999', 90),
(456789, 'Ana', 'Ferreira', '(11) 87654-3210', 85),
(567890, 'Pedro', 'Almeida', '(11) 11111-1111', 70),
(678901, 'Luiza', 'Silva', '(12) 22334-5567', 85),
(789012, 'Fernando', 'Costa', '(13) 33445-6678', 80),
(890123, 'Juliana', 'Lima', '(14) 44556-7789', 75),
(901234, 'Marcos', 'Pereira', '(15) 55667-8890', 90),
(123457, 'Paula', 'Rodrigues', '(16) 66778-9901', 95),
(234568, 'Ricardo', 'Martins', '(17) 77889-1012', 88),
(345679, 'Sabrina', 'Gomes', '(18) 88990-2123', 92),
(456780, 'Gustavo', 'Fernandes', '(19) 99001-3234', 70),
(567891, 'Camila', 'Ramos', '(20) 10112-4345', 85),
(678902, 'João', 'Souza', '(21) 11223-5456', 75),
(789013, 'Vanessa', 'Barbosa', '(22) 22334-6567', 78),
(890124, 'Tiago', 'Mendes', '(23) 33445-7678', 82),
(901235, 'Beatriz', 'Nunes', '(24) 44556-8789', 90),
(123458, 'Rodrigo', 'Carvalho', '(25) 55667-9890', 80),
(234569, 'Patrícia', 'Oliveira', '(26) 66778-0911', 85),
(345680, 'Henrique', 'Santos', '(27) 77889-1022', 75),
(456791, 'Marcela', 'Correia', '(28) 88990-2133', 88),
(567902, 'Vitor', 'Vieira', '(29) 99001-3244', 82),
(678913, 'Aline', 'Dias', '(30) 10112-4355', 95),
(789024, 'Rafael', 'Cardoso', '(31) 11223-5466', 90),
(890135, 'Fernanda', 'Silveira', '(32) 22334-6577', 78),
(901246, 'Bruno', 'Rocha', '(33) 33445-7688', 85),
(123469, 'Letícia', 'Borges', '(34) 44556-8799', 75),
(234570, 'Adriana', 'Teixeira', '(35) 55667-9900', 88),
(345681, 'Gabriel', 'Batista', '(36) 66778-0011', 90),
(456792, 'Eliane', 'Freitas', '(37) 77889-1122', 80);

INSERT INTO Especialidade (IdEsp, Nome, Indice) VALUES
(1, 'Dermatologia', 'IND_DERM'),
(2, 'Oncologia', 'IND_ONCO'),
(3, 'Oftalmologista', 'IND_OFTAL'),
(4, 'Cardiologia', 'IND_CARDIO'),
(5, 'Neurologia', 'IND_NEURO'),
(6, 'Pediatria', 'IND_PED'),
(7, 'Ortopedia', 'IND_ORTO'),
(8, 'Ginecologia', 'IND_GINECO'),
(9, 'Endocrinologia', 'IND_ENDOCRINO'),
(10, 'Gastroenterologia', 'IND_GASTRO'),
(11, 'Urologia', 'IND_URO'),
(12, 'Psiquiatria', 'IND_PSIQUI'),
(13, 'Reumatologia', 'IND_REUMA'),
(14, 'Infectologia', 'IND_INFECTO'),
(15, 'Nefrologia', 'IND_NEFR'),
(16, 'Pneumologia', 'IND_PNEUMO'),
(17, 'Hematologia', 'IND_HEMATO'),
(18, 'Otorrinolaringologia', 'IND_OTORRINO'),
(19, 'Angiologia', 'IND_ANGIO'),
(20, 'Hepatologia', 'IND_HEPATO'),
(21, 'Mastologia', 'IND_MASTO'),
(22, 'Radiologia', 'IND_RADIO'),
(23, 'Nutrição', 'IND_NUTRI'),
(24, 'Fisiatria', 'IND_FISIATRIA'),
(25, 'Geriatria', 'IND_GERIA'),
(26, 'Alergologia', 'IND_ALERGO'),
(27, 'Imunologia', 'IND_IMUNO'),
(28, 'Medicina do Trabalho', 'IND_TRAB'),
(29, 'Medicina Esportiva', 'IND_ESPORT'),
(30, 'Medicina de Família', 'IND_FAMILIA');

INSERT INTO ExerceEsp (CRM, IdEsp) VALUES
(123456, 1),
(234567, 2),
(345678, 3),
(456789, 1),
(567890, 2),
(123456, 4),
(234567, 5),
(345678, 6),
(456789, 7),
(567890, 8),
(678901, 1),
(789012, 2),
(890123, 3),
(901234, 4),
(123457, 5),
(234568, 6),
(345679, 7),
(456780, 8),
(567891, 1),
(678902, 2),
(789013, 3),
(890124, 4),
(901235, 5),
(123458, 6),
(234569, 7),
(345680, 8),
(456791, 1),
(567902, 2),
(678913, 3),
(789024, 4),
(890135, 5),
(901246, 6),
(123469, 7),
(234570, 8),
(345681, 1),
(456792, 2);

INSERT INTO Doenca (IdDoenca, Nome) VALUES
(1, 'Dengue'),
(2, 'Malária'),
(3, 'Linfoma'),
(4, 'Diabetes'),
(5, 'Hipertensão'),
(6, 'Asma'),
(7, 'Bronquite'),
(8, 'Pneumonia'),
(9, 'Hepatite'),
(10, 'Tuberculose'),
(11, 'Gripe'),
(12, 'Varíola'),
(13, 'Zika'),
(14, 'Chikungunya'),
(15, 'AIDS'),
(16, 'Sarampo'),
(17, 'Rubéola'),
(18, 'Catapora'),
(19, 'Covid-19'),
(20, 'Meningite'),
(21, 'Ebola'),
(22, 'Febre Amarela'),
(23, 'Leishmaniose'),
(24, 'Toxoplasmose'),
(25, 'Herpes'),
(26, 'Sífilis'),
(27, 'Gonorreia'),
(28, 'Câncer de Mama'),
(29, 'Câncer de Pulmão'),
(30, 'Câncer de Próstata');

INSERT INTO Consulta (CRM, IdEsp, IdPac, Dia, HoraInicioCon, HoraFimCon, Pagou, ValorPago, FormaPagamento) VALUES
(123456, 1, 1, '2024-05-01', '09:00:00', '09:30:00', TRUE, 150.00, 'Crédito'),
(234567, 2, 2, '2024-05-02', '10:00:00', '10:30:00', TRUE, 200.00, 'Débito'),
(345678, 3, 3, '2024-05-03', '11:00:00', '11:30:00', TRUE, 180.00, 'Boleto'),
(456789, 1, 4, '2024-05-04', '12:00:00', '12:30:00', TRUE, 160.00, 'Pix'),
(567890, 2, 5, '2024-05-05', '13:00:00', '13:30:00', TRUE, 170.00, 'Débito'),
(678901, 1, 2, '2024-06-01', '08:30:00', '09:30:00', TRUE, 170.00, 'Crédito'),
(789012, 2, 3, '2024-06-02', '09:00:00', '10:00:00', TRUE, 180.00, 'Débito'),
(890123, 3, 4, '2024-06-03', '09:30:00', '10:30:00', FALSE, 190.00, 'Boleto'),
(901234, 1, 5, '2024-06-04', '10:00:00', '11:00:00', TRUE, 200.00, 'Pix'),
(123457, 2, 6, '2024-06-05', '10:30:00', '11:30:00', FALSE, 210.00, 'Crédito'),
(234568, 3, 7, '2024-06-06', '11:00:00', '12:00:00', TRUE, 220.00, 'Débito'),
(345679, 1, 8, '2024-06-07', '11:30:00', '12:30:00', TRUE, 230.00, 'Boleto'),
(456780, 2, 9, '2024-06-08', '12:00:00', '13:00:00', FALSE, 240.00, 'Pix'),
(567891, 3, 10, '2024-06-09', '12:30:00', '13:30:00', TRUE, 250.00, 'Crédito'),
(678902, 1, 11, '2024-06-10', '13:00:00', '14:00:00', FALSE, 260.00, 'Débito'),
(789013, 2, 12, '2024-06-11', '13:30:00', '14:30:00', TRUE, 270.00, 'Boleto'),
(890124, 3, 13, '2024-06-12', '14:00:00', '15:00:00', TRUE, 280.00, 'Pix'),
(901235, 1, 14, '2024-06-13', '14:30:00', '15:30:00', FALSE, 290.00, 'Crédito'),
(123458, 2, 15, '2024-06-14', '15:00:00', '16:00:00', TRUE, 300.00, 'Débito'),
(234569, 3, 16, '2024-06-15', '15:30:00', '16:30:00', TRUE, 310.00, 'Boleto'),
(345680, 1, 17, '2024-06-16', '16:00:00', '17:00:00', FALSE, 320.00, 'Pix'),
(456791, 2, 18, '2024-06-17', '16:30:00', '17:30:00', TRUE, 330.00, 'Crédito'),
(567902, 3, 19, '2024-06-18', '17:00:00', '18:00:00', TRUE, 340.00, 'Débito'),
(678913, 1, 20, '2024-06-19', '08:00:00', '09:00:00', FALSE, 150.00, 'Boleto'),
(789024, 2, 21, '2024-06-20', '08:30:00', '09:30:00', TRUE, 160.00, 'Pix'),
(890135, 3, 22, '2024-06-21', '09:00:00', '10:00:00', TRUE, 170.00, 'Crédito'),
(901246, 1, 23, '2024-06-22', '09:30:00', '10:30:00', FALSE, 180.00, 'Débito'),
(123469, 2, 24, '2024-06-23', '10:00:00', '11:00:00', TRUE, 190.00, 'Boleto'),
(234570, 3, 25, '2024-06-24', '10:30:00', '11:30:00', TRUE, 200.00, 'Pix'),
(345681, 1, 26, '2024-06-25', '11:00:00', '12:00:00', FALSE, 210.00, 'Crédito'),
(456792, 2, 27, '2024-06-26', '11:30:00', '12:30:00', TRUE, 220.00, 'Débito');

INSERT INTO Diagnostico (IdDiagnostico, TratamentoRecomendado, RemediosReceitados, Observacoes, IdCon) VALUES
(1, 'Repouso e hidratação', 'Paracetamol', 'Sem observações', 1),
(2, 'Quimioterapia', 'Prednisona', 'Paciente em estágio avançado', 2),
(3, 'Cirurgia', NULL, 'Agendar consulta com cirurgião', 3),
(4, 'Medicação oral', 'Ibuprofeno', 'Paciente alérgico a amoxicilina', 4),
(5, 'Radioterapia', 'Dexametasona', 'Sem observações', 5),
(6, 'Fisioterapia', 'Diclofenaco', 'Sessões 3x por semana', 6),
(7, 'Internação', 'Amoxicilina', 'Monitorar temperatura', 7),
(8, 'Dieta controlada', 'Metformina', 'Revisar após 3 meses', 8),
(9, 'Descanso e líquidos', 'Dipirona', 'Acompanhar sintomas', 9),
(10, 'Antibiótico', 'Cefalexina', 'Verificar reação alérgica', 10),
(11, 'Vacinação', 'Nenhum', 'Vacinação em dia', 11),
(12, 'Terapia antiviral', 'Oseltamivir', 'Paciente idoso', 12),
(13, 'Controle de glicemia', 'Insulina', 'Monitoramento diário', 13),
(14, 'Redução de sal', 'Losartana', 'Aferir pressão semanalmente', 14),
(15, 'Inalação', 'Salbutamol', 'Usar espaçador', 15),
(16, 'Antitérmico', 'Paracetamol', 'Febre persistente', 16),
(17, 'Suplementação', 'Vitamina D', 'Verificar níveis em 6 meses', 17),
(18, 'Higiene oral', 'Clorexidina', 'Uso diário', 18),
(19, 'Exercícios respiratórios', 'Nenhum', 'Sessões diárias', 19),
(20, 'Cirurgia', 'Nenhum', 'Preparar pré-operatório', 20),
(21, 'Hidratação intravenosa', 'Soro fisiológico', 'Paciente desidratado', 21),
(22, 'Imunoterapia', 'Pembrolizumab', 'Revisar resposta imunológica', 22),
(23, 'Terapia hormonal', 'Tamoxifeno', 'Monitorar efeitos colaterais', 23),
(24, 'Desbridamento', 'Nenhum', 'Troca de curativos', 24),
(25, 'Transfusão sanguínea', 'Nenhum', 'Verificar compatibilidade', 25),
(26, 'Antimicótico', 'Fluconazol', 'Verificar função hepática', 26),
(27, 'Controle de peso', 'Orlistat', 'Acompanhamento nutricional', 27),
(28, 'Exercícios físicos', 'Nenhum', 'Programa personalizado', 28),
(29, 'Psicoterapia', 'Nenhum', 'Sessões semanais', 29),
(30, 'Vacina antitetânica', 'Nenhum', 'Revisar em 10 anos', 30);

INSERT INTO Diagnostica (IdDiagnostico, IdDoenca) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2),
(6, 4),
(7, 5),
(8, 6),
(9, 7),
(10, 8),
(11, 9),
(12, 10),
(13, 11),
(14, 1),
(15, 12),
(16, 2),
(17, 13),
(18, 3),
(19, 14),
(20, 4),
(21, 15),
(22, 5),
(23, 16),
(24, 6),
(25, 17),
(26, 7),
(27, 18),
(28, 8),
(29, 19),
(30, 9);
