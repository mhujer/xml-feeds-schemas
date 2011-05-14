<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  exclude-result-prefixes="feed" xmlns:feed="urn:x-hujer:feed:universal">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/feed:SHOP">
    <xsl:processing-instruction name="xml-stylesheet">type="text/xsl"
      href="heureka-web.xsl"</xsl:processing-instruction>
    <SHOP xmlns="urn:x-hujer:feed:heureka" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="urn:x-hujer:feed:heureka heureka.xsd">
      <xsl:for-each select="feed:ITEM">
        <SHOPITEM>
          <PRODUCT>
            <xsl:value-of select="feed:PRODUCTNAME"/>
            <xsl:if test="feed:PRODUCTNAMEEXT">
              <xsl:text> </xsl:text>
              <xsl:value-of select="feed:PRODUCTNAMEEXT"/>
            </xsl:if>
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
          <xsl:if test="feed:DUES > 0">
            <DUES>
              <xsl:value-of select="feed:DUES"/>
            </DUES>
          </xsl:if>
          <VAT>
            <xsl:value-of select="feed:VAT div 20"/>
          </VAT>

          <xsl:if test="string-length(feed:ITEM_TYPE) > 0">
            <ITEM_TYPE>
              <xsl:value-of select="feed:ITEM_TYPE"/>
            </ITEM_TYPE>
          </xsl:if>

          <xsl:if test="string-length(feed:MANUFACTURER) > 0">
            <MANUFACTURER>
              <xsl:value-of select="feed:MANUFACTURER"/>
            </MANUFACTURER>
          </xsl:if>

          <xsl:for-each select="feed:CATEGORIES/feed:CATEGORY">
            <CATEGORYTEXT>
              <xsl:value-of select="."/>
            </CATEGORYTEXT>
          </xsl:for-each>

          <xsl:if test="string-length(feed:EAN) > 0">
            <EAN>
              <xsl:value-of select="feed:EAN"/>
            </EAN>
          </xsl:if>
          <xsl:if test="string-length(feed:ISBN) > 0">
            <ISBN>
              <xsl:value-of select="feed:ISBN"/>
            </ISBN>
          </xsl:if>

          <xsl:if test="string-length(feed:DELIVERY_DATE) > 0">
            <DELIVERY_DATE>
              <xsl:value-of select="feed:DELIVERY_DATE"/>
            </DELIVERY_DATE>
          </xsl:if>

          <xsl:if test="feed:PARAMETERS">
            <xsl:for-each select="feed:PARAMETERS/feed:PARAMETER">
              <PARAM>
                <PARAM_NAME>
                  <xsl:value-of select="feed:NAME"/>
                </PARAM_NAME>
                <xsl:for-each select="./child::feed:VALUE">
                  <VAL>
                    <xsl:value-of select="."/>
                  </VAL>
                </xsl:for-each>
              </PARAM>
            </xsl:for-each>
          </xsl:if>
        </SHOPITEM>
      </xsl:for-each>
    </SHOP>
  </xsl:template>
</xsl:stylesheet>
