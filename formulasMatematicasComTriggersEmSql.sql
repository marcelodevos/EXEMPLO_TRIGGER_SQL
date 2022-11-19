-- cria o bd exemplo
CREATE DATABASE formulasTrigonometricas;
-- seleciona o banco de dados exemplo
USE formulasTrigonometricas;
-- cria a tabela com as variáveis matemáticas
CREATE TABLE  formula(
	idNumero INT NOT NULL AUTO_INCREMENT,
    numero REAL NULL,
    seno REAL NULL,
    cosseno REAL NULL,
    tangente REAL NULL,
    inversaSeno REAL NULL,
    inversacosseno REAL NULL,
    inversatangente REAL NULL,
    primary key (idNumero),
    CHECK(numero>=-1 AND numero<=1));
-- cria o trigger que calcula as formulas antes de inserir os dados 
CREATE TRIGGER tr_formula BEFORE INSERT
ON formula
FOR EACH ROW
SET NEW.seno = (SIN(NEW.numero)),
    NEW.cosseno = (COS(NEW.numero)),
    NEW.tangente = (TAN(NEW.numero)),
    NEW.inversaSeno = (ASIN(NEW.numero)),
    NEW.inversacosseno = (ACOS(NEW.numero)),
    NEW. inversatangente = (ATAN(NEW.numero));
-- insere o número de exemplo (o qual está restrito a -1 até um por causa da restrição check
-- da variável número - ver tabela fórmula)
INSERT INTO formula(numero) VALUES (0.707);
-- comando para mostrar a tabela
SELECT * FROM formula;