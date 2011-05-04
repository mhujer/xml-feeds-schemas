<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:jyxo="urn:x-hujer:feed:jyxo"
    version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="jyxo:SHOP">
        <html>
            <head>
                <title>Produktový feed pro Jyxo</title>
            </head>
            <body>
                <h1>Produktový feed pro Jyxo</h1>
                <p>Více informací <a href="http://admin.vybereme.cz/format-xml-feedu"
                        >http://admin.vybereme.cz/format-xml-feedu</a></p>
                <table border="1">
                    <tr>
                        <th> Produkt </th>
                        <th>Obrázek</th>
                        <th>Výrobce</th>
                        <th>Cena</th>
                        <th>Popis</th>
                        <th>EAN</th>
                        <th>Doba doručení (ve dnech)</th>
                        <th>Další informace</th>
                    </tr>
                    <xsl:for-each select="jyxo:SHOPITEM">
                        <tr>
                            <td>
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="jyxo:URL"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="jyxo:PRODUCT"/>
                                </a>
                            </td>
                            <td>
                                <div style="height: 150px">
                                    <img style="max-height: 100%">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="jyxo:IMGURL"/>
                                        </xsl:attribute>
                                    </img>
                                </div>
                            </td>
                            <td>
                                <xsl:value-of select="jyxo:MANUFACTURER"/>
                            </td>
                            <td style="width: 200px;">
                                <xsl:value-of select="jyxo:PRICE_VAT"/> (<xsl:value-of
                                    select="jyxo:PRICE"/> bez DPH)<br/> (sazba DPH je <xsl:value-of
                                    select="jyxo:VAT"/>) </td>
                            <td>
                                <xsl:value-of select="jyxo:DESCRIPTION"/>
                            </td>
                            <td>
                                <xsl:value-of select="jyxo:EAN"/>
                            </td>
                            <td>
                                <xsl:value-of select="jyxo:DELIVERY_DATE"/>
                            </td>
                            <td>
                                <xsl:value-of select="jyxo:ITEM_TYPE"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
