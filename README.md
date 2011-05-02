# Sch�mata a transformace pro srovn�va�e zbo��

## P�ehled
C�lem je zlep�it situaci kolem XML pro srovn�va�e zbo�� a zjednodu�it jejich generov�n�.

## St�vaj�c� situace
- Ka�d� zbo�ov� srovn�va� m� sv�j form�t feedu
-- Specifikace Zbo��.cz http://napoveda.seznam.cz/cz/specifikace-xml.html
-- Specifikace Heureka.cz http://sluzby.heureka.cz/napoveda/import/
-- Jyxo srovn�va� http://admin.vybereme.cz/format-xml-feedu	
- Jejich XMLka nemaj� definovan� sch�ma - ned� se poznat, zda export z eshopu je OK
- Je spoustu pr�ce s generov�n�m validn�ch feed� pro r�zn� srovn�va�e


## C�le pr�ce

### Zjednodu�it generov�n� feed� pro srovn�va�e
- vytvo��m univers�ln� XML form�t pro export zbo��
- vytvo��m transformace, kter� z jednoho XML vytvo�� XML pro jednotliv� srovn�va�e

### Sn�it mno�stv� chyb p�i vytv��en� feed�
- vytvo��m sch�mata pro jednotliv� srovn�va�e (podle jejich textov�ho popisu XML feedu)
- jednotliv�ch srovn�va��m navrhnu zahrnut� sch�matu do popisu slu�by

### Zlep�it User-Experience p�i pr�ci s feedy
- vytvo��m xsl transformace, kter� budou p�ipojeny ke kone�n�m XML - p�i zobrazen� v browseru bude feed p�ehledn�j��