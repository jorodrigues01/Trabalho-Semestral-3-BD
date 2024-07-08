-- TRIGGERS e PROCEDURES

DELIMITER $$
DROP PROCEDURE IF EXISTS `validar_horario_consulta`$$
DROP TRIGGER IF EXISTS `validar_horario_consulta_insert`$$
DROP TRIGGER IF EXISTS `validar_horario_consulta_update`$$
DROP TRIGGER IF EXISTS `after_consulta_insert`$$
DROP TRIGGER IF EXISTS `after_consulta_update`$$

-- PROCEDURE que faz a validação da disponibilidade de horario para consultas
CREATE PROCEDURE validar_horario_consulta (IN crmNovo VARCHAR(20), 
										   IN diaNovo DATE, 
                                           IN horaInicioNovo TIME, 
                                           IN horaFimNovo TIME)
BEGIN
	IF EXISTS (
        SELECT 1
        FROM Agenda
        WHERE CRM = crmNovo
        AND Dia = diaNovo
        AND ((horaInicioNovo BETWEEN HoraInicio AND HoraFim)
        OR (horaFimNovo BETWEEN HoraInicio AND HoraFim)
        OR (horaInicioNovo <= HoraInicio AND horaFimNovo >= HoraFim))
        LIMIT 1
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O horário selecionado para consulta está indisponível na agenda do médico.';
    END IF;
END$$

DELIMITER ;

-- TRIGGER para a tabela consulta BEFORE INSERT
DELIMITER $$

CREATE TRIGGER validar_horario_consulta_insert
BEFORE INSERT ON Consulta
FOR EACH ROW
BEGIN
    CALL validar_horario_consulta(NEW.CRM, NEW.Dia, NEW.HoraInicioCon, NEW.HoraFimCon);
END$$

DELIMITER ;

-- TRIGGER para a tabela consulta BEFORE UPDATE
DELIMITER $$

CREATE TRIGGER validar_horario_consulta_update
BEFORE UPDATE ON Consulta
FOR EACH ROW
BEGIN
    CALL validar_horario_consulta(NEW.CRM, NEW.Dia, NEW.HoraInicioCon, NEW.HoraFimCon);
END$$

DELIMITER ;

-- TRIGGER para inserir consulta na Agenda do médico AFTER INSERT em Consulta
DELIMITER $$

CREATE TRIGGER after_consulta_insert
AFTER INSERT ON Consulta
FOR EACH ROW
BEGIN
    CALL validar_horario_consulta(NEW.CRM, NEW.Dia, NEW.HoraInicioCon, NEW.HoraFimCon);
    INSERT INTO Agenda (Dia, HoraInicio, HoraFim, CRM, IdConsulta)
    VALUES (NEW.Dia, NEW.HoraInicioCon, NEW.HoraFimCon, NEW.CRM, NEW.IdCon);
END$$

DELIMITER ;

-- TRIGGER para inserir consulta na Agenda do médico AFTER UPDATE em Consulta
DELIMITER $$

CREATE TRIGGER after_consulta_update
AFTER UPDATE ON Consulta
FOR EACH ROW
BEGIN
    CALL validar_horario_consulta(NEW.CRM, NEW.Dia, NEW.HoraInicioCon, NEW.HoraFimCon);
    INSERT INTO Agenda (Dia, HoraInicio, HoraFim, CRM, IdConsulta)
    VALUES (NEW.Dia, NEW.HoraInicioCon, NEW.HoraFimCon, NEW.CRM, NEW.IdCon);
END$$

DELIMITER ;
