<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:x="http://purl.org/net/xml2rfc/ext"
               xmlns:rdf='http://www.w3.org/1999/02/22-rdf-syntax-ns#'
               version="1.0"
               exclude-result-prefixes="rdf x"
>

<xsl:output indent="yes" omit-xml-declaration="yes"/>

<xsl:template match="/">
  <xsl:variable name="table">
    <texttable align="left" suppress-title="true" anchor="iana.header.registration.table">
      <ttcol>Header Field Name</ttcol>
      <ttcol>Protocol</ttcol>
      <ttcol>Status</ttcol>
      <ttcol>Reference</ttcol>
      <xsl:text>&#10;</xsl:text>
      <xsl:apply-templates select="//section[iref/@item='Headers']">
        <xsl:sort select="iref[@item='Headers']/@subitem"/>
      </xsl:apply-templates>
    </texttable>
    <xsl:text>&#10;</xsl:text>
  </xsl:variable>

  <xsl:comment>AUTOGENERATED FROM extract-header-defs.xslt, do not edit manually</xsl:comment>
  <xsl:text>&#10;</xsl:text>
  <xsl:copy-of select="$table"/>
  <xsl:comment>(END)</xsl:comment>
  <xsl:text>&#10;</xsl:text>
  
  <!-- check against current version -->
  <xsl:variable name="oldtable" select="//texttable[@anchor='iana.header.registration.table']" />

  <xsl:variable name="s">
    <xsl:apply-templates select="$table//texttable" mode="tostring"/>
  </xsl:variable>
  
  <xsl:variable name="s1">
    <xsl:apply-templates select="$oldtable" mode="tostring"/>
  </xsl:variable>

  <xsl:if test="$s != $s1">
    <xsl:message>WARNING: table contained inside source document needs to be updated</xsl:message>
    <xsl:message><xsl:value-of select="$s"/></xsl:message>
    <xsl:message><xsl:value-of select="$s1"/></xsl:message>
  </xsl:if>

</xsl:template>

<xsl:template match="*" mode="tostring">
  <xsl:text>&lt;</xsl:text>
  <xsl:value-of select="name()"/>
  <xsl:for-each select="@*">
    <xsl:sort select="name()"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:text>=</xsl:text>
    <xsl:value-of select="."/>
  </xsl:for-each>
  <xsl:text>&gt;</xsl:text>
  
  <xsl:apply-templates select="node()" mode="tostring"/>
  
  <xsl:text>&lt;/</xsl:text>
  <xsl:value-of select="name()"/>
  <xsl:text>&gt;</xsl:text>

</xsl:template>

<xsl:template match="text()" mode="tostring">
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="texttable/text()" mode="tostring"/>
<xsl:template match="texttable/c[xref]/text()" mode="tostring"/>

<xsl:template match="section">
  <xsl:text>&#10;</xsl:text>
  <c><xsl:value-of select="iref[@item='Headers']/@subitem"/></c>
  <c>http</c>
  <c>standard</c>
  <c><xref target="{@anchor}"/></c>
</xsl:template>

</xsl:transform>