<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.4">
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
<library name="Connector">
<packages>
<package name="USB-A-PLUG">
<wire x1="-6" y1="-17.8" x2="6" y2="-17.8" width="0.127" layer="21"/>
<wire x1="6" y1="-1.55" x2="6" y2="-17.8" width="0.127" layer="21"/>
<wire x1="-6" y1="-1.55" x2="-6" y2="-17.8" width="0.127" layer="21"/>
<wire x1="-4.7" y1="1" x2="4.7" y2="1" width="0.127" layer="21"/>
<pad name="1" x="3.5" y="2.4" drill="1"/>
<pad name="2" x="1" y="2.4" drill="1"/>
<pad name="3" x="-1" y="2.4" drill="1"/>
<pad name="4" x="-3.5" y="2.4" drill="1"/>
<pad name="S1" x="-5.85" y="0" drill="2.1" diameter="2.7"/>
<pad name="S2" x="5.85" y="0" drill="2.1" diameter="2.7"/>
<text x="-4" y="-10" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="-3" y="-10" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<hole x="-2.25" y="0" drill="1.3"/>
<hole x="2.25" y="0" drill="1.3"/>
<wire x1="-4.7" y1="1" x2="-6" y2="1" width="0.127" layer="51"/>
<wire x1="4.7" y1="1" x2="6" y2="1" width="0.127" layer="51"/>
<wire x1="-6" y1="1" x2="-6" y2="-1.55" width="0.127" layer="51"/>
<wire x1="6" y1="1" x2="6" y2="-1.55" width="0.127" layer="51"/>
<rectangle x1="-3.8" y1="1" x2="-3.2" y2="2.4" layer="51"/>
<rectangle x1="-1.3" y1="1" x2="-0.7" y2="2.4" layer="51"/>
<rectangle x1="0.7" y1="1" x2="1.3" y2="2.4" layer="51"/>
<rectangle x1="3.2" y1="1" x2="3.8" y2="2.4" layer="51"/>
<wire x1="-6" y1="-2.9" x2="0" y2="-2.9" width="0.127" layer="51"/>
<wire x1="0" y1="-2.9" x2="6" y2="-2.9" width="0.127" layer="51"/>
<wire x1="0" y1="-2.9" x2="0" y2="-5" width="0.127" layer="51"/>
<wire x1="0" y1="-5" x2="-0.4" y2="-4.8" width="0.127" layer="51"/>
<wire x1="-0.4" y1="-4.8" x2="-0.4" y2="-6.2" width="0.127" layer="51"/>
<wire x1="-0.4" y1="-6.2" x2="0" y2="-6" width="0.127" layer="51"/>
<wire x1="0" y1="-6" x2="0" y2="-14" width="0.127" layer="51"/>
<wire x1="0" y1="-14" x2="-0.4" y2="-13.8" width="0.127" layer="51"/>
<wire x1="-0.4" y1="-13.8" x2="-0.4" y2="-15.2" width="0.127" layer="51"/>
<wire x1="-0.4" y1="-15.2" x2="0" y2="-15" width="0.127" layer="51"/>
<wire x1="0" y1="-15" x2="0" y2="-17.8" width="0.127" layer="51"/>
</package>
<package name="XBEE-TH">
<wire x1="-12.19" y1="10.19" x2="-12.19" y2="-10.89" width="0.127" layer="21"/>
<wire x1="-12.19" y1="-10.89" x2="12.19" y2="-10.89" width="0.127" layer="21"/>
<wire x1="12.19" y1="-10.89" x2="12.19" y2="10.19" width="0.127" layer="21"/>
<wire x1="-4.6" y1="16.72" x2="4.6" y2="16.72" width="0.127" layer="21"/>
<wire x1="4.6" y1="16.72" x2="12.19" y2="10.19" width="0.127" layer="21"/>
<wire x1="-12.19" y1="10.19" x2="-4.6" y2="16.72" width="0.127" layer="21"/>
<pad name="1" x="-11" y="9" drill="0.8" shape="square"/>
<pad name="2" x="-11" y="7" drill="0.8"/>
<pad name="3" x="-11" y="5" drill="0.8"/>
<pad name="4" x="-11" y="3" drill="0.8"/>
<pad name="5" x="-11" y="1" drill="0.8"/>
<pad name="6" x="-11" y="-1" drill="0.8"/>
<pad name="7" x="-11" y="-3" drill="0.8"/>
<pad name="8" x="-11" y="-5" drill="0.8"/>
<pad name="9" x="-11" y="-7" drill="0.8"/>
<pad name="10" x="-11" y="-9" drill="0.8"/>
<pad name="11" x="11" y="-9" drill="0.8"/>
<pad name="12" x="11" y="-7" drill="0.8"/>
<pad name="13" x="11" y="-5" drill="0.8"/>
<pad name="14" x="11" y="-3" drill="0.8"/>
<pad name="15" x="11" y="-1" drill="0.8"/>
<pad name="16" x="11" y="1" drill="0.8"/>
<pad name="17" x="11" y="3" drill="0.8"/>
<pad name="18" x="11" y="5" drill="0.8"/>
<pad name="19" x="11" y="7" drill="0.8"/>
<pad name="20" x="11" y="9" drill="0.8"/>
<wire x1="-12.19" y1="-10.89" x2="-12.19" y2="-16.22" width="0.127" layer="51"/>
<wire x1="12.19" y1="-10.89" x2="12.19" y2="-16.22" width="0.127" layer="51"/>
<wire x1="12.19" y1="-16.22" x2="-12.19" y2="-16.22" width="0.127" layer="51"/>
<text x="-1.27" y="0" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.27" y="-1.27" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="XBEE-SMT">
<wire x1="-12.2" y1="-10.89" x2="12.2" y2="-10.89" width="0.127" layer="21"/>
<wire x1="-4.6" y1="16.72" x2="4.6" y2="16.72" width="0.127" layer="21"/>
<wire x1="4.6" y1="16.72" x2="12.2" y2="10.19" width="0.127" layer="21"/>
<wire x1="-12.2" y1="10.19" x2="-4.6" y2="16.72" width="0.127" layer="21"/>
<wire x1="-12.2" y1="-10.89" x2="-12.2" y2="-16.22" width="0.127" layer="51"/>
<wire x1="12.2" y1="-10.89" x2="12.2" y2="-16.22" width="0.127" layer="51"/>
<wire x1="12.2" y1="-16.22" x2="-12.2" y2="-16.22" width="0.127" layer="51"/>
<wire x1="-12.2" y1="10" x2="-9.8" y2="10" width="0.127" layer="21"/>
<wire x1="-9.8" y1="-10" x2="-12.2" y2="-10" width="0.127" layer="21"/>
<smd name="1" x="-9.75" y="9" dx="2.5" dy="0.8" layer="1"/>
<smd name="2" x="-12.25" y="7" dx="2.5" dy="0.8" layer="1"/>
<smd name="3" x="-9.75" y="5" dx="2.5" dy="0.8" layer="1"/>
<smd name="4" x="-12.25" y="3" dx="2.5" dy="0.8" layer="1"/>
<smd name="5" x="-9.75" y="1" dx="2.5" dy="0.8" layer="1"/>
<smd name="6" x="-12.25" y="-1" dx="2.5" dy="0.8" layer="1"/>
<smd name="7" x="-9.75" y="-3" dx="2.5" dy="0.8" layer="1"/>
<smd name="8" x="-12.25" y="-5" dx="2.5" dy="0.8" layer="1"/>
<smd name="9" x="-9.75" y="-7" dx="2.5" dy="0.8" layer="1"/>
<smd name="10" x="-12.25" y="-9" dx="2.5" dy="0.8" layer="1"/>
<wire x1="-12.2" y1="10" x2="-12.2" y2="7.55" width="0.127" layer="21"/>
<wire x1="-12.2" y1="6.45" x2="-12.2" y2="3.55" width="0.127" layer="21"/>
<wire x1="-12.2" y1="7.55" x2="-12.2" y2="6.45" width="0.127" layer="51"/>
<wire x1="-9.8" y1="10" x2="-9.8" y2="9.55" width="0.127" layer="21"/>
<wire x1="-9.8" y1="8.45" x2="-9.8" y2="5.55" width="0.127" layer="21"/>
<wire x1="-9.8" y1="9.55" x2="-9.8" y2="8.45" width="0.127" layer="51"/>
<wire x1="-12.2" y1="3.55" x2="-12.2" y2="2.45" width="0.127" layer="51"/>
<wire x1="-9.8" y1="4.45" x2="-9.8" y2="1.55" width="0.127" layer="21"/>
<wire x1="-9.8" y1="5.55" x2="-9.8" y2="4.45" width="0.127" layer="51"/>
<wire x1="-12.2" y1="2.45" x2="-12.2" y2="-0.45" width="0.127" layer="21"/>
<wire x1="-12.2" y1="-0.45" x2="-12.2" y2="-1.55" width="0.127" layer="51"/>
<wire x1="-9.8" y1="0.45" x2="-9.8" y2="-2.45" width="0.127" layer="21"/>
<wire x1="-9.8" y1="1.55" x2="-9.8" y2="0.45" width="0.127" layer="51"/>
<wire x1="-12.2" y1="-1.55" x2="-12.2" y2="-4.45" width="0.127" layer="21"/>
<wire x1="-12.2" y1="-4.45" x2="-12.2" y2="-5.55" width="0.127" layer="51"/>
<wire x1="-9.8" y1="-3.55" x2="-9.8" y2="-6.45" width="0.127" layer="21"/>
<wire x1="-9.8" y1="-2.45" x2="-9.8" y2="-3.55" width="0.127" layer="51"/>
<wire x1="-12.2" y1="-5.55" x2="-12.2" y2="-8.45" width="0.127" layer="21"/>
<wire x1="-12.2" y1="-8.45" x2="-12.2" y2="-9.55" width="0.127" layer="51"/>
<wire x1="-9.8" y1="-6.45" x2="-9.8" y2="-7.55" width="0.127" layer="51"/>
<wire x1="-9.8" y1="-7.55" x2="-9.8" y2="-10" width="0.127" layer="21"/>
<wire x1="-12.2" y1="-9.55" x2="-12.2" y2="-10" width="0.127" layer="21"/>
<wire x1="-12.2" y1="10" x2="-12.2" y2="10.19" width="0.127" layer="21"/>
<wire x1="-12.2" y1="-10.89" x2="-12.2" y2="-10" width="0.127" layer="21"/>
<wire x1="9.8" y1="10" x2="12.2" y2="10" width="0.127" layer="21"/>
<wire x1="12.2" y1="-10" x2="9.8" y2="-10" width="0.127" layer="21"/>
<smd name="11" x="9.75" y="-9" dx="2.5" dy="0.8" layer="1"/>
<wire x1="9.8" y1="10" x2="9.8" y2="7.55" width="0.127" layer="21"/>
<wire x1="9.8" y1="6.45" x2="9.8" y2="3.55" width="0.127" layer="21"/>
<wire x1="9.8" y1="7.55" x2="9.8" y2="6.45" width="0.127" layer="51"/>
<wire x1="12.2" y1="10" x2="12.2" y2="9.55" width="0.127" layer="21"/>
<wire x1="12.2" y1="8.45" x2="12.2" y2="5.55" width="0.127" layer="21"/>
<wire x1="12.2" y1="9.55" x2="12.2" y2="8.45" width="0.127" layer="51"/>
<wire x1="9.8" y1="3.55" x2="9.8" y2="2.45" width="0.127" layer="51"/>
<wire x1="12.2" y1="4.45" x2="12.2" y2="1.55" width="0.127" layer="21"/>
<wire x1="12.2" y1="5.55" x2="12.2" y2="4.45" width="0.127" layer="51"/>
<wire x1="9.8" y1="2.45" x2="9.8" y2="-0.45" width="0.127" layer="21"/>
<wire x1="9.8" y1="-0.45" x2="9.8" y2="-1.55" width="0.127" layer="51"/>
<wire x1="12.2" y1="0.45" x2="12.2" y2="-2.45" width="0.127" layer="21"/>
<wire x1="12.2" y1="1.55" x2="12.2" y2="0.45" width="0.127" layer="51"/>
<wire x1="9.8" y1="-1.55" x2="9.8" y2="-4.45" width="0.127" layer="21"/>
<wire x1="9.8" y1="-4.45" x2="9.8" y2="-5.55" width="0.127" layer="51"/>
<wire x1="12.2" y1="-3.55" x2="12.2" y2="-6.45" width="0.127" layer="21"/>
<wire x1="12.2" y1="-2.45" x2="12.2" y2="-3.55" width="0.127" layer="51"/>
<wire x1="9.8" y1="-5.55" x2="9.8" y2="-8.45" width="0.127" layer="21"/>
<wire x1="9.8" y1="-8.45" x2="9.8" y2="-9.55" width="0.127" layer="51"/>
<wire x1="12.2" y1="-6.45" x2="12.2" y2="-7.55" width="0.127" layer="51"/>
<wire x1="12.2" y1="-7.55" x2="12.2" y2="-10" width="0.127" layer="21"/>
<wire x1="9.8" y1="-9.55" x2="9.8" y2="-10" width="0.127" layer="21"/>
<wire x1="12.2" y1="10" x2="12.2" y2="10.19" width="0.127" layer="21"/>
<wire x1="12.2" y1="-10.89" x2="12.2" y2="-10" width="0.127" layer="21"/>
<smd name="12" x="12.25" y="-7" dx="2.5" dy="0.8" layer="1"/>
<smd name="13" x="9.75" y="-5" dx="2.5" dy="0.8" layer="1"/>
<smd name="14" x="12.25" y="-3" dx="2.5" dy="0.8" layer="1"/>
<smd name="15" x="9.75" y="-1" dx="2.5" dy="0.8" layer="1"/>
<smd name="16" x="12.25" y="1" dx="2.5" dy="0.8" layer="1"/>
<smd name="17" x="9.75" y="3" dx="2.5" dy="0.8" layer="1"/>
<smd name="18" x="12.25" y="5" dx="2.5" dy="0.8" layer="1"/>
<smd name="19" x="9.75" y="7" dx="2.5" dy="0.8" layer="1"/>
<smd name="20" x="12.25" y="9" dx="2.5" dy="0.8" layer="1"/>
<text x="-1.27" y="0" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.27" y="-1.27" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="XBEE-TH-NOSILK">
<wire x1="-12.19" y1="10.19" x2="-12.19" y2="-10.89" width="0.127" layer="51"/>
<wire x1="-12.19" y1="-10.89" x2="12.19" y2="-10.89" width="0.127" layer="51"/>
<wire x1="12.19" y1="-10.89" x2="12.19" y2="10.19" width="0.127" layer="51"/>
<wire x1="-4.6" y1="16.72" x2="4.6" y2="16.72" width="0.127" layer="51"/>
<wire x1="4.6" y1="16.72" x2="12.19" y2="10.19" width="0.127" layer="51"/>
<wire x1="-12.19" y1="10.19" x2="-4.6" y2="16.72" width="0.127" layer="51"/>
<pad name="1" x="-11" y="9" drill="0.8" shape="square"/>
<pad name="2" x="-11" y="7" drill="0.8"/>
<pad name="3" x="-11" y="5" drill="0.8"/>
<pad name="4" x="-11" y="3" drill="0.8"/>
<pad name="5" x="-11" y="1" drill="0.8"/>
<pad name="6" x="-11" y="-1" drill="0.8"/>
<pad name="7" x="-11" y="-3" drill="0.8"/>
<pad name="8" x="-11" y="-5" drill="0.8"/>
<pad name="9" x="-11" y="-7" drill="0.8"/>
<pad name="10" x="-11" y="-9" drill="0.8"/>
<pad name="11" x="11" y="-9" drill="0.8"/>
<pad name="12" x="11" y="-7" drill="0.8"/>
<pad name="13" x="11" y="-5" drill="0.8"/>
<pad name="14" x="11" y="-3" drill="0.8"/>
<pad name="15" x="11" y="-1" drill="0.8"/>
<pad name="16" x="11" y="1" drill="0.8"/>
<pad name="17" x="11" y="3" drill="0.8"/>
<pad name="18" x="11" y="5" drill="0.8"/>
<pad name="19" x="11" y="7" drill="0.8"/>
<pad name="20" x="11" y="9" drill="0.8"/>
<wire x1="-12.19" y1="-10.89" x2="-12.19" y2="-16.22" width="0.127" layer="51"/>
<wire x1="12.19" y1="-10.89" x2="12.19" y2="-16.22" width="0.127" layer="51"/>
<wire x1="12.19" y1="-16.22" x2="-12.19" y2="-16.22" width="0.127" layer="51"/>
<text x="-1.27" y="0" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.27" y="-1.27" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
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
</packages>
<symbols>
<symbol name="USB-A-PLUG">
<wire x1="-2.54" y1="3.81" x2="-2.54" y2="-6.35" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-6.35" x2="2.54" y2="-6.35" width="0.254" layer="94"/>
<wire x1="2.54" y1="-6.35" x2="2.54" y2="3.81" width="0.254" layer="94"/>
<wire x1="2.54" y1="3.81" x2="-2.54" y2="3.81" width="0.254" layer="94"/>
<wire x1="3.81" y1="-7.62" x2="-2.54" y2="-7.62" width="0.254" layer="94" style="shortdash"/>
<wire x1="0" y1="2.54" x2="0" y2="-5.08" width="0.254" layer="94"/>
<wire x1="0" y1="-5.08" x2="1.27" y2="-5.08" width="0.254" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="2.54" width="0.254" layer="94"/>
<wire x1="1.27" y1="2.54" x2="0" y2="2.54" width="0.254" layer="94"/>
<text x="-5.08" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-5.08" y="5.588" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VBUS" x="5.08" y="2.54" length="short" direction="pas" rot="R180"/>
<pin name="D-" x="5.08" y="0" length="short" direction="pas" rot="R180"/>
<pin name="D+" x="5.08" y="-2.54" length="short" direction="pas" rot="R180"/>
<pin name="GND" x="5.08" y="-5.08" length="short" direction="pas" rot="R180"/>
<pin name="S1" x="0" y="-10.16" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S2" x="2.54" y="-10.16" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
<symbol name="XBEE">
<pin name="VCC" x="-22.86" y="10.16" length="short"/>
<pin name="DOUT" x="-22.86" y="7.62" length="short"/>
<pin name="DIN/!CONFIG" x="-22.86" y="5.08" length="short"/>
<pin name="DIO12" x="-22.86" y="2.54" length="short"/>
<pin name="!RESET" x="-22.86" y="0" length="short"/>
<pin name="RSSI/PWM/DIO10" x="-22.86" y="-2.54" length="short"/>
<pin name="DIO11" x="-22.86" y="-5.08" length="short"/>
<pin name="RSVD" x="-22.86" y="-7.62" length="short"/>
<pin name="!DTR!/SLEEP_RQ/DIO8" x="-22.86" y="-10.16" length="short"/>
<pin name="GND" x="-22.86" y="-12.7" length="short"/>
<pin name="COM_BTN/AD0/DIO0" x="22.86" y="10.16" length="short" rot="R180"/>
<pin name="AD1/DIO1" x="22.86" y="7.62" length="short" rot="R180"/>
<pin name="AD2/DIO2" x="22.86" y="5.08" length="short" rot="R180"/>
<pin name="AD3/DIO3" x="22.86" y="2.54" length="short" rot="R180"/>
<pin name="!RTS!/DIO6" x="22.86" y="0" length="short" rot="R180"/>
<pin name="ASSOC/DIO5" x="22.86" y="-2.54" length="short" rot="R180"/>
<pin name="VREF" x="22.86" y="-5.08" length="short" rot="R180"/>
<pin name="ON/!SLEEP" x="22.86" y="-7.62" length="short" rot="R180"/>
<pin name="!CTS!/DIO7" x="22.86" y="-10.16" length="short" rot="R180"/>
<pin name="DIO4" x="22.86" y="-12.7" length="short" rot="R180"/>
<wire x1="-20.32" y1="12.7" x2="-20.32" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-20.32" y1="-15.24" x2="20.32" y2="-15.24" width="0.254" layer="94"/>
<wire x1="20.32" y1="-15.24" x2="20.32" y2="12.7" width="0.254" layer="94"/>
<wire x1="20.32" y1="12.7" x2="-20.32" y2="12.7" width="0.254" layer="94"/>
<text x="-20.32" y="13.208" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="20.32" y="-17.526" size="1.778" layer="96" font="vector" align="bottom-right">&gt;VALUE</text>
</symbol>
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
</symbols>
<devicesets>
<deviceset name="USB-A-PLUG" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="USB-A-PLUG" x="0" y="0"/>
</gates>
<devices>
<device name="" package="USB-A-PLUG">
<connects>
<connect gate="G$1" pin="D+" pad="3"/>
<connect gate="G$1" pin="D-" pad="2"/>
<connect gate="G$1" pin="GND" pad="4"/>
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
<deviceset name="XBEE-*" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="XBEE" x="0" y="0"/>
</gates>
<devices>
<device name="TH" package="XBEE-TH">
<connects>
<connect gate="G$1" pin="!CTS!/DIO7" pad="12"/>
<connect gate="G$1" pin="!DTR!/SLEEP_RQ/DIO8" pad="9"/>
<connect gate="G$1" pin="!RESET" pad="5"/>
<connect gate="G$1" pin="!RTS!/DIO6" pad="16"/>
<connect gate="G$1" pin="AD1/DIO1" pad="19"/>
<connect gate="G$1" pin="AD2/DIO2" pad="18"/>
<connect gate="G$1" pin="AD3/DIO3" pad="17"/>
<connect gate="G$1" pin="ASSOC/DIO5" pad="15"/>
<connect gate="G$1" pin="COM_BTN/AD0/DIO0" pad="20"/>
<connect gate="G$1" pin="DIN/!CONFIG" pad="3"/>
<connect gate="G$1" pin="DIO11" pad="7"/>
<connect gate="G$1" pin="DIO12" pad="4"/>
<connect gate="G$1" pin="DIO4" pad="11"/>
<connect gate="G$1" pin="DOUT" pad="2"/>
<connect gate="G$1" pin="GND" pad="10"/>
<connect gate="G$1" pin="ON/!SLEEP" pad="13"/>
<connect gate="G$1" pin="RSSI/PWM/DIO10" pad="6"/>
<connect gate="G$1" pin="RSVD" pad="8"/>
<connect gate="G$1" pin="VCC" pad="1"/>
<connect gate="G$1" pin="VREF" pad="14"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMT" package="XBEE-SMT">
<connects>
<connect gate="G$1" pin="!CTS!/DIO7" pad="12"/>
<connect gate="G$1" pin="!DTR!/SLEEP_RQ/DIO8" pad="9"/>
<connect gate="G$1" pin="!RESET" pad="5"/>
<connect gate="G$1" pin="!RTS!/DIO6" pad="16"/>
<connect gate="G$1" pin="AD1/DIO1" pad="19"/>
<connect gate="G$1" pin="AD2/DIO2" pad="18"/>
<connect gate="G$1" pin="AD3/DIO3" pad="17"/>
<connect gate="G$1" pin="ASSOC/DIO5" pad="15"/>
<connect gate="G$1" pin="COM_BTN/AD0/DIO0" pad="20"/>
<connect gate="G$1" pin="DIN/!CONFIG" pad="3"/>
<connect gate="G$1" pin="DIO11" pad="7"/>
<connect gate="G$1" pin="DIO12" pad="4"/>
<connect gate="G$1" pin="DIO4" pad="11"/>
<connect gate="G$1" pin="DOUT" pad="2"/>
<connect gate="G$1" pin="GND" pad="10"/>
<connect gate="G$1" pin="ON/!SLEEP" pad="13"/>
<connect gate="G$1" pin="RSSI/PWM/DIO10" pad="6"/>
<connect gate="G$1" pin="RSVD" pad="8"/>
<connect gate="G$1" pin="VCC" pad="1"/>
<connect gate="G$1" pin="VREF" pad="14"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TH-NOSILK" package="XBEE-TH-NOSILK">
<connects>
<connect gate="G$1" pin="!CTS!/DIO7" pad="12"/>
<connect gate="G$1" pin="!DTR!/SLEEP_RQ/DIO8" pad="9"/>
<connect gate="G$1" pin="!RESET" pad="5"/>
<connect gate="G$1" pin="!RTS!/DIO6" pad="16"/>
<connect gate="G$1" pin="AD1/DIO1" pad="19"/>
<connect gate="G$1" pin="AD2/DIO2" pad="18"/>
<connect gate="G$1" pin="AD3/DIO3" pad="17"/>
<connect gate="G$1" pin="ASSOC/DIO5" pad="15"/>
<connect gate="G$1" pin="COM_BTN/AD0/DIO0" pad="20"/>
<connect gate="G$1" pin="DIN/!CONFIG" pad="3"/>
<connect gate="G$1" pin="DIO11" pad="7"/>
<connect gate="G$1" pin="DIO12" pad="4"/>
<connect gate="G$1" pin="DIO4" pad="11"/>
<connect gate="G$1" pin="DOUT" pad="2"/>
<connect gate="G$1" pin="GND" pad="10"/>
<connect gate="G$1" pin="ON/!SLEEP" pad="13"/>
<connect gate="G$1" pin="RSSI/PWM/DIO10" pad="6"/>
<connect gate="G$1" pin="RSVD" pad="8"/>
<connect gate="G$1" pin="VCC" pad="1"/>
<connect gate="G$1" pin="VREF" pad="14"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
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
</devicesets>
</library>
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
<symbol name="VBUS">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="VBUS" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+3V3/2">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+3V3/2" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
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
<deviceset name="VBUS" prefix="+P">
<gates>
<gate name="G$1" symbol="VBUS" x="0" y="0"/>
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
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-Microchip">
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
</packages>
<symbols>
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
<library name="ic-package">
<packages>
<package name="TERMINAL">
<smd name="1" x="0" y="0" dx="2" dy="0.6" layer="1" roundness="25" cream="no"/>
<text x="1.143" y="-0.508" size="1.016" layer="21" font="vector" ratio="13">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="TERMINAL">
<wire x1="2.54" y1="1.27" x2="-5.08" y2="1.27" width="0.254" layer="94"/>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-1.27" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<text x="2.286" y="0.889" size="1.778" layer="94" font="vector" rot="R180">&gt;VALUE</text>
<pin name="1" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TERMINAL" prefix="T" uservalue="yes">
<gates>
<gate name="G$1" symbol="TERMINAL" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TERMINAL">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-Vishay">
<packages>
<package name="VCNL4020">
<text x="-2.54" y="2.54" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<smd name="3" x="-0.43" y="-1.3" dx="0.4" dy="1.4" layer="1"/>
<smd name="2" x="-1.115" y="-1.3" dx="0.4" dy="1.4" layer="1"/>
<smd name="1" x="-1.8" y="-1.3" dx="0.4" dy="1.4" layer="1"/>
<smd name="4" x="0.255" y="-1.3" dx="0.4" dy="1.4" layer="1"/>
<smd name="5" x="0.94" y="-1.3" dx="0.4" dy="1.4" layer="1"/>
<smd name="6" x="1.83" y="1.3" dx="0.4" dy="1.4" layer="1" rot="R180"/>
<smd name="7" x="1.15" y="1.3" dx="0.4" dy="1.4" layer="1" rot="R180"/>
<smd name="8" x="0.15" y="1.3" dx="0.4" dy="1.4" layer="1" rot="R180"/>
<smd name="9" x="-0.5" y="1.3" dx="0.4" dy="1.4" layer="1" rot="R180"/>
<smd name="10" x="-1.665" y="1.3" dx="0.83" dy="1.4" layer="1" rot="R180"/>
<circle x="-1.8" y="-0.25" radius="0.15" width="0.127" layer="21"/>
<wire x1="-2.45" y1="1.2" x2="-2.45" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-2.45" y1="1.2" x2="-2.25" y2="1.2" width="0.127" layer="21"/>
<wire x1="-1.05" y1="1.2" x2="-0.9" y2="1.2" width="0.127" layer="21"/>
<wire x1="0.55" y1="1.2" x2="0.75" y2="1.2" width="0.127" layer="21"/>
<wire x1="2.2" y1="1.2" x2="2.45" y2="1.2" width="0.127" layer="21"/>
<wire x1="2.45" y1="1.2" x2="2.45" y2="-1.2" width="0.127" layer="21"/>
<wire x1="2.45" y1="-1.2" x2="1.35" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-2.2" y1="-1.2" x2="-2.45" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-2.26" y1="0.87" x2="-2.26" y2="-0.73" width="0.127" layer="51"/>
<wire x1="-2.26" y1="-0.73" x2="-1.26" y2="-0.73" width="0.127" layer="51"/>
<wire x1="-1.26" y1="-0.73" x2="-1.26" y2="0.87" width="0.127" layer="51"/>
<wire x1="-1.26" y1="0.87" x2="-2.26" y2="0.87" width="0.127" layer="51"/>
<wire x1="-0.77" y1="0.8" x2="-0.77" y2="-0.2" width="0.127" layer="51"/>
<wire x1="-0.77" y1="-0.2" x2="-0.07" y2="-0.2" width="0.127" layer="51"/>
<wire x1="-0.07" y1="-0.2" x2="-0.07" y2="0.8" width="0.127" layer="51"/>
<wire x1="-0.07" y1="0.8" x2="-0.77" y2="0.8" width="0.127" layer="51"/>
<wire x1="1.2" y1="0.95" x2="1.2" y2="-0.35" width="0.127" layer="51"/>
<wire x1="1.2" y1="-0.35" x2="2.2" y2="-0.35" width="0.127" layer="51"/>
<wire x1="2.2" y1="-0.35" x2="2.2" y2="0.95" width="0.127" layer="51"/>
<wire x1="2.2" y1="0.95" x2="1.2" y2="0.95" width="0.127" layer="51"/>
<wire x1="-2.25" y1="1.2" x2="-1.05" y2="1.2" width="0.127" layer="51"/>
<wire x1="-0.9" y1="1.2" x2="0.55" y2="1.2" width="0.127" layer="51"/>
<wire x1="0.75" y1="1.2" x2="2.2" y2="1.2" width="0.127" layer="51"/>
<wire x1="-2.2" y1="-1.2" x2="1.35" y2="-1.2" width="0.127" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="VCNL4010">
<text x="-10.16" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-10.16" y="-10.16" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<wire x1="-10.16" y1="7.62" x2="-10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-7.62" x2="10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="10.16" y2="7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="7.62" x2="-10.16" y2="7.62" width="0.254" layer="94"/>
<pin name="VDD" x="-12.7" y="2.54" length="short"/>
<pin name="GND" x="-12.7" y="-5.08" length="short"/>
<pin name="IR_A" x="-12.7" y="5.08" length="short"/>
<pin name="IR_C" x="12.7" y="5.08" length="short" rot="R180"/>
<pin name="SCL" x="12.7" y="-2.54" length="short" rot="R180"/>
<pin name="SDA" x="12.7" y="-5.08" length="short" rot="R180"/>
<pin name="INT" x="12.7" y="0" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="VCNL4020" prefix="U">
<gates>
<gate name="G$1" symbol="VCNL4010" x="0" y="0"/>
</gates>
<devices>
<device name="" package="VCNL4020">
<connects>
<connect gate="G$1" pin="GND" pad="8 9"/>
<connect gate="G$1" pin="INT" pad="3"/>
<connect gate="G$1" pin="IR_A" pad="1"/>
<connect gate="G$1" pin="IR_C" pad="10"/>
<connect gate="G$1" pin="SCL" pad="4"/>
<connect gate="G$1" pin="SDA" pad="2"/>
<connect gate="G$1" pin="VDD" pad="5"/>
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
<package name="VISHAY-RGW">
<smd name="K" x="2.55" y="0" dx="1.6" dy="0.75" layer="1"/>
<smd name="A" x="-2.55" y="0" dx="1.6" dy="0.75" layer="1"/>
<text x="-2.54" y="1.27" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<wire x1="-1.15" y1="1.15" x2="-1.15" y2="0.75" width="0.127" layer="21"/>
<wire x1="-1.15" y1="0.75" x2="-1.15" y2="-1.15" width="0.127" layer="21"/>
<wire x1="-1.15" y1="-1.15" x2="1.15" y2="-1.15" width="0.127" layer="21"/>
<wire x1="1.15" y1="-1.15" x2="1.15" y2="1.15" width="0.127" layer="21"/>
<wire x1="1.15" y1="1.15" x2="-0.75" y2="1.15" width="0.127" layer="21"/>
<rectangle x1="-2.9" y1="-0.25" x2="-1.15" y2="0.25" layer="51"/>
<rectangle x1="1.15" y1="-0.2" x2="2.9" y2="0.2" layer="51"/>
<wire x1="-0.75" y1="1.15" x2="-1.15" y2="1.15" width="0.127" layer="21"/>
<wire x1="-0.75" y1="1.15" x2="-1.15" y2="0.75" width="0.127" layer="21"/>
<hole x="0" y="0" drill="2"/>
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
<deviceset name="VSMY2850" prefix="LED">
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="RG" package="VISHAY-RGW">
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
<library name="ProjectOnly">
<description>プロジェクト限定のライブラリ</description>
<packages>
<package name="S6809">
<text x="-2.54" y="5.08" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="3.81" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<wire x1="-2.7" y1="2.7" x2="2.7" y2="2.7" width="0" layer="20"/>
<wire x1="2.7" y1="2.7" x2="2.7" y2="-2.7" width="0" layer="20"/>
<wire x1="2.7" y1="-2.7" x2="-2.7" y2="-2.7" width="0" layer="20"/>
<wire x1="-2.7" y1="-2.7" x2="-2.7" y2="2.7" width="0" layer="20"/>
<wire x1="-0.45" y1="0.9" x2="-0.45" y2="0" width="0.127" layer="51"/>
<wire x1="-0.45" y1="0" x2="0.45" y2="0" width="0.127" layer="51"/>
<wire x1="0.45" y1="0" x2="0.45" y2="0.9" width="0.127" layer="51"/>
<wire x1="0.45" y1="0.9" x2="-0.45" y2="0.9" width="0.127" layer="51"/>
<rectangle x1="-0.885" y1="-4.5" x2="-0.385" y2="-2.5" layer="51"/>
<wire x1="-2.5" y1="2.5" x2="2.5" y2="2.5" width="0.127" layer="51"/>
<wire x1="2.5" y1="2.5" x2="2.5" y2="-2.5" width="0.127" layer="51"/>
<wire x1="2.5" y1="-2.5" x2="-2.5" y2="-2.5" width="0.127" layer="51"/>
<wire x1="-2.5" y1="-2.5" x2="-2.5" y2="2.5" width="0.127" layer="51"/>
<rectangle x1="0.385" y1="-4.5" x2="0.885" y2="-2.5" layer="51"/>
<rectangle x1="1.655" y1="-4.5" x2="2.155" y2="-2.5" layer="51"/>
<rectangle x1="-2.155" y1="-4.5" x2="-1.655" y2="-2.5" layer="51"/>
<smd name="1" x="1.905" y="-4" dx="0.8" dy="2" layer="1"/>
<smd name="2" x="0.635" y="-4" dx="0.8" dy="2" layer="1"/>
<smd name="3" x="-0.635" y="-4.2" dx="0.8" dy="1.6" layer="1"/>
<smd name="4" x="-1.905" y="-4.2" dx="0.8" dy="1.6" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="S6809">
<text x="-5.08" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-5.08" y="-7.62" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<wire x1="-5.08" y1="7.62" x2="-5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="5.08" y2="7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="7.62" x2="-5.08" y2="7.62" width="0.254" layer="94"/>
<pin name="VCC" x="-7.62" y="5.08" length="short"/>
<pin name="LED" x="7.62" y="2.54" length="short" rot="R180"/>
<pin name="VOUT" x="7.62" y="0" length="short" rot="R180"/>
<pin name="GND" x="-7.62" y="-2.54" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="S6809" prefix="U">
<gates>
<gate name="G$1" symbol="S6809" x="0" y="0"/>
</gates>
<devices>
<device name="-SMD" package="S6809">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="LED" pad="3"/>
<connect gate="G$1" pin="VCC" pad="4"/>
<connect gate="G$1" pin="VOUT" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-FTDI">
<description>FTDI</description>
<packages>
<package name="QFP64-0.5">
<wire x1="-4.5" y1="-4.8" x2="4.5" y2="-4.8" width="0.127" layer="21"/>
<wire x1="4.8" y1="-4.5" x2="4.8" y2="4.5" width="0.127" layer="21"/>
<wire x1="4.5" y1="4.8" x2="-4.5" y2="4.8" width="0.127" layer="21"/>
<wire x1="-4.5" y1="4.8" x2="-4.8" y2="4.5" width="0.127" layer="21"/>
<wire x1="-4.8" y1="4.5" x2="-4.8" y2="-4.5" width="0.127" layer="21"/>
<wire x1="-4.8" y1="-4.5" x2="-4.5" y2="-4.8" width="0.127" layer="21"/>
<wire x1="4.5" y1="-4.8" x2="4.8" y2="-4.5" width="0.127" layer="21"/>
<wire x1="4.8" y1="4.5" x2="4.5" y2="4.8" width="0.127" layer="21"/>
<wire x1="4.6" y1="5" x2="5" y2="4.6" width="0.127" layer="51"/>
<wire x1="5" y1="4.6" x2="5" y2="-4.6" width="0.127" layer="51"/>
<wire x1="5" y1="-4.6" x2="4.6" y2="-5" width="0.127" layer="51"/>
<wire x1="4.6" y1="-5" x2="-4.6" y2="-5" width="0.127" layer="51"/>
<wire x1="-4.6" y1="-5" x2="-5" y2="-4.6" width="0.127" layer="51"/>
<wire x1="-5" y1="-4.6" x2="-5" y2="4.6" width="0.127" layer="51"/>
<wire x1="-5" y1="4.6" x2="-4.6" y2="5" width="0.127" layer="51"/>
<wire x1="-4.6" y1="5" x2="4.6" y2="5" width="0.127" layer="51"/>
<circle x="-4" y="4" radius="0.2499" width="0.127" layer="21"/>
<smd name="1" x="-6" y="3.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="2" x="-6" y="3.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="3" x="-6" y="2.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="4" x="-6" y="2.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="5" x="-6" y="1.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="6" x="-6" y="1.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="7" x="-6" y="0.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="8" x="-6" y="0.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="9" x="-6" y="-0.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="10" x="-6" y="-0.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="11" x="-6" y="-1.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="12" x="-6" y="-1.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="17" x="-3.75" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="33" x="6" y="-3.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="49" x="3.75" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="13" x="-6" y="-2.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="14" x="-6" y="-2.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="15" x="-6" y="-3.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="16" x="-6" y="-3.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="18" x="-3.25" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="19" x="-2.75" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="20" x="-2.25" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="21" x="-1.75" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="22" x="-1.25" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="23" x="-0.75" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="24" x="-0.25" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="25" x="0.25" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="26" x="0.75" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="27" x="1.25" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="28" x="1.75" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="29" x="2.25" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="30" x="2.75" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="31" x="3.25" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="32" x="3.75" y="-6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="34" x="6" y="-3.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="35" x="6" y="-2.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="36" x="6" y="-2.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="37" x="6" y="-1.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="38" x="6" y="-1.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="39" x="6" y="-0.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="40" x="6" y="-0.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="41" x="6" y="0.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="42" x="6" y="0.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="43" x="6" y="1.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="44" x="6" y="1.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="45" x="6" y="2.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="46" x="6" y="2.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="47" x="6" y="3.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="48" x="6" y="3.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="50" x="3.25" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="51" x="2.75" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="52" x="2.25" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="53" x="1.75" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="54" x="1.25" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="55" x="0.75" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="56" x="0.25" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="57" x="-0.25" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="58" x="-0.75" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="59" x="-1.25" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="60" x="-1.75" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="61" x="-2.25" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="62" x="-2.75" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="63" x="-3.25" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<smd name="64" x="-3.75" y="6" dx="1.4" dy="0.25" layer="1" rot="R90"/>
<text x="-3.81" y="0" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-3.81" y="-1.27" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-6" y1="3.625" x2="-5" y2="3.875" layer="51"/>
<rectangle x1="-6" y1="3.125" x2="-5" y2="3.375" layer="51"/>
<rectangle x1="-6" y1="2.625" x2="-5" y2="2.875" layer="51"/>
<rectangle x1="-6" y1="2.125" x2="-5" y2="2.375" layer="51"/>
<rectangle x1="-6" y1="1.625" x2="-5" y2="1.875" layer="51"/>
<rectangle x1="-6" y1="1.125" x2="-5" y2="1.375" layer="51"/>
<rectangle x1="-6" y1="0.625" x2="-5" y2="0.875" layer="51"/>
<rectangle x1="-3.875" y1="-6" x2="-3.625" y2="-5" layer="51"/>
<rectangle x1="-6" y1="0.125" x2="-5" y2="0.375" layer="51"/>
<rectangle x1="-6" y1="-0.375" x2="-5" y2="-0.125" layer="51"/>
<rectangle x1="-6" y1="-0.875" x2="-5" y2="-0.625" layer="51"/>
<rectangle x1="-6" y1="-1.375" x2="-5" y2="-1.125" layer="51"/>
<rectangle x1="-6" y1="-1.875" x2="-5" y2="-1.625" layer="51"/>
<rectangle x1="5" y1="-3.875" x2="6" y2="-3.625" layer="51" rot="R180"/>
<rectangle x1="3.625" y1="5" x2="3.875" y2="6" layer="51"/>
<rectangle x1="-6" y1="-2.375" x2="-5" y2="-2.125" layer="51"/>
<rectangle x1="-6" y1="-2.875" x2="-5" y2="-2.625" layer="51"/>
<rectangle x1="-6" y1="-3.375" x2="-5" y2="-3.125" layer="51"/>
<rectangle x1="-6" y1="-3.875" x2="-5" y2="-3.625" layer="51"/>
<rectangle x1="-3.375" y1="-6" x2="-3.125" y2="-5" layer="51"/>
<rectangle x1="-2.875" y1="-6" x2="-2.625" y2="-5" layer="51"/>
<rectangle x1="-2.375" y1="-6" x2="-2.125" y2="-5" layer="51"/>
<rectangle x1="-1.875" y1="-6" x2="-1.625" y2="-5" layer="51"/>
<rectangle x1="-1.375" y1="-6" x2="-1.125" y2="-5" layer="51"/>
<rectangle x1="-0.875" y1="-6" x2="-0.625" y2="-5" layer="51"/>
<rectangle x1="-0.375" y1="-6" x2="-0.125" y2="-5" layer="51"/>
<rectangle x1="0.125" y1="-6" x2="0.375" y2="-5" layer="51"/>
<rectangle x1="0.625" y1="-6" x2="0.875" y2="-5" layer="51"/>
<rectangle x1="1.125" y1="-6" x2="1.375" y2="-5" layer="51"/>
<rectangle x1="1.625" y1="-6" x2="1.875" y2="-5" layer="51"/>
<rectangle x1="2.125" y1="-6" x2="2.375" y2="-5" layer="51"/>
<rectangle x1="2.625" y1="-6" x2="2.875" y2="-5" layer="51"/>
<rectangle x1="3.125" y1="-6" x2="3.375" y2="-5" layer="51"/>
<rectangle x1="3.625" y1="-6" x2="3.875" y2="-5" layer="51"/>
<rectangle x1="5" y1="-3.375" x2="6" y2="-3.125" layer="51" rot="R180"/>
<rectangle x1="5" y1="-2.875" x2="6" y2="-2.625" layer="51" rot="R180"/>
<rectangle x1="5" y1="-2.375" x2="6" y2="-2.125" layer="51" rot="R180"/>
<rectangle x1="5" y1="-1.875" x2="6" y2="-1.625" layer="51" rot="R180"/>
<rectangle x1="5" y1="-1.375" x2="6" y2="-1.125" layer="51" rot="R180"/>
<rectangle x1="5" y1="-0.875" x2="6" y2="-0.625" layer="51" rot="R180"/>
<rectangle x1="5" y1="-0.375" x2="6" y2="-0.125" layer="51" rot="R180"/>
<rectangle x1="5" y1="0.125" x2="6" y2="0.375" layer="51" rot="R180"/>
<rectangle x1="5" y1="0.625" x2="6" y2="0.875" layer="51" rot="R180"/>
<rectangle x1="5" y1="1.125" x2="6" y2="1.375" layer="51" rot="R180"/>
<rectangle x1="5" y1="1.625" x2="6" y2="1.875" layer="51" rot="R180"/>
<rectangle x1="5" y1="2.125" x2="6" y2="2.375" layer="51" rot="R180"/>
<rectangle x1="5" y1="2.625" x2="6" y2="2.875" layer="51" rot="R180"/>
<rectangle x1="5" y1="3.125" x2="6" y2="3.375" layer="51" rot="R180"/>
<rectangle x1="5" y1="3.625" x2="6" y2="3.875" layer="51" rot="R180"/>
<rectangle x1="3.125" y1="5" x2="3.375" y2="6" layer="51"/>
<rectangle x1="2.625" y1="5" x2="2.875" y2="6" layer="51"/>
<rectangle x1="2.125" y1="5" x2="2.375" y2="6" layer="51"/>
<rectangle x1="1.625" y1="5" x2="1.875" y2="6" layer="51"/>
<rectangle x1="1.125" y1="5" x2="1.375" y2="6" layer="51"/>
<rectangle x1="0.625" y1="5" x2="0.875" y2="6" layer="51"/>
<rectangle x1="0.125" y1="5" x2="0.375" y2="6" layer="51"/>
<rectangle x1="-0.375" y1="5" x2="-0.125" y2="6" layer="51"/>
<rectangle x1="-0.875" y1="5" x2="-0.625" y2="6" layer="51"/>
<rectangle x1="-1.375" y1="5" x2="-1.125" y2="6" layer="51"/>
<rectangle x1="-1.875" y1="5" x2="-1.625" y2="6" layer="51"/>
<rectangle x1="-2.375" y1="5" x2="-2.125" y2="6" layer="51"/>
<rectangle x1="-2.875" y1="5" x2="-2.625" y2="6" layer="51"/>
<rectangle x1="-3.375" y1="5" x2="-3.125" y2="6" layer="51"/>
<rectangle x1="-3.875" y1="5" x2="-3.625" y2="6" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="FT2232H">
<wire x1="-17.78" y1="50.8" x2="-17.78" y2="-48.26" width="0.254" layer="94"/>
<wire x1="-17.78" y1="-48.26" x2="17.78" y2="-48.26" width="0.254" layer="94"/>
<wire x1="17.78" y1="-48.26" x2="17.78" y2="50.8" width="0.254" layer="94"/>
<wire x1="17.78" y1="50.8" x2="-17.78" y2="50.8" width="0.254" layer="94"/>
<text x="-17.78" y="51.308" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-17.78" y="-50.8" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VREGIN" x="-20.32" y="35.56" length="short"/>
<pin name="VREGOUT" x="-20.32" y="22.86" length="short"/>
<pin name="DM" x="-20.32" y="2.54" length="short"/>
<pin name="DP" x="-20.32" y="0" length="short"/>
<pin name="REF" x="-20.32" y="-5.08" length="short"/>
<pin name="!RESET" x="-20.32" y="-10.16" length="short" function="dot"/>
<pin name="EECLK" x="-20.32" y="-20.32" length="short"/>
<pin name="EEDATA" x="-20.32" y="-22.86" length="short"/>
<pin name="EECS" x="-20.32" y="-17.78" length="short"/>
<pin name="OSCI" x="-20.32" y="-33.02" length="short"/>
<pin name="OSCO" x="-20.32" y="-40.64" length="short"/>
<pin name="TEST" x="-20.32" y="-45.72" length="short"/>
<pin name="AGND" x="-20.32" y="10.16" length="short"/>
<pin name="GND" x="-20.32" y="12.7" length="short"/>
<pin name="!SUSPEND" x="20.32" y="-45.72" length="short" function="dot" rot="R180"/>
<pin name="!PWREN" x="20.32" y="-43.18" length="short" function="dot" rot="R180"/>
<pin name="!PWRSAV!/BCBUS7" x="20.32" y="-38.1" length="short" rot="R180"/>
<pin name="BCBUS6" x="20.32" y="-35.56" length="short" rot="R180"/>
<pin name="BCBUS5" x="20.32" y="-33.02" length="short" rot="R180"/>
<pin name="BCBUS4" x="20.32" y="-30.48" length="short" rot="R180"/>
<pin name="BCBUS3" x="20.32" y="-27.94" length="short" rot="R180"/>
<pin name="BCBUS2" x="20.32" y="-25.4" length="short" rot="R180"/>
<pin name="BCBUS1" x="20.32" y="-22.86" length="short" rot="R180"/>
<pin name="BCBUS0" x="20.32" y="-20.32" length="short" rot="R180"/>
<pin name="BDBUS7" x="20.32" y="-15.24" length="short" rot="R180"/>
<pin name="BDBUS6" x="20.32" y="-12.7" length="short" rot="R180"/>
<pin name="BDBUS5" x="20.32" y="-10.16" length="short" rot="R180"/>
<pin name="BDBUS4" x="20.32" y="-7.62" length="short" rot="R180"/>
<pin name="BDBUS3" x="20.32" y="-5.08" length="short" rot="R180"/>
<pin name="BDBUS2" x="20.32" y="-2.54" length="short" rot="R180"/>
<pin name="BDBUS1" x="20.32" y="0" length="short" rot="R180"/>
<pin name="BDBUS0" x="20.32" y="2.54" length="short" rot="R180"/>
<pin name="ACBUS7" x="20.32" y="7.62" length="short" rot="R180"/>
<pin name="ACBUS6" x="20.32" y="10.16" length="short" rot="R180"/>
<pin name="ACBUS5" x="20.32" y="12.7" length="short" rot="R180"/>
<pin name="ACBUS4" x="20.32" y="15.24" length="short" rot="R180"/>
<pin name="ACBUS3" x="20.32" y="17.78" length="short" rot="R180"/>
<pin name="ACBUS2" x="20.32" y="20.32" length="short" rot="R180"/>
<pin name="ACBUS1" x="20.32" y="22.86" length="short" rot="R180"/>
<pin name="ACBUS0" x="20.32" y="25.4" length="short" rot="R180"/>
<pin name="ADBUS7" x="20.32" y="30.48" length="short" rot="R180"/>
<pin name="ADBUS6" x="20.32" y="33.02" length="short" rot="R180"/>
<pin name="ADBUS5" x="20.32" y="35.56" length="short" rot="R180"/>
<pin name="ADBUS4" x="20.32" y="38.1" length="short" rot="R180"/>
<pin name="ADBUS3" x="20.32" y="40.64" length="short" rot="R180"/>
<pin name="ADBUS2" x="20.32" y="43.18" length="short" rot="R180"/>
<pin name="ADBUS1" x="20.32" y="45.72" length="short" rot="R180"/>
<pin name="ADBUS0" x="20.32" y="48.26" length="short" rot="R180"/>
<pin name="VCCIO" x="-20.32" y="38.1" length="short"/>
<pin name="VCORE" x="-20.32" y="20.32" length="short"/>
<pin name="VPLL" x="-20.32" y="45.72" length="short"/>
<pin name="VPHY" x="-20.32" y="48.26" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="FT2232H" prefix="U">
<gates>
<gate name="G$1" symbol="FT2232H" x="0" y="0"/>
</gates>
<devices>
<device name="L" package="QFP64-0.5">
<connects>
<connect gate="G$1" pin="!PWREN" pad="60"/>
<connect gate="G$1" pin="!PWRSAV!/BCBUS7" pad="59"/>
<connect gate="G$1" pin="!RESET" pad="14"/>
<connect gate="G$1" pin="!SUSPEND" pad="36"/>
<connect gate="G$1" pin="ACBUS0" pad="26"/>
<connect gate="G$1" pin="ACBUS1" pad="27"/>
<connect gate="G$1" pin="ACBUS2" pad="28"/>
<connect gate="G$1" pin="ACBUS3" pad="29"/>
<connect gate="G$1" pin="ACBUS4" pad="30"/>
<connect gate="G$1" pin="ACBUS5" pad="32"/>
<connect gate="G$1" pin="ACBUS6" pad="33"/>
<connect gate="G$1" pin="ACBUS7" pad="34"/>
<connect gate="G$1" pin="ADBUS0" pad="16"/>
<connect gate="G$1" pin="ADBUS1" pad="17"/>
<connect gate="G$1" pin="ADBUS2" pad="18"/>
<connect gate="G$1" pin="ADBUS3" pad="19"/>
<connect gate="G$1" pin="ADBUS4" pad="21"/>
<connect gate="G$1" pin="ADBUS5" pad="22"/>
<connect gate="G$1" pin="ADBUS6" pad="23"/>
<connect gate="G$1" pin="ADBUS7" pad="24"/>
<connect gate="G$1" pin="AGND" pad="10"/>
<connect gate="G$1" pin="BCBUS0" pad="48"/>
<connect gate="G$1" pin="BCBUS1" pad="52"/>
<connect gate="G$1" pin="BCBUS2" pad="53"/>
<connect gate="G$1" pin="BCBUS3" pad="54"/>
<connect gate="G$1" pin="BCBUS4" pad="55"/>
<connect gate="G$1" pin="BCBUS5" pad="57"/>
<connect gate="G$1" pin="BCBUS6" pad="58"/>
<connect gate="G$1" pin="BDBUS0" pad="38"/>
<connect gate="G$1" pin="BDBUS1" pad="39"/>
<connect gate="G$1" pin="BDBUS2" pad="40"/>
<connect gate="G$1" pin="BDBUS3" pad="41"/>
<connect gate="G$1" pin="BDBUS4" pad="43"/>
<connect gate="G$1" pin="BDBUS5" pad="44"/>
<connect gate="G$1" pin="BDBUS6" pad="45"/>
<connect gate="G$1" pin="BDBUS7" pad="46"/>
<connect gate="G$1" pin="DM" pad="7"/>
<connect gate="G$1" pin="DP" pad="8"/>
<connect gate="G$1" pin="EECLK" pad="62"/>
<connect gate="G$1" pin="EECS" pad="63"/>
<connect gate="G$1" pin="EEDATA" pad="61"/>
<connect gate="G$1" pin="GND" pad="1 5 11 15 25 35 47 51"/>
<connect gate="G$1" pin="OSCI" pad="2"/>
<connect gate="G$1" pin="OSCO" pad="3"/>
<connect gate="G$1" pin="REF" pad="6"/>
<connect gate="G$1" pin="TEST" pad="13"/>
<connect gate="G$1" pin="VCCIO" pad="20 31 42 56"/>
<connect gate="G$1" pin="VCORE" pad="12 37 64"/>
<connect gate="G$1" pin="VPHY" pad="4"/>
<connect gate="G$1" pin="VPLL" pad="9"/>
<connect gate="G$1" pin="VREGIN" pad="50"/>
<connect gate="G$1" pin="VREGOUT" pad="49"/>
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
<package name="HC49">
<wire x1="-3.3" y1="2.3" x2="3.3" y2="2.3" width="0.127" layer="21"/>
<wire x1="-3.3" y1="-2.3" x2="3.3" y2="-2.3" width="0.127" layer="21"/>
<wire x1="-3.3" y1="2.3" x2="-3.3" y2="-2.3" width="0.127" layer="21" curve="180"/>
<wire x1="3.3" y1="-2.3" x2="3.3" y2="2.3" width="0.127" layer="21" curve="180"/>
<pad name="1" x="-2.44" y="0" drill="1.1"/>
<pad name="2" x="2.44" y="0" drill="1.1"/>
<text x="-3.81" y="3.175" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-3.81" y="-3.81" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="HC49-SMD">
<wire x1="-3.25" y1="1.9" x2="3.25" y2="1.9" width="0.127" layer="21"/>
<wire x1="-3.25" y1="-1.9" x2="3.25" y2="-1.9" width="0.127" layer="21"/>
<wire x1="-3.25" y1="1.9" x2="-3.25" y2="-1.9" width="0.127" layer="21" curve="180"/>
<wire x1="3.25" y1="-1.9" x2="3.25" y2="1.9" width="0.127" layer="21" curve="180"/>
<text x="-3.81" y="3.175" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-3.81" y="-3.81" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<wire x1="-5.7" y1="2.4" x2="5.7" y2="2.4" width="0.127" layer="21"/>
<wire x1="5.7" y1="2.4" x2="5.7" y2="-2.4" width="0.127" layer="21"/>
<wire x1="5.7" y1="-2.4" x2="-5.7" y2="-2.4" width="0.127" layer="21"/>
<wire x1="-5.7" y1="-2.4" x2="-5.7" y2="2.4" width="0.127" layer="21"/>
<rectangle x1="-6.6" y1="-0.315" x2="-2.2" y2="0.315" layer="51"/>
<rectangle x1="2.2" y1="-0.315" x2="6.6" y2="0.315" layer="51"/>
<smd name="1" x="-4.75" y="0" dx="5.5" dy="1.4" layer="1"/>
<smd name="2" x="4.75" y="0" dx="5.5" dy="1.4" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="CRYSTAL">
<wire x1="-1.27" y1="-0.254" x2="0" y2="-0.254" width="0.254" layer="94"/>
<wire x1="0" y1="-0.254" x2="1.27" y2="-0.254" width="0.254" layer="94"/>
<wire x1="-1.524" y1="-0.762" x2="1.524" y2="-0.762" width="0.254" layer="94"/>
<wire x1="1.524" y1="-0.762" x2="1.524" y2="-1.778" width="0.254" layer="94"/>
<wire x1="1.524" y1="-1.778" x2="-1.524" y2="-1.778" width="0.254" layer="94"/>
<wire x1="-1.524" y1="-1.778" x2="-1.524" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-2.286" x2="0" y2="-2.286" width="0.254" layer="94"/>
<wire x1="0" y1="-2.286" x2="1.27" y2="-2.286" width="0.254" layer="94"/>
<wire x1="0" y1="-0.254" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-2.286" width="0.1524" layer="94"/>
<text x="2.54" y="-1.27" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="2.54" y="-3.81" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="A" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="B" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="HC49" prefix="X" uservalue="yes">
<gates>
<gate name="G$1" symbol="CRYSTAL" x="0" y="0"/>
</gates>
<devices>
<device name="" package="HC49">
<connects>
<connect gate="G$1" pin="A" pad="1"/>
<connect gate="G$1" pin="B" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SMD" package="HC49-SMD">
<connects>
<connect gate="G$1" pin="A" pad="1"/>
<connect gate="G$1" pin="B" pad="2"/>
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
<part name="CN1" library="Connector" deviceset="USB-A-PLUG" device="" value="USB-A-PLUG"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="+P1" library="supply1" deviceset="VBUS" device=""/>
<part name="C1" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="FB1" library="Passive" deviceset="FB" device="1608"/>
<part name="C2" library="Passive" deviceset="C" device="3216" value="47u"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="+P2" library="supply1" deviceset="VBUS" device=""/>
<part name="U1" library="ic-Microchip" deviceset="MCP1700T-*" device="" technology="33"/>
<part name="C3" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="C4" library="Passive" deviceset="C" device="2012" value="22u"/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="+P3" library="supply1" deviceset="+3V3" device=""/>
<part name="LED1" library="Opto" deviceset="LED" device="1608" value="RX"/>
<part name="LED2" library="Opto" deviceset="LED" device="1608" value="TX"/>
<part name="R1" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="R2" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="CN2" library="Connector" deviceset="XBEE-*" device="TH-NOSILK" value="XBEE"/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="LED3" library="Opto" deviceset="VSMY2850" device="RG"/>
<part name="U6" library="ProjectOnly" deviceset="S6809" device="-SMD"/>
<part name="C13" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="T7" library="ic-package" deviceset="TERMINAL" device="" value="A"/>
<part name="T8" library="ic-package" deviceset="TERMINAL" device="" value="K"/>
<part name="T3" library="ic-package" deviceset="TERMINAL" device="" value="LED"/>
<part name="T4" library="ic-package" deviceset="TERMINAL" device="" value="VCC"/>
<part name="T2" library="ic-package" deviceset="TERMINAL" device="" value="GND"/>
<part name="T1" library="ic-package" deviceset="TERMINAL" device="" value="VOUT"/>
<part name="T5" library="ic-package" deviceset="TERMINAL" device="" value="A"/>
<part name="T6" library="ic-package" deviceset="TERMINAL" device="" value="K"/>
<part name="U7" library="ic-Vishay" deviceset="VCNL4020" device=""/>
<part name="T11" library="ic-package" deviceset="TERMINAL" device="" value="SCL"/>
<part name="T12" library="ic-package" deviceset="TERMINAL" device="" value="VCC"/>
<part name="T10" library="ic-package" deviceset="TERMINAL" device="" value="GND"/>
<part name="T9" library="ic-package" deviceset="TERMINAL" device="" value="SDA"/>
<part name="R12" library="Passive" deviceset="R" device="1005" value="22"/>
<part name="C14" library="Passive" deviceset="C" device="1608" value="10u"/>
<part name="C15" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C17" library="Passive" deviceset="C" device="1608" value="10u"/>
<part name="C16" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="T13" library="ic-package" deviceset="TERMINAL" device="" value="A"/>
<part name="T14" library="ic-package" deviceset="TERMINAL" device="" value="K"/>
<part name="+P4" library="supply1" deviceset="VBUS" device=""/>
<part name="U2" library="ic-Microchip" deviceset="MCP1700T-*" device="" technology="33"/>
<part name="C5" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="C6" library="Passive" deviceset="C" device="2012" value="22u"/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="+P6" library="supply1" deviceset="+3V3/2" device=""/>
<part name="U3" library="ic-FTDI" deviceset="FT2232H" device="L"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="FB2" library="Passive" deviceset="FB" device="1608"/>
<part name="FB3" library="Passive" deviceset="FB" device="1608"/>
<part name="+P7" library="supply1" deviceset="+3V3" device=""/>
<part name="+P8" library="supply1" deviceset="+3V3" device=""/>
<part name="+P9" library="supply1" deviceset="+3V3" device=""/>
<part name="R3" library="Passive" deviceset="R" device="1608" value="12k"/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="+P10" library="supply1" deviceset="+3V3" device=""/>
<part name="R6" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="+P12" library="supply1" deviceset="+3V3" device=""/>
<part name="X1" library="Oscillator" deviceset="HC49" device="" value="12M"/>
<part name="C7" library="Passive" deviceset="C" device="1608" value="33p"/>
<part name="C8" library="Passive" deviceset="C" device="1608" value="33p"/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="GND17" library="supply1" deviceset="GND" device=""/>
<part name="C9" library="Passive" deviceset="C" device="1608" value="10u"/>
<part name="C10" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C11" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C12" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND18" library="supply1" deviceset="GND" device=""/>
<part name="C18" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C19" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C20" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C21" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND19" library="supply1" deviceset="GND" device=""/>
<part name="C23" library="Passive" deviceset="C" device="1608" value="10u"/>
<part name="C24" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND20" library="supply1" deviceset="GND" device=""/>
<part name="C25" library="Passive" deviceset="C" device="1608" value="10u"/>
<part name="C26" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND21" library="supply1" deviceset="GND" device=""/>
<part name="+P13" library="supply1" deviceset="+3V3/2" device=""/>
<part name="+P5" library="supply1" deviceset="+3V3" device=""/>
<part name="+P14" library="supply1" deviceset="+3V3" device=""/>
<part name="CN3" library="Connector" deviceset="PIN1X8" device=""/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="+P15" library="supply1" deviceset="+3V3/2" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="0" y1="0" x2="48.26" y2="0" width="0.1524" layer="97"/>
<wire x1="48.26" y1="0" x2="68.58" y2="0" width="0.1524" layer="97"/>
<wire x1="68.58" y1="0" x2="93.98" y2="0" width="0.1524" layer="97"/>
<wire x1="0" y1="0" x2="0" y2="7.62" width="0.1524" layer="97"/>
<text x="2.54" y="5.08" size="1.778" layer="97" font="vector" align="center-left">KIKS2013</text>
<text x="2.54" y="2.54" size="1.778" layer="97" font="vector" align="center-left">Serial / IR Debug Interface</text>
<wire x1="0" y1="7.62" x2="0" y2="175.26" width="0.1524" layer="97"/>
<wire x1="0" y1="7.62" x2="48.26" y2="7.62" width="0.1524" layer="97"/>
<wire x1="48.26" y1="7.62" x2="48.26" y2="0" width="0.1524" layer="97"/>
<wire x1="48.26" y1="7.62" x2="68.58" y2="7.62" width="0.1524" layer="97"/>
<wire x1="68.58" y1="7.62" x2="93.98" y2="7.62" width="0.1524" layer="97"/>
<wire x1="93.98" y1="7.62" x2="93.98" y2="0" width="0.1524" layer="97"/>
<text x="71.12" y="2.54" size="1.778" layer="97" font="vector" align="center-left">FUJII NAOMICHI</text>
<text x="71.12" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Schemed by</text>
<text x="50.8" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Date</text>
<text x="50.8" y="2.54" size="1.778" layer="97" font="vector" align="center-left">2012/12/12</text>
<wire x1="68.58" y1="0" x2="68.58" y2="7.62" width="0.1524" layer="97"/>
<wire x1="93.98" y1="0" x2="388.62" y2="0" width="0.1524" layer="97"/>
<wire x1="388.62" y1="175.26" x2="388.62" y2="0" width="0.1524" layer="97"/>
<wire x1="0" y1="175.26" x2="99.06" y2="175.26" width="0.1524" layer="97"/>
<wire x1="99.06" y1="175.26" x2="215.9" y2="175.26" width="0.1524" layer="97"/>
<wire x1="215.9" y1="175.26" x2="388.62" y2="175.26" width="0.1524" layer="97"/>
<wire x1="0" y1="175.26" x2="0" y2="342.9" width="0.1524" layer="97"/>
<wire x1="388.62" y1="342.9" x2="388.62" y2="175.26" width="0.1524" layer="97"/>
<wire x1="0" y1="342.9" x2="99.06" y2="342.9" width="0.1524" layer="97"/>
<wire x1="99.06" y1="342.9" x2="215.9" y2="342.9" width="0.1524" layer="97"/>
<wire x1="215.9" y1="342.9" x2="388.62" y2="342.9" width="0.1524" layer="97"/>
<wire x1="215.9" y1="175.26" x2="215.9" y2="342.9" width="0.1524" layer="97"/>
<wire x1="99.06" y1="175.26" x2="99.06" y2="342.9" width="0.1524" layer="97"/>
</plain>
<instances>
<instance part="CN1" gate="G$1" x="20.32" y="121.92"/>
<instance part="GND1" gate="1" x="27.94" y="104.14"/>
<instance part="GND2" gate="1" x="20.32" y="109.22"/>
<instance part="+P1" gate="G$1" x="68.58" y="124.46" rot="R270"/>
<instance part="C1" gate="G$1" x="33.02" y="111.76"/>
<instance part="FB1" gate="G$1" x="45.72" y="124.46"/>
<instance part="C2" gate="G$1" x="60.96" y="116.84"/>
<instance part="GND4" gate="1" x="60.96" y="111.76"/>
<instance part="+P2" gate="G$1" x="22.86" y="86.36" rot="MR270"/>
<instance part="U1" gate="G$1" x="45.72" y="83.82"/>
<instance part="C3" gate="G$1" x="30.48" y="78.74"/>
<instance part="C4" gate="G$1" x="60.96" y="78.74"/>
<instance part="GND6" gate="1" x="30.48" y="73.66"/>
<instance part="GND7" gate="1" x="45.72" y="73.66"/>
<instance part="GND8" gate="1" x="60.96" y="73.66"/>
<instance part="+P3" gate="1" x="68.58" y="86.36" rot="R270"/>
<instance part="LED1" gate="G$1" x="226.06" y="50.8"/>
<instance part="LED2" gate="G$1" x="238.76" y="50.8"/>
<instance part="R1" gate="G$1" x="226.06" y="58.42" rot="R90"/>
<instance part="R2" gate="G$1" x="238.76" y="58.42" rot="R90"/>
<instance part="CN2" gate="G$1" x="307.34" y="139.7"/>
<instance part="GND9" gate="1" x="279.4" y="124.46"/>
<instance part="LED3" gate="G$1" x="152.4" y="254"/>
<instance part="U6" gate="G$1" x="50.8" y="241.3"/>
<instance part="C13" gate="G$1" x="35.56" y="241.3"/>
<instance part="T7" gate="G$1" x="162.56" y="264.16" rot="R180"/>
<instance part="T8" gate="G$1" x="162.56" y="243.84" rot="R180"/>
<instance part="T3" gate="G$1" x="53.34" y="266.7" rot="R180"/>
<instance part="T4" gate="G$1" x="53.34" y="264.16" rot="R180"/>
<instance part="T2" gate="G$1" x="53.34" y="269.24" rot="R180"/>
<instance part="T1" gate="G$1" x="53.34" y="271.78" rot="R180"/>
<instance part="T5" gate="G$1" x="53.34" y="259.08" rot="R180"/>
<instance part="T6" gate="G$1" x="53.34" y="256.54" rot="R180"/>
<instance part="U7" gate="G$1" x="287.02" y="243.84"/>
<instance part="T11" gate="G$1" x="289.56" y="274.32" rot="R180"/>
<instance part="T12" gate="G$1" x="289.56" y="271.78" rot="R180"/>
<instance part="T10" gate="G$1" x="289.56" y="276.86" rot="R180"/>
<instance part="T9" gate="G$1" x="289.56" y="279.4" rot="R180"/>
<instance part="R12" gate="G$1" x="251.46" y="246.38"/>
<instance part="C14" gate="G$1" x="256.54" y="241.3"/>
<instance part="C15" gate="G$1" x="264.16" y="241.3"/>
<instance part="C17" gate="G$1" x="327.66" y="254"/>
<instance part="C16" gate="G$1" x="320.04" y="254"/>
<instance part="T13" gate="G$1" x="289.56" y="281.94" rot="R180"/>
<instance part="T14" gate="G$1" x="289.56" y="284.48" rot="R180"/>
<instance part="+P4" gate="G$1" x="22.86" y="58.42" rot="MR270"/>
<instance part="U2" gate="G$1" x="45.72" y="55.88"/>
<instance part="C5" gate="G$1" x="30.48" y="50.8"/>
<instance part="C6" gate="G$1" x="60.96" y="50.8"/>
<instance part="GND5" gate="1" x="30.48" y="45.72"/>
<instance part="GND10" gate="1" x="45.72" y="45.72"/>
<instance part="GND13" gate="1" x="60.96" y="45.72"/>
<instance part="+P6" gate="1" x="68.58" y="58.42" rot="R270"/>
<instance part="U3" gate="G$1" x="182.88" y="73.66"/>
<instance part="GND3" gate="1" x="160.02" y="81.28"/>
<instance part="FB2" gate="G$1" x="137.16" y="152.4"/>
<instance part="FB3" gate="G$1" x="137.16" y="132.08"/>
<instance part="+P7" gate="1" x="127" y="152.4" rot="MR270"/>
<instance part="+P8" gate="1" x="127" y="132.08" rot="MR270"/>
<instance part="+P9" gate="1" x="132.08" y="111.76" rot="MR270"/>
<instance part="R3" gate="G$1" x="157.48" y="68.58"/>
<instance part="GND14" gate="1" x="149.86" y="66.04"/>
<instance part="+P10" gate="1" x="157.48" y="63.5" rot="R90"/>
<instance part="R6" gate="G$1" x="157.48" y="50.8"/>
<instance part="+P12" gate="1" x="147.32" y="50.8" rot="MR270"/>
<instance part="X1" gate="G$1" x="160.02" y="38.1" rot="MR0"/>
<instance part="C7" gate="G$1" x="152.4" y="40.64" rot="MR90"/>
<instance part="C8" gate="G$1" x="152.4" y="33.02" rot="R270"/>
<instance part="GND16" gate="1" x="147.32" y="30.48"/>
<instance part="GND17" gate="1" x="160.02" y="25.4"/>
<instance part="C9" gate="G$1" x="134.62" y="86.36"/>
<instance part="C10" gate="G$1" x="142.24" y="86.36"/>
<instance part="C11" gate="G$1" x="147.32" y="86.36"/>
<instance part="C12" gate="G$1" x="152.4" y="86.36"/>
<instance part="GND18" gate="1" x="142.24" y="78.74"/>
<instance part="C18" gate="G$1" x="137.16" y="104.14"/>
<instance part="C19" gate="G$1" x="142.24" y="104.14"/>
<instance part="C20" gate="G$1" x="147.32" y="104.14"/>
<instance part="C21" gate="G$1" x="152.4" y="104.14"/>
<instance part="GND19" gate="1" x="147.32" y="96.52"/>
<instance part="C23" gate="G$1" x="144.78" y="144.78"/>
<instance part="C24" gate="G$1" x="152.4" y="144.78"/>
<instance part="GND20" gate="1" x="149.86" y="137.16"/>
<instance part="C25" gate="G$1" x="144.78" y="124.46"/>
<instance part="C26" gate="G$1" x="152.4" y="124.46"/>
<instance part="GND21" gate="1" x="149.86" y="116.84"/>
<instance part="+P13" gate="1" x="276.86" y="149.86" rot="MR270"/>
<instance part="+P5" gate="1" x="226.06" y="66.04" rot="MR0"/>
<instance part="+P14" gate="1" x="238.76" y="66.04" rot="MR0"/>
<instance part="CN3" gate="G$1" x="287.02" y="58.42"/>
<instance part="GND11" gate="1" x="281.94" y="48.26"/>
<instance part="+P15" gate="1" x="281.94" y="73.66"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="S1"/>
<pinref part="GND2" gate="1" pin="GND"/>
<pinref part="CN1" gate="G$1" pin="S2"/>
<wire x1="20.32" y1="111.76" x2="22.86" y2="111.76" width="0.1524" layer="91"/>
<junction x="20.32" y="111.76"/>
</segment>
<segment>
<pinref part="CN1" gate="G$1" pin="GND"/>
<wire x1="25.4" y1="116.84" x2="27.94" y2="116.84" width="0.1524" layer="91"/>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="27.94" y1="116.84" x2="27.94" y2="106.68" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="33.02" y1="109.22" x2="33.02" y2="106.68" width="0.1524" layer="91"/>
<wire x1="33.02" y1="106.68" x2="27.94" y2="106.68" width="0.1524" layer="91"/>
<junction x="27.94" y="106.68"/>
</segment>
<segment>
<pinref part="C2" gate="G$1" pin="2"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="2"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GND"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C4" gate="G$1" pin="2"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND9" gate="1" pin="GND"/>
<pinref part="CN2" gate="G$1" pin="GND"/>
<wire x1="279.4" y1="127" x2="284.48" y2="127" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C5" gate="G$1" pin="2"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="GND"/>
<pinref part="GND10" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="GND13" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GND"/>
<wire x1="162.56" y1="86.36" x2="160.02" y2="86.36" width="0.1524" layer="91"/>
<wire x1="160.02" y1="86.36" x2="160.02" y2="83.82" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="AGND"/>
<wire x1="160.02" y1="83.82" x2="162.56" y2="83.82" width="0.1524" layer="91"/>
<pinref part="GND3" gate="1" pin="GND"/>
<junction x="160.02" y="83.82"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="152.4" y1="68.58" x2="149.86" y2="68.58" width="0.1524" layer="91"/>
<pinref part="GND14" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="2"/>
<wire x1="149.86" y1="40.64" x2="147.32" y2="40.64" width="0.1524" layer="91"/>
<wire x1="147.32" y1="40.64" x2="147.32" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="2"/>
<wire x1="147.32" y1="33.02" x2="149.86" y2="33.02" width="0.1524" layer="91"/>
<pinref part="GND16" gate="1" pin="GND"/>
<junction x="147.32" y="33.02"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="TEST"/>
<wire x1="162.56" y1="27.94" x2="160.02" y2="27.94" width="0.1524" layer="91"/>
<pinref part="GND17" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C12" gate="G$1" pin="2"/>
<wire x1="152.4" y1="83.82" x2="152.4" y2="81.28" width="0.1524" layer="91"/>
<wire x1="152.4" y1="81.28" x2="147.32" y2="81.28" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="2"/>
<wire x1="147.32" y1="81.28" x2="142.24" y2="81.28" width="0.1524" layer="91"/>
<wire x1="142.24" y1="81.28" x2="134.62" y2="81.28" width="0.1524" layer="91"/>
<wire x1="134.62" y1="81.28" x2="134.62" y2="83.82" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="2"/>
<wire x1="142.24" y1="83.82" x2="142.24" y2="81.28" width="0.1524" layer="91"/>
<pinref part="C11" gate="G$1" pin="2"/>
<wire x1="147.32" y1="83.82" x2="147.32" y2="81.28" width="0.1524" layer="91"/>
<pinref part="GND18" gate="1" pin="GND"/>
<junction x="142.24" y="81.28"/>
<junction x="147.32" y="81.28"/>
</segment>
<segment>
<pinref part="C18" gate="G$1" pin="2"/>
<wire x1="152.4" y1="99.06" x2="147.32" y2="99.06" width="0.1524" layer="91"/>
<wire x1="147.32" y1="99.06" x2="142.24" y2="99.06" width="0.1524" layer="91"/>
<wire x1="142.24" y1="99.06" x2="137.16" y2="99.06" width="0.1524" layer="91"/>
<wire x1="137.16" y1="99.06" x2="137.16" y2="101.6" width="0.1524" layer="91"/>
<pinref part="C19" gate="G$1" pin="2"/>
<wire x1="142.24" y1="101.6" x2="142.24" y2="99.06" width="0.1524" layer="91"/>
<pinref part="C20" gate="G$1" pin="2"/>
<wire x1="147.32" y1="101.6" x2="147.32" y2="99.06" width="0.1524" layer="91"/>
<pinref part="C21" gate="G$1" pin="2"/>
<wire x1="152.4" y1="101.6" x2="152.4" y2="99.06" width="0.1524" layer="91"/>
<pinref part="GND19" gate="1" pin="GND"/>
<junction x="147.32" y="99.06"/>
<junction x="142.24" y="99.06"/>
</segment>
<segment>
<pinref part="C23" gate="G$1" pin="2"/>
<wire x1="144.78" y1="142.24" x2="144.78" y2="139.7" width="0.1524" layer="91"/>
<wire x1="144.78" y1="139.7" x2="149.86" y2="139.7" width="0.1524" layer="91"/>
<pinref part="C24" gate="G$1" pin="2"/>
<wire x1="149.86" y1="139.7" x2="152.4" y2="139.7" width="0.1524" layer="91"/>
<wire x1="152.4" y1="139.7" x2="152.4" y2="142.24" width="0.1524" layer="91"/>
<pinref part="GND20" gate="1" pin="GND"/>
<junction x="149.86" y="139.7"/>
</segment>
<segment>
<pinref part="C26" gate="G$1" pin="2"/>
<wire x1="152.4" y1="121.92" x2="152.4" y2="119.38" width="0.1524" layer="91"/>
<wire x1="152.4" y1="119.38" x2="149.86" y2="119.38" width="0.1524" layer="91"/>
<pinref part="C25" gate="G$1" pin="2"/>
<wire x1="149.86" y1="119.38" x2="144.78" y2="119.38" width="0.1524" layer="91"/>
<wire x1="144.78" y1="119.38" x2="144.78" y2="121.92" width="0.1524" layer="91"/>
<pinref part="GND21" gate="1" pin="GND"/>
<junction x="149.86" y="119.38"/>
</segment>
<segment>
<pinref part="CN3" gate="G$1" pin="8"/>
<wire x1="284.48" y1="50.8" x2="281.94" y2="50.8" width="0.1524" layer="91"/>
<pinref part="GND11" gate="1" pin="GND"/>
</segment>
</net>
<net name="USB_D-" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="D-"/>
<wire x1="25.4" y1="121.92" x2="43.18" y2="121.92" width="0.1524" layer="91"/>
<label x="43.18" y="121.92" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="DM"/>
<wire x1="162.56" y1="76.2" x2="157.48" y2="76.2" width="0.1524" layer="91"/>
<label x="157.48" y="76.2" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="USB_D+" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="D+"/>
<wire x1="25.4" y1="119.38" x2="43.18" y2="119.38" width="0.1524" layer="91"/>
<label x="43.18" y="119.38" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="DP"/>
<wire x1="157.48" y1="73.66" x2="162.56" y2="73.66" width="0.1524" layer="91"/>
<label x="157.48" y="73.66" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="VBUS"/>
<pinref part="FB1" gate="G$1" pin="1"/>
<wire x1="25.4" y1="124.46" x2="33.02" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="33.02" y1="124.46" x2="40.64" y2="124.46" width="0.1524" layer="91"/>
<wire x1="33.02" y1="116.84" x2="33.02" y2="124.46" width="0.1524" layer="91"/>
<junction x="33.02" y="124.46"/>
</segment>
</net>
<net name="VBUS" class="0">
<segment>
<pinref part="FB1" gate="G$1" pin="2"/>
<pinref part="+P1" gate="G$1" pin="VBUS"/>
<wire x1="50.8" y1="124.46" x2="60.96" y2="124.46" width="0.1524" layer="91"/>
<wire x1="60.96" y1="124.46" x2="66.04" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="60.96" y1="121.92" x2="60.96" y2="124.46" width="0.1524" layer="91"/>
<junction x="60.96" y="124.46"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="VI"/>
<pinref part="+P2" gate="G$1" pin="VBUS"/>
<wire x1="35.56" y1="86.36" x2="30.48" y2="86.36" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="30.48" y1="86.36" x2="25.4" y2="86.36" width="0.1524" layer="91"/>
<wire x1="30.48" y1="83.82" x2="30.48" y2="86.36" width="0.1524" layer="91"/>
<junction x="30.48" y="86.36"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="VI"/>
<pinref part="+P4" gate="G$1" pin="VBUS"/>
<wire x1="35.56" y1="58.42" x2="30.48" y2="58.42" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="1"/>
<wire x1="30.48" y1="58.42" x2="25.4" y2="58.42" width="0.1524" layer="91"/>
<wire x1="30.48" y1="55.88" x2="30.48" y2="58.42" width="0.1524" layer="91"/>
<junction x="30.48" y="58.42"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VO"/>
<wire x1="55.88" y1="86.36" x2="60.96" y2="86.36" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="60.96" y1="86.36" x2="66.04" y2="86.36" width="0.1524" layer="91"/>
<wire x1="60.96" y1="83.82" x2="60.96" y2="86.36" width="0.1524" layer="91"/>
<pinref part="+P3" gate="1" pin="+3V3"/>
<junction x="60.96" y="86.36"/>
</segment>
<segment>
<pinref part="+P7" gate="1" pin="+3V3"/>
<pinref part="FB2" gate="G$1" pin="1"/>
<wire x1="129.54" y1="152.4" x2="132.08" y2="152.4" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="+P8" gate="1" pin="+3V3"/>
<pinref part="FB3" gate="G$1" pin="1"/>
<wire x1="129.54" y1="132.08" x2="132.08" y2="132.08" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="VCCIO"/>
<wire x1="162.56" y1="111.76" x2="160.02" y2="111.76" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="VREGIN"/>
<wire x1="160.02" y1="111.76" x2="152.4" y2="111.76" width="0.1524" layer="91"/>
<wire x1="152.4" y1="111.76" x2="147.32" y2="111.76" width="0.1524" layer="91"/>
<wire x1="147.32" y1="111.76" x2="142.24" y2="111.76" width="0.1524" layer="91"/>
<wire x1="142.24" y1="111.76" x2="137.16" y2="111.76" width="0.1524" layer="91"/>
<wire x1="137.16" y1="111.76" x2="134.62" y2="111.76" width="0.1524" layer="91"/>
<wire x1="162.56" y1="109.22" x2="160.02" y2="109.22" width="0.1524" layer="91"/>
<wire x1="160.02" y1="109.22" x2="160.02" y2="111.76" width="0.1524" layer="91"/>
<pinref part="+P9" gate="1" pin="+3V3"/>
<junction x="160.02" y="111.76"/>
<pinref part="C18" gate="G$1" pin="1"/>
<wire x1="137.16" y1="109.22" x2="137.16" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C19" gate="G$1" pin="1"/>
<wire x1="142.24" y1="109.22" x2="142.24" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C20" gate="G$1" pin="1"/>
<wire x1="147.32" y1="109.22" x2="147.32" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C21" gate="G$1" pin="1"/>
<wire x1="152.4" y1="109.22" x2="152.4" y2="111.76" width="0.1524" layer="91"/>
<junction x="152.4" y="111.76"/>
<junction x="147.32" y="111.76"/>
<junction x="142.24" y="111.76"/>
<junction x="137.16" y="111.76"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="!RESET"/>
<pinref part="+P10" gate="1" pin="+3V3"/>
<wire x1="162.56" y1="63.5" x2="160.02" y2="63.5" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<wire x1="226.06" y1="60.96" x2="226.06" y2="63.5" width="0.1524" layer="91"/>
<pinref part="+P5" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="238.76" y1="60.96" x2="238.76" y2="63.5" width="0.1524" layer="91"/>
<pinref part="+P14" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="+P12" gate="1" pin="+3V3"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="149.86" y1="50.8" x2="152.4" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="XBEE_RX" class="0">
<segment>
<pinref part="CN2" gate="G$1" pin="DOUT"/>
<wire x1="284.48" y1="147.32" x2="274.32" y2="147.32" width="0.1524" layer="91"/>
<label x="274.32" y="147.32" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="203.2" y1="73.66" x2="213.36" y2="73.66" width="0.1524" layer="91"/>
<label x="213.36" y="73.66" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="BDBUS1"/>
</segment>
</net>
<net name="XBEE_TX" class="0">
<segment>
<pinref part="CN2" gate="G$1" pin="DIN/!CONFIG"/>
<wire x1="274.32" y1="144.78" x2="284.48" y2="144.78" width="0.1524" layer="91"/>
<label x="274.32" y="144.78" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="203.2" y1="76.2" x2="213.36" y2="76.2" width="0.1524" layer="91"/>
<label x="213.36" y="76.2" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="BDBUS0"/>
</segment>
</net>
<net name="!XBEE_CTS" class="0">
<segment>
<pinref part="CN2" gate="G$1" pin="!CTS!/DIO7"/>
<wire x1="330.2" y1="129.54" x2="340.36" y2="129.54" width="0.1524" layer="91"/>
<label x="340.36" y="129.54" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="203.2" y1="68.58" x2="213.36" y2="68.58" width="0.1524" layer="91"/>
<label x="213.36" y="68.58" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="BDBUS3"/>
</segment>
</net>
<net name="!XBEE_RTS" class="0">
<segment>
<pinref part="CN2" gate="G$1" pin="!RTS!/DIO6"/>
<wire x1="330.2" y1="139.7" x2="340.36" y2="139.7" width="0.1524" layer="91"/>
<label x="340.36" y="139.7" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="203.2" y1="71.12" x2="213.36" y2="71.12" width="0.1524" layer="91"/>
<label x="213.36" y="71.12" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="BDBUS2"/>
</segment>
</net>
<net name="BALL_VCC" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="VCC"/>
<pinref part="C13" gate="G$1" pin="1"/>
<wire x1="43.18" y1="246.38" x2="35.56" y2="246.38" width="0.1524" layer="91"/>
<wire x1="30.48" y1="246.38" x2="35.56" y2="246.38" width="0.1524" layer="91"/>
<label x="30.48" y="246.38" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<junction x="35.56" y="246.38"/>
</segment>
<segment>
<wire x1="43.18" y1="264.16" x2="48.26" y2="264.16" width="0.1524" layer="91"/>
<label x="43.18" y="264.16" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="T4" gate="G$1" pin="1"/>
</segment>
</net>
<net name="BALL_GND" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="GND"/>
<pinref part="C13" gate="G$1" pin="2"/>
<wire x1="43.18" y1="238.76" x2="35.56" y2="238.76" width="0.1524" layer="91"/>
<wire x1="35.56" y1="238.76" x2="30.48" y2="238.76" width="0.1524" layer="91"/>
<label x="30.48" y="238.76" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<junction x="35.56" y="238.76"/>
</segment>
<segment>
<wire x1="48.26" y1="269.24" x2="43.18" y2="269.24" width="0.1524" layer="91"/>
<label x="43.18" y="269.24" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="T2" gate="G$1" pin="1"/>
</segment>
</net>
<net name="BALL_SINK" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="LED"/>
<wire x1="58.42" y1="243.84" x2="63.5" y2="243.84" width="0.1524" layer="91"/>
<label x="63.5" y="243.84" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="48.26" y1="256.54" x2="43.18" y2="256.54" width="0.1524" layer="91"/>
<label x="43.18" y="256.54" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="T6" gate="G$1" pin="1"/>
</segment>
</net>
<net name="BALL_VOUT" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="VOUT"/>
<wire x1="58.42" y1="241.3" x2="63.5" y2="241.3" width="0.1524" layer="91"/>
<label x="63.5" y="241.3" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="48.26" y1="271.78" x2="43.18" y2="271.78" width="0.1524" layer="91"/>
<label x="43.18" y="271.78" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="T1" gate="G$1" pin="1"/>
</segment>
</net>
<net name="BALL_LEDA" class="0">
<segment>
<pinref part="LED3" gate="G$1" pin="A"/>
<wire x1="152.4" y1="256.54" x2="152.4" y2="264.16" width="0.1524" layer="91"/>
<label x="152.4" y="266.7" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="T7" gate="G$1" pin="1"/>
<wire x1="152.4" y1="264.16" x2="152.4" y2="266.7" width="0.1524" layer="91"/>
<wire x1="157.48" y1="264.16" x2="152.4" y2="264.16" width="0.1524" layer="91"/>
<junction x="152.4" y="264.16"/>
</segment>
</net>
<net name="BALL_LEDC" class="0">
<segment>
<pinref part="LED3" gate="G$1" pin="K"/>
<wire x1="152.4" y1="251.46" x2="152.4" y2="243.84" width="0.1524" layer="91"/>
<label x="152.4" y="241.3" size="1.27" layer="95" font="vector" rot="MR270" xref="yes"/>
<pinref part="T8" gate="G$1" pin="1"/>
<wire x1="152.4" y1="243.84" x2="152.4" y2="241.3" width="0.1524" layer="91"/>
<wire x1="152.4" y1="243.84" x2="157.48" y2="243.84" width="0.1524" layer="91"/>
<junction x="152.4" y="243.84"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="T5" gate="G$1" pin="1"/>
<wire x1="48.26" y1="259.08" x2="45.72" y2="259.08" width="0.1524" layer="91"/>
<wire x1="45.72" y1="259.08" x2="45.72" y2="266.7" width="0.1524" layer="91"/>
<pinref part="T3" gate="G$1" pin="1"/>
<wire x1="45.72" y1="266.7" x2="48.26" y2="266.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PROX_SDA" class="0">
<segment>
<wire x1="284.48" y1="279.4" x2="279.4" y2="279.4" width="0.1524" layer="91"/>
<label x="279.4" y="279.4" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="T9" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="SDA"/>
<wire x1="299.72" y1="238.76" x2="304.8" y2="238.76" width="0.1524" layer="91"/>
<label x="304.8" y="238.76" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="PROX_GND" class="0">
<segment>
<wire x1="284.48" y1="276.86" x2="279.4" y2="276.86" width="0.1524" layer="91"/>
<label x="279.4" y="276.86" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="T10" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="GND"/>
<pinref part="C14" gate="G$1" pin="2"/>
<wire x1="274.32" y1="238.76" x2="264.16" y2="238.76" width="0.1524" layer="91"/>
<wire x1="264.16" y1="238.76" x2="256.54" y2="238.76" width="0.1524" layer="91"/>
<wire x1="256.54" y1="238.76" x2="243.84" y2="238.76" width="0.1524" layer="91"/>
<label x="243.84" y="238.76" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<junction x="256.54" y="238.76"/>
<pinref part="C15" gate="G$1" pin="2"/>
<junction x="264.16" y="238.76"/>
</segment>
<segment>
<pinref part="C16" gate="G$1" pin="2"/>
<wire x1="320.04" y1="251.46" x2="320.04" y2="248.92" width="0.1524" layer="91"/>
<wire x1="320.04" y1="248.92" x2="327.66" y2="248.92" width="0.1524" layer="91"/>
<pinref part="C17" gate="G$1" pin="2"/>
<wire x1="327.66" y1="248.92" x2="327.66" y2="251.46" width="0.1524" layer="91"/>
<wire x1="327.66" y1="248.92" x2="332.74" y2="248.92" width="0.1524" layer="91"/>
<junction x="327.66" y="248.92"/>
<label x="332.74" y="248.92" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="PROX_VCC" class="0">
<segment>
<wire x1="279.4" y1="271.78" x2="281.94" y2="271.78" width="0.1524" layer="91"/>
<label x="279.4" y="271.78" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="T12" gate="G$1" pin="1"/>
<wire x1="281.94" y1="271.78" x2="284.48" y2="271.78" width="0.1524" layer="91"/>
<wire x1="281.94" y1="271.78" x2="281.94" y2="281.94" width="0.1524" layer="91"/>
<pinref part="T13" gate="G$1" pin="1"/>
<wire x1="281.94" y1="281.94" x2="284.48" y2="281.94" width="0.1524" layer="91"/>
<junction x="281.94" y="271.78"/>
</segment>
<segment>
<pinref part="R12" gate="G$1" pin="1"/>
<wire x1="246.38" y1="246.38" x2="243.84" y2="246.38" width="0.1524" layer="91"/>
<label x="243.84" y="246.38" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="C17" gate="G$1" pin="1"/>
<wire x1="327.66" y1="259.08" x2="327.66" y2="261.62" width="0.1524" layer="91"/>
<wire x1="327.66" y1="261.62" x2="332.74" y2="261.62" width="0.1524" layer="91"/>
<wire x1="327.66" y1="261.62" x2="320.04" y2="261.62" width="0.1524" layer="91"/>
<pinref part="C16" gate="G$1" pin="1"/>
<wire x1="320.04" y1="261.62" x2="320.04" y2="259.08" width="0.1524" layer="91"/>
<junction x="327.66" y="261.62"/>
<label x="332.74" y="261.62" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U7" gate="G$1" pin="IR_A"/>
<wire x1="274.32" y1="248.92" x2="269.24" y2="248.92" width="0.1524" layer="91"/>
<wire x1="269.24" y1="248.92" x2="269.24" y2="261.62" width="0.1524" layer="91"/>
<wire x1="269.24" y1="261.62" x2="320.04" y2="261.62" width="0.1524" layer="91"/>
<junction x="320.04" y="261.62"/>
</segment>
</net>
<net name="PROX_SCL" class="0">
<segment>
<pinref part="T11" gate="G$1" pin="1"/>
<wire x1="279.4" y1="274.32" x2="284.48" y2="274.32" width="0.1524" layer="91"/>
<label x="279.4" y="274.32" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="SCL"/>
<wire x1="299.72" y1="241.3" x2="304.8" y2="241.3" width="0.1524" layer="91"/>
<label x="304.8" y="241.3" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="U7" gate="G$1" pin="VDD"/>
<wire x1="274.32" y1="246.38" x2="264.16" y2="246.38" width="0.1524" layer="91"/>
<pinref part="R12" gate="G$1" pin="2"/>
<pinref part="C14" gate="G$1" pin="1"/>
<wire x1="264.16" y1="246.38" x2="256.54" y2="246.38" width="0.1524" layer="91"/>
<wire x1="256.54" y1="246.38" x2="254" y2="246.38" width="0.1524" layer="91"/>
<junction x="256.54" y="246.38"/>
<pinref part="C15" gate="G$1" pin="1"/>
<junction x="264.16" y="246.38"/>
</segment>
</net>
<net name="PROX_K" class="0">
<segment>
<pinref part="T14" gate="G$1" pin="1"/>
<wire x1="279.4" y1="284.48" x2="284.48" y2="284.48" width="0.1524" layer="91"/>
<label x="279.4" y="284.48" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="IR_C"/>
<wire x1="299.72" y1="248.92" x2="304.8" y2="248.92" width="0.1524" layer="91"/>
<label x="304.8" y="248.92" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="+3V3/2" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="VO"/>
<wire x1="55.88" y1="58.42" x2="60.96" y2="58.42" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="1"/>
<wire x1="60.96" y1="58.42" x2="66.04" y2="58.42" width="0.1524" layer="91"/>
<wire x1="60.96" y1="55.88" x2="60.96" y2="58.42" width="0.1524" layer="91"/>
<junction x="60.96" y="58.42"/>
<pinref part="+P6" gate="1" pin="+3V3/2"/>
</segment>
<segment>
<pinref part="CN2" gate="G$1" pin="VCC"/>
<wire x1="284.48" y1="149.86" x2="279.4" y2="149.86" width="0.1524" layer="91"/>
<pinref part="+P13" gate="1" pin="+3V3/2"/>
</segment>
<segment>
<pinref part="+P15" gate="1" pin="+3V3/2"/>
<wire x1="281.94" y1="71.12" x2="281.94" y2="68.58" width="0.1524" layer="91"/>
<pinref part="CN3" gate="G$1" pin="1"/>
<wire x1="281.94" y1="68.58" x2="284.48" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="VREGOUT"/>
<wire x1="162.56" y1="96.52" x2="160.02" y2="96.52" width="0.1524" layer="91"/>
<wire x1="160.02" y1="96.52" x2="160.02" y2="93.98" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="VCORE"/>
<wire x1="160.02" y1="93.98" x2="162.56" y2="93.98" width="0.1524" layer="91"/>
<wire x1="160.02" y1="93.98" x2="152.4" y2="93.98" width="0.1524" layer="91"/>
<junction x="160.02" y="93.98"/>
<pinref part="C9" gate="G$1" pin="1"/>
<wire x1="152.4" y1="93.98" x2="147.32" y2="93.98" width="0.1524" layer="91"/>
<wire x1="147.32" y1="93.98" x2="142.24" y2="93.98" width="0.1524" layer="91"/>
<wire x1="142.24" y1="93.98" x2="134.62" y2="93.98" width="0.1524" layer="91"/>
<wire x1="134.62" y1="91.44" x2="134.62" y2="93.98" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="1"/>
<wire x1="142.24" y1="91.44" x2="142.24" y2="93.98" width="0.1524" layer="91"/>
<pinref part="C11" gate="G$1" pin="1"/>
<wire x1="147.32" y1="91.44" x2="147.32" y2="93.98" width="0.1524" layer="91"/>
<pinref part="C12" gate="G$1" pin="1"/>
<wire x1="152.4" y1="91.44" x2="152.4" y2="93.98" width="0.1524" layer="91"/>
<junction x="142.24" y="93.98"/>
<junction x="147.32" y="93.98"/>
<junction x="152.4" y="93.98"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="VPHY"/>
<wire x1="162.56" y1="121.92" x2="160.02" y2="121.92" width="0.1524" layer="91"/>
<wire x1="160.02" y1="121.92" x2="160.02" y2="152.4" width="0.1524" layer="91"/>
<pinref part="FB2" gate="G$1" pin="2"/>
<wire x1="142.24" y1="152.4" x2="144.78" y2="152.4" width="0.1524" layer="91"/>
<pinref part="C23" gate="G$1" pin="1"/>
<wire x1="144.78" y1="152.4" x2="152.4" y2="152.4" width="0.1524" layer="91"/>
<wire x1="152.4" y1="152.4" x2="160.02" y2="152.4" width="0.1524" layer="91"/>
<wire x1="144.78" y1="149.86" x2="144.78" y2="152.4" width="0.1524" layer="91"/>
<pinref part="C24" gate="G$1" pin="1"/>
<wire x1="152.4" y1="149.86" x2="152.4" y2="152.4" width="0.1524" layer="91"/>
<junction x="152.4" y="152.4"/>
<junction x="144.78" y="152.4"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="VPLL"/>
<wire x1="162.56" y1="119.38" x2="157.48" y2="119.38" width="0.1524" layer="91"/>
<wire x1="157.48" y1="119.38" x2="157.48" y2="132.08" width="0.1524" layer="91"/>
<pinref part="FB3" gate="G$1" pin="2"/>
<wire x1="142.24" y1="132.08" x2="144.78" y2="132.08" width="0.1524" layer="91"/>
<pinref part="C25" gate="G$1" pin="1"/>
<wire x1="144.78" y1="132.08" x2="152.4" y2="132.08" width="0.1524" layer="91"/>
<wire x1="152.4" y1="132.08" x2="157.48" y2="132.08" width="0.1524" layer="91"/>
<wire x1="144.78" y1="129.54" x2="144.78" y2="132.08" width="0.1524" layer="91"/>
<pinref part="C26" gate="G$1" pin="1"/>
<wire x1="152.4" y1="129.54" x2="152.4" y2="132.08" width="0.1524" layer="91"/>
<junction x="144.78" y="132.08"/>
<junction x="152.4" y="132.08"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="REF"/>
<wire x1="162.56" y1="68.58" x2="160.02" y2="68.58" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="EEDATA"/>
<wire x1="162.56" y1="50.8" x2="160.02" y2="50.8" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="OSCI"/>
<wire x1="162.56" y1="40.64" x2="160.02" y2="40.64" width="0.1524" layer="91"/>
<pinref part="X1" gate="G$1" pin="A"/>
<wire x1="160.02" y1="40.64" x2="157.48" y2="40.64" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="1"/>
<junction x="160.02" y="40.64"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="OSCO"/>
<wire x1="160.02" y1="33.02" x2="162.56" y2="33.02" width="0.1524" layer="91"/>
<pinref part="X1" gate="G$1" pin="B"/>
<wire x1="160.02" y1="33.02" x2="157.48" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="1"/>
<junction x="160.02" y="33.02"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="K"/>
<wire x1="226.06" y1="45.72" x2="226.06" y2="48.26" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="BCBUS3"/>
<wire x1="203.2" y1="45.72" x2="226.06" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="LED2" gate="G$1" pin="K"/>
<wire x1="238.76" y1="43.18" x2="238.76" y2="48.26" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="BCBUS4"/>
<wire x1="203.2" y1="43.18" x2="238.76" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="1"/>
<pinref part="LED1" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="R2" gate="G$1" pin="1"/>
<pinref part="LED2" gate="G$1" pin="A"/>
</segment>
</net>
<net name="EXT_SCLK" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="4"/>
<wire x1="274.32" y1="60.96" x2="284.48" y2="60.96" width="0.1524" layer="91"/>
<label x="274.32" y="60.96" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="203.2" y1="121.92" x2="213.36" y2="121.92" width="0.1524" layer="91"/>
<label x="213.36" y="121.92" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="ADBUS0"/>
</segment>
</net>
<net name="EXT_MOSI" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="5"/>
<wire x1="284.48" y1="58.42" x2="274.32" y2="58.42" width="0.1524" layer="91"/>
<label x="274.32" y="58.42" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="203.2" y1="119.38" x2="213.36" y2="119.38" width="0.1524" layer="91"/>
<label x="213.36" y="119.38" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="ADBUS1"/>
</segment>
</net>
<net name="EXT_MISO" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="6"/>
<wire x1="274.32" y1="55.88" x2="284.48" y2="55.88" width="0.1524" layer="91"/>
<label x="274.32" y="55.88" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="203.2" y1="116.84" x2="213.36" y2="116.84" width="0.1524" layer="91"/>
<label x="213.36" y="116.84" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="ADBUS2"/>
</segment>
</net>
<net name="!EXT_CS" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="3"/>
<wire x1="284.48" y1="63.5" x2="274.32" y2="63.5" width="0.1524" layer="91"/>
<label x="274.32" y="63.5" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="203.2" y1="114.3" x2="213.36" y2="114.3" width="0.1524" layer="91"/>
<label x="213.36" y="114.3" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="ADBUS3"/>
</segment>
</net>
<net name="EXT_IRQ" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="7"/>
<wire x1="284.48" y1="53.34" x2="274.32" y2="53.34" width="0.1524" layer="91"/>
<label x="274.32" y="53.34" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="203.2" y1="111.76" x2="213.36" y2="111.76" width="0.1524" layer="91"/>
<label x="213.36" y="111.76" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="ADBUS4"/>
</segment>
</net>
<net name="EXT_CE" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="2"/>
<wire x1="274.32" y1="66.04" x2="284.48" y2="66.04" width="0.1524" layer="91"/>
<label x="274.32" y="66.04" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="203.2" y1="109.22" x2="213.36" y2="109.22" width="0.1524" layer="91"/>
<label x="213.36" y="109.22" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="ADBUS5"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
