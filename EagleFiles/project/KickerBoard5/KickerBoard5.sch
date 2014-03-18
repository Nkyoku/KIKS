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
<library name="supply1">
<description>Supply Symbols</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="VCC/1">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="1.778" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.905" x2="0" y2="1.778" width="0.254" layer="94"/>
<pin name="VCC/1" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
</symbol>
<symbol name="VCC/2">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="1.778" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.905" x2="0" y2="1.778" width="0.254" layer="94"/>
<pin name="VCC/2" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
</symbol>
<symbol name="+9V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.27" y1="-0.635" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="-1.27" y2="-0.635" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+9V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="VBAT">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="VBAT" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
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
<deviceset name="VCC/1" prefix="P+">
<gates>
<gate name="G$1" symbol="VCC/1" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VCC/2" prefix="P+">
<gates>
<gate name="G$1" symbol="VCC/2" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+9V" prefix="+P">
<gates>
<gate name="G$1" symbol="+9V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VBAT" prefix="+P">
<gates>
<gate name="G$1" symbol="VBAT" x="0" y="0"/>
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
<text x="-1.4" y="0.8" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.4" y="-1.6" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
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
<text x="-1.7" y="1" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.7" y="-1.8" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
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
<text x="-2.4" y="1.2" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.4" y="-2" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-1.7" y1="-0.8" x2="-1.1" y2="0.8" layer="51"/>
<rectangle x1="1.1" y1="-0.8" x2="1.7" y2="0.8" layer="51"/>
<rectangle x1="-1.1" y1="0.6" x2="1.1" y2="0.8" layer="51"/>
<rectangle x1="-1.1" y1="-0.8" x2="1.1" y2="-0.6" layer="51"/>
</package>
<package name="6432">
<smd name="1" x="-3.2" y="0" dx="1.2" dy="3.2" layer="1"/>
<smd name="2" x="3.2" y="0" dx="1.2" dy="3.2" layer="1"/>
<text x="-3.4" y="1.9" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-3.4" y="-2.6" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-3.4" y1="-1.6" x2="-2.6" y2="1.6" layer="51"/>
<rectangle x1="2.6" y1="-1.6" x2="3.4" y2="1.6" layer="51"/>
<rectangle x1="-2.6" y1="1.4" x2="2.6" y2="1.6" layer="51"/>
<rectangle x1="-2.6" y1="-1.6" x2="2.6" y2="-1.4" layer="51"/>
</package>
<package name="1005">
<wire x1="-1.05" y1="0.45" x2="1.05" y2="0.45" width="0.127" layer="21"/>
<wire x1="1.05" y1="0.45" x2="1.05" y2="-0.45" width="0.127" layer="21"/>
<wire x1="1.05" y1="-0.45" x2="-1.05" y2="-0.45" width="0.127" layer="21"/>
<wire x1="-1.05" y1="-0.45" x2="-1.05" y2="0.45" width="0.127" layer="21"/>
<smd name="1" x="-0.55" y="0" dx="0.5" dy="0.5" layer="1"/>
<smd name="2" x="0.55" y="0" dx="0.5" dy="0.5" layer="1"/>
<text x="-1.1" y="0.65" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.1" y="-1.4" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.5" y1="-0.25" x2="-0.25" y2="0.25" layer="51"/>
<rectangle x1="0.25" y1="-0.25" x2="0.5" y2="0.25" layer="51"/>
<rectangle x1="-0.25" y1="0.15" x2="0.25" y2="0.25" layer="51"/>
<rectangle x1="-0.25" y1="-0.25" x2="0.25" y2="-0.15" layer="51"/>
</package>
<package name="E5-10">
<wire x1="-3.5" y1="1.5" x2="-2.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="-3" y1="2" x2="-3" y2="1" width="0.127" layer="21"/>
<wire x1="4" y1="3" x2="4" y2="-3" width="0.127" layer="21"/>
<circle x="0" y="0" radius="5" width="0.127" layer="21"/>
<pad name="P" x="-2.54" y="0" drill="0.9" diameter="1.5"/>
<pad name="N" x="2.54" y="0" drill="0.9" diameter="1.5"/>
<text x="5" y="2.5" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="5" y="-3" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="E3.5-8">
<wire x1="-2.65" y1="1.5" x2="-1.85" y2="1.5" width="0.127" layer="21"/>
<wire x1="-2.25" y1="1.9" x2="-2.25" y2="1.1" width="0.127" layer="21"/>
<wire x1="3" y1="2.65" x2="3" y2="-2.65" width="0.127" layer="21"/>
<circle x="0" y="0" radius="4" width="0.127" layer="21"/>
<pad name="P" x="-1.75" y="0" drill="0.9" diameter="1.5"/>
<pad name="N" x="1.75" y="0" drill="0.9" diameter="1.5"/>
<text x="4" y="2" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="4" y="-2.5" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="E2-5">
<wire x1="-2.05" y1="1" x2="-1.45" y2="1" width="0.127" layer="21"/>
<wire x1="-1.75" y1="1.3" x2="-1.75" y2="0.7" width="0.127" layer="21"/>
<wire x1="2" y1="1.45" x2="2" y2="-1.45" width="0.127" layer="21"/>
<circle x="0" y="0" radius="2.5" width="0.127" layer="21"/>
<pad name="P" x="-1" y="0" drill="0.8" diameter="1.3"/>
<pad name="N" x="1" y="0" drill="0.8" diameter="1.3"/>
<text x="2.5" y="1.5" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="2.5" y="-2" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="ES-12.5">
<wire x1="-5" y1="2" x2="-4" y2="2" width="0.127" layer="21"/>
<wire x1="-4.5" y1="2.5" x2="-4.5" y2="1.5" width="0.127" layer="21"/>
<circle x="0" y="0" radius="6.25" width="0.127" layer="51"/>
<text x="7.5" y="3" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="7.5" y="-3" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<smd name="P" x="-4.85" y="0" dx="5.7" dy="2" layer="1"/>
<smd name="N" x="4.85" y="0" dx="5.7" dy="2" layer="1"/>
<rectangle x1="-6.9" y1="-0.6" x2="-2.2" y2="0.6" layer="51"/>
<rectangle x1="2.2" y1="-0.6" x2="6.9" y2="0.6" layer="51"/>
<wire x1="-6.75" y1="4.25" x2="-4.25" y2="6.75" width="0.127" layer="21"/>
<wire x1="-4.25" y1="6.75" x2="6.75" y2="6.75" width="0.127" layer="21"/>
<wire x1="6.75" y1="6.75" x2="6.75" y2="1.2" width="0.127" layer="21"/>
<wire x1="6.75" y1="1.2" x2="6.75" y2="-1.2" width="0.127" layer="51"/>
<wire x1="6.75" y1="-1.2" x2="6.75" y2="-6.75" width="0.127" layer="21"/>
<wire x1="6.75" y1="-6.75" x2="-4.25" y2="-6.75" width="0.127" layer="21"/>
<wire x1="-4.25" y1="-6.75" x2="-6.75" y2="-4.25" width="0.127" layer="21"/>
<wire x1="-6.75" y1="-4.25" x2="-6.75" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-6.75" y1="-1.2" x2="-6.75" y2="1.2" width="0.127" layer="51"/>
<wire x1="-6.75" y1="1.2" x2="-6.75" y2="4.25" width="0.127" layer="21"/>
</package>
<package name="ES2-8">
<wire x1="-2.9" y1="2" x2="-2.1" y2="2" width="0.127" layer="21"/>
<wire x1="-2.5" y1="2.4" x2="-2.5" y2="1.6" width="0.127" layer="21"/>
<circle x="0" y="0" radius="4" width="0.127" layer="51"/>
<text x="5" y="3" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="5" y="2" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<smd name="P" x="-3.55" y="0" dx="4" dy="2" layer="1"/>
<smd name="N" x="3.55" y="0" dx="4" dy="2" layer="1"/>
<rectangle x1="-4.95" y1="-0.6" x2="-1.55" y2="0.6" layer="51"/>
<wire x1="-4.15" y1="3.35" x2="-3.35" y2="4.15" width="0.127" layer="21"/>
<wire x1="-3.35" y1="4.15" x2="4.15" y2="4.15" width="0.127" layer="21"/>
<wire x1="4.15" y1="4.15" x2="4.15" y2="1.2" width="0.127" layer="21"/>
<wire x1="4.15" y1="1.2" x2="4.15" y2="-1.2" width="0.127" layer="51"/>
<wire x1="4.15" y1="-1.2" x2="4.15" y2="-4.15" width="0.127" layer="21"/>
<wire x1="4.15" y1="-4.15" x2="-3.35" y2="-4.15" width="0.127" layer="21"/>
<rectangle x1="1.55" y1="-0.6" x2="4.95" y2="0.6" layer="51"/>
<wire x1="-4.15" y1="-3.35" x2="-4.15" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-4.15" y1="-1.2" x2="-4.15" y2="1.2" width="0.127" layer="51"/>
<wire x1="-4.15" y1="1.2" x2="-4.15" y2="3.35" width="0.127" layer="21"/>
<wire x1="-3.35" y1="-4.15" x2="-4.15" y2="-3.35" width="0.127" layer="21"/>
</package>
<package name="ES-6.3">
<wire x1="-2.3" y1="1.3" x2="-1.7" y2="1.3" width="0.127" layer="21"/>
<wire x1="-2" y1="1.6" x2="-2" y2="1" width="0.127" layer="21"/>
<circle x="0" y="0" radius="3.15" width="0.127" layer="51"/>
<text x="4" y="2.5" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="4" y="1.5" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<smd name="P" x="-2.5" y="0" dx="3" dy="1.2" layer="1"/>
<smd name="N" x="2.5" y="0" dx="3" dy="1.2" layer="1"/>
<rectangle x1="-3.5" y1="-0.4" x2="-1.1" y2="0.4" layer="51"/>
<wire x1="-3.3" y1="2.3" x2="-2.3" y2="3.3" width="0.127" layer="21"/>
<wire x1="-2.3" y1="3.3" x2="3.3" y2="3.3" width="0.127" layer="21"/>
<wire x1="3.3" y1="3.3" x2="3.3" y2="0.8" width="0.127" layer="21"/>
<wire x1="3.3" y1="0.8" x2="3.3" y2="-0.8" width="0.127" layer="51"/>
<wire x1="3.3" y1="-0.8" x2="3.3" y2="-3.3" width="0.127" layer="21"/>
<wire x1="3.3" y1="-3.3" x2="-2.3" y2="-3.3" width="0.127" layer="21"/>
<wire x1="-3.3" y1="-2.3" x2="-3.3" y2="-0.8" width="0.127" layer="21"/>
<wire x1="-3.3" y1="-0.8" x2="-3.3" y2="0.8" width="0.127" layer="51"/>
<wire x1="-3.3" y1="0.8" x2="-3.3" y2="2.3" width="0.127" layer="21"/>
<wire x1="-2.3" y1="-3.3" x2="-3.3" y2="-2.3" width="0.127" layer="21"/>
<rectangle x1="1.1" y1="-0.4" x2="3.5" y2="0.4" layer="51"/>
</package>
<package name="E2.5-6.3">
<wire x1="-2.3" y1="1" x2="-1.7" y2="1" width="0.127" layer="21"/>
<wire x1="-2" y1="1.3" x2="-2" y2="0.7" width="0.127" layer="21"/>
<wire x1="2.25" y1="2.2" x2="2.25" y2="-2.2" width="0.127" layer="21"/>
<circle x="0" y="0" radius="3.15" width="0.127" layer="21"/>
<pad name="P" x="-1.25" y="0" drill="0.8" diameter="1.3"/>
<pad name="N" x="1.25" y="0" drill="0.8" diameter="1.3"/>
<text x="3.5" y="1.5" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="3.5" y="-2" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="3225">
<wire x1="2.35" y1="1.45" x2="2.35" y2="-1.45" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1.45" x2="-2.35" y2="-1.45" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-1.45" x2="-2.35" y2="1.45" width="0.127" layer="21"/>
<wire x1="-2.35" y1="1.45" x2="2.35" y2="1.45" width="0.127" layer="21"/>
<smd name="1" x="-1.625" y="0" dx="1.05" dy="2.5" layer="1"/>
<smd name="2" x="1.625" y="0" dx="1.05" dy="2.5" layer="1"/>
<text x="-2.4" y="1.6" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.4" y="-2.4" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-1.7" y1="-1.25" x2="-1.1" y2="1.25" layer="51"/>
<rectangle x1="1.1" y1="-1.25" x2="1.7" y2="1.25" layer="51"/>
<rectangle x1="-1.1" y1="1.05" x2="1.1" y2="1.25" layer="51"/>
<rectangle x1="-1.1" y1="-1.25" x2="1.1" y2="-1.05" layer="51"/>
</package>
<package name="L4949">
<wire x1="-2.45" y1="2.45" x2="2.45" y2="2.45" width="0.127" layer="21"/>
<wire x1="2.45" y1="2.2" x2="2.45" y2="-2.2" width="0.127" layer="51"/>
<wire x1="2.45" y1="-2.45" x2="-2.45" y2="-2.45" width="0.127" layer="21"/>
<wire x1="-2.45" y1="-2.2" x2="-2.45" y2="2.2" width="0.127" layer="51"/>
<wire x1="2.45" y1="2.45" x2="2.45" y2="2.2" width="0.127" layer="21"/>
<wire x1="2.45" y1="-2.45" x2="2.45" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-2.45" y1="-2.45" x2="-2.45" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-2.45" y1="2.45" x2="-2.45" y2="2.2" width="0.127" layer="21"/>
<smd name="1" x="-2.3" y="0" dx="2.2" dy="4" layer="1"/>
<smd name="2" x="2.3" y="0" dx="2.2" dy="4" layer="1"/>
<text x="-2.54" y="2.794" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="-3.556" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="L8040">
<wire x1="-4" y1="4" x2="4" y2="4" width="0.127" layer="21"/>
<wire x1="4" y1="3.2" x2="4" y2="-3.2" width="0.127" layer="51"/>
<wire x1="4" y1="-4" x2="-4" y2="-4" width="0.127" layer="21"/>
<wire x1="-4" y1="-3.2" x2="-4" y2="3.2" width="0.127" layer="51"/>
<wire x1="4" y1="4" x2="4" y2="3.2" width="0.127" layer="21"/>
<wire x1="4" y1="-4" x2="4" y2="-3.2" width="0.127" layer="21"/>
<wire x1="-4" y1="-4" x2="-4" y2="-3.2" width="0.127" layer="21"/>
<wire x1="-4" y1="4" x2="-4" y2="3.2" width="0.127" layer="21"/>
<smd name="1" x="-3.7" y="0" dx="2.6" dy="6" layer="1"/>
<smd name="2" x="3.7" y="0" dx="2.6" dy="6" layer="1"/>
<text x="-3.81" y="4.191" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-3.81" y="-4.953" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="L5750">
<wire x1="-3" y1="2.6" x2="3" y2="2.6" width="0.127" layer="21"/>
<wire x1="3" y1="1.2" x2="3" y2="-1.2" width="0.127" layer="51"/>
<wire x1="3" y1="-2.6" x2="-3" y2="-2.6" width="0.127" layer="21"/>
<wire x1="-3" y1="-1.2" x2="-3" y2="1.2" width="0.127" layer="51"/>
<wire x1="3" y1="2.6" x2="3" y2="1.2" width="0.127" layer="21"/>
<wire x1="3" y1="-2.6" x2="3" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-3" y1="-2.6" x2="-3" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-3" y1="2.6" x2="-3" y2="1.2" width="0.127" layer="21"/>
<smd name="1" x="-2.8" y="0" dx="3" dy="2" layer="1"/>
<smd name="2" x="2.8" y="0" dx="3" dy="2" layer="1"/>
<text x="-2.54" y="2.794" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="-3.556" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="L4040">
<wire x1="-2" y1="2" x2="2" y2="2" width="0.127" layer="21"/>
<wire x1="2" y1="-2" x2="-2" y2="-2" width="0.127" layer="21"/>
<wire x1="-2" y1="2" x2="-2" y2="1.95" width="0.127" layer="21"/>
<wire x1="2" y1="2" x2="2" y2="1.95" width="0.127" layer="21"/>
<wire x1="-2" y1="-2" x2="-2" y2="-1.95" width="0.127" layer="21"/>
<wire x1="2" y1="-2" x2="2" y2="-1.95" width="0.127" layer="21"/>
<wire x1="-2" y1="-1.95" x2="-2" y2="1.95" width="0.127" layer="51"/>
<wire x1="2" y1="1.95" x2="2" y2="-1.95" width="0.127" layer="51"/>
<smd name="1" x="-1.75" y="0" dx="2.2" dy="3.5" layer="1"/>
<smd name="2" x="1.75" y="0" dx="2.2" dy="3.5" layer="1"/>
<text x="-2.1" y="2.2" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.1" y="-3" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="L3030">
<wire x1="-1.5" y1="1.5" x2="1.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="-1.5" x2="-1.5" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-1.5" y1="1.5" x2="-1.5" y2="1.2" width="0.127" layer="21"/>
<wire x1="1.5" y1="1.5" x2="1.5" y2="1.2" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.5" x2="-1.5" y2="-1.2" width="0.127" layer="21"/>
<wire x1="1.5" y1="-1.5" x2="1.5" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.2" x2="-1.5" y2="1.2" width="0.127" layer="51"/>
<wire x1="1.5" y1="1.2" x2="1.5" y2="-1.2" width="0.127" layer="51"/>
<smd name="1" x="-1.6" y="0" dx="1.6" dy="2" layer="1"/>
<smd name="2" x="1.6" y="0" dx="1.6" dy="2" layer="1"/>
<text x="-1.6" y="1.7" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.6" y="-2.5" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="L6060">
<wire x1="-3" y1="3" x2="3" y2="3" width="0.127" layer="21"/>
<wire x1="3" y1="2.65" x2="3" y2="-2.65" width="0.127" layer="51"/>
<wire x1="3" y1="-3" x2="-3" y2="-3" width="0.127" layer="21"/>
<wire x1="-3" y1="-2.65" x2="-3" y2="2.65" width="0.127" layer="51"/>
<wire x1="3" y1="3" x2="3" y2="2.65" width="0.127" layer="21"/>
<wire x1="3" y1="-3" x2="3" y2="-2.65" width="0.127" layer="21"/>
<wire x1="-3" y1="-3" x2="-3" y2="-2.65" width="0.127" layer="21"/>
<wire x1="-3" y1="3" x2="-3" y2="2.65" width="0.127" layer="21"/>
<smd name="1" x="-2.7" y="0" dx="2.6" dy="5" layer="1"/>
<smd name="2" x="2.7" y="0" dx="2.6" dy="5" layer="1"/>
<text x="-2.54" y="3.81" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="-4.445" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="L2520">
<wire x1="-1.25" y1="1" x2="1.25" y2="1" width="0.127" layer="21"/>
<wire x1="1.25" y1="-1" x2="-1.25" y2="-1" width="0.127" layer="21"/>
<wire x1="-1.25" y1="-1" x2="-1.25" y2="1" width="0.127" layer="51"/>
<wire x1="1.25" y1="1" x2="1.25" y2="-1" width="0.127" layer="51"/>
<smd name="1" x="-1.2" y="0" dx="1.4" dy="1.65" layer="1"/>
<smd name="2" x="1.2" y="0" dx="1.4" dy="1.65" layer="1"/>
<text x="-1.3" y="1.2" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.3" y="-2" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
</packages>
<symbols>
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
<symbol name="FUSE">
<text x="-2.54" y="2.54" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<wire x1="-2.54" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0.762" x2="-2.54" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-0.762" x2="2.54" y2="-0.762" width="0.254" layer="94"/>
<wire x1="2.54" y1="-0.762" x2="2.54" y2="0.762" width="0.254" layer="94"/>
<wire x1="2.54" y1="0.762" x2="-2.54" y2="0.762" width="0.254" layer="94"/>
</symbol>
<symbol name="POL-CAPACITOR">
<wire x1="0" y1="2.54" x2="0" y2="1.778" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="1.016" width="0.1524" layer="94"/>
<wire x1="-2.032" y1="2.794" x2="-1.016" y2="2.794" width="0.254" layer="94"/>
<wire x1="-1.524" y1="3.302" x2="-1.524" y2="2.286" width="0.254" layer="94"/>
<wire x1="-2.032" y1="1.778" x2="2.032" y2="1.778" width="0.254" layer="94"/>
<wire x1="-2.032" y1="0.508" x2="2.032" y2="0.508" width="0.254" layer="94" curve="-60.000384"/>
<text x="1.524" y="2.921" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="1.524" y="-2.159" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="P" x="0" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="N" x="0" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
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
<symbol name="INDUCTOR">
<wire x1="-2.54" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94" curve="-90"/>
<wire x1="0" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94" curve="90"/>
<wire x1="0" y1="0" x2="1.27" y2="1.27" width="0.254" layer="94" curve="-90"/>
<wire x1="2.54" y1="0" x2="1.27" y2="1.27" width="0.254" layer="94" curve="90"/>
<text x="-2.54" y="2.54" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
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
</symbols>
<devicesets>
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
</devices>
</deviceset>
<deviceset name="F" prefix="F" uservalue="yes">
<gates>
<gate name="G$1" symbol="FUSE" x="0" y="0"/>
</gates>
<devices>
<device name="3216" package="3216">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
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
</devices>
</deviceset>
<deviceset name="CPOL" prefix="C" uservalue="yes">
<gates>
<gate name="G$1" symbol="POL-CAPACITOR" x="0" y="0"/>
</gates>
<devices>
<device name="5-10" package="E5-10">
<connects>
<connect gate="G$1" pin="N" pad="N"/>
<connect gate="G$1" pin="P" pad="P"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.5-8" package="E3.5-8">
<connects>
<connect gate="G$1" pin="N" pad="N"/>
<connect gate="G$1" pin="P" pad="P"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2-5" package="E2-5">
<connects>
<connect gate="G$1" pin="N" pad="N"/>
<connect gate="G$1" pin="P" pad="P"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="S-12.5" package="ES-12.5">
<connects>
<connect gate="G$1" pin="N" pad="N"/>
<connect gate="G$1" pin="P" pad="P"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="S2-8" package="ES2-8">
<connects>
<connect gate="G$1" pin="N" pad="N"/>
<connect gate="G$1" pin="P" pad="P"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="S-6.3" package="ES-6.3">
<connects>
<connect gate="G$1" pin="N" pad="N"/>
<connect gate="G$1" pin="P" pad="P"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2.5-6.3" package="E2.5-6.3">
<connects>
<connect gate="G$1" pin="N" pad="N"/>
<connect gate="G$1" pin="P" pad="P"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
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
</devices>
</deviceset>
<deviceset name="L" prefix="L" uservalue="yes">
<gates>
<gate name="G$1" symbol="INDUCTOR" x="0" y="0"/>
</gates>
<devices>
<device name="50" package="L4949">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="80" package="L8040">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="57" package="L5750">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="40" package="L4040">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="30" package="L3030">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="60" package="L6060">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1608" package="1608">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2520" package="L2520">
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
<text x="-1.905" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="2.54" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.15" y1="-1.25" x2="-0.75" y2="-0.65" layer="51" rot="R180"/>
<rectangle x1="0.75" y1="-1.25" x2="1.15" y2="-0.65" layer="51" rot="R180"/>
<rectangle x1="-0.2" y1="0.65" x2="0.2" y2="1.25" layer="51"/>
</package>
<package name="SOT323-3">
<wire x1="-1" y1="0.625" x2="1" y2="0.625" width="0.127" layer="21"/>
<wire x1="1" y1="0.625" x2="1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="1" y1="-0.625" x2="-1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.625" x2="-1" y2="0.625" width="0.127" layer="21"/>
<smd name="1" x="-0.65" y="-1.1" dx="0.4" dy="0.6" layer="1"/>
<smd name="2" x="0.65" y="-1.1" dx="0.4" dy="0.6" layer="1"/>
<smd name="3" x="0" y="1.1" dx="0.4" dy="0.6" layer="1" rot="R180"/>
<text x="-1.905" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="2.54" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.8" y1="-1.05" x2="-0.5" y2="-0.625" layer="51"/>
<rectangle x1="0.5" y1="-1.05" x2="0.8" y2="-0.625" layer="51"/>
<rectangle x1="-0.15" y1="0.625" x2="0.15" y2="1.05" layer="51" rot="R180"/>
</package>
<package name="SOP8">
<wire x1="-2.45" y1="1.95" x2="2.45" y2="1.95" width="0.127" layer="21"/>
<wire x1="2.45" y1="1.95" x2="2.45" y2="-1.95" width="0.127" layer="21"/>
<wire x1="-2.45" y1="1.95" x2="-2.45" y2="-1.95" width="0.127" layer="21"/>
<wire x1="-2.45" y1="-1.95" x2="2.45" y2="-1.95" width="0.127" layer="21"/>
<circle x="-1.885" y="-1.29" radius="0.2" width="0.127" layer="21"/>
<smd name="2" x="-0.635" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="7" x="-0.635" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="1" x="-1.905" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="3" x="0.635" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="4" x="1.905" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="8" x="-1.905" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="6" x="0.635" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="5" x="1.905" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<text x="-1.905" y="0.635" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.905" y="-0.635" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="1.7" y1="1.95" x2="2.11" y2="2.95" layer="51"/>
<rectangle x1="0.43" y1="1.95" x2="0.84" y2="2.95" layer="51"/>
<rectangle x1="-0.84" y1="1.95" x2="-0.43" y2="2.95" layer="51"/>
<rectangle x1="-2.11" y1="1.95" x2="-1.7" y2="2.95" layer="51"/>
<rectangle x1="1.7" y1="-2.95" x2="2.11" y2="-1.95" layer="51"/>
<rectangle x1="0.43" y1="-2.95" x2="0.84" y2="-1.95" layer="51"/>
<rectangle x1="-0.84" y1="-2.95" x2="-0.43" y2="-1.95" layer="51"/>
<rectangle x1="-2.11" y1="-2.95" x2="-1.7" y2="-1.95" layer="51"/>
</package>
<package name="DPAK-3">
<wire x1="-3.3" y1="6.1" x2="-3.3" y2="0" width="0.127" layer="21"/>
<wire x1="3.3" y1="0" x2="3.3" y2="6.1" width="0.127" layer="21"/>
<text x="-3.81" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="5.08" y="-1.27" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
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
</package>
<package name="SOT89-3">
<wire x1="2.25" y1="1.25" x2="2.25" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-2.25" y1="-1.25" x2="-2.25" y2="1.25" width="0.127" layer="21"/>
<smd name="1" x="-1.5" y="-2.05" dx="0.6" dy="1.2" layer="1"/>
<smd name="2" x="0" y="-0.25" dx="1.8" dy="4.8" layer="1"/>
<smd name="3" x="1.5" y="-2.05" dx="0.6" dy="1.2" layer="1"/>
<text x="-3.175" y="-2.54" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="3.81" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
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
</package>
<package name="SON8_1.27">
<wire x1="-2.45" y1="2.875" x2="2.45" y2="2.875" width="0.127" layer="21"/>
<wire x1="2.45" y1="2.875" x2="2.45" y2="-2.875" width="0.127" layer="21"/>
<wire x1="-2.45" y1="2.875" x2="-2.45" y2="-2.875" width="0.127" layer="21"/>
<wire x1="-2.45" y1="-2.875" x2="2.45" y2="-2.875" width="0.127" layer="21"/>
<circle x="-1.9" y="-1.8" radius="0.2" width="0.127" layer="21"/>
<smd name="1" x="-1.905" y="-3" dx="0.48" dy="1.2" layer="1"/>
<text x="3.175" y="0.635" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="3.175" y="-0.635" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
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
</package>
<package name="TO-220F">
<text x="-5.08" y="5.08" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-5.08" y="3.81" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
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
</package>
<package name="D2PAK-3">
<wire x1="-5.08" y1="9.017" x2="-5.08" y2="3" width="0.127" layer="51"/>
<wire x1="-5.08" y1="3" x2="-5.08" y2="0" width="0.127" layer="21"/>
<wire x1="5.08" y1="0" x2="5.08" y2="3" width="0.127" layer="21"/>
<wire x1="5.08" y1="3" x2="5.08" y2="9.017" width="0.127" layer="51"/>
<text x="-6.35" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="6.35" y="-1.27" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
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
</package>
<package name="TO-3P">
<text x="-7.62" y="3.81" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-7.62" y="2.54" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<pad name="1" x="-5.45" y="0" drill="1.5" diameter="2.1"/>
<pad name="2" x="0" y="0" drill="1.5" diameter="2.1"/>
<pad name="3" x="5.45" y="0" drill="1.5" diameter="2.1"/>
<wire x1="-7.8" y1="1.7" x2="7.8" y2="1.7" width="0.127" layer="21"/>
<wire x1="-7.8" y1="-3.1" x2="7.8" y2="-3.1" width="0.127" layer="21"/>
<wire x1="-7.8" y1="-3.1" x2="-7.8" y2="0.2" width="0.127" layer="21"/>
<wire x1="-7.8" y1="0.2" x2="-7.8" y2="1.7" width="0.127" layer="21"/>
<wire x1="7.8" y1="-3.1" x2="7.8" y2="0.2" width="0.127" layer="21"/>
<rectangle x1="-7.8" y1="0.2" x2="7.8" y2="1.7" layer="51"/>
<wire x1="7.8" y1="0.2" x2="7.8" y2="1.7" width="0.127" layer="21"/>
<wire x1="-7.8" y1="0.2" x2="-6.7" y2="0.2" width="0.127" layer="21"/>
<wire x1="-4.2" y1="0.2" x2="-1.3" y2="0.2" width="0.127" layer="21"/>
<wire x1="1.3" y1="0.2" x2="4.2" y2="0.2" width="0.127" layer="21"/>
<wire x1="6.7" y1="0.2" x2="7.8" y2="0.2" width="0.127" layer="21"/>
</package>
<package name="TO-3P-RIGHT">
<text x="-10.16" y="0" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="-8.89" y="0" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<pad name="1" x="-5.5" y="-4.95" drill="1.5" diameter="2.1" rot="R90"/>
<pad name="2" x="0" y="-5" drill="1.5" diameter="2.1" rot="R90"/>
<pad name="3" x="5.5" y="-5.05" drill="1.5" diameter="2.1" rot="R90"/>
<wire x1="-7.8" y1="0" x2="-7.8" y2="18.4" width="0.127" layer="21"/>
<wire x1="-7.8" y1="13.9" x2="-6.8" y2="13.9" width="0.127" layer="51"/>
<wire x1="-6.8" y1="13.9" x2="-4.8" y2="18.7" width="0.127" layer="51"/>
<wire x1="-4.8" y1="18.7" x2="4.8" y2="18.7" width="0.127" layer="51"/>
<wire x1="4.8" y1="18.7" x2="6.8" y2="13.9" width="0.127" layer="51"/>
<wire x1="6.8" y1="13.9" x2="7.8" y2="13.9" width="0.127" layer="51"/>
<wire x1="7.8" y1="18.4" x2="7.8" y2="0" width="0.127" layer="21"/>
<wire x1="7.8" y1="0" x2="-7.8" y2="0" width="0.127" layer="21"/>
<wire x1="-6.6" y1="19.9" x2="6.6" y2="19.9" width="0.127" layer="21"/>
<wire x1="-7.8" y1="18.4" x2="-6.6" y2="19.9" width="0.127" layer="21"/>
<wire x1="7.8" y1="18.4" x2="6.6" y2="19.9" width="0.127" layer="21"/>
<circle x="0" y="14.9" radius="1.6" width="0.127" layer="21"/>
<wire x1="4.45" y1="0" x2="4.45" y2="-3" width="0.127" layer="51"/>
<wire x1="6.45" y1="0" x2="6.45" y2="-3" width="0.127" layer="51"/>
<wire x1="4.95" y1="-3.5" x2="4.95" y2="-5.5" width="0.127" layer="51"/>
<wire x1="5.95" y1="-3.5" x2="5.95" y2="-5.5" width="0.127" layer="51"/>
<wire x1="4.95" y1="-5.5" x2="5.95" y2="-5.5" width="0.127" layer="51"/>
<wire x1="4.95" y1="-3.5" x2="4.45" y2="-3" width="0.127" layer="51"/>
<wire x1="5.95" y1="-3.5" x2="6.45" y2="-3" width="0.127" layer="51"/>
<wire x1="-1.5" y1="0" x2="-1.5" y2="-3" width="0.127" layer="51"/>
<wire x1="1.5" y1="0" x2="1.5" y2="-3" width="0.127" layer="51"/>
<wire x1="-0.5" y1="-3.5" x2="-0.5" y2="-5.5" width="0.127" layer="51"/>
<wire x1="0.5" y1="-3.5" x2="0.5" y2="-5.5" width="0.127" layer="51"/>
<wire x1="-0.5" y1="-5.5" x2="0.5" y2="-5.5" width="0.127" layer="51"/>
<wire x1="-0.5" y1="-3.5" x2="-1.5" y2="-3" width="0.127" layer="51"/>
<wire x1="0.5" y1="-3.5" x2="1.5" y2="-3" width="0.127" layer="51"/>
<wire x1="-6.45" y1="0" x2="-6.45" y2="-3" width="0.127" layer="51"/>
<wire x1="-4.45" y1="0" x2="-4.45" y2="-3" width="0.127" layer="51"/>
<wire x1="-5.95" y1="-3.5" x2="-5.95" y2="-5.5" width="0.127" layer="51"/>
<wire x1="-4.95" y1="-3.5" x2="-4.95" y2="-5.5" width="0.127" layer="51"/>
<wire x1="-5.95" y1="-5.5" x2="-4.95" y2="-5.5" width="0.127" layer="51"/>
<wire x1="-5.95" y1="-3.5" x2="-6.45" y2="-3" width="0.127" layer="51"/>
<wire x1="-4.95" y1="-3.5" x2="-4.45" y2="-3" width="0.127" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="P-MOSFET">
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
<wire x1="0" y1="-2.54" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="1.27" y2="2.54" width="0.1524" layer="94"/>
<wire x1="0.508" y1="-0.508" x2="0.762" y2="-0.254" width="0.1524" layer="94"/>
<wire x1="0.762" y1="-0.254" x2="1.778" y2="-0.254" width="0.1524" layer="94"/>
<wire x1="1.778" y1="-0.254" x2="2.032" y2="0" width="0.1524" layer="94"/>
<wire x1="1.27" y1="2.54" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<circle x="0" y="-2.54" radius="0.3592" width="0" layer="94"/>
<circle x="0" y="2.54" radius="0.3592" width="0" layer="94"/>
<text x="2.54" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<text x="2.54" y="0" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="S" x="0" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="G" x="-5.08" y="-2.54" visible="pad" length="point" direction="pas"/>
<pin name="D" x="0" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="1.27" y="-0.254"/>
<vertex x="1.778" y="0.508"/>
<vertex x="0.762" y="0.508"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-0.254" y="0"/>
<vertex x="-1.27" y="0.762"/>
<vertex x="-1.27" y="-0.762"/>
</polygon>
</symbol>
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
<symbol name="N-IGBT">
<wire x1="2.54" y1="2.54" x2="0.508" y2="1.524" width="0.1524" layer="94"/>
<wire x1="1.778" y1="-1.524" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.778" y2="-1.524" width="0.1524" layer="94"/>
<wire x1="1.524" y1="-2.413" x2="2.286" y2="-2.413" width="0.254" layer="94"/>
<wire x1="2.286" y1="-2.413" x2="1.778" y2="-1.778" width="0.254" layer="94"/>
<wire x1="1.778" y1="-1.778" x2="1.524" y2="-2.286" width="0.254" layer="94"/>
<wire x1="1.524" y1="-2.286" x2="1.905" y2="-2.286" width="0.254" layer="94"/>
<wire x1="1.905" y1="-2.286" x2="1.778" y2="-2.032" width="0.254" layer="94"/>
<text x="5.08" y="0" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="5.08" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-2.54" x2="0" y2="2.54" layer="94"/>
<pin name="G" x="-2.54" y="0" visible="pad" length="point" direction="pas"/>
<pin name="E" x="2.54" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="C" x="2.54" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
<rectangle x1="0.254" y1="-2.54" x2="0.508" y2="2.54" layer="94"/>
<wire x1="-2.54" y1="0" x2="-0.254" y2="0" width="0.1524" layer="94"/>
<wire x1="3.81" y1="2.54" x2="3.81" y2="0.254" width="0.1524" layer="94"/>
<wire x1="3.81" y1="0.254" x2="3.81" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="3.81" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="4.572" y1="0.508" x2="4.318" y2="0.254" width="0.1524" layer="94"/>
<wire x1="4.318" y1="0.254" x2="3.81" y2="0.254" width="0.1524" layer="94"/>
<wire x1="3.81" y1="0.254" x2="3.302" y2="0.254" width="0.1524" layer="94"/>
<wire x1="3.302" y1="0.254" x2="3.048" y2="0" width="0.1524" layer="94"/>
<circle x="2.54" y="-2.54" radius="0.3592" width="0" layer="94"/>
<circle x="2.54" y="2.54" radius="0.3592" width="0" layer="94"/>
<polygon width="0.1524" layer="94">
<vertex x="3.81" y="0.254"/>
<vertex x="3.302" y="-0.508"/>
<vertex x="4.318" y="-0.508"/>
</polygon>
<wire x1="2.54" y1="2.54" x2="3.81" y2="2.54" width="0.1524" layer="94"/>
<wire x1="0.508" y1="-1.524" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MOS-P-*" prefix="Q" uservalue="yes">
<gates>
<gate name="G$1" symbol="P-MOSFET" x="0" y="0"/>
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
<device name="DPAK" package="DPAK-3">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
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
</devices>
</deviceset>
<deviceset name="IGBT-N" prefix="Q" uservalue="yes">
<gates>
<gate name="G$1" symbol="N-IGBT" x="0" y="0"/>
</gates>
<devices>
<device name="TO-3P" package="TO-3P">
<connects>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="3"/>
<connect gate="G$1" pin="G" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO-3P-RIGHT" package="TO-3P-RIGHT">
<connects>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="3"/>
<connect gate="G$1" pin="G" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-Molex">
<packages>
<package name="43045-0800">
<text x="-2.54" y="3.175" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="1.905" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<pad name="1" x="-4.5" y="-4.32" drill="1.1" diameter="1.7"/>
<pad name="2" x="-1.5" y="-4.32" drill="1.1" diameter="1.7"/>
<wire x1="-8.075" y1="4.6" x2="8.075" y2="4.6" width="0.127" layer="21"/>
<wire x1="-8.075" y1="-5.31" x2="-8.075" y2="4.6" width="0.127" layer="21"/>
<wire x1="8.075" y1="4.6" x2="8.075" y2="-5.31" width="0.127" layer="21"/>
<pad name="3" x="1.5" y="-4.32" drill="1.1" diameter="1.7"/>
<pad name="4" x="4.5" y="-4.32" drill="1.1" diameter="1.7"/>
<pad name="5" x="-4.5" y="-7.32" drill="1.1" diameter="1.7"/>
<pad name="6" x="-1.5" y="-7.32" drill="1.1" diameter="1.7"/>
<pad name="7" x="1.5" y="-7.32" drill="1.1" diameter="1.7"/>
<pad name="8" x="4.5" y="-7.32" drill="1.1" diameter="1.7"/>
<hole x="2.35" y="0" drill="3"/>
<hole x="-2.35" y="0" drill="3"/>
<rectangle x1="-4.82" y1="-7.64" x2="-4.18" y2="-5.31" layer="51"/>
<rectangle x1="-1.82" y1="-7.64" x2="-1.18" y2="-5.31" layer="51"/>
<rectangle x1="1.18" y1="-7.64" x2="1.82" y2="-5.31" layer="51"/>
<rectangle x1="4.18" y1="-7.64" x2="4.82" y2="-5.31" layer="51"/>
<wire x1="-8.075" y1="-5.31" x2="-4.725" y2="-5.31" width="0.127" layer="21"/>
<wire x1="-4.725" y1="-5.31" x2="-4.275" y2="-5.31" width="0.127" layer="51"/>
<wire x1="-4.275" y1="-5.31" x2="-1.725" y2="-5.31" width="0.127" layer="21"/>
<wire x1="-1.725" y1="-5.31" x2="-1.275" y2="-5.31" width="0.127" layer="51"/>
<wire x1="-1.275" y1="-5.31" x2="1.275" y2="-5.31" width="0.127" layer="21"/>
<wire x1="1.275" y1="-5.31" x2="1.725" y2="-5.31" width="0.127" layer="51"/>
<wire x1="4.275" y1="-5.31" x2="4.725" y2="-5.31" width="0.127" layer="51"/>
<wire x1="1.725" y1="-5.31" x2="4.275" y2="-5.31" width="0.127" layer="21"/>
<wire x1="4.725" y1="-5.31" x2="8.075" y2="-5.31" width="0.127" layer="21"/>
</package>
<package name="5569-02A2">
<text x="-2.54" y="3.175" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="1.905" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<pad name="1" x="0" y="-7.3" drill="1.8" diameter="2.4"/>
<pad name="2" x="0" y="-12.8" drill="1.8" diameter="2.4"/>
<wire x1="-2.7" y1="6.6" x2="2.7" y2="6.6" width="0.127" layer="21"/>
<wire x1="-2.7" y1="-6.2" x2="-1.05" y2="-6.2" width="0.127" layer="21"/>
<wire x1="-1.05" y1="-6.2" x2="1.05" y2="-6.2" width="0.127" layer="51"/>
<wire x1="1.05" y1="-6.2" x2="2.7" y2="-6.2" width="0.127" layer="21"/>
<wire x1="-2.7" y1="-6.2" x2="-2.7" y2="6.6" width="0.127" layer="21"/>
<wire x1="2.7" y1="6.6" x2="2.7" y2="-6.2" width="0.127" layer="21"/>
<rectangle x1="-0.5" y1="-12.8" x2="0.5" y2="-6.2" layer="51"/>
<circle x="0" y="-12.8" radius="0.25" width="0.5" layer="51"/>
<hole x="0" y="0" drill="3"/>
</package>
</packages>
<symbols>
<symbol name="PIN2X4">
<wire x1="-6.35" y1="-5.08" x2="3.81" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="7.62" width="0.4064" layer="94"/>
<wire x1="3.81" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-7.62" y="-2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="-7.62" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="3" x="-7.62" y="2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="4" x="-7.62" y="5.08" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="5" x="5.08" y="-2.54" visible="pad" length="middle" direction="pas" function="dot" rot="R180"/>
<pin name="6" x="5.08" y="0" visible="pad" length="middle" direction="pas" function="dot" rot="R180"/>
<pin name="7" x="5.08" y="2.54" visible="pad" length="middle" direction="pas" function="dot" rot="R180"/>
<pin name="8" x="5.08" y="5.08" visible="pad" length="middle" direction="pas" function="dot" rot="R180"/>
</symbol>
<symbol name="PIN1X2">
<wire x1="-1.27" y1="-5.08" x2="3.81" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="2.54" width="0.4064" layer="94"/>
<wire x1="3.81" y1="2.54" x2="-1.27" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="2.54" x2="-1.27" y2="-5.08" width="0.4064" layer="94"/>
<text x="-1.27" y="5.588" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-1.27" y="3.048" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-2.54" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="-2.54" visible="pad" length="middle" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="43045-0800" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="PIN2X4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="43045-0800">
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
<deviceset name="5569-02A2" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="PIN1X2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="5569-02A2">
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
<library name="Diode">
<packages>
<package name="DO-214AC">
<wire x1="-2.1209" y1="1.3335" x2="2.1209" y2="1.3335" width="0.127" layer="21"/>
<wire x1="-2.1209" y1="-1.3335" x2="2.1209" y2="-1.3335" width="0.127" layer="21"/>
<wire x1="-2.1209" y1="1.3335" x2="-2.1209" y2="1.0025" width="0.127" layer="21"/>
<wire x1="-2.1209" y1="-1.3335" x2="-2.1209" y2="-1.0025" width="0.127" layer="21"/>
<wire x1="-2.12" y1="1.0025" x2="-2.12" y2="-1.0025" width="0.127" layer="51"/>
<smd name="K" x="-2.3" y="0" dx="1.6" dy="1.6" layer="1"/>
<text x="-1.905" y="-2.54" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-0.508" y="-0.381" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-2.54" y1="-0.7239" x2="-2.12" y2="0.7239" layer="51"/>
<wire x1="2.1209" y1="-1.3335" x2="2.1209" y2="-1.0025" width="0.127" layer="21"/>
<wire x1="2.1209" y1="1.3335" x2="2.1209" y2="1.0025" width="0.127" layer="21"/>
<wire x1="2.12" y1="-1.0025" x2="2.12" y2="1.0025" width="0.127" layer="51"/>
<smd name="A" x="2.3" y="0" dx="1.6" dy="1.6" layer="1" rot="R180"/>
<rectangle x1="-1.143" y1="-1.3335" x2="-0.762" y2="1.3335" layer="21"/>
<rectangle x1="2.12" y1="-0.7239" x2="2.54" y2="0.7239" layer="51" rot="R180"/>
</package>
<package name="D2PAK-3">
<wire x1="-5.08" y1="9.017" x2="-5.08" y2="3" width="0.127" layer="51"/>
<wire x1="-5.08" y1="3" x2="-5.08" y2="0" width="0.127" layer="21"/>
<wire x1="5.08" y1="0" x2="5.08" y2="3" width="0.127" layer="21"/>
<wire x1="5.08" y1="3" x2="5.08" y2="9.017" width="0.127" layer="51"/>
<text x="-6.35" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="6.35" y="-1.27" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
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
</package>
<package name="DPAK-3">
<wire x1="-3.3" y1="6.1" x2="-3.3" y2="0" width="0.127" layer="21"/>
<wire x1="3.3" y1="0" x2="3.3" y2="6.1" width="0.127" layer="21"/>
<text x="-3.81" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="5.08" y="-1.27" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
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
</package>
<package name="SOD128">
<wire x1="-1.9" y1="1.2" x2="1.9" y2="1.2" width="0.127" layer="21"/>
<wire x1="1.9" y1="1.2" x2="1.9" y2="-1.2" width="0.127" layer="51"/>
<wire x1="-1.9" y1="-1.2" x2="1.9" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-1.9" y1="1.2" x2="-1.9" y2="-1.2" width="0.127" layer="51"/>
<smd name="K" x="-2.25" y="0" dx="1.2" dy="2" layer="1"/>
<smd name="A" x="2.25" y="0" dx="1.2" dy="2" layer="1"/>
<text x="-0.9" y="-0.4" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2" y="-2.5" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-1.4" y1="-1.2" x2="-1.0952" y2="1.2" layer="21"/>
<rectangle x1="-2.35" y1="-0.875" x2="-1.9" y2="0.875" layer="51"/>
<rectangle x1="1.9" y1="-0.875" x2="2.35" y2="0.875" layer="51" rot="R180"/>
</package>
<package name="SOD123">
<wire x1="-1.3" y1="0.8" x2="1.3" y2="0.8" width="0.127" layer="21"/>
<wire x1="-1.3" y1="-0.8" x2="1.3" y2="-0.8" width="0.127" layer="21"/>
<wire x1="-1.3" y1="0.8" x2="-1.3" y2="0.7" width="0.127" layer="21"/>
<wire x1="-1.3" y1="-0.8" x2="-1.3" y2="-0.7" width="0.127" layer="21"/>
<wire x1="1.3" y1="-0.8" x2="1.3" y2="-0.7" width="0.127" layer="21"/>
<wire x1="1.3" y1="0.8" x2="1.3" y2="0.7" width="0.127" layer="21"/>
<wire x1="-1.3" y1="0.7" x2="-1.3" y2="-0.7" width="0.127" layer="51"/>
<wire x1="1.3" y1="-0.7" x2="1.3" y2="0.7" width="0.127" layer="51"/>
<smd name="K" x="-1.65" y="0" dx="1.2" dy="1" layer="1"/>
<smd name="A" x="1.65" y="0" dx="1.2" dy="1" layer="1"/>
<text x="-0.4" y="-0.4" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2" y="-2" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.9" y1="-0.8" x2="-0.5952" y2="0.8" layer="21"/>
<rectangle x1="-1.75" y1="-0.45" x2="-1.3" y2="0.45" layer="51"/>
<rectangle x1="1.3" y1="-0.45" x2="1.75" y2="0.45" layer="51" rot="R180"/>
</package>
<package name="SOD323">
<wire x1="-0.85" y1="0.625" x2="0.85" y2="0.625" width="0.127" layer="21"/>
<wire x1="-0.85" y1="-0.625" x2="0.85" y2="-0.625" width="0.127" layer="21"/>
<wire x1="-0.85" y1="0.625" x2="-0.85" y2="0.5" width="0.127" layer="21"/>
<wire x1="-0.85" y1="-0.625" x2="-0.85" y2="-0.5" width="0.127" layer="21"/>
<wire x1="0.85" y1="-0.625" x2="0.85" y2="-0.5" width="0.127" layer="21"/>
<wire x1="0.85" y1="0.625" x2="0.85" y2="0.5" width="0.127" layer="21"/>
<wire x1="-0.85" y1="0.5" x2="-0.85" y2="-0.5" width="0.127" layer="51"/>
<wire x1="0.85" y1="-0.5" x2="0.85" y2="0.5" width="0.127" layer="51"/>
<smd name="K" x="-1.25" y="0" dx="0.8" dy="0.6" layer="1"/>
<smd name="A" x="1.25" y="0" dx="0.8" dy="0.6" layer="1"/>
<text x="-1.524" y="-1.651" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-0.254" y="-0.381" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.65" y1="-0.625" x2="-0.35" y2="0.625" layer="21"/>
<rectangle x1="-1.25" y1="-0.15" x2="-0.85" y2="0.15" layer="51"/>
<rectangle x1="0.85" y1="-0.15" x2="1.25" y2="0.15" layer="51" rot="R180"/>
</package>
<package name="SOD123W">
<wire x1="-1.3" y1="0.85" x2="1.3" y2="0.85" width="0.127" layer="21"/>
<wire x1="-1.3" y1="-0.85" x2="1.3" y2="-0.85" width="0.127" layer="21"/>
<wire x1="-1.3" y1="0.85" x2="-1.3" y2="0.7" width="0.127" layer="21"/>
<wire x1="-1.3" y1="-0.85" x2="-1.3" y2="-0.7" width="0.127" layer="21"/>
<wire x1="1.3" y1="-0.85" x2="1.3" y2="-0.7" width="0.127" layer="21"/>
<wire x1="1.3" y1="0.85" x2="1.3" y2="0.7" width="0.127" layer="21"/>
<wire x1="-1.3" y1="0.7" x2="-1.3" y2="-0.7" width="0.127" layer="51"/>
<wire x1="1.3" y1="-0.7" x2="1.3" y2="0.7" width="0.127" layer="51"/>
<smd name="K" x="-1.65" y="0" dx="1.2" dy="1" layer="1"/>
<smd name="A" x="1.65" y="0" dx="1.2" dy="1" layer="1"/>
<text x="-0.4" y="-0.4" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2" y="-2" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.9" y1="-0.8" x2="-0.5952" y2="0.8" layer="21"/>
<rectangle x1="-1.75" y1="-0.45" x2="-1.3" y2="0.45" layer="51"/>
<rectangle x1="1.3" y1="-0.45" x2="1.75" y2="0.45" layer="51" rot="R180"/>
</package>
<package name="TO-220F-2">
<text x="-6.35" y="7.62" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-6.35" y="6.35" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.3" diameter="1.9"/>
<pad name="3" x="2.54" y="0" drill="1.3" diameter="1.9"/>
<wire x1="-4.7" y1="-1.7" x2="4.7" y2="-1.7" width="0.127" layer="21"/>
<wire x1="-5.08" y1="3.01" x2="5.08" y2="3.01" width="0.127" layer="21"/>
<wire x1="5.08" y1="3.01" x2="5.08" y2="2.31" width="0.127" layer="21"/>
<wire x1="-5.08" y1="2.31" x2="-5.08" y2="3.01" width="0.127" layer="21"/>
<wire x1="-4.7" y1="-1.7" x2="-5.08" y2="2.31" width="0.127" layer="21"/>
<wire x1="4.7" y1="-1.7" x2="5.08" y2="2.31" width="0.127" layer="21"/>
<wire x1="-4.9" y1="0.47" x2="4.9" y2="0.47" width="0.127" layer="51"/>
<wire x1="-5.08" y1="2.31" x2="5.08" y2="2.31" width="0.127" layer="51"/>
</package>
<package name="DO-214AB">
<wire x1="-3.4275" y1="2.9525" x2="3.4275" y2="2.9525" width="0.127" layer="21"/>
<wire x1="-3.4275" y1="-2.9525" x2="3.4275" y2="-2.9525" width="0.127" layer="21"/>
<wire x1="-3.4275" y1="2.9525" x2="-3.4275" y2="1.8025" width="0.127" layer="21"/>
<wire x1="-3.4275" y1="-2.9525" x2="-3.4275" y2="-1.8025" width="0.127" layer="21"/>
<wire x1="-3.4275" y1="1.8025" x2="-3.4275" y2="-1.8025" width="0.127" layer="51"/>
<smd name="K" x="-3.55" y="0" dx="2.5" dy="3.2" layer="1"/>
<text x="-1.27" y="0" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.27" y="-1.27" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-3.97" y1="-1.525" x2="-3.4275" y2="1.525" layer="51"/>
<wire x1="3.4275" y1="-2.9525" x2="3.4275" y2="-1.8025" width="0.127" layer="21"/>
<wire x1="3.4275" y1="2.9525" x2="3.4275" y2="1.8025" width="0.127" layer="21"/>
<wire x1="3.4275" y1="-1.8025" x2="3.4275" y2="1.8025" width="0.127" layer="51"/>
<rectangle x1="-2" y1="-2.9525" x2="-1.6" y2="2.9525" layer="21"/>
<rectangle x1="3.4275" y1="-1.525" x2="3.97" y2="1.525" layer="51" rot="R180"/>
<smd name="A" x="3.55" y="0" dx="2.5" dy="3.2" layer="1"/>
</package>
<package name="DO-214AA">
<wire x1="-2.1575" y1="1.81" x2="2.1575" y2="1.81" width="0.127" layer="21"/>
<wire x1="-2.1575" y1="-1.81" x2="2.1575" y2="-1.81" width="0.127" layer="21"/>
<wire x1="-2.1575" y1="1.81" x2="-2.1575" y2="1.3025" width="0.127" layer="21"/>
<wire x1="-2.1575" y1="-1.81" x2="-2.1575" y2="-1.3025" width="0.127" layer="21"/>
<wire x1="-2.1575" y1="1.3025" x2="-2.1575" y2="-1.3025" width="0.127" layer="51"/>
<smd name="K" x="-2.1" y="0" dx="2" dy="2.2" layer="1"/>
<text x="-1.905" y="2.54" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.778" y="-2.921" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-2.625" y1="-1.0375" x2="-2.1575" y2="1.0375" layer="51"/>
<wire x1="2.1575" y1="-1.81" x2="2.1575" y2="-1.3025" width="0.127" layer="21"/>
<wire x1="2.1575" y1="1.81" x2="2.1575" y2="1.3025" width="0.127" layer="21"/>
<wire x1="2.1575" y1="-1.3025" x2="2.1575" y2="1.3025" width="0.127" layer="51"/>
<rectangle x1="-0.9" y1="-1.81" x2="-0.6" y2="1.81" layer="21"/>
<rectangle x1="2.1575" y1="-1.0375" x2="2.625" y2="1.0375" layer="51" rot="R180"/>
<smd name="A" x="2.1" y="0" dx="2" dy="2.2" layer="1"/>
</package>
<package name="1608">
<wire x1="1.35" y1="0.6" x2="1.35" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="-0.6" x2="-1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="0.6" x2="1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.35" y1="-0.6" x2="-1.35" y2="-0.6" width="0.127" layer="21"/>
<smd name="K" x="-0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<smd name="A" x="0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<text x="-1.397" y="0.762" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.397" y="-1.524" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4" y2="0.4" layer="51"/>
<rectangle x1="0.4" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="0.25" x2="0.4" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="-0.4" x2="0.4" y2="-0.25" layer="51"/>
<wire x1="0.2" y1="0" x2="-0.2" y2="0" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="0.2" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="-0.2" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="ZENER-DIODE">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.27" x2="0.889" y2="-1.651" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.651" y2="1.651" width="0.254" layer="94"/>
<text x="-2.54" y="1.905" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="-3.429" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="K" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="DIODE">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<text x="-2.54" y="1.905" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="-3.429" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="K" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="SCHOTTKY-DIODE">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.27" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.905" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.905" y1="1.27" x2="1.905" y2="0.889" width="0.254" layer="94"/>
<wire x1="0.635" y1="-0.889" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
<text x="-2.54" y="1.905" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="-3.429" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="K" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ZENER-*" prefix="D" uservalue="yes">
<gates>
<gate name="G$1" symbol="ZENER-DIODE" x="0" y="0"/>
</gates>
<devices>
<device name="DO-214AC" package="DO-214AC">
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
<deviceset name="DIODE-*" prefix="D" uservalue="yes">
<gates>
<gate name="G$1" symbol="DIODE" x="0" y="0"/>
</gates>
<devices>
<device name="D2PAK" package="D2PAK-3">
<connects>
<connect gate="G$1" pin="A" pad="1 3"/>
<connect gate="G$1" pin="K" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DPAK" package="DPAK-3">
<connects>
<connect gate="G$1" pin="A" pad="1 3"/>
<connect gate="G$1" pin="K" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VISHAY-D2PAK" package="D2PAK-3">
<connects>
<connect gate="G$1" pin="A" pad="3"/>
<connect gate="G$1" pin="K" pad="1 4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO-220F" package="TO-220F-2">
<connects>
<connect gate="G$1" pin="A" pad="3"/>
<connect gate="G$1" pin="K" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DO-214AB" package="DO-214AB">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DO-214AA" package="DO-214AA">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DO-214AC" package="DO-214AC">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1608" package="1608">
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
<deviceset name="SBD-*" prefix="D" uservalue="yes">
<gates>
<gate name="G$1" symbol="SCHOTTKY-DIODE" x="0" y="0"/>
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
<device name="SOD128" package="SOD128">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOD123" package="SOD123">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOD323" package="SOD323">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SDO123W" package="SOD123W">
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
<library name="ic-ATMEL">
<description>ATMEL</description>
<packages>
<package name="QFP44-0.8">
<wire x1="-4.7" y1="-5" x2="4.7" y2="-5" width="0.127" layer="21"/>
<wire x1="5" y1="-4.7" x2="5" y2="4.7" width="0.127" layer="21"/>
<wire x1="4.7" y1="5" x2="-4.7" y2="5" width="0.127" layer="21"/>
<wire x1="-4.7" y1="5" x2="-5" y2="4.7" width="0.127" layer="21"/>
<wire x1="-5" y1="4.7" x2="-5" y2="-4.7" width="0.127" layer="21"/>
<wire x1="-5" y1="-4.7" x2="-4.7" y2="-5" width="0.127" layer="21"/>
<wire x1="4.7" y1="-5" x2="5" y2="-4.7" width="0.127" layer="21"/>
<wire x1="5" y1="4.7" x2="4.7" y2="5" width="0.127" layer="21"/>
<circle x="-4.2" y="4.2" radius="0.2499" width="0.127" layer="21"/>
<smd name="1" x="-5.95" y="4" dx="1.6" dy="0.45" layer="1"/>
<smd name="2" x="-5.95" y="3.2" dx="1.6" dy="0.45" layer="1"/>
<smd name="3" x="-5.95" y="2.4" dx="1.6" dy="0.45" layer="1"/>
<smd name="4" x="-5.95" y="1.6" dx="1.6" dy="0.45" layer="1"/>
<smd name="5" x="-5.95" y="0.8" dx="1.6" dy="0.45" layer="1"/>
<smd name="6" x="-5.95" y="0" dx="1.6" dy="0.45" layer="1"/>
<smd name="7" x="-5.95" y="-0.8" dx="1.6" dy="0.45" layer="1"/>
<smd name="8" x="-5.95" y="-1.6" dx="1.6" dy="0.45" layer="1"/>
<smd name="12" x="-4" y="-5.95" dx="1.6" dy="0.45" layer="1" rot="R90"/>
<smd name="23" x="5.95" y="-4" dx="1.6" dy="0.45" layer="1" rot="R180"/>
<smd name="34" x="4" y="5.95" dx="1.6" dy="0.45" layer="1" rot="R270"/>
<smd name="9" x="-5.95" y="-2.4" dx="1.6" dy="0.45" layer="1"/>
<smd name="10" x="-5.95" y="-3.2" dx="1.6" dy="0.45" layer="1"/>
<smd name="11" x="-5.95" y="-4" dx="1.6" dy="0.45" layer="1"/>
<smd name="13" x="-3.2" y="-5.95" dx="1.6" dy="0.45" layer="1" rot="R90"/>
<smd name="14" x="-2.4" y="-5.95" dx="1.6" dy="0.45" layer="1" rot="R90"/>
<smd name="15" x="-1.6" y="-5.95" dx="1.6" dy="0.45" layer="1" rot="R90"/>
<smd name="16" x="-0.8" y="-5.95" dx="1.6" dy="0.45" layer="1" rot="R90"/>
<smd name="17" x="0" y="-5.95" dx="1.6" dy="0.45" layer="1" rot="R90"/>
<smd name="18" x="0.8" y="-5.95" dx="1.6" dy="0.45" layer="1" rot="R90"/>
<smd name="19" x="1.6" y="-5.95" dx="1.6" dy="0.45" layer="1" rot="R90"/>
<smd name="20" x="2.4" y="-5.95" dx="1.6" dy="0.45" layer="1" rot="R90"/>
<smd name="21" x="3.2" y="-5.95" dx="1.6" dy="0.45" layer="1" rot="R90"/>
<smd name="22" x="4" y="-5.95" dx="1.6" dy="0.45" layer="1" rot="R90"/>
<smd name="24" x="5.95" y="-3.2" dx="1.6" dy="0.45" layer="1" rot="R180"/>
<smd name="25" x="5.95" y="-2.4" dx="1.6" dy="0.45" layer="1" rot="R180"/>
<smd name="26" x="5.95" y="-1.6" dx="1.6" dy="0.45" layer="1" rot="R180"/>
<smd name="27" x="5.95" y="-0.8" dx="1.6" dy="0.45" layer="1" rot="R180"/>
<smd name="28" x="5.95" y="0" dx="1.6" dy="0.45" layer="1" rot="R180"/>
<smd name="29" x="5.95" y="0.8" dx="1.6" dy="0.45" layer="1" rot="R180"/>
<smd name="30" x="5.95" y="1.6" dx="1.6" dy="0.45" layer="1" rot="R180"/>
<smd name="31" x="5.95" y="2.4" dx="1.6" dy="0.45" layer="1" rot="R180"/>
<smd name="32" x="5.95" y="3.2" dx="1.6" dy="0.45" layer="1" rot="R180"/>
<smd name="33" x="5.95" y="4" dx="1.6" dy="0.45" layer="1" rot="R180"/>
<smd name="35" x="3.2" y="5.95" dx="1.6" dy="0.45" layer="1" rot="R270"/>
<smd name="36" x="2.4" y="5.95" dx="1.6" dy="0.45" layer="1" rot="R270"/>
<smd name="37" x="1.6" y="5.95" dx="1.6" dy="0.45" layer="1" rot="R270"/>
<smd name="38" x="0.8" y="5.95" dx="1.6" dy="0.45" layer="1" rot="R270"/>
<smd name="39" x="0" y="5.95" dx="1.6" dy="0.45" layer="1" rot="R270"/>
<smd name="40" x="-0.8" y="5.95" dx="1.6" dy="0.45" layer="1" rot="R270"/>
<smd name="41" x="-1.6" y="5.95" dx="1.6" dy="0.45" layer="1" rot="R270"/>
<smd name="42" x="-2.4" y="5.95" dx="1.6" dy="0.45" layer="1" rot="R270"/>
<smd name="43" x="-3.2" y="5.95" dx="1.6" dy="0.45" layer="1" rot="R270"/>
<smd name="44" x="-4" y="5.95" dx="1.6" dy="0.45" layer="1" rot="R270"/>
<text x="-3.81" y="0" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-3.81" y="-1.27" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-6" y1="3.815" x2="-5" y2="4.185" layer="51"/>
<rectangle x1="-6" y1="3.015" x2="-5" y2="3.385" layer="51"/>
<rectangle x1="-6" y1="2.215" x2="-5" y2="2.585" layer="51"/>
<rectangle x1="-6" y1="1.415" x2="-5" y2="1.785" layer="51"/>
<rectangle x1="-6" y1="0.615" x2="-5" y2="0.985" layer="51"/>
<rectangle x1="-6" y1="-0.185" x2="-5" y2="0.185" layer="51"/>
<rectangle x1="-6" y1="-0.985" x2="-5" y2="-0.615" layer="51"/>
<rectangle x1="-6" y1="-1.785" x2="-5" y2="-1.415" layer="51"/>
<rectangle x1="-6" y1="-2.585" x2="-5" y2="-2.215" layer="51"/>
<rectangle x1="-6" y1="-3.385" x2="-5" y2="-3.015" layer="51"/>
<rectangle x1="-6" y1="-4.185" x2="-5" y2="-3.815" layer="51"/>
<rectangle x1="-4.5" y1="-5.685" x2="-3.5" y2="-5.315" layer="51" rot="R90"/>
<rectangle x1="-3.7" y1="-5.685" x2="-2.7" y2="-5.315" layer="51" rot="R90"/>
<rectangle x1="-2.9" y1="-5.685" x2="-1.9" y2="-5.315" layer="51" rot="R90"/>
<rectangle x1="-2.1" y1="-5.685" x2="-1.1" y2="-5.315" layer="51" rot="R90"/>
<rectangle x1="-1.3" y1="-5.685" x2="-0.3" y2="-5.315" layer="51" rot="R90"/>
<rectangle x1="-0.5" y1="-5.685" x2="0.5" y2="-5.315" layer="51" rot="R90"/>
<rectangle x1="0.3" y1="-5.685" x2="1.3" y2="-5.315" layer="51" rot="R90"/>
<rectangle x1="1.1" y1="-5.685" x2="2.1" y2="-5.315" layer="51" rot="R90"/>
<rectangle x1="1.9" y1="-5.685" x2="2.9" y2="-5.315" layer="51" rot="R90"/>
<rectangle x1="2.7" y1="-5.685" x2="3.7" y2="-5.315" layer="51" rot="R90"/>
<rectangle x1="3.5" y1="-5.685" x2="4.5" y2="-5.315" layer="51" rot="R90"/>
<rectangle x1="5" y1="-4.185" x2="6" y2="-3.815" layer="51" rot="R180"/>
<rectangle x1="5" y1="-3.385" x2="6" y2="-3.015" layer="51" rot="R180"/>
<rectangle x1="5" y1="-2.585" x2="6" y2="-2.215" layer="51" rot="R180"/>
<rectangle x1="5" y1="-1.785" x2="6" y2="-1.415" layer="51" rot="R180"/>
<rectangle x1="5" y1="-0.985" x2="6" y2="-0.615" layer="51" rot="R180"/>
<rectangle x1="5" y1="-0.185" x2="6" y2="0.185" layer="51" rot="R180"/>
<rectangle x1="5" y1="0.615" x2="6" y2="0.985" layer="51" rot="R180"/>
<rectangle x1="5" y1="1.415" x2="6" y2="1.785" layer="51" rot="R180"/>
<rectangle x1="5" y1="2.215" x2="6" y2="2.585" layer="51" rot="R180"/>
<rectangle x1="5" y1="3.015" x2="6" y2="3.385" layer="51" rot="R180"/>
<rectangle x1="5" y1="3.815" x2="6" y2="4.185" layer="51" rot="R180"/>
<rectangle x1="3.5" y1="5.315" x2="4.5" y2="5.685" layer="51" rot="R270"/>
<rectangle x1="2.7" y1="5.315" x2="3.7" y2="5.685" layer="51" rot="R270"/>
<rectangle x1="1.9" y1="5.315" x2="2.9" y2="5.685" layer="51" rot="R270"/>
<rectangle x1="1.1" y1="5.315" x2="2.1" y2="5.685" layer="51" rot="R270"/>
<rectangle x1="0.3" y1="5.315" x2="1.3" y2="5.685" layer="51" rot="R270"/>
<rectangle x1="-0.5" y1="5.315" x2="0.5" y2="5.685" layer="51" rot="R270"/>
<rectangle x1="-1.3" y1="5.315" x2="-0.3" y2="5.685" layer="51" rot="R270"/>
<rectangle x1="-2.1" y1="5.315" x2="-1.1" y2="5.685" layer="51" rot="R270"/>
<rectangle x1="-2.9" y1="5.315" x2="-1.9" y2="5.685" layer="51" rot="R270"/>
<rectangle x1="-3.7" y1="5.315" x2="-2.7" y2="5.685" layer="51" rot="R270"/>
<rectangle x1="-4.5" y1="5.315" x2="-3.5" y2="5.685" layer="51" rot="R270"/>
</package>
<package name="QFN44-0.5">
<wire x1="-2.4" y1="2.6" x2="2.4" y2="2.6" width="0.127" layer="21"/>
<wire x1="2.6" y1="2.4" x2="2.6" y2="-2.4" width="0.127" layer="21"/>
<wire x1="2.4" y1="-2.6" x2="-2.4" y2="-2.6" width="0.127" layer="21"/>
<wire x1="-2.6" y1="-2.4" x2="-2.6" y2="2.4" width="0.127" layer="21"/>
<wire x1="-2.6" y1="2.4" x2="-2.4" y2="2.6" width="0.127" layer="21"/>
<wire x1="2.4" y1="2.6" x2="2.6" y2="2.4" width="0.127" layer="21"/>
<wire x1="2.4" y1="-2.6" x2="2.6" y2="-2.4" width="0.127" layer="21"/>
<wire x1="-2.4" y1="-2.6" x2="-2.6" y2="-2.4" width="0.127" layer="21"/>
<wire x1="-3.5" y1="3.5" x2="3.5" y2="3.5" width="0.127" layer="51"/>
<wire x1="3.5" y1="3.5" x2="3.5" y2="-3.5" width="0.127" layer="51"/>
<wire x1="3.5" y1="-3.5" x2="-3.5" y2="-3.5" width="0.127" layer="51"/>
<wire x1="-3.5" y1="-3.5" x2="-3.5" y2="3.5" width="0.127" layer="51"/>
<circle x="-2" y="2" radius="0.2" width="0.127" layer="21"/>
<smd name="1" x="-3.65" y="2.5" dx="1.6" dy="0.25" layer="1"/>
<smd name="2" x="-3.65" y="2" dx="1.6" dy="0.25" layer="1"/>
<smd name="3" x="-3.65" y="1.5" dx="1.6" dy="0.25" layer="1"/>
<smd name="4" x="-3.65" y="1" dx="1.6" dy="0.25" layer="1"/>
<smd name="5" x="-3.65" y="0.5" dx="1.6" dy="0.25" layer="1"/>
<smd name="6" x="-3.65" y="0" dx="1.6" dy="0.25" layer="1"/>
<smd name="7" x="-3.65" y="-0.5" dx="1.6" dy="0.25" layer="1"/>
<smd name="8" x="-3.65" y="-1" dx="1.6" dy="0.25" layer="1"/>
<smd name="9" x="-3.65" y="-1.5" dx="1.6" dy="0.25" layer="1"/>
<smd name="10" x="-3.65" y="-2" dx="1.6" dy="0.25" layer="1"/>
<smd name="11" x="-3.65" y="-2.5" dx="1.6" dy="0.25" layer="1"/>
<smd name="12" x="-2.5" y="-3.65" dx="1.6" dy="0.25" layer="1" rot="R90"/>
<smd name="13" x="-2" y="-3.65" dx="1.6" dy="0.25" layer="1" rot="R90"/>
<smd name="14" x="-1.5" y="-3.65" dx="1.6" dy="0.25" layer="1" rot="R90"/>
<smd name="15" x="-1" y="-3.65" dx="1.6" dy="0.25" layer="1" rot="R90"/>
<smd name="16" x="-0.5" y="-3.65" dx="1.6" dy="0.25" layer="1" rot="R90"/>
<smd name="17" x="0" y="-3.65" dx="1.6" dy="0.25" layer="1" rot="R90"/>
<smd name="18" x="0.5" y="-3.65" dx="1.6" dy="0.25" layer="1" rot="R90"/>
<smd name="19" x="1" y="-3.65" dx="1.6" dy="0.25" layer="1" rot="R90"/>
<smd name="20" x="1.5" y="-3.65" dx="1.6" dy="0.25" layer="1" rot="R90"/>
<smd name="21" x="2" y="-3.65" dx="1.6" dy="0.25" layer="1" rot="R90"/>
<smd name="22" x="2.5" y="-3.65" dx="1.6" dy="0.25" layer="1" rot="R90"/>
<smd name="23" x="3.65" y="-2.5" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="24" x="3.65" y="-2" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="25" x="3.65" y="-1.5" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="26" x="3.65" y="-1" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="27" x="3.65" y="-0.5" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="28" x="3.65" y="0" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="29" x="3.65" y="0.5" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="30" x="3.65" y="1" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="31" x="3.65" y="1.5" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="32" x="3.65" y="2" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="33" x="3.65" y="2.5" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="34" x="2.5" y="3.65" dx="1.6" dy="0.25" layer="1" rot="R270"/>
<smd name="35" x="2" y="3.65" dx="1.6" dy="0.25" layer="1" rot="R270"/>
<smd name="36" x="1.5" y="3.65" dx="1.6" dy="0.25" layer="1" rot="R270"/>
<smd name="37" x="1" y="3.65" dx="1.6" dy="0.25" layer="1" rot="R270"/>
<smd name="38" x="0.5" y="3.65" dx="1.6" dy="0.25" layer="1" rot="R270"/>
<smd name="39" x="0" y="3.65" dx="1.6" dy="0.25" layer="1" rot="R270"/>
<smd name="40" x="-0.5" y="3.65" dx="1.6" dy="0.25" layer="1" rot="R270"/>
<smd name="41" x="-1" y="3.65" dx="1.6" dy="0.25" layer="1" rot="R270"/>
<smd name="42" x="-1.5" y="3.65" dx="1.6" dy="0.25" layer="1" rot="R270"/>
<smd name="43" x="-2" y="3.65" dx="1.6" dy="0.25" layer="1" rot="R270"/>
<smd name="44" x="-2.5" y="3.65" dx="1.6" dy="0.25" layer="1" rot="R270"/>
<text x="-1.905" y="0" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.905" y="-1.27" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-3.5" y1="2.38" x2="-2.85" y2="2.62" layer="51"/>
<rectangle x1="-3.5" y1="1.88" x2="-2.85" y2="2.12" layer="51"/>
<rectangle x1="-3.5" y1="1.38" x2="-2.85" y2="1.62" layer="51"/>
<rectangle x1="-3.5" y1="0.88" x2="-2.85" y2="1.12" layer="51"/>
<rectangle x1="-3.5" y1="0.38" x2="-2.85" y2="0.62" layer="51"/>
<rectangle x1="-3.5" y1="-0.12" x2="-2.85" y2="0.12" layer="51"/>
<rectangle x1="-3.5" y1="-0.62" x2="-2.85" y2="-0.38" layer="51"/>
<rectangle x1="-3.5" y1="-1.12" x2="-2.85" y2="-0.88" layer="51"/>
<rectangle x1="-3.5" y1="-1.62" x2="-2.85" y2="-1.38" layer="51"/>
<rectangle x1="-3.5" y1="-2.12" x2="-2.85" y2="-1.88" layer="51"/>
<rectangle x1="-3.5" y1="-2.62" x2="-2.85" y2="-2.38" layer="51"/>
<rectangle x1="-2.825" y1="-3.295" x2="-2.175" y2="-3.055" layer="51" rot="R90"/>
<rectangle x1="-2.325" y1="-3.295" x2="-1.675" y2="-3.055" layer="51" rot="R90"/>
<rectangle x1="-1.825" y1="-3.295" x2="-1.175" y2="-3.055" layer="51" rot="R90"/>
<rectangle x1="-1.325" y1="-3.295" x2="-0.675" y2="-3.055" layer="51" rot="R90"/>
<rectangle x1="-0.825" y1="-3.295" x2="-0.175" y2="-3.055" layer="51" rot="R90"/>
<rectangle x1="-0.325" y1="-3.295" x2="0.325" y2="-3.055" layer="51" rot="R90"/>
<rectangle x1="0.175" y1="-3.295" x2="0.825" y2="-3.055" layer="51" rot="R90"/>
<rectangle x1="0.675" y1="-3.295" x2="1.325" y2="-3.055" layer="51" rot="R90"/>
<rectangle x1="1.175" y1="-3.295" x2="1.825" y2="-3.055" layer="51" rot="R90"/>
<rectangle x1="1.675" y1="-3.295" x2="2.325" y2="-3.055" layer="51" rot="R90"/>
<rectangle x1="2.175" y1="-3.295" x2="2.825" y2="-3.055" layer="51" rot="R90"/>
<rectangle x1="2.85" y1="-2.62" x2="3.5" y2="-2.38" layer="51" rot="R180"/>
<rectangle x1="2.85" y1="-2.12" x2="3.5" y2="-1.88" layer="51" rot="R180"/>
<rectangle x1="2.85" y1="-1.62" x2="3.5" y2="-1.38" layer="51" rot="R180"/>
<rectangle x1="2.85" y1="-1.12" x2="3.5" y2="-0.88" layer="51" rot="R180"/>
<rectangle x1="2.85" y1="-0.62" x2="3.5" y2="-0.38" layer="51" rot="R180"/>
<rectangle x1="2.85" y1="-0.12" x2="3.5" y2="0.12" layer="51" rot="R180"/>
<rectangle x1="2.85" y1="0.38" x2="3.5" y2="0.62" layer="51" rot="R180"/>
<rectangle x1="2.85" y1="0.88" x2="3.5" y2="1.12" layer="51" rot="R180"/>
<rectangle x1="2.85" y1="1.38" x2="3.5" y2="1.62" layer="51" rot="R180"/>
<rectangle x1="2.85" y1="1.88" x2="3.5" y2="2.12" layer="51" rot="R180"/>
<rectangle x1="2.85" y1="2.38" x2="3.5" y2="2.62" layer="51" rot="R180"/>
<rectangle x1="2.175" y1="3.055" x2="2.825" y2="3.295" layer="51" rot="R270"/>
<rectangle x1="1.675" y1="3.055" x2="2.325" y2="3.295" layer="51" rot="R270"/>
<rectangle x1="1.175" y1="3.055" x2="1.825" y2="3.295" layer="51" rot="R270"/>
<rectangle x1="0.675" y1="3.055" x2="1.325" y2="3.295" layer="51" rot="R270"/>
<rectangle x1="0.175" y1="3.055" x2="0.825" y2="3.295" layer="51" rot="R270"/>
<rectangle x1="-0.325" y1="3.055" x2="0.325" y2="3.295" layer="51" rot="R270"/>
<rectangle x1="-0.825" y1="3.055" x2="-0.175" y2="3.295" layer="51" rot="R270"/>
<rectangle x1="-1.325" y1="3.055" x2="-0.675" y2="3.295" layer="51" rot="R270"/>
<rectangle x1="-1.825" y1="3.055" x2="-1.175" y2="3.295" layer="51" rot="R270"/>
<rectangle x1="-2.325" y1="3.055" x2="-1.675" y2="3.295" layer="51" rot="R270"/>
<rectangle x1="-2.825" y1="3.055" x2="-2.175" y2="3.295" layer="51" rot="R270"/>
</package>
</packages>
<symbols>
<symbol name="ATXMEGAA4U">
<wire x1="-25.4" y1="40.64" x2="25.4" y2="40.64" width="0.254" layer="94"/>
<wire x1="25.4" y1="40.64" x2="25.4" y2="-40.64" width="0.254" layer="94"/>
<wire x1="25.4" y1="-40.64" x2="-25.4" y2="-40.64" width="0.254" layer="94"/>
<wire x1="-25.4" y1="-40.64" x2="-25.4" y2="40.64" width="0.254" layer="94"/>
<text x="-25.4" y="41.148" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-25.4" y="-43.18" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="!RESET!/PDI_CLK" x="-27.94" y="38.1" length="short"/>
<pin name="PDI_DATA" x="-27.94" y="35.56" length="short"/>
<pin name="AVCC" x="-27.94" y="25.4" length="short"/>
<pin name="GND" x="-27.94" y="-5.08" length="short"/>
<pin name="VCC" x="-27.94" y="7.62" length="short"/>
<pin name="PR1/XTAL1" x="-27.94" y="-12.7" length="short"/>
<pin name="PR0/XTAL2" x="-27.94" y="-20.32" length="short"/>
<pin name="PA0/AREF/ADC0" x="27.94" y="38.1" length="short" rot="R180"/>
<pin name="PA1/ADC1" x="27.94" y="35.56" length="short" rot="R180"/>
<pin name="PA2/ADC2" x="27.94" y="33.02" length="short" rot="R180"/>
<pin name="PA3/ADC3" x="27.94" y="30.48" length="short" rot="R180"/>
<pin name="PA4/ADC4" x="27.94" y="27.94" length="short" rot="R180"/>
<pin name="PA5/ADC5" x="27.94" y="25.4" length="short" rot="R180"/>
<pin name="PA6/ADC6" x="27.94" y="22.86" length="short" rot="R180"/>
<pin name="PA7/ADC7" x="27.94" y="20.32" length="short" rot="R180"/>
<pin name="PB0/AREF/ADC8" x="27.94" y="15.24" length="short" rot="R180"/>
<pin name="PB1/ADC9" x="27.94" y="12.7" length="short" rot="R180"/>
<pin name="PB2/ADC10/DAC0" x="27.94" y="10.16" length="short" rot="R180"/>
<pin name="PB3/ADC11/DAC1" x="27.94" y="7.62" length="short" rot="R180"/>
<pin name="PC0/OC0A/SDA" x="27.94" y="2.54" length="short" rot="R180"/>
<pin name="PC1/OC0B/XCK0/SCL" x="27.94" y="0" length="short" rot="R180"/>
<pin name="PC2/OC0C/RXD0" x="27.94" y="-2.54" length="short" rot="R180"/>
<pin name="PC3/OC0D/TXD0" x="27.94" y="-5.08" length="short" rot="R180"/>
<pin name="PC4/OC1A/!SS" x="27.94" y="-7.62" length="short" rot="R180"/>
<pin name="PC5/OC1B/MOSI/XCK1" x="27.94" y="-10.16" length="short" rot="R180"/>
<pin name="PC6/CLKRTC/MISO/RXD1" x="27.94" y="-12.7" length="short" rot="R180"/>
<pin name="PC7/CLKPER/SCK/TXD1" x="27.94" y="-15.24" length="short" rot="R180"/>
<pin name="PD0/OC0A" x="27.94" y="-20.32" length="short" rot="R180"/>
<pin name="PD1/OC0B/XCK0" x="27.94" y="-22.86" length="short" rot="R180"/>
<pin name="PD2/OC0C/RXD0" x="27.94" y="-25.4" length="short" rot="R180"/>
<pin name="PD3/OC0D/TXD0" x="27.94" y="-27.94" length="short" rot="R180"/>
<pin name="PD4/OC1A/!SS" x="27.94" y="-30.48" length="short" rot="R180"/>
<pin name="PD5/OC1B/MOSI/XCK1" x="27.94" y="-33.02" length="short" rot="R180"/>
<pin name="PD6/MISO/RXD1/D-" x="27.94" y="-35.56" length="short" rot="R180"/>
<pin name="PD7/CLKPER/SCK/TXD1/D+" x="27.94" y="-38.1" length="short" rot="R180"/>
<pin name="PE0/OC0A/SDA" x="-27.94" y="-30.48" length="short"/>
<pin name="PE1/OC0B/XCK0/SCL" x="-27.94" y="-33.02" length="short"/>
<pin name="PE2/OC0C/RXD0" x="-27.94" y="-35.56" length="short"/>
<pin name="PE3/OC0D/TXD0" x="-27.94" y="-38.1" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ATXMEGA*A4U" prefix="U">
<gates>
<gate name="G$1" symbol="ATXMEGAA4U" x="0" y="0"/>
</gates>
<devices>
<device name="-AU" package="QFP44-0.8">
<connects>
<connect gate="G$1" pin="!RESET!/PDI_CLK" pad="35"/>
<connect gate="G$1" pin="AVCC" pad="39"/>
<connect gate="G$1" pin="GND" pad="8 18 30 38"/>
<connect gate="G$1" pin="PA0/AREF/ADC0" pad="40"/>
<connect gate="G$1" pin="PA1/ADC1" pad="41"/>
<connect gate="G$1" pin="PA2/ADC2" pad="42"/>
<connect gate="G$1" pin="PA3/ADC3" pad="43"/>
<connect gate="G$1" pin="PA4/ADC4" pad="44"/>
<connect gate="G$1" pin="PA5/ADC5" pad="1"/>
<connect gate="G$1" pin="PA6/ADC6" pad="2"/>
<connect gate="G$1" pin="PA7/ADC7" pad="3"/>
<connect gate="G$1" pin="PB0/AREF/ADC8" pad="4"/>
<connect gate="G$1" pin="PB1/ADC9" pad="5"/>
<connect gate="G$1" pin="PB2/ADC10/DAC0" pad="6"/>
<connect gate="G$1" pin="PB3/ADC11/DAC1" pad="7"/>
<connect gate="G$1" pin="PC0/OC0A/SDA" pad="10"/>
<connect gate="G$1" pin="PC1/OC0B/XCK0/SCL" pad="11"/>
<connect gate="G$1" pin="PC2/OC0C/RXD0" pad="12"/>
<connect gate="G$1" pin="PC3/OC0D/TXD0" pad="13"/>
<connect gate="G$1" pin="PC4/OC1A/!SS" pad="14"/>
<connect gate="G$1" pin="PC5/OC1B/MOSI/XCK1" pad="15"/>
<connect gate="G$1" pin="PC6/CLKRTC/MISO/RXD1" pad="16"/>
<connect gate="G$1" pin="PC7/CLKPER/SCK/TXD1" pad="17"/>
<connect gate="G$1" pin="PD0/OC0A" pad="20"/>
<connect gate="G$1" pin="PD1/OC0B/XCK0" pad="21"/>
<connect gate="G$1" pin="PD2/OC0C/RXD0" pad="22"/>
<connect gate="G$1" pin="PD3/OC0D/TXD0" pad="23"/>
<connect gate="G$1" pin="PD4/OC1A/!SS" pad="24"/>
<connect gate="G$1" pin="PD5/OC1B/MOSI/XCK1" pad="25"/>
<connect gate="G$1" pin="PD6/MISO/RXD1/D-" pad="26"/>
<connect gate="G$1" pin="PD7/CLKPER/SCK/TXD1/D+" pad="27"/>
<connect gate="G$1" pin="PDI_DATA" pad="34"/>
<connect gate="G$1" pin="PE0/OC0A/SDA" pad="28"/>
<connect gate="G$1" pin="PE1/OC0B/XCK0/SCL" pad="29"/>
<connect gate="G$1" pin="PE2/OC0C/RXD0" pad="32"/>
<connect gate="G$1" pin="PE3/OC0D/TXD0" pad="33"/>
<connect gate="G$1" pin="PR0/XTAL2" pad="36"/>
<connect gate="G$1" pin="PR1/XTAL1" pad="37"/>
<connect gate="G$1" pin="VCC" pad="9 19 31"/>
</connects>
<technologies>
<technology name="128"/>
<technology name="16"/>
<technology name="32"/>
<technology name="64"/>
</technologies>
</device>
<device name="-MH" package="QFN44-0.5">
<connects>
<connect gate="G$1" pin="!RESET!/PDI_CLK" pad="35"/>
<connect gate="G$1" pin="AVCC" pad="39"/>
<connect gate="G$1" pin="GND" pad="8 18 30 38"/>
<connect gate="G$1" pin="PA0/AREF/ADC0" pad="40"/>
<connect gate="G$1" pin="PA1/ADC1" pad="41"/>
<connect gate="G$1" pin="PA2/ADC2" pad="42"/>
<connect gate="G$1" pin="PA3/ADC3" pad="43"/>
<connect gate="G$1" pin="PA4/ADC4" pad="44"/>
<connect gate="G$1" pin="PA5/ADC5" pad="1"/>
<connect gate="G$1" pin="PA6/ADC6" pad="2"/>
<connect gate="G$1" pin="PA7/ADC7" pad="3"/>
<connect gate="G$1" pin="PB0/AREF/ADC8" pad="4"/>
<connect gate="G$1" pin="PB1/ADC9" pad="5"/>
<connect gate="G$1" pin="PB2/ADC10/DAC0" pad="6"/>
<connect gate="G$1" pin="PB3/ADC11/DAC1" pad="7"/>
<connect gate="G$1" pin="PC0/OC0A/SDA" pad="10"/>
<connect gate="G$1" pin="PC1/OC0B/XCK0/SCL" pad="11"/>
<connect gate="G$1" pin="PC2/OC0C/RXD0" pad="12"/>
<connect gate="G$1" pin="PC3/OC0D/TXD0" pad="13"/>
<connect gate="G$1" pin="PC4/OC1A/!SS" pad="14"/>
<connect gate="G$1" pin="PC5/OC1B/MOSI/XCK1" pad="15"/>
<connect gate="G$1" pin="PC6/CLKRTC/MISO/RXD1" pad="16"/>
<connect gate="G$1" pin="PC7/CLKPER/SCK/TXD1" pad="17"/>
<connect gate="G$1" pin="PD0/OC0A" pad="20"/>
<connect gate="G$1" pin="PD1/OC0B/XCK0" pad="21"/>
<connect gate="G$1" pin="PD2/OC0C/RXD0" pad="22"/>
<connect gate="G$1" pin="PD3/OC0D/TXD0" pad="23"/>
<connect gate="G$1" pin="PD4/OC1A/!SS" pad="24"/>
<connect gate="G$1" pin="PD5/OC1B/MOSI/XCK1" pad="25"/>
<connect gate="G$1" pin="PD6/MISO/RXD1/D-" pad="26"/>
<connect gate="G$1" pin="PD7/CLKPER/SCK/TXD1/D+" pad="27"/>
<connect gate="G$1" pin="PDI_DATA" pad="34"/>
<connect gate="G$1" pin="PE0/OC0A/SDA" pad="28"/>
<connect gate="G$1" pin="PE1/OC0B/XCK0/SCL" pad="29"/>
<connect gate="G$1" pin="PE2/OC0C/RXD0" pad="32"/>
<connect gate="G$1" pin="PE3/OC0D/TXD0" pad="33"/>
<connect gate="G$1" pin="PR0/XTAL2" pad="36"/>
<connect gate="G$1" pin="PR1/XTAL1" pad="37"/>
<connect gate="G$1" pin="VCC" pad="9 19 31"/>
</connects>
<technologies>
<technology name="128"/>
<technology name="16"/>
<technology name="32"/>
<technology name="64"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ProjectOnly">
<description>プロジェクト限定のライブラリ</description>
<packages>
<package name="COIL-V">
<text x="-7" y="-12" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="-6" y="-12" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<pad name="1" x="-5.5" y="0" drill="1.3" diameter="1.9"/>
<pad name="2" x="5.5" y="1" drill="1.3" diameter="1.9"/>
<wire x1="-5.5" y1="12" x2="5.5" y2="12" width="0.127" layer="21"/>
<wire x1="5.5" y1="12" x2="5.5" y2="2.15" width="0.127" layer="21"/>
<wire x1="5.5" y1="2.15" x2="5.5" y2="-0.15" width="0.127" layer="51"/>
<wire x1="5.5" y1="-0.15" x2="5.5" y2="-12" width="0.127" layer="21"/>
<wire x1="5.5" y1="-12" x2="-5.5" y2="-12" width="0.127" layer="21"/>
<wire x1="-5.5" y1="-12" x2="-5.5" y2="-1.15" width="0.127" layer="21"/>
<wire x1="-5.5" y1="-1.15" x2="-5.5" y2="1.15" width="0.127" layer="51"/>
<wire x1="-5.5" y1="1.15" x2="-5.5" y2="12" width="0.127" layer="21"/>
</package>
<package name="TERMINAL2P-V">
<text x="-7" y="-4" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="-6" y="-4" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.3" diameter="1.9"/>
<pad name="2" x="2.54" y="0" drill="1.3" diameter="1.9"/>
<wire x1="-5.84" y1="8.9" x2="-5.84" y2="-4.1" width="0.127" layer="21"/>
<wire x1="-5.84" y1="-4.1" x2="5.08" y2="-4.1" width="0.127" layer="21"/>
<wire x1="5.08" y1="-4.1" x2="5.08" y2="8.9" width="0.127" layer="21"/>
<wire x1="5.08" y1="8.9" x2="-5.84" y2="8.9" width="0.127" layer="21"/>
<wire x1="0" y1="6.5" x2="0" y2="5" width="0.127" layer="51"/>
<wire x1="0" y1="5" x2="0.5" y2="5.5" width="0.127" layer="51"/>
<wire x1="0" y1="5" x2="-0.5" y2="5.5" width="0.127" layer="51"/>
</package>
<package name="SBB-003">
<hole x="0" y="0" drill="3.3"/>
<wire x1="-3" y1="3" x2="-3" y2="-3" width="0.127" layer="49"/>
<wire x1="-3" y1="-3" x2="3" y2="-3" width="0.127" layer="49"/>
<wire x1="3" y1="-3" x2="3" y2="3" width="0.127" layer="49"/>
<wire x1="3" y1="3" x2="-3" y2="3" width="0.127" layer="49"/>
</package>
<package name="COIL-H">
<text x="-2" y="0" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2" y="-1" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<circle x="0" y="0" radius="12" width="0.127" layer="21"/>
<pad name="1" x="-3" y="-14" drill="1.3" diameter="1.9"/>
<pad name="2" x="3" y="-14" drill="1.3" diameter="1.9"/>
<circle x="0" y="0" radius="8" width="0.127" layer="21"/>
<wire x1="-2.7" y1="-11.7" x2="-3" y2="-12.8" width="0.127" layer="21"/>
<wire x1="2.7" y1="-11.7" x2="3" y2="-12.8" width="0.127" layer="21"/>
</package>
<package name="TERMINAL2P-H">
<text x="-6" y="6" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-6" y="5" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.3" diameter="1.9"/>
<pad name="2" x="2.54" y="0" drill="1.3" diameter="1.9"/>
<wire x1="-5.58" y1="4.2" x2="-5.58" y2="-3.4" width="0.127" layer="21"/>
<wire x1="-5.58" y1="-3.4" x2="5.58" y2="-3.4" width="0.127" layer="21"/>
<wire x1="5.58" y1="-3.4" x2="5.58" y2="4.2" width="0.127" layer="21"/>
<wire x1="5.58" y1="4.2" x2="-5.58" y2="4.2" width="0.127" layer="21"/>
</package>
<package name="FC4L">
<text x="-2.54" y="3.81" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="-4.445" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-1.6" y1="-2" x2="-1.1" y2="3.2" layer="51"/>
<rectangle x1="-1.6" y1="-3.2" x2="-1.1" y2="-2.5" layer="51"/>
<rectangle x1="1.1" y1="-2" x2="1.6" y2="3.2" layer="51"/>
<rectangle x1="1.1" y1="-3.2" x2="1.6" y2="-2.5" layer="51"/>
<rectangle x1="-1.1" y1="3" x2="1.1" y2="3.2" layer="51"/>
<rectangle x1="-1.1" y1="-3.2" x2="1.1" y2="-3" layer="51"/>
<rectangle x1="1.4" y1="-2.5" x2="1.6" y2="-2" layer="51"/>
<rectangle x1="-1.6" y1="-2.5" x2="-1.4" y2="-2" layer="51"/>
<smd name="V1" x="-1.55" y="0.6" dx="1.1" dy="5.4" layer="1"/>
<smd name="I1" x="-1.55" y="-2.85" dx="1.1" dy="0.8" layer="1"/>
<smd name="V2" x="1.55" y="0.6" dx="1.1" dy="5.4" layer="1"/>
<smd name="I2" x="1.55" y="-2.85" dx="1.1" dy="0.8" layer="1"/>
<wire x1="-2.3" y1="3.5" x2="2.3" y2="3.5" width="0.127" layer="21"/>
<wire x1="2.3" y1="3.5" x2="2.3" y2="-3.5" width="0.127" layer="21"/>
<wire x1="2.3" y1="-3.5" x2="-2.3" y2="-3.5" width="0.127" layer="21"/>
<wire x1="-2.3" y1="-3.5" x2="-2.3" y2="3.5" width="0.127" layer="21"/>
</package>
<package name="270-AB">
<wire x1="-8.9" y1="1" x2="8.9" y2="1" width="0.127" layer="49"/>
<wire x1="8.9" y1="1" x2="8.9" y2="9.5" width="0.127" layer="49"/>
<wire x1="-8.9" y1="9.5" x2="-8.9" y2="1" width="0.127" layer="49"/>
<wire x1="-9.9" y1="0" x2="9.9" y2="0" width="0.127" layer="49"/>
<wire x1="9.9" y1="0" x2="9.9" y2="8.5" width="0.127" layer="49"/>
<wire x1="-9.9" y1="0" x2="-9.9" y2="8.5" width="0.127" layer="49"/>
<wire x1="-8.9" y1="9.5" x2="-22.25" y2="9.5" width="0.127" layer="49"/>
<wire x1="-22.25" y1="9.5" x2="-22.25" y2="8.5" width="0.127" layer="49"/>
<wire x1="-22.25" y1="8.5" x2="-9.9" y2="8.5" width="0.127" layer="49"/>
<wire x1="8.9" y1="9.5" x2="22.25" y2="9.5" width="0.127" layer="49"/>
<wire x1="22.25" y1="9.5" x2="22.25" y2="8.5" width="0.127" layer="49"/>
<wire x1="22.25" y1="8.5" x2="9.9" y2="8.5" width="0.127" layer="49"/>
</package>
<package name="271-AB">
<wire x1="-6.35" y1="1" x2="6.35" y2="1" width="0.127" layer="49"/>
<wire x1="6.35" y1="1" x2="6.35" y2="12.7" width="0.127" layer="49"/>
<wire x1="-6.35" y1="12.7" x2="-6.35" y2="1" width="0.127" layer="49"/>
<wire x1="-7.35" y1="0" x2="7.35" y2="0" width="0.127" layer="49"/>
<wire x1="7.35" y1="0" x2="7.35" y2="11.7" width="0.127" layer="49"/>
<wire x1="-7.35" y1="0" x2="-7.35" y2="11.7" width="0.127" layer="49"/>
<wire x1="-6.35" y1="12.7" x2="-22.25" y2="12.7" width="0.127" layer="49"/>
<wire x1="-22.25" y1="12.7" x2="-22.25" y2="11.7" width="0.127" layer="49"/>
<wire x1="-22.25" y1="11.7" x2="-7.35" y2="11.7" width="0.127" layer="49"/>
<wire x1="6.35" y1="12.7" x2="22.25" y2="12.7" width="0.127" layer="49"/>
<wire x1="22.25" y1="12.7" x2="22.25" y2="11.7" width="0.127" layer="49"/>
<wire x1="22.25" y1="11.7" x2="7.35" y2="11.7" width="0.127" layer="49"/>
</package>
<package name="SBB-002">
<hole x="0" y="0" drill="3.3"/>
<wire x1="-4" y1="4" x2="-4" y2="-4" width="0.127" layer="49"/>
<wire x1="-4" y1="-4" x2="4" y2="-4" width="0.127" layer="49"/>
<wire x1="4" y1="-4" x2="4" y2="4" width="0.127" layer="49"/>
<wire x1="4" y1="4" x2="-4" y2="4" width="0.127" layer="49"/>
</package>
<package name="LOGO-876_SMALL">
<polygon width="0.127" layer="21">
<vertex x="11.35" y="8.15" curve="40"/>
<vertex x="3.7" y="6.95"/>
<vertex x="3.9" y="6.75" curve="-40"/>
<vertex x="11.1" y="7.95" curve="-10"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.65" y="5.6" curve="25"/>
<vertex x="0.4" y="4.25" curve="30"/>
<vertex x="0" y="2.95" curve="60"/>
<vertex x="0.85" y="1.05" curve="40"/>
<vertex x="4.35" y="0" curve="30"/>
<vertex x="10.8" y="1.55" curve="35"/>
<vertex x="13.9" y="4.25" curve="-10"/>
<vertex x="13.5" y="4.15" curve="-50"/>
<vertex x="10.45" y="2.4" curve="45"/>
<vertex x="12.45" y="4.7" curve="-20"/>
<vertex x="12.35" y="5.2" curve="-70"/>
<vertex x="9.45" y="2.35"/>
<vertex x="9.45" y="1"/>
<vertex x="1.825" y="1"/>
<vertex x="1.825" y="0.7"/>
<vertex x="1.55" y="0.7"/>
<vertex x="1.55" y="2.35" curve="-15"/>
<vertex x="1" y="2.45" curve="-85"/>
<vertex x="0.35" y="3.35" curve="-25"/>
<vertex x="0.7" y="4.25" curve="-25"/>
<vertex x="1.65" y="5.3"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="12.6" y="7.125" curve="30"/>
<vertex x="12.65" y="7.95" curve="90"/>
<vertex x="12.15" y="8.25" curve="60"/>
<vertex x="11.05" y="7.45" curve="80"/>
<vertex x="11.3" y="6.9" curve="20"/>
<vertex x="12" y="6.65" curve="-60"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="12.85" y="7.1" curve="-70"/>
<vertex x="13.3" y="6.55" curve="10"/>
<vertex x="14.55" y="6.5" curve="80"/>
<vertex x="14.95" y="7" curve="100"/>
<vertex x="13.9" y="8.15" curve="90"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="12.6" y="5.775" curve="35"/>
<vertex x="12.65" y="4.75" curve="70"/>
<vertex x="13.15" y="4.35" curve="70"/>
<vertex x="14.6" y="5.25" curve="80"/>
<vertex x="14.5" y="6" curve="40"/>
<vertex x="13.3" y="6.35" curve="-90"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="11.975" y="6.45" curve="40"/>
<vertex x="10.95" y="6.3" curve="60"/>
<vertex x="10.65" y="5.6" curve="80"/>
<vertex x="11.55" y="4.65" curve="70"/>
<vertex x="11.85" y="4.8" curve="20"/>
<vertex x="12.35" y="5.85" curve="-70"/>
</polygon>
<circle x="12.65" y="6.45" radius="0.65" width="0.127" layer="21"/>
<polygon width="0.127" layer="21">
<vertex x="2.15" y="4.8" curve="30"/>
<vertex x="1.2" y="4.15" curve="40"/>
<vertex x="1.05" y="3.7" curve="55"/>
<vertex x="1.45" y="2.975" curve="35"/>
<vertex x="2.4" y="2.75" curve="45"/>
<vertex x="3.65" y="3.25" curve="35"/>
<vertex x="4" y="3.95" curve="50"/>
<vertex x="3.75" y="4.7" curve="20"/>
<vertex x="3.225" y="5.175"/>
<vertex x="2.425" y="4.575" curve="-10"/>
<vertex x="2.9" y="4.1" curve="-50"/>
<vertex x="3.1" y="3.6" curve="-90"/>
<vertex x="2.45" y="3" curve="-50"/>
<vertex x="1.95" y="3.25" curve="-50"/>
<vertex x="1.8" y="3.95" curve="-50"/>
<vertex x="2.35" y="4.7"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.75" y="7.1" curve="60"/>
<vertex x="1.6" y="6.2" curve="30"/>
<vertex x="1.6" y="5.4" curve="20"/>
<vertex x="1.975" y="4.925"/>
<vertex x="3.05" y="5.325" curve="-30"/>
<vertex x="2.4" y="5.95" curve="-60"/>
<vertex x="2.45" y="6.65" curve="-80"/>
<vertex x="3.05" y="6.85" curve="-50"/>
<vertex x="3.35" y="6.55" curve="-40"/>
<vertex x="3.4" y="5.85" curve="-40"/>
<vertex x="3.05" y="5.35"/>
<vertex x="3.275" y="5.175" curve="30"/>
<vertex x="4.05" y="5.9" curve="40"/>
<vertex x="4.1" y="6.35" curve="50"/>
<vertex x="3.55" y="7.05" curve="30"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.75" y="6.8" curve="-10"/>
<vertex x="4.3" y="5.45"/>
<vertex x="4.5" y="5.35"/>
<vertex x="4.75" y="5.7" curve="-50"/>
<vertex x="5.1" y="5.85"/>
<vertex x="6.8" y="5.85"/>
<vertex x="4.6" y="2.25"/>
<vertex x="5.1" y="2.25"/>
<vertex x="7.55" y="6.55" curve="120"/>
<vertex x="7.45" y="6.75"/>
<vertex x="5.05" y="6.75" curve="-20"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="10.35" y="8.05" curve="35"/>
<vertex x="7.95" y="6.25" curve="50"/>
<vertex x="7.3" y="3.9" curve="70"/>
<vertex x="8.6" y="2.95" curve="60"/>
<vertex x="10.2" y="3.95" curve="30"/>
<vertex x="10.35" y="5.05" curve="100"/>
<vertex x="9.05" y="5.85" curve="10"/>
<vertex x="8.65" y="5.675"/>
<vertex x="8.725" y="5.425" curve="-20"/>
<vertex x="9" y="5.4" curve="-50"/>
<vertex x="9.3" y="5.1" curve="-20"/>
<vertex x="9.4" y="4.3" curve="-30"/>
<vertex x="9.2" y="3.55" curve="-30"/>
<vertex x="8.95" y="3.3" curve="-30"/>
<vertex x="8.8" y="3.25" curve="-60"/>
<vertex x="8.3" y="3.55" curve="-40"/>
<vertex x="8.25" y="4.85" curve="-25"/>
<vertex x="9.15" y="6.55" curve="-25"/>
<vertex x="10.85" y="8"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="8.75" y="5.725"/>
<vertex x="8.25" y="5.5"/>
<vertex x="8.35" y="5.15" curve="-60"/>
<vertex x="8.775" y="5.425"/>
</polygon>
<wire x1="12.975" y1="1.425" x2="12.55" y2="1.9" width="0.127" layer="21" curve="100"/>
<wire x1="12.55" y1="1.9" x2="11.95" y2="1.25" width="0.127" layer="21" curve="100"/>
<wire x1="11.95" y1="1.25" x2="12.5" y2="0.85" width="0.127" layer="21" curve="80"/>
<wire x1="12.5" y1="0.85" x2="12.95" y2="1.05" width="0.127" layer="21" curve="40"/>
<wire x1="12.65" y1="1.5" x2="12.5" y2="1.65" width="0.127" layer="21" curve="80"/>
<wire x1="12.5" y1="1.65" x2="12.2" y2="1.35" width="0.127" layer="21" curve="100"/>
<wire x1="12.2" y1="1.35" x2="12.4" y2="1.15" width="0.127" layer="21" curve="70"/>
<wire x1="12.4" y1="1.15" x2="12.6" y2="1.25" width="0.127" layer="21" curve="80"/>
<wire x1="12.6" y1="1.25" x2="12.675" y2="1.65" width="0.127" layer="21"/>
<wire x1="12.675" y1="1.65" x2="12.7" y2="1.65" width="0.127" layer="21"/>
<wire x1="12.7" y1="1.65" x2="12.6" y2="1.175" width="0.127" layer="21"/>
<wire x1="12.6" y1="1.175" x2="12.65" y2="1.125" width="0.127" layer="21" curve="90"/>
<wire x1="12.65" y1="1.125" x2="12.975" y2="1.425" width="0.127" layer="21" curve="80"/>
<polygon width="0.127" layer="21">
<vertex x="1.975" y="4.925"/>
<vertex x="2.425" y="4.575"/>
<vertex x="3.225" y="5.175"/>
<vertex x="2.8" y="5.5"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="9.45" y="1.9"/>
<vertex x="9.45" y="2.35" curve="-4"/>
<vertex x="4.5" y="2.25" curve="-5"/>
<vertex x="1.55" y="2.35"/>
<vertex x="1.55" y="1.9"/>
<vertex x="4.575" y="1.9"/>
<vertex x="4.575" y="2.25"/>
<vertex x="4.85" y="2.25"/>
<vertex x="4.85" y="1.9"/>
<vertex x="6.85" y="1.9"/>
<vertex x="6.85" y="2.2"/>
<vertex x="7.15" y="2.2"/>
<vertex x="7.15" y="2.25"/>
<vertex x="7.425" y="2.25" curve="-180"/>
<vertex x="7.45" y="1.9"/>
</polygon>
<circle x="2" y="1.45" radius="0.08" width="0.3" layer="21"/>
<polygon width="0.127" layer="21">
<vertex x="2.5" y="1.9"/>
<vertex x="2.5" y="1"/>
<vertex x="2.05" y="1" curve="90"/>
<vertex x="2.45" y="1.45" curve="90"/>
<vertex x="2.05" y="1.9"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.825" y="1.9"/>
<vertex x="1.825" y="1.85" curve="-40"/>
<vertex x="2" y="1.9"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.825" y="1"/>
<vertex x="1.825" y="1.075" curve="40"/>
<vertex x="2" y="1"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.775" y="1.9"/>
<vertex x="2.775" y="1.825" curve="-40"/>
<vertex x="2.875" y="1.9"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.775" y="1"/>
<vertex x="2.775" y="1.5" curve="-90"/>
<vertex x="2.925" y="1.625"/>
<vertex x="3" y="1.9"/>
<vertex x="3" y="1"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="3" y="1"/>
<vertex x="3" y="1.9"/>
<vertex x="3.45" y="1.9" curve="90"/>
<vertex x="3" y="1.45" curve="90"/>
<vertex x="3.45" y="1"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="3.9" y="1.9"/>
<vertex x="3.9" y="1"/>
<vertex x="3.45" y="1" curve="90"/>
<vertex x="3.9" y="1.45" curve="90"/>
<vertex x="3.45" y="1.9"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="3.925" y="1"/>
<vertex x="3.925" y="1.9"/>
<vertex x="4.375" y="1.9" curve="90"/>
<vertex x="3.975" y="1.45" curve="90"/>
<vertex x="4.375" y="1"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.575" y="1.925"/>
<vertex x="4.575" y="1.825" curve="40"/>
<vertex x="4.4" y="1.9"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.575" y="1"/>
<vertex x="4.575" y="1.05" curve="-40"/>
<vertex x="4.4" y="1"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.85" y="1.9"/>
<vertex x="4.85" y="1"/>
<vertex x="5.4" y="1" curve="-90"/>
<vertex x="5" y="1.375"/>
<vertex x="5" y="1.9"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="5.875" y="1.9"/>
<vertex x="5.8" y="1.9"/>
<vertex x="5.8" y="1.375" curve="-90"/>
<vertex x="5.4" y="1"/>
<vertex x="5.875" y="1"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="5.875" y="1"/>
<vertex x="5.875" y="1.9"/>
<vertex x="6.325" y="1.9" curve="90"/>
<vertex x="5.875" y="1.45" curve="90"/>
<vertex x="6.325" y="1"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="5.275" y="1.9"/>
<vertex x="5.275" y="1.4" curve="180"/>
<vertex x="5.525" y="1.4"/>
<vertex x="5.525" y="1.9"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="6.725" y="1.9"/>
<vertex x="6.725" y="1.65"/>
<vertex x="6.85" y="1.65"/>
<vertex x="6.85" y="1"/>
<vertex x="6.325" y="1" curve="90"/>
<vertex x="6.775" y="1.45" curve="90"/>
<vertex x="6.325" y="1.9"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="6.475" y="1.475"/>
<vertex x="6.725" y="1.675"/>
<vertex x="6.725" y="1.225"/>
<vertex x="6.475" y="1.425"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="7.15" y="1.65"/>
<vertex x="7.15" y="1"/>
<vertex x="7.275" y="1"/>
<vertex x="7.275" y="1.9"/>
<vertex x="7.45" y="1.9" curve="-180"/>
<vertex x="7.45" y="2.25"/>
<vertex x="7.15" y="2.25"/>
<vertex x="7.15" y="1.9"/>
<vertex x="7.275" y="1.9"/>
<vertex x="7.275" y="1.65"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="7.6" y="1"/>
<vertex x="7.6" y="1.9"/>
<vertex x="8.1" y="1.9" curve="90"/>
<vertex x="7.65" y="1.45" curve="90"/>
<vertex x="8.1" y="1"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="8.65" y="1.9"/>
<vertex x="8.65" y="1"/>
<vertex x="8.1" y="1" curve="90"/>
<vertex x="8.55" y="1.45" curve="90"/>
<vertex x="8.1" y="1.9"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="9.175" y="1"/>
<vertex x="9.175" y="1.525" curve="180"/>
<vertex x="8.95" y="1.525"/>
<vertex x="8.95" y="1"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="8.95" y="1.9"/>
<vertex x="8.95" y="1.85" curve="-40"/>
<vertex x="9.125" y="1.9"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="9.45" y="1.9"/>
<vertex x="9.45" y="1.6" curve="90"/>
<vertex x="9.15" y="1.9"/>
</polygon>
<circle x="3.45" y="1.45" radius="0.08" width="0.3" layer="21"/>
<circle x="4.4" y="1.45" radius="0.08" width="0.3" layer="21"/>
<circle x="6.325" y="1.45" radius="0.08" width="0.3" layer="21"/>
<circle x="8.1" y="1.45" radius="0.08" width="0.3" layer="21"/>
</package>
<package name="LOGO-HIGHVOLTAGE">
<wire x1="-3" y1="-3" x2="3" y2="-3" width="0.127" layer="21"/>
<wire x1="-0.6" y1="3.2" x2="-3.6" y2="-1.9" width="0.127" layer="21"/>
<wire x1="3.6" y1="-1.9" x2="0.6" y2="3.2" width="0.127" layer="21"/>
<wire x1="-0.6" y1="3.2" x2="0.6" y2="3.2" width="0.127" layer="21" curve="-120"/>
<wire x1="-3.6" y1="-1.9" x2="-3" y2="-3" width="0.127" layer="21" curve="120"/>
<wire x1="3.6" y1="-1.9" x2="3" y2="-3" width="0.127" layer="21" curve="-120"/>
<polygon width="0.127" layer="21">
<vertex x="-0.5" y="2.5"/>
<vertex x="-1.05" y="-0.4"/>
<vertex x="0.45" y="0.1"/>
<vertex x="0.1" y="-1.85"/>
<vertex x="-0.1" y="-1.75"/>
<vertex x="0" y="-2.5"/>
<vertex x="0.5" y="-1.9"/>
<vertex x="0.25" y="-1.9"/>
<vertex x="0.95" y="0.6"/>
<vertex x="-0.55" y="0.1"/>
<vertex x="0.5" y="2.5"/>
</polygon>
</package>
<package name="TERMINAL2P-V-SCLEWLESS">
<text x="-9" y="-5" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="-8" y="-5" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<pad name="1" x="-2.54" y="-3.81" drill="1.3" diameter="1.9"/>
<pad name="2" x="2.54" y="-3.81" drill="1.3" diameter="1.9"/>
<wire x1="-7.62" y1="5.34" x2="-7.62" y2="-5.11" width="0.127" layer="21"/>
<wire x1="-7.62" y1="-5.11" x2="5.08" y2="-5.11" width="0.127" layer="21"/>
<wire x1="5.08" y1="-5.11" x2="5.08" y2="5.34" width="0.127" layer="21"/>
<wire x1="5.08" y1="5.34" x2="-7.62" y2="5.34" width="0.127" layer="21"/>
<pad name="1B" x="-2.54" y="3.81" drill="1.3" diameter="1.9"/>
<pad name="2B" x="2.54" y="3.81" drill="1.3" diameter="1.9"/>
<wire x1="4.8" y1="-5.11" x2="4.8" y2="-7.96" width="0.127" layer="51"/>
<wire x1="4.8" y1="-7.96" x2="0" y2="-7.96" width="0.127" layer="51"/>
<wire x1="0" y1="-7.96" x2="0" y2="-5.11" width="0.127" layer="51"/>
<wire x1="-0.28" y1="-5.11" x2="-0.28" y2="-7.96" width="0.127" layer="51"/>
<wire x1="-0.28" y1="-7.96" x2="-5.08" y2="-7.96" width="0.127" layer="51"/>
<wire x1="-5.08" y1="-7.96" x2="-5.08" y2="-5.11" width="0.127" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="COIL">
<wire x1="-2.54" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94" curve="-90"/>
<wire x1="0" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94" curve="90"/>
<wire x1="0" y1="0" x2="1.27" y2="1.27" width="0.254" layer="94" curve="-90"/>
<wire x1="2.54" y1="0" x2="1.27" y2="1.27" width="0.254" layer="94" curve="90"/>
<text x="-2.54" y="2.54" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
<symbol name="PIN1X2">
<wire x1="-1.27" y1="-2.54" x2="3.81" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-2.54" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="5.08" x2="-1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="-1.27" y2="-2.54" width="0.4064" layer="94"/>
<text x="-1.27" y="5.715" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-1.27" y="-5.08" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
</symbol>
<symbol name="SSB">
<text x="-2.54" y="3.175" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-3.81" y="-5.08" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<circle x="0" y="0" radius="1.778" width="0.254" layer="94"/>
</symbol>
<symbol name="RESISTOR-4">
<wire x1="-2.54" y1="0" x2="-2.159" y2="1.016" width="0.2032" layer="94"/>
<wire x1="-2.159" y1="1.016" x2="-1.524" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="-1.524" y1="-1.016" x2="-0.889" y2="1.016" width="0.2032" layer="94"/>
<wire x1="-0.889" y1="1.016" x2="-0.254" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="-0.254" y1="-1.016" x2="0" y2="0" width="0.2032" layer="94"/>
<text x="-5.08" y="4.0386" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-5.08" y="-5.842" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="V2" x="5.08" y="2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="V1" x="-7.62" y="2.54" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="I1" x="-7.62" y="-2.54" visible="off" length="short" direction="pas" swaplevel="2"/>
<pin name="I2" x="5.08" y="-2.54" visible="off" length="short" direction="pas" swaplevel="2" rot="R180"/>
<wire x1="-5.08" y1="2.54" x2="-3.81" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-3.81" y1="2.54" x2="-3.81" y2="0" width="0.1524" layer="94"/>
<wire x1="-3.81" y1="0" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-5.08" y1="-2.54" x2="-3.81" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-3.81" y1="-2.54" x2="-3.81" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="1.27" y2="2.54" width="0.1524" layer="94"/>
<wire x1="1.27" y1="2.54" x2="1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="0" width="0.1524" layer="94"/>
</symbol>
<symbol name="HEATSINK">
<text x="-5.08" y="5.08" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-5.08" y="3.048" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<wire x1="-5.08" y1="2.54" x2="-5.08" y2="-1.778" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-1.778" x2="-5.08" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-2.54" x2="5.08" y2="-2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="-2.54" x2="5.08" y2="-1.778" width="0.254" layer="94"/>
<wire x1="5.08" y1="-1.778" x2="5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-1.778" x2="-2.54" y2="-1.778" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.778" x2="0" y2="-1.778" width="0.254" layer="94"/>
<wire x1="0" y1="-1.778" x2="2.54" y2="-1.778" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.778" x2="5.08" y2="-1.778" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.778" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="-1.778" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="-1.778" width="0.254" layer="94"/>
</symbol>
<symbol name="LOGO">
<text x="-5.08" y="0.508" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<text x="-5.08" y="2.54" size="1.778" layer="95" font="vector">&gt;NAME</text>
<wire x1="-5.08" y1="0" x2="-5.08" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-2.54" x2="5.08" y2="-2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="-2.54" x2="5.08" y2="0" width="0.254" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="0" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="COIL" prefix="L" uservalue="yes">
<gates>
<gate name="G$1" symbol="COIL" x="0" y="0"/>
</gates>
<devices>
<device name="-H" package="COIL-H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-V" package="COIL-V">
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
<deviceset name="TERMINAL2P" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="PIN1X2" x="0" y="0"/>
</gates>
<devices>
<device name="-H" package="TERMINAL2P-H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-V" package="TERMINAL2P-V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-V-SL" package="TERMINAL2P-V-SCLEWLESS">
<connects>
<connect gate="G$1" pin="1" pad="1 1B"/>
<connect gate="G$1" pin="2" pad="2 2B"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SSB-00*" prefix="H">
<gates>
<gate name="G$1" symbol="SSB" x="0" y="0"/>
</gates>
<devices>
<device name="2" package="SBB-002">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3" package="SBB-003">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="FC4L" prefix="R" uservalue="yes">
<gates>
<gate name="G$1" symbol="RESISTOR-4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="FC4L">
<connects>
<connect gate="G$1" pin="I1" pad="I1"/>
<connect gate="G$1" pin="I2" pad="I2"/>
<connect gate="G$1" pin="V1" pad="V1"/>
<connect gate="G$1" pin="V2" pad="V2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="HEATSINK" prefix="HT">
<gates>
<gate name="G$1" symbol="HEATSINK" x="0" y="0"/>
</gates>
<devices>
<device name="-270" package="270-AB">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-271" package="271-AB">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LOGO-876_SMALL" prefix="LOGO">
<gates>
<gate name="G$1" symbol="LOGO" x="0" y="0"/>
</gates>
<devices>
<device name="" package="LOGO-876_SMALL">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LOGO-HV" prefix="LOGO">
<gates>
<gate name="G$1" symbol="LOGO" x="0" y="0"/>
</gates>
<devices>
<device name="" package="LOGO-HIGHVOLTAGE">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Opamp">
<packages>
<package name="SOP8">
<wire x1="-2.45" y1="1.95" x2="2.45" y2="1.95" width="0.127" layer="21"/>
<wire x1="2.45" y1="1.95" x2="2.45" y2="-1.95" width="0.127" layer="21"/>
<wire x1="-2.45" y1="1.95" x2="-2.45" y2="-1.95" width="0.127" layer="21"/>
<wire x1="-2.45" y1="-1.95" x2="2.45" y2="-1.95" width="0.127" layer="21"/>
<circle x="-1.885" y="-1.29" radius="0.2" width="0.127" layer="21"/>
<smd name="2" x="-0.635" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="7" x="-0.635" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="1" x="-1.905" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="3" x="0.635" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="4" x="1.905" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="8" x="-1.905" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="6" x="0.635" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="5" x="1.905" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<text x="-1.905" y="0.635" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.905" y="-0.635" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="1.7" y1="1.95" x2="2.11" y2="2.95" layer="51"/>
<rectangle x1="0.43" y1="1.95" x2="0.84" y2="2.95" layer="51"/>
<rectangle x1="-0.84" y1="1.95" x2="-0.43" y2="2.95" layer="51"/>
<rectangle x1="-2.11" y1="1.95" x2="-1.7" y2="2.95" layer="51"/>
<rectangle x1="1.7" y1="-2.95" x2="2.11" y2="-1.95" layer="51"/>
<rectangle x1="0.43" y1="-2.95" x2="0.84" y2="-1.95" layer="51"/>
<rectangle x1="-0.84" y1="-2.95" x2="-0.43" y2="-1.95" layer="51"/>
<rectangle x1="-2.11" y1="-2.95" x2="-1.7" y2="-1.95" layer="51"/>
</package>
<package name="SOT23-5">
<wire x1="-1.45" y1="0.65" x2="1.45" y2="0.65" width="0.127" layer="21"/>
<wire x1="1.45" y1="0.65" x2="1.45" y2="-0.65" width="0.127" layer="21"/>
<wire x1="1.45" y1="-0.65" x2="-1.45" y2="-0.65" width="0.127" layer="21"/>
<wire x1="-1.45" y1="-0.65" x2="-1.45" y2="0.65" width="0.127" layer="21"/>
<smd name="1" x="-0.95" y="-1.35" dx="0.6" dy="1.05" layer="1"/>
<smd name="2" x="0" y="-1.35" dx="0.6" dy="1.05" layer="1"/>
<smd name="3" x="0.95" y="-1.35" dx="0.6" dy="1.05" layer="1"/>
<smd name="4" x="0.95" y="1.35" dx="0.6" dy="1.05" layer="1"/>
<smd name="5" x="-0.95" y="1.35" dx="0.6" dy="1.05" layer="1"/>
<text x="-1.905" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="2.54" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.2" y1="-1.5" x2="-0.7" y2="-0.825" layer="51" rot="R180"/>
<rectangle x1="-0.25" y1="-1.5" x2="0.25" y2="-0.825" layer="51" rot="R180"/>
<rectangle x1="0.7" y1="-1.5" x2="1.2" y2="-0.825" layer="51" rot="R180"/>
<rectangle x1="0.7" y1="0.825" x2="1.2" y2="1.5" layer="51"/>
<rectangle x1="-1.2" y1="0.825" x2="-0.7" y2="1.5" layer="51"/>
<rectangle x1="-1.45" y1="-0.65" x2="-0.5" y2="0" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="OPAMP">
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="5.08" y2="0" width="0.254" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="-4.572" y1="2.54" x2="-3.556" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-4.064" y1="3.048" x2="-4.064" y2="2.032" width="0.1524" layer="94"/>
<wire x1="-4.572" y1="-2.54" x2="-3.556" y2="-2.54" width="0.1524" layer="94"/>
<text x="1.27" y="3.81" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="1.27" y="-5.08" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="IN+" x="-7.62" y="2.54" visible="pad" length="short" direction="in"/>
<pin name="IN-" x="-7.62" y="-2.54" visible="pad" length="short" direction="in"/>
<pin name="OUT" x="7.62" y="0" visible="pad" length="short" direction="out" rot="R180"/>
</symbol>
<symbol name="OPAMP_PWR">
<text x="1.27" y="0" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="1.27" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="V+" x="0" y="5.08" visible="pad" length="short" direction="in" rot="R270"/>
<pin name="V-" x="0" y="-5.08" visible="pad" length="short" direction="in" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SINGLE-OPAMP-ISO" prefix="U" uservalue="yes">
<gates>
<gate name="A" symbol="OPAMP" x="-10.16" y="0"/>
<gate name="P" symbol="OPAMP_PWR" x="7.62" y="0"/>
</gates>
<devices>
<device name="-SOP" package="SOP8">
<connects>
<connect gate="A" pin="IN+" pad="3"/>
<connect gate="A" pin="IN-" pad="2"/>
<connect gate="A" pin="OUT" pad="6"/>
<connect gate="P" pin="V+" pad="7"/>
<connect gate="P" pin="V-" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT23" package="SOT23-5">
<connects>
<connect gate="A" pin="IN+" pad="3"/>
<connect gate="A" pin="IN-" pad="4"/>
<connect gate="A" pin="OUT" pad="1"/>
<connect gate="P" pin="V+" pad="5"/>
<connect gate="P" pin="V-" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-Hirose">
<packages>
<package name="UX60SC-MB-5ST">
<wire x1="-4.2" y1="-3.8" x2="-4.2" y2="3.8" width="0.127" layer="21"/>
<wire x1="0.4" y1="3.8" x2="0.4" y2="4.65" width="0.127" layer="51"/>
<wire x1="0.4" y1="4.65" x2="0.55" y2="4.8" width="0.127" layer="51" curve="-90"/>
<wire x1="0.55" y1="4.8" x2="0.5487" y2="4.7993" width="0.127" layer="51"/>
<wire x1="0.5487" y1="4.7993" x2="0.55" y2="4.8" width="0.127" layer="51" curve="-0.034064"/>
<wire x1="1.4" y1="4.6311" x2="1.4" y2="3.8" width="0.127" layer="51"/>
<wire x1="1.3548" y1="0.7497" x2="1.0183" y2="1.0862" width="0.1016" layer="51" curve="89.931933"/>
<wire x1="1.0183" y1="1.0862" x2="-3.0051" y2="1.2965" width="0.1016" layer="51"/>
<wire x1="-3.0051" y1="1.2965" x2="-3.0191" y2="1.0301" width="0.1016" layer="51" curve="180"/>
<wire x1="-3.0191" y1="1.0301" x2="0.0931" y2="0.8619" width="0.1016" layer="51"/>
<wire x1="0.0931" y1="0.8619" x2="0.5277" y2="0.4273" width="0.1016" layer="51" curve="-90"/>
<wire x1="0.5277" y1="0.4273" x2="0.5277" y2="-0.4559" width="0.1016" layer="51"/>
<wire x1="0.5277" y1="-0.4559" x2="0.1071" y2="-0.8765" width="0.1016" layer="51" curve="-90"/>
<wire x1="0.1071" y1="-0.8765" x2="0.037" y2="-0.8765" width="0.1016" layer="51"/>
<wire x1="0.037" y1="-0.8765" x2="-3.0051" y2="-1.0167" width="0.1016" layer="51"/>
<wire x1="-3.0051" y1="-1.0167" x2="-3.0051" y2="-1.297" width="0.1016" layer="51" curve="174.689178"/>
<wire x1="-3.0051" y1="-1.297" x2="0.9903" y2="-1.0868" width="0.1016" layer="51"/>
<wire x1="0.9903" y1="-1.0868" x2="1.3548" y2="-0.7223" width="0.1016" layer="51" curve="90"/>
<wire x1="1.3548" y1="-0.7223" x2="1.3548" y2="0.7497" width="0.1016" layer="51"/>
<smd name="S2" x="0" y="4.2" dx="3.8" dy="2.5" layer="1"/>
<smd name="S1" x="0" y="-4.2" dx="3.8" dy="2.5" layer="1"/>
<smd name="1" x="2.7" y="1.6" dx="1.8" dy="0.5" layer="1"/>
<text x="-5.08" y="-7.62" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-5.08" y="-8.89" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="2.2" y1="1.45" x2="2.8" y2="1.75" layer="51"/>
<wire x1="0.55" y1="4.8" x2="1.25" y2="4.8" width="0.127" layer="51"/>
<wire x1="1.25" y1="4.8" x2="1.4" y2="4.65" width="0.127" layer="51" curve="-90"/>
<wire x1="-1.4" y1="3.8" x2="-1.4" y2="4.65" width="0.127" layer="51"/>
<wire x1="-1.4" y1="4.65" x2="-1.25" y2="4.8" width="0.127" layer="51" curve="-90"/>
<wire x1="-1.25" y1="4.8" x2="-1.2513" y2="4.7993" width="0.127" layer="51"/>
<wire x1="-1.2513" y1="4.7993" x2="-1.25" y2="4.8" width="0.127" layer="51" curve="-0.034064"/>
<wire x1="-0.4" y1="4.6311" x2="-0.4" y2="3.8" width="0.127" layer="51"/>
<wire x1="-1.25" y1="4.8" x2="-0.55" y2="4.8" width="0.127" layer="51"/>
<wire x1="-0.55" y1="4.8" x2="-0.4" y2="4.65" width="0.127" layer="51" curve="-90"/>
<wire x1="1.4" y1="-3.8" x2="1.4" y2="-4.65" width="0.127" layer="51"/>
<wire x1="1.4" y1="-4.65" x2="1.25" y2="-4.8" width="0.127" layer="51" curve="-90"/>
<wire x1="1.25" y1="-4.8" x2="1.2513" y2="-4.7993" width="0.127" layer="51"/>
<wire x1="1.2513" y1="-4.7993" x2="1.25" y2="-4.8" width="0.127" layer="51" curve="-0.034064"/>
<wire x1="0.4" y1="-4.6311" x2="0.4" y2="-3.8" width="0.127" layer="51"/>
<wire x1="1.25" y1="-4.8" x2="0.55" y2="-4.8" width="0.127" layer="51"/>
<wire x1="0.55" y1="-4.8" x2="0.4" y2="-4.65" width="0.127" layer="51" curve="-90"/>
<wire x1="-0.4" y1="-3.8" x2="-0.4" y2="-4.65" width="0.127" layer="51"/>
<wire x1="-0.4" y1="-4.65" x2="-0.55" y2="-4.8" width="0.127" layer="51" curve="-90"/>
<wire x1="-0.55" y1="-4.8" x2="-0.5487" y2="-4.7993" width="0.127" layer="51"/>
<wire x1="-0.5487" y1="-4.7993" x2="-0.55" y2="-4.8" width="0.127" layer="51" curve="-0.034064"/>
<wire x1="-1.4" y1="-4.6311" x2="-1.4" y2="-3.8" width="0.127" layer="51"/>
<wire x1="-0.55" y1="-4.8" x2="-1.25" y2="-4.8" width="0.127" layer="51"/>
<wire x1="-1.25" y1="-4.8" x2="-1.4" y2="-4.65" width="0.127" layer="51" curve="-90"/>
<wire x1="2.8" y1="3.8" x2="2.8" y2="2.05" width="0.127" layer="21"/>
<wire x1="2.8" y1="-2.05" x2="2.8" y2="-3.8" width="0.127" layer="21"/>
<smd name="3" x="2.7" y="0" dx="1.8" dy="0.5" layer="1"/>
<rectangle x1="2.2" y1="-0.15" x2="2.8" y2="0.15" layer="51"/>
<smd name="2" x="2.7" y="0.8" dx="1.8" dy="0.5" layer="1"/>
<rectangle x1="2.2" y1="0.65" x2="2.8" y2="0.95" layer="51"/>
<smd name="4" x="2.7" y="-0.8" dx="1.8" dy="0.5" layer="1"/>
<rectangle x1="2.2" y1="-0.95" x2="2.8" y2="-0.65" layer="51"/>
<smd name="5" x="2.7" y="-1.6" dx="1.8" dy="0.5" layer="1"/>
<rectangle x1="2.2" y1="-1.75" x2="2.8" y2="-1.45" layer="51"/>
<wire x1="2.8" y1="2.05" x2="2.8" y2="-2.05" width="0.127" layer="51"/>
<wire x1="-4.2" y1="3.8" x2="-2.1" y2="3.8" width="0.127" layer="21"/>
<wire x1="2.8" y1="3.8" x2="2.1" y2="3.8" width="0.127" layer="21"/>
<wire x1="-4.2" y1="-3.8" x2="-2.1" y2="-3.8" width="0.127" layer="21"/>
<wire x1="2.8" y1="-3.8" x2="2.1" y2="-3.8" width="0.127" layer="21"/>
<wire x1="-2.1" y1="-3.8" x2="2.1" y2="-3.8" width="0.127" layer="51"/>
<wire x1="-2.1" y1="3.8" x2="2.1" y2="3.8" width="0.127" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="USB-MINIB-2S">
<wire x1="2.54" y1="6.35" x2="2.54" y2="-6.35" width="0.254" layer="94"/>
<wire x1="2.54" y1="-6.35" x2="1.27" y2="-7.62" width="0.254" layer="94" curve="-90"/>
<wire x1="1.27" y1="-7.62" x2="0" y2="-7.62" width="0.254" layer="94"/>
<wire x1="0" y1="-7.62" x2="-1.016" y2="-8.128" width="0.254" layer="94" curve="53.130102"/>
<wire x1="-1.016" y1="-8.128" x2="-2.54" y2="-8.89" width="0.254" layer="94" curve="-53.130102"/>
<wire x1="-2.54" y1="-8.89" x2="-5.08" y2="-8.89" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-8.89" x2="-6.35" y2="-7.62" width="0.254" layer="94" curve="-90"/>
<wire x1="-6.35" y1="-7.62" x2="-6.35" y2="7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="6.35" x2="1.27" y2="7.62" width="0.254" layer="94" curve="90"/>
<wire x1="1.27" y1="7.62" x2="0" y2="7.62" width="0.254" layer="94"/>
<wire x1="0" y1="7.62" x2="-1.016" y2="8.128" width="0.254" layer="94" curve="-53.130102"/>
<wire x1="-1.016" y1="8.128" x2="-2.54" y2="8.89" width="0.254" layer="94" curve="53.130102"/>
<wire x1="-2.54" y1="8.89" x2="-5.08" y2="8.89" width="0.254" layer="94"/>
<wire x1="-5.08" y1="8.89" x2="-6.35" y2="7.62" width="0.254" layer="94" curve="90"/>
<wire x1="0" y1="5.08" x2="0" y2="-5.08" width="0.254" layer="94"/>
<wire x1="0" y1="-5.08" x2="-1.27" y2="-6.35" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-6.35" x2="-3.81" y2="-6.35" width="0.254" layer="94"/>
<wire x1="-3.81" y1="-6.35" x2="-3.81" y2="6.35" width="0.254" layer="94"/>
<wire x1="-3.81" y1="6.35" x2="-1.27" y2="6.35" width="0.254" layer="94"/>
<wire x1="-1.27" y1="6.35" x2="0" y2="5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="-10.16" x2="-6.35" y2="-10.16" width="0.254" layer="94" style="shortdash"/>
<wire x1="-6.35" y1="-10.16" x2="-7.62" y2="-8.89" width="0.254" layer="94" style="shortdash" curve="-90"/>
<wire x1="-7.62" y1="-8.89" x2="-7.62" y2="8.89" width="0.254" layer="94" style="shortdash"/>
<wire x1="2.54" y1="10.16" x2="-6.35" y2="10.16" width="0.254" layer="94" style="shortdash"/>
<wire x1="-6.35" y1="10.16" x2="-7.62" y2="8.89" width="0.254" layer="94" style="shortdash" curve="90"/>
<text x="-7.62" y="13.208" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="10.668" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VBUS" x="5.08" y="5.08" visible="pin" direction="pas" rot="R180"/>
<pin name="D-" x="5.08" y="2.54" visible="pin" direction="pas" rot="R180"/>
<pin name="D+" x="5.08" y="0" visible="pin" direction="pas" rot="R180"/>
<pin name="ID" x="5.08" y="-2.54" visible="pin" direction="pas" rot="R180"/>
<pin name="GND" x="5.08" y="-5.08" visible="pin" direction="pas" rot="R180"/>
<pin name="S1" x="-2.54" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S2" x="0" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="UX60S" prefix="CN">
<gates>
<gate name="G$1" symbol="USB-MINIB-2S" x="0" y="0"/>
</gates>
<devices>
<device name="C-MB-5ST" package="UX60SC-MB-5ST">
<connects>
<connect gate="G$1" pin="D+" pad="3"/>
<connect gate="G$1" pin="D-" pad="2"/>
<connect gate="G$1" pin="GND" pad="5"/>
<connect gate="G$1" pin="ID" pad="4"/>
<connect gate="G$1" pin="S1" pad="S1"/>
<connect gate="G$1" pin="S2" pad="S2"/>
<connect gate="G$1" pin="VBUS" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-TI">
<description>Texas Instruments</description>
<packages>
<package name="SOT23-5">
<wire x1="-1.45" y1="0.65" x2="1.45" y2="0.65" width="0.127" layer="21"/>
<wire x1="1.45" y1="0.65" x2="1.45" y2="-0.65" width="0.127" layer="21"/>
<wire x1="1.45" y1="-0.65" x2="-1.45" y2="-0.65" width="0.127" layer="21"/>
<wire x1="-1.45" y1="-0.65" x2="-1.45" y2="0.65" width="0.127" layer="21"/>
<smd name="1" x="-0.95" y="-1.35" dx="0.6" dy="1.05" layer="1"/>
<smd name="2" x="0" y="-1.35" dx="0.6" dy="1.05" layer="1"/>
<smd name="3" x="0.95" y="-1.35" dx="0.6" dy="1.05" layer="1"/>
<smd name="4" x="0.95" y="1.35" dx="0.6" dy="1.05" layer="1"/>
<smd name="5" x="-0.95" y="1.35" dx="0.6" dy="1.05" layer="1"/>
<text x="-1.905" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="2.54" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.2" y1="-1.5" x2="-0.7" y2="-0.825" layer="51" rot="R180"/>
<rectangle x1="-0.25" y1="-1.5" x2="0.25" y2="-0.825" layer="51" rot="R180"/>
<rectangle x1="0.7" y1="-1.5" x2="1.2" y2="-0.825" layer="51" rot="R180"/>
<rectangle x1="0.7" y1="0.825" x2="1.2" y2="1.5" layer="51"/>
<rectangle x1="-1.2" y1="0.825" x2="-0.7" y2="1.5" layer="51"/>
<rectangle x1="-1.45" y1="-0.65" x2="-0.5" y2="0" layer="21"/>
</package>
<package name="SOP8">
<wire x1="-2.45" y1="1.95" x2="2.45" y2="1.95" width="0.127" layer="21"/>
<wire x1="2.45" y1="1.95" x2="2.45" y2="-1.95" width="0.127" layer="21"/>
<wire x1="-2.45" y1="1.95" x2="-2.45" y2="-1.95" width="0.127" layer="21"/>
<wire x1="-2.45" y1="-1.95" x2="2.45" y2="-1.95" width="0.127" layer="21"/>
<circle x="-1.885" y="-1.29" radius="0.2" width="0.127" layer="21"/>
<smd name="2" x="-0.635" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="7" x="-0.635" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="1" x="-1.905" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="3" x="0.635" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="4" x="1.905" y="-2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="8" x="-1.905" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="6" x="0.635" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<smd name="5" x="1.905" y="2.95" dx="0.48" dy="1.6" layer="1"/>
<text x="-1.905" y="0.635" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.905" y="-0.635" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="1.7" y1="1.95" x2="2.11" y2="2.95" layer="51"/>
<rectangle x1="0.43" y1="1.95" x2="0.84" y2="2.95" layer="51"/>
<rectangle x1="-0.84" y1="1.95" x2="-0.43" y2="2.95" layer="51"/>
<rectangle x1="-2.11" y1="1.95" x2="-1.7" y2="2.95" layer="51"/>
<rectangle x1="1.7" y1="-2.95" x2="2.11" y2="-1.95" layer="51"/>
<rectangle x1="0.43" y1="-2.95" x2="0.84" y2="-1.95" layer="51"/>
<rectangle x1="-0.84" y1="-2.95" x2="-0.43" y2="-1.95" layer="51"/>
<rectangle x1="-2.11" y1="-2.95" x2="-1.7" y2="-1.95" layer="51"/>
</package>
<package name="SON8_3_0.65">
<wire x1="-1.5" y1="1.3" x2="-1.5" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-1.5" y1="-1.5" x2="1.5" y2="-1.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="-1.3" x2="1.5" y2="1.25" width="0.127" layer="51"/>
<wire x1="1.5" y1="1.5" x2="-1.5" y2="1.5" width="0.127" layer="21"/>
<pad name="P" x="0" y="0.05" drill="0.9" diameter="1.3" shape="square"/>
<smd name="1" x="-1.8" y="0.975" dx="1.4" dy="0.35" layer="1"/>
<smd name="2" x="-1.8" y="0.325" dx="1.4" dy="0.35" layer="1"/>
<smd name="3" x="-1.8" y="-0.325" dx="1.4" dy="0.35" layer="1"/>
<smd name="4" x="-1.8" y="-0.925" dx="1.4" dy="0.35" layer="1"/>
<text x="-1.905" y="2.54" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-1.5" y1="0.805" x2="-1.1" y2="1.145" layer="51"/>
<rectangle x1="-0.9" y1="1" x2="-0.4" y2="1.5" layer="21"/>
<smd name="5" x="1.8" y="-0.975" dx="1.4" dy="0.35" layer="1" rot="R180"/>
<smd name="6" x="1.8" y="-0.325" dx="1.4" dy="0.35" layer="1" rot="R180"/>
<smd name="7" x="1.8" y="0.325" dx="1.4" dy="0.35" layer="1" rot="R180"/>
<smd name="8" x="1.8" y="0.925" dx="1.4" dy="0.35" layer="1" rot="R180"/>
<wire x1="-1.5" y1="1.5" x2="-1.5" y2="1.3" width="0.127" layer="21"/>
<wire x1="1.5" y1="1.5" x2="1.5" y2="1.25" width="0.127" layer="21"/>
<wire x1="1.5" y1="-1.5" x2="1.5" y2="-1.3" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.5" x2="-1.5" y2="-1.25" width="0.127" layer="21"/>
<rectangle x1="-1.5" y1="0.155" x2="-1.1" y2="0.495" layer="51"/>
<rectangle x1="-1.5" y1="-0.495" x2="-1.1" y2="-0.155" layer="51"/>
<rectangle x1="-1.5" y1="-1.095" x2="-1.1" y2="-0.755" layer="51"/>
<rectangle x1="1.1" y1="-1.145" x2="1.5" y2="-0.805" layer="51" rot="R180"/>
<rectangle x1="1.1" y1="-0.495" x2="1.5" y2="-0.155" layer="51" rot="R180"/>
<rectangle x1="1.1" y1="0.155" x2="1.5" y2="0.495" layer="51" rot="R180"/>
<rectangle x1="1.1" y1="0.755" x2="1.5" y2="1.095" layer="51" rot="R180"/>
</package>
<package name="MSOP8-PAD">
<wire x1="-1.5" y1="1.5" x2="1.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="1.5" x2="1.5" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-1.5" y1="1.5" x2="-1.5" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.5" x2="1.5" y2="-1.5" width="0.127" layer="21"/>
<circle x="-1.235" y="-1.24" radius="0.1" width="0.127" layer="21"/>
<pad name="PAD" x="0" y="0" drill="1.3" diameter="2" shape="square"/>
<smd name="1" x="-0.975" y="-2.4" dx="0.4" dy="1.2" layer="1"/>
<smd name="2" x="-0.325" y="-2.4" dx="0.4" dy="1.2" layer="1"/>
<smd name="3" x="0.325" y="-2.4" dx="0.4" dy="1.2" layer="1"/>
<smd name="4" x="0.975" y="-2.4" dx="0.4" dy="1.2" layer="1"/>
<smd name="5" x="0.975" y="2.4" dx="0.4" dy="1.2" layer="1" rot="R180"/>
<smd name="6" x="0.325" y="2.4" dx="0.4" dy="1.2" layer="1" rot="R180"/>
<smd name="7" x="-0.325" y="2.4" dx="0.4" dy="1.2" layer="1" rot="R180"/>
<smd name="8" x="-0.975" y="2.4" dx="0.4" dy="1.2" layer="1" rot="R180"/>
<text x="2.54" y="-2.54" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="3.81" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.1325" y1="-2.45" x2="-0.8175" y2="-1.5" layer="51"/>
<rectangle x1="-0.4825" y1="-2.45" x2="-0.1675" y2="-1.5" layer="51"/>
<rectangle x1="0.1675" y1="-2.45" x2="0.4825" y2="-1.5" layer="51"/>
<rectangle x1="0.8175" y1="-2.45" x2="1.1325" y2="-1.5" layer="51"/>
<rectangle x1="0.8175" y1="1.5" x2="1.1325" y2="2.45" layer="51" rot="R180"/>
<rectangle x1="0.1675" y1="1.5" x2="0.4825" y2="2.45" layer="51" rot="R180"/>
<rectangle x1="-0.4825" y1="1.5" x2="-0.1675" y2="2.45" layer="51" rot="R180"/>
<rectangle x1="-1.1325" y1="1.5" x2="-0.8175" y2="2.45" layer="51" rot="R180"/>
</package>
<package name="SOT23-6">
<wire x1="-1.45" y1="0.65" x2="1.45" y2="0.65" width="0.127" layer="21"/>
<wire x1="1.45" y1="0.65" x2="1.45" y2="-0.65" width="0.127" layer="21"/>
<wire x1="1.45" y1="-0.65" x2="-1.45" y2="-0.65" width="0.127" layer="21"/>
<wire x1="-1.45" y1="-0.65" x2="-1.45" y2="0.65" width="0.127" layer="21"/>
<smd name="1" x="-0.95" y="-1.35" dx="0.6" dy="1.05" layer="1"/>
<smd name="2" x="0" y="-1.35" dx="0.6" dy="1.05" layer="1"/>
<smd name="3" x="0.95" y="-1.35" dx="0.6" dy="1.05" layer="1"/>
<smd name="4" x="0.95" y="1.35" dx="0.6" dy="1.05" layer="1"/>
<smd name="6" x="-0.95" y="1.35" dx="0.6" dy="1.05" layer="1"/>
<smd name="5" x="0" y="1.35" dx="0.6" dy="1.05" layer="1"/>
<text x="-1.905" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="2.54" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.2" y1="-1.5" x2="-0.7" y2="-0.825" layer="51" rot="R180"/>
<rectangle x1="-0.25" y1="-1.5" x2="0.25" y2="-0.825" layer="51" rot="R180"/>
<rectangle x1="0.7" y1="-1.5" x2="1.2" y2="-0.825" layer="51" rot="R180"/>
<rectangle x1="0.7" y1="0.825" x2="1.2" y2="1.5" layer="51"/>
<rectangle x1="-1.2" y1="0.825" x2="-0.7" y2="1.5" layer="51"/>
<rectangle x1="-1.45" y1="-0.65" x2="-0.5" y2="0" layer="21"/>
<rectangle x1="-0.25" y1="0.825" x2="0.25" y2="1.5" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="UCC27517">
<wire x1="-7.62" y1="10.16" x2="-7.62" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-10.16" x2="7.62" y2="-10.16" width="0.254" layer="94"/>
<wire x1="7.62" y1="-10.16" x2="7.62" y2="10.16" width="0.254" layer="94"/>
<wire x1="7.62" y1="10.16" x2="-7.62" y2="10.16" width="0.254" layer="94"/>
<text x="-7.62" y="10.668" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-12.7" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="OUT" x="10.16" y="0" length="short" rot="R180"/>
<pin name="VDD" x="-10.16" y="7.62" length="short"/>
<pin name="IN-" x="-10.16" y="-7.62" length="short"/>
<pin name="IN+" x="-10.16" y="-5.08" length="short"/>
<pin name="GND" x="-10.16" y="0" length="short"/>
</symbol>
<symbol name="UCC27524">
<wire x1="-10.16" y1="15.24" x2="-10.16" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-12.7" x2="10.16" y2="-12.7" width="0.254" layer="94"/>
<wire x1="10.16" y1="-12.7" x2="10.16" y2="15.24" width="0.254" layer="94"/>
<wire x1="10.16" y1="15.24" x2="-10.16" y2="15.24" width="0.254" layer="94"/>
<text x="-10.16" y="15.748" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-10.16" y="-15.24" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="OUTA" x="12.7" y="7.62" length="short" rot="R180"/>
<pin name="ENB" x="-12.7" y="-5.08" length="short"/>
<pin name="OUTB" x="12.7" y="-5.08" length="short" rot="R180"/>
<pin name="VDD" x="-12.7" y="12.7" length="short"/>
<pin name="INA" x="-12.7" y="-7.62" length="short"/>
<pin name="ENA" x="-12.7" y="-2.54" length="short"/>
<pin name="INB" x="-12.7" y="-10.16" length="short"/>
<pin name="GND" x="-12.7" y="5.08" length="short"/>
</symbol>
<symbol name="TPD2S017">
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="-7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<text x="-7.62" y="5.588" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="2.54" y="-7.62" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="I1" x="10.16" y="-2.54" length="short" swaplevel="1" rot="R180"/>
<pin name="I2" x="10.16" y="2.54" length="short" swaplevel="1" rot="R180"/>
<pin name="V-" x="0" y="-7.62" length="short" rot="R90"/>
<pin name="O1" x="-10.16" y="-2.54" length="short" swaplevel="2"/>
<pin name="O2" x="-10.16" y="2.54" length="short" swaplevel="2"/>
<pin name="V+" x="0" y="7.62" length="short" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="UCC27517" prefix="U">
<gates>
<gate name="G$1" symbol="UCC27517" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23-5">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="IN+" pad="3"/>
<connect gate="G$1" pin="IN-" pad="4"/>
<connect gate="G$1" pin="OUT" pad="5"/>
<connect gate="G$1" pin="VDD" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="UCC27524" prefix="U">
<gates>
<gate name="G$1" symbol="UCC27524" x="0" y="0"/>
</gates>
<devices>
<device name="D" package="SOP8">
<connects>
<connect gate="G$1" pin="ENA" pad="1"/>
<connect gate="G$1" pin="ENB" pad="8"/>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="INA" pad="2"/>
<connect gate="G$1" pin="INB" pad="4"/>
<connect gate="G$1" pin="OUTA" pad="7"/>
<connect gate="G$1" pin="OUTB" pad="5"/>
<connect gate="G$1" pin="VDD" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DSD" package="SON8_3_0.65">
<connects>
<connect gate="G$1" pin="ENA" pad="1"/>
<connect gate="G$1" pin="ENB" pad="8"/>
<connect gate="G$1" pin="GND" pad="3 P"/>
<connect gate="G$1" pin="INA" pad="2"/>
<connect gate="G$1" pin="INB" pad="4"/>
<connect gate="G$1" pin="OUTA" pad="7"/>
<connect gate="G$1" pin="OUTB" pad="5"/>
<connect gate="G$1" pin="VDD" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DGN" package="MSOP8-PAD">
<connects>
<connect gate="G$1" pin="ENA" pad="1"/>
<connect gate="G$1" pin="ENB" pad="8"/>
<connect gate="G$1" pin="GND" pad="3 PAD"/>
<connect gate="G$1" pin="INA" pad="2"/>
<connect gate="G$1" pin="INB" pad="4"/>
<connect gate="G$1" pin="OUTA" pad="7"/>
<connect gate="G$1" pin="OUTB" pad="5"/>
<connect gate="G$1" pin="VDD" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TPD2S017" prefix="U">
<gates>
<gate name="G$1" symbol="TPD2S017" x="0" y="0" swaplevel="2"/>
</gates>
<devices>
<device name="" package="SOT23-6">
<connects>
<connect gate="G$1" pin="I1" pad="3"/>
<connect gate="G$1" pin="I2" pad="4"/>
<connect gate="G$1" pin="O1" pad="1"/>
<connect gate="G$1" pin="O2" pad="6"/>
<connect gate="G$1" pin="V+" pad="5"/>
<connect gate="G$1" pin="V-" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-package">
<packages>
<package name="PAD">
<smd name="1" x="0" y="0" dx="1" dy="1" layer="1" roundness="100"/>
<text x="0.635" y="-0.508" size="1.016" layer="21" font="vector" ratio="13">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="PAD">
<wire x1="-1.016" y1="0" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<circle x="0" y="0" radius="1.016" width="0.1524" layer="94"/>
<text x="1.524" y="0.889" size="1.778" layer="94" font="vector" rot="MR180">&gt;VALUE</text>
<pin name="P$1" x="-2.54" y="0" visible="off" length="point" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PAD" prefix="P" uservalue="yes">
<gates>
<gate name="G$1" symbol="PAD" x="2.54" y="0"/>
</gates>
<devices>
<device name="" package="PAD">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-National">
<description>National Semiconductor</description>
<packages>
<package name="MSOP10-PAD">
<wire x1="-1.5" y1="1.5" x2="1.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="1.5" x2="1.5" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-1.5" y1="1.5" x2="-1.5" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.5" x2="1.5" y2="-1.5" width="0.127" layer="21"/>
<circle x="-1.235" y="-1.24" radius="0.1" width="0.127" layer="21"/>
<smd name="1" x="-1" y="-2.4" dx="0.25" dy="1.2" layer="1"/>
<text x="2.54" y="-2.54" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="3.81" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.11" y1="-2.45" x2="-0.89" y2="-1.5" layer="51"/>
<smd name="2" x="-0.5" y="-2.4" dx="0.25" dy="1.2" layer="1"/>
<rectangle x1="-0.61" y1="-2.45" x2="-0.39" y2="-1.5" layer="51"/>
<smd name="3" x="0" y="-2.4" dx="0.25" dy="1.2" layer="1"/>
<rectangle x1="-0.11" y1="-2.45" x2="0.11" y2="-1.5" layer="51"/>
<smd name="4" x="0.5" y="-2.4" dx="0.25" dy="1.2" layer="1"/>
<rectangle x1="0.39" y1="-2.45" x2="0.61" y2="-1.5" layer="51"/>
<smd name="5" x="1" y="-2.4" dx="0.25" dy="1.2" layer="1"/>
<rectangle x1="0.89" y1="-2.45" x2="1.11" y2="-1.5" layer="51"/>
<smd name="6" x="1" y="2.4" dx="0.25" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="0.89" y1="1.5" x2="1.11" y2="2.45" layer="51" rot="R180"/>
<smd name="7" x="0.5" y="2.4" dx="0.25" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="0.39" y1="1.5" x2="0.61" y2="2.45" layer="51" rot="R180"/>
<smd name="8" x="0" y="2.4" dx="0.25" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="-0.11" y1="1.5" x2="0.11" y2="2.45" layer="51" rot="R180"/>
<smd name="9" x="-0.5" y="2.4" dx="0.25" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="-0.61" y1="1.5" x2="-0.39" y2="2.45" layer="51" rot="R180"/>
<smd name="10" x="-1" y="2.4" dx="0.25" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="-1.11" y1="1.5" x2="-0.89" y2="2.45" layer="51" rot="R180"/>
<pad name="PAD" x="0" y="0" drill="1.3" diameter="1.9" shape="square"/>
</package>
</packages>
<symbols>
<symbol name="LM25011">
<text x="-10.16" y="17.78" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-10.16" y="15.748" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<wire x1="-10.16" y1="15.24" x2="-10.16" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-15.24" x2="10.16" y2="-15.24" width="0.254" layer="94"/>
<wire x1="10.16" y1="-15.24" x2="10.16" y2="15.24" width="0.254" layer="94"/>
<wire x1="10.16" y1="15.24" x2="-10.16" y2="15.24" width="0.254" layer="94"/>
<pin name="RT" x="-12.7" y="0" length="short"/>
<pin name="VIN" x="-12.7" y="12.7" length="short"/>
<pin name="PGD" x="-12.7" y="-5.08" length="short"/>
<pin name="SS" x="-12.7" y="-12.7" length="short"/>
<pin name="SGND" x="0" y="-17.78" length="short" rot="R90"/>
<pin name="SW" x="12.7" y="7.62" length="short" rot="R180"/>
<pin name="CS" x="12.7" y="2.54" length="short" rot="R180"/>
<pin name="BST" x="12.7" y="12.7" length="short" rot="R180"/>
<pin name="CSG" x="12.7" y="-5.08" length="short" rot="R180"/>
<pin name="FB" x="12.7" y="-12.7" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="LM25011" prefix="U">
<gates>
<gate name="G$1" symbol="LM25011" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MSOP10-PAD">
<connects>
<connect gate="G$1" pin="BST" pad="6"/>
<connect gate="G$1" pin="CS" pad="8"/>
<connect gate="G$1" pin="CSG" pad="9"/>
<connect gate="G$1" pin="FB" pad="10"/>
<connect gate="G$1" pin="PGD" pad="3"/>
<connect gate="G$1" pin="RT" pad="2"/>
<connect gate="G$1" pin="SGND" pad="5 PAD"/>
<connect gate="G$1" pin="SS" pad="4"/>
<connect gate="G$1" pin="SW" pad="7"/>
<connect gate="G$1" pin="VIN" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-Microchip">
<packages>
<package name="SC70-6">
<wire x1="-1" y1="0.625" x2="1" y2="0.625" width="0.127" layer="21"/>
<wire x1="1" y1="0.625" x2="1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="1" y1="-0.625" x2="-1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.625" x2="-1" y2="0.625" width="0.127" layer="21"/>
<smd name="6" x="-0.65" y="1.15" dx="0.3" dy="0.7" layer="1"/>
<smd name="4" x="0.65" y="1.15" dx="0.3" dy="0.7" layer="1"/>
<smd name="5" x="0" y="1.15" dx="0.3" dy="0.7" layer="1"/>
<smd name="1" x="-0.65" y="-1.15" dx="0.3" dy="0.7" layer="1" rot="R180"/>
<smd name="2" x="0" y="-1.15" dx="0.3" dy="0.7" layer="1" rot="R180"/>
<smd name="3" x="0.65" y="-1.15" dx="0.3" dy="0.7" layer="1" rot="R180"/>
<text x="-1.524" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="2.286" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<rectangle x1="-1" y1="-0.625" x2="0" y2="0" layer="21"/>
<rectangle x1="-0.1125" y1="0.625" x2="0.1125" y2="1.05" layer="51"/>
<rectangle x1="0.5375" y1="0.625" x2="0.7625" y2="1.05" layer="51"/>
<rectangle x1="-0.7625" y1="0.625" x2="-0.5375" y2="1.05" layer="51"/>
<rectangle x1="-0.7625" y1="-1.05" x2="-0.5375" y2="-0.625" layer="51" rot="R180"/>
<rectangle x1="-0.1125" y1="-1.05" x2="0.1125" y2="-0.625" layer="51" rot="R180"/>
<rectangle x1="0.5375" y1="-1.05" x2="0.7625" y2="-0.625" layer="51" rot="R180"/>
</package>
<package name="SOT23-3">
<wire x1="-1.45" y1="0.6" x2="1.45" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.45" y1="0.6" x2="1.45" y2="-0.6" width="0.127" layer="21"/>
<wire x1="1.45" y1="-0.6" x2="-1.45" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.45" y1="-0.6" x2="-1.45" y2="0.6" width="0.127" layer="21"/>
<smd name="1" x="-0.95" y="-1.2" dx="0.6" dy="0.8" layer="1"/>
<smd name="2" x="0.95" y="-1.2" dx="0.6" dy="0.8" layer="1"/>
<smd name="3" x="0" y="1.2" dx="0.6" dy="0.8" layer="1"/>
<text x="-1.905" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="2.54" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.15" y1="-1.25" x2="-0.75" y2="-0.65" layer="51" rot="R180"/>
<rectangle x1="0.75" y1="-1.25" x2="1.15" y2="-0.65" layer="51" rot="R180"/>
<rectangle x1="-0.2" y1="0.65" x2="0.2" y2="1.25" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="TEMP-SENSOR">
<wire x1="-5.08" y1="7.62" x2="-5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="5.08" y2="7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="7.62" x2="-5.08" y2="7.62" width="0.254" layer="94"/>
<text x="-5.08" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-5.08" y="-7.62" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="GND" x="-7.62" y="-2.54" length="short"/>
<pin name="VDD" x="-7.62" y="5.08" length="short"/>
<pin name="VOUT" x="7.62" y="2.54" length="short" rot="R180"/>
</symbol>
<symbol name="REGULATOR">
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="-7.62" y2="5.08" width="0.254" layer="94"/>
<text x="-7.62" y="5.588" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="2.54" y="-7.62" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="GND" x="0" y="-7.62" length="short" rot="R90"/>
<pin name="VI" x="-10.16" y="2.54" length="short"/>
<pin name="VO" x="10.16" y="2.54" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MCP970*" prefix="U">
<gates>
<gate name="1" symbol="TEMP-SENSOR" x="0" y="0"/>
</gates>
<devices>
<device name="/LT" package="SC70-6">
<connects>
<connect gate="1" pin="GND" pad="2"/>
<connect gate="1" pin="VDD" pad="4"/>
<connect gate="1" pin="VOUT" pad="3"/>
</connects>
<technologies>
<technology name="0"/>
<technology name="0A"/>
<technology name="1"/>
<technology name="1A"/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MCP1700T-*" prefix="U">
<gates>
<gate name="G$1" symbol="REGULATOR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23-3">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="VI" pad="3"/>
<connect gate="G$1" pin="VO" pad="2"/>
</connects>
<technologies>
<technology name="25"/>
<technology name="33"/>
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
<text x="-1.397" y="0.762" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.397" y="-1.524" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
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
</devices>
</deviceset>
</devicesets>
</library>
<library name="Connector">
<packages>
<package name="PIN1X2">
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.127" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.127" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.127" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0.635" y1="1.27" x2="0" y2="0.635" width="0.127" layer="21"/>
<wire x1="0" y1="-0.635" x2="0.635" y2="-1.27" width="0.127" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-1.27" x2="0" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="1.905" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0" y1="-1.27" x2="0" y2="-0.635" width="0.127" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="1.27" width="0.127" layer="21"/>
<wire x1="-2.54" y1="1.27" x2="0" y2="1.27" width="0.127" layer="21"/>
<pad name="2" x="1.27" y="0" drill="1.3" shape="octagon"/>
<pad name="1" x="-1.27" y="0" drill="1.3" shape="square"/>
<text x="-2.54" y="1.524" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="-2.286" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="PIN1X2">
<wire x1="-1.27" y1="-2.54" x2="3.81" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-2.54" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="5.08" x2="-1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="-1.27" y2="-2.54" width="0.4064" layer="94"/>
<text x="-1.27" y="5.715" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-1.27" y="-5.08" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PIN1X2" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="PIN1X2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="PIN1X2">
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
<library name="ic-AD">
<description>Analog Devices</description>
<packages>
<package name="SC70-3">
<wire x1="-1" y1="0.625" x2="1" y2="0.625" width="0.127" layer="21"/>
<wire x1="1" y1="0.625" x2="1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="1" y1="-0.625" x2="-1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.625" x2="-1" y2="0.625" width="0.127" layer="21"/>
<smd name="3" x="0" y="1.15" dx="0.3" dy="0.7" layer="1"/>
<smd name="1" x="-0.65" y="-1.15" dx="0.3" dy="0.7" layer="1" rot="R180"/>
<smd name="2" x="0.65" y="-1.15" dx="0.3" dy="0.7" layer="1" rot="R180"/>
<text x="-1.524" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="2.286" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.1125" y1="0.625" x2="0.1125" y2="1.05" layer="51"/>
<rectangle x1="-0.7625" y1="-1.05" x2="-0.5375" y2="-0.625" layer="51" rot="R180"/>
<rectangle x1="0.5375" y1="-1.05" x2="0.7625" y2="-0.625" layer="51" rot="R180"/>
</package>
</packages>
<symbols>
<symbol name="SHUNT-REGULATOR-2">
<wire x1="1.27" y1="-1.27" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="-0.635" y2="0" width="0.254" layer="94"/>
<wire x1="-0.635" y1="0" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.651" y2="1.651" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.651" y2="0.889" width="0.254" layer="94"/>
<text x="2.54" y="0" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="2.54" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="A" x="0" y="-2.54" visible="pad" length="point" direction="pas" rot="R90"/>
<pin name="K" x="0" y="2.54" visible="pad" length="point" direction="pas" rot="R270"/>
<wire x1="0" y1="-2.54" x2="0" y2="2.54" width="0.1524" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ADR504*" prefix="U">
<gates>
<gate name="G$1" symbol="SHUNT-REGULATOR-2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SC70-3">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="K" pad="1"/>
</connects>
<technologies>
<technology name="0"/>
<technology name="1"/>
<technology name="3"/>
<technology name="4"/>
<technology name="5"/>
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
<part name="Q2" library="Transistor" deviceset="MOS-P-*" device="SOP8" value="SI4483ADY"/>
<part name="R4" library="Passive" deviceset="R" device="1005" value="33k"/>
<part name="Q1" library="Transistor" deviceset="MOS-N-*" device="SOT23"/>
<part name="GND18" library="supply1" deviceset="GND" device=""/>
<part name="GND19" library="supply1" deviceset="GND" device=""/>
<part name="R5" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="+P9" library="supply1" deviceset="+3V3" device=""/>
<part name="R6" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="CN1" library="con-Molex" deviceset="43045-0800" device=""/>
<part name="GND20" library="supply1" deviceset="GND" device=""/>
<part name="F1" library="Passive" deviceset="F" device="3216" value="8"/>
<part name="C2" library="Passive" deviceset="CPOL" device="3.5-8" value="220u"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="D2" library="Diode" deviceset="ZENER-*" device="DO-214AC" value="SMAJ22"/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="R2" library="Passive" deviceset="R" device="1608" value="100k"/>
<part name="R3" library="Passive" deviceset="R" device="1608" value="10k"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="C4" library="Passive" deviceset="C" device="1005" value="10n"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="R7" library="Passive" deviceset="R" device="1608" value="100k"/>
<part name="R8" library="Passive" deviceset="R" device="1608" value="10k"/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="C6" library="Passive" deviceset="C" device="1005" value="10n"/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="U3" library="ic-ATMEL" deviceset="ATXMEGA*A4U" device="-MH" technology="32" value="ATXMEGA32A4U-MH"/>
<part name="C13" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C14" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C15" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C11" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C12" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="+P1" library="supply1" deviceset="+3V3" device=""/>
<part name="+P2" library="supply1" deviceset="+3V3" device=""/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="+P3" library="supply1" deviceset="+3V3" device=""/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="R17" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R18" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="L2" library="ProjectOnly" deviceset="COIL" device="-V" value="200u"/>
<part name="Q4" library="Transistor" deviceset="MOS-N-*" device="TO-220F" value="SIHP12N60E"/>
<part name="D5" library="Diode" deviceset="DIODE-*" device="TO-220F" value="15ETH06FP"/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="R33" library="Passive" deviceset="R" device="1608" value="1.5M"/>
<part name="R34" library="Passive" deviceset="R" device="1608" value="10k"/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="U8" library="Opamp" deviceset="SINGLE-OPAMP-ISO" device="-SOT23"/>
<part name="C20" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="+P4" library="supply1" deviceset="+3V3" device=""/>
<part name="GND15" library="supply1" deviceset="GND" device=""/>
<part name="U7" library="Opamp" deviceset="SINGLE-OPAMP-ISO" device="-SOT23"/>
<part name="R31" library="Passive" deviceset="R" device="1608" value="10k"/>
<part name="R32" library="Passive" deviceset="R" device="1608" value="10k"/>
<part name="R36" library="Passive" deviceset="R" device="1608" value="500k"/>
<part name="R35" library="Passive" deviceset="R" device="1608" value="500k"/>
<part name="R30" library="ProjectOnly" deviceset="FC4L" device="" value="2m"/>
<part name="R37" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="C19" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="+P5" library="supply1" deviceset="+3V3" device=""/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="P+3" library="supply1" deviceset="VCC/1" device=""/>
<part name="P+1" library="supply1" deviceset="VCC/2" device=""/>
<part name="P+2" library="supply1" deviceset="VCC/2" device=""/>
<part name="C9" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C7" library="Passive" deviceset="C" device="3216" value="22u"/>
<part name="C8" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND22" library="supply1" deviceset="GND" device=""/>
<part name="R12" library="Passive" deviceset="R" device="2012" value="0.1"/>
<part name="R13" library="Passive" deviceset="R" device="1608" value="24k"/>
<part name="R14" library="Passive" deviceset="R" device="1608" value="7.5k"/>
<part name="GND23" library="supply1" deviceset="GND" device=""/>
<part name="D3" library="Diode" deviceset="SBD-*" device="SDO123W" value="PMEG4030ER"/>
<part name="L1" library="Passive" deviceset="L" device="40" value="10u"/>
<part name="C10" library="Passive" deviceset="C" device="3216" value="22u"/>
<part name="GND25" library="supply1" deviceset="GND" device=""/>
<part name="+P6" library="supply1" deviceset="+9V" device=""/>
<part name="CN2" library="con-Hirose" deviceset="UX60S" device="C-MB-5ST"/>
<part name="GND27" library="supply1" deviceset="GND" device=""/>
<part name="GND28" library="supply1" deviceset="GND" device=""/>
<part name="R15" library="Passive" deviceset="R" device="1005" value="22"/>
<part name="R16" library="Passive" deviceset="R" device="1005" value="22"/>
<part name="GND26" library="supply1" deviceset="GND" device=""/>
<part name="Q5" library="Transistor" deviceset="IGBT-N" device="TO-3P" value="FGA180N33ATD"/>
<part name="Q6" library="Transistor" deviceset="IGBT-N" device="TO-3P" value="FGA180N33ATD"/>
<part name="GND29" library="supply1" deviceset="GND" device=""/>
<part name="GND30" library="supply1" deviceset="GND" device=""/>
<part name="CN5" library="con-Molex" deviceset="5569-02A2" device="" value="Straight"/>
<part name="CN6" library="con-Molex" deviceset="5569-02A2" device="" value="Chip"/>
<part name="U6" library="ic-TI" deviceset="UCC27517" device=""/>
<part name="R28" library="Passive" deviceset="R" device="3216" value="47"/>
<part name="R29" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND31" library="supply1" deviceset="GND" device=""/>
<part name="+P7" library="supply1" deviceset="+9V" device=""/>
<part name="GND32" library="supply1" deviceset="GND" device=""/>
<part name="R27" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND33" library="supply1" deviceset="GND" device=""/>
<part name="GND34" library="supply1" deviceset="GND" device=""/>
<part name="C18" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="R40" library="Passive" deviceset="R" device="3216" value="47"/>
<part name="R43" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND35" library="supply1" deviceset="GND" device=""/>
<part name="+P8" library="supply1" deviceset="+9V" device=""/>
<part name="GND36" library="supply1" deviceset="GND" device=""/>
<part name="R39" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND37" library="supply1" deviceset="GND" device=""/>
<part name="C23" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="CN4" library="ProjectOnly" deviceset="TERMINAL2P" device="-V-SL" value="Capacitor"/>
<part name="GND39" library="supply1" deviceset="GND" device=""/>
<part name="D1" library="Diode" deviceset="ZENER-*" device="DO-214AC" value="SMAJ22"/>
<part name="GND42" library="supply1" deviceset="GND" device=""/>
<part name="P2" library="ic-package" deviceset="PAD" device="" value="CLK"/>
<part name="P3" library="ic-package" deviceset="PAD" device="" value="DAT"/>
<part name="P1" library="ic-package" deviceset="PAD" device="" value="VCC"/>
<part name="P4" library="ic-package" deviceset="PAD" device="" value="GND"/>
<part name="H1" library="ProjectOnly" deviceset="SSB-00*" device="3"/>
<part name="H2" library="ProjectOnly" deviceset="SSB-00*" device="3"/>
<part name="U1" library="ic-National" deviceset="LM25011" device=""/>
<part name="R11" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="GND21" library="supply1" deviceset="GND" device=""/>
<part name="GND17" library="supply1" deviceset="GND" device=""/>
<part name="R10" library="Passive" deviceset="R" device="1005"/>
<part name="+P10" library="supply1" deviceset="VBAT" device=""/>
<part name="+P11" library="supply1" deviceset="VBAT" device=""/>
<part name="R41" library="Passive" deviceset="R" device="3216" value="47"/>
<part name="R42" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="R38" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND40" library="supply1" deviceset="GND" device=""/>
<part name="U9" library="ic-TI" deviceset="UCC27524" device="DGN"/>
<part name="+P12" library="supply1" deviceset="+9V" device=""/>
<part name="C21" library="Passive" deviceset="C" device="3216" value="22u"/>
<part name="R19" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="R20" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="C5" library="Passive" deviceset="C" device="3225" value="22u"/>
<part name="GND24" library="supply1" deviceset="GND" device=""/>
<part name="FB1" library="Passive" deviceset="FB" device="1608"/>
<part name="C1" library="Passive" deviceset="C" device="2012" value="22u"/>
<part name="GND38" library="supply1" deviceset="GND" device=""/>
<part name="C22" library="Passive" deviceset="C" device="3216" value="22n"/>
<part name="GND41" library="supply1" deviceset="GND" device=""/>
<part name="HT1" library="ProjectOnly" deviceset="HEATSINK" device="-271"/>
<part name="D7" library="Diode" deviceset="ZENER-*" device="DO-214AC" value="SMAJ300"/>
<part name="GND43" library="supply1" deviceset="GND" device=""/>
<part name="U4" library="ic-Microchip" deviceset="MCP970*" device="/LT" technology="1"/>
<part name="C16" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="+P13" library="supply1" deviceset="+3V3" device=""/>
<part name="GND44" library="supply1" deviceset="GND" device=""/>
<part name="D8" library="Diode" deviceset="DIODE-*" device="DO-214AB" value="ES3G"/>
<part name="D9" library="Diode" deviceset="DIODE-*" device="DO-214AB" value="ES3G"/>
<part name="LED1" library="Opto" deviceset="LED" device="1608"/>
<part name="LED2" library="Opto" deviceset="LED" device="1608"/>
<part name="R22" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="R23" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="GND45" library="supply1" deviceset="GND" device=""/>
<part name="GND46" library="supply1" deviceset="GND" device=""/>
<part name="LOGO1" library="ProjectOnly" deviceset="LOGO-876_SMALL" device=""/>
<part name="LED3" library="Opto" deviceset="LED" device="1608"/>
<part name="R24" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="GND48" library="supply1" deviceset="GND" device=""/>
<part name="CN3" library="Connector" deviceset="PIN1X2" device="" value="Fan"/>
<part name="Q3" library="Transistor" deviceset="MOS-N-*" device="SOT23"/>
<part name="D4" library="Diode" deviceset="SBD-*" device="SDO123W" value="PMEG4030ER"/>
<part name="+P14" library="supply1" deviceset="+9V" device=""/>
<part name="GND49" library="supply1" deviceset="GND" device=""/>
<part name="R25" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="R26" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="LOGO2" library="ProjectOnly" deviceset="LOGO-HV" device=""/>
<part name="D6" library="Diode" deviceset="DIODE-*" device="1608" value="CDSU101A"/>
<part name="+P15" library="supply1" deviceset="+3V3" device=""/>
<part name="U5" library="ic-AD" deviceset="ADR504*" device="" technology="1"/>
<part name="C17" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="R21" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="GND50" library="supply1" deviceset="GND" device=""/>
<part name="GND51" library="supply1" deviceset="GND" device=""/>
<part name="U2" library="ic-TI" deviceset="TPD2S017" device="" value="IP4234CZ6"/>
<part name="C3" library="Passive" deviceset="CPOL" device="3.5-8" value="220u"/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="R1" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="R9" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="U10" library="ic-Microchip" deviceset="MCP1700T-*" device="" technology="33"/>
<part name="GND47" library="supply1" deviceset="GND" device=""/>
<part name="C24" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="C25" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="GND52" library="supply1" deviceset="GND" device=""/>
<part name="GND53" library="supply1" deviceset="GND" device=""/>
<part name="D10" library="Diode" deviceset="DIODE-*" device="1608" value="CDSU101A"/>
<part name="+P16" library="supply1" deviceset="+3V3" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="0" y1="0" x2="33.02" y2="0" width="0.1524" layer="97"/>
<wire x1="33.02" y1="0" x2="53.34" y2="0" width="0.1524" layer="97"/>
<wire x1="53.34" y1="0" x2="73.66" y2="0" width="0.1524" layer="97"/>
<wire x1="73.66" y1="0" x2="99.06" y2="0" width="0.1524" layer="97"/>
<wire x1="0" y1="0" x2="0" y2="7.62" width="0.1524" layer="97"/>
<text x="2.54" y="5.08" size="1.778" layer="97" font="vector" align="center-left">KIKS2013</text>
<text x="2.54" y="2.54" size="1.778" layer="97" font="vector" align="center-left">Gen.5 Kicker Board</text>
<wire x1="0" y1="7.62" x2="0" y2="254" width="0.1524" layer="97"/>
<wire x1="0" y1="7.62" x2="33.02" y2="7.62" width="0.1524" layer="97"/>
<wire x1="33.02" y1="7.62" x2="53.34" y2="7.62" width="0.1524" layer="97"/>
<wire x1="53.34" y1="7.62" x2="53.34" y2="0" width="0.1524" layer="97"/>
<wire x1="53.34" y1="7.62" x2="73.66" y2="7.62" width="0.1524" layer="97"/>
<wire x1="73.66" y1="7.62" x2="99.06" y2="7.62" width="0.1524" layer="97"/>
<wire x1="99.06" y1="7.62" x2="99.06" y2="0" width="0.1524" layer="97"/>
<text x="76.2" y="2.54" size="1.778" layer="97" font="vector" align="center-left">FUJII NAOMICHI</text>
<text x="76.2" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Schemed by</text>
<text x="55.88" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Date</text>
<text x="55.88" y="2.54" size="1.778" layer="97" font="vector" align="center-left">2012/12/03</text>
<wire x1="73.66" y1="0" x2="73.66" y2="7.62" width="0.1524" layer="97"/>
<wire x1="99.06" y1="0" x2="406.4" y2="0" width="0.1524" layer="97"/>
<wire x1="406.4" y1="254" x2="406.4" y2="0" width="0.1524" layer="97"/>
<wire x1="0" y1="254" x2="406.4" y2="254" width="0.1524" layer="97"/>
<text x="20.32" y="45.72" size="1.778" layer="97">ベースボードから</text>
<text x="292.1" y="127" size="1.778" layer="97">電流センスが必要だったら実装する
応答性が求められるのでディスクリート</text>
<text x="99.06" y="101.6" size="1.778" layer="97">10.5Vくらい</text>
<wire x1="33.02" y1="7.62" x2="33.02" y2="0" width="0.1524" layer="97"/>
<text x="35.56" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Revision A</text>
</plain>
<instances>
<instance part="Q2" gate="G$1" x="152.4" y="40.64" rot="MR90"/>
<instance part="R4" gate="G$1" x="144.78" y="35.56" rot="R90"/>
<instance part="Q1" gate="G$1" x="149.86" y="20.32" rot="MR0"/>
<instance part="GND18" gate="1" x="149.86" y="10.16"/>
<instance part="GND19" gate="1" x="48.26" y="20.32"/>
<instance part="R5" gate="G$1" x="160.02" y="12.7"/>
<instance part="+P9" gate="1" x="7.62" y="27.94" rot="MR270"/>
<instance part="R6" gate="G$1" x="165.1" y="17.78"/>
<instance part="CN1" gate="G$1" x="40.64" y="27.94"/>
<instance part="GND20" gate="1" x="30.48" y="20.32"/>
<instance part="F1" gate="G$1" x="198.12" y="40.64"/>
<instance part="C2" gate="G$1" x="76.2" y="30.48"/>
<instance part="GND1" gate="1" x="76.2" y="25.4"/>
<instance part="D2" gate="G$1" x="226.06" y="33.02" rot="R90"/>
<instance part="GND2" gate="1" x="226.06" y="25.4"/>
<instance part="R2" gate="G$1" x="129.54" y="33.02" rot="R90"/>
<instance part="R3" gate="G$1" x="129.54" y="20.32" rot="R90"/>
<instance part="GND3" gate="1" x="129.54" y="12.7"/>
<instance part="C4" gate="G$1" x="111.76" y="17.78"/>
<instance part="GND4" gate="1" x="111.76" y="12.7"/>
<instance part="R7" gate="G$1" x="236.22" y="33.02" rot="R90"/>
<instance part="R8" gate="G$1" x="236.22" y="20.32" rot="R90"/>
<instance part="GND5" gate="1" x="236.22" y="12.7"/>
<instance part="C6" gate="G$1" x="254" y="17.78"/>
<instance part="GND6" gate="1" x="254" y="12.7"/>
<instance part="U3" gate="G$1" x="177.8" y="109.22"/>
<instance part="C13" gate="G$1" x="127" y="109.22"/>
<instance part="C14" gate="G$1" x="134.62" y="109.22"/>
<instance part="C15" gate="G$1" x="142.24" y="109.22"/>
<instance part="C11" gate="G$1" x="124.46" y="132.08"/>
<instance part="C12" gate="G$1" x="134.62" y="132.08"/>
<instance part="GND9" gate="1" x="142.24" y="101.6"/>
<instance part="+P1" gate="1" x="119.38" y="116.84" rot="MR270"/>
<instance part="+P2" gate="1" x="116.84" y="139.7" rot="MR270"/>
<instance part="GND11" gate="1" x="134.62" y="124.46"/>
<instance part="+P3" gate="1" x="121.92" y="175.26"/>
<instance part="GND12" gate="1" x="121.92" y="152.4"/>
<instance part="R17" gate="G$1" x="132.08" y="170.18"/>
<instance part="R18" gate="G$1" x="132.08" y="154.94"/>
<instance part="L2" gate="G$1" x="271.78" y="203.2"/>
<instance part="Q4" gate="G$1" x="281.94" y="187.96"/>
<instance part="D5" gate="G$1" x="289.56" y="203.2"/>
<instance part="GND13" gate="1" x="281.94" y="160.02"/>
<instance part="R33" gate="G$1" x="322.58" y="236.22" rot="R90"/>
<instance part="R34" gate="G$1" x="322.58" y="223.52" rot="R90"/>
<instance part="GND14" gate="1" x="322.58" y="215.9"/>
<instance part="U8" gate="A" x="350.52" y="226.06"/>
<instance part="U8" gate="P" x="287.02" y="228.6"/>
<instance part="C20" gate="G$1" x="276.86" y="228.6"/>
<instance part="+P4" gate="1" x="287.02" y="241.3" rot="MR0"/>
<instance part="GND15" gate="1" x="287.02" y="220.98"/>
<instance part="U7" gate="A" x="314.96" y="149.86"/>
<instance part="R31" gate="G$1" x="297.18" y="154.94" rot="MR0"/>
<instance part="R32" gate="G$1" x="297.18" y="144.78" rot="MR0"/>
<instance part="R36" gate="G$1" x="312.42" y="139.7" rot="MR0"/>
<instance part="R35" gate="G$1" x="312.42" y="160.02" rot="MR0"/>
<instance part="R30" gate="G$1" x="284.48" y="172.72" rot="R90"/>
<instance part="R37" gate="G$1" x="332.74" y="228.6"/>
<instance part="U7" gate="P" x="261.62" y="228.6"/>
<instance part="C19" gate="G$1" x="251.46" y="228.6"/>
<instance part="+P5" gate="1" x="261.62" y="241.3" rot="MR0"/>
<instance part="GND16" gate="1" x="261.62" y="220.98"/>
<instance part="P+3" gate="G$1" x="185.42" y="45.72"/>
<instance part="P+1" gate="G$1" x="243.84" y="40.64" rot="R270"/>
<instance part="P+2" gate="G$1" x="259.08" y="203.2" rot="MR270"/>
<instance part="C9" gate="G$1" x="73.66" y="99.06" rot="R90"/>
<instance part="C7" gate="G$1" x="27.94" y="91.44"/>
<instance part="C8" gate="G$1" x="35.56" y="66.04"/>
<instance part="GND22" gate="1" x="27.94" y="86.36"/>
<instance part="R12" gate="G$1" x="71.12" y="86.36" rot="R90"/>
<instance part="R13" gate="G$1" x="96.52" y="88.9" rot="R90"/>
<instance part="R14" gate="G$1" x="96.52" y="76.2" rot="R90"/>
<instance part="GND23" gate="1" x="96.52" y="68.58"/>
<instance part="D3" gate="G$1" x="76.2" y="88.9"/>
<instance part="L1" gate="G$1" x="88.9" y="93.98"/>
<instance part="C10" gate="G$1" x="104.14" y="86.36"/>
<instance part="GND25" gate="1" x="104.14" y="81.28"/>
<instance part="+P6" gate="G$1" x="111.76" y="93.98" rot="R270"/>
<instance part="CN2" gate="G$1" x="15.24" y="134.62"/>
<instance part="GND27" gate="1" x="12.7" y="119.38"/>
<instance part="GND28" gate="1" x="38.1" y="124.46"/>
<instance part="R15" gate="G$1" x="60.96" y="137.16"/>
<instance part="R16" gate="G$1" x="66.04" y="132.08"/>
<instance part="GND26" gate="1" x="22.86" y="127"/>
<instance part="Q5" gate="G$1" x="360.68" y="157.48" smashed="yes">
<attribute name="NAME" x="365.76" y="157.48" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="365.76" y="162.56" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="Q6" gate="G$1" x="386.08" y="157.48" smashed="yes">
<attribute name="NAME" x="391.16" y="157.48" size="1.778" layer="95" font="vector"/>
</instance>
<instance part="GND29" gate="1" x="363.22" y="149.86"/>
<instance part="GND30" gate="1" x="388.62" y="149.86"/>
<instance part="CN5" gate="G$1" x="368.3" y="177.8" rot="MR180"/>
<instance part="CN6" gate="G$1" x="393.7" y="177.8" rot="MR180"/>
<instance part="U6" gate="G$1" x="248.92" y="180.34"/>
<instance part="R28" gate="G$1" x="266.7" y="180.34"/>
<instance part="R29" gate="G$1" x="271.78" y="175.26" rot="R90"/>
<instance part="GND31" gate="1" x="271.78" y="167.64"/>
<instance part="+P7" gate="G$1" x="226.06" y="187.96" rot="MR270"/>
<instance part="GND32" gate="1" x="233.68" y="177.8"/>
<instance part="R27" gate="G$1" x="226.06" y="170.18" rot="R90"/>
<instance part="GND33" gate="1" x="226.06" y="162.56"/>
<instance part="GND34" gate="1" x="236.22" y="170.18"/>
<instance part="C18" gate="G$1" x="233.68" y="182.88"/>
<instance part="R40" gate="G$1" x="347.98" y="104.14"/>
<instance part="R43" gate="G$1" x="363.22" y="99.06" rot="R90"/>
<instance part="GND35" gate="1" x="363.22" y="91.44"/>
<instance part="+P8" gate="G$1" x="289.56" y="109.22" rot="MR270"/>
<instance part="GND36" gate="1" x="297.18" y="99.06"/>
<instance part="R39" gate="G$1" x="309.88" y="81.28" rot="R90"/>
<instance part="GND37" gate="1" x="309.88" y="73.66"/>
<instance part="C23" gate="G$1" x="304.8" y="104.14"/>
<instance part="CN4" gate="G$1" x="337.82" y="190.5"/>
<instance part="GND39" gate="1" x="332.74" y="180.34"/>
<instance part="D1" gate="G$1" x="185.42" y="33.02" rot="R90"/>
<instance part="GND42" gate="1" x="185.42" y="25.4"/>
<instance part="P2" gate="G$1" x="116.84" y="165.1" rot="MR0"/>
<instance part="P3" gate="G$1" x="116.84" y="160.02" rot="MR0"/>
<instance part="P1" gate="G$1" x="116.84" y="170.18" rot="MR0"/>
<instance part="P4" gate="G$1" x="116.84" y="154.94" rot="MR0"/>
<instance part="H1" gate="G$1" x="355.6" y="12.7"/>
<instance part="H2" gate="G$1" x="370.84" y="12.7"/>
<instance part="U1" gate="G$1" x="53.34" y="86.36"/>
<instance part="R11" gate="G$1" x="38.1" y="93.98" rot="R90"/>
<instance part="GND10" gate="1" x="35.56" y="60.96"/>
<instance part="GND21" gate="1" x="53.34" y="66.04"/>
<instance part="GND17" gate="1" x="71.12" y="78.74"/>
<instance part="R10" gate="G$1" x="27.94" y="73.66"/>
<instance part="+P10" gate="G$1" x="129.54" y="45.72"/>
<instance part="+P11" gate="G$1" x="20.32" y="99.06" rot="MR270"/>
<instance part="R41" gate="G$1" x="347.98" y="91.44"/>
<instance part="R42" gate="G$1" x="355.6" y="86.36" rot="R90"/>
<instance part="GND8" gate="1" x="355.6" y="78.74"/>
<instance part="R38" gate="G$1" x="302.26" y="81.28" rot="R90"/>
<instance part="GND40" gate="1" x="302.26" y="73.66"/>
<instance part="U9" gate="G$1" x="327.66" y="96.52"/>
<instance part="+P12" gate="G$1" x="307.34" y="93.98" rot="MR270"/>
<instance part="C21" gate="G$1" x="297.18" y="104.14"/>
<instance part="R19" gate="G$1" x="213.36" y="83.82"/>
<instance part="R20" gate="G$1" x="213.36" y="81.28"/>
<instance part="C5" gate="G$1" x="208.28" y="33.02"/>
<instance part="GND24" gate="1" x="208.28" y="25.4"/>
<instance part="FB1" gate="G$1" x="22.86" y="27.94"/>
<instance part="C1" gate="G$1" x="15.24" y="20.32"/>
<instance part="GND38" gate="1" x="15.24" y="15.24"/>
<instance part="C22" gate="G$1" x="307.34" y="190.5"/>
<instance part="GND41" gate="1" x="307.34" y="180.34"/>
<instance part="HT1" gate="G$1" x="386.08" y="12.7"/>
<instance part="D7" gate="G$1" x="320.04" y="190.5" rot="R90"/>
<instance part="GND43" gate="1" x="320.04" y="180.34"/>
<instance part="U4" gate="1" x="127" y="203.2"/>
<instance part="C16" gate="G$1" x="111.76" y="203.2"/>
<instance part="+P13" gate="1" x="111.76" y="213.36"/>
<instance part="GND44" gate="1" x="111.76" y="198.12"/>
<instance part="D8" gate="G$1" x="358.14" y="177.8" rot="R90"/>
<instance part="D9" gate="G$1" x="383.54" y="177.8" rot="R90"/>
<instance part="LED1" gate="G$1" x="66.04" y="213.36"/>
<instance part="LED2" gate="G$1" x="78.74" y="213.36"/>
<instance part="R22" gate="G$1" x="66.04" y="205.74" rot="R90"/>
<instance part="R23" gate="G$1" x="78.74" y="205.74" rot="R90"/>
<instance part="GND45" gate="1" x="66.04" y="195.58"/>
<instance part="GND46" gate="1" x="78.74" y="195.58"/>
<instance part="LOGO1" gate="G$1" x="358.14" y="25.4"/>
<instance part="LED3" gate="G$1" x="91.44" y="213.36"/>
<instance part="R24" gate="G$1" x="91.44" y="205.74" rot="R90"/>
<instance part="GND48" gate="1" x="91.44" y="195.58"/>
<instance part="CN3" gate="G$1" x="203.2" y="218.44"/>
<instance part="Q3" gate="G$1" x="193.04" y="205.74"/>
<instance part="D4" gate="G$1" x="193.04" y="218.44" rot="R90"/>
<instance part="+P14" gate="G$1" x="193.04" y="231.14"/>
<instance part="GND49" gate="1" x="193.04" y="195.58"/>
<instance part="R25" gate="G$1" x="182.88" y="203.2"/>
<instance part="R26" gate="G$1" x="187.96" y="198.12"/>
<instance part="LOGO2" gate="G$1" x="386.08" y="25.4"/>
<instance part="D6" gate="G$1" x="337.82" y="233.68" rot="R90"/>
<instance part="+P15" gate="1" x="337.82" y="241.3"/>
<instance part="U5" gate="G$1" x="35.56" y="200.66"/>
<instance part="C17" gate="G$1" x="25.4" y="200.66"/>
<instance part="R21" gate="G$1" x="35.56" y="215.9" rot="R90"/>
<instance part="GND50" gate="1" x="35.56" y="195.58"/>
<instance part="GND51" gate="1" x="25.4" y="195.58"/>
<instance part="U2" gate="G$1" x="38.1" y="134.62"/>
<instance part="C3" gate="G$1" x="86.36" y="30.48"/>
<instance part="GND7" gate="1" x="86.36" y="25.4"/>
<instance part="R1" gate="G$1" x="121.92" y="25.4"/>
<instance part="R9" gate="G$1" x="246.38" y="25.4"/>
<instance part="U10" gate="G$1" x="45.72" y="160.02"/>
<instance part="GND47" gate="1" x="45.72" y="149.86"/>
<instance part="C24" gate="G$1" x="30.48" y="154.94"/>
<instance part="C25" gate="G$1" x="60.96" y="154.94"/>
<instance part="GND52" gate="1" x="30.48" y="149.86"/>
<instance part="GND53" gate="1" x="60.96" y="149.86"/>
<instance part="D10" gate="G$1" x="68.58" y="162.56"/>
<instance part="+P16" gate="1" x="78.74" y="162.56" rot="R270"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="Q1" gate="G$1" pin="S"/>
<pinref part="GND18" gate="1" pin="GND"/>
<wire x1="149.86" y1="12.7" x2="149.86" y2="15.24" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="149.86" y1="12.7" x2="154.94" y2="12.7" width="0.1524" layer="91"/>
<junction x="149.86" y="12.7"/>
</segment>
<segment>
<pinref part="GND20" gate="1" pin="GND"/>
<pinref part="CN1" gate="G$1" pin="1"/>
<wire x1="30.48" y1="25.4" x2="30.48" y2="22.86" width="0.1524" layer="91"/>
<wire x1="33.02" y1="25.4" x2="30.48" y2="25.4" width="0.1524" layer="91"/>
<wire x1="30.48" y1="25.4" x2="30.48" y2="30.48" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="3"/>
<wire x1="30.48" y1="30.48" x2="33.02" y2="30.48" width="0.1524" layer="91"/>
<junction x="30.48" y="25.4"/>
</segment>
<segment>
<pinref part="GND19" gate="1" pin="GND"/>
<wire x1="48.26" y1="30.48" x2="48.26" y2="22.86" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="7"/>
<wire x1="45.72" y1="30.48" x2="48.26" y2="30.48" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C2" gate="G$1" pin="N"/>
<pinref part="GND1" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="D2" gate="G$1" pin="A"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="226.06" y1="30.48" x2="226.06" y2="27.94" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="1"/>
<pinref part="GND3" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C4" gate="G$1" pin="2"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R8" gate="G$1" pin="1"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GND"/>
<wire x1="149.86" y1="104.14" x2="142.24" y2="104.14" width="0.1524" layer="91"/>
<pinref part="GND9" gate="1" pin="GND"/>
<pinref part="C13" gate="G$1" pin="2"/>
<wire x1="127" y1="106.68" x2="127" y2="104.14" width="0.1524" layer="91"/>
<wire x1="127" y1="104.14" x2="134.62" y2="104.14" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="2"/>
<wire x1="134.62" y1="104.14" x2="142.24" y2="104.14" width="0.1524" layer="91"/>
<wire x1="142.24" y1="104.14" x2="142.24" y2="106.68" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="2"/>
<wire x1="134.62" y1="106.68" x2="134.62" y2="104.14" width="0.1524" layer="91"/>
<junction x="142.24" y="104.14"/>
<junction x="134.62" y="104.14"/>
</segment>
<segment>
<pinref part="C12" gate="G$1" pin="2"/>
<pinref part="GND11" gate="1" pin="GND"/>
<wire x1="134.62" y1="129.54" x2="134.62" y2="127" width="0.1524" layer="91"/>
<pinref part="C11" gate="G$1" pin="2"/>
<wire x1="124.46" y1="129.54" x2="124.46" y2="127" width="0.1524" layer="91"/>
<wire x1="124.46" y1="127" x2="134.62" y2="127" width="0.1524" layer="91"/>
<junction x="134.62" y="127"/>
</segment>
<segment>
<pinref part="R34" gate="G$1" pin="1"/>
<pinref part="GND14" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U8" gate="P" pin="V-"/>
<pinref part="GND15" gate="1" pin="GND"/>
<pinref part="C20" gate="G$1" pin="2"/>
<wire x1="276.86" y1="226.06" x2="276.86" y2="223.52" width="0.1524" layer="91"/>
<wire x1="276.86" y1="223.52" x2="287.02" y2="223.52" width="0.1524" layer="91"/>
<junction x="287.02" y="223.52"/>
</segment>
<segment>
<pinref part="U7" gate="P" pin="V-"/>
<pinref part="GND16" gate="1" pin="GND"/>
<pinref part="C19" gate="G$1" pin="2"/>
<wire x1="251.46" y1="226.06" x2="251.46" y2="223.52" width="0.1524" layer="91"/>
<wire x1="251.46" y1="223.52" x2="261.62" y2="223.52" width="0.1524" layer="91"/>
<junction x="261.62" y="223.52"/>
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="2"/>
<pinref part="GND22" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C10" gate="G$1" pin="2"/>
<pinref part="GND25" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND23" gate="1" pin="GND"/>
<pinref part="R14" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="CN2" gate="G$1" pin="S1"/>
<pinref part="GND27" gate="1" pin="GND"/>
<pinref part="CN2" gate="G$1" pin="S2"/>
<wire x1="12.7" y1="121.92" x2="15.24" y2="121.92" width="0.1524" layer="91"/>
<junction x="12.7" y="121.92"/>
</segment>
<segment>
<pinref part="CN2" gate="G$1" pin="GND"/>
<wire x1="20.32" y1="129.54" x2="22.86" y2="129.54" width="0.1524" layer="91"/>
<pinref part="GND26" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="Q5" gate="G$1" pin="E"/>
<pinref part="GND29" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="Q6" gate="G$1" pin="E"/>
<pinref part="GND30" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R29" gate="G$1" pin="1"/>
<pinref part="GND31" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND32" gate="1" pin="GND"/>
<pinref part="C18" gate="G$1" pin="2"/>
<pinref part="U6" gate="G$1" pin="GND"/>
<wire x1="233.68" y1="180.34" x2="238.76" y2="180.34" width="0.1524" layer="91"/>
<junction x="233.68" y="180.34"/>
</segment>
<segment>
<pinref part="R27" gate="G$1" pin="1"/>
<pinref part="GND33" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R43" gate="G$1" pin="1"/>
<pinref part="GND35" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND36" gate="1" pin="GND"/>
<wire x1="314.96" y1="101.6" x2="304.8" y2="101.6" width="0.1524" layer="91"/>
<pinref part="C23" gate="G$1" pin="2"/>
<junction x="304.8" y="101.6"/>
<pinref part="U9" gate="G$1" pin="GND"/>
<wire x1="304.8" y1="101.6" x2="297.18" y2="101.6" width="0.1524" layer="91"/>
<pinref part="C21" gate="G$1" pin="2"/>
<junction x="297.18" y="101.6"/>
</segment>
<segment>
<pinref part="R39" gate="G$1" pin="1"/>
<pinref part="GND37" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="332.74" y1="190.5" x2="332.74" y2="182.88" width="0.1524" layer="91"/>
<pinref part="GND39" gate="1" pin="GND"/>
<pinref part="CN4" gate="G$1" pin="2"/>
<wire x1="335.28" y1="190.5" x2="332.74" y2="190.5" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND42" gate="1" pin="GND"/>
<pinref part="D1" gate="G$1" pin="A"/>
<wire x1="185.42" y1="27.94" x2="185.42" y2="30.48" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P4" gate="G$1" pin="P$1"/>
<pinref part="GND12" gate="1" pin="GND"/>
<wire x1="119.38" y1="154.94" x2="121.92" y2="154.94" width="0.1524" layer="91"/>
<pinref part="R18" gate="G$1" pin="1"/>
<wire x1="121.92" y1="154.94" x2="127" y2="154.94" width="0.1524" layer="91"/>
<junction x="121.92" y="154.94"/>
</segment>
<segment>
<pinref part="C8" gate="G$1" pin="2"/>
<pinref part="GND10" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="SGND"/>
<pinref part="GND21" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="CSG"/>
<pinref part="R12" gate="G$1" pin="1"/>
<wire x1="66.04" y1="81.28" x2="71.12" y2="81.28" width="0.1524" layer="91"/>
<pinref part="GND17" gate="1" pin="GND"/>
<junction x="71.12" y="81.28"/>
</segment>
<segment>
<pinref part="R42" gate="G$1" pin="1"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R38" gate="G$1" pin="1"/>
<pinref part="GND40" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="IN-"/>
<pinref part="GND34" gate="1" pin="GND"/>
<wire x1="238.76" y1="172.72" x2="236.22" y2="172.72" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND24" gate="1" pin="GND"/>
<pinref part="C5" gate="G$1" pin="2"/>
<wire x1="208.28" y1="27.94" x2="208.28" y2="30.48" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="2"/>
<pinref part="GND38" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C22" gate="G$1" pin="2"/>
<wire x1="307.34" y1="187.96" x2="307.34" y2="182.88" width="0.1524" layer="91"/>
<pinref part="GND41" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="D7" gate="G$1" pin="A"/>
<wire x1="320.04" y1="187.96" x2="320.04" y2="182.88" width="0.1524" layer="91"/>
<pinref part="GND43" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R30" gate="G$1" pin="V1"/>
<pinref part="GND13" gate="1" pin="GND"/>
<wire x1="281.94" y1="165.1" x2="281.94" y2="162.56" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C16" gate="G$1" pin="2"/>
<pinref part="GND44" gate="1" pin="GND"/>
<pinref part="U4" gate="1" pin="GND"/>
<wire x1="119.38" y1="200.66" x2="111.76" y2="200.66" width="0.1524" layer="91"/>
<junction x="111.76" y="200.66"/>
</segment>
<segment>
<pinref part="R22" gate="G$1" pin="1"/>
<pinref part="GND45" gate="1" pin="GND"/>
<wire x1="66.04" y1="200.66" x2="66.04" y2="198.12" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND46" gate="1" pin="GND"/>
<pinref part="R23" gate="G$1" pin="1"/>
<wire x1="78.74" y1="198.12" x2="78.74" y2="200.66" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND48" gate="1" pin="GND"/>
<pinref part="R24" gate="G$1" pin="1"/>
<wire x1="91.44" y1="198.12" x2="91.44" y2="200.66" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="Q3" gate="G$1" pin="S"/>
<pinref part="GND49" gate="1" pin="GND"/>
<wire x1="193.04" y1="198.12" x2="193.04" y2="200.66" width="0.1524" layer="91"/>
<pinref part="R26" gate="G$1" pin="2"/>
<wire x1="190.5" y1="198.12" x2="193.04" y2="198.12" width="0.1524" layer="91"/>
<junction x="193.04" y="198.12"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="A"/>
<pinref part="GND50" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C17" gate="G$1" pin="2"/>
<pinref part="GND51" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="V-"/>
<pinref part="GND28" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="N"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U10" gate="G$1" pin="GND"/>
<pinref part="GND47" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C24" gate="G$1" pin="2"/>
<pinref part="GND52" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C25" gate="G$1" pin="2"/>
<pinref part="GND53" gate="1" pin="GND"/>
</segment>
</net>
<net name="PWR_CHARGER" class="0">
<segment>
<label x="175.26" y="17.78" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="170.18" y1="17.78" x2="175.26" y2="17.78" width="0.1524" layer="91"/>
<wire x1="162.56" y1="12.7" x2="170.18" y2="12.7" width="0.1524" layer="91"/>
<wire x1="170.18" y1="12.7" x2="170.18" y2="17.78" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="167.64" y1="17.78" x2="170.18" y2="17.78" width="0.1524" layer="91"/>
<junction x="170.18" y="17.78"/>
</segment>
<segment>
<label x="144.78" y="76.2" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="149.86" y1="76.2" x2="144.78" y2="76.2" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="PE1/OC0B/XCK0/SCL"/>
</segment>
<segment>
<pinref part="LED3" gate="G$1" pin="A"/>
<wire x1="63.5" y1="223.52" x2="91.44" y2="223.52" width="0.1524" layer="91"/>
<wire x1="91.44" y1="223.52" x2="91.44" y2="215.9" width="0.1524" layer="91"/>
<label x="63.5" y="223.52" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<wire x1="144.78" y1="27.94" x2="149.86" y2="27.94" width="0.1524" layer="91"/>
<pinref part="Q2" gate="G$1" pin="G"/>
<wire x1="149.86" y1="27.94" x2="149.86" y2="35.56" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="D"/>
<wire x1="149.86" y1="25.4" x2="149.86" y2="27.94" width="0.1524" layer="91"/>
<junction x="149.86" y="27.94"/>
<pinref part="R4" gate="G$1" pin="1"/>
<wire x1="144.78" y1="27.94" x2="144.78" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CHARGER_RX" class="0">
<segment>
<label x="55.88" y="25.4" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="45.72" y1="25.4" x2="55.88" y2="25.4" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="5"/>
</segment>
<segment>
<label x="218.44" y="81.28" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="215.9" y1="81.28" x2="218.44" y2="81.28" width="0.1524" layer="91"/>
<pinref part="R20" gate="G$1" pin="2"/>
</segment>
</net>
<net name="CHARGER_TX" class="0">
<segment>
<label x="55.88" y="27.94" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="55.88" y1="27.94" x2="45.72" y2="27.94" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="6"/>
</segment>
<segment>
<label x="218.44" y="83.82" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="218.44" y1="83.82" x2="215.9" y2="83.82" width="0.1524" layer="91"/>
<pinref part="R19" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<pinref part="Q1" gate="G$1" pin="G"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="154.94" y1="17.78" x2="160.02" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="U8" gate="P" pin="V+"/>
<pinref part="+P4" gate="1" pin="+3V3"/>
<wire x1="287.02" y1="233.68" x2="287.02" y2="236.22" width="0.1524" layer="91"/>
<wire x1="287.02" y1="236.22" x2="287.02" y2="238.76" width="0.1524" layer="91"/>
<wire x1="287.02" y1="236.22" x2="276.86" y2="236.22" width="0.1524" layer="91"/>
<pinref part="C20" gate="G$1" pin="1"/>
<wire x1="276.86" y1="236.22" x2="276.86" y2="233.68" width="0.1524" layer="91"/>
<junction x="287.02" y="236.22"/>
</segment>
<segment>
<pinref part="+P1" gate="1" pin="+3V3"/>
<pinref part="U3" gate="G$1" pin="VCC"/>
<wire x1="121.92" y1="116.84" x2="127" y2="116.84" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="1"/>
<wire x1="127" y1="116.84" x2="134.62" y2="116.84" width="0.1524" layer="91"/>
<wire x1="134.62" y1="116.84" x2="142.24" y2="116.84" width="0.1524" layer="91"/>
<wire x1="142.24" y1="116.84" x2="149.86" y2="116.84" width="0.1524" layer="91"/>
<wire x1="142.24" y1="114.3" x2="142.24" y2="116.84" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="1"/>
<wire x1="134.62" y1="114.3" x2="134.62" y2="116.84" width="0.1524" layer="91"/>
<pinref part="C13" gate="G$1" pin="1"/>
<wire x1="127" y1="114.3" x2="127" y2="116.84" width="0.1524" layer="91"/>
<junction x="127" y="116.84"/>
<junction x="134.62" y="116.84"/>
<junction x="142.24" y="116.84"/>
</segment>
<segment>
<pinref part="+P5" gate="1" pin="+3V3"/>
<pinref part="U7" gate="P" pin="V+"/>
<wire x1="261.62" y1="238.76" x2="261.62" y2="236.22" width="0.1524" layer="91"/>
<wire x1="261.62" y1="236.22" x2="261.62" y2="233.68" width="0.1524" layer="91"/>
<wire x1="261.62" y1="236.22" x2="251.46" y2="236.22" width="0.1524" layer="91"/>
<pinref part="C19" gate="G$1" pin="1"/>
<wire x1="251.46" y1="236.22" x2="251.46" y2="233.68" width="0.1524" layer="91"/>
<junction x="261.62" y="236.22"/>
</segment>
<segment>
<pinref part="P1" gate="G$1" pin="P$1"/>
<pinref part="R17" gate="G$1" pin="1"/>
<wire x1="119.38" y1="170.18" x2="121.92" y2="170.18" width="0.1524" layer="91"/>
<pinref part="+P3" gate="1" pin="+3V3"/>
<wire x1="121.92" y1="170.18" x2="127" y2="170.18" width="0.1524" layer="91"/>
<wire x1="121.92" y1="172.72" x2="121.92" y2="170.18" width="0.1524" layer="91"/>
<junction x="121.92" y="170.18"/>
</segment>
<segment>
<pinref part="+P9" gate="1" pin="+3V3"/>
<pinref part="FB1" gate="G$1" pin="1"/>
<wire x1="10.16" y1="27.94" x2="15.24" y2="27.94" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="15.24" y1="27.94" x2="17.78" y2="27.94" width="0.1524" layer="91"/>
<wire x1="15.24" y1="25.4" x2="15.24" y2="27.94" width="0.1524" layer="91"/>
<junction x="15.24" y="27.94"/>
</segment>
<segment>
<pinref part="C11" gate="G$1" pin="1"/>
<wire x1="124.46" y1="137.16" x2="124.46" y2="139.7" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="AVCC"/>
<wire x1="124.46" y1="139.7" x2="134.62" y2="139.7" width="0.1524" layer="91"/>
<pinref part="C12" gate="G$1" pin="1"/>
<wire x1="134.62" y1="139.7" x2="144.78" y2="139.7" width="0.1524" layer="91"/>
<wire x1="144.78" y1="139.7" x2="144.78" y2="134.62" width="0.1524" layer="91"/>
<wire x1="144.78" y1="134.62" x2="149.86" y2="134.62" width="0.1524" layer="91"/>
<wire x1="134.62" y1="137.16" x2="134.62" y2="139.7" width="0.1524" layer="91"/>
<junction x="134.62" y="139.7"/>
<junction x="124.46" y="139.7"/>
<wire x1="119.38" y1="139.7" x2="124.46" y2="139.7" width="0.1524" layer="91"/>
<pinref part="+P2" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="+P13" gate="1" pin="+3V3"/>
<pinref part="C16" gate="G$1" pin="1"/>
<wire x1="111.76" y1="210.82" x2="111.76" y2="208.28" width="0.1524" layer="91"/>
<pinref part="U4" gate="1" pin="VDD"/>
<wire x1="111.76" y1="208.28" x2="119.38" y2="208.28" width="0.1524" layer="91"/>
<junction x="111.76" y="208.28"/>
</segment>
<segment>
<pinref part="D6" gate="G$1" pin="K"/>
<pinref part="+P15" gate="1" pin="+3V3"/>
<wire x1="337.82" y1="236.22" x2="337.82" y2="238.76" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="D10" gate="G$1" pin="K"/>
<wire x1="71.12" y1="162.56" x2="76.2" y2="162.56" width="0.1524" layer="91"/>
<pinref part="+P16" gate="1" pin="+3V3"/>
</segment>
</net>
<net name="VOLT_BAT" class="0">
<segment>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="111.76" y1="22.86" x2="111.76" y2="25.4" width="0.1524" layer="91"/>
<wire x1="111.76" y1="25.4" x2="106.68" y2="25.4" width="0.1524" layer="91"/>
<label x="106.68" y="25.4" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="116.84" y1="25.4" x2="111.76" y2="25.4" width="0.1524" layer="91"/>
<junction x="111.76" y="25.4"/>
</segment>
<segment>
<wire x1="205.74" y1="142.24" x2="218.44" y2="142.24" width="0.1524" layer="91"/>
<label x="218.44" y="142.24" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PA2/ADC2"/>
</segment>
</net>
<net name="VOLT_LINE" class="0">
<segment>
<pinref part="C6" gate="G$1" pin="1"/>
<wire x1="254" y1="22.86" x2="254" y2="25.4" width="0.1524" layer="91"/>
<label x="259.08" y="25.4" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="254" y1="25.4" x2="259.08" y2="25.4" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="2"/>
<wire x1="248.92" y1="25.4" x2="254" y2="25.4" width="0.1524" layer="91"/>
<junction x="254" y="25.4"/>
</segment>
<segment>
<label x="218.44" y="144.78" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="205.74" y1="144.78" x2="218.44" y2="144.78" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="PA1/ADC1"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="!RESET!/PDI_CLK"/>
<wire x1="149.86" y1="147.32" x2="144.78" y2="147.32" width="0.1524" layer="91"/>
<pinref part="P2" gate="G$1" pin="P$1"/>
<wire x1="119.38" y1="165.1" x2="137.16" y2="165.1" width="0.1524" layer="91"/>
<wire x1="137.16" y1="165.1" x2="144.78" y2="165.1" width="0.1524" layer="91"/>
<wire x1="144.78" y1="165.1" x2="144.78" y2="147.32" width="0.1524" layer="91"/>
<pinref part="R17" gate="G$1" pin="2"/>
<wire x1="134.62" y1="170.18" x2="137.16" y2="170.18" width="0.1524" layer="91"/>
<wire x1="137.16" y1="170.18" x2="137.16" y2="165.1" width="0.1524" layer="91"/>
<junction x="137.16" y="165.1"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PDI_DATA"/>
<pinref part="P3" gate="G$1" pin="P$1"/>
<wire x1="119.38" y1="160.02" x2="137.16" y2="160.02" width="0.1524" layer="91"/>
<wire x1="137.16" y1="160.02" x2="142.24" y2="160.02" width="0.1524" layer="91"/>
<wire x1="142.24" y1="160.02" x2="142.24" y2="144.78" width="0.1524" layer="91"/>
<wire x1="142.24" y1="144.78" x2="149.86" y2="144.78" width="0.1524" layer="91"/>
<pinref part="R18" gate="G$1" pin="2"/>
<wire x1="134.62" y1="154.94" x2="137.16" y2="154.94" width="0.1524" layer="91"/>
<wire x1="137.16" y1="154.94" x2="137.16" y2="160.02" width="0.1524" layer="91"/>
<junction x="137.16" y="160.02"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="Q4" gate="G$1" pin="D"/>
<wire x1="281.94" y1="193.04" x2="281.94" y2="203.2" width="0.1524" layer="91"/>
<pinref part="L2" gate="G$1" pin="2"/>
<wire x1="281.94" y1="203.2" x2="276.86" y2="203.2" width="0.1524" layer="91"/>
<pinref part="D5" gate="G$1" pin="A"/>
<wire x1="281.94" y1="203.2" x2="287.02" y2="203.2" width="0.1524" layer="91"/>
<junction x="281.94" y="203.2"/>
</segment>
</net>
<net name="VCAP" class="0">
<segment>
<pinref part="D5" gate="G$1" pin="K"/>
<wire x1="292.1" y1="203.2" x2="307.34" y2="203.2" width="0.1524" layer="91"/>
<pinref part="R33" gate="G$1" pin="2"/>
<wire x1="322.58" y1="238.76" x2="322.58" y2="241.3" width="0.1524" layer="91"/>
<wire x1="322.58" y1="241.3" x2="307.34" y2="241.3" width="0.1524" layer="91"/>
<wire x1="307.34" y1="241.3" x2="307.34" y2="203.2" width="0.1524" layer="91"/>
<junction x="307.34" y="203.2"/>
<wire x1="307.34" y1="203.2" x2="320.04" y2="203.2" width="0.1524" layer="91"/>
<wire x1="320.04" y1="203.2" x2="332.74" y2="203.2" width="0.1524" layer="91"/>
<wire x1="332.74" y1="203.2" x2="363.22" y2="203.2" width="0.1524" layer="91"/>
<wire x1="363.22" y1="180.34" x2="363.22" y2="185.42" width="0.1524" layer="91"/>
<wire x1="363.22" y1="185.42" x2="363.22" y2="203.2" width="0.1524" layer="91"/>
<wire x1="363.22" y1="203.2" x2="388.62" y2="203.2" width="0.1524" layer="91"/>
<wire x1="388.62" y1="203.2" x2="388.62" y2="185.42" width="0.1524" layer="91"/>
<junction x="363.22" y="203.2"/>
<wire x1="388.62" y1="185.42" x2="388.62" y2="180.34" width="0.1524" layer="91"/>
<wire x1="332.74" y1="193.04" x2="332.74" y2="203.2" width="0.1524" layer="91"/>
<junction x="332.74" y="203.2"/>
<pinref part="CN5" gate="G$1" pin="2"/>
<wire x1="363.22" y1="180.34" x2="365.76" y2="180.34" width="0.1524" layer="91"/>
<pinref part="CN6" gate="G$1" pin="2"/>
<wire x1="388.62" y1="180.34" x2="391.16" y2="180.34" width="0.1524" layer="91"/>
<pinref part="C22" gate="G$1" pin="1"/>
<wire x1="307.34" y1="195.58" x2="307.34" y2="203.2" width="0.1524" layer="91"/>
<junction x="307.34" y="203.2"/>
<pinref part="D7" gate="G$1" pin="K"/>
<wire x1="320.04" y1="193.04" x2="320.04" y2="203.2" width="0.1524" layer="91"/>
<junction x="320.04" y="203.2"/>
<pinref part="D8" gate="G$1" pin="K"/>
<wire x1="358.14" y1="180.34" x2="358.14" y2="185.42" width="0.1524" layer="91"/>
<wire x1="358.14" y1="185.42" x2="363.22" y2="185.42" width="0.1524" layer="91"/>
<junction x="363.22" y="185.42"/>
<pinref part="D9" gate="G$1" pin="K"/>
<wire x1="383.54" y1="180.34" x2="383.54" y2="185.42" width="0.1524" layer="91"/>
<wire x1="383.54" y1="185.42" x2="388.62" y2="185.42" width="0.1524" layer="91"/>
<junction x="388.62" y="185.42"/>
<pinref part="CN4" gate="G$1" pin="1"/>
<wire x1="332.74" y1="193.04" x2="335.28" y2="193.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VOLT_LINE1" class="0">
<segment>
<pinref part="R34" gate="G$1" pin="2"/>
<pinref part="R33" gate="G$1" pin="1"/>
<wire x1="322.58" y1="231.14" x2="322.58" y2="228.6" width="0.1524" layer="91"/>
<pinref part="R37" gate="G$1" pin="1"/>
<wire x1="322.58" y1="228.6" x2="322.58" y2="226.06" width="0.1524" layer="91"/>
<wire x1="327.66" y1="228.6" x2="322.58" y2="228.6" width="0.1524" layer="91"/>
<junction x="322.58" y="228.6"/>
</segment>
</net>
<net name="VOLT_CAP" class="0">
<segment>
<pinref part="U8" gate="A" pin="IN-"/>
<wire x1="342.9" y1="223.52" x2="340.36" y2="223.52" width="0.1524" layer="91"/>
<wire x1="340.36" y1="223.52" x2="340.36" y2="218.44" width="0.1524" layer="91"/>
<wire x1="340.36" y1="218.44" x2="360.68" y2="218.44" width="0.1524" layer="91"/>
<wire x1="360.68" y1="218.44" x2="360.68" y2="226.06" width="0.1524" layer="91"/>
<pinref part="U8" gate="A" pin="OUT"/>
<wire x1="360.68" y1="226.06" x2="358.14" y2="226.06" width="0.1524" layer="91"/>
<wire x1="360.68" y1="226.06" x2="365.76" y2="226.06" width="0.1524" layer="91"/>
<junction x="360.68" y="226.06"/>
<label x="365.76" y="226.06" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="205.74" y1="137.16" x2="218.44" y2="137.16" width="0.1524" layer="91"/>
<label x="218.44" y="137.16" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PA4/ADC4"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="R31" gate="G$1" pin="2"/>
<wire x1="294.64" y1="154.94" x2="292.1" y2="154.94" width="0.1524" layer="91"/>
<wire x1="292.1" y1="154.94" x2="292.1" y2="180.34" width="0.1524" layer="91"/>
<wire x1="287.02" y1="180.34" x2="292.1" y2="180.34" width="0.1524" layer="91"/>
<pinref part="R30" gate="G$1" pin="I2"/>
<wire x1="287.02" y1="180.34" x2="287.02" y2="177.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="R35" gate="G$1" pin="2"/>
<wire x1="309.88" y1="160.02" x2="304.8" y2="160.02" width="0.1524" layer="91"/>
<wire x1="304.8" y1="160.02" x2="304.8" y2="154.94" width="0.1524" layer="91"/>
<pinref part="U7" gate="A" pin="IN+"/>
<wire x1="304.8" y1="154.94" x2="304.8" y2="152.4" width="0.1524" layer="91"/>
<wire x1="304.8" y1="152.4" x2="307.34" y2="152.4" width="0.1524" layer="91"/>
<pinref part="R31" gate="G$1" pin="1"/>
<wire x1="302.26" y1="154.94" x2="304.8" y2="154.94" width="0.1524" layer="91"/>
<junction x="304.8" y="154.94"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="R32" gate="G$1" pin="1"/>
<wire x1="302.26" y1="144.78" x2="304.8" y2="144.78" width="0.1524" layer="91"/>
<wire x1="304.8" y1="144.78" x2="304.8" y2="147.32" width="0.1524" layer="91"/>
<pinref part="U7" gate="A" pin="IN-"/>
<wire x1="304.8" y1="147.32" x2="307.34" y2="147.32" width="0.1524" layer="91"/>
<wire x1="304.8" y1="144.78" x2="304.8" y2="139.7" width="0.1524" layer="91"/>
<pinref part="R36" gate="G$1" pin="2"/>
<wire x1="304.8" y1="139.7" x2="309.88" y2="139.7" width="0.1524" layer="91"/>
<junction x="304.8" y="144.78"/>
</segment>
</net>
<net name="CUR_OUT" class="0">
<segment>
<pinref part="R36" gate="G$1" pin="1"/>
<wire x1="317.5" y1="139.7" x2="325.12" y2="139.7" width="0.1524" layer="91"/>
<wire x1="325.12" y1="139.7" x2="325.12" y2="149.86" width="0.1524" layer="91"/>
<pinref part="U7" gate="A" pin="OUT"/>
<wire x1="325.12" y1="149.86" x2="322.58" y2="149.86" width="0.1524" layer="91"/>
<wire x1="325.12" y1="149.86" x2="330.2" y2="149.86" width="0.1524" layer="91"/>
<junction x="325.12" y="149.86"/>
<label x="330.2" y="149.86" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="205.74" y1="116.84" x2="218.44" y2="116.84" width="0.1524" layer="91"/>
<label x="218.44" y="116.84" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PB3/ADC11/DAC1"/>
</segment>
</net>
<net name="CUR_OFFSET" class="0">
<segment>
<pinref part="R35" gate="G$1" pin="1"/>
<wire x1="317.5" y1="160.02" x2="322.58" y2="160.02" width="0.1524" layer="91"/>
<label x="322.58" y="160.02" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="205.74" y1="119.38" x2="218.44" y2="119.38" width="0.1524" layer="91"/>
<label x="218.44" y="119.38" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PB2/ADC10/DAC0"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="R37" gate="G$1" pin="2"/>
<pinref part="U8" gate="A" pin="IN+"/>
<wire x1="335.28" y1="228.6" x2="337.82" y2="228.6" width="0.1524" layer="91"/>
<pinref part="D6" gate="G$1" pin="A"/>
<wire x1="337.82" y1="228.6" x2="342.9" y2="228.6" width="0.1524" layer="91"/>
<wire x1="337.82" y1="228.6" x2="337.82" y2="231.14" width="0.1524" layer="91"/>
<junction x="337.82" y="228.6"/>
</segment>
</net>
<net name="VCC/2" class="0">
<segment>
<pinref part="F1" gate="G$1" pin="2"/>
<pinref part="P+1" gate="G$1" pin="VCC/2"/>
<wire x1="203.2" y1="40.64" x2="208.28" y2="40.64" width="0.1524" layer="91"/>
<wire x1="208.28" y1="40.64" x2="226.06" y2="40.64" width="0.1524" layer="91"/>
<wire x1="226.06" y1="40.64" x2="236.22" y2="40.64" width="0.1524" layer="91"/>
<wire x1="236.22" y1="40.64" x2="241.3" y2="40.64" width="0.1524" layer="91"/>
<pinref part="D2" gate="G$1" pin="K"/>
<wire x1="226.06" y1="35.56" x2="226.06" y2="40.64" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="2"/>
<wire x1="236.22" y1="35.56" x2="236.22" y2="40.64" width="0.1524" layer="91"/>
<junction x="226.06" y="40.64"/>
<junction x="236.22" y="40.64"/>
<pinref part="C5" gate="G$1" pin="1"/>
<wire x1="208.28" y1="38.1" x2="208.28" y2="40.64" width="0.1524" layer="91"/>
<junction x="208.28" y="40.64"/>
</segment>
<segment>
<pinref part="L2" gate="G$1" pin="1"/>
<wire x1="266.7" y1="203.2" x2="261.62" y2="203.2" width="0.1524" layer="91"/>
<pinref part="P+2" gate="G$1" pin="VCC/2"/>
</segment>
</net>
<net name="VCC/1" class="0">
<segment>
<pinref part="Q2" gate="G$1" pin="D"/>
<pinref part="F1" gate="G$1" pin="1"/>
<wire x1="157.48" y1="40.64" x2="185.42" y2="40.64" width="0.1524" layer="91"/>
<wire x1="185.42" y1="40.64" x2="193.04" y2="40.64" width="0.1524" layer="91"/>
<junction x="185.42" y="40.64"/>
<pinref part="P+3" gate="G$1" pin="VCC/1"/>
<wire x1="185.42" y1="40.64" x2="185.42" y2="43.18" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="K"/>
<wire x1="185.42" y1="35.56" x2="185.42" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+9V" class="0">
<segment>
<pinref part="C10" gate="G$1" pin="1"/>
<wire x1="93.98" y1="93.98" x2="96.52" y2="93.98" width="0.1524" layer="91"/>
<wire x1="96.52" y1="93.98" x2="104.14" y2="93.98" width="0.1524" layer="91"/>
<wire x1="104.14" y1="93.98" x2="104.14" y2="91.44" width="0.1524" layer="91"/>
<junction x="104.14" y="93.98"/>
<wire x1="104.14" y1="93.98" x2="109.22" y2="93.98" width="0.1524" layer="91"/>
<pinref part="+P6" gate="G$1" pin="+9V"/>
<pinref part="L1" gate="G$1" pin="2"/>
<pinref part="R13" gate="G$1" pin="2"/>
<wire x1="96.52" y1="91.44" x2="96.52" y2="93.98" width="0.1524" layer="91"/>
<junction x="96.52" y="93.98"/>
</segment>
<segment>
<pinref part="+P7" gate="G$1" pin="+9V"/>
<pinref part="C18" gate="G$1" pin="1"/>
<wire x1="233.68" y1="187.96" x2="228.6" y2="187.96" width="0.1524" layer="91"/>
<pinref part="U6" gate="G$1" pin="VDD"/>
<wire x1="233.68" y1="187.96" x2="238.76" y2="187.96" width="0.1524" layer="91"/>
<junction x="233.68" y="187.96"/>
</segment>
<segment>
<wire x1="314.96" y1="109.22" x2="304.8" y2="109.22" width="0.1524" layer="91"/>
<pinref part="+P8" gate="G$1" pin="+9V"/>
<pinref part="C23" gate="G$1" pin="1"/>
<wire x1="304.8" y1="109.22" x2="297.18" y2="109.22" width="0.1524" layer="91"/>
<junction x="304.8" y="109.22"/>
<pinref part="U9" gate="G$1" pin="VDD"/>
<pinref part="C21" gate="G$1" pin="1"/>
<wire x1="297.18" y1="109.22" x2="292.1" y2="109.22" width="0.1524" layer="91"/>
<junction x="297.18" y="109.22"/>
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="ENB"/>
<wire x1="314.96" y1="91.44" x2="312.42" y2="91.44" width="0.1524" layer="91"/>
<wire x1="312.42" y1="91.44" x2="312.42" y2="93.98" width="0.1524" layer="91"/>
<pinref part="U9" gate="G$1" pin="ENA"/>
<pinref part="+P12" gate="G$1" pin="+9V"/>
<wire x1="309.88" y1="93.98" x2="312.42" y2="93.98" width="0.1524" layer="91"/>
<junction x="312.42" y="93.98"/>
<wire x1="312.42" y1="93.98" x2="314.96" y2="93.98" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="CN3" gate="G$1" pin="1"/>
<wire x1="200.66" y1="220.98" x2="198.12" y2="220.98" width="0.1524" layer="91"/>
<wire x1="198.12" y1="220.98" x2="198.12" y2="223.52" width="0.1524" layer="91"/>
<wire x1="198.12" y1="223.52" x2="193.04" y2="223.52" width="0.1524" layer="91"/>
<pinref part="D4" gate="G$1" pin="K"/>
<wire x1="193.04" y1="223.52" x2="193.04" y2="220.98" width="0.1524" layer="91"/>
<wire x1="193.04" y1="223.52" x2="193.04" y2="228.6" width="0.1524" layer="91"/>
<pinref part="+P14" gate="G$1" pin="+9V"/>
<junction x="193.04" y="223.52"/>
</segment>
</net>
<net name="USB_D-" class="0">
<segment>
<pinref part="R15" gate="G$1" pin="2"/>
<wire x1="63.5" y1="137.16" x2="73.66" y2="137.16" width="0.1524" layer="91"/>
<label x="73.66" y="137.16" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="205.74" y1="73.66" x2="218.44" y2="73.66" width="0.1524" layer="91"/>
<label x="218.44" y="73.66" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PD6/MISO/RXD1/D-"/>
</segment>
</net>
<net name="USB_D+" class="0">
<segment>
<pinref part="R16" gate="G$1" pin="2"/>
<wire x1="68.58" y1="132.08" x2="73.66" y2="132.08" width="0.1524" layer="91"/>
<label x="73.66" y="132.08" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="205.74" y1="71.12" x2="218.44" y2="71.12" width="0.1524" layer="91"/>
<label x="218.44" y="71.12" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PD7/CLKPER/SCK/TXD1/D+"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="Q5" gate="G$1" pin="C"/>
<wire x1="363.22" y1="162.56" x2="363.22" y2="172.72" width="0.1524" layer="91"/>
<pinref part="CN5" gate="G$1" pin="1"/>
<wire x1="363.22" y1="172.72" x2="363.22" y2="177.8" width="0.1524" layer="91"/>
<wire x1="365.76" y1="177.8" x2="363.22" y2="177.8" width="0.1524" layer="91"/>
<pinref part="D8" gate="G$1" pin="A"/>
<wire x1="358.14" y1="175.26" x2="358.14" y2="172.72" width="0.1524" layer="91"/>
<wire x1="358.14" y1="172.72" x2="363.22" y2="172.72" width="0.1524" layer="91"/>
<junction x="363.22" y="172.72"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="Q6" gate="G$1" pin="C"/>
<wire x1="388.62" y1="177.8" x2="388.62" y2="172.72" width="0.1524" layer="91"/>
<pinref part="CN6" gate="G$1" pin="1"/>
<wire x1="388.62" y1="172.72" x2="388.62" y2="162.56" width="0.1524" layer="91"/>
<wire x1="391.16" y1="177.8" x2="388.62" y2="177.8" width="0.1524" layer="91"/>
<pinref part="D9" gate="G$1" pin="A"/>
<wire x1="383.54" y1="175.26" x2="383.54" y2="172.72" width="0.1524" layer="91"/>
<wire x1="383.54" y1="172.72" x2="388.62" y2="172.72" width="0.1524" layer="91"/>
<junction x="388.62" y="172.72"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="R28" gate="G$1" pin="2"/>
<pinref part="Q4" gate="G$1" pin="G"/>
<wire x1="271.78" y1="185.42" x2="276.86" y2="185.42" width="0.1524" layer="91"/>
<wire x1="271.78" y1="177.8" x2="271.78" y2="180.34" width="0.1524" layer="91"/>
<pinref part="R29" gate="G$1" pin="2"/>
<wire x1="271.78" y1="180.34" x2="271.78" y2="185.42" width="0.1524" layer="91"/>
<wire x1="269.24" y1="180.34" x2="271.78" y2="180.34" width="0.1524" layer="91"/>
<junction x="271.78" y="180.34"/>
</segment>
</net>
<net name="GATE_CHOPPER" class="0">
<segment>
<label x="220.98" y="175.26" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="R27" gate="G$1" pin="2"/>
<wire x1="226.06" y1="175.26" x2="220.98" y2="175.26" width="0.1524" layer="91"/>
<wire x1="226.06" y1="172.72" x2="226.06" y2="175.26" width="0.1524" layer="91"/>
<pinref part="U6" gate="G$1" pin="IN+"/>
<wire x1="226.06" y1="175.26" x2="238.76" y2="175.26" width="0.1524" layer="91"/>
<junction x="226.06" y="175.26"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="PC0/OC0A/SDA"/>
<wire x1="205.74" y1="111.76" x2="218.44" y2="111.76" width="0.1524" layer="91"/>
<label x="218.44" y="111.76" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="Q5" gate="G$1" pin="G"/>
<wire x1="355.6" y1="157.48" x2="358.14" y2="157.48" width="0.1524" layer="91"/>
<wire x1="355.6" y1="157.48" x2="355.6" y2="91.44" width="0.1524" layer="91"/>
<pinref part="R42" gate="G$1" pin="2"/>
<pinref part="R41" gate="G$1" pin="2"/>
<wire x1="355.6" y1="91.44" x2="355.6" y2="88.9" width="0.1524" layer="91"/>
<wire x1="350.52" y1="91.44" x2="355.6" y2="91.44" width="0.1524" layer="91"/>
<junction x="355.6" y="91.44"/>
</segment>
</net>
<net name="GATE_STRAIGHT" class="0">
<segment>
<label x="297.18" y="86.36" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="R39" gate="G$1" pin="2"/>
<wire x1="309.88" y1="86.36" x2="297.18" y2="86.36" width="0.1524" layer="91"/>
<wire x1="309.88" y1="83.82" x2="309.88" y2="86.36" width="0.1524" layer="91"/>
<junction x="309.88" y="86.36"/>
<pinref part="U9" gate="G$1" pin="INB"/>
<wire x1="309.88" y1="86.36" x2="314.96" y2="86.36" width="0.1524" layer="91"/>
</segment>
<segment>
<label x="218.44" y="109.22" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="205.74" y1="109.22" x2="218.44" y2="109.22" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="PC1/OC0B/XCK0/SCL"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="R11" gate="G$1" pin="1"/>
<wire x1="38.1" y1="88.9" x2="38.1" y2="86.36" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="RT"/>
<wire x1="38.1" y1="86.36" x2="40.64" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SS"/>
<wire x1="40.64" y1="73.66" x2="35.56" y2="73.66" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="1"/>
<wire x1="35.56" y1="73.66" x2="35.56" y2="71.12" width="0.1524" layer="91"/>
<wire x1="35.56" y1="73.66" x2="30.48" y2="73.66" width="0.1524" layer="91"/>
<pinref part="R10" gate="G$1" pin="2"/>
<junction x="35.56" y="73.66"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="BST"/>
<wire x1="66.04" y1="99.06" x2="68.58" y2="99.06" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SW"/>
<wire x1="66.04" y1="93.98" x2="81.28" y2="93.98" width="0.1524" layer="91"/>
<wire x1="81.28" y1="93.98" x2="81.28" y2="99.06" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="2"/>
<wire x1="81.28" y1="99.06" x2="76.2" y2="99.06" width="0.1524" layer="91"/>
<pinref part="D3" gate="G$1" pin="K"/>
<wire x1="78.74" y1="88.9" x2="81.28" y2="88.9" width="0.1524" layer="91"/>
<wire x1="81.28" y1="88.9" x2="81.28" y2="93.98" width="0.1524" layer="91"/>
<pinref part="L1" gate="G$1" pin="1"/>
<wire x1="81.28" y1="93.98" x2="83.82" y2="93.98" width="0.1524" layer="91"/>
<junction x="81.28" y="93.98"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="D3" gate="G$1" pin="A"/>
<pinref part="U1" gate="G$1" pin="CS"/>
<wire x1="73.66" y1="88.9" x2="71.12" y2="88.9" width="0.1524" layer="91"/>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="71.12" y1="88.9" x2="66.04" y2="88.9" width="0.1524" layer="91"/>
<junction x="71.12" y="88.9"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="FB"/>
<wire x1="66.04" y1="73.66" x2="86.36" y2="73.66" width="0.1524" layer="91"/>
<wire x1="86.36" y1="73.66" x2="86.36" y2="81.28" width="0.1524" layer="91"/>
<wire x1="86.36" y1="81.28" x2="96.52" y2="81.28" width="0.1524" layer="91"/>
<pinref part="R13" gate="G$1" pin="1"/>
<wire x1="96.52" y1="81.28" x2="96.52" y2="83.82" width="0.1524" layer="91"/>
<pinref part="R14" gate="G$1" pin="2"/>
<wire x1="96.52" y1="81.28" x2="96.52" y2="78.74" width="0.1524" layer="91"/>
<junction x="96.52" y="81.28"/>
</segment>
</net>
<net name="PWR_GATE" class="0">
<segment>
<pinref part="R10" gate="G$1" pin="1"/>
<wire x1="22.86" y1="73.66" x2="17.78" y2="73.66" width="0.1524" layer="91"/>
<label x="17.78" y="73.66" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="149.86" y1="71.12" x2="144.78" y2="71.12" width="0.1524" layer="91"/>
<label x="144.78" y="71.12" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PE3/OC0D/TXD0"/>
</segment>
</net>
<net name="VBAT" class="0">
<segment>
<wire x1="27.94" y1="33.02" x2="27.94" y2="40.64" width="0.1524" layer="91"/>
<wire x1="27.94" y1="40.64" x2="50.8" y2="40.64" width="0.1524" layer="91"/>
<wire x1="50.8" y1="40.64" x2="50.8" y2="33.02" width="0.1524" layer="91"/>
<pinref part="Q2" gate="G$1" pin="S"/>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="144.78" y1="40.64" x2="147.32" y2="40.64" width="0.1524" layer="91"/>
<wire x1="144.78" y1="38.1" x2="144.78" y2="40.64" width="0.1524" layer="91"/>
<wire x1="50.8" y1="40.64" x2="76.2" y2="40.64" width="0.1524" layer="91"/>
<wire x1="76.2" y1="40.64" x2="86.36" y2="40.64" width="0.1524" layer="91"/>
<junction x="50.8" y="40.64"/>
<junction x="144.78" y="40.64"/>
<wire x1="86.36" y1="40.64" x2="129.54" y2="40.64" width="0.1524" layer="91"/>
<wire x1="129.54" y1="40.64" x2="144.78" y2="40.64" width="0.1524" layer="91"/>
<wire x1="129.54" y1="40.64" x2="129.54" y2="35.56" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="2"/>
<junction x="129.54" y="40.64"/>
<pinref part="+P10" gate="G$1" pin="VBAT"/>
<wire x1="129.54" y1="40.64" x2="129.54" y2="43.18" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="P"/>
<wire x1="76.2" y1="35.56" x2="76.2" y2="40.64" width="0.1524" layer="91"/>
<junction x="76.2" y="40.64"/>
<pinref part="CN1" gate="G$1" pin="8"/>
<wire x1="45.72" y1="33.02" x2="50.8" y2="33.02" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="4"/>
<wire x1="33.02" y1="33.02" x2="27.94" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="P"/>
<wire x1="86.36" y1="35.56" x2="86.36" y2="40.64" width="0.1524" layer="91"/>
<junction x="86.36" y="40.64"/>
</segment>
<segment>
<wire x1="40.64" y1="99.06" x2="38.1" y2="99.06" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="1"/>
<wire x1="38.1" y1="99.06" x2="27.94" y2="99.06" width="0.1524" layer="91"/>
<wire x1="27.94" y1="99.06" x2="22.86" y2="99.06" width="0.1524" layer="91"/>
<wire x1="27.94" y1="96.52" x2="27.94" y2="99.06" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="VIN"/>
<pinref part="R11" gate="G$1" pin="2"/>
<wire x1="38.1" y1="96.52" x2="38.1" y2="99.06" width="0.1524" layer="91"/>
<junction x="38.1" y="99.06"/>
<junction x="27.94" y="99.06"/>
<pinref part="+P11" gate="G$1" pin="VBAT"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="Q6" gate="G$1" pin="G"/>
<wire x1="383.54" y1="157.48" x2="381" y2="157.48" width="0.1524" layer="91"/>
<wire x1="381" y1="157.48" x2="381" y2="104.14" width="0.1524" layer="91"/>
<pinref part="R40" gate="G$1" pin="2"/>
<wire x1="350.52" y1="104.14" x2="363.22" y2="104.14" width="0.1524" layer="91"/>
<pinref part="R43" gate="G$1" pin="2"/>
<wire x1="363.22" y1="104.14" x2="381" y2="104.14" width="0.1524" layer="91"/>
<wire x1="363.22" y1="101.6" x2="363.22" y2="104.14" width="0.1524" layer="91"/>
<junction x="363.22" y="104.14"/>
</segment>
</net>
<net name="GATE_CHIP" class="0">
<segment>
<label x="297.18" y="88.9" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="R38" gate="G$1" pin="2"/>
<wire x1="302.26" y1="88.9" x2="297.18" y2="88.9" width="0.1524" layer="91"/>
<wire x1="302.26" y1="83.82" x2="302.26" y2="88.9" width="0.1524" layer="91"/>
<junction x="302.26" y="88.9"/>
<pinref part="U9" gate="G$1" pin="INA"/>
<wire x1="302.26" y1="88.9" x2="314.96" y2="88.9" width="0.1524" layer="91"/>
</segment>
<segment>
<label x="218.44" y="106.68" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="205.74" y1="106.68" x2="218.44" y2="106.68" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="PC2/OC0C/RXD0"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U9" gate="G$1" pin="OUTA"/>
<pinref part="R40" gate="G$1" pin="1"/>
<wire x1="340.36" y1="104.14" x2="342.9" y2="104.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="U9" gate="G$1" pin="OUTB"/>
<pinref part="R41" gate="G$1" pin="1"/>
<wire x1="340.36" y1="91.44" x2="342.9" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="OUT"/>
<pinref part="R28" gate="G$1" pin="1"/>
<wire x1="259.08" y1="180.34" x2="261.62" y2="180.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="R32" gate="G$1" pin="2"/>
<wire x1="287.02" y1="144.78" x2="294.64" y2="144.78" width="0.1524" layer="91"/>
<pinref part="R30" gate="G$1" pin="I1"/>
<wire x1="287.02" y1="165.1" x2="287.02" y2="144.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD2/OC0C/RXD0"/>
<pinref part="R19" gate="G$1" pin="1"/>
<wire x1="205.74" y1="83.82" x2="208.28" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PD3/OC0D/TXD0"/>
<pinref part="R20" gate="G$1" pin="1"/>
<wire x1="205.74" y1="81.28" x2="208.28" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="FB1" gate="G$1" pin="2"/>
<pinref part="CN1" gate="G$1" pin="2"/>
<wire x1="27.94" y1="27.94" x2="33.02" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="Q4" gate="G$1" pin="S"/>
<pinref part="R30" gate="G$1" pin="V2"/>
<wire x1="281.94" y1="177.8" x2="281.94" y2="182.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="TEMP" class="0">
<segment>
<pinref part="U4" gate="1" pin="VOUT"/>
<wire x1="134.62" y1="205.74" x2="139.7" y2="205.74" width="0.1524" layer="91"/>
<label x="139.7" y="205.74" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<label x="218.44" y="139.7" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PA3/ADC3"/>
<wire x1="218.44" y1="139.7" x2="205.74" y2="139.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="LED1" class="0">
<segment>
<wire x1="66.04" y1="218.44" x2="63.5" y2="218.44" width="0.1524" layer="91"/>
<label x="63.5" y="218.44" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="LED1" gate="G$1" pin="A"/>
<wire x1="66.04" y1="218.44" x2="66.04" y2="215.9" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="PD0/OC0A"/>
<wire x1="205.74" y1="88.9" x2="218.44" y2="88.9" width="0.1524" layer="91"/>
<label x="218.44" y="88.9" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="LED2" class="0">
<segment>
<wire x1="63.5" y1="220.98" x2="78.74" y2="220.98" width="0.1524" layer="91"/>
<label x="63.5" y="220.98" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="LED2" gate="G$1" pin="A"/>
<wire x1="78.74" y1="215.9" x2="78.74" y2="220.98" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="PD1/OC0B/XCK0"/>
<wire x1="205.74" y1="86.36" x2="218.44" y2="86.36" width="0.1524" layer="91"/>
<label x="218.44" y="86.36" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="LED2" gate="G$1" pin="K"/>
<pinref part="R23" gate="G$1" pin="2"/>
<wire x1="78.74" y1="210.82" x2="78.74" y2="208.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="K"/>
<pinref part="R22" gate="G$1" pin="2"/>
<wire x1="66.04" y1="210.82" x2="66.04" y2="208.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="LED3" gate="G$1" pin="K"/>
<pinref part="R24" gate="G$1" pin="2"/>
<wire x1="91.44" y1="210.82" x2="91.44" y2="208.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="2"/>
<wire x1="200.66" y1="218.44" x2="198.12" y2="218.44" width="0.1524" layer="91"/>
<wire x1="198.12" y1="218.44" x2="198.12" y2="213.36" width="0.1524" layer="91"/>
<wire x1="198.12" y1="213.36" x2="193.04" y2="213.36" width="0.1524" layer="91"/>
<pinref part="D4" gate="G$1" pin="A"/>
<wire x1="193.04" y1="213.36" x2="193.04" y2="215.9" width="0.1524" layer="91"/>
<pinref part="Q3" gate="G$1" pin="D"/>
<wire x1="193.04" y1="213.36" x2="193.04" y2="210.82" width="0.1524" layer="91"/>
<junction x="193.04" y="213.36"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="R25" gate="G$1" pin="2"/>
<pinref part="Q3" gate="G$1" pin="G"/>
<wire x1="185.42" y1="203.2" x2="187.96" y2="203.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PWR_FAN" class="0">
<segment>
<pinref part="R26" gate="G$1" pin="1"/>
<wire x1="182.88" y1="198.12" x2="175.26" y2="198.12" width="0.1524" layer="91"/>
<wire x1="175.26" y1="198.12" x2="175.26" y2="203.2" width="0.1524" layer="91"/>
<pinref part="R25" gate="G$1" pin="1"/>
<wire x1="175.26" y1="203.2" x2="177.8" y2="203.2" width="0.1524" layer="91"/>
<wire x1="175.26" y1="203.2" x2="170.18" y2="203.2" width="0.1524" layer="91"/>
<junction x="175.26" y="203.2"/>
<label x="170.18" y="203.2" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="205.74" y1="104.14" x2="218.44" y2="104.14" width="0.1524" layer="91"/>
<label x="218.44" y="104.14" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PC3/OC0D/TXD0"/>
</segment>
</net>
<net name="VOLT_REF" class="0">
<segment>
<wire x1="20.32" y1="208.28" x2="25.4" y2="208.28" width="0.1524" layer="91"/>
<pinref part="R21" gate="G$1" pin="1"/>
<wire x1="25.4" y1="208.28" x2="35.56" y2="208.28" width="0.1524" layer="91"/>
<wire x1="35.56" y1="208.28" x2="35.56" y2="210.82" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="K"/>
<wire x1="35.56" y1="208.28" x2="35.56" y2="203.2" width="0.1524" layer="91"/>
<pinref part="C17" gate="G$1" pin="1"/>
<wire x1="25.4" y1="205.74" x2="25.4" y2="208.28" width="0.1524" layer="91"/>
<junction x="35.56" y="208.28"/>
<junction x="25.4" y="208.28"/>
<label x="20.32" y="208.28" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<label x="218.44" y="124.46" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PB0/AREF/ADC8"/>
<wire x1="205.74" y1="124.46" x2="218.44" y2="124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="REF_V+" class="0">
<segment>
<pinref part="R21" gate="G$1" pin="2"/>
<wire x1="35.56" y1="218.44" x2="35.56" y2="220.98" width="0.1524" layer="91"/>
<label x="35.56" y="220.98" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="PA6/ADC6"/>
<wire x1="205.74" y1="132.08" x2="218.44" y2="132.08" width="0.1524" layer="91"/>
<label x="218.44" y="132.08" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="O2"/>
<pinref part="CN2" gate="G$1" pin="D-"/>
<wire x1="27.94" y1="137.16" x2="20.32" y2="137.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="CN2" gate="G$1" pin="D+"/>
<wire x1="20.32" y1="134.62" x2="25.4" y2="134.62" width="0.1524" layer="91"/>
<wire x1="25.4" y1="134.62" x2="25.4" y2="132.08" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="O1"/>
<wire x1="25.4" y1="132.08" x2="27.94" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="I1"/>
<pinref part="R16" gate="G$1" pin="1"/>
<wire x1="48.26" y1="132.08" x2="60.96" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<pinref part="R15" gate="G$1" pin="1"/>
<pinref part="U2" gate="G$1" pin="I2"/>
<wire x1="55.88" y1="137.16" x2="48.26" y2="137.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="R3" gate="G$1" pin="2"/>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="129.54" y1="27.94" x2="129.54" y2="25.4" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="2"/>
<wire x1="129.54" y1="25.4" x2="129.54" y2="22.86" width="0.1524" layer="91"/>
<wire x1="124.46" y1="25.4" x2="129.54" y2="25.4" width="0.1524" layer="91"/>
<junction x="129.54" y="25.4"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="R8" gate="G$1" pin="2"/>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="236.22" y1="27.94" x2="236.22" y2="25.4" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="236.22" y1="25.4" x2="236.22" y2="22.86" width="0.1524" layer="91"/>
<wire x1="236.22" y1="25.4" x2="241.3" y2="25.4" width="0.1524" layer="91"/>
<junction x="236.22" y="25.4"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U10" gate="G$1" pin="VI"/>
<wire x1="35.56" y1="162.56" x2="30.48" y2="162.56" width="0.1524" layer="91"/>
<pinref part="C24" gate="G$1" pin="1"/>
<wire x1="30.48" y1="162.56" x2="30.48" y2="160.02" width="0.1524" layer="91"/>
<wire x1="30.48" y1="162.56" x2="25.4" y2="162.56" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="V+"/>
<wire x1="38.1" y1="142.24" x2="38.1" y2="144.78" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="VBUS"/>
<wire x1="20.32" y1="139.7" x2="25.4" y2="139.7" width="0.1524" layer="91"/>
<wire x1="25.4" y1="139.7" x2="25.4" y2="144.78" width="0.1524" layer="91"/>
<wire x1="25.4" y1="144.78" x2="38.1" y2="144.78" width="0.1524" layer="91"/>
<wire x1="25.4" y1="162.56" x2="25.4" y2="144.78" width="0.1524" layer="91"/>
<junction x="30.48" y="162.56"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="U10" gate="G$1" pin="VO"/>
<wire x1="55.88" y1="162.56" x2="60.96" y2="162.56" width="0.1524" layer="91"/>
<pinref part="C25" gate="G$1" pin="1"/>
<wire x1="60.96" y1="162.56" x2="60.96" y2="160.02" width="0.1524" layer="91"/>
<wire x1="60.96" y1="162.56" x2="66.04" y2="162.56" width="0.1524" layer="91"/>
<junction x="60.96" y="162.56"/>
<pinref part="D10" gate="G$1" pin="A"/>
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
