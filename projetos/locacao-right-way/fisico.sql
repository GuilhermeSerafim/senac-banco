-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-03-23 22:23:19 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE Company 
    ( 
     CompanyNumber         NUMBER  NOT NULL , 
     Name                  VARCHAR2 (60)  NOT NULL , 
     Address               VARCHAR2 (60)  NOT NULL , 
     RentalAgreementNumber VARCHAR2 (60) 
    ) 
;

ALTER TABLE Company 
    ADD CONSTRAINT Company_PK PRIMARY KEY ( CompanyNumber ) ;

CREATE TABLE IndividualCustomer 
    ( 
     CustomerID                  NUMBER  NOT NULL , 
     Name                        VARCHAR2 (60)  NOT NULL , 
     HomePhone                   VARCHAR2 (60)  NOT NULL , 
     Address                     VARCHAR2 (60)  NOT NULL , 
     DriverLicenseState          VARCHAR2 (60)  NOT NULL , 
     DriverLicenseNumber         VARCHAR2 (60) , 
     DriverLicenseExpirationDate DATE , 
     PoorRiskFlag                CHAR (1) , 
     RentalAgreementNumber       VARCHAR2 (60) 
    ) 
;

ALTER TABLE IndividualCustomer 
    ADD CONSTRAINT IndividualCustomer_PK PRIMARY KEY ( CustomerID ) ;

CREATE TABLE Rental_Agreement 
    ( 
     RentalAgreementNumber VARCHAR2 (60)  NOT NULL , 
     RentalDate            DATE  NOT NULL , 
     AnticipatedDuration   NUMBER  NOT NULL , 
     DepositPaid           NUMBER (10,2)  NOT NULL , 
     QuotedDailyRate       NUMBER (10,2) , 
     QuotedRatePerMile     NUMBER (10,2) 
    ) 
;

--  ERROR: No Discriminator Column found in Arc Arc_1 - check constraint cannot be generated

ALTER TABLE Rental_Agreement 
    ADD CONSTRAINT Rental_Agreement_PK PRIMARY KEY ( RentalAgreementNumber ) ;

CREATE TABLE Rental_Office 
    ( 
     OfficeNumber          NUMBER  NOT NULL , 
     OfficeName            VARCHAR2 (60)  NOT NULL , 
     Address               VARCHAR2 (60) , 
     VehicleID             NUMBER  NOT NULL , 
     RentalAgreementNumber VARCHAR2 (60) 
    ) 
;

ALTER TABLE Rental_Office 
    ADD CONSTRAINT Rental_Office_PK PRIMARY KEY ( OfficeNumber ) ;

CREATE TABLE Trailer 
    ( 
     VehicleID             NUMBER  NOT NULL , 
     MaximumWeightCapacity NUMBER (10,2)  NOT NULL 
    ) 
;

ALTER TABLE Trailer 
    ADD CONSTRAINT Trailer_PK PRIMARY KEY ( VehicleID ) ;

CREATE TABLE Truck 
    ( 
     VehicleID              NUMBER  NOT NULL , 
     CurrentOdometerReading NUMBER  NOT NULL , 
     GasTankCapacity        NUMBER (10,2)  NOT NULL , 
     WorkingRadio           CHAR (1)  NOT NULL , 
     MileageAtRentalStart   NUMBER  NOT NULL , 
     MileageAtReturn        NUMBER  NOT NULL 
    ) 
;

ALTER TABLE Truck 
    ADD CONSTRAINT Truck_PK PRIMARY KEY ( VehicleID ) ;

ALTER TABLE Truck 
    ADD CONSTRAINT Truck_PKv1 UNIQUE ( CurrentOdometerReading ) ;

CREATE TABLE Vehicle 
    ( 
     VehicleID                      NUMBER  NOT NULL , 
     StateOfRegistration            VARCHAR2 (60)  NOT NULL , 
     LicensePlateRegistrationNumber VARCHAR2 (60)  NOT NULL , 
     LastMaintenanceDate            DATE  NOT NULL , 
     RegistrationExpirationDate     DATE  NOT NULL , 
     RentalAgreementNumber          VARCHAR2 (60) 
    ) 
;

ALTER TABLE Vehicle 
    ADD CONSTRAINT Vehicle_PK PRIMARY KEY ( VehicleID ) ;

ALTER TABLE Company 
    ADD CONSTRAINT Company_Rental_Agreement_FK FOREIGN KEY 
    ( 
     RentalAgreementNumber
    ) 
    REFERENCES Rental_Agreement 
    ( 
     RentalAgreementNumber
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE IndividualCustomer 
    ADD CONSTRAINT IndividualCustomer_Rental_Agreement_FK FOREIGN KEY 
    ( 
     RentalAgreementNumber
    ) 
    REFERENCES Rental_Agreement 
    ( 
     RentalAgreementNumber
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Rental_Office 
    ADD CONSTRAINT Rental_Office_Rental_Agreement_FK FOREIGN KEY 
    ( 
     RentalAgreementNumber
    ) 
    REFERENCES Rental_Agreement 
    ( 
     RentalAgreementNumber
    ) 
;

ALTER TABLE Rental_Office 
    ADD CONSTRAINT Rental_Office_Vehicle_FK FOREIGN KEY 
    ( 
     VehicleID
    ) 
    REFERENCES Vehicle 
    ( 
     VehicleID
    ) 
;

ALTER TABLE Trailer 
    ADD CONSTRAINT Trailer_Vehicle_FK FOREIGN KEY 
    ( 
     VehicleID
    ) 
    REFERENCES Vehicle 
    ( 
     VehicleID
    ) 
;

ALTER TABLE Truck 
    ADD CONSTRAINT Truck_Vehicle_FK FOREIGN KEY 
    ( 
     VehicleID
    ) 
    REFERENCES Vehicle 
    ( 
     VehicleID
    ) 
;

ALTER TABLE Vehicle 
    ADD CONSTRAINT Vehicle_Rental_Agreement_FK FOREIGN KEY 
    ( 
     RentalAgreementNumber
    ) 
    REFERENCES Rental_Agreement 
    ( 
     RentalAgreementNumber
    ) 
;

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated

--  ERROR: No Discriminator Column found in Arc Arc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc Arc_1 - constraint trigger for Arc cannot be generated



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             15
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
-- ERRORS                                   7
-- WARNINGS                                 0
