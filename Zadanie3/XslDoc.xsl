<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://tempuri.org/OurNamespace"
xmlns:default="http://tempuri.org/OurNamespace"
       xmlns:hn="http://tempuri.org/HeaderNamespace"
       xmlns:ntn="http://tempuri.org/NumericalTypehnamespace">

<xsl:template match="/">
  Zestawienie płyt - dokument pomocniczy
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="default:płyta">
  <p>
  <xsl:apply-templates select="default:tytuł"/>
  <xsl:apply-templates select="default:wykonawca"/>
  <xsl:apply-templates select="ntn:cena"/>
  </p>
</xsl:template>

<xsl:template match="default:tytuł">
  Tytuł: <span style="color:#ff0000">
  <xsl:value-of select="."/></span>
</xsl:template>

<xsl:template match="default:wykonawca">
  Wykonawca: <span style="color:#00ff00">
  <xsl:value-of select="."/></span>
</xsl:template>

<xsl:template match="ntn:cena">
  Cena: <span style="color:#0000ff">
  <xsl:value-of select="."/></span>
</xsl:template>

</xsl:stylesheet>