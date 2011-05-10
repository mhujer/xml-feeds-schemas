<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:zbozi="urn:x-hujer:feed:zbozi" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="zbozi:SHOP">
        <html>
            <head>
                <title>Produktový feed pro Zboží.cz</title>
                <link href="www/main.css" media="screen, projection" rel="stylesheet"
                    type="text/css"/>
            </head>
            <body>
                <h1>Produktový feed pro Zboží.cz:</h1>

                <xsl:for-each select="zbozi:SHOPITEM">
                    <div class="product">
                        <h2>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="zbozi:URL"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="zbozi:PRODUCTNAME and zbozi:PRODUCTNAMEEXT">
                                        <xsl:value-of select="zbozi:PRODUCTNAME"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="zbozi:PRODUCTNAMEEXT"/>
                                    </xsl:when>
                                    <xsl:when test="zbozi:PRODUCT">
                                        <xsl:value-of select="zbozi:PRODUCT"/>
                                    </xsl:when>
                                    <xsl:when test="zbozi:PRODUCTNAME">
                                        <xsl:value-of select="zbozi:PRODUCTNAME"/>
                                    </xsl:when>
                                </xsl:choose>
                            </a>
                        </h2>
                        <div class="img">
                            <img style="max-height: 100%;">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="zbozi:IMGURL"/>
                                </xsl:attribute>
                            </img>
                        </div>
                        <p class="price">
                            <strong><xsl:value-of select="zbozi:PRICE_VAT"/>&nbsp;Kč</strong>
                        </p>
                        <p class="price-second"><xsl:value-of select="zbozi:PRICE"/>&nbsp;Kč bez DPH
                            (sazba DPH: <xsl:value-of select="zbozi:VAT"/>%) <xsl:if
                                test="zbozi:DUES">, další poplatky: <xsl:value-of
                                    select="zbozi:DUES"/>&#160;Kč</xsl:if>
                        </p>
                        <p class="description">
                            <xsl:value-of select="zbozi:DESCRIPTION"/>
                        </p>

                        <hr style="clear:both; color: white; border: 0px;"/>

                        <xsl:if test="string-length(zbozi:CATEGORYTEXT[0]) > 0">
                            <p class="categories">
                                <strong>Kategorie: </strong>
                                <ul>
                                    <xsl:for-each select="zbozi:CATEGORYTEXT">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </p>
                        </xsl:if>

                        <xsl:if test="zbozi:MANUFACTURER and string-length(zbozi:MANUFACTURER) > 0">
                            <p>
                                <strong>Výrobce: </strong>
                                <xsl:value-of select="zbozi:MANUFACTURER"/>
                            </p>
                        </xsl:if>
                        <xsl:if test="zbozi:EAN">
                            <p>
                                <strong>EAN: </strong>
                                <xsl:value-of select="zbozi:EAN"/>
                            </p>
                        </xsl:if>
                        <xsl:if test="zbozi:PRODUCTNO">
                            <p>
                                <strong>Kód produktu: </strong>
                                <xsl:value-of select="zbozi:PRODUCTNO"/>
                            </p>
                        </xsl:if>
                        <p> Doručení je možné <xsl:choose>
                                <xsl:when
                                    test="zbozi:DELIVERY_DATE = 0 or zbozi:DELIVERY_DATE = 'ihned'"
                                    >ihned</xsl:when>
                                <xsl:otherwise>za <xsl:value-of select="zbozi:DELIVERY_DATE"/>
                                    dní</xsl:otherwise>
                            </xsl:choose>
                        </p>
                        <xsl:if test="zbozi:ITEM_TYPE = 'bazaar'">
                            <p class="bazaar">Zboží je bazarové</p>
                        </xsl:if>

                        <xsl:if test="count(zbozi:VARIANT) > 0">
                            <p>
                                <strong>Varianty:</strong>
                                <ul>
                                    <xsl:for-each select="zbozi:VARIANT">
                                        <li>
                                            <xsl:value-of select="zbozi:PRODUCTNAMEEXT"/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </p>
                        </xsl:if>
                    </div>
                    <xsl:if test="following-sibling::zbozi:SHOPITEM">
                        <hr style="margin-top: 20px;"/>
                    </xsl:if>
                </xsl:for-each>


                <div class="footer">
                    <hr/>
                    <p>Více informací <a href="http://napoveda.seznam.cz/cz/specifikace-xml.html"
                            >http://napoveda.seznam.cz/cz/specifikace-xml.html</a></p>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
