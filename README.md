# Schémata a transformace pro srovnávaèe zboží

## Pøehled
Cílem je zlepšit situaci kolem XML pro srovnávaèe zboží a zjednodušit jejich generování.

## Stávající situace
- Každý zbožový srovnávaè má svùj formát feedu
-- Specifikace Zboží.cz http://napoveda.seznam.cz/cz/specifikace-xml.html
-- Specifikace Heureka.cz http://sluzby.heureka.cz/napoveda/import/
-- Jyxo srovnávaè http://admin.vybereme.cz/format-xml-feedu	
- Jejich XMLka nemají definované schéma - nedá se poznat, zda export z eshopu je OK
- Je spoustu práce s generováním validních feedù pro rùzné srovnávaèe


## Cíle práce

### Zjednodušit generování feedù pro srovnávaèe
- vytvoøím universální XML formát pro export zboží
- vytvoøím transformace, které z jednoho XML vytvoøí XML pro jednotlivé srovnávaèe

### Snížit množství chyb pøi vytváøení feedù
- vytvoøím schémata pro jednotlivé srovnávaèe (podle jejich textového popisu XML feedu)
- jednotlivých srovnávaèùm navrhnu zahrnutí schématu do popisu služby

### Zlepšit User-Experience pøi práci s feedy
- vytvoøím xsl transformace, které budou pøipojeny ke koneèným XML - pøi zobrazení v browseru bude feed pøehlednìjší