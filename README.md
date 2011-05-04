# Schémata a transformace pro srovnávače zboží

## Přehled
Cílem je zlepšit situaci kolem XML pro srovnávače zboží a zjednodušit jejich generování.

## Stávající situace
- Každý zbožový srovnávač má svůj formát feedu
 - Specifikace Zboží.cz http://napoveda.seznam.cz/cz/specifikace-xml.html
 - Specifikace Heureka.cz http://sluzby.heureka.cz/napoveda/import/
 - Jyxo srovnávač http://admin.vybereme.cz/format-xml-feedu	
- Jejich XMLka nemají definované schéma - nedá se poznat, zda export z eshopu je OK
- Je spoustu práce s generováním validních feedů pro různé srovnávače


## Cíle práce

### Zjednodušit generování feedů pro srovnávače
- vytvořím universální XML formát pro export zboží
- vytvořím transformace, které z jednoho XML vytvoří XML pro jednotlivé srovnávače

### Snížit množství chyb při vytváření feedů
- vytvořím schémata pro jednotlivé srovnávače (podle jejich textového popisu XML feedu)
- jednotlivých srovnávačům navrhnu zahrnutí schématu do popisu služby

### Zlepšit User-Experience při práci s feedy
- vytvořím xsl transformace, které mohou být připojeny ke stávajícím XML exportům pro jednotlivé srovnávače - při zobrazení v browseru bude feed přehlednější
