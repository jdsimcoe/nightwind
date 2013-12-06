<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../utilities/master.xsl"/>


<xsl:template match="data">

  <xsl:if test="string-length(events-latest/entry)">

    <div class="blank-bar">
      <div class="center">
        <i class="icon-grinder icon-medium"></i>
      </div>
      <h4>Upcoming Events</h4>

      <div class="container">
        <div class="row">
          <xsl:apply-templates select="events-latest/entry" mode="main"/>
        </div>
      </div>

      <br/><br/>

    </div>

  </xsl:if>


</xsl:template>


</xsl:stylesheet>