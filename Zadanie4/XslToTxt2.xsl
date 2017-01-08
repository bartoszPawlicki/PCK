<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
  <xsl:output method="text" encoding="utf-8" /> 
  
  <xsl:template match="/">
		<xsl:variable name="odstęp"><xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text></xsl:variable>
		
		<xsl:text>Spis płyt</xsl:text>
		<xsl:text>&#10;</xsl:text> <!-- new line -->
		<xsl:text>&#10;</xsl:text> <!-- new line -->
		
		<xsl:for-each select="dokumentPomocniczy/spisPłyt/płyta">
			<xsl:value-of select="concat('Tytuł  ', $odstęp, $odstęp, $odstęp, $odstęp, tytuł)"/>
			<xsl:text>&#10;</xsl:text> <!-- new line -->
			<xsl:value-of select="concat('Gatunek', $odstęp, $odstęp, $odstęp, $odstęp, gatunek)"/>
			<xsl:text>&#10;</xsl:text> <!-- new line -->
			<xsl:value-of select="concat('Data wydania   ', $odstęp, $odstęp, $odstęp, dataWydania)"/>
			<xsl:text>&#10;</xsl:text> <!-- new line -->
			<xsl:value-of select="concat('Wykonawca       ', $odstęp, $odstęp, $odstęp, wykonawca)"/>
			<xsl:text>&#10;</xsl:text> <!-- new line -->
			<xsl:value-of select="concat('Cena   ', $odstęp, $odstęp, $odstęp, $odstęp, cena)"/>
			<xsl:text>&#10;</xsl:text> <!-- new line -->
			<xsl:value-of select="concat('Waluta ', $odstęp, $odstęp, $odstęp, $odstęp, cena/@waluta)"/>
			<xsl:text>&#10;</xsl:text> <!-- new line -->
			<xsl:text>&#10;</xsl:text> <!-- new line -->
		</xsl:for-each>
		
		<xsl:text>Podsumowanie</xsl:text>
		<xsl:text>&#10;</xsl:text> <!-- new line -->
		<xsl:text>&#10;</xsl:text> <!-- new line -->
		
		<xsl:value-of select="concat('Łączna liczba gatunków:      ', $odstęp, $odstęp, dokumentPomocniczy/podsumowanie/liczbaGatunków)"/>
		<xsl:text>&#10;</xsl:text> <!-- new line -->
		<xsl:value-of select="concat('Łączna cena wszystkich płyt:    ', $odstęp, $odstęp, dokumentPomocniczy/podsumowanie/łącznaCenaPłyt), 'ZŁ'"/>
		<xsl:text>&#10;</xsl:text> <!-- new line -->
		<xsl:value-of select="concat('VAT (od całości) 23%:  ', $odstęp, $odstęp, $odstęp, dokumentPomocniczy/podsumowanie/VAT)"/>
		<xsl:text>&#10;</xsl:text> <!-- new line -->
		<xsl:value-of select="concat('Łączna ilość wszystkich płyt:       ', $odstęp, $odstęp, dokumentPomocniczy/podsumowanie/łącznaIlośćPłyt)"/>
		<xsl:text>&#10;</xsl:text> <!-- new line -->
		<xsl:value-of select="concat('Data wygenerowania raportu:  ', $odstęp, $odstęp, $odstęp, dokumentPomocniczy/podsumowanie/dataWygenerowania)"/>	
		
  </xsl:template>
</xsl:stylesheet>

<!--
		<xsl:text>&#10;</xsl:text>  new line
		<xsl:text>&#160;</xsl:text> space
        <xsl:text>&#x9;</xsl:text> tab char
        <xsl:text>&#10;</xsl:text> line feed char
-->
