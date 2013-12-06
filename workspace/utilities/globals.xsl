<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="page-data-single/entry" mode="background">

  <xsl:attribute name="style">
    <xsl:text>background-image: url('</xsl:text>
    <xsl:value-of select="$root"/>
    <xsl:text>/image/2/1800/1200/5/0/uploads/images/</xsl:text>
    <xsl:value-of select="image/item/image"/>
    <xsl:text>');</xsl:text>
  </xsl:attribute>

</xsl:template>


<xsl:template match="page-data-single/entry" mode="quote">

  <blockquote>
    <xsl:value-of select="tagline-masthead" disable-output-escaping="yes"/>
  </blockquote>

</xsl:template>


<xsl:template match="page-data-single/entry" mode="content">

  <xsl:if test="string-length(content) &gt;= 0">

    <xsl:value-of select="content" disable-output-escaping="yes" />

  </xsl:if>

</xsl:template>


<xsl:template match="locations-all/entry" mode="footer">
  <div class="col-md-3 location">
    <a href="{$root}/locations/{title/@handle}">
      <h5><xsl:value-of select="title"/></h5>
      <address>
        <xsl:value-of select="address"/><br/>
        <xsl:value-of select="city"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="state"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="zip"/><br/>
        <xsl:value-of select="phone"/>
      </address>
      <hr/>
      <div class="hours">
        <xsl:value-of select="hours" disable-output-escaping="yes"/>
      </div>
    </a>
  </div>
</xsl:template>


<xsl:template match="locations-all/entry" mode="main">

  <a>
    <xsl:attribute name="href">
      <xsl:value-of select="$root"/>
      <xsl:text>/locations/</xsl:text>
      <xsl:value-of select="title/@handle"/>
    </xsl:attribute>

    <div id="{title/@handle}" class="col-md-4">
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="count(/data/locations-all/entry) = 4 and position() = 4">
            <xsl:text>col-md-4 col-md-offset-4</xsl:text>
          </xsl:when>
          <xsl:when test="count(/data/locations-all/entry) = 5 and position() = 4">
            <xsl:text>col-md-4 col-md-offset-2</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>col-md-4</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <div class="panel panel-default">
        <img class="img-responsive" width="100%" style="border-top: 10px solid {color}">
          <xsl:attribute name="data-responsimage">
            <xsl:value-of select="image/item/image"/>
          </xsl:attribute>
        </img>
        <div class="panel-body">
          <div class="panel-content">
            <h4 class="center"><xsl:value-of select="title"/></h4>
            <address>
              <xsl:value-of select="address"/><br/>
              <xsl:value-of select="city"/>
              <xsl:text>, </xsl:text>
              <xsl:value-of select="state"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="zip"/><br/>
              <xsl:value-of select="phone"/>
            </address>
            <hr/>
            <div class="hours">
              <xsl:value-of select="hours" disable-output-escaping="yes"/>
            </div>
          </div>
        </div>
      </div>
    </div>

  </a>

</xsl:template>


<xsl:template match="events-latest/entry" mode="main">
  <xsl:call-template name="event-entry"/>
</xsl:template>

<xsl:template match="events-all/entry" mode="main">
  <xsl:call-template name="event-entry"/>
</xsl:template>

<xsl:template match="events-locations/entry" mode="main">
  <xsl:call-template name="event-entry"/>
</xsl:template>

<xsl:template name="event-entry" mode="main">

  <a>
    <xsl:attribute name="href">
      <xsl:value-of select="$root"/>
      <xsl:text>/events/</xsl:text>
      <xsl:value-of select="title/@handle"/>
    </xsl:attribute>

    <div style="background-color:{location/item/color};border:15px double white">
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="$current-page = 'locations'">
            <xsl:text>col-md-6 event</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>col-md-4 event</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <h5>
        <xsl:for-each select="date/date">
          <xsl:if test="position() = 2">
            <xsl:text> • </xsl:text>
          </xsl:if>
          <xsl:call-template name="format-date">
            <xsl:with-param name="date" select="." />
            <xsl:with-param name="format" select="'%m-;. %d;, %y+;'" />
          </xsl:call-template>
        </xsl:for-each>
      </h5>
      <h4>
        <xsl:value-of select="title"/>
      </h4>
      <h5>
        <xsl:value-of select="location/item/title"/>
      </h5>
    </div>

  </a>

</xsl:template>


</xsl:stylesheet>
