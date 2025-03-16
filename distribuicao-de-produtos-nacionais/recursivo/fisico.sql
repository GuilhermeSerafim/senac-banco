-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-03-16 18:16:36 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE Diretor 
    ( 
     CdDiretor                 INTEGER , 
     Funcionario_CdFuncionario INTEGER  NOT NULL 
    ) 
;

CREATE TABLE Funcionario 
    ( 
     CdFuncionario  INTEGER  NOT NULL , 
     CPF            VARCHAR2 (100) , 
     Nome           VARCHAR2 (100) , 
     Funcionario_ID NUMBER  NOT NULL 
    ) 
;

ALTER TABLE Funcionario 
    ADD CONSTRAINT Funcionario_PK PRIMARY KEY ( Funcionario_ID ) ;

ALTER TABLE Funcionario 
    ADD CONSTRAINT Funcionario_CdFuncionario_UN UNIQUE ( CdFuncionario ) ;

CREATE TABLE Gerente 
    ( 
     CdGerente                  UNKNOWN 
--  ERROR: Datatype UNKNOWN is not allowed 
                    , 
     Funcionario_Funcionario_ID NUMBER  NOT NULL 
    ) 
;

CREATE TABLE Unidade_de_vendas 
    ( 
     CdUnidade                   INTEGER  NOT NULL , 
     Unidade_de_vendas_CdUnidade INTEGER , 
     Tipo                        VARCHAR2 (50)  NOT NULL , 
     Nome                        VARCHAR2 (100) 
    ) 
;

ALTER TABLE Unidade_de_vendas 
    ADD 
    CHECK (Tipo IN ('Distrito', 'Região', 'Território', 'Área')) 
;

ALTER TABLE Unidade_de_vendas 
    ADD CONSTRAINT Unidade_de_vendas_PK PRIMARY KEY ( CdUnidade ) ;

CREATE TABLE Vendedor 
    ( 
     CdVendedor                INTEGER , 
     Quota                     NUMBER (10,2) , 
     Funcionario_CdFuncionario INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Diretor 
    ADD CONSTRAINT Diretor_Funcionario_FK FOREIGN KEY 
    ( 
     Funcionario_CdFuncionario
    ) 
    REFERENCES Funcionario 
    ( 
     CdFuncionario
    ) 
;

ALTER TABLE Gerente 
    ADD CONSTRAINT Gerente_Funcionario_FK FOREIGN KEY 
    ( 
     Funcionario_Funcionario_ID
    ) 
    REFERENCES Funcionario 
    ( 
     Funcionario_ID
    ) 
;

-- Error - Foreign Key Unidade_de_vendas_Diretor_FK has no columns

-- Error - Foreign Key Unidade_de_vendas_Gerente_FK has no columns

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Unidade_de_vendas 
    ADD CONSTRAINT Unidade_de_vendas_Unidade_de_vendas_FK FOREIGN KEY 
    ( 
     Unidade_de_vendas_CdUnidade
    ) 
    REFERENCES Unidade_de_vendas 
    ( 
     CdUnidade
    ) 
;

-- Error - Foreign Key Unidade_de_vendas_Vendedor_FK has no columns

ALTER TABLE Vendedor 
    ADD CONSTRAINT Vendedor_Funcionario_FK FOREIGN KEY 
    ( 
     Funcionario_CdFuncionario
    ) 
    REFERENCES Funcionario 
    ( 
     CdFuncionario
    ) 
;

CREATE SEQUENCE Funcionario_Funcionario_ID_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER Funcionario_Funcionario_ID_TRG 
BEFORE INSERT ON Funcionario 
FOR EACH ROW 
WHEN (NEW.Funcionario_ID IS NULL) 
BEGIN 
    :NEW.Funcionario_ID := Funcionario_Funcionario_ID_SEQ.NEXTVAL; 
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              8
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   5
-- WARNINGS                                 0
