<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:feed="urn:x-hujer:feed:universal">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/feed:SHOP">
    <xsl:processing-instruction name="xml-stylesheet">type="text/xsl"
      href="zbozi-web.xsl"</xsl:processing-instruction>
    <SHOP xmlns="urn:x-hujer:feed:zbozi" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="urn:x-hujer:feed:zbozi zbozi.xsd">
      <xsl:for-each select="feed:ITEM">
        <SHOPITEM>
          <PRODUCT>
            <xsl:value-of select="feed:PRODUCTNAME"/>
            <xsl:if test="feed:PRODUCTNAMEEXT">
              <xsl:text> </xsl:text>
              <xsl:value-of select="feed:PRODUCTNAMEEXT"/>
            </xsl:if>
          </PRODUCT>
          <xsl:if test="feed:PRODUCTNAME">
            <PRODUCTNAME>
              <xsl:value-of select="feed:PRODUCTNAME"/>
            </PRODUCTNAME>
          </xsl:if>
          <xsl:if test="feed:PRODUCTNAMEEXT">
            <PRODUCTNAMEEXT>
              <xsl:value-of select="feed:PRODUCTNAMEEXT"/>
            </PRODUCTNAMEEXT>
          </xsl:if>
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
          <VAT>
            <xsl:value-of select="feed:VAT"/>
          </VAT>
          <PRICE_VAT>
            <xsl:value-of select="feed:PRICE_VAT"/>
          </PRICE_VAT>

          <xsl:if test="feed:DUES > 0">
            <DUES>
              <xsl:value-of select="feed:DUES"/>
            </DUES>
          </xsl:if>

          <xsl:if test="string-length(feed:DELIVERY_DATE) > 0">
            <DELIVERY_DATE>
              <xsl:value-of select="feed:DELIVERY_DATE"/>
            </DELIVERY_DATE>
          </xsl:if>

          <xsl:if test="feed:PROPRIETARY/feed:ZBOZICZ/feed:SHOP_DEPOTS">
            <SHOP_DEPOTS>
              <xsl:value-of select="feed:PROPRIETARY/feed:ZBOZICZ/feed:SHOP_DEPOTS"/>
            </SHOP_DEPOTS>
          </xsl:if>

          <xsl:if test="string-length(feed:ITEM_TYPE) > 0 and feed:ITEM_TYPE != 'new'">
            <ITEM_TYPE>
              <xsl:value-of select="feed:ITEM_TYPE"/>
            </ITEM_TYPE>
          </xsl:if>

          <xsl:if test="feed:PROPRIETARY/feed:ZBOZICZ/feed:TOLLFREE">
            <TOLLFREE>
              <xsl:value-of select="feed:PROPRIETARY/feed:ZBOZICZ/feed:TOLLFREE"/>
            </TOLLFREE>
          </xsl:if>

          <xsl:if test="feed:PROPRIETARY/feed:ZBOZICZ/feed:FIRMY_CZ">
            <FIRMY_CZ>
              <xsl:value-of select="feed:PROPRIETARY/feed:ZBOZICZ/feed:FIRMY_CZ"/>
            </FIRMY_CZ>
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
          <xsl:if test="feed:CODE">
            <PRODUCTNO>
              <xsl:value-of select="feed:CODE"/>
            </PRODUCTNO>
          </xsl:if>

          <xsl:if test="feed:VARIANTS">
            <xsl:for-each select="feed:VARIANTS/feed:VARIANT">
              <VARIANT>
                <xsl:for-each select="./child::node()">
                  <xsl:if test="string-length(name(.)) > 0">
                    <xsl:element name="{name(.)}">
                      <xsl:value-of select="."/>
                    </xsl:element>
                  </xsl:if>
                </xsl:for-each>
              </VARIANT>
            </xsl:for-each>
          </xsl:if>
        </SHOPITEM>
      </xsl:for-each>
    </SHOP>
  </xsl:template>
</xsl:stylesheet>
