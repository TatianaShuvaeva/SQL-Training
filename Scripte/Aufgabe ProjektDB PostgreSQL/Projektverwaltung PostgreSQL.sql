-- Database: ProjektDB

Create Database ProjektDB;



-- Table: public.Projekte

USE  ProjektDB;

CREATE TABLE IF NOT EXISTS public."Projekte"
(
    "ID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( CYCLE INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Projektname" character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "Startdatum" date,
    "Enddatum" date,
    "Budget" numeric,
    CONSTRAINT "Projekte_pkey" PRIMARY KEY ("ID")
)


-- Table: public.Mitarbeiter



CREATE TABLE IF NOT EXISTS public."Mitarbeiter"
(
    "ID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( CYCLE INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Vorname" character varying(50) COLLATE pg_catalog."default",
    "Nachname" character varying(50) COLLATE pg_catalog."default",
    "Abteilung" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "Mitarbeiter_pkey" PRIMARY KEY ("ID")
)


	
-- Table: public.Aufgaben


CREATE TABLE IF NOT EXISTS public."Aufgaben"
(
    "ID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( CYCLE INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Aufgabenname" character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "Beschreibung" character varying(500) COLLATE pg_catalog."default",
    "Startdatum" date,
    "Enddatum" date,
    "Status" character varying(50) COLLATE pg_catalog."default",
    "ProjektID" integer,
    "MitarbeiterID" integer,
    CONSTRAINT "Aufgaben_pkey" PRIMARY KEY ("ID")
)

--TABLESPACE pg_default;

--ALTER TABLE IF EXISTS public."Aufgaben"
    --OWNER to postgres;
	
	
--Fremdschlüssel FK_Aufgabe-ProjektID_Projekte-ID 	


ALTER TABLE IF EXISTS public."Aufgaben"
    ADD CONSTRAINT "FK_Aufgabe-ProjektID_Projekte-ID" FOREIGN KEY ("ProjektID")
    REFERENCES public."Projekte" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_FK_Aufgabe-ProjektID_Projekte-ID"
    ON public."Aufgaben"("ProjektID");
	
--Fremdschlüssel FK_Aufgabe-MitarbeiterID_Mitarbeiter-ID

ALTER TABLE IF EXISTS public."Aufgaben"
    ADD CONSTRAINT "FK_Aufgabe-MitarbeiterID_Mitarbeiter-ID" FOREIGN KEY ("MitarbeiterID")
    REFERENCES public."Mitarbeiter" ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_FK_Aufgabe-MitarbeiterID_Mitarbeiter-ID"
    ON public."Aufgaben"("MitarbeiterID");

-- Füllen Sie die Tabelle Projekte mit 5 Projekten (Projekt 1 bis 5) 

INSERT INTO public."Projekte"
           (
            "Projektname"
           ,"Startdatum"
           ,"Enddatum"
           ,"Budget")
     VALUES
           ('Website Redesign', '2023/01/23', '2023/06/14', 30000),
           ('Product Launch', '2023/01/29', '2023/07/15', 45000),
		   ('Marketing Campaign', '2023/02/02', '2023/07/14', 52000),
		   ('Software Development', '2023/03/11', '2023/05/10', 18000),
		   ('Training Program', '2023/04/23', '2023/10/21', 69999)
		   
-- Füllen Sie die Tabelle Mitarbeiter mit 3 Datensätzen	  
	
	INSERT INTO public."Mitarbeiter"
           (
            "Vorname"
           ,"Nachname"
           ,"Abteilung")
     VALUES
           ('Robin', 'Schmidt', 'abt.01'),
           ('Lorie', 'Fischer', 'abt.02'),
		   ('Roger', 'Meyer', 'abt.03')
		   
-- Füllen Sie die Tabelle Aufgaben mit 10 Datensätzen

INSERT INTO public."Aufgaben"
           (
            "Aufgabenname"
           ,"Beschreibung"
           ,"Startdatum"
		   ,"Enddatum"
		   ,"Status"
		   ,"ProjektID"
		   ,"MitarbeiterID")
     VALUES
           ('Website Redesign', 'Überarbeitung der Unternehmenswebsite für ein moderneres Design', '2023/05/07', '2023/12/12', 'ZURÜCKGEGEBEN', 1,1),
           ('Kundenbefragung', 'Durchführung einer Umfrage zur Kundenzufriedenheit und Analyse der Ergebnisse', '2023/06/17', '2023/12/20', 'Abgeschlossen', 2, 1),
		   ('Produktentwicklung', 'Entwicklung eines neuen Produkts basierend auf den Kundenanforderungen', '2023/12/28', '2024/05/03', 'IN BEARBEITUNG', 3, 1),
	       ('Marketingkampagne', ' Planung und Durchführung einer Marketingkampagne zur Steigerung der Markenbekanntheit', '2024/01/05', '2024/03/14', 'UNVOLLSTÄNDIG', 4, 2),
		   ('Schulungsprogramm', 'Organisation von Schulungen für neue Mitarbeiter zur Einarbeitung in Unternehmensprozesse', '2023/12/28', '2024/12/12', 'IN BEARBEITUNG', 5, 3),
		   ('Qualitätssicherung', 'Überprüfung der Produktqualität und Implementierung von Verbesserungsmaßnahmen', '2024/01/09', '2025/12/12', 'IN BEARBEITUNG', 4, 3),
		   ('Eventplanung', 'Planung und Organisation eines Unternehmensevents zur Kundenbindung', '2024/01/22', '2024/12/28', 'IN BEARBEITUNG', 5, 1),
		   ('Budgetüberprüfung', 'Überprüfung des Budgets für das laufende Quartal und Anpassung der Ausgaben', '2024/01/30', '2025/01/06', 'IN BEARBEITUNG', 2, 2),
		   ('Marktforschung', 'Durchführung einer Marktanalyse zur Identifizierung neuer Geschäftsmöglichkeiten', '2023/12/28', '2024/01/06','Abgeschlossen', 5, 3),
		   ('Mitarbeiterbewertung', 'Durchführung von Leistungsbewertungen für Mitarbeiter und Festlegung von Entwicklungszielen', '2024/05/01', '2025/06/12', 'Geplant', 3, 2)
		   
-- Erstellen Sie ein Script um Login User und einen User

CREATE ROLE ProjektAdmin LOGIN PASSWORD 'Test1234!';

CREATE USER ProjektAdmin;

GRANT ALL PRIVILEGES ON DATABASE postgres TO ProjektAdmin;