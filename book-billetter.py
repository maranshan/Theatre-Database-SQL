import sqlite3
from datetime import datetime

connection = sqlite3.connect('teater.db')
cursor = connection.cursor()

def kjøpOgBeregnPris():
    while True:
        print("Velg et teaterstykke:")
        print("(1) for Kongsemnene")
        print("(2) for Størst av alt er kjærligheten")
        teaterstykke = input("Skriv 1 eller 2: ")
        if teaterstykke == "1":
            salNavn = "Hovedscenen"
            stykkeID = 1
            break
        elif teaterstykke == '2':
            salNavn = 'Gamle Scene'
            stykkeID = 2
            break
        else:
            print("Venligst skriv 1 eller 2")
    dato = input("Hvilken dato vil du se stykket? (yyyy-mm-dd): ")
    antallBilletter = int(input("Hvor mange billetter vil du kjøpe?: "))
    
    #Finner rad-og-område par som har nok ledige seter
    cursor.execute("""
        SELECT radNr, område, (COUNT(*) - COUNT(billettID)) AS antallLedigePerRad 
        FROM (sete AS S LEFT OUTER JOIN billett AS B USING (seteNr, radNr, område, salNavn, teaterID))
        LEFT OUTER JOIN billettOrdre AS BO USING (ordreID)
        WHERE (visningsdato = ? OR visningsdato IS NULL) AND salNavn = ?
        GROUP BY radNr, område 
        HAVING antallLedigePerRad >= ?
        LIMIT 1
    """, (dato, salNavn, antallBilletter))

    radOgOmråde = cursor.fetchone()
    
    if not radOgOmråde:
        print("Ingen ledige seter som oppfyller kriteriene.")
        return

    radNr = radOgOmråde[0]
    område = radOgOmråde[1]
    
    cursor.execute('''INSERT INTO billettOrdre(datoKjøpt, tidKjøpt, visningsDato, stykkeID, kundeID) VALUES (?, ?, ?, ?, ?)''', (datetime.today().date(), datetime.now().strftime('%H:%M:%S'), dato, stykkeID, 1))
    ordreID = cursor.lastrowid

    #Finner ledige seter på samme rad og kjøper en billett for de aktuelle setene
    cursor.execute("""
                   INSERT INTO billett (seteNr, radNr, område, salNavn, teaterID, ordreID, gruppeID)
                   SELECT seteNr, radNr, område, salNavn, 1, ?, 1
                   FROM sete
                   WHERE radNr = ? AND område = ? AND salNavn = ? AND (seteNr, radNr, område, salNavn, teaterID) NOT IN (SELECT seteNr, radNr, område, salNavn, teaterID FROM billett)
                   LIMIT ?
    """, (ordreID, radNr, område, salNavn, antallBilletter))
     
    #For å printe valgte seter
    cursor.execute("""
        SELECT seteNr, radNr, område
        FROM billettOrdre AS BO JOIN billett AS B USING (ordreID) NATURAL JOIN selgesFor AS SF
        WHERE ordreID = ?
    """, (ordreID,))
    seter = cursor.fetchall()
    print("Du har fått følgende plasser:")
    for sete in seter:
        print(f'SeteNr: {sete[0]}, rad: {sete[1]}, område: {sete[2]}')
        
    #Beregner totalpris
    cursor.execute("""
        SELECT SUM(pris)
        FROM billettOrdre AS BO JOIN billett AS B USING (ordreID) NATURAL JOIN selgesFor AS SF
        WHERE ordreID = ?
    """, (ordreID,))
    print('\n------------------')
    print(f"Totalpris blir: {cursor.fetchone()[0]} kr")

kjøpOgBeregnPris()

connection.commit()
connection.close()