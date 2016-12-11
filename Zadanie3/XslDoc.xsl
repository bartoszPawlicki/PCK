<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://tempuri.org/OurNamespace"
xmlns:default="http://tempuri.org/OurNamespace"
       xmlns:hn="http://tempuri.org/HeaderNamespace"
       xmlns:ntn="http://tempuri.org/NumericalTypehnamespace">
	   
<xsl:output method="xml" encoding="utf-8" />
<xsl:template match="/">
  <dokumentPomocniczy>
	<spisPłyt>
		<xsl:apply-templates select="//default:zbiór"/>
	</spisPłyt>
	<podsumowanie>
        <liczbaGatunków>
          Łączna liczba gatunków: <xsl:value-of select="count(distinct-values(//default:zbiór/default:płyta/default:gatunek))"/>.
        </liczbaGatunków>
        <xsl:variable name="łącznaCena" select="sum(//default:zbiór/default:płyta/ntn:cena[@waluta = 'zł'])" />
        <xsl:variable name="ilośćPłyt" select="count(//default:zbiór/default:płyta)" />
        <łącznaCenaPłyt>
          Łączna cena wszystkich płyt: <xsl:value-of select="$łącznaCena"/> PLN.
        </łącznaCenaPłyt>
        <VAT>
          W tym VAT: <xsl:value-of select="$łącznaCena * 0.23 "/> (przy stawce 23%).
        </VAT>
        <łącznaIlośćPłyt>
          Łączna ilość wszystkich płyt: <xsl:value-of select="$ilośćPłyt"/> egzemplarzy.
        </łącznaIlośćPłyt>
        <data>
          Data wygenerowania raportu: <xsl:value-of  select="current-dateTime()"/>.
        </data>
      </podsumowanie>
  </dokumentPomocniczy>
</xsl:template>

<xsl:template match="default:płyta">
  <p>
  <xsl:apply-templates select="default:tytuł"/>
  <xsl:apply-templates select="default:wykonawca"/>
  <xsl:apply-templates select="ntn:cena"/>
  </p>
</xsl:template>

  <xsl:template match="default:zbiór">
    <xsl:for-each select="default:płyta">
      <xsl:sort select="default:gatunek"/>
      <płyta>
        <nr>
          <xsl:value-of select="position()"/>
        </nr>
        <nazwa>
          <xsl:value-of select="default:tytuł"/>
        </nazwa>
        <gatunek>
          <xsl:value-of select="default:gatunek"/>
        </gatunek>
        <data_wydania>
          <xsl:value-of select="default:dataWydania"/>
        </data_wydania>
        <wykonawca>
          <xsl:value-of select="default:wykonawca"/>
        </wykonawca>
        <cena>
          <xsl:value-of select="ntn:cena"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="ntn:cena/@waluta"/>
        </cena>
      </płyta>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>