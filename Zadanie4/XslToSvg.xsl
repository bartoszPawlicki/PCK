 <?xml version="1.0" encoding="utf-8"?>


<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" encoding="UTF-8" />

  <xsl:variable name="iloscMetalcore">
    <xsl:value-of select="count(dokumentPomocniczy/spisPłyt/płyta[gatunek='metalcore'])"/>
  </xsl:variable>
  <xsl:variable name="iloscProgressive-death-metal">
    <xsl:value-of select="count(dokumentPomocniczy/spisPłyt/płyta[gatunek='progressive-death-metal'])"/>
  </xsl:variable>
  <xsl:variable name="iloscPunk-rock">
    <xsl:value-of select="count(dokumentPomocniczy/spisPłyt/płyta[gatunek='punk-rock'])"/>
  </xsl:variable>
  <xsl:variable name="iloscRap">
    <xsl:value-of select="count(dokumentPomocniczy/spisPłyt/płyta[gatunek='rap'])"/>
  </xsl:variable>
  <xsl:variable name="iloscRock">
    <xsl:value-of select="count(dokumentPomocniczy/spisPłyt/płyta[gatunek='rock'])"/>
  </xsl:variable>
  <xsl:variable name ="wykresSlupekSzerokosc">
    <xsl:value-of select ="40"/>
  </xsl:variable>


  <xsl:template match="/"> 
    <xsl:text disable-output-escaping="yes"> 
      &lt;!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"> 
    </xsl:text>

<svg width="1280px" height="1024px" xmlns="http://www.w3.org/2000/svg">
<script type="text/ecmascript">
<![CDATA[
function MouseIn(evt) 
{
	var rect = evt.target;
	rect.setAttribute("stroke-width", "5");
}
function MouseOut(evt) 
{
	var rect = evt.target;
	rect.setAttribute("stroke-width", "3");
}
]]></script>
      <text font-size="30" y="40" x="260">Ilość płyt w danym gatunku</text>

      <text font-size="30" y="500" x="50">metalcore</text>
      <rect id="rect1" x="70" y="{450 - $iloscMetalcore*60} " rx="2" width="{$wykresSlupekSzerokosc}" height="{$iloscMetalcore*60+2}" fill="#99D9EA" stroke="#00A2E8" stroke-width="3"
            onmouseout="MouseOut(evt)" onmouseover="MouseIn(evt)" >
        
		<animateTransform
            attributeName="transform"
            begin="0s"
            dur="5s"
            type="rotate"
            from="0 90 {450 - $iloscMetalcore*30}"
            to="360 90  {450 - $iloscMetalcore*30} "
            repeatCount="indefinite" />
      </rect>
      <text x="80" y="{430 - $iloscMetalcore*60}" font-size="20" fill="black" visibility="hidden">
        <xsl:value-of select="$iloscMetalcore"/>
        <set attributeName="visibility" from="hidden" to="visible" begin="rect1.mouseover" end="rect1.mouseout"/>
      </text>

      <text font-size="30" y="500" x="210">metal</text>
      <rect id="rect2" x="220" y="{450 - $iloscProgressive-death-metal*60} " rx="2" width="{$wykresSlupekSzerokosc}" height="{$iloscProgressive-death-metal*60+2}" fill="#99D9EA" stroke="#00A2E8" stroke-width="3"
            onmouseout="MouseOut(evt)" onmouseover="MouseIn(evt)" >
        <animate attributeName="stroke" attributeType="XML" begin="0s" dur="4s" fill="freeze" values="white;blue;white" repeatCount="indefinite" />
      </rect>
      <text x="230" y="{430 - $iloscProgressive-death-metal*60}" font-size="20" fill="black" visibility="hidden">
        <xsl:value-of select="$iloscProgressive-death-metal"/>
        <set attributeName="visibility" from="hidden" to="visible" begin="rect2.mouseover" end="rect2.mouseout"/>
      </text>

      <text font-size="30" y="500" x="330">punk-rock</text>
      <rect id="rect3" x="370" y="{450 - $iloscPunk-rock*60} " rx="2" width="{$wykresSlupekSzerokosc}" height="{$iloscPunk-rock*60+2}" fill="#99D9EA" stroke="#00A2E8" stroke-width="3"
            onmouseout="MouseOut(evt)" onmouseover="MouseIn(evt)" >
        <animate attributeName="stroke" attributeType="XML" begin="0s" dur="4s" fill="freeze" values="white;blue;white" repeatCount="indefinite" />
      </rect>
      <text x="380" y="{430 - $iloscPunk-rock*60}" font-size="20" fill="black" visibility="hidden">
        <xsl:value-of select="$iloscPunk-rock"/>
        <set attributeName="visibility" from="hidden" to="visible" begin="rect3.mouseover" end="rect3.mouseout"/>
      </text>

      <text font-size="30" y="500" x="520">rap</text>
      <rect id="rect4" x="520" y="{450 - $iloscRap*60} " rx="2" width="{$wykresSlupekSzerokosc}" height="{$iloscRap*60+2}" fill="#99D9EA" stroke="#00A2E8" stroke-width="3"
            onmouseout="MouseOut(evt)" onmouseover="MouseIn(evt)" >
        <animate attributeName="stroke" attributeType="XML" begin="0s" dur="4s" fill="freeze" values="white;blue;white" repeatCount="indefinite" />
      </rect>
      <text x="530" y="{430 - $iloscRap*60}" font-size="20" fill="black" visibility="hidden">
        <xsl:value-of select="$iloscRap"/>
        <set attributeName="visibility" from="hidden" to="visible" begin="rect4.mouseover" end="rect4.mouseout"/>
      </text>

      <text font-size="30" y="500" x="660">rock</text>
      <rect id="rect5" x="670" y="{450 - $iloscRock*60} " rx="2" width="{$wykresSlupekSzerokosc}" height="{$iloscRock*60+2}" fill="#99D9EA" stroke="#00A2E8" stroke-width="3"
            onmouseout="MouseOut(evt)" onmouseover="MouseIn(evt)" >
        <animateTransform
            attributeName="transform"
            begin="0s"
            dur="5s"
            type="rotate"
            from="0 690 {450 - $iloscRock*30}"
            to="360 690  {450 - $iloscRock*30} "
            repeatCount="indefinite" />
      </rect>
      <text x="680" y="{430 - $iloscRock*60}" font-size="20" fill="black" visibility="hidden">
        <xsl:value-of select="$iloscRock"/>
        <set attributeName="visibility" from="hidden" to="visible" begin="rect5.mouseover" end="rect5.mouseout"/>
      </text>

      
    </svg>
  </xsl:template>
</xsl:stylesheet>