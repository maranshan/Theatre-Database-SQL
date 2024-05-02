import sqlite3

connection = sqlite3.connect('teater.db')
cursor = connection.cursor()

dato = input("Hvilken dato ønsker du informasjon om? (yyyy-mm-dd): ")
    
cursor.execute("""
                  SELECT T.tittel, F.visningsDato, COUNT(billettID) AS antallSolgteBilletter
                  FROM ((forestilling AS F JOIN teaterstykke AS T USING (stykkeID))
                  LEFT OUTER JOIN billettOrdre AS BO USING (visningsDato, stykkeID))
                  LEFT OUTER JOIN billett AS B USING (ordreID)
                  WHERE F.visningsDato = ?
                  GROUP BY F.visningsDato, T.stykkeID
""", (dato,))

resultat = cursor.fetchall()
print('')
print(f'For {dato} vises følgende foresultattillinger:')
print('')
for r in resultat:
    stykke = r[0]
    dato = r[1]
    antallSolgte = r[2]
    print('---- Forestillingsinfo ----')
    print('Forestilling: ' + stykke)
    print('Dato: ' + dato)
    print('Antall solgte billetter: ' + str(antallSolgte))
    # print(f"{stykke} ({dato}): {antallSolgte} solgte billetter")
    print('')
    
    

