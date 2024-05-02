SELECT T.tittel, F.visningsDato, COUNT(billettID) AS antallSolgteBilletter
FROM ((forestilling AS F JOIN teaterstykke AS T USING (stykkeID))
    LEFT OUTER JOIN billettOrdre AS BO USING (visningsDato, stykkeID))
    LEFT OUTER JOIN billett AS B USING (ordreID)
GROUP BY F.visningsDato, T.stykkeID
ORDER BY antallSolgteBilletter DESC
 
    
    

