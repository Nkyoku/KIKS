<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="yes" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="56" name="wert" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="101" name="Hidden" color="15" fill="1" visible="yes" active="yes"/>
<layer number="102" name="Changes" color="12" fill="1" visible="yes" active="yes"/>
<layer number="105" name="Beschreib" color="9" fill="1" visible="no" active="no"/>
<layer number="106" name="BGA-Top" color="4" fill="1" visible="no" active="no"/>
<layer number="107" name="BD-Top" color="5" fill="1" visible="no" active="no"/>
<layer number="151" name="HeatSink" color="14" fill="1" visible="no" active="no"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="no" active="no"/>
<layer number="201" name="201bmp" color="2" fill="1" visible="no" active="no"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
<layer number="254" name="OrgLBR" color="13" fill="1" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ic-Invensense">
<packages>
<package name="QFN24-0.5">
<wire x1="-2" y1="-2" x2="-2" y2="-1.55" width="0.127" layer="21"/>
<wire x1="-2" y1="-2" x2="-1.55" y2="-2" width="0.127" layer="21"/>
<wire x1="-2" y1="1.55" x2="-2" y2="2" width="0.127" layer="21"/>
<wire x1="-2" y1="2" x2="-1.55" y2="2" width="0.127" layer="21"/>
<wire x1="1.55" y1="2" x2="2" y2="2" width="0.127" layer="21"/>
<wire x1="2" y1="2" x2="2" y2="1.55" width="0.127" layer="21"/>
<wire x1="2" y1="-2" x2="2" y2="-1.55" width="0.127" layer="21"/>
<wire x1="2" y1="-2" x2="1.55" y2="-2" width="0.127" layer="21"/>
<wire x1="1.55" y1="-2" x2="-1.55" y2="-2" width="0.127" layer="51"/>
<wire x1="-2" y1="-1.55" x2="-2" y2="1.55" width="0.127" layer="51"/>
<wire x1="-1.55" y1="2" x2="1.55" y2="2" width="0.127" layer="51"/>
<wire x1="2" y1="1.55" x2="2" y2="-1.55" width="0.127" layer="51"/>
<circle x="-1.7" y="1.7" radius="0.1" width="0.127" layer="21"/>
<smd name="1" x="-2.125" y="1.25" dx="0.95" dy="0.25" layer="1" rot="R180"/>
<text x="2.5" y="2" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="2.5" y="-3" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<rectangle x1="-2" y1="1.125" x2="-1.65" y2="1.375" layer="51"/>
<smd name="2" x="-2.125" y="0.75" dx="0.95" dy="0.25" layer="1" rot="R180"/>
<smd name="3" x="-2.125" y="0.25" dx="0.95" dy="0.25" layer="1" rot="R180"/>
<smd name="4" x="-2.125" y="-0.25" dx="0.95" dy="0.25" layer="1" rot="R180"/>
<smd name="5" x="-2.125" y="-0.75" dx="0.95" dy="0.25" layer="1" rot="R180"/>
<smd name="6" x="-2.125" y="-1.25" dx="0.95" dy="0.25" layer="1" rot="R180"/>
<smd name="7" x="-1.25" y="-2.1" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-1.45" y1="-1.925" x2="-1.05" y2="-1.675" layer="51" rot="R90"/>
<smd name="8" x="-0.75" y="-2.1" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-0.95" y1="-1.925" x2="-0.55" y2="-1.675" layer="51" rot="R90"/>
<smd name="9" x="-0.25" y="-2.1" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-0.45" y1="-1.925" x2="-0.05" y2="-1.675" layer="51" rot="R90"/>
<smd name="10" x="0.25" y="-2.1" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="0.05" y1="-1.925" x2="0.45" y2="-1.675" layer="51" rot="R90"/>
<smd name="11" x="0.75" y="-2.1" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="0.55" y1="-1.925" x2="0.95" y2="-1.675" layer="51" rot="R90"/>
<smd name="12" x="1.25" y="-2.1" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="1.05" y1="-1.925" x2="1.45" y2="-1.675" layer="51" rot="R90"/>
<smd name="13" x="2.125" y="-1.25" dx="0.95" dy="0.25" layer="1"/>
<smd name="14" x="2.125" y="-0.75" dx="0.95" dy="0.25" layer="1"/>
<smd name="15" x="2.125" y="-0.25" dx="0.95" dy="0.25" layer="1"/>
<smd name="16" x="2.125" y="0.25" dx="0.95" dy="0.25" layer="1"/>
<smd name="17" x="2.125" y="0.75" dx="0.95" dy="0.25" layer="1"/>
<smd name="18" x="2.125" y="1.25" dx="0.95" dy="0.25" layer="1"/>
<smd name="19" x="1.25" y="2.1" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="1.05" y1="1.675" x2="1.45" y2="1.925" layer="51" rot="R270"/>
<smd name="20" x="0.75" y="2.1" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="0.55" y1="1.675" x2="0.95" y2="1.925" layer="51" rot="R270"/>
<smd name="21" x="0.25" y="2.1" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="0.05" y1="1.675" x2="0.45" y2="1.925" layer="51" rot="R270"/>
<smd name="22" x="-0.25" y="2.1" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-0.45" y1="1.675" x2="-0.05" y2="1.925" layer="51" rot="R270"/>
<smd name="23" x="-0.75" y="2.1" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-0.95" y1="1.675" x2="-0.55" y2="1.925" layer="51" rot="R270"/>
<smd name="24" x="-1.25" y="2.1" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-1.45" y1="1.675" x2="-1.05" y2="1.925" layer="51" rot="R270"/>
<smd name="PAD" x="0" y="0" dx="2.7" dy="2.6" layer="1"/>
<rectangle x1="-2" y1="0.625" x2="-1.65" y2="0.875" layer="51"/>
<rectangle x1="-2" y1="0.125" x2="-1.65" y2="0.375" layer="51"/>
<rectangle x1="-2" y1="-0.375" x2="-1.65" y2="-0.125" layer="51"/>
<rectangle x1="-2" y1="-0.875" x2="-1.65" y2="-0.625" layer="51"/>
<rectangle x1="-2" y1="-1.375" x2="-1.65" y2="-1.125" layer="51"/>
<rectangle x1="1.65" y1="-1.375" x2="2" y2="-1.125" layer="51" rot="R180"/>
<rectangle x1="1.65" y1="-0.875" x2="2" y2="-0.625" layer="51" rot="R180"/>
<rectangle x1="1.65" y1="-0.375" x2="2" y2="-0.125" layer="51" rot="R180"/>
<rectangle x1="1.65" y1="0.125" x2="2" y2="0.375" layer="51" rot="R180"/>
<rectangle x1="1.65" y1="0.625" x2="2" y2="0.875" layer="51" rot="R180"/>
<rectangle x1="1.65" y1="1.125" x2="2" y2="1.375" layer="51" rot="R180"/>
</package>
</packages>
<symbols>
<symbol name="MPU-6000">
<text x="-12.7" y="15.748" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-12.7" y="-17.78" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<wire x1="-12.7" y1="15.24" x2="-12.7" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-15.24" x2="12.7" y2="-15.24" width="0.254" layer="94"/>
<wire x1="12.7" y1="-15.24" x2="12.7" y2="15.24" width="0.254" layer="94"/>
<wire x1="12.7" y1="15.24" x2="-12.7" y2="15.24" width="0.254" layer="94"/>
<pin name="INT" x="15.24" y="-5.08" length="short" rot="R180"/>
<pin name="CLKOUT" x="15.24" y="10.16" length="short" rot="R180"/>
<pin name="CLKIN" x="15.24" y="12.7" length="short" rot="R180"/>
<pin name="CPOUT" x="-15.24" y="-12.7" length="short"/>
<pin name="SDA/SDI" x="15.24" y="2.54" length="short" rot="R180"/>
<pin name="SCL/SCLK" x="15.24" y="5.08" length="short" rot="R180"/>
<pin name="AUX_DA" x="15.24" y="-12.7" length="short" rot="R180"/>
<pin name="AUX_CL" x="15.24" y="-10.16" length="short" rot="R180"/>
<pin name="AD0/SDO" x="15.24" y="0" length="short" rot="R180"/>
<pin name="REGOUT" x="-15.24" y="-7.62" length="short"/>
<pin name="FSYNC" x="15.24" y="-2.54" length="short" rot="R180"/>
<pin name="VDD" x="-15.24" y="12.7" length="short"/>
<pin name="GND" x="-15.24" y="0" length="short"/>
<pin name="!CS" x="15.24" y="7.62" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MPU-6000" prefix="U">
<gates>
<gate name="G$1" symbol="MPU-6000" x="0" y="0"/>
</gates>
<devices>
<device name="" package="QFN24-0.5">
<connects>
<connect gate="G$1" pin="!CS" pad="8"/>
<connect gate="G$1" pin="AD0/SDO" pad="9"/>
<connect gate="G$1" pin="AUX_CL" pad="7"/>
<connect gate="G$1" pin="AUX_DA" pad="6"/>
<connect gate="G$1" pin="CLKIN" pad="1"/>
<connect gate="G$1" pin="CLKOUT" pad="22"/>
<connect gate="G$1" pin="CPOUT" pad="20"/>
<connect gate="G$1" pin="FSYNC" pad="11"/>
<connect gate="G$1" pin="GND" pad="18 PAD"/>
<connect gate="G$1" pin="INT" pad="12"/>
<connect gate="G$1" pin="REGOUT" pad="10"/>
<connect gate="G$1" pin="SCL/SCLK" pad="23"/>
<connect gate="G$1" pin="SDA/SDI" pad="24"/>
<connect gate="G$1" pin="VDD" pad="13"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Connector">
<packages>
<package name="PIN1X8">
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-5.715" y2="1.27" width="0.127" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-5.08" y2="0.635" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-5.715" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-7.62" y2="0.635" width="0.127" layer="21"/>
<wire x1="-7.62" y1="-0.635" x2="-6.985" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.127" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-5.08" y2="0.635" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-4.445" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-6.985" y1="-1.27" x2="-5.715" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-3.175" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-7.62" y1="-1.27" x2="-7.62" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="1.27" width="0.127" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.127" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.127" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.127" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.127" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.127" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0.635" y1="1.27" x2="0" y2="0.635" width="0.127" layer="21"/>
<wire x1="0" y1="-0.635" x2="0.635" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-0.635" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="1.905" y2="-1.27" width="0.127" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-10.16" y1="1.27" x2="-10.16" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-10.16" y1="-1.27" x2="-7.62" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-10.16" y1="1.27" x2="-7.62" y2="1.27" width="0.127" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.127" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.127" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.127" layer="21"/>
<wire x1="3.175" y1="1.27" x2="2.54" y2="0.635" width="0.127" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="3.175" y2="-1.27" width="0.127" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="4.445" y2="-1.27" width="0.127" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.127" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.985" y2="1.27" width="0.127" layer="21"/>
<wire x1="6.985" y1="1.27" x2="7.62" y2="0.635" width="0.127" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="6.985" y2="-1.27" width="0.127" layer="21"/>
<wire x1="5.715" y1="1.27" x2="5.08" y2="0.635" width="0.127" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="5.715" y2="-1.27" width="0.127" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="6.985" y2="-1.27" width="0.127" layer="21"/>
<wire x1="7.62" y1="0.635" x2="7.62" y2="-0.635" width="0.127" layer="21"/>
<pad name="2" x="-6.35" y="0" drill="1.3" diameter="1.9" shape="octagon"/>
<pad name="1" x="-8.89" y="0" drill="1.3" diameter="1.9" shape="square"/>
<pad name="3" x="-3.81" y="0" drill="1.3" diameter="1.9" shape="octagon"/>
<pad name="4" x="-1.27" y="0" drill="1.3" diameter="1.9" shape="octagon"/>
<pad name="5" x="1.27" y="0" drill="1.3" diameter="1.9" shape="octagon"/>
<pad name="6" x="3.81" y="0" drill="1.3" diameter="1.9" shape="octagon"/>
<pad name="7" x="6.35" y="0" drill="1.3" diameter="1.9" shape="octagon"/>
<text x="-10.16" y="1.524" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-10.16" y="-2.286" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<wire x1="8.255" y1="1.27" x2="9.525" y2="1.27" width="0.127" layer="21"/>
<wire x1="9.525" y1="1.27" x2="10.16" y2="0.635" width="0.127" layer="21"/>
<wire x1="10.16" y1="-0.635" x2="9.525" y2="-1.27" width="0.127" layer="21"/>
<wire x1="8.255" y1="1.27" x2="7.62" y2="0.635" width="0.127" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="8.255" y2="-1.27" width="0.127" layer="21"/>
<wire x1="8.255" y1="-1.27" x2="9.525" y2="-1.27" width="0.127" layer="21"/>
<wire x1="10.16" y1="0.635" x2="10.16" y2="-0.635" width="0.127" layer="21"/>
<pad name="8" x="8.89" y="0" drill="1.3" diameter="1.9" shape="octagon"/>
</package>
<package name="PIN2X4">
<wire x1="-5.08" y1="1.905" x2="-5.08" y2="0.635" width="0.127" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="-3.175" y2="2.54" width="0.127" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-2.54" y2="1.905" width="0.127" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-3.175" y2="0" width="0.127" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="-5.08" y2="1.905" width="0.127" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-4.445" y2="0" width="0.127" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-2.54" y2="0.635" width="0.127" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-0.635" y2="2.54" width="0.127" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0" y2="1.905" width="0.127" layer="21"/>
<wire x1="0" y1="0.635" x2="-0.635" y2="0" width="0.127" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-2.54" y2="1.905" width="0.127" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="0" width="0.127" layer="21"/>
<wire x1="0" y1="1.905" x2="0" y2="0.635" width="0.127" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.905" y2="2.54" width="0.127" layer="21"/>
<wire x1="0.635" y1="2.54" x2="0" y2="1.905" width="0.127" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="0" width="0.127" layer="21"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-4.445" y1="0" x2="-3.175" y2="0" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-2.54" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-1.905" y1="0" x2="-0.635" y2="0" width="0.127" layer="21"/>
<wire x1="-0.635" y1="0" x2="0" y2="-0.635" width="0.127" layer="21"/>
<wire x1="0" y1="-1.905" x2="-0.635" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-1.905" y1="0" x2="-2.54" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-1.905" y2="-2.54" width="0.127" layer="21"/>
<wire x1="0" y1="-0.635" x2="0" y2="-1.905" width="0.127" layer="21"/>
<wire x1="0.635" y1="0" x2="1.905" y2="0" width="0.127" layer="21"/>
<wire x1="0.635" y1="0" x2="0" y2="-0.635" width="0.127" layer="21"/>
<wire x1="0" y1="-1.905" x2="0.635" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-2.54" x2="-2.54" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-0.635" y2="-2.54" width="0.127" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="1.905" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-2.54" x2="-2.54" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-2.54" y2="0" width="0.127" layer="21"/>
<wire x1="-2.54" y1="0" x2="-3.175" y2="0" width="0.127" layer="21"/>
<wire x1="-5.08" y1="0" x2="-4.445" y2="0" width="0.127" layer="21"/>
<wire x1="1.905" y1="2.54" x2="2.54" y2="1.905" width="0.127" layer="21"/>
<wire x1="2.54" y1="0.635" x2="1.905" y2="0" width="0.127" layer="21"/>
<wire x1="2.54" y1="1.905" x2="2.54" y2="0.635" width="0.127" layer="21"/>
<wire x1="3.175" y1="2.54" x2="4.445" y2="2.54" width="0.127" layer="21"/>
<wire x1="3.175" y1="2.54" x2="2.54" y2="1.905" width="0.127" layer="21"/>
<wire x1="2.54" y1="0.635" x2="3.175" y2="0" width="0.127" layer="21"/>
<wire x1="1.905" y1="0" x2="2.54" y2="-0.635" width="0.127" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="1.905" y2="-2.54" width="0.127" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="2.54" y2="-1.905" width="0.127" layer="21"/>
<wire x1="3.175" y1="0" x2="4.445" y2="0" width="0.127" layer="21"/>
<wire x1="3.175" y1="0" x2="2.54" y2="-0.635" width="0.127" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="3.175" y2="-2.54" width="0.127" layer="21"/>
<wire x1="3.175" y1="-2.54" x2="4.445" y2="-2.54" width="0.127" layer="21"/>
<wire x1="4.445" y1="2.54" x2="5.08" y2="1.905" width="0.127" layer="21"/>
<wire x1="5.08" y1="0.635" x2="4.445" y2="0" width="0.127" layer="21"/>
<wire x1="5.08" y1="1.905" x2="5.08" y2="0.635" width="0.127" layer="21"/>
<wire x1="4.445" y1="0" x2="5.08" y2="-0.635" width="0.127" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="4.445" y2="-2.54" width="0.127" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="5.08" y2="-1.905" width="0.127" layer="21"/>
<pad name="1" x="-3.81" y="-1.27" drill="1.3" shape="square"/>
<pad name="2" x="-3.81" y="1.27" drill="1.3" shape="octagon"/>
<pad name="3" x="-1.27" y="-1.27" drill="1.3" shape="octagon"/>
<pad name="4" x="-1.27" y="1.27" drill="1.3" shape="octagon"/>
<pad name="5" x="1.27" y="-1.27" drill="1.3" shape="octagon"/>
<pad name="6" x="1.27" y="1.27" drill="1.3" shape="octagon"/>
<pad name="7" x="3.81" y="-1.27" drill="1.3" shape="octagon"/>
<pad name="8" x="3.81" y="1.27" drill="1.3" shape="octagon"/>
<text x="-5.08" y="2.794" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-5.08" y="-3.556" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="PIN1X8">
<wire x1="-1.27" y1="-10.16" x2="3.81" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-10.16" x2="3.81" y2="12.7" width="0.4064" layer="94"/>
<wire x1="3.81" y1="12.7" x2="-1.27" y2="12.7" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="12.7" x2="-1.27" y2="-10.16" width="0.4064" layer="94"/>
<text x="-1.27" y="13.335" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-1.27" y="-12.7" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-2.54" y="10.16" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="7.62" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="5.08" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="7" x="-2.54" y="-5.08" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="8" x="-2.54" y="-7.62" visible="pad" length="middle" direction="pas" function="dot"/>
</symbol>
<symbol name="PIN2X4">
<wire x1="-6.35" y1="-5.08" x2="3.81" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="7.62" width="0.4064" layer="94"/>
<wire x1="3.81" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-7.62" y="5.08" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="5.08" y="5.08" visible="pad" length="middle" direction="pas" function="dot" rot="R180"/>
<pin name="3" x="-7.62" y="2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="4" x="5.08" y="2.54" visible="pad" length="middle" direction="pas" function="dot" rot="R180"/>
<pin name="5" x="-7.62" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="6" x="5.08" y="0" visible="pad" length="middle" direction="pas" function="dot" rot="R180"/>
<pin name="7" x="-7.62" y="-2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="8" x="5.08" y="-2.54" visible="pad" length="middle" direction="pas" function="dot" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PIN1X8" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="PIN1X8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="PIN1X8">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PIN2X4" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="PIN2X4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="PIN2X4">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>Supply Symbols</description>
<packages>
</packages>
<symbols>
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="+3V3/2">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+3V3/2" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="+3V3" prefix="+P">
<gates>
<gate name="1" symbol="+3V3" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+3V3/2" prefix="+P">
<gates>
<gate name="1" symbol="+3V3/2" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Passive">
<description>Register, Capacitor, Inductor</description>
<packages>
<package name="1608">
<wire x1="1.35" y1="0.6" x2="1.35" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="-0.6" x2="-1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="0.6" x2="1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.35" y1="-0.6" x2="-1.35" y2="-0.6" width="0.127" layer="21"/>
<smd name="1" x="-0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<smd name="2" x="0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<text x="-1.4" y="0.8" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.4" y="-1.6" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4" y2="0.4" layer="51"/>
<rectangle x1="0.4" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="0.25" x2="0.4" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="-0.4" x2="0.4" y2="-0.25" layer="51"/>
</package>
<package name="2012">
<wire x1="-1.7" y1="0.85" x2="1.7" y2="0.85" width="0.127" layer="21"/>
<wire x1="1.7" y1="0.85" x2="1.7" y2="-0.85" width="0.127" layer="21"/>
<wire x1="1.7" y1="-0.85" x2="-1.7" y2="-0.85" width="0.127" layer="21"/>
<wire x1="-1.7" y1="-0.85" x2="-1.7" y2="0.85" width="0.127" layer="21"/>
<smd name="1" x="-1.125" y="0" dx="0.75" dy="1.25" layer="1"/>
<smd name="2" x="1.125" y="0" dx="0.75" dy="1.25" layer="1"/>
<text x="-1.7" y="1" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.7" y="-1.8" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-1" y1="-0.625" x2="-0.75" y2="0.625" layer="51"/>
<rectangle x1="0.75" y1="-0.625" x2="1" y2="0.625" layer="51"/>
<rectangle x1="-0.75" y1="0.475" x2="0.75" y2="0.625" layer="51"/>
<rectangle x1="-0.75" y1="-0.625" x2="0.75" y2="-0.475" layer="51"/>
</package>
<package name="3216">
<wire x1="2.35" y1="1" x2="2.35" y2="-1" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1" x2="-2.35" y2="-1" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-1" x2="-2.35" y2="1" width="0.127" layer="21"/>
<wire x1="-2.35" y1="1" x2="2.35" y2="1" width="0.127" layer="21"/>
<smd name="1" x="-1.625" y="0" dx="1.05" dy="1.6" layer="1"/>
<smd name="2" x="1.625" y="0" dx="1.05" dy="1.6" layer="1"/>
<text x="-2.4" y="1.2" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-2.4" y="-2" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-1.7" y1="-0.8" x2="-1.1" y2="0.8" layer="51"/>
<rectangle x1="1.1" y1="-0.8" x2="1.7" y2="0.8" layer="51"/>
<rectangle x1="-1.1" y1="0.6" x2="1.1" y2="0.8" layer="51"/>
<rectangle x1="-1.1" y1="-0.8" x2="1.1" y2="-0.6" layer="51"/>
</package>
<package name="1005">
<wire x1="-1.05" y1="0.45" x2="1.05" y2="0.45" width="0.127" layer="21"/>
<wire x1="1.05" y1="0.45" x2="1.05" y2="-0.45" width="0.127" layer="21"/>
<wire x1="1.05" y1="-0.45" x2="-1.05" y2="-0.45" width="0.127" layer="21"/>
<wire x1="-1.05" y1="-0.45" x2="-1.05" y2="0.45" width="0.127" layer="21"/>
<smd name="1" x="-0.55" y="0" dx="0.5" dy="0.5" layer="1"/>
<smd name="2" x="0.55" y="0" dx="0.5" dy="0.5" layer="1"/>
<text x="-1.1" y="0.65" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.1" y="-1.4" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-0.5" y1="-0.25" x2="-0.25" y2="0.25" layer="51"/>
<rectangle x1="0.25" y1="-0.25" x2="0.5" y2="0.25" layer="51"/>
<rectangle x1="-0.25" y1="0.15" x2="0.25" y2="0.25" layer="51"/>
<rectangle x1="-0.25" y1="-0.25" x2="0.25" y2="-0.15" layer="51"/>
</package>
<package name="3225">
<wire x1="2.35" y1="1.45" x2="2.35" y2="-1.45" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1.45" x2="-2.35" y2="-1.45" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-1.45" x2="-2.35" y2="1.45" width="0.127" layer="21"/>
<wire x1="-2.35" y1="1.45" x2="2.35" y2="1.45" width="0.127" layer="21"/>
<smd name="1" x="-1.625" y="0" dx="1.05" dy="2.5" layer="1"/>
<smd name="2" x="1.625" y="0" dx="1.05" dy="2.5" layer="1"/>
<text x="-2.4" y="1.6" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-2.4" y="-2.4" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-1.7" y1="-1.25" x2="-1.1" y2="1.25" layer="51"/>
<rectangle x1="1.1" y1="-1.25" x2="1.7" y2="1.25" layer="51"/>
<rectangle x1="-1.1" y1="1.05" x2="1.1" y2="1.25" layer="51"/>
<rectangle x1="-1.1" y1="-1.25" x2="1.1" y2="-1.05" layer="51"/>
</package>
<package name="0603">
<wire x1="-0.7" y1="0.35" x2="0.7" y2="0.35" width="0.127" layer="21"/>
<wire x1="0.7" y1="0.35" x2="0.7" y2="-0.35" width="0.127" layer="21"/>
<wire x1="0.7" y1="-0.35" x2="-0.7" y2="-0.35" width="0.127" layer="21"/>
<wire x1="-0.7" y1="-0.35" x2="-0.7" y2="0.35" width="0.127" layer="21"/>
<smd name="1" x="-0.3" y="0" dx="0.4" dy="0.3" layer="1"/>
<smd name="2" x="0.3" y="0" dx="0.4" dy="0.3" layer="1"/>
<text x="-1.1" y="0.65" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.1" y="-1.4" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-0.3" y1="-0.15" x2="-0.1" y2="0.15" layer="51"/>
<rectangle x1="0.1" y1="-0.15" x2="0.3" y2="0.15" layer="51"/>
<rectangle x1="-0.25" y1="0.1" x2="0.25" y2="0.15" layer="51"/>
<rectangle x1="-0.25" y1="-0.15" x2="0.25" y2="-0.1" layer="51"/>
</package>
<package name="6432">
<smd name="1" x="-3.2" y="0" dx="1.2" dy="3.2" layer="1"/>
<smd name="2" x="3.2" y="0" dx="1.2" dy="3.2" layer="1"/>
<text x="-3.4" y="1.9" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-3.4" y="-2.6" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-3.4" y1="-1.6" x2="-2.6" y2="1.6" layer="51"/>
<rectangle x1="2.6" y1="-1.6" x2="3.4" y2="1.6" layer="51"/>
<rectangle x1="-2.6" y1="1.4" x2="2.6" y2="1.6" layer="51"/>
<rectangle x1="-2.6" y1="-1.6" x2="2.6" y2="-1.4" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="CAPACITOR">
<wire x1="0" y1="2.54" x2="0" y2="2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="0.508" width="0.1524" layer="94"/>
<text x="1.524" y="2.921" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="1.524" y="-2.159" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<rectangle x1="-2.032" y1="0.508" x2="2.032" y2="1.016" layer="94"/>
<rectangle x1="-2.032" y1="1.524" x2="2.032" y2="2.032" layer="94"/>
<pin name="1" x="0" y="5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
<symbol name="FERRITE-BEADS">
<wire x1="-2.54" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94" curve="-90"/>
<wire x1="0" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94" curve="90"/>
<wire x1="0" y1="0" x2="1.27" y2="1.27" width="0.254" layer="94" curve="-90"/>
<wire x1="2.54" y1="0" x2="1.27" y2="1.27" width="0.254" layer="94" curve="90"/>
<text x="-2.54" y="2.794" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<wire x1="-2.54" y1="1.778" x2="2.54" y2="1.778" width="0.2032" layer="94"/>
<wire x1="-2.54" y1="2.286" x2="2.54" y2="2.286" width="0.2032" layer="94"/>
</symbol>
<symbol name="RESISTOR">
<wire x1="-2.54" y1="0" x2="-2.159" y2="1.016" width="0.2032" layer="94"/>
<wire x1="-2.159" y1="1.016" x2="-1.524" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="-1.524" y1="-1.016" x2="-0.889" y2="1.016" width="0.2032" layer="94"/>
<wire x1="-0.889" y1="1.016" x2="-0.254" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="-0.254" y1="-1.016" x2="0" y2="0" width="0.2032" layer="94"/>
<text x="-5.08" y="1.4986" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-5.08" y="-3.302" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="2" x="2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="C" prefix="C" uservalue="yes">
<gates>
<gate name="G$1" symbol="CAPACITOR" x="0" y="0"/>
</gates>
<devices>
<device name="1608" package="1608">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012" package="2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3216" package="3216">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1005" package="1005">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3225" package="3225">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="FB" prefix="FB" uservalue="yes">
<gates>
<gate name="G$1" symbol="FERRITE-BEADS" x="0" y="0"/>
</gates>
<devices>
<device name="1608" package="1608">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1005" package="1005">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012" package="2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="R" prefix="R" uservalue="yes">
<gates>
<gate name="G$1" symbol="RESISTOR" x="0" y="0"/>
</gates>
<devices>
<device name="1608" package="1608">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012" package="2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3216" package="3216">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="6432" package="6432">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1005" package="1005">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Oscillator">
<description>Oscillator</description>
<packages>
<package name="OSC2520">
<wire x1="-1.25" y1="1" x2="-0.25" y2="1" width="0.127" layer="51"/>
<wire x1="-0.25" y1="1" x2="0.25" y2="1" width="0.127" layer="21"/>
<wire x1="0.25" y1="1" x2="1.25" y2="1" width="0.127" layer="51"/>
<wire x1="1.25" y1="-1" x2="0.25" y2="-1" width="0.127" layer="51"/>
<wire x1="0.25" y1="-1" x2="-0.25" y2="-1" width="0.127" layer="21"/>
<wire x1="-0.25" y1="-1" x2="-1.25" y2="-1" width="0.127" layer="51"/>
<wire x1="-1.25" y1="1" x2="-1.25" y2="0.15" width="0.127" layer="51"/>
<wire x1="-1.25" y1="-1" x2="-1.25" y2="-0.15" width="0.127" layer="51"/>
<wire x1="1.25" y1="-1" x2="1.25" y2="-0.15" width="0.127" layer="51"/>
<wire x1="1.25" y1="1" x2="1.25" y2="0.15" width="0.127" layer="51"/>
<wire x1="1.25" y1="0.15" x2="1.25" y2="-0.15" width="0.127" layer="21"/>
<wire x1="-1.25" y1="0.15" x2="-1.25" y2="-0.15" width="0.127" layer="21"/>
<circle x="-0.15" y="-0.7" radius="0.1" width="0.127" layer="21"/>
<smd name="1" x="-0.825" y="-0.85" dx="0.8" dy="1" layer="1"/>
<smd name="2" x="0.825" y="-0.85" dx="0.8" dy="1" layer="1"/>
<smd name="3" x="0.825" y="0.85" dx="0.8" dy="1" layer="1"/>
<smd name="4" x="-0.825" y="0.85" dx="0.8" dy="1" layer="1"/>
<text x="-1.5" y="-1" size="0.8" layer="25" font="vector" ratio="18" rot="R90">&gt;NAME</text>
<text x="2.5" y="-2" size="0.8" layer="27" font="vector" ratio="18" rot="R90">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="OSCILLATOR-EN">
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-7.62" x2="5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="5.08" x2="-5.08" y2="5.08" width="0.254" layer="94"/>
<text x="-5.08" y="5.588" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-5.08" y="-10.16" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VDD" x="-7.62" y="2.54" length="short"/>
<pin name="GND" x="-7.62" y="-5.08" length="short"/>
<pin name="OUT" x="7.62" y="-2.54" length="short" rot="R180"/>
<pin name="EN" x="-7.62" y="0" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ASDM" prefix="X" uservalue="yes">
<gates>
<gate name="G$1" symbol="OSCILLATOR-EN" x="0" y="0"/>
</gates>
<devices>
<device name="" package="OSC2520">
<connects>
<connect gate="G$1" pin="EN" pad="1"/>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="OUT" pad="3"/>
<connect gate="G$1" pin="VDD" pad="4"/>
</connects>
<technologies>
<technology name=""/>
<technology name="B"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-ams">
<description>austriamicrosystems</description>
<packages>
<package name="FN-6">
<wire x1="1.2" y1="1" x2="1.2" y2="-1" width="0.127" layer="21"/>
<wire x1="-1.2" y1="-1" x2="-1.2" y2="1" width="0.127" layer="21"/>
<smd name="1" x="-0.65" y="-0.875" dx="0.4" dy="1.25" layer="1"/>
<rectangle x1="-0.8" y1="-1" x2="-0.5" y2="-0.25" layer="51"/>
<text x="-1.5" y="-1" size="0.8" layer="25" font="vector" ratio="18" rot="R90">&gt;NAME</text>
<text x="2.5" y="-2" size="0.8" layer="27" font="vector" ratio="18" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.15" y1="-1" x2="0.15" y2="-0.25" layer="51"/>
<rectangle x1="0.5" y1="-1" x2="0.8" y2="-0.25" layer="51"/>
<rectangle x1="0.5" y1="0.25" x2="0.8" y2="1" layer="51" rot="R180"/>
<rectangle x1="-0.15" y1="0.25" x2="0.15" y2="1" layer="51" rot="R180"/>
<rectangle x1="-0.8" y1="0.25" x2="-0.5" y2="1" layer="51" rot="R180"/>
<wire x1="-1.2" y1="-1" x2="-1.05" y2="-1" width="0.127" layer="21"/>
<wire x1="-1.2" y1="1" x2="-1.05" y2="1" width="0.127" layer="21"/>
<wire x1="1.05" y1="1" x2="1.2" y2="1" width="0.127" layer="21"/>
<wire x1="1.05" y1="-1" x2="1.2" y2="-1" width="0.127" layer="21"/>
<wire x1="-1.05" y1="-1" x2="1.05" y2="-1" width="0.127" layer="51"/>
<wire x1="1.05" y1="1" x2="-1.05" y2="1" width="0.127" layer="51"/>
<smd name="2" x="0" y="-0.875" dx="0.4" dy="1.25" layer="1"/>
<smd name="3" x="0.65" y="-0.875" dx="0.4" dy="1.25" layer="1"/>
<smd name="4" x="0.65" y="0.875" dx="0.4" dy="1.25" layer="1"/>
<smd name="5" x="0" y="0.875" dx="0.4" dy="1.25" layer="1"/>
<smd name="6" x="-0.65" y="0.875" dx="0.4" dy="1.25" layer="1"/>
<rectangle x1="-1.2" y1="-1" x2="-1" y2="0" layer="21"/>
<wire x1="-0.329" y1="-0.123" x2="0.077" y2="-0.123" width="0.127" layer="51"/>
<wire x1="-0.329" y1="0.246" x2="0.077" y2="0.246" width="0.127" layer="51"/>
<wire x1="-0.329" y1="0.246" x2="-0.329" y2="-0.123" width="0.127" layer="51"/>
<wire x1="0.077" y1="0.246" x2="0.077" y2="-0.123" width="0.127" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="TCS3472X">
<text x="-7.62" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-7.62" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="7.62" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<pin name="GND" x="-10.16" y="-2.54" length="short"/>
<pin name="SDA" x="10.16" y="2.54" length="short" rot="R180"/>
<pin name="VDD" x="-10.16" y="5.08" length="short"/>
<pin name="SCL" x="10.16" y="5.08" length="short" rot="R180"/>
<pin name="INT" x="10.16" y="-2.54" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TCS3472" prefix="U">
<gates>
<gate name="G$1" symbol="TCS3472X" x="0" y="0"/>
</gates>
<devices>
<device name="" package="FN-6">
<connects>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="INT" pad="5"/>
<connect gate="G$1" pin="SCL" pad="2"/>
<connect gate="G$1" pin="SDA" pad="6"/>
<connect gate="G$1" pin="VDD" pad="1"/>
</connects>
<technologies>
<technology name="1">
<attribute name="ADDRESS" value="0x39" constant="no"/>
<attribute name="BUS" value="VDD" constant="no"/>
</technology>
<technology name="3">
<attribute name="ADDRESS" value="0x39" constant="no"/>
<attribute name="BUS" value="1.8V" constant="no"/>
</technology>
<technology name="5">
<attribute name="ADDRESS" value="0x29" constant="no"/>
<attribute name="BUS" value="VDD" constant="no"/>
</technology>
<technology name="7">
<attribute name="ADDRESS" value="0x29" constant="no"/>
<attribute name="BUS" value="1.8V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Transistor">
<packages>
<package name="SOT23-3">
<wire x1="-1.45" y1="0.6" x2="1.45" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.45" y1="0.6" x2="1.45" y2="-0.6" width="0.127" layer="21"/>
<wire x1="1.45" y1="-0.6" x2="-1.45" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.45" y1="-0.6" x2="-1.45" y2="0.6" width="0.127" layer="21"/>
<smd name="1" x="-0.95" y="-1.2" dx="0.6" dy="0.8" layer="1"/>
<smd name="2" x="0.95" y="-1.2" dx="0.6" dy="0.8" layer="1"/>
<smd name="3" x="0" y="1.2" dx="0.6" dy="0.8" layer="1"/>
<rectangle x1="-1.15" y1="-1.25" x2="-0.75" y2="-0.65" layer="51" rot="R180"/>
<rectangle x1="0.75" y1="-1.25" x2="1.15" y2="-0.65" layer="51" rot="R180"/>
<rectangle x1="-0.2" y1="0.65" x2="0.2" y2="1.25" layer="51"/>
<text x="-1.7" y="-2" size="0.8" layer="25" font="vector" ratio="18" rot="R90">&gt;NAME</text>
<text x="2.5" y="-2" size="0.8" layer="27" font="vector" ratio="18" rot="R90">&gt;VALUE</text>
</package>
<package name="SOT323-3">
<wire x1="-1" y1="0.625" x2="1" y2="0.625" width="0.127" layer="21"/>
<wire x1="1" y1="0.625" x2="1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="1" y1="-0.625" x2="-1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.625" x2="-1" y2="0.625" width="0.127" layer="21"/>
<smd name="1" x="-0.65" y="-1.1" dx="0.4" dy="0.6" layer="1"/>
<smd name="2" x="0.65" y="-1.1" dx="0.4" dy="0.6" layer="1"/>
<smd name="3" x="0" y="1.1" dx="0.4" dy="0.6" layer="1" rot="R180"/>
<rectangle x1="-0.8" y1="-1.05" x2="-0.5" y2="-0.625" layer="51"/>
<rectangle x1="0.5" y1="-1.05" x2="0.8" y2="-0.625" layer="51"/>
<rectangle x1="-0.15" y1="0.625" x2="0.15" y2="1.05" layer="51" rot="R180"/>
<text x="-1.2" y="-1" size="0.8" layer="25" font="vector" ratio="18" rot="R90">&gt;NAME</text>
<text x="2" y="-2" size="0.8" layer="27" font="vector" ratio="18" rot="R90">&gt;VALUE</text>
</package>
<package name="SOT89-3">
<wire x1="2.25" y1="1.25" x2="2.25" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-2.25" y1="-1.25" x2="-2.25" y2="1.25" width="0.127" layer="21"/>
<smd name="1" x="-1.5" y="-2.05" dx="0.6" dy="1.2" layer="1"/>
<smd name="2" x="0" y="-0.25" dx="1.8" dy="4.8" layer="1"/>
<smd name="3" x="1.5" y="-2.05" dx="0.6" dy="1.2" layer="1"/>
<rectangle x1="-1.71" y1="-2.25" x2="-1.29" y2="-1.25" layer="51"/>
<rectangle x1="1.29" y1="-2.25" x2="1.71" y2="-1.25" layer="51"/>
<rectangle x1="-0.235" y1="-2.25" x2="0.235" y2="-1.25" layer="51"/>
<rectangle x1="-0.8" y1="1.25" x2="0.8" y2="1.75" layer="51"/>
<wire x1="-2.25" y1="-1.25" x2="-1.05" y2="-1.25" width="0.127" layer="21"/>
<wire x1="2.25" y1="-1.25" x2="1.05" y2="-1.25" width="0.127" layer="21"/>
<wire x1="2.25" y1="1.25" x2="1.05" y2="1.25" width="0.127" layer="21"/>
<wire x1="-2.25" y1="1.25" x2="-1.05" y2="1.25" width="0.127" layer="21"/>
<wire x1="-1.05" y1="1.25" x2="1.05" y2="1.25" width="0.127" layer="51"/>
<wire x1="-1.05" y1="-1.25" x2="1.05" y2="-1.25" width="0.127" layer="51"/>
<text x="-3" y="-1" size="1" layer="25" font="vector" ratio="15" rot="R90">&gt;NAME</text>
<text x="4" y="-3" size="1" layer="27" font="vector" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="SON8_1.27">
<wire x1="-2.45" y1="2.875" x2="2.45" y2="2.875" width="0.127" layer="21"/>
<wire x1="2.45" y1="2.875" x2="2.45" y2="-2.875" width="0.127" layer="21"/>
<wire x1="-2.45" y1="2.875" x2="-2.45" y2="-2.875" width="0.127" layer="21"/>
<wire x1="-2.45" y1="-2.875" x2="2.45" y2="-2.875" width="0.127" layer="21"/>
<circle x="-1.9" y="-1.8" radius="0.2" width="0.127" layer="21"/>
<smd name="1" x="-1.905" y="-3" dx="0.48" dy="1.2" layer="1"/>
<rectangle x1="-2.11" y1="-3" x2="-1.7" y2="-2.4" layer="51"/>
<smd name="2" x="-0.635" y="-3" dx="0.48" dy="1.2" layer="1"/>
<rectangle x1="-0.84" y1="-3" x2="-0.43" y2="-2.4" layer="51"/>
<smd name="3" x="0.635" y="-3" dx="0.48" dy="1.2" layer="1"/>
<rectangle x1="0.43" y1="-3" x2="0.84" y2="-2.4" layer="51"/>
<smd name="4" x="1.905" y="-3" dx="0.48" dy="1.2" layer="1"/>
<rectangle x1="1.7" y1="-3" x2="2.11" y2="-2.4" layer="51"/>
<smd name="5" x="1.905" y="3" dx="0.48" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="1.7" y1="2.4" x2="2.11" y2="3" layer="51" rot="R180"/>
<smd name="6" x="0.635" y="3" dx="0.48" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="0.43" y1="2.4" x2="0.84" y2="3" layer="51" rot="R180"/>
<smd name="7" x="-0.635" y="3" dx="0.48" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="-0.84" y1="2.4" x2="-0.43" y2="3" layer="51" rot="R180"/>
<smd name="8" x="-1.905" y="3" dx="0.48" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="-2.11" y1="2.4" x2="-1.7" y2="3" layer="51" rot="R180"/>
<wire x1="-2.45" y1="-1.18" x2="2.45" y2="-1.18" width="0.127" layer="51"/>
<text x="-3" y="-3" size="1" layer="25" font="vector" ratio="15" rot="R90">&gt;NAME</text>
<text x="4" y="-3" size="1" layer="27" font="vector" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="SOP8">
<wire x1="-2.45" y1="1.95" x2="2.45" y2="1.95" width="0.127" layer="21"/>
<wire x1="2.45" y1="1.95" x2="2.45" y2="-1.95" width="0.127" layer="21"/>
<wire x1="-2.45" y1="1.95" x2="-2.45" y2="-1.95" width="0.127" layer="21"/>
<wire x1="-2.45" y1="-1.95" x2="2.45" y2="-1.95" width="0.127" layer="21"/>
<circle x="-2" y="-1.5" radius="0.2" width="0.127" layer="21"/>
<smd name="2" x="-0.635" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="7" x="-0.635" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="1" x="-1.905" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="3" x="0.635" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="4" x="1.905" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="8" x="-1.905" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="6" x="0.635" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="5" x="1.905" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<text x="-2" y="0.5" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-2" y="-1" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<rectangle x1="1.7" y1="1.95" x2="2.11" y2="2.95" layer="51"/>
<rectangle x1="0.43" y1="1.95" x2="0.84" y2="2.95" layer="51"/>
<rectangle x1="-0.84" y1="1.95" x2="-0.43" y2="2.95" layer="51"/>
<rectangle x1="-2.11" y1="1.95" x2="-1.7" y2="2.95" layer="51"/>
<rectangle x1="1.7" y1="-2.95" x2="2.11" y2="-1.95" layer="51"/>
<rectangle x1="0.43" y1="-2.95" x2="0.84" y2="-1.95" layer="51"/>
<rectangle x1="-0.84" y1="-2.95" x2="-0.43" y2="-1.95" layer="51"/>
<rectangle x1="-2.11" y1="-2.95" x2="-1.7" y2="-1.95" layer="51"/>
</package>
<package name="TO-220F">
<pad name="1" x="-2.54" y="0" drill="1.3" diameter="1.9"/>
<pad name="2" x="0" y="0" drill="1.3" diameter="1.9"/>
<pad name="3" x="2.54" y="0" drill="1.3" diameter="1.9"/>
<wire x1="-4.7" y1="-1.7" x2="4.7" y2="-1.7" width="0.127" layer="21"/>
<wire x1="-5.08" y1="3.01" x2="5.08" y2="3.01" width="0.127" layer="21"/>
<wire x1="5.08" y1="3.01" x2="5.08" y2="2.31" width="0.127" layer="21"/>
<wire x1="-5.08" y1="2.31" x2="-5.08" y2="3.01" width="0.127" layer="21"/>
<wire x1="-4.7" y1="-1.7" x2="-5.08" y2="2.31" width="0.127" layer="21"/>
<wire x1="4.7" y1="-1.7" x2="5.08" y2="2.31" width="0.127" layer="21"/>
<wire x1="-4.9" y1="0.47" x2="4.9" y2="0.47" width="0.127" layer="51"/>
<wire x1="-5.08" y1="2.31" x2="5.08" y2="2.31" width="0.127" layer="51"/>
<text x="-5" y="5.5" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-5" y="4" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
</package>
<package name="D2PAK-3">
<wire x1="-5.08" y1="9.017" x2="-5.08" y2="3" width="0.127" layer="51"/>
<wire x1="-5.08" y1="3" x2="-5.08" y2="0" width="0.127" layer="21"/>
<wire x1="5.08" y1="0" x2="5.08" y2="3" width="0.127" layer="21"/>
<wire x1="5.08" y1="3" x2="5.08" y2="9.017" width="0.127" layer="51"/>
<wire x1="5.08" y1="9.017" x2="-5.08" y2="9.017" width="0.127" layer="51"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="0" width="0.127" layer="21"/>
<smd name="1" x="-2.54" y="-3.175" dx="2" dy="4" layer="1"/>
<smd name="3" x="2.54" y="-3.175" dx="2" dy="4" layer="1"/>
<rectangle x1="1.905" y1="-4.572" x2="3.175" y2="0" layer="51"/>
<rectangle x1="-3.175" y1="-4.572" x2="-1.905" y2="0" layer="51"/>
<polygon width="0.127" layer="51">
<vertex x="-5.08" y="9.017"/>
<vertex x="-5.08" y="10.795"/>
<vertex x="-3.81" y="11.43"/>
<vertex x="3.81" y="11.43"/>
<vertex x="5.08" y="10.795"/>
<vertex x="5.08" y="9.017"/>
</polygon>
<rectangle x1="-0.635" y1="-1.778" x2="0.635" y2="0" layer="51"/>
<smd name="4" x="0" y="7.7" dx="11" dy="9" layer="1"/>
<text x="-4" y="2" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-4" y="0.5" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
</package>
<package name="DPAK-3">
<wire x1="-3.3" y1="6.1" x2="-3.3" y2="0" width="0.127" layer="21"/>
<wire x1="3.3" y1="0" x2="3.3" y2="6.1" width="0.127" layer="21"/>
<wire x1="3.3" y1="0" x2="-3.3" y2="0" width="0.127" layer="21"/>
<smd name="1" x="-2.3" y="-2" dx="1.4" dy="3" layer="1"/>
<smd name="3" x="2.3" y="-2" dx="1.4" dy="3" layer="1"/>
<rectangle x1="1.9" y1="-2.8" x2="2.7" y2="0" layer="51"/>
<rectangle x1="-2.7" y1="-2.8" x2="-1.9" y2="0" layer="51"/>
<rectangle x1="-0.4" y1="-1" x2="0.4" y2="0" layer="51"/>
<smd name="4" x="0" y="5" dx="5.8" dy="6" layer="1"/>
<polygon width="0.127" layer="51">
<vertex x="-2.65" y="6.1"/>
<vertex x="2.65" y="6.1"/>
<vertex x="2.65" y="6.85"/>
<vertex x="2" y="7.18"/>
<vertex x="-2" y="7.18"/>
<vertex x="-2.65" y="6.85"/>
</polygon>
<wire x1="-3.3" y1="6.1" x2="3.3" y2="6.1" width="0.127" layer="51"/>
<text x="-4" y="0" size="1" layer="25" font="vector" ratio="15" rot="R90">&gt;NAME</text>
<text x="5" y="0" size="1" layer="27" font="vector" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="SOT223">
<wire x1="-3.25" y1="1.75" x2="3.25" y2="1.75" width="0.127" layer="21"/>
<wire x1="3.25" y1="1.75" x2="3.25" y2="-1.75" width="0.127" layer="21"/>
<wire x1="3.25" y1="-1.75" x2="-3.25" y2="-1.75" width="0.127" layer="21"/>
<wire x1="-3.25" y1="-1.75" x2="-3.25" y2="1.75" width="0.127" layer="21"/>
<smd name="1" x="-2.3" y="-3.2" dx="1.1" dy="1.8" layer="1"/>
<smd name="2" x="0" y="-3.2" dx="1.1" dy="1.8" layer="1"/>
<smd name="3" x="2.3" y="-3.2" dx="1.1" dy="1.8" layer="1"/>
<rectangle x1="-2.67" y1="-3.55" x2="-1.93" y2="-1.75" layer="51"/>
<text x="-3.7" y="-2" size="1" layer="25" font="vector" ratio="15" rot="R90">&gt;NAME</text>
<text x="4.5" y="-2" size="1" layer="27" font="vector" ratio="15" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.37" y1="-3.55" x2="0.37" y2="-1.75" layer="51"/>
<rectangle x1="1.93" y1="-3.55" x2="2.67" y2="-1.75" layer="51"/>
<rectangle x1="-1.5" y1="1.75" x2="1.5" y2="3.55" layer="51"/>
<smd name="4" x="0" y="3.2" dx="4" dy="1.8" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="N-MOSFET">
<wire x1="-5.08" y1="-2.54" x2="-3.7592" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0.762" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-2.54" y1="3.683" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="1.397" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-1.397" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-2.54" y2="-3.683" width="0.254" layer="94"/>
<wire x1="-3.683" y1="2.54" x2="-3.683" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="1.27" y1="2.54" x2="1.27" y2="0.254" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0.254" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="1.27" y2="2.54" width="0.1524" layer="94"/>
<wire x1="2.032" y1="0.508" x2="1.778" y2="0.254" width="0.1524" layer="94"/>
<wire x1="1.778" y1="0.254" x2="1.27" y2="0.254" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0.254" x2="0.762" y2="0.254" width="0.1524" layer="94"/>
<wire x1="0.762" y1="0.254" x2="0.508" y2="0" width="0.1524" layer="94"/>
<circle x="0" y="-2.54" radius="0.3592" width="0" layer="94"/>
<circle x="0" y="2.54" radius="0.3592" width="0" layer="94"/>
<text x="2.54" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<text x="2.54" y="0" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="S" x="0" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="G" x="-5.08" y="-2.54" visible="pad" length="point" direction="pas"/>
<pin name="D" x="0" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="1.27" y="0.254"/>
<vertex x="0.762" y="-0.508"/>
<vertex x="1.778" y="-0.508"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-2.286" y="0"/>
<vertex x="-1.27" y="0.762"/>
<vertex x="-1.27" y="-0.762"/>
</polygon>
</symbol>
<symbol name="PNP">
<wire x1="2.086" y1="1.678" x2="1.578" y2="2.594" width="0.1524" layer="94"/>
<wire x1="1.578" y1="2.594" x2="0.516" y2="1.478" width="0.1524" layer="94"/>
<wire x1="0.516" y1="1.478" x2="2.086" y2="1.678" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="1.808" y2="2.124" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="0.508" y2="-1.524" width="0.1524" layer="94"/>
<wire x1="1.905" y1="1.778" x2="1.524" y2="2.413" width="0.254" layer="94"/>
<wire x1="1.524" y1="2.413" x2="0.762" y2="1.651" width="0.254" layer="94"/>
<wire x1="0.762" y1="1.651" x2="1.778" y2="1.778" width="0.254" layer="94"/>
<wire x1="1.778" y1="1.778" x2="1.524" y2="2.159" width="0.254" layer="94"/>
<wire x1="1.524" y1="2.159" x2="1.143" y2="1.905" width="0.254" layer="94"/>
<wire x1="1.143" y1="1.905" x2="1.524" y2="1.905" width="0.254" layer="94"/>
<text x="5.08" y="0" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="5.08" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-2.54" x2="0.508" y2="2.54" layer="94"/>
<pin name="B" x="-2.54" y="0" visible="pad" length="short" direction="pas"/>
<pin name="E" x="2.54" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
<pin name="C" x="2.54" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MOS-N-*" prefix="Q" uservalue="yes">
<gates>
<gate name="G$1" symbol="N-MOSFET" x="0" y="0"/>
</gates>
<devices>
<device name="SOT23" package="SOT23-3">
<connects>
<connect gate="G$1" pin="D" pad="3"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT323" package="SOT323-3">
<connects>
<connect gate="G$1" pin="D" pad="3"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT89" package="SOT89-3">
<connects>
<connect gate="G$1" pin="D" pad="2"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SON8" package="SON8_1.27">
<connects>
<connect gate="G$1" pin="D" pad="5 6 7 8"/>
<connect gate="G$1" pin="G" pad="4"/>
<connect gate="G$1" pin="S" pad="1 2 3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOP8" package="SOP8">
<connects>
<connect gate="G$1" pin="D" pad="5 6 7 8"/>
<connect gate="G$1" pin="G" pad="4"/>
<connect gate="G$1" pin="S" pad="1 2 3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO-220F" package="TO-220F">
<connects>
<connect gate="G$1" pin="D" pad="2"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="D2PAK" package="D2PAK-3">
<connects>
<connect gate="G$1" pin="D" pad="4"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DPAK" package="DPAK-3">
<connects>
<connect gate="G$1" pin="D" pad="4"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT223" package="SOT223">
<connects>
<connect gate="G$1" pin="D" pad="2 4"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PNP-" prefix="Q" uservalue="yes">
<gates>
<gate name="G$1" symbol="PNP" x="0" y="0"/>
</gates>
<devices>
<device name="SOT23" package="SOT23-3">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT223" package="SOT223">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="2 4"/>
<connect gate="G$1" pin="E" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Opto">
<packages>
<package name="1608">
<wire x1="1.35" y1="0.6" x2="1.35" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="-0.6" x2="-1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="0.6" x2="1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.35" y1="-0.6" x2="-1.35" y2="-0.6" width="0.127" layer="21"/>
<smd name="K" x="-0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<smd name="A" x="0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<text x="-1.5" y="1" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-1.5" y="-2" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4" y2="0.4" layer="51"/>
<rectangle x1="0.4" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="0.25" x2="0.4" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="-0.4" x2="0.4" y2="-0.25" layer="51"/>
<wire x1="0.2" y1="0" x2="-0.2" y2="0" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="0.2" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="-0.2" width="0.127" layer="21"/>
</package>
<package name="1611">
<wire x1="1.35" y1="0.6" x2="1.35" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="-0.6" x2="-1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="0.6" x2="1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.35" y1="-0.6" x2="-1.35" y2="-0.6" width="0.127" layer="21"/>
<smd name="K" x="-0.8" y="0" dx="0.7" dy="0.8" layer="1"/>
<smd name="A" x="0.8" y="0" dx="0.7" dy="0.8" layer="1"/>
<text x="-1.397" y="1.016" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.397" y="-1.524" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.8" y1="-0.3" x2="-0.45" y2="0.3" layer="51"/>
<rectangle x1="0.45" y1="-0.3" x2="0.8" y2="0.3" layer="51"/>
<rectangle x1="-0.45" y1="-0.3" x2="0.45" y2="-0.15" layer="51"/>
<wire x1="0.2" y1="0" x2="-0.2" y2="0" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="0.2" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="-0.2" width="0.127" layer="21"/>
<polygon width="0" layer="51">
<vertex x="-0.6" y="0.3"/>
<vertex x="-0.55" y="0.9"/>
<vertex x="0.55" y="0.9"/>
<vertex x="0.6" y="0.3"/>
</polygon>
<rectangle x1="-0.45" y1="0.15" x2="0.45" y2="0.3" layer="51"/>
</package>
<package name="2012">
<wire x1="-1.7" y1="0.85" x2="1.7" y2="0.85" width="0.127" layer="21"/>
<wire x1="1.7" y1="0.85" x2="1.7" y2="-0.85" width="0.127" layer="21"/>
<wire x1="1.7" y1="-0.85" x2="-1.7" y2="-0.85" width="0.127" layer="21"/>
<wire x1="-1.7" y1="-0.85" x2="-1.7" y2="0.85" width="0.127" layer="21"/>
<smd name="K" x="-1.125" y="0" dx="0.75" dy="1.25" layer="1"/>
<smd name="A" x="1.125" y="0" dx="0.75" dy="1.25" layer="1"/>
<text x="-2" y="1.5" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-2" y="-2.5" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<rectangle x1="-1" y1="-0.625" x2="-0.75" y2="0.625" layer="51"/>
<rectangle x1="0.75" y1="-0.625" x2="1" y2="0.625" layer="51"/>
<rectangle x1="-0.75" y1="0.475" x2="0.75" y2="0.625" layer="51"/>
<rectangle x1="-0.75" y1="-0.625" x2="0.75" y2="-0.475" layer="51"/>
<wire x1="0.3" y1="0" x2="-0.3" y2="0" width="0.127" layer="21"/>
<wire x1="-0.3" y1="0" x2="0" y2="0.3" width="0.127" layer="21"/>
<wire x1="-0.3" y1="0" x2="0" y2="-0.3" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="LED">
<wire x1="-2.032" y1="0.762" x2="-3.429" y2="-0.635" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-0.381" x2="-3.302" y2="-1.778" width="0.1524" layer="94"/>
<wire x1="0" y1="-0.508" x2="1.27" y2="0.762" width="0.254" layer="94"/>
<wire x1="-1.27" y1="0.762" x2="0" y2="-0.508" width="0.254" layer="94"/>
<wire x1="0" y1="-0.508" x2="1.27" y2="-0.508" width="0.254" layer="94"/>
<wire x1="0" y1="-0.508" x2="-1.27" y2="-0.508" width="0.254" layer="94"/>
<wire x1="0" y1="-0.508" x2="0" y2="0.762" width="0.1524" layer="94"/>
<wire x1="0" y1="0.762" x2="0" y2="2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-0.508" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="0.762" x2="0" y2="0.762" width="0.254" layer="94"/>
<wire x1="1.27" y1="0.762" x2="0" y2="0.762" width="0.254" layer="94"/>
<text x="2.54" y="0.508" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="2.54" y="-2.032" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="K" x="0" y="-2.54" visible="off" length="point" direction="pas" rot="R90"/>
<pin name="A" x="0" y="2.54" visible="off" length="point" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="-3.429" y="-0.635"/>
<vertex x="-3.048" y="0.254"/>
<vertex x="-2.54" y="-0.254"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.302" y="-1.778"/>
<vertex x="-2.921" y="-0.889"/>
<vertex x="-2.413" y="-1.397"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="LED" prefix="LED" uservalue="yes">
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="1608" package="1608">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1611R" package="1611">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012" package="2012">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-Micron">
<packages>
<package name="DFN8-1.27">
<wire x1="3" y1="4" x2="3" y2="-4" width="0.127" layer="21"/>
<wire x1="-3" y1="4" x2="-3" y2="-4" width="0.127" layer="21"/>
<smd name="2" x="-0.635" y="-4.1" dx="0.44" dy="1" layer="1"/>
<smd name="7" x="-0.635" y="4.1" dx="0.44" dy="1" layer="1"/>
<smd name="1" x="-1.905" y="-4.1" dx="0.44" dy="1" layer="1"/>
<smd name="3" x="0.635" y="-4.1" dx="0.44" dy="1" layer="1"/>
<smd name="4" x="1.905" y="-4.1" dx="0.44" dy="1" layer="1"/>
<smd name="8" x="-1.905" y="4.1" dx="0.44" dy="1" layer="1"/>
<smd name="6" x="0.635" y="4.1" dx="0.44" dy="1" layer="1"/>
<smd name="5" x="1.905" y="4.1" dx="0.44" dy="1" layer="1"/>
<rectangle x1="-2.105" y1="-4" x2="-1.705" y2="-3.6" layer="51"/>
<circle x="-2.6" y="-3.6" radius="0.15" width="0.127" layer="21"/>
<text x="-5" y="-4" size="1" layer="25" font="vector" ratio="15" rot="R90">&gt;NAME</text>
<text x="-3.5" y="-4" size="1" layer="27" font="vector" ratio="15" rot="R90">&gt;VALUE</text>
<pad name="PAD" x="0" y="0" drill="3.3" diameter="4.6" shape="square"/>
<rectangle x1="-0.835" y1="-4" x2="-0.435" y2="-3.6" layer="51"/>
<rectangle x1="0.435" y1="-4" x2="0.835" y2="-3.6" layer="51"/>
<rectangle x1="1.705" y1="-4" x2="2.105" y2="-3.6" layer="51"/>
<rectangle x1="-2.105" y1="3.6" x2="-1.705" y2="4" layer="51"/>
<rectangle x1="-0.835" y1="3.6" x2="-0.435" y2="4" layer="51"/>
<rectangle x1="0.435" y1="3.6" x2="0.835" y2="4" layer="51"/>
<rectangle x1="1.705" y1="3.6" x2="2.105" y2="4" layer="51"/>
<wire x1="-3" y1="4" x2="-2.3" y2="4" width="0.127" layer="21"/>
<wire x1="-1.5" y1="4" x2="-1.05" y2="4" width="0.127" layer="21"/>
<wire x1="-0.2" y1="4" x2="0.2" y2="4" width="0.127" layer="21"/>
<wire x1="1.05" y1="4" x2="1.5" y2="4" width="0.127" layer="21"/>
<wire x1="3" y1="4" x2="2.3" y2="4" width="0.127" layer="21"/>
<wire x1="-3" y1="-4" x2="-2.3" y2="-4" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-4" x2="-1.05" y2="-4" width="0.127" layer="21"/>
<wire x1="-0.2" y1="-4" x2="0.2" y2="-4" width="0.127" layer="21"/>
<wire x1="1.05" y1="-4" x2="1.5" y2="-4" width="0.127" layer="21"/>
<wire x1="3" y1="-4" x2="2.3" y2="-4" width="0.127" layer="21"/>
<wire x1="-2.3" y1="4" x2="-1.5" y2="4" width="0.127" layer="51"/>
<wire x1="-0.2" y1="4" x2="-1.05" y2="4" width="0.127" layer="51"/>
<wire x1="0.2" y1="4" x2="1.05" y2="4" width="0.127" layer="51"/>
<wire x1="1.5" y1="4" x2="2.3" y2="4" width="0.127" layer="51"/>
<wire x1="-2.3" y1="-4" x2="-1.5" y2="-4" width="0.127" layer="51"/>
<wire x1="-1.05" y1="-4" x2="-0.2" y2="-4" width="0.127" layer="51"/>
<wire x1="0.2" y1="-4" x2="1.05" y2="-4" width="0.127" layer="51"/>
<wire x1="1.5" y1="-4" x2="2.3" y2="-4" width="0.127" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="SPIFLASH-X4">
<wire x1="-10.16" y1="10.16" x2="10.16" y2="10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="10.16" x2="10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="-10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-7.62" x2="-10.16" y2="10.16" width="0.254" layer="94"/>
<text x="-10.16" y="10.541" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-10.16" y="-10.16" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VCC" x="-12.7" y="7.62" length="short"/>
<pin name="!H!/DQ3" x="12.7" y="-5.08" length="short" rot="R180"/>
<pin name="!W!/DQ2" x="12.7" y="-2.54" length="short" rot="R180"/>
<pin name="GND" x="-12.7" y="-5.08" length="short"/>
<pin name="!S" x="12.7" y="7.62" length="short" rot="R180"/>
<pin name="C" x="12.7" y="5.08" length="short" rot="R180"/>
<pin name="SI/DQ0" x="12.7" y="2.54" length="short" rot="R180"/>
<pin name="SO/DQ1" x="12.7" y="0" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="N25Q512A" prefix="U">
<gates>
<gate name="G$1" symbol="SPIFLASH-X4" x="0" y="0"/>
</gates>
<devices>
<device name="M" package="DFN8-1.27">
<connects>
<connect gate="G$1" pin="!H!/DQ3" pad="7"/>
<connect gate="G$1" pin="!S" pad="1"/>
<connect gate="G$1" pin="!W!/DQ2" pad="3"/>
<connect gate="G$1" pin="C" pad="6"/>
<connect gate="G$1" pin="GND" pad="4 PAD"/>
<connect gate="G$1" pin="SI/DQ0" pad="5"/>
<connect gate="G$1" pin="SO/DQ1" pad="2"/>
<connect gate="G$1" pin="VCC" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U1" library="ic-Invensense" deviceset="MPU-6000" device=""/>
<part name="CN1" library="Connector" deviceset="PIN1X8" device="" value="External SPI 1"/>
<part name="+P1" library="supply1" deviceset="+3V3" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="C1" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C2" library="Passive" deviceset="C" device="1005" value="1n"/>
<part name="C3" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="C4" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="C5" library="Passive" deviceset="C" device="1005" value="10u"/>
<part name="FB1" library="Passive" deviceset="FB" device="1608"/>
<part name="+P2" library="supply1" deviceset="+3V3" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="X1" library="Oscillator" deviceset="ASDM" device="" technology="B" value="19.2M"/>
<part name="R1" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="C6" library="Passive" deviceset="C" device="1005" value="10n"/>
<part name="+P3" library="supply1" deviceset="+3V3" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="R2" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R3" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="+P4" library="supply1" deviceset="+3V3" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="CN2" library="Connector" deviceset="PIN2X4" device="" value="External SPI 2"/>
<part name="U2" library="ic-ams" deviceset="TCS3472" device="" technology="5"/>
<part name="+P5" library="supply1" deviceset="+3V3/2" device=""/>
<part name="C8" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="R4" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R5" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="Q1" library="Transistor" deviceset="MOS-N-*" device="SOT23"/>
<part name="LED1" library="Opto" deviceset="LED" device="1608" value="White"/>
<part name="R6" library="Passive" deviceset="R" device="1608" value="10"/>
<part name="+P6" library="supply1" deviceset="+3V3" device=""/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="+P7" library="supply1" deviceset="+3V3" device=""/>
<part name="R7" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="Q2" library="Transistor" deviceset="PNP-" device="SOT23"/>
<part name="R8" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="U3" library="ic-Micron" deviceset="N25Q512A" device="M"/>
<part name="+P9" library="supply1" deviceset="+3V3/2" device=""/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="C7" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="+P10" library="supply1" deviceset="+3V3/2" device=""/>
<part name="+P11" library="supply1" deviceset="+3V3/2" device=""/>
<part name="R9" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="+P8" library="supply1" deviceset="+3V3" device=""/>
<part name="LED2" library="Opto" deviceset="LED" device="1608" value="Red"/>
<part name="R10" library="Passive" deviceset="R" device="1005" value="1.5k"/>
<part name="+P12" library="supply1" deviceset="+3V3/2" device=""/>
<part name="C9" library="Passive" deviceset="C" device="1005" value="1n"/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="0" y1="0" x2="38.1" y2="0" width="0.1524" layer="97"/>
<wire x1="38.1" y1="0" x2="58.42" y2="0" width="0.1524" layer="97"/>
<wire x1="58.42" y1="0" x2="83.82" y2="0" width="0.1524" layer="97"/>
<wire x1="0" y1="0" x2="0" y2="7.62" width="0.1524" layer="97"/>
<text x="2.54" y="5.08" size="1.778" layer="97" font="vector" align="center-left">KIKS2013</text>
<text x="2.54" y="2.54" size="1.778" layer="97" font="vector" align="center-left">Gen.5's IMU</text>
<wire x1="0" y1="7.62" x2="0" y2="256.54" width="0.1524" layer="97"/>
<wire x1="0" y1="7.62" x2="38.1" y2="7.62" width="0.1524" layer="97"/>
<wire x1="38.1" y1="7.62" x2="38.1" y2="0" width="0.1524" layer="97"/>
<wire x1="38.1" y1="7.62" x2="58.42" y2="7.62" width="0.1524" layer="97"/>
<wire x1="58.42" y1="7.62" x2="83.82" y2="7.62" width="0.1524" layer="97"/>
<wire x1="83.82" y1="7.62" x2="83.82" y2="0" width="0.1524" layer="97"/>
<text x="60.96" y="2.54" size="1.778" layer="97" font="vector" align="center-left">FUJII NAOMICHI</text>
<text x="60.96" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Created by</text>
<text x="40.64" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Date</text>
<text x="40.64" y="2.54" size="1.778" layer="97" font="vector" align="center-left">2013/08/11</text>
<wire x1="58.42" y1="0" x2="58.42" y2="7.62" width="0.1524" layer="97"/>
<wire x1="83.82" y1="0" x2="259.08" y2="0" width="0.1524" layer="97"/>
<wire x1="0" y1="256.54" x2="259.08" y2="256.54" width="0.1524" layer="97"/>
<wire x1="259.08" y1="0" x2="259.08" y2="256.54" width="0.1524" layer="97"/>
<text x="20.32" y="193.04" size="2.54" layer="97">MCU_AUX0はコンフィグレーション中は駆動されない
MCU_AUX1, MCU_AUX2は未使用</text>
<text x="104.14" y="106.68" size="2.54" layer="97">LEDのスペクトルに注意</text>
</plain>
<instances>
<instance part="U1" gate="G$1" x="139.7" y="48.26"/>
<instance part="CN1" gate="G$1" x="25.4" y="60.96" rot="MR0"/>
<instance part="+P1" gate="1" x="81.28" y="60.96" rot="MR270"/>
<instance part="GND2" gate="1" x="116.84" y="45.72"/>
<instance part="C1" gate="G$1" x="116.84" y="53.34"/>
<instance part="C2" gate="G$1" x="119.38" y="27.94"/>
<instance part="C3" gate="G$1" x="101.6" y="27.94"/>
<instance part="GND1" gate="1" x="119.38" y="22.86"/>
<instance part="GND3" gate="1" x="101.6" y="22.86"/>
<instance part="C4" gate="G$1" x="109.22" y="53.34"/>
<instance part="C5" gate="G$1" x="101.6" y="53.34"/>
<instance part="FB1" gate="G$1" x="91.44" y="60.96"/>
<instance part="+P2" gate="1" x="33.02" y="76.2" rot="MR0"/>
<instance part="GND4" gate="1" x="33.02" y="50.8"/>
<instance part="GND5" gate="1" x="160.02" y="30.48"/>
<instance part="X1" gate="G$1" x="218.44" y="63.5" rot="MR0"/>
<instance part="R1" gate="G$1" x="205.74" y="60.96"/>
<instance part="C6" gate="G$1" x="233.68" y="60.96"/>
<instance part="+P3" gate="1" x="233.68" y="71.12" rot="MR0"/>
<instance part="GND6" gate="1" x="233.68" y="55.88"/>
<instance part="R2" gate="G$1" x="43.18" y="50.8" rot="R90"/>
<instance part="R3" gate="G$1" x="45.72" y="76.2" rot="R90"/>
<instance part="+P4" gate="1" x="45.72" y="81.28" rot="MR0"/>
<instance part="GND7" gate="1" x="43.18" y="43.18"/>
<instance part="CN2" gate="G$1" x="45.72" y="172.72" rot="MR0"/>
<instance part="U2" gate="G$1" x="213.36" y="93.98" rot="MR0"/>
<instance part="+P5" gate="1" x="55.88" y="182.88" rot="MR0"/>
<instance part="C8" gate="G$1" x="228.6" y="93.98"/>
<instance part="R4" gate="G$1" x="190.5" y="106.68" rot="R90"/>
<instance part="R5" gate="G$1" x="198.12" y="106.68" rot="R90"/>
<instance part="Q1" gate="G$1" x="129.54" y="91.44"/>
<instance part="LED1" gate="G$1" x="144.78" y="104.14"/>
<instance part="R6" gate="G$1" x="144.78" y="111.76" rot="R90"/>
<instance part="+P6" gate="1" x="228.6" y="104.14" rot="MR0"/>
<instance part="GND10" gate="1" x="228.6" y="88.9"/>
<instance part="+P7" gate="1" x="193.04" y="116.84" rot="MR0"/>
<instance part="R7" gate="G$1" x="124.46" y="83.82"/>
<instance part="Q2" gate="G$1" x="147.32" y="91.44" rot="MR0"/>
<instance part="R8" gate="G$1" x="154.94" y="99.06" rot="R90"/>
<instance part="GND8" gate="1" x="144.78" y="83.82"/>
<instance part="GND9" gate="1" x="129.54" y="81.28"/>
<instance part="GND11" gate="1" x="38.1" y="165.1"/>
<instance part="U3" gate="G$1" x="132.08" y="215.9"/>
<instance part="+P9" gate="1" x="114.3" y="228.6"/>
<instance part="GND12" gate="1" x="114.3" y="208.28"/>
<instance part="C7" gate="G$1" x="114.3" y="215.9" rot="MR0"/>
<instance part="+P10" gate="1" x="157.48" y="210.82" rot="MR90"/>
<instance part="+P11" gate="1" x="149.86" y="238.76" rot="MR0"/>
<instance part="R9" gate="G$1" x="149.86" y="231.14" rot="R90"/>
<instance part="+P8" gate="1" x="144.78" y="121.92"/>
<instance part="LED2" gate="G$1" x="198.12" y="167.64"/>
<instance part="R10" gate="G$1" x="198.12" y="177.8" rot="R90"/>
<instance part="+P12" gate="1" x="198.12" y="185.42" rot="MR0"/>
<instance part="C9" gate="G$1" x="114.3" y="27.94"/>
<instance part="GND13" gate="1" x="114.3" y="22.86"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="C2" gate="G$1" pin="2"/>
<pinref part="GND1" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND3" gate="1" pin="GND"/>
<pinref part="C3" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GND"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="124.46" y1="48.26" x2="116.84" y2="48.26" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="116.84" y1="48.26" x2="116.84" y2="50.8" width="0.1524" layer="91"/>
<wire x1="116.84" y1="48.26" x2="109.22" y2="48.26" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="2"/>
<wire x1="109.22" y1="48.26" x2="109.22" y2="50.8" width="0.1524" layer="91"/>
<wire x1="109.22" y1="48.26" x2="101.6" y2="48.26" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="2"/>
<wire x1="101.6" y1="48.26" x2="101.6" y2="50.8" width="0.1524" layer="91"/>
<junction x="109.22" y="48.26"/>
<junction x="116.84" y="48.26"/>
</segment>
<segment>
<pinref part="CN1" gate="G$1" pin="8"/>
<pinref part="GND4" gate="1" pin="GND"/>
<wire x1="27.94" y1="53.34" x2="33.02" y2="53.34" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="FSYNC"/>
<wire x1="154.94" y1="45.72" x2="160.02" y2="45.72" width="0.1524" layer="91"/>
<pinref part="GND5" gate="1" pin="GND"/>
<wire x1="160.02" y1="45.72" x2="160.02" y2="33.02" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="GND6" gate="1" pin="GND"/>
<pinref part="X1" gate="G$1" pin="GND"/>
<wire x1="226.06" y1="58.42" x2="233.68" y2="58.42" width="0.1524" layer="91"/>
<junction x="233.68" y="58.42"/>
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="1"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C8" gate="G$1" pin="2"/>
<pinref part="U2" gate="G$1" pin="GND"/>
<wire x1="223.52" y1="91.44" x2="228.6" y2="91.44" width="0.1524" layer="91"/>
<pinref part="GND10" gate="1" pin="GND"/>
<junction x="228.6" y="91.44"/>
</segment>
<segment>
<pinref part="Q2" gate="G$1" pin="C"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="Q1" gate="G$1" pin="S"/>
<wire x1="129.54" y1="83.82" x2="129.54" y2="86.36" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="2"/>
<wire x1="127" y1="83.82" x2="129.54" y2="83.82" width="0.1524" layer="91"/>
<pinref part="GND9" gate="1" pin="GND"/>
<junction x="129.54" y="83.82"/>
</segment>
<segment>
<wire x1="40.64" y1="177.8" x2="38.1" y2="177.8" width="0.1524" layer="91"/>
<wire x1="38.1" y1="177.8" x2="38.1" y2="167.64" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="2"/>
<pinref part="GND11" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="2"/>
<pinref part="GND12" gate="1" pin="GND"/>
<wire x1="114.3" y1="213.36" x2="114.3" y2="210.82" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="GND"/>
<wire x1="114.3" y1="210.82" x2="119.38" y2="210.82" width="0.1524" layer="91"/>
<junction x="114.3" y="210.82"/>
</segment>
<segment>
<pinref part="C9" gate="G$1" pin="2"/>
<pinref part="GND13" gate="1" pin="GND"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="CPOUT"/>
<wire x1="124.46" y1="35.56" x2="119.38" y2="35.56" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="119.38" y1="35.56" x2="119.38" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="1"/>
<wire x1="114.3" y1="33.02" x2="114.3" y2="35.56" width="0.1524" layer="91"/>
<wire x1="114.3" y1="35.56" x2="119.38" y2="35.56" width="0.1524" layer="91"/>
<junction x="119.38" y="35.56"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="REGOUT"/>
<wire x1="124.46" y1="40.64" x2="101.6" y2="40.64" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="101.6" y1="40.64" x2="101.6" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VDD"/>
<wire x1="124.46" y1="60.96" x2="116.84" y2="60.96" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="1"/>
<wire x1="116.84" y1="60.96" x2="109.22" y2="60.96" width="0.1524" layer="91"/>
<wire x1="109.22" y1="60.96" x2="101.6" y2="60.96" width="0.1524" layer="91"/>
<wire x1="101.6" y1="58.42" x2="101.6" y2="60.96" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="109.22" y1="58.42" x2="109.22" y2="60.96" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="116.84" y1="58.42" x2="116.84" y2="60.96" width="0.1524" layer="91"/>
<junction x="116.84" y="60.96"/>
<junction x="109.22" y="60.96"/>
<pinref part="FB1" gate="G$1" pin="2"/>
<wire x1="96.52" y1="60.96" x2="101.6" y2="60.96" width="0.1524" layer="91"/>
<junction x="101.6" y="60.96"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="FB1" gate="G$1" pin="1"/>
<pinref part="+P1" gate="1" pin="+3V3"/>
<wire x1="86.36" y1="60.96" x2="83.82" y2="60.96" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="CN1" gate="G$1" pin="1"/>
<wire x1="27.94" y1="71.12" x2="33.02" y2="71.12" width="0.1524" layer="91"/>
<pinref part="+P2" gate="1" pin="+3V3"/>
<wire x1="33.02" y1="71.12" x2="33.02" y2="73.66" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="VDD"/>
<pinref part="C6" gate="G$1" pin="1"/>
<wire x1="226.06" y1="66.04" x2="233.68" y2="66.04" width="0.1524" layer="91"/>
<pinref part="+P3" gate="1" pin="+3V3"/>
<wire x1="233.68" y1="66.04" x2="233.68" y2="68.58" width="0.1524" layer="91"/>
<junction x="233.68" y="66.04"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="2"/>
<pinref part="+P4" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="VDD"/>
<pinref part="C8" gate="G$1" pin="1"/>
<wire x1="223.52" y1="99.06" x2="228.6" y2="99.06" width="0.1524" layer="91"/>
<wire x1="228.6" y1="99.06" x2="228.6" y2="101.6" width="0.1524" layer="91"/>
<junction x="228.6" y="99.06"/>
<pinref part="+P6" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="190.5" y1="109.22" x2="190.5" y2="111.76" width="0.1524" layer="91"/>
<wire x1="190.5" y1="111.76" x2="193.04" y2="111.76" width="0.1524" layer="91"/>
<wire x1="193.04" y1="111.76" x2="193.04" y2="114.3" width="0.1524" layer="91"/>
<wire x1="193.04" y1="111.76" x2="198.12" y2="111.76" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="198.12" y1="111.76" x2="198.12" y2="109.22" width="0.1524" layer="91"/>
<junction x="193.04" y="111.76"/>
<pinref part="+P7" gate="1" pin="+3V3"/>
</segment>
<segment>
<wire x1="144.78" y1="116.84" x2="144.78" y2="119.38" width="0.1524" layer="91"/>
<wire x1="144.78" y1="116.84" x2="154.94" y2="116.84" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="2"/>
<wire x1="154.94" y1="116.84" x2="154.94" y2="101.6" width="0.1524" layer="91"/>
<pinref part="+P8" gate="1" pin="+3V3"/>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="144.78" y1="114.3" x2="144.78" y2="116.84" width="0.1524" layer="91"/>
<junction x="144.78" y="116.84"/>
</segment>
</net>
<net name="!EXT_RST" class="0">
<segment>
<wire x1="27.94" y1="68.58" x2="43.18" y2="68.58" width="0.1524" layer="91"/>
<label x="53.34" y="68.58" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="43.18" y1="68.58" x2="53.34" y2="68.58" width="0.1524" layer="91"/>
<wire x1="43.18" y1="53.34" x2="43.18" y2="68.58" width="0.1524" layer="91"/>
<junction x="43.18" y="68.58"/>
<wire x1="228.6" y1="50.8" x2="238.76" y2="50.8" width="0.1524" layer="91"/>
<wire x1="228.6" y1="50.8" x2="228.6" y2="63.5" width="0.1524" layer="91"/>
<pinref part="X1" gate="G$1" pin="EN"/>
<wire x1="228.6" y1="63.5" x2="226.06" y2="63.5" width="0.1524" layer="91"/>
<label x="238.76" y="50.8" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN1" gate="G$1" pin="2"/>
</segment>
</net>
<net name="!EXT_CS" class="0">
<segment>
<wire x1="53.34" y1="66.04" x2="45.72" y2="66.04" width="0.1524" layer="91"/>
<label x="53.34" y="66.04" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="45.72" y1="66.04" x2="27.94" y2="66.04" width="0.1524" layer="91"/>
<wire x1="45.72" y1="71.12" x2="45.72" y2="66.04" width="0.1524" layer="91"/>
<junction x="45.72" y="66.04"/>
<pinref part="CN1" gate="G$1" pin="3"/>
</segment>
<segment>
<wire x1="175.26" y1="55.88" x2="154.94" y2="55.88" width="0.1524" layer="91"/>
<label x="175.26" y="55.88" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U1" gate="G$1" pin="!CS"/>
</segment>
</net>
<net name="EXT_SCLK" class="0">
<segment>
<wire x1="27.94" y1="63.5" x2="53.34" y2="63.5" width="0.1524" layer="91"/>
<label x="53.34" y="63.5" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN1" gate="G$1" pin="4"/>
</segment>
<segment>
<wire x1="154.94" y1="53.34" x2="175.26" y2="53.34" width="0.1524" layer="91"/>
<label x="175.26" y="53.34" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U1" gate="G$1" pin="SCL/SCLK"/>
</segment>
</net>
<net name="EXT_MOSI" class="0">
<segment>
<wire x1="53.34" y1="60.96" x2="27.94" y2="60.96" width="0.1524" layer="91"/>
<label x="53.34" y="60.96" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN1" gate="G$1" pin="5"/>
</segment>
<segment>
<wire x1="175.26" y1="50.8" x2="154.94" y2="50.8" width="0.1524" layer="91"/>
<label x="175.26" y="50.8" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U1" gate="G$1" pin="SDA/SDI"/>
</segment>
</net>
<net name="EXT_MISO" class="0">
<segment>
<wire x1="27.94" y1="58.42" x2="53.34" y2="58.42" width="0.1524" layer="91"/>
<label x="53.34" y="58.42" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN1" gate="G$1" pin="6"/>
</segment>
<segment>
<wire x1="154.94" y1="48.26" x2="175.26" y2="48.26" width="0.1524" layer="91"/>
<label x="175.26" y="48.26" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U1" gate="G$1" pin="AD0/SDO"/>
</segment>
</net>
<net name="EXT_INT" class="0">
<segment>
<wire x1="53.34" y1="55.88" x2="27.94" y2="55.88" width="0.1524" layer="91"/>
<label x="53.34" y="55.88" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN1" gate="G$1" pin="7"/>
</segment>
<segment>
<wire x1="175.26" y1="43.18" x2="154.94" y2="43.18" width="0.1524" layer="91"/>
<label x="175.26" y="43.18" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U1" gate="G$1" pin="INT"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="CLKIN"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="154.94" y1="60.96" x2="200.66" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="X1" gate="G$1" pin="OUT"/>
<wire x1="208.28" y1="60.96" x2="210.82" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MCU_SCLK" class="0">
<segment>
<wire x1="40.64" y1="172.72" x2="30.48" y2="172.72" width="0.1524" layer="91"/>
<label x="30.48" y="172.72" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN2" gate="G$1" pin="6"/>
</segment>
<segment>
<wire x1="144.78" y1="220.98" x2="160.02" y2="220.98" width="0.1524" layer="91"/>
<label x="160.02" y="220.98" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="C"/>
</segment>
</net>
<net name="MCU_MISO" class="0">
<segment>
<wire x1="40.64" y1="170.18" x2="30.48" y2="170.18" width="0.1524" layer="91"/>
<label x="30.48" y="170.18" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN2" gate="G$1" pin="8"/>
</segment>
<segment>
<wire x1="144.78" y1="215.9" x2="160.02" y2="215.9" width="0.1524" layer="91"/>
<label x="160.02" y="215.9" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="SO/DQ1"/>
</segment>
</net>
<net name="MCU_AUX2" class="0">
<segment>
<label x="30.48" y="175.26" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="40.64" y1="175.26" x2="30.48" y2="175.26" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="4"/>
</segment>
<segment>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="119.38" y1="83.82" x2="116.84" y2="83.82" width="0.1524" layer="91"/>
<wire x1="116.84" y1="83.82" x2="116.84" y2="88.9" width="0.1524" layer="91"/>
<wire x1="116.84" y1="88.9" x2="111.76" y2="88.9" width="0.1524" layer="91"/>
<label x="111.76" y="88.9" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="Q1" gate="G$1" pin="G"/>
<wire x1="116.84" y1="88.9" x2="124.46" y2="88.9" width="0.1524" layer="91"/>
<junction x="116.84" y="88.9"/>
</segment>
<segment>
<label x="198.12" y="160.02" size="1.27" layer="95" font="vector" rot="MR270" xref="yes"/>
<wire x1="198.12" y1="165.1" x2="198.12" y2="160.02" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="K"/>
</segment>
</net>
<net name="MCU_MOSI" class="0">
<segment>
<wire x1="53.34" y1="172.72" x2="63.5" y2="172.72" width="0.1524" layer="91"/>
<label x="63.5" y="172.72" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN2" gate="G$1" pin="5"/>
</segment>
<segment>
<wire x1="144.78" y1="218.44" x2="160.02" y2="218.44" width="0.1524" layer="91"/>
<label x="160.02" y="218.44" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="SI/DQ0"/>
</segment>
</net>
<net name="MCU_AUX0" class="0">
<segment>
<wire x1="53.34" y1="170.18" x2="63.5" y2="170.18" width="0.1524" layer="91"/>
<label x="63.5" y="170.18" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN2" gate="G$1" pin="7"/>
</segment>
</net>
<net name="MCU_AUX1" class="0">
<segment>
<label x="63.5" y="175.26" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="53.34" y1="175.26" x2="63.5" y2="175.26" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="3"/>
</segment>
<segment>
<label x="160.02" y="223.52" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="144.78" y1="223.52" x2="149.86" y2="223.52" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="!S"/>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="149.86" y1="223.52" x2="160.02" y2="223.52" width="0.1524" layer="91"/>
<wire x1="149.86" y1="223.52" x2="149.86" y2="226.06" width="0.1524" layer="91"/>
<junction x="149.86" y="223.52"/>
</segment>
</net>
<net name="+3V3/2" class="0">
<segment>
<wire x1="53.34" y1="177.8" x2="55.88" y2="177.8" width="0.1524" layer="91"/>
<wire x1="55.88" y1="177.8" x2="55.88" y2="180.34" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="1"/>
<pinref part="+P5" gate="1" pin="+3V3/2"/>
</segment>
<segment>
<pinref part="+P9" gate="1" pin="+3V3/2"/>
<pinref part="C7" gate="G$1" pin="1"/>
<wire x1="114.3" y1="226.06" x2="114.3" y2="223.52" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="VCC"/>
<wire x1="114.3" y1="223.52" x2="114.3" y2="220.98" width="0.1524" layer="91"/>
<wire x1="114.3" y1="223.52" x2="119.38" y2="223.52" width="0.1524" layer="91"/>
<junction x="114.3" y="223.52"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="!W!/DQ2"/>
<wire x1="144.78" y1="213.36" x2="149.86" y2="213.36" width="0.1524" layer="91"/>
<wire x1="149.86" y1="213.36" x2="149.86" y2="210.82" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="!H!/DQ3"/>
<wire x1="149.86" y1="210.82" x2="144.78" y2="210.82" width="0.1524" layer="91"/>
<pinref part="+P10" gate="1" pin="+3V3/2"/>
<wire x1="149.86" y1="210.82" x2="154.94" y2="210.82" width="0.1524" layer="91"/>
<junction x="149.86" y="210.82"/>
</segment>
<segment>
<pinref part="R9" gate="G$1" pin="2"/>
<pinref part="+P11" gate="1" pin="+3V3/2"/>
<wire x1="149.86" y1="233.68" x2="149.86" y2="236.22" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R10" gate="G$1" pin="2"/>
<pinref part="+P12" gate="1" pin="+3V3/2"/>
<wire x1="198.12" y1="180.34" x2="198.12" y2="182.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="AUX_SDA" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="SDA"/>
<wire x1="198.12" y1="96.52" x2="203.2" y2="96.52" width="0.1524" layer="91"/>
<wire x1="198.12" y1="96.52" x2="198.12" y2="101.6" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="198.12" y1="96.52" x2="185.42" y2="96.52" width="0.1524" layer="91"/>
<junction x="198.12" y="96.52"/>
<label x="185.42" y="96.52" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="AUX_DA"/>
<wire x1="175.26" y1="35.56" x2="154.94" y2="35.56" width="0.1524" layer="91"/>
<label x="175.26" y="35.56" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="AUX_SCL" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AUX_CL"/>
<wire x1="154.94" y1="38.1" x2="175.26" y2="38.1" width="0.1524" layer="91"/>
<label x="175.26" y="38.1" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="SCL"/>
<wire x1="190.5" y1="99.06" x2="203.2" y2="99.06" width="0.1524" layer="91"/>
<wire x1="190.5" y1="99.06" x2="190.5" y2="101.6" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="1"/>
<wire x1="185.42" y1="99.06" x2="190.5" y2="99.06" width="0.1524" layer="91"/>
<junction x="190.5" y="99.06"/>
<label x="185.42" y="99.06" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="INT"/>
<wire x1="203.2" y1="91.44" x2="154.94" y2="91.44" width="0.1524" layer="91"/>
<pinref part="Q2" gate="G$1" pin="B"/>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="154.94" y1="91.44" x2="149.86" y2="91.44" width="0.1524" layer="91"/>
<wire x1="154.94" y1="93.98" x2="154.94" y2="91.44" width="0.1524" layer="91"/>
<junction x="154.94" y="91.44"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="Q2" gate="G$1" pin="E"/>
<pinref part="Q1" gate="G$1" pin="D"/>
<wire x1="144.78" y1="99.06" x2="144.78" y2="96.52" width="0.1524" layer="91"/>
<wire x1="129.54" y1="96.52" x2="129.54" y2="99.06" width="0.1524" layer="91"/>
<wire x1="129.54" y1="99.06" x2="144.78" y2="99.06" width="0.1524" layer="91"/>
<pinref part="LED1" gate="G$1" pin="K"/>
<wire x1="144.78" y1="101.6" x2="144.78" y2="99.06" width="0.1524" layer="91"/>
<junction x="144.78" y="99.06"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="A"/>
<pinref part="R6" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="LED2" gate="G$1" pin="A"/>
<pinref part="R10" gate="G$1" pin="1"/>
<wire x1="198.12" y1="170.18" x2="198.12" y2="172.72" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>
