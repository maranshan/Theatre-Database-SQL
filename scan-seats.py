import sqlite3
from datetime import datetime
import sys

connection = sqlite3.connect('teater.db')
cursor = connection.cursor()

gruppeID = 3 #3 for student

def les_og_innsett_sete(filnavn):
    harKjøpt = False
    salNavn = filnavn.split('.')[0].replace('-', ' ').title()
    with open(filnavn, 'r') as f:
        linjer = f.readlines()
        forsteLinje = linjer[0].strip()
        if "Dato" in forsteLinje:
            words = forsteLinje.split()
            for word in words:
                if len(word) == 10 and word[4] == "-" and word[7] == "-":
                    dato =  word
    if salNavn == 'Gamle Scene':
        stykkeID = 2
        tid = '18:30'
    else:
        stykkeID = 1
        tid = '19:00'
    seteInfo = []
    radNr = 0
    radInfo = {}
    solgteSeter = {}
    ikkeSete = {}
    seteNrHoved = 0
    for linje in reversed(linjer):
        linje = linje.strip()
        seteInfo.append(radInfo)
        if '0' in linje or '1' in linje:
            radNr += 1
            ikkeSete[radNr] = []
            solgteSeter[radNr] = []
            seteNr = 0
            for stol in linje:
                seteNr += 1
                if stol == 'x':
                    ikkeSete[radNr].append(seteNr)
                if stol == '1':
                    if not harKjøpt:
                        harKjøpt = True
                        cursor.execute('''INSERT INTO billettOrdre(datoKjøpt, tidKjøpt, visningsDato, stykkeID, kundeID) VALUES (?, ?, ?, ?, ?)''', (datetime.today().date(), datetime.now().strftime('%H:%M:%S'), dato, stykkeID, 1))
                        ordreID = cursor.lastrowid
                    solgteSeter[radNr].append(seteNr)
                radInfo[radNr] = seteNr
        else:
            område = linje
            if salNavn == 'Gamle Scene':
                for rad, antallSeter in radInfo.items():
                    for i in range(antallSeter):
                        seteNr = i + 1
                        cursor.execute('''INSERT INTO sete VALUES (?, ?, ?, ?, ?)''', (seteNr, rad, område, salNavn, 1))
                        if seteNr in solgteSeter[rad]:
                            cursor.execute('''INSERT INTO billett VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)''', (seteNr, rad, område, salNavn, 1, ordreID, 1))
            else:
                for rad, antallSeter in radInfo.items():
                    for i in range(antallSeter):
                        seteNrHoved += 1
                        realtivSeteVerdi = seteNrHoved - (rad - 1) * 28
                        if realtivSeteVerdi not in ikkeSete[rad]:
                            cursor.execute('''INSERT INTO sete VALUES (?, ?, ?, ?, ?)''', (seteNrHoved, rad, område, salNavn, 1))
                            if realtivSeteVerdi in solgteSeter[rad]:
                                cursor.execute('''INSERT INTO billett VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)''', (seteNrHoved, rad, område, salNavn, 1, ordreID, gruppeID)) 
            radNr = 0
            radNr = 0
            radInfo = {}
            solgteSeter = {}
    print(f'{salNavn} sete-scan complete')
    connection.commit()

def main():
    for filnavn in sys.argv[1:]:
        les_og_innsett_sete(filnavn)
        print(f"Prosessert {filnavn}")

if __name__ == "__main__":
    main()

connection.close()