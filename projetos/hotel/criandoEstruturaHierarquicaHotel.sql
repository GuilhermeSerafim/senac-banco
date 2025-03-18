
CREATE TABLE ANDAR 
    ( 
     Numero_Andar      SMALLINT  NOT NULL , 
     ID                NUMBER  NOT NULL , 
     Quantidade_Suites NUMBER  NOT NULL , 
     Status            VARCHAR2 (40) 
    ) 
;

ALTER TABLE ANDAR 
    ADD CONSTRAINT ANDAR_PK PRIMARY KEY ( Numero_Andar ) ;

CREATE TABLE HOTEL 
    ( 
     ID         NUMBER  NOT NULL , 
     LOCALIDADE VARCHAR2 (60)  NOT NULL , 
     NOME       VARCHAR2 (60)  NOT NULL , 
     CNPJ       CHAR (14)  NOT NULL , 
     ENDERECO   VARCHAR2 (60)  NOT NULL , 
     CAPACIDADE SMALLINT  NOT NULL , 
     EMAIL      VARCHAR2 (60)  NOT NULL , 
     TELEFONE   VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE HOTEL 
    ADD CONSTRAINT HOTEL_PK PRIMARY KEY ( ID ) ;

CREATE TABLE QUARTOS 
    ( 
     ID_Quarto     NUMBER , 
     Numero_Quarto NUMBER , 
     ID_Suite      NUMBER  NOT NULL 
    ) 
;

CREATE TABLE SUITES 
    ( 
     ID_Suite     NUMBER  NOT NULL , 
     Numero_Suite NUMBER , 
     Tipo_Suite   VARCHAR2 (60) , 
     Capacidade   NUMBER , 
     Preço_Diaria NUMBER (10,2) , 
     Status       VARCHAR2 (60) , 
     Tamanho      VARCHAR2 (60) , 
     Comodidades  VARCHAR2 (60) , 
     Numero_Andar SMALLINT  NOT NULL 
    ) 
;

ALTER TABLE SUITES 
    ADD CONSTRAINT SUITES_PK PRIMARY KEY ( ID_Suite ) ;

ALTER TABLE ANDAR 
    ADD CONSTRAINT ANDAR_HOTEL_FK FOREIGN KEY 
    ( 
     ID
    ) 
    REFERENCES HOTEL 
    ( 
     ID
    ) 
;

ALTER TABLE QUARTOS 
    ADD CONSTRAINT QUARTOS_SUITES_FK FOREIGN KEY 
    ( 
     ID_Suite
    ) 
    REFERENCES SUITES 
    ( 
     ID_Suite
    ) 
;

ALTER TABLE SUITES 
    ADD CONSTRAINT SUITES_ANDAR_FK FOREIGN KEY 
    ( 
     Numero_Andar
    ) 
    REFERENCES ANDAR 
    ( 
     Numero_Andar
    ) 
;
