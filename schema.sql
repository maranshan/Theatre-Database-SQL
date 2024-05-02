CREATE TABLE teater (
    teaterID INTEGER NOT NULL,
    navn TEXT,
    direktørID INTEGER NOT NULL,
    CONSTRAINT teater_PK PRIMARY KEY (teaterID),
    CONSTRAINT teater_FK FOREIGN KEY (direktørID) REFERENCES direktør(ansattID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION 
);

CREATE TABLE sal(
    salNavn TEXT NOT NULL,
    teaterID INTEGER NOT NULL,
    kapasitet INTEGER DEFAULT 0,
    CONSTRAINT sal_PK PRIMARY KEY (salNavn, teaterID),
    CONSTRAINT sal_FK FOREIGN KEY (teaterID) REFERENCES teater(teaterID)
        ON UPDATE CASCADE
        ON DELETE CASCADE 
);

CREATE TABLE teaterProgram (
    teaterID INTEGER NOT NULL,
    stykkeID INTEGER NOT NULL,
    sesong TEXT,
    CONSTRAINT teaterProgram_PK PRIMARY KEY (teaterID, stykkeID),
    CONSTRAINT teaterProgram_FK1 FOREIGN KEY (teaterID) REFERENCES teater(teaterID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT teaterProgram_FK2 FOREIGN KEY (stykkeID) REFERENCES teaterstykke(stykkeID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE teaterstykke (
    stykkeID INTEGER NOT NULL,
    tittel TEXT,
    forfatter TEXT,
    salNavn TEXT,
    teaterID INTEGER,
    CONSTRAINT teaterstykke_PK PRIMARY KEY (stykkeID),
    CONSTRAINT teaterProgram_FK FOREIGN KEY (salNavn, teaterID) REFERENCES sal(salNavn, teaterID)
        ON UPDATE CASCADE
        ON DELETE SET NULL 
);

CREATE TABLE forestilling (
    visningsDato TEXT NOT NULL,
    stykkeID INTEGER NOT NULL,
    starttid TEXT,
    CONSTRAINT forestilling_PK PRIMARY KEY (visningsDato, stykkeID),
    CONSTRAINT forestilling_FK FOREIGN KEY (stykkeID) REFERENCES teaterstykke(stykkeID)
        ON UPDATE CASCADE
        ON DELETE CASCADE 
);

CREATE TABLE sete (
   seteNr INTEGER NOT NULL,
   radNr INTEGER NOT NULL, 
   område TEXT NOT NULL DEFAULT 'Hovedområde',
   salNavn TEXT NOT NULL,
   teaterID INTEGER NOT NULL,
   CONSTRAINT sete_PK PRIMARY KEY (seteNr, radNr, område, salNavn, teaterID),
   CONSTRAINT sete_FK FOREIGN KEY (salNavn, teaterID) REFERENCES sal(salNavn, teaterID)
        ON UPDATE CASCADE
        ON DELETE CASCADE 
);

CREATE TABLE kundegruppe (
    gruppeID INTEGER NOT NULL,
    navn TEXT UNIQUE,
    CONSTRAINT kundegruppe_PK PRIMARY KEY (gruppeID)
);

CREATE TABLE selgesFor (
    stykkeID INTEGER NOT NULL,
    gruppeID INTEGER NOT NULL,
    pris INTEGER,
    CONSTRAINT selgesFor_PK PRIMARY KEY (stykkeID, gruppeID),
    CONSTRAINT selgesFor_FK1 FOREIGN KEY (stykkeID) REFERENCES teaterstykke(stykkeID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT selgesFor_FK2 FOREIGN KEY (gruppeID) REFERENCES kundegruppe(gruppeID)
        ON UPDATE CASCADE
        ON DELETE CASCADE 
);

CREATE TABLE billett (
    billettID INTEGER NOT NULL,
    seteNr INTEGER NOT NULL,
    radNr INTEGER NOT NULL,
    område TEXT NOT NULL,
    salNavn TEXT NOT NULL,
    teaterID INTEGER NOT NULL,
    ordreID INTEGER NOT NULL,
    gruppeID INTEGER NOT NULL,
    CONSTRAINT billett_PK PRIMARY KEY (billettID),
    CONSTRAINT billett_FK1 FOREIGN KEY (seteNr, radNr, område, salNavn, teaterID) REFERENCES sete(seteNr, radNr, område, salNavn, teaterID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT billett_FK2 FOREIGN KEY (ordreID) REFERENCES billettordre(ordreID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT billett_FK3 FOREIGN KEY (gruppeID) REFERENCES kundegruppe(gruppeID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION 
);

CREATE TABLE billettordre (
    ordreID INTEGER NOT NULL,
    datoKjøpt TEXT,
    tidKjøpt TEXT,
    visningsDato TEXT NOT NULL,
    stykkeID INTEGER NOT NULL,
    kundeID INTEGER NOT NULL,
    CONSTRAINT billettordre_PK PRIMARY KEY (ordreID),
    CONSTRAINT billettordre_FK1 FOREIGN KEY (visningsDato, stykkeID) REFERENCES forestilling(visningsDato, stykkeID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT billettordre_FK2 FOREIGN KEY (kundeID) REFERENCES kunde(kundeID)
        ON UPDATE CASCADE
        ON DELETE CASCADE 
);

CREATE TABLE kunde (
    kundeID INTEGER NOT NULL,
    fornavn TEXT,
    etternavn TEXT,
    telefonNr INTEGER UNIQUE,
    adresse TEXT, 
    CONSTRAINT kunde_PK PRIMARY KEY (kundeID)
);

CREATE TABLE ansatt (
    ansattID INTEGER NOT NULL,
    fornavn TEXT,
    etternavn TEXT,
    `e-post` TEXT UNIQUE,
    ansattStatus TEXT,
    CONSTRAINT ansatt_PK PRIMARY KEY (ansattID)
);

CREATE TABLE akt (
    aktNr INTEGER NOT NULL,
    stykkeID INTEGER NOT NULL,
    navn TEXT,
    CONSTRAINT akt_PK PRIMARY KEY (aktNr, stykkeID),
    CONSTRAINT akt_FK FOREIGN KEY (stykkeID) REFERENCES teaterstykke(stykkeID)
        ON UPDATE CASCADE
        ON DELETE CASCADE 
);

CREATE TABLE rolle (
    rolleID INTEGER NOT NULL,
    navn TEXT NOT NULL,
    CONSTRAINT rolle_PK PRIMARY KEY (rolleID)
);

CREATE TABLE rolleIakt (
    aktNr INTEGER NOT NULL,
    stykkeID INTEGER NOT NULL,
    rolleID INTEGER NOT NULL,
    CONSTRAINT rolleIakt_PK PRIMARY KEY (rolleID, aktNr, stykkeID),
    CONSTRAINT rolleIakt_FK1 FOREIGN KEY (aktNr, stykkeID) REFERENCES akt(aktNr, stykkeID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,  
    CONSTRAINT rolleIakt_FK2 FOREIGN KEY (rolleID) REFERENCES rolle(rolleID)
        ON UPDATE CASCADE
        ON DELETE CASCADE 
);

CREATE TABLE skuespiller (
    ansattID INTEGER NOT NULL,
    CONSTRAINT skuespiller_PK PRIMARY KEY (ansattID),
    CONSTRAINT skuespiller_FK FOREIGN KEY (ansattID) REFERENCES ansatt(ansattID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE spillerRolle (
    ansattID INTEGER NOT NULL,
    rolleID INTEGER NOT NULL,
    CONSTRAINT spillerRolle_PK PRIMARY KEY (ansattID, rolleID),
    CONSTRAINT spillerRolle_FK1 FOREIGN KEY (ansattID) REFERENCES skuespiller(ansattID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION, 
    CONSTRAINT spillerRolle_FK2 FOREIGN KEY (rolleID) REFERENCES rolle(rolleID)
        ON UPDATE CASCADE
        ON DELETE CASCADE 
);

CREATE TABLE personell (
    ansattID INTEGER NOT NULL,
    CONSTRAINT personell_PK PRIMARY KEY (ansattID),
    CONSTRAINT personell_FK FOREIGN KEY (ansattID) REFERENCES ansatt(ansattID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE oppgave (
    oppgaveType TEXT NOT NULL,
    stykkeID INTEGER NOT NULL,
    CONSTRAINT oppgave_PK PRIMARY KEY (oppgaveType, stykkeID),
    CONSTRAINT oppgave_FK FOREIGN KEY (stykkeID) REFERENCES teaterstykke(stykkeID)
        ON UPDATE CASCADE
        ON DELETE CASCADE 
);

CREATE TABLE utføresAv (
    ansattID INTEGER NOT NULL,
    oppgaveType TEXT NOT NULL,
    stykkeID INTEGER NOT NULL,
    CONSTRAINT utføresAv_PK PRIMARY KEY (ansattID, oppgaveType, stykkeID),
    CONSTRAINT utføresAv_FK1 FOREIGN KEY (ansattID) REFERENCES personell(ansattID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION, 
    CONSTRAINT utføresAv_FK2 FOREIGN KEY (oppgaveType, stykkeID) REFERENCES oppgave(oppgaveType, stykkeID)
        ON UPDATE CASCADE
        ON DELETE CASCADE 
);

CREATE TABLE direktør (
    ansattID INTEGER NOT NULL,
    CONSTRAINT direktør_PK PRIMARY KEY (ansattID),
    CONSTRAINT direktør_FK FOREIGN KEY (ansattID) REFERENCES ansatt(ansattID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

