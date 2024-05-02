SELECT DISTINCT teaterstykke.tittel, ansatt.fornavn, ansatt.etternavn, rolle.navn
FROM (((ansatt INNER JOIN spillerRolle ON ansatt.ansattID=spillerRolle.ansattID)
INNER JOIN rolle ON rolle.rolleID=rolleIAkt.rolleID
INNER JOIN rolleIAkt ON rolleIAkt.rolleID=spillerRolle.rolleID)
INNER JOIN teaterstykke ON rolleIAkt.stykkeID=teaterstykke.stykkeID) 