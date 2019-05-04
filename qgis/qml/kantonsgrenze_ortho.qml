<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="1" maxScale="0" simplifyAlgorithm="0" readOnly="0" version="3.4.7-Madeira" hasScaleBasedVisibilityFlag="0" minScale="1e+8" labelsEnabled="0" simplifyMaxScale="1" simplifyDrawingTol="1" simplifyDrawingHints="0" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="invertedPolygonRenderer" enableorderby="0" preprocessing="0" forceraster="0">
    <renderer-v2 type="RuleRenderer" symbollevels="0" enableorderby="0" forceraster="0">
      <rules key="{4ca774eb-c729-48d0-acea-3748d555f2af}">
        <rule scalemindenom="50000" symbol="0" scalemaxdenom="4000000" key="{f178e212-c527-4700-b1a1-d692a20774dd}"/>
        <rule scalemindenom="1" symbol="1" scalemaxdenom="49999" key="{1e844c80-4dfb-4443-8b3a-2fa8057f78e2}"/>
      </rules>
      <symbols>
        <symbol type="fill" force_rhr="0" name="0" alpha="1" clip_to_extent="1">
          <layer locked="0" class="SimpleFill" enabled="1" pass="0">
            <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
            <prop v="255,255,255,128" k="color"/>
            <prop v="bevel" k="joinstyle"/>
            <prop v="0,0" k="offset"/>
            <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
            <prop v="MM" k="offset_unit"/>
            <prop v="35,35,35,255" k="outline_color"/>
            <prop v="no" k="outline_style"/>
            <prop v="0.26" k="outline_width"/>
            <prop v="MM" k="outline_width_unit"/>
            <prop v="solid" k="style"/>
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
          </layer>
          <layer locked="0" class="SimpleLine" enabled="1" pass="0">
            <prop v="square" k="capstyle"/>
            <prop v="5;2" k="customdash"/>
            <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
            <prop v="MM" k="customdash_unit"/>
            <prop v="1" k="draw_inside_polygon"/>
            <prop v="bevel" k="joinstyle"/>
            <prop v="255,255,255,168" k="line_color"/>
            <prop v="solid" k="line_style"/>
            <prop v="2" k="line_width"/>
            <prop v="MM" k="line_width_unit"/>
            <prop v="0" k="offset"/>
            <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
            <prop v="MM" k="offset_unit"/>
            <prop v="0" k="ring_filter"/>
            <prop v="0" k="use_custom_dash"/>
            <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
        <symbol type="fill" force_rhr="0" name="1" alpha="1" clip_to_extent="1">
          <layer locked="0" class="SimpleFill" enabled="1" pass="0">
            <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
            <prop v="152,125,183,255" k="color"/>
            <prop v="bevel" k="joinstyle"/>
            <prop v="0,0" k="offset"/>
            <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
            <prop v="MM" k="offset_unit"/>
            <prop v="255,255,255,168" k="outline_color"/>
            <prop v="solid" k="outline_style"/>
            <prop v="0.6" k="outline_width"/>
            <prop v="MM" k="outline_width_unit"/>
            <prop v="no" k="style"/>
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </symbols>
    </renderer-v2>
  </renderer-v2>
  <customproperties>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory backgroundAlpha="255" backgroundColor="#ffffff" width="15" minimumSize="0" diagramOrientation="Up" maxScaleDenominator="1e+8" rotationOffset="270" enabled="0" height="15" barWidth="5" scaleDependency="Area" labelPlacementMethod="XHeight" lineSizeType="MM" minScaleDenominator="0" lineSizeScale="3x:0,0,0,0,0,0" scaleBasedVisibility="0" penWidth="0" penAlpha="255" opacity="1" penColor="#000000" sizeScale="3x:0,0,0,0,0,0" sizeType="MM">
      <fontProperties style="" description="Sans Serif,9,-1,5,50,0,0,0,0,0"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings linePlacementFlags="18" showAll="1" zIndex="0" obstacle="0" priority="0" dist="0" placement="1">
    <properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="fid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="t_id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="t_ili_tid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="kantonsname">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="kantonskuerzel">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="kantonsnummer">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" name="" field="fid"/>
    <alias index="1" name="" field="t_id"/>
    <alias index="2" name="" field="t_ili_tid"/>
    <alias index="3" name="" field="kantonsname"/>
    <alias index="4" name="" field="kantonskuerzel"/>
    <alias index="5" name="" field="kantonsnummer"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" expression="" field="fid"/>
    <default applyOnUpdate="0" expression="" field="t_id"/>
    <default applyOnUpdate="0" expression="" field="t_ili_tid"/>
    <default applyOnUpdate="0" expression="" field="kantonsname"/>
    <default applyOnUpdate="0" expression="" field="kantonskuerzel"/>
    <default applyOnUpdate="0" expression="" field="kantonsnummer"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" constraints="3" notnull_strength="1" exp_strength="0" field="fid"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="t_id"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="t_ili_tid"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="kantonsname"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="kantonskuerzel"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="kantonsnummer"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="fid" desc=""/>
    <constraint exp="" field="t_id" desc=""/>
    <constraint exp="" field="t_ili_tid" desc=""/>
    <constraint exp="" field="kantonsname" desc=""/>
    <constraint exp="" field="kantonskuerzel" desc=""/>
    <constraint exp="" field="kantonsnummer" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column type="field" hidden="0" width="-1" name="fid"/>
      <column type="field" hidden="0" width="-1" name="t_id"/>
      <column type="field" hidden="0" width="-1" name="t_ili_tid"/>
      <column type="field" hidden="0" width="-1" name="kantonsname"/>
      <column type="field" hidden="0" width="-1" name="kantonskuerzel"/>
      <column type="field" hidden="0" width="-1" name="kantonsnummer"/>
      <column type="actions" hidden="1" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name="fid" editable="1"/>
    <field name="kantonskuerzel" editable="1"/>
    <field name="kantonsname" editable="1"/>
    <field name="kantonsnummer" editable="1"/>
    <field name="t_id" editable="1"/>
    <field name="t_ili_tid" editable="1"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="fid"/>
    <field labelOnTop="0" name="kantonskuerzel"/>
    <field labelOnTop="0" name="kantonsname"/>
    <field labelOnTop="0" name="kantonsnummer"/>
    <field labelOnTop="0" name="t_id"/>
    <field labelOnTop="0" name="t_ili_tid"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>fid</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
