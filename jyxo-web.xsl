<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:jyxo="urn:x-hujer:feed:jyxo"
    version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="jyxo:SHOP">
        <html>
            <head>
                <title>Produktový feed pro Jyxo</title>
                <link href="www/main.css" media="screen, projection" rel="stylesheet"
                    type="text/css"/>
            </head>
            <body>
                <h1>Produktový feed pro Jyxo</h1>

                <xsl:for-each select="jyxo:SHOPITEM">
                    <div class="product">
                        <h2>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="jyxo:URL"/>
                                </xsl:attribute>
                                <xsl:value-of select="jyxo:PRODUCT"/>
                            </a>
                        </h2>
                        <div class="img">
                            <img style="max-height: 100%;">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="jyxo:IMGURL"/>
                                </xsl:attribute>
                            </img>
                        </div>
                        <p class="price">
                            <strong><xsl:value-of select="jyxo:PRICE_VAT"/>&nbsp;Kč</strong>
                        </p>
                        <p class="price-second"><xsl:value-of select="jyxo:PRICE"/>&nbsp;Kč bez DPH
                            (sazba DPH: <xsl:value-of select="jyxo:VAT"/>%)</p>
                        <p class="description">
                            <xsl:value-of select="jyxo:DESCRIPTION"/>
                        </p>

                        <hr style="clear:both; color: white; border: 0px;"/>

                        <xsl:if test="jyxo:MANUFACTURER">
                            <p>
                                <strong>Výrobce: </strong>
                                <xsl:value-of select="jyxo:MANUFACTURER"/>
                            </p>
                        </xsl:if>
                        <xsl:if test="jyxo:EAN">
                            <p>
                                <strong>EAN: </strong>
                                <xsl:value-of select="jyxo:EAN"/>
                            </p>
                        </xsl:if>
                        <p> Doručení je možné <xsl:choose>
                                <xsl:when
                                    test="jyxo:DELIVERY_DATE = 0 or jyxo:DELIVERY_DATE = 'ihned'"
                                    >ihned</xsl:when>
                                <xsl:otherwise>za <xsl:value-of select="jyxo:DELIVERY_DATE"/>
                                    dní</xsl:otherwise>
                            </xsl:choose>
                        </p>
                        <xsl:if test="jyxo:ITEM_TYPE = 'bazaar'">
                            <p class="bazaar">Zboží je bazarové</p>
                        </xsl:if>
                    </div>
                    <xsl:if test="following-sibling::jyxo:SHOPITEM">
                        <hr style="margin-top: 20px;"/>
                    </xsl:if>
                </xsl:for-each>


                <div class="footer">
                    <hr/>
                    <p>Více informací <a href="http://admin.vybereme.cz/format-xml-feedu"
                            >http://admin.vybereme.cz/format-xml-feedu</a></p>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
