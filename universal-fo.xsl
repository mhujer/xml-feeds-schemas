<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:feed="urn:x-hujer:feed:universal" xml:lang="cs">

  <xsl:output method="xml" encoding="utf-8"/>

  <xsl:attribute-set name="bunka">
    <xsl:attribute name="border">1pt solid black</xsl:attribute>
    <xsl:attribute name="padding">3pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:template match="/">
    <fo:root>
      <!-- Definice layoutu stránky -->
      <fo:layout-master-set>
        <!-- Rozměry stránky a její okraje -->
        <fo:simple-page-master master-name="my-page" page-height="297mm" page-width="210mm"
          margin="1in">
          <!-- Tiskové zrcadlo - oblast pro samotný obsah stránky -->
          <fo:region-body margin-bottom="15mm"/>
          <!-- Oblast pro patu stránky -->
          <fo:region-after extent="10mm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <!-- Definice obsahu stránky -->
      <fo:page-sequence master-reference="my-page">
        <!-- Společný obsah všech stránek v patě stránky -->
        <fo:static-content flow-name="xsl-region-after">
          <fo:block>
            <xsl:text>Strana </xsl:text>
            <fo:page-number/>
          </fo:block>
        </fo:static-content>
        <!-- Samotný text dokumentu -->
        <fo:flow flow-name="xsl-region-body">
          <fo:block font-size="300%" font-weight="bold">Feed produktů</fo:block>
          <fo:block font-size="80%">
            <fo:block font-size="150%">Obsah:</fo:block>
            <xsl:for-each select="/feed:SHOP/feed:ITEM">
              <fo:block text-align-last="justify">
                <fo:basic-link internal-destination="{generate-id()}">
                  <xsl:value-of select="feed:PRODUCTNAME"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="feed:PRODUCTNAMEEXT"/>
                </fo:basic-link>
                <fo:leader leader-pattern="dots"/>
                <fo:page-number-citation ref-id="{generate-id()}"/>
              </fo:block>
            </xsl:for-each>
          </fo:block>
          <fo:block>
            <xsl:apply-templates/>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

  <xsl:template match="feed:ITEM">
    <fo:block margin-bottom="10pt" keep-together.within-page="always" id="{generate-id()}"
      language="cs">
      <fo:block font-size="200%" font-weight="bold">
        <xsl:value-of select="feed:PRODUCTNAME"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="feed:PRODUCTNAMEEXT"/>
      </fo:block>

      <fo:block padding="5pt">
        <xsl:apply-templates select="feed:IMGURL"/>
        <xsl:apply-templates select="feed:PRICE_VAT"/>
        <xsl:apply-templates select="feed:EAN"/>
        <!-- delivery -->
        <fo:block text-align="justify" hyphenate="true">
          <xsl:value-of select="feed:DESCRIPTION"/>
        </fo:block>
        <xsl:apply-templates select="feed:CATEGORIES"/>

        <fo:block clear="both"/>
        <xsl:apply-templates select="feed:PARAMETERS"/>

        <xsl:if test="following-sibling::feed:ITEM">
          <fo:block border-bottom="1px dashed grey" margin-top="10pt" margin-bottom="10pt"/>
        </xsl:if>

      </fo:block>
    </fo:block>
  </xsl:template>

  <xsl:template match="feed:IMGURL">
    <fo:float float="right">
      <fo:block max-width="100pt" max-height="100pt" margin-left="5pt" margin-right="5pt"
        margin-bottom="5pt">
        <!--<fo:block width="100pt" height="100pt" border="1pt solid black">IMG</fo:block>-->
        <fo:external-graphic content-width="100pt" content-height="100pt">
          <xsl:attribute name="src">url(<xsl:value-of select="."/>)</xsl:attribute>
        </fo:external-graphic>
      </fo:block>
    </fo:float>
  </xsl:template>

  <xsl:template match="feed:EAN">
    <fo:block>
      <fo:inline font-weight="bold">EAN: </fo:inline>
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>

  <xsl:template match="feed:PRICE_VAT">
    <fo:block font-size="130%" font-weight="bold" margin-bottom="5pt">
      <xsl:value-of select="."/> Kč (<xsl:value-of select="../feed:PRICE"/> Kč bez DPH)</fo:block>
  </xsl:template>

  <xsl:template match="feed:CATEGORIES">
    <fo:block margin-top="5pt">
      <fo:block font-size="110%" font-weight="bold">Kategorie: </fo:block>
      <xsl:for-each select="feed:CATEGORY">
        <xsl:value-of select="."/>
        <xsl:if test="following-sibling::feed:CATEGORY"> | </xsl:if>
      </xsl:for-each>
    </fo:block>
  </xsl:template>

  <xsl:template match="feed:PARAMETERS">
    <fo:block margin-top="5pt">
      <fo:block font-size="110%" font-weight="bold">Parametry:</fo:block>
      <fo:table>
        <fo:table-column width="30%"/>
        <fo:table-column width="70%"/>
        <fo:table-body>
          <xsl:for-each select="feed:PARAMETER">
            <fo:table-row>
              <fo:table-cell xsl:use-attribute-sets="bunka">
                <fo:block font-weight="bold">
                  <xsl:value-of select="./feed:NAME"/>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell xsl:use-attribute-sets="bunka">
                <fo:block>
                  <xsl:for-each select="feed:VALUE">
                    <xsl:value-of select="."/>
                    <xsl:if test="following-sibling::feed:VALUE"> | </xsl:if>
                  </xsl:for-each>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </xsl:for-each>
        </fo:table-body>
      </fo:table>

    </fo:block>
  </xsl:template>


</xsl:stylesheet>
