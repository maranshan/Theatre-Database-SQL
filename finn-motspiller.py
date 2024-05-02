import sqlite3

connection = sqlite3.connect('teater.db')
cursor = connection.cursor()

print("Du får nå muligheten til å søke opp en skuespiller og se hvem vedkommende har spilt i samme akt i et teaterstykke med")
fornavn = input("Hva er fornavnet til skuespilleren? ")
etternavn = (input("Hva er etternavnet til skuespilleren? "))

cursor.execute("""
   SELECT DISTINCT a1.fornavn, a1.etternavn, teaterstykke.tittel, a2.fornavn AS "spilte med fornavn", a2.etternavn AS "og etternavn"
FROM ansatt AS a1
INNER JOIN spillerRolle AS sr1 ON a1.ansattID = sr1.ansattID
INNER JOIN rolleIAkt AS ria1 ON sr1.rolleID = ria1.rolleID
INNER JOIN rolleIAkt AS ria2 ON ria1.aktNr = ria2.aktNr AND ria1.stykkeID = ria2.stykkeID AND ria1.rolleID != ria2.rolleID
INNER JOIN spillerRolle AS sr2 ON ria2.rolleID = sr2.rolleID
INNER JOIN ansatt AS a2 ON sr2.ansattID = a2.ansattID
INNER JOIN teaterstykke ON ria1.stykkeID = teaterstykke.stykkeID
WHERE a2.fornavn = ? AND a2.etternavn = ? AND NOT (a1.fornavn = ? AND a1.etternavn = ?);

""", (fornavn, etternavn, fornavn, etternavn))
skuespillere = cursor.fetchall()

for skuespiller in skuespillere:
    fornavnTilMedskuespiller = skuespiller[0]
    etternavnTilMedskuespiller = skuespiller[1]
    tittel = skuespiller[2]
    fornavnTilSkuespiller = skuespiller[3]
    etternavnTilSkuespiller = skuespiller[4]
    print(f"- {fornavnTilMedskuespiller} {etternavnTilMedskuespiller} har spilt i {tittel} med {fornavnTilSkuespiller} {etternavnTilSkuespiller}")



connection.commit()
connection.close()