<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="toolkit.xsl"/>
<xsl:import href="date-time-advanced.xsl" />
<xsl:import href="navigation.xsl"/>
<xsl:import href="globals.xsl"/>

<xsl:output method="xml"
    doctype-public="XSLT-compat"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="yes"
    encoding="UTF-8"
    indent="yes" />

<xsl:param name="cookie-username" />

<xsl:template match="/">

  <html lang="en">
  <head>
    <xsl:choose>
      <xsl:when test="$page-title = 'Home' or $page-title = 'Error'">
        <title>
          <xsl:value-of select="$website-name"/>
          <xsl:text> · </xsl:text>
          <xsl:value-of select="$website-subtitle"/>
        </title>
      </xsl:when>
      <xsl:otherwise>
        <title>
          <xsl:value-of select="/data/page-data-single/entry/title" />
          <xsl:text> · </xsl:text>
          <xsl:value-of select="$website-name"/>
          <xsl:text> · </xsl:text>
          <xsl:value-of select="$website-subtitle"/>
        </title>
      </xsl:otherwise>
    </xsl:choose>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="Nate DeCoste / Nightwind Productions" />
    <meta name="responsimage" data-server="{$root}/image/2/width/height/anchor/0/uploads/images/filename" data-static="{$workspace}/assets/img/spacer.gif" data-loading="{$workspace}/assets/img/loading.gif" />

    <link href="{$workspace}/assets/css/main.css" rel="stylesheet" />
    <link href="{$root}/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" href="{$root}/apple-touch-icon-precomposed.png" />

    <script type="text/javascript" src="//use.typekit.net/mix2ean.js"></script>
    <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
    <script type="text/javascript" src="{$workspace}/assets/js/application.min.js"></script>

<!--     <script type="text/javascript">
      <xsl:comment>
        var _gaq=[["_setAccount","34987"],["_trackPageview"]];
        (function(d,t){
          var g=d.createElement(t), s=d.getElementsByTagName(t)[0];
          g.async=1;
            g.src=("https:"==location.protocol?"//ssl":"//www")+".google-analytics.com/ga.js";
            s.parentNode.insertBefore(g,s)
        }(document,"script"));
      </xsl:comment>
    </script> -->

  </head>

  <body id="{$root-page}">

    <xsl:apply-templates select="data/navigation-primary"/>

    <div id="main">

      <xsl:apply-templates select="data/page-data-single/entry" mode="background"/>

      <div class="overlay">&#160;</div>

      <ul class="nav nav-pills pull-left hidden-xs">
        <li class="pull-left">
          <a class="navbar-brand solo" href="/">
            <i class="icon-wind"></i>
            <div class="wordmark">
              <h4>Nightwind</h4>
              <h5>Productions</h5>
            </div>
          </a>
        </li>
      </ul>
      <ul class="nav nav-pills pull-right hidden-xs">
        <xsl:apply-templates select="data/navigation-primary/page" />
<!--         <li>
          <a href="#" target="_blank">
            <strong>Store</strong>
            <small>shop our stuff</small>
          </a>
        </li> -->
        <xsl:if test="$cookie-username">
          <li class="dropdown">
            <a href="/symphony/">
              <strong><i class="glyphicon glyphicon-wrench"></i></strong>
            </a>
          </li>
        </xsl:if>
      </ul>


      <xsl:apply-templates select="data/page-data-single/entry" mode="quote" />



    </div>

    <div id="content">
      <xsl:apply-templates select="data/page-data-single/entry" mode="content" />
      <xsl:apply-templates />
    </div>

    <div class="about-bar">
      <div class="center">
        <i class="glyphicon glyphicon-globe icon-medium"></i>
      </div>
      <h4>On the Web</h4>
      <p class="lead"><em>The easiest way to stay up to date with Nightwind is via social networks. When you have a chance, check us out and stay “in the know”:</em></p>
      <p class="center links">
        <a href="#" target="_blank"><i class="icon-social-facebook"></i> Facebook</a>
        <a href="#" target="_blank"><i class="glyphicon glyphicon-camera"></i> Instagram</a>
        <a href="https://twitter.com/nightwindprodux" target="_blank"><i class="icon-social-twitter"></i> Twitter</a>
      </p>
    </div>

    <footer class="footer">

      <div class="container">

        <div class="row copy">
          <div class="col-lg-12">
            <div class="center">
              <i class="icon-oregon icon-medium"></i>
            </div>
            <p class="center">
              <xsl:choose>
                <xsl:when test="$this-year = 2013">
                  <xsl:text>&#xa9;&#160;</xsl:text>
                  <xsl:value-of select="$this-year" />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>&#xa9;&#160;2013–</xsl:text>
                  <xsl:value-of select="$this-year" />
                </xsl:otherwise>
              </xsl:choose>
              <xsl:text>.&#160;</xsl:text>
              <xsl:value-of select="$website-name"/>
              <xsl:text> All rights reserved.</xsl:text>
              <xsl:text>&#160;&#160;•&#160;&#160;Designed &amp; coded by </xsl:text>
              <a href="http://simko.io/"><strong>Simko.io</strong></a>
             </p>
          </div> <!-- .row -->

        </div>
      </div><!-- .container -->
    </footer>

    <xsl:call-template name="livereload"/>

  </body>

</html>

</xsl:template>


</xsl:stylesheet>