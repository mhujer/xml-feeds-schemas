<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:feed="urn:x-hujer:feed:universal">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/feed:SHOP">
    <xsl:text disable-output-escaping="yes">
<![CDATA[<?xml-stylesheet type="text/xsl" href="jyxo-web.xsl"?>]]>
</xsl:text>
    <SHOP xmlns="urn:x-hujer:feed:jyxo" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="urn:x-hujer:feed:jyxo jyxo.xsd">
      <xsl:for-each select="feed:ITEM">
        <SHOPITEM>
          <PRODUCT>
            <xsl:choose>
              <xsl:when test="feed:PRODUCTNAME and feed:PRODUCTNAMEEXT">
                <xsl:value-of select="feed:PRODUCTNAME"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="feed:PRODUCTNAMEEXT"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="feed:PRODUCT"/>
              </xsl:otherwise>
            </xsl:choose>
          </PRODUCT>
          <DESCRIPTION>
            <xsl:value-of select="feed:DESCRIPTION"/>
          </DESCRIPTION>
          <URL>
            <xsl:value-of select="feed:URL"/>
          </URL>
          <IMGURL>
            <xsl:value-of select="feed:IMGURL"/>
          </IMGURL>
          <PRICE>
            <xsl:value-of select="feed:PRICE"/>
          </PRICE>
          <PRICE_VAT>
            <xsl:value-of select="feed:PRICE_VAT"/>
          </PRICE_VAT>
          <VAT>
            <xsl:value-of select="feed:VAT"/>
          </VAT>
          <xsl:if test="string-length(feed:MANUFACTURER) > 0">
            <MANUFACTURER>
              <xsl:value-of select="feed:MANUFACTURER"/>
            </MANUFACTURER>
          </xsl:if>
          <xsl:if test="string-length(feed:EAN) > 0">
            <EAN>
              <xsl:value-of select="feed:EAN"/>
            </EAN>
          </xsl:if>
          <xsl:if test="string-length(feed:DELIVERY_DATE) > 0">
            <DELIVERY_DATE>
              <xsl:value-of select="feed:DELIVERY_DATE"/>
            </DELIVERY_DATE>
          </xsl:if>
          <xsl:if test="string-length(feed:ITEM_TYPE) > 0 and feed:ITEM_TYPE != 'new'">
            <ITEM_TYPE>
              <xsl:value-of select="feed:ITEM_TYPE"/>
            </ITEM_TYPE>
          </xsl:if>
        </SHOPITEM>
      </xsl:for-each>
    </SHOP>
  </xsl:template>
</xsl:stylesheet>
