-- Physical hierarchical structure

-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-03-15 17:31:10 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE AreaVendas 
    ( 
     CdArea       INTEGER  NOT NULL , 
     CdTerritorio INTEGER  NOT NULL 
    ) 
;

ALTER TABLE AreaVendas 
    ADD CONSTRAINT AreaVendas_PK PRIMARY KEY ( CdArea ) ;

CREATE TABLE Distrito_de_vendas 
    ( 
     CdDistrito INTEGER  NOT NULL , 
     CdRegiao   INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Distrito_de_vendas 
    ADD CONSTRAINT Distrito_de_vendas_PK PRIMARY KEY ( CdDistrito ) ;

CREATE TABLE Funcionario 
    ( 
     CdFuncionario INTEGER  NOT NULL , 
     CdArea        INTEGER  NOT NULL , 
     Tipo          VARCHAR2 (100)  NOT NULL , 
     Quota         NUMBER (10,2) 
    ) 
;

ALTER TABLE Funcionario 
    ADD CONSTRAINT Funcionario_PK PRIMARY KEY ( CdFuncionario ) ;

CREATE TABLE Região_de_vendas 
    ( 
     CdRegiao INTEGER  NOT NULL 
    ) 
;

CREATE TABLE Território_de_Vendas 
    ( 
     CdTerritorio INTEGER  NOT NULL , 
     CdDistrito   INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Território_de_Vendas 
    ADD CONSTRAINT Território_de_Vendas_PK PRIMARY KEY ( CdTerritorio ) ;



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              4
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
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
-- CREATE SEQUENCE                          0
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
-- ERRORS                                   0
-- WARNINGS                                 0
-- ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Physical recursive structure
