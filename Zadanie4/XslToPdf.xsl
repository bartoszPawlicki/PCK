<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:fo="http://www.w3.org/1999/XSL/Format"> 

  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:template match="/">
	<fo:root>
		<fo:layout-master-set>
			<fo:simple-page-master master-name="A4" page-width="21cm" page-height="29.7cm">
				<fo:region-body margin="10mm"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
		
		<fo:page-sequence master-reference="A4">
			<fo:flow flow-name="xsl-region-body">
				<fo:block font-size="22pt" font-weight="bold" text-align="center">Płytoteka</fo:block>
				<fo:table border="solid 1pt black" font-size="10pt">
			
					<fo:table-header font-weight="bold" text-align="center">
						<fo:table-cell border="solid 1pt black">
							<fo:block color="#FF0000">Tytuł</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid 1pt black">
							<fo:block color="#00FF00">Gatunek</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid 1pt black">
							<fo:block color="#0000FF">Data Wydania</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid 1pt black">
							<fo:block color="#FFFF00">Wykonawca</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid 1pt black">
							<fo:block color="#FF00FF">Cena</fo:block>
						</fo:table-cell>
						
					</fo:table-header>
					
					<fo:table-body>
						<xsl:for-each select="dokumentPomocniczy/spisPłyt/płyta"> 
							<fo:table-row border="solid 1pt black">
								<fo:table-cell border="solid 1pt black">
									<fo:block><xsl:value-of select="tytuł"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 1pt black">
									<fo:block><xsl:value-of select="gatunek"/></fo:block>
								</fo:table-cell >
								<fo:table-cell border="solid 1pt black">
									<fo:block><xsl:value-of select="dataWydania"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 1pt black">
									<fo:block><xsl:value-of select="wykonawca"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 1pt black">
									<fo:block text-align="right"><xsl:value-of select="cena"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			<fo:block font-size="12pt" color="#FFFFFF">N</fo:block>
			<fo:table border="solid 1pt #0000FF" font-size="12pt" font-style="italic" text-align="center">
			
				<fo:table-header font-weight="bold" text-align="center">
						
						<fo:table-row border="solid 1pt black">
								<fo:table-cell border="solid 1pt black">
									<fo:block font-size="20pt">Podsumowanie</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 1pt black">
									<fo:block>Wartość:</fo:block>
								</fo:table-cell>
						</fo:table-row>
						
				</fo:table-header>
					<fo:table-body>
							<fo:table-row border="solid 1pt black">
								<fo:table-cell border="solid 1pt black">
									<fo:block>Łączna liczba gatunków:</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 1pt black">
									<fo:block><xsl:value-of select="dokumentPomocniczy/podsumowanie/liczbaGatunków"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row border="solid 1pt black">
								<fo:table-cell border="solid 1pt black">
									<fo:block>Łączna cena wszystkich płyt:</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 1pt black">
									<fo:block><xsl:value-of select="dokumentPomocniczy/podsumowanie/łącznaCenaPłyt"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row border="solid 1pt black">
								<fo:table-cell border="solid 1pt black">
									<fo:block>VAT (od całości) 23%:</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 1pt black">
									<fo:block><xsl:value-of select="dokumentPomocniczy/podsumowanie/VAT"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row border="solid 1pt black">
								<fo:table-cell border="solid 1pt black">
									<fo:block>Łączna ilość wszystkich płyt:</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 1pt black">
									<fo:block><xsl:value-of select="dokumentPomocniczy/podsumowanie/łącznaIlośćPłyt"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row border="solid 1pt black">
								<fo:table-cell border="solid 1pt black">
									<fo:block>Data wygenerowania raportu:</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 1pt black">
									<fo:block><xsl:value-of select="dokumentPomocniczy/podsumowanie/dataWygenerowania"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
					</fo:table-body>
			</fo:table>
			</fo:flow>
		</fo:page-sequence>
	</fo:root>
  </xsl:template>
</xsl:stylesheet>