<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://tempuri.org/OurNamespace">

<xsl:output method="html" doctype-public="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"/>

  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes"> 
      &lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
    </xsl:text>
    <html lang="pl" xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Płytoteka</title>
    </head>
      <body>
        <h1>Spis płyt</h1>
        <xsl:apply-templates select="//spisPłyt"/>
        <h1>Podsumowanie</h1>
        <xsl:apply-templates select="//podsumowanie"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match ="spisPłyt">
    <table xmlns="http://www.w3.org/1999/xhtml" border ="1">
      <tr>
        <th>ID</th>
        <th>Tytuł</th>
		<th>Autor</th>
        <th>Gatunek</th>
        <th>Data wydania</th>        
        <th>Cena</th>
      </tr>
      <xsl:for-each select="płyta">
        <tr>
          <td>
            <xsl:value-of select="nr"/>
          </td>
          <td>
            <xsl:value-of select="tytuł"/>
          </td>
          <td>
            <xsl:value-of select="wykonawca"/>
          </td>
          <td>
            <xsl:value-of select="gatunek"/>
          </td>
          <td>
            <xsl:value-of select="dataWydania"/>
          </td>
          <td>
            <xsl:value-of select="cena"/>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <xsl:template match="podsumowanie" xmlns="http://www.w3.org/1999/xhtml">
	<p>
      <xsl:value-of select="liczbaGatunków"/>
    </p>
    <p>
      <xsl:value-of select="łącznaCenaPłyt"/>
    </p>
    <p>
      <xsl:value-of select="VAT"/>
    </p>
    <p>
      <xsl:value-of select="łącznaIlośćPłyt"/>
    </p>
    <p>
      <xsl:value-of select="dataWygenerowania"/>
    </p>
  </xsl:template>

</xsl:stylesheet>