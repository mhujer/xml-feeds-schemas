<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:feed="urn:x-hujer:feed:universal" xml:lang="cs">

  <!-- nemají se používat obrázky? -->
  <xsl:param name="dont_use_images"/>

  <xsl:output method="xml" encoding="utf-8"/>

  <xsl:attribute-set name="bunka">
    <xsl:attribute name="border">1pt solid black</xsl:attribute>
    <xsl:attribute name="padding">3pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:template match="/">
    <fo:root language="cs">
      <!-- Definice layoutu stránek -->
      <fo:layout-master-set>
        <!-- Definice layoutu první stránky bez zápatí -->
        <fo:simple-page-master master-name="prvni" page-height="297mm" page-width="210mm"
          margin="1in">
          <!-- Tiskové zrcadlo - oblast pro samotný obsah stránky -->
          <fo:region-body margin-bottom="15mm"/>
        </fo:simple-page-master>

        <!-- Rozměry stránky a její okraje -->
        <fo:simple-page-master master-name="normalni" page-height="297mm" page-width="210mm"
          margin="0.75in">
          <!-- Tiskové zrcadlo - oblast pro samotný obsah stránky -->
          <fo:region-body margin-bottom="15mm"/>
          <!-- Oblast pro patu stránky -->
          <fo:region-after extent="10mm" padding-top="20mm"/>
        </fo:simple-page-master>

        <fo:page-sequence-master master-name="katalog">
          <fo:repeatable-page-master-alternatives>
            <fo:conditional-page-master-reference master-reference="prvni" page-position="first"/>
            <fo:conditional-page-master-reference master-reference="normalni" page-position="any"/>
          </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>

      </fo:layout-master-set>

      <!-- Definice obsahu stránky -->
      <fo:page-sequence master-reference="katalog">
        <!-- Společný obsah všech stránek v patě stránky -->
        <fo:static-content flow-name="xsl-region-after">
          <fo:block text-align-last="justify" clear="both">
            <fo:leader leader-pattern="rule" color="grey"/>
          </fo:block>
          <fo:block text-align="center">
            <xsl:text>Strana </xsl:text>
            <fo:page-number/> / <fo:page-number-citation ref-id="last-page"/>
          </fo:block>
        </fo:static-content>
        <!-- Samotný text dokumentu -->
        <fo:flow flow-name="xsl-region-body">
          <fo:block font-size="300%" font-weight="bold">Feed produktů</fo:block>
          <fo:block font-size="80%" page-break-after="always">
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
          <fo:block id="last-page"/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

  <xsl:template match="feed:ITEM">
    <fo:block margin-bottom="10pt" keep-together.within-page="always" id="{generate-id()}"
      keep-with-next="always">
      <fo:block font-size="200%" font-weight="bold">
        <xsl:value-of select="feed:PRODUCTNAME"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="feed:PRODUCTNAMEEXT"/>
      </fo:block>

      <fo:block padding="5pt">
        <xsl:apply-templates select="feed:IMGURL"/>
        <xsl:apply-templates select="feed:PRICE_VAT"/>
        <xsl:apply-templates select="feed:EAN"/>
        <xsl:apply-templates select="feed:CODE"/>
        <xsl:apply-templates select="feed:DELIVERY_DATE"/>
        <xsl:apply-templates select="feed:MANUFACTURER"/>
        <fo:block text-align="justify" hyphenate="true" margin-top="5pt">
          <xsl:value-of select="feed:DESCRIPTION"/>
        </fo:block>
        <xsl:apply-templates select="feed:ITEM_TYPE"/>
        <xsl:apply-templates select="feed:CATEGORIES"/>

        <fo:block clear="both"/>

        <xsl:apply-templates select="feed:PARAMETERS"/>
      </fo:block>
    </fo:block>
  </xsl:template>

  <xsl:template match="feed:IMGURL">
    <fo:float float="right">
      <fo:block max-width="100pt" max-height="100pt" margin-left="5pt" margin-right="5pt"
        margin-bottom="5pt">
        <xsl:choose>
          <xsl:when test="$dont_use_images = '1'">
            <fo:block width="100pt" height="100pt" border="1pt solid black">IMG</fo:block>
          </xsl:when>
          <xsl:otherwise>
            <fo:external-graphic content-width="100pt" content-height="100pt">
              <xsl:attribute name="src">url(<xsl:value-of select="."/>)</xsl:attribute>
            </fo:external-graphic>
          </xsl:otherwise>
        </xsl:choose>
      </fo:block>
    </fo:float>
  </xsl:template>

  <xsl:template match="feed:EAN">
    <fo:block>
      <fo:inline font-weight="bold">EAN: </fo:inline>
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>

  <xsl:template match="feed:CODE">
    <fo:block>
      <fo:inline font-weight="bold">Kód produktu: </fo:inline>
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>

  <xsl:template match="feed:DELIVERY_DATE">
    <fo:block>
      <fo:inline font-weight="bold"> Doručení je možné <xsl:choose>
          <xsl:when test=". = 0">ihned</xsl:when>
          <xsl:otherwise>za <xsl:value-of select="."/> dní</xsl:otherwise>
        </xsl:choose>
      </fo:inline>
    </fo:block>
  </xsl:template>

  <xsl:template match="feed:ITEM_TYPE">
    <xsl:if test=". = 'bazaar'">
      <fo:block font-style="italic" margin-top="5pt">Zboží je bazarové</fo:block>
    </xsl:if>
  </xsl:template>

  <xsl:template match="feed:MANUFACTURER">
    <fo:block>
      <fo:inline font-weight="bold">Výrobce: </fo:inline>
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>

  <xsl:template match="feed:PRICE_VAT">
    <fo:block font-size="130%" font-weight="bold" margin-bottom="5pt">
      <xsl:value-of select="."/>&#160;Kč (<xsl:value-of select="../feed:PRICE"/>&#160;Kč bez
        DPH<xsl:if test="../feed:DUES">, další poplatky: <xsl:value-of select="../feed:DUES"
        />&#160;Kč</xsl:if>)</fo:block>
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
