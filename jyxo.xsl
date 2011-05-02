<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:feed="urn:x-hujer:feed:universal">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/feed:shop">
    <xsl:text disable-output-escaping="yes">
<![CDATA[<?xml-stylesheet type="text/xsl" href="jyxo-web.xsl"?>]]>
</xsl:text>
    <SHOP xmlns="urn:x-hujer:feed:jyxo" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="urn:x-hujer:feed:jyxo jyxo.xsd">
      <xsl:for-each select="feed:item">
        <SHOPITEM>
          <PRODUCT>
            <xsl:value-of select="feed:name"/>
          </PRODUCT>
          <DESCRIPTION>
            <xsl:value-of select="feed:description"/>
          </DESCRIPTION>
          <URL>
            <xsl:value-of select="feed:url"/>
          </URL>
          <IMGURL>
            <xsl:value-of select="feed:imgurl"/>
          </IMGURL>
          <PRICE>
            <xsl:value-of select="feed:price"/>
          </PRICE>
          <PRICE_VAT>
            <xsl:value-of select="feed:price_vat"/>
          </PRICE_VAT>
          <VAT>
            <xsl:value-of select="feed:vat"/>
          </VAT>
          <xsl:if test="string-length(feed:manufacturer) > 0">
            <MANUFACTURER>
              <xsl:value-of select="feed:manufacturer"/>
            </MANUFACTURER>
          </xsl:if>
          <xsl:if test="string-length(feed:ean) > 0">
            <EAN>
              <xsl:value-of select="feed:ean"/>
            </EAN>
          </xsl:if>
          <xsl:if test="string-length(feed:delivery_date) > 0">
            <DELIVERY_DATE>
              <xsl:value-of select="feed:delivery_date"/>
            </DELIVERY_DATE>
          </xsl:if>
          <xsl:if test="string-length(feed:item_type) > 0 and feed:item_type != 'new'">
            <ITEM_TYPE>
              <xsl:value-of select="feed:item_type"/>
            </ITEM_TYPE>
          </xsl:if>
        </SHOPITEM>
      </xsl:for-each>
    </SHOP>
  </xsl:template>
</xsl:stylesheet>
