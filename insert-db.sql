INSERT INTO teater VALUES (1, 'Trøndelag Teater', 29);
INSERT INTO sal VALUES ('Hovedscenen', 1, 516);
INSERT INTO sal VALUES ('Gamle scene', 1, 332);

INSERT INTO kunde VALUES (3, 'Maran', 'Shanmugathas', 91234567, 'Høgskoleringen 1');
INSERT INTO kunde VALUES (1, 'Bjorn', 'Moxnes', 95724395, 'Kongens Gate 4');

INSERT INTO teaterstykke VALUES (1, 'Kongsemnene', 'Henrik Ibsen', 'Hovedscenen', 1);
INSERT INTO teaterstykke VALUES (2, 'Størst av alt er kjærligheten', 'Jonas Corell Petersen', 'Gamle scene', 1);

INSERT INTO forestilling VALUES ('2024-02-01', 1, '19:00');
INSERT INTO forestilling VALUES ('2024-02-02', 1, '19:00');
INSERT INTO forestilling VALUES ('2024-02-03', 1, '19:00');
INSERT INTO forestilling VALUES ('2024-02-05', 1, '19:00');
INSERT INTO forestilling VALUES ('2024-02-06', 1, '19:00');

INSERT INTO forestilling VALUES ('2024-02-03', 2, '18:30');
INSERT INTO forestilling VALUES ('2024-02-06', 2, '18:30');
INSERT INTO forestilling VALUES ('2024-02-07', 2, '18:30');
INSERT INTO forestilling VALUES ('2024-02-12', 2, '18:30');
INSERT INTO forestilling VALUES ('2024-02-13', 2, '18:30');
INSERT INTO forestilling VALUES ('2024-02-14', 2, '18:30');

INSERT INTO akt VALUES (1, 1, 'Akt 1');
INSERT INTO akt VALUES (2, 1, 'Akt 2');
INSERT INTO akt VALUES (3, 1, 'Akt 3');
INSERT INTO akt VALUES (4, 1, 'Akt 4');
INSERT INTO akt VALUES (5, 1, 'Akt 5');

-- Mulig den bør hete noe annet siden den er eneste akt i stykket
INSERT INTO akt VALUES (1, 2, 'Akt 1');

--Roller, rolleIAkt, skuespillere og spillerRolle Kongsemnene
INSERT INTO rolle VALUES (1, 'Haakon Haakonssønn');
INSERT INTO rolle VALUES (2, 'Inga fra Vartejg (Haakons mor);');
INSERT INTO rolle VALUES (3, 'Skule jarl');
INSERT INTO rolle VALUES (4, 'Fru Ragnhild (Skules hustru);');
INSERT INTO rolle VALUES (5, 'Margrete (Skules datter);');
INSERT INTO rolle VALUES (6, 'Sigrid (Skules søster);');
INSERT INTO rolle VALUES (7, 'Ingebjørg');
INSERT INTO rolle VALUES (8, 'Biskop Nikolas');
INSERT INTO rolle VALUES (9, 'Gregorius Jonssønn');
INSERT INTO rolle VALUES (10, 'Paal Flida');
INSERT INTO rolle VALUES (11, 'Baard Bratte');
INSERT INTO rolle VALUES (12, 'Jatgeir Skald');
INSERT INTO rolle VALUES (13, 'Dagfinn Bonde');
INSERT INTO rolle VALUES (14, 'Peter (prest og Ingebjørgs sønn);');

INSERT INTO rolleIAkt VALUES (1, 1, 1);
INSERT INTO rolleIAkt VALUES (2, 1, 1);
INSERT INTO rolleIAkt VALUES (3, 1, 1);
INSERT INTO rolleIAkt VALUES (4, 1, 1);
INSERT INTO rolleIAkt VALUES (5, 1, 1);

INSERT INTO rolleIAkt VALUES (1, 1, 2);
INSERT INTO rolleIAkt VALUES (3, 1, 2);

INSERT INTO rolleIAkt VALUES (1, 1, 3);
INSERT INTO rolleIAkt VALUES (2, 1, 3);
INSERT INTO rolleIAkt VALUES (3, 1, 3);
INSERT INTO rolleIAkt VALUES (4, 1, 3);
INSERT INTO rolleIAkt VALUES (5, 1, 3);

INSERT INTO rolleIAkt VALUES (1, 1, 4);
INSERT INTO rolleIAkt VALUES (5, 1, 4);

INSERT INTO rolleIAkt VALUES (1, 1, 5);
INSERT INTO rolleIAkt VALUES (2, 1, 5);
INSERT INTO rolleIAkt VALUES (3, 1, 5);
INSERT INTO rolleIAkt VALUES (4, 1, 5);
INSERT INTO rolleIAkt VALUES (5, 1, 5);

INSERT INTO rolleIAkt VALUES (1, 1, 6);
INSERT INTO rolleIAkt VALUES (2, 1, 6);
INSERT INTO rolleIAkt VALUES (5, 1, 6);

INSERT INTO rolleIAkt VALUES (4, 1, 7);

INSERT INTO rolleIAkt VALUES (1, 1, 8);
INSERT INTO rolleIAkt VALUES (2, 1, 8);
INSERT INTO rolleIAkt VALUES (3, 1, 8);

INSERT INTO rolleIAkt VALUES (1, 1, 9);
INSERT INTO rolleIAkt VALUES (2, 1, 9);
INSERT INTO rolleIAkt VALUES (3, 1, 9);
INSERT INTO rolleIAkt VALUES (4, 1, 9);
INSERT INTO rolleIAkt VALUES (5, 1, 9);

INSERT INTO rolleIAkt VALUES (1, 1, 10);
INSERT INTO rolleIAkt VALUES (2, 1, 10);
INSERT INTO rolleIAkt VALUES (3, 1, 10);
INSERT INTO rolleIAkt VALUES (4, 1, 10);
INSERT INTO rolleIAkt VALUES (5, 1, 10);

--Tar plassen til Guttom Ingesson
INSERT INTO rolleIAkt VALUES (1, 1, 11);

INSERT INTO rolleIAkt VALUES (4, 1, 12);

INSERT INTO rolleIAkt VALUES (1, 1, 13);
INSERT INTO rolleIAkt VALUES (2, 1, 13);
INSERT INTO rolleIAkt VALUES (3, 1, 13);
INSERT INTO rolleIAkt VALUES (4, 1, 13);
INSERT INTO rolleIAkt VALUES (5, 1, 13);

INSERT INTO rolleIAkt VALUES (3, 1, 14);
INSERT INTO rolleIAkt VALUES (4, 1, 14);
INSERT INTO rolleIAkt VALUES (5, 1, 14);

INSERT INTO ansatt VALUES (1,'Arturo','Scotti','ascotti@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (2,'Ingunn Beate Strige','Øyen','iøyen@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (3,'Hans Petter','Nilsen','hnilsen@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (4,'Madeleine Brandtzæg','Nilsen','mnilsen@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (5,'Synnøve Fossum','Eriksen','seriksen@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (6,'Emma Caroline','Deichmann','edeichmann@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (7,'Thomas Jensen','Takyi','ttakyi@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (8,'Per Bogstad','Gulliksen','pbogstad@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (9,'Isak Holmen','Sørensen','isørensen@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (10,'Fabian Heidelberg','Lunde','flunde@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (11,'Emil','Olafsson','eolafsson@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (12,'Snorre Ryen','Tøndel','støndel@teater.no','fast ansatt');

INSERT INTO skuespiller VALUES (1);
INSERT INTO skuespiller VALUES (2);
INSERT INTO skuespiller VALUES (3);
INSERT INTO skuespiller VALUES (4);
INSERT INTO skuespiller VALUES (5);
INSERT INTO skuespiller VALUES (6);
INSERT INTO skuespiller VALUES (7);
INSERT INTO skuespiller VALUES (8);
INSERT INTO skuespiller VALUES (9);
INSERT INTO skuespiller VALUES (10);
INSERT INTO skuespiller VALUES (11);
INSERT INTO skuespiller VALUES (12);

INSERT INTO spillerRolle VALUES (1, 1);
INSERT INTO spillerRolle VALUES (2, 2);
INSERT INTO spillerRolle VALUES (3, 3);
INSERT INTO spillerRolle VALUES (4, 4);
INSERT INTO spillerRolle VALUES (5, 5);
INSERT INTO spillerRolle VALUES (6, 6);
INSERT INTO spillerRolle VALUES (6, 7);
INSERT INTO spillerRolle VALUES (7, 8);
INSERT INTO spillerRolle VALUES (8, 9);
INSERT INTO spillerRolle VALUES (9, 10);
INSERT INTO spillerRolle VALUES (10, 11);
INSERT INTO spillerRolle VALUES (11, 12);
INSERT INTO spillerRolle VALUES (11, 13);
INSERT INTO spillerRolle VALUES (12, 14);

--Personellansatte
INSERT INTO ansatt VALUES (13,'Yury','Butusov','ybutusov@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (14,'Aleksandr','Shishkin-Hokusai','ashishkin@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (15,'Eivind','Myren','emyren@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (16,'Mina Rype','Stokke','mstokke@teater.no','fast ansatt');

INSERT INTO personell VALUES (13);
INSERT INTO personell VALUES (14);
INSERT INTO personell VALUES (15);
INSERT INTO personell VALUES (16);

INSERT INTO oppgave VALUES ('Regi', 1);
INSERT INTO oppgave VALUES ('Musikkutvelgelse', 1);
INSERT INTO oppgave VALUES ('Scenografi', 1);
INSERT INTO oppgave VALUES ('Kostymer', 1);
INSERT INTO oppgave VALUES ('Lysdesign', 1);
INSERT INTO oppgave VALUES ('Dramaturg', 1);

INSERT INTO utføresAv VALUES (13, 'Regi', 1);
INSERT INTO utføresAv VALUES (13, 'Musikkutvelgelse', 1);
INSERT INTO utføresAv VALUES (14, 'Scenografi', 1);
INSERT INTO utføresAv VALUES (14, 'Kostymer', 1);
INSERT INTO utføresAv VALUES (15, 'Lysdesign', 1);
INSERT INTO utføresAv VALUES (16, 'Dramaturg', 1);

--Roller, rolleIAkt og skuespillere i Størst av alt er kjærligheten
INSERT INTO rolle VALUES (15, 'Sunniva Du Mond Nordal');
INSERT INTO rolle VALUES (16, 'Jo Saberniak');
INSERT INTO rolle VALUES (17, 'Marte M. Steinholt');
INSERT INTO rolle VALUES (18, 'Tor Ivar Hagen');
INSERT INTO rolle VALUES (19, 'Trond-Ove Skrødal');
INSERT INTO rolle VALUES (20, 'Natalie Grøndahl Tangen');
INSERT INTO rolle VALUES (21, 'Åsmund Flaten');

INSERT INTO rolleIAkt VALUES (1, 2, 15);
INSERT INTO rolleIAkt VALUES (1, 2, 16);
INSERT INTO rolleIAkt VALUES (1, 2, 17);
INSERT INTO rolleIAkt VALUES (1, 2, 18);
INSERT INTO rolleIAkt VALUES (1, 2, 19);
INSERT INTO rolleIAkt VALUES (1, 2, 20);
INSERT INTO rolleIAkt VALUES (1, 2, 21);

INSERT INTO ansatt VALUES (17,'Sunniva Du Mond','Nordal','snordal@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (18,'Jo','Saberniak','jsaberniak@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (19,'Marte M.','Steinholt','msteinholt@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (20,'Tor Ivar','Hagen','thagen@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (21,'Trond-Ove','Skrødal','tskrødal@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (22,'Natalie Grøndahl','Tangen','ntangen@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (23,'Åsmund','Flaten','åflaten@teater.no','fast ansatt');

INSERT INTO skuespiller VALUES (17);
INSERT INTO skuespiller VALUES (18);
INSERT INTO skuespiller VALUES (19);
INSERT INTO skuespiller VALUES (20);
INSERT INTO skuespiller VALUES (21);
INSERT INTO skuespiller VALUES (22);
INSERT INTO skuespiller VALUES (23);

INSERT INTO spillerRolle VALUES (17, 15);
INSERT INTO spillerRolle VALUES (18, 16);
INSERT INTO spillerRolle VALUES (19, 17);
INSERT INTO spillerRolle VALUES (20, 18);
INSERT INTO spillerRolle VALUES (21, 19);
INSERT INTO spillerRolle VALUES (22, 20);
INSERT INTO spillerRolle VALUES (23, 21);

INSERT INTO ansatt VALUES (24,'Jonas Corell','Petersen','jpetersen@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (25,'David','Gehrt','dgehrt@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (26,'Gaute','Tønder','gtønder@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (27,'Magnus','Mikkelsen','mmikkelsen@teater.no','fast ansatt');
INSERT INTO ansatt VALUES (28,'Kristoffer','Spender','kspender@teater.no','fast ansatt');

INSERT INTO personell VALUES (24);
INSERT INTO personell VALUES (25);
INSERT INTO personell VALUES (26);
INSERT INTO personell VALUES (27);
INSERT INTO personell VALUES (28);

INSERT INTO oppgave VALUES ('Regi', 2);
INSERT INTO oppgave VALUES ('Scenografi', 2);
INSERT INTO oppgave VALUES ('Kostymer', 2);
INSERT INTO oppgave VALUES ('Musikalsk ansvarlig', 2);
INSERT INTO oppgave VALUES ('Lysdesign', 2);
INSERT INTO oppgave VALUES ('Dramaturg', 2);

INSERT INTO utføresAv VALUES (24, 'Regi', 2);
INSERT INTO utføresAv VALUES (25, 'Scenografi', 2);
INSERT INTO utføresAv VALUES (25, 'Kostymer', 2);
INSERT INTO utføresAv VALUES (26, 'Musikalsk ansvarlig', 2);
INSERT INTO utføresAv VALUES (27, 'Lysdesign', 2);
INSERT INTO utføresAv VALUES (28, 'Dramaturg', 2);


--Direktør, pass på at direktørID er riktig for Teater
INSERT INTO ansatt VALUES (29,'Elisabeth Egseth','Hansen','direktør@teater.no','fast ansatt');

INSERT INTO direktør VALUES (29);

INSERT INTO teaterProgram VALUES (1, 1, 'Vinter/Vår');
INSERT INTO teaterProgram VALUES (1, 2, 'Vinter/Vår');

INSERT INTO selgesFor VALUES (1, 1, 450);
INSERT INTO selgesFor VALUES (1, 2, 380);
INSERT INTO selgesFor VALUES (1, 3, 280);
INSERT INTO selgesFor VALUES (1, 5, 420);
INSERT INTO selgesFor VALUES (1, 6, 360);

INSERT INTO selgesFor VALUES (2, 1, 350);
INSERT INTO selgesFor VALUES (2, 2, 300);
INSERT INTO selgesFor VALUES (2, 3, 220);
INSERT INTO selgesFor VALUES (2, 4, 220);
INSERT INTO selgesFor VALUES (2, 5, 320);
INSERT INTO selgesFor VALUES (2, 6, 270);

INSERT INTO kundegruppe VALUES (1, 'Ordinær');
INSERT INTO kundegruppe VALUES (2, 'Honnør');
INSERT INTO kundegruppe VALUES (3, 'Student');
INSERT INTO kundegruppe VALUES (4, 'Barn');
INSERT INTO kundegruppe VALUES (5, 'Gruppe 10');
INSERT INTO kundegruppe VALUES (6, 'Gruppe honnør 10');