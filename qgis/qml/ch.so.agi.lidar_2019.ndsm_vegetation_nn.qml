<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" hasScaleBasedVisibilityFlag="0" minScale="1e+8" version="3.4.7-Madeira" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <customproperties>
    <property key="WMSBackgroundLayer" value="false"/>
    <property key="WMSPublishDataSourceUrl" value="false"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="identify/format" value="Value"/>
  </customproperties>
  <pipe>
    <rasterrenderer opacity="1" type="singlebandpseudocolor" classificationMax="36" alphaBand="-1" classificationMin="0" band="1">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader classificationMode="1" colorRampType="INTERPOLATED" clip="0">
          <colorramp type="gradient" name="[source]">
            <prop v="247,252,245,255" k="color1"/>
            <prop v="0,68,27,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.13;229,245,224,255:0.26;199,233,192,255:0.39;161,217,155,255:0.52;116,196,118,255:0.65;65,171,93,255:0.78;35,139,69,255:0.9;0,109,44,255" k="stops"/>
          </colorramp>
          <item label="0 m" value="0" color="#fcfcfc" alpha="0"/>
          <item label="0.5 m" value="0.5" color="#e5f5e0" alpha="255"/>
          <item label="> 36 m" value="36" color="#00441b" alpha="255"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" brightness="0"/>
    <huesaturation saturation="0" colorizeBlue="128" colorizeOn="0" colorizeStrength="100" colorizeRed="255" grayscaleMode="0" colorizeGreen="128"/>
    <rasterresampler maxOversampling="2"/>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
