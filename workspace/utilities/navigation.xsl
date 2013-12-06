<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="navigation-primary">

  <nav id="navbar-main" class="navbar navbar-default navbar-fixed-top visible-xs" role="navigation">

    <div class="container">

      <div class="navbar-header">
        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/">
          <h4>insomnia</h4>
          <h5>
            <span class="light">—</span>
            <xsl:text>coffee co.</xsl:text>
            <span class="light">—</span>
          </h5>
        </a>
      </div><!-- .navbar-header -->

      <div class="collapse navbar-collapse" id="navbar-collapse">

        <ul class="nav navbar-nav">
          <xsl:apply-templates select="page"/>
          <li>
            <a href="https://squareup.com/market/insomnia-coffee-baseline" target="_blank">
              <strong>Store</strong>
              <small>shop our stuff</small>
            </a>
          </li>
        </ul>

      </div><!-- .nav-collapse -->
    </div><!-- .container -->

  </nav>

</xsl:template>


<xsl:template match="navigation-primary/page">

  <xsl:variable name="this-handle">
    <xsl:value-of select="@handle"/>
  </xsl:variable>

  <li>
    <xsl:choose>
      <xsl:when test="@handle = $current-page">

      </xsl:when>
      <xsl:otherwise>

      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@handle = $current-page">
      <xsl:attribute name="class">
        <xsl:text>active</xsl:text>
      </xsl:attribute>
    </xsl:if>
    <a>
      <xsl:attribute name="href"><xsl:value-of select="$root"/>/<xsl:value-of select="@handle"/></xsl:attribute>
      <strong>
        <xsl:value-of select="/data/page-data-navigation/entry[page/page/@handle = $this-handle]/title"/>
      </strong>
      <small>
        <xsl:value-of select="/data/page-data-navigation/entry[page/page/@handle = $this-handle]/tagline-menu"/>
      </small>
    </a>
  </li>


</xsl:template>


</xsl:stylesheet>