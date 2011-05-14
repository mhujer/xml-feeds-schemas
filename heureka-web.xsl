<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:heureka="urn:x-hujer:feed:heureka" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="heureka:SHOP">
        <html>
            <head>
                <title>Produktový feed pro Heuréka.cz</title>
                <link href="www/main.css" media="screen, projection" rel="stylesheet"
                    type="text/css"/>
            </head>
            <body>
                <div id="content">
                    <h1>Produktový feed pro Heuréka.cz:</h1>

                    <xsl:for-each select="heureka:SHOPITEM">
                        <div class="product">
                            <h2>
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="heureka:URL"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="heureka:PRODUCT"/>
                                </a>
                            </h2>
                            <div class="img">
                                <img style="max-height: 100%;">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="heureka:IMGURL"/>
                                    </xsl:attribute>
                                </img>
                            </div>
                            <p class="price">
                                <strong><xsl:value-of select="heureka:PRICE_VAT"/>&nbsp;Kč</strong>
                            </p>
                            <p class="price-second"><xsl:value-of select="heureka:PRICE"/>&nbsp;Kč
                                bez DPH (sazba DPH: <xsl:value-of select="heureka:VAT"/>%) <xsl:if
                                    test="heureka:DUES">, další poplatky: <xsl:value-of
                                        select="heureka:DUES"/>&#160;Kč</xsl:if>
                            </p>
                            <p class="description">
                                <xsl:value-of select="heureka:DESCRIPTION"/>
                            </p>

                            <hr style="clear:both; color: white; border: 0px;"/>

                            <xsl:if test="string-length(heureka:CATEGORYTEXT[0]) > 0">
                                <p class="categories">
                                    <strong>Kategorie: </strong>
                                    <ul>
                                        <xsl:for-each select="heureka:CATEGORYTEXT">
                                            <li>
                                                <xsl:value-of select="."/>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </p>
                            </xsl:if>

                            <xsl:if
                                test="heureka:MANUFACTURER and string-length(heureka:MANUFACTURER) > 0">
                                <p>
                                    <strong>Výrobce: </strong>
                                    <xsl:value-of select="heureka:MANUFACTURER"/>
                                </p>
                            </xsl:if>
                            <xsl:if test="heureka:EAN">
                                <p>
                                    <strong>EAN: </strong>
                                    <xsl:value-of select="heureka:EAN"/>
                                </p>
                            </xsl:if>
                            <xsl:if test="heureka:ISBN">
                                <p>
                                    <strong>ISBN: </strong>
                                    <xsl:value-of select="heureka:ISBN"/>
                                </p>
                            </xsl:if>
                            <p> Doručení je možné <xsl:choose>
                                    <xsl:when test="heureka:DELIVERY_DATE = 0">ihned</xsl:when>
                                    <xsl:otherwise>za <xsl:value-of select="heureka:DELIVERY_DATE"/>
                                        dní</xsl:otherwise>
                                </xsl:choose>
                            </p>
                            <xsl:if test="heureka:ITEM_TYPE = 'bazaar'">
                                <p class="bazaar">Zboží je bazarové</p>
                            </xsl:if>

                            <xsl:if test="count(heureka:PARAM) > 0">
                                <p>
                                    <strong>Parametry:</strong>
                                    <ul>
                                        <xsl:for-each select="heureka:PARAM">
                                            <li>
                                                <xsl:value-of select="heureka:PARAM_NAME"/>:
                                                  <xsl:for-each select="heureka:VAL">
                                                  <xsl:value-of select="."/>
                                                  <xsl:if test="following-sibling::heureka:VAL"> |
                                                  </xsl:if>
                                                </xsl:for-each>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </p>
                            </xsl:if>
                        </div>
                        <xsl:if test="following-sibling::heureka:SHOPITEM">
                            <hr style="margin-top: 20px;"/>
                        </xsl:if>
                    </xsl:for-each>

                    <div class="footer">
                        <hr/>
                        <p>Více informací <a href="http://sluzby.heureka.cz/napoveda/import/"
                                >http://sluzby.heureka.cz/napoveda/import/</a></p>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
