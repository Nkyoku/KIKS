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
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
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
<library name="con-Molex">
<packages>
<package name="53261-04">
<text x="-3" y="1.5" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-3" y="0" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<wire x1="3.375" y1="-1" x2="-3.375" y2="-1" width="0.127" layer="21"/>
<wire x1="3.375" y1="3.2" x2="-3.375" y2="3.2" width="0.127" layer="21"/>
<wire x1="3.375" y1="3.2" x2="3.375" y2="-1" width="0.127" layer="21"/>
<wire x1="-3.375" y1="-1" x2="-3.375" y2="3.2" width="0.127" layer="21"/>
<wire x1="-3.375" y1="2.8" x2="-4.875" y2="2.8" width="0.127" layer="51"/>
<wire x1="-4.875" y1="2.8" x2="-4.875" y2="0" width="0.127" layer="51"/>
<wire x1="-4.875" y1="0" x2="-3.375" y2="0" width="0.127" layer="51"/>
<wire x1="3.375" y1="0" x2="4.875" y2="0" width="0.127" layer="51"/>
<wire x1="4.875" y1="0" x2="4.875" y2="2.8" width="0.127" layer="51"/>
<wire x1="4.875" y1="2.8" x2="3.375" y2="2.8" width="0.127" layer="51"/>
<rectangle x1="-5.075" y1="0" x2="-4.875" y2="2.2" layer="51" rot="R180"/>
<rectangle x1="4.875" y1="0" x2="5.075" y2="2.2" layer="51" rot="R180"/>
<smd name="S1" x="4.5" y="1.1" dx="1.9" dy="3" layer="1" rot="R180"/>
<smd name="S2" x="-4.5" y="1.1" dx="1.9" dy="3" layer="1" rot="R180"/>
<smd name="1" x="1.875" y="-1.9" dx="0.6" dy="1.4" layer="1" rot="R180"/>
<smd name="2" x="0.625" y="-1.9" dx="0.6" dy="1.4" layer="1" rot="R180"/>
<smd name="3" x="-0.625" y="-1.9" dx="0.6" dy="1.4" layer="1" rot="R180"/>
<smd name="4" x="-1.875" y="-1.9" dx="0.6" dy="1.4" layer="1" rot="R180"/>
<rectangle x1="1.715" y1="-2" x2="2.035" y2="-1" layer="51" rot="R180"/>
<rectangle x1="0.465" y1="-2" x2="0.785" y2="-1" layer="51" rot="R180"/>
<rectangle x1="-0.785" y1="-2" x2="-0.465" y2="-1" layer="51" rot="R180"/>
<rectangle x1="-2.035" y1="-2" x2="-1.715" y2="-1" layer="51" rot="R180"/>
</package>
<package name="52271-11">
<smd name="S1" x="-8.5" y="0" dx="2.2" dy="2.8" layer="1"/>
<wire x1="-8" y1="3.3" x2="8" y2="3.3" width="0.127" layer="21"/>
<smd name="S2" x="8.5" y="0" dx="2.2" dy="2.8" layer="1"/>
<smd name="1" x="5" y="-2.4" dx="0.6" dy="2" layer="1"/>
<wire x1="7.2" y1="-1" x2="-7.2" y2="-1" width="0.127" layer="21"/>
<rectangle x1="-8.65" y1="-1" x2="-8" y2="1" layer="51"/>
<rectangle x1="8" y1="-1" x2="8.65" y2="1" layer="51"/>
<wire x1="-8" y1="3.3" x2="-9" y2="3.3" width="0.127" layer="51"/>
<wire x1="-9" y1="3.3" x2="-9" y2="4.4" width="0.127" layer="51"/>
<wire x1="-9" y1="4.4" x2="9" y2="4.4" width="0.127" layer="51"/>
<wire x1="9" y1="4.4" x2="9" y2="3.3" width="0.127" layer="51"/>
<wire x1="9" y1="3.3" x2="8" y2="3.3" width="0.127" layer="51"/>
<smd name="2" x="4" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="3" x="3" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="4" x="2" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="5" x="1" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="6" x="0" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="7" x="-1" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="8" x="-2" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="9" x="-3" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="10" x="-4" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="11" x="-5" y="-2.4" dx="0.6" dy="2" layer="1"/>
<rectangle x1="-5.175" y1="-3" x2="-4.825" y2="-1" layer="51"/>
<rectangle x1="-4.175" y1="-3" x2="-3.825" y2="-1" layer="51"/>
<rectangle x1="-3.175" y1="-3" x2="-2.825" y2="-1" layer="51"/>
<rectangle x1="-2.175" y1="-3" x2="-1.825" y2="-1" layer="51"/>
<rectangle x1="-1.175" y1="-3" x2="-0.825" y2="-1" layer="51"/>
<rectangle x1="-0.175" y1="-3" x2="0.175" y2="-1" layer="51"/>
<rectangle x1="0.825" y1="-3" x2="1.175" y2="-1" layer="51"/>
<rectangle x1="1.825" y1="-3" x2="2.175" y2="-1" layer="51"/>
<rectangle x1="2.825" y1="-3" x2="3.175" y2="-1" layer="51"/>
<rectangle x1="3.825" y1="-3" x2="4.175" y2="-1" layer="51"/>
<rectangle x1="4.825" y1="-3" x2="5.175" y2="-1" layer="51"/>
<wire x1="8" y1="1.6" x2="8" y2="3.3" width="0.127" layer="21"/>
<wire x1="-8" y1="3.3" x2="-8" y2="1.6" width="0.127" layer="21"/>
<wire x1="8" y1="1.6" x2="8" y2="-1" width="0.127" layer="51"/>
<wire x1="8" y1="-1" x2="7.2" y2="-1" width="0.127" layer="51"/>
<wire x1="-8" y1="1.6" x2="-8" y2="-1" width="0.127" layer="51"/>
<wire x1="-8" y1="-1" x2="-7.2" y2="-1" width="0.127" layer="51"/>
<text x="-4" y="1.5" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-4" y="0" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
</package>
<package name="504050-0691">
<text x="-4" y="2.5" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-4" y="1" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<wire x1="6.375" y1="0" x2="4.25" y2="0" width="0.127" layer="21"/>
<wire x1="4.25" y1="0" x2="3.25" y2="0" width="0.127" layer="51"/>
<wire x1="3.25" y1="0" x2="2.75" y2="0" width="0.127" layer="21"/>
<wire x1="2.75" y1="0" x2="1.75" y2="0" width="0.127" layer="51"/>
<wire x1="1.75" y1="0" x2="1.25" y2="0" width="0.127" layer="21"/>
<wire x1="1.25" y1="0" x2="0.25" y2="0" width="0.127" layer="51"/>
<wire x1="0.25" y1="0" x2="-0.25" y2="0" width="0.127" layer="21"/>
<wire x1="-0.25" y1="0" x2="-1.25" y2="0" width="0.127" layer="51"/>
<wire x1="-1.25" y1="0" x2="-1.75" y2="0" width="0.127" layer="21"/>
<wire x1="-1.75" y1="0" x2="-2.75" y2="0" width="0.127" layer="51"/>
<wire x1="-2.75" y1="0" x2="-3.25" y2="0" width="0.127" layer="21"/>
<wire x1="-3.25" y1="0" x2="-4.25" y2="0" width="0.127" layer="51"/>
<wire x1="-4.25" y1="0" x2="-6.375" y2="0" width="0.127" layer="21"/>
<wire x1="6.375" y1="6.1" x2="5.6" y2="6.1" width="0.127" layer="51"/>
<wire x1="5.6" y1="6.1" x2="4.425" y2="6.1" width="0.127" layer="21"/>
<wire x1="4.425" y1="6.1" x2="4.425" y2="4" width="0.127" layer="21"/>
<wire x1="4.425" y1="4" x2="-4.425" y2="4" width="0.127" layer="21"/>
<wire x1="-4.425" y1="4" x2="-4.425" y2="6.1" width="0.127" layer="21"/>
<wire x1="-4.425" y1="6.1" x2="-5.6" y2="6.1" width="0.127" layer="21"/>
<wire x1="-5.6" y1="6.1" x2="-6.375" y2="6.1" width="0.127" layer="51"/>
<wire x1="6.375" y1="6.1" x2="6.375" y2="4.1" width="0.127" layer="51"/>
<wire x1="6.375" y1="4.1" x2="6.375" y2="0" width="0.127" layer="21"/>
<wire x1="-6.375" y1="0" x2="-6.375" y2="4.1" width="0.127" layer="21"/>
<wire x1="-6.375" y1="4.1" x2="-6.375" y2="6.1" width="0.127" layer="51"/>
<rectangle x1="6.375" y1="4.45" x2="6.775" y2="5.95" layer="51"/>
<smd name="S1" x="6.5" y="5.2" dx="1.4" dy="1.8" layer="1" rot="R180"/>
<smd name="S2" x="-6.5" y="5.2" dx="1.4" dy="1.8" layer="1" rot="R180"/>
<smd name="1" x="3.75" y="-0.1" dx="0.6" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="3.55" y1="-0.34" x2="3.95" y2="0" layer="51"/>
<rectangle x1="-6.775" y1="4.45" x2="-6.375" y2="5.95" layer="51"/>
<rectangle x1="2.05" y1="-0.34" x2="2.45" y2="0" layer="51"/>
<rectangle x1="0.55" y1="-0.34" x2="0.95" y2="0" layer="51"/>
<rectangle x1="-0.95" y1="-0.34" x2="-0.55" y2="0" layer="51"/>
<rectangle x1="-2.45" y1="-0.34" x2="-2.05" y2="0" layer="51"/>
<rectangle x1="-3.95" y1="-0.34" x2="-3.55" y2="0" layer="51"/>
<smd name="2" x="2.25" y="-0.1" dx="0.6" dy="1.2" layer="1" rot="R180"/>
<smd name="3" x="0.75" y="-0.1" dx="0.6" dy="1.2" layer="1" rot="R180"/>
<smd name="4" x="-0.75" y="-0.1" dx="0.6" dy="1.2" layer="1" rot="R180"/>
<smd name="5" x="-2.25" y="-0.1" dx="0.6" dy="1.2" layer="1" rot="R180"/>
<smd name="6" x="-3.75" y="-0.1" dx="0.6" dy="1.2" layer="1" rot="R180"/>
</package>
</packages>
<symbols>
<symbol name="PIN1X4-S2">
<wire x1="-1.27" y1="-7.62" x2="3.81" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-7.62" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="5.08" x2="-1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="-1.27" y2="-7.62" width="0.4064" layer="94"/>
<text x="-1.27" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-1.27" y="5.588" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="-2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-5.08" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="S1" x="0" y="-10.16" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S2" x="2.54" y="-10.16" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
<symbol name="PIN1X11-S2">
<wire x1="-1.27" y1="-15.24" x2="3.81" y2="-15.24" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-15.24" x2="3.81" y2="15.24" width="0.4064" layer="94"/>
<wire x1="3.81" y1="15.24" x2="-1.27" y2="15.24" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="15.24" x2="-1.27" y2="-15.24" width="0.4064" layer="94"/>
<text x="-1.27" y="18.288" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-1.27" y="15.748" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-2.54" y="12.7" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="10.16" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="7.62" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="5.08" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="S1" x="0" y="-17.78" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S2" x="2.54" y="-17.78" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="7" x="-2.54" y="-2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="8" x="-2.54" y="-5.08" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="9" x="-2.54" y="-7.62" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="10" x="-2.54" y="-10.16" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="11" x="-2.54" y="-12.7" visible="pad" length="middle" direction="pas" function="dot"/>
</symbol>
<symbol name="PIN1X6-S2">
<wire x1="-1.27" y1="-10.16" x2="3.81" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-10.16" x2="3.81" y2="7.62" width="0.4064" layer="94"/>
<wire x1="3.81" y1="7.62" x2="-1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="7.62" x2="-1.27" y2="-10.16" width="0.4064" layer="94"/>
<text x="-1.27" y="10.668" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-1.27" y="8.128" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="-5.08" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-7.62" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="S1" x="0" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S2" x="2.54" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="53261-0471" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="PIN1X4-S2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="53261-04">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="S1" pad="S1"/>
<connect gate="G$1" pin="S2" pad="S2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="52271-1179" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="PIN1X11-S2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="52271-11">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
<connect gate="G$1" pin="S1" pad="S1"/>
<connect gate="G$1" pin="S2" pad="S2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="504050-0691" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="PIN1X6-S2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="504050-0691">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="S1" pad="S1"/>
<connect gate="G$1" pin="S2" pad="S2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-ams">
<description>austriamicrosystems</description>
<packages>
<package name="SSOP16">
<wire x1="-3.1" y1="2.65" x2="3.1" y2="2.65" width="0.127" layer="21"/>
<wire x1="3.1" y1="2.65" x2="3.1" y2="-2.65" width="0.127" layer="21"/>
<wire x1="3.1" y1="-2.65" x2="-3.1" y2="-2.65" width="0.127" layer="21"/>
<wire x1="-3.1" y1="-2.65" x2="-3.1" y2="2.65" width="0.127" layer="21"/>
<circle x="-2.5" y="-2.05" radius="0.25" width="0.127" layer="21"/>
<smd name="1" x="-2.275" y="-3.85" dx="0.381" dy="1.6" layer="1"/>
<text x="-2" y="0.5" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-2" y="-1" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<rectangle x1="-2.4" y1="-3.9" x2="-2.15" y2="-2.65" layer="51"/>
<smd name="2" x="-1.625" y="-3.85" dx="0.381" dy="1.6" layer="1"/>
<smd name="3" x="-0.975" y="-3.85" dx="0.381" dy="1.6" layer="1"/>
<smd name="4" x="-0.325" y="-3.85" dx="0.381" dy="1.6" layer="1"/>
<smd name="5" x="0.325" y="-3.85" dx="0.381" dy="1.6" layer="1"/>
<smd name="6" x="0.975" y="-3.85" dx="0.381" dy="1.6" layer="1"/>
<smd name="7" x="1.625" y="-3.85" dx="0.381" dy="1.6" layer="1"/>
<smd name="8" x="2.275" y="-3.85" dx="0.381" dy="1.6" layer="1"/>
<smd name="9" x="2.275" y="3.85" dx="0.381" dy="1.6" layer="1" rot="R180"/>
<smd name="10" x="1.625" y="3.85" dx="0.381" dy="1.6" layer="1" rot="R180"/>
<smd name="11" x="0.975" y="3.85" dx="0.381" dy="1.6" layer="1" rot="R180"/>
<smd name="12" x="0.325" y="3.85" dx="0.381" dy="1.6" layer="1" rot="R180"/>
<smd name="13" x="-0.325" y="3.85" dx="0.381" dy="1.6" layer="1" rot="R180"/>
<smd name="14" x="-0.975" y="3.85" dx="0.381" dy="1.6" layer="1" rot="R180"/>
<smd name="15" x="-1.625" y="3.85" dx="0.381" dy="1.6" layer="1" rot="R180"/>
<smd name="16" x="-2.275" y="3.85" dx="0.381" dy="1.6" layer="1" rot="R180"/>
<rectangle x1="-1.75" y1="2.65" x2="-1.5" y2="3.9" layer="51" rot="R180"/>
<rectangle x1="-2.4" y1="2.65" x2="-2.15" y2="3.9" layer="51" rot="R180"/>
<rectangle x1="-1.1" y1="2.65" x2="-0.85" y2="3.9" layer="51" rot="R180"/>
<rectangle x1="-0.45" y1="2.65" x2="-0.2" y2="3.9" layer="51" rot="R180"/>
<rectangle x1="0.2" y1="2.65" x2="0.45" y2="3.9" layer="51" rot="R180"/>
<rectangle x1="0.85" y1="2.65" x2="1.1" y2="3.9" layer="51" rot="R180"/>
<rectangle x1="1.5" y1="2.65" x2="1.75" y2="3.9" layer="51" rot="R180"/>
<rectangle x1="2.15" y1="2.65" x2="2.4" y2="3.9" layer="51" rot="R180"/>
<rectangle x1="-1.75" y1="-3.9" x2="-1.5" y2="-2.65" layer="51"/>
<rectangle x1="-1.1" y1="-3.9" x2="-0.85" y2="-2.65" layer="51"/>
<rectangle x1="-0.45" y1="-3.9" x2="-0.2" y2="-2.65" layer="51"/>
<rectangle x1="0.2" y1="-3.9" x2="0.45" y2="-2.65" layer="51"/>
<rectangle x1="0.85" y1="-3.9" x2="1.1" y2="-2.65" layer="51"/>
<rectangle x1="1.5" y1="-3.9" x2="1.75" y2="-2.65" layer="51"/>
<rectangle x1="2.15" y1="-3.9" x2="2.4" y2="-2.65" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="AS5145">
<text x="-12.7" y="15.748" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-12.7" y="-17.78" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<wire x1="-12.7" y1="15.24" x2="-12.7" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-15.24" x2="12.7" y2="-15.24" width="0.254" layer="94"/>
<wire x1="12.7" y1="-15.24" x2="12.7" y2="15.24" width="0.254" layer="94"/>
<wire x1="12.7" y1="15.24" x2="-12.7" y2="15.24" width="0.254" layer="94"/>
<pin name="VSS" x="-15.24" y="-12.7" length="short"/>
<pin name="MODE/INDEX" x="15.24" y="2.54" length="short" rot="R180"/>
<pin name="!MAGDEC" x="15.24" y="10.16" length="short" rot="R180"/>
<pin name="VDD5V" x="-15.24" y="12.7" length="short"/>
<pin name="!MAGINC" x="15.24" y="12.7" length="short" rot="R180"/>
<pin name="DTEST2/B" x="15.24" y="5.08" length="short" rot="R180"/>
<pin name="DTEST1/A" x="15.24" y="7.62" length="short" rot="R180"/>
<pin name="VDD3V3" x="-15.24" y="10.16" length="short"/>
<pin name="PDIO" x="15.24" y="-10.16" length="short" rot="R180"/>
<pin name="DO" x="15.24" y="-12.7" length="short" rot="R180"/>
<pin name="CLK" x="15.24" y="-7.62" length="short" rot="R180"/>
<pin name="PWM" x="15.24" y="0" length="short" rot="R180"/>
<pin name="!CS" x="15.24" y="-5.08" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="AS5145" prefix="U">
<gates>
<gate name="G$1" symbol="AS5145" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SSOP16">
<connects>
<connect gate="G$1" pin="!CS" pad="11"/>
<connect gate="G$1" pin="!MAGDEC" pad="2"/>
<connect gate="G$1" pin="!MAGINC" pad="1"/>
<connect gate="G$1" pin="CLK" pad="10"/>
<connect gate="G$1" pin="DO" pad="9"/>
<connect gate="G$1" pin="DTEST1/A" pad="3"/>
<connect gate="G$1" pin="DTEST2/B" pad="4"/>
<connect gate="G$1" pin="MODE/INDEX" pad="6"/>
<connect gate="G$1" pin="PDIO" pad="8"/>
<connect gate="G$1" pin="PWM" pad="12"/>
<connect gate="G$1" pin="VDD3V3" pad="15"/>
<connect gate="G$1" pin="VDD5V" pad="16"/>
<connect gate="G$1" pin="VSS" pad="7"/>
</connects>
<technologies>
<technology name="A"/>
<technology name="B"/>
<technology name="H"/>
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
<text x="0" y="-0.762" size="1.778" layer="96" font="vector" align="top-center">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="+5V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
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
<deviceset name="+5V" prefix="+P">
<gates>
<gate name="1" symbol="+5V" x="0" y="0"/>
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
<text x="1.524" y="2.794" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="1.524" y="-2.032" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<rectangle x1="-2.032" y1="0.508" x2="2.032" y2="1.016" layer="94"/>
<rectangle x1="-2.032" y1="1.524" x2="2.032" y2="2.032" layer="94"/>
<pin name="1" x="0" y="5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
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
<library name="Opto">
<packages>
<package name="1608">
<wire x1="1.35" y1="0.6" x2="1.35" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="-0.6" x2="-1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="0.6" x2="1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.35" y1="-0.6" x2="-1.35" y2="-0.6" width="0.127" layer="21"/>
<smd name="K" x="-0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<smd name="A" x="0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4" y2="0.4" layer="51"/>
<rectangle x1="0.4" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="0.25" x2="0.4" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="-0.4" x2="0.4" y2="-0.25" layer="51"/>
<wire x1="0.2" y1="0" x2="-0.2" y2="0" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="0.2" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="-0.2" width="0.127" layer="21"/>
<text x="-1.4" y="0.8" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.4" y="-1.6" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
</package>
<package name="1611">
<wire x1="1.35" y1="0.6" x2="1.35" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="-0.6" x2="-1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="0.6" x2="1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.35" y1="-0.6" x2="-1.35" y2="-0.6" width="0.127" layer="21"/>
<smd name="K" x="-0.8" y="0" dx="0.7" dy="0.8" layer="1"/>
<smd name="A" x="0.8" y="0" dx="0.7" dy="0.8" layer="1"/>
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
<text x="-1.4" y="0.8" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.4" y="-1.6" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
</package>
<package name="2012">
<wire x1="1.7" y1="0.85" x2="1.7" y2="-0.85" width="0.127" layer="21"/>
<smd name="K" x="-1.125" y="0" dx="0.75" dy="1.25" layer="1"/>
<smd name="A" x="1.125" y="0" dx="0.75" dy="1.25" layer="1"/>
<rectangle x1="-1" y1="-0.625" x2="-0.75" y2="0.625" layer="51"/>
<rectangle x1="0.75" y1="-0.625" x2="1" y2="0.625" layer="51"/>
<rectangle x1="-0.75" y1="0.475" x2="0.75" y2="0.625" layer="51"/>
<rectangle x1="-0.75" y1="-0.625" x2="0.75" y2="-0.475" layer="51"/>
<wire x1="0.3" y1="0" x2="-0.3" y2="0" width="0.127" layer="21"/>
<wire x1="-0.3" y1="0" x2="0" y2="0.3" width="0.127" layer="21"/>
<wire x1="-0.3" y1="0" x2="0" y2="-0.3" width="0.127" layer="21"/>
<wire x1="-1.7" y1="0.85" x2="1.7" y2="0.85" width="0.127" layer="21"/>
<wire x1="1.7" y1="-0.85" x2="-1.7" y2="-0.85" width="0.127" layer="21"/>
<wire x1="-1.7" y1="-0.85" x2="-1.7" y2="0.85" width="0.127" layer="21"/>
<text x="-1.7" y="1" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.7" y="-1.8" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
</package>
<package name="T-1">
<text x="-1.5" y="2.5" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-1.5" y="-3.5" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<wire x1="0.3" y1="0" x2="-0.3" y2="0" width="0.127" layer="21"/>
<wire x1="-0.3" y1="0" x2="0" y2="0.3" width="0.127" layer="21"/>
<wire x1="-0.3" y1="0" x2="0" y2="-0.3" width="0.127" layer="21"/>
<pad name="K" x="-1.27" y="0" drill="0.9"/>
<pad name="A" x="1.27" y="0" drill="0.9"/>
<circle x="0" y="0" radius="1.5" width="0.127" layer="51"/>
<wire x1="-1.5" y1="1.3" x2="1.9" y2="0.65" width="0.127" layer="21" curve="-120"/>
<wire x1="-1.5" y1="-1.3" x2="1.9" y2="-0.65" width="0.127" layer="21" curve="120"/>
<wire x1="-1.5" y1="1.3" x2="-1.5" y2="0.9" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.3" x2="-1.5" y2="-0.9" width="0.127" layer="21"/>
<wire x1="-1.5" y1="0.9" x2="-1.5" y2="-0.9" width="0.127" layer="51"/>
<wire x1="1.9" y1="0.65" x2="1.9" y2="-0.65" width="0.127" layer="51" curve="-35"/>
</package>
<package name="3216">
<wire x1="2.35" y1="1" x2="2.35" y2="-1" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1" x2="-2.35" y2="-1" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-1" x2="-2.35" y2="1" width="0.127" layer="21"/>
<wire x1="-2.35" y1="1" x2="2.35" y2="1" width="0.127" layer="21"/>
<smd name="K" x="-1.625" y="0" dx="1.05" dy="1.6" layer="1"/>
<smd name="A" x="1.625" y="0" dx="1.05" dy="1.6" layer="1"/>
<text x="-2.4" y="1.2" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-2.4" y="-2" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-1.7" y1="-0.8" x2="-1.1" y2="0.8" layer="51"/>
<rectangle x1="1.1" y1="-0.8" x2="1.7" y2="0.8" layer="51"/>
<rectangle x1="-1.1" y1="0.6" x2="1.1" y2="0.8" layer="51"/>
<rectangle x1="-1.1" y1="-0.8" x2="1.1" y2="-0.6" layer="51"/>
<wire x1="0.4" y1="0" x2="-0.4" y2="0" width="0.127" layer="21"/>
<wire x1="-0.4" y1="0" x2="0" y2="0.4" width="0.127" layer="21"/>
<wire x1="-0.4" y1="0" x2="0" y2="-0.4" width="0.127" layer="21"/>
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
<device name="-T-1" package="T-1">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3216" package="3216">
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
<part name="CN1" library="con-Molex" deviceset="53261-0471" device="" value="US Digital 4pin"/>
<part name="U1" library="ic-ams" deviceset="AS5145" device="" technology="B"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="+P2" library="supply1" deviceset="+5V" device=""/>
<part name="CN3" library="con-Molex" deviceset="52271-1179" device="" value="Motor"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="+P4" library="supply1" deviceset="+5V" device=""/>
<part name="C3" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="CN2" library="con-Molex" deviceset="504050-0691" device="" value="Host"/>
<part name="R2" library="Passive" deviceset="R" device="1608" value="51"/>
<part name="R3" library="Passive" deviceset="R" device="1608" value="51"/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="LED1" library="Opto" deviceset="LED" device="1608" value="Red"/>
<part name="R1" library="Passive" deviceset="R" device="1608" value="1.5k"/>
<part name="+P3" library="supply1" deviceset="+5V" device=""/>
<part name="R4" library="Passive" deviceset="R" device="1608" value="51"/>
<part name="R5" library="Passive" deviceset="R" device="1608" value="51"/>
<part name="C1" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C2" library="Passive" deviceset="C" device="1608" value="4.7u"/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="+P1" library="supply1" deviceset="+5V" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="0" y1="0" x2="35.56" y2="0" width="0.1524" layer="97"/>
<wire x1="35.56" y1="0" x2="55.88" y2="0" width="0.1524" layer="97"/>
<wire x1="55.88" y1="0" x2="76.2" y2="0" width="0.1524" layer="97"/>
<wire x1="76.2" y1="0" x2="101.6" y2="0" width="0.1524" layer="97"/>
<wire x1="0" y1="0" x2="0" y2="7.62" width="0.1524" layer="97"/>
<text x="2.54" y="5.08" size="1.778" layer="97" font="vector" align="center-left">KIKS2014</text>
<text x="2.54" y="2.54" size="1.778" layer="97" font="vector" align="center-left">Gen.5 Optical Encoder</text>
<wire x1="0" y1="7.62" x2="0" y2="157.48" width="0.1524" layer="97"/>
<wire x1="0" y1="7.62" x2="35.56" y2="7.62" width="0.1524" layer="97"/>
<wire x1="35.56" y1="7.62" x2="55.88" y2="7.62" width="0.1524" layer="97"/>
<wire x1="55.88" y1="7.62" x2="55.88" y2="0" width="0.1524" layer="97"/>
<wire x1="55.88" y1="7.62" x2="76.2" y2="7.62" width="0.1524" layer="97"/>
<wire x1="76.2" y1="7.62" x2="101.6" y2="7.62" width="0.1524" layer="97"/>
<wire x1="101.6" y1="7.62" x2="101.6" y2="0" width="0.1524" layer="97"/>
<text x="78.74" y="2.54" size="1.778" layer="97" font="vector" align="center-left">FUJII NAOMICHI</text>
<text x="78.74" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Designed by</text>
<text x="58.42" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Date</text>
<text x="58.42" y="2.54" size="1.778" layer="97" font="vector" align="center-left">2013/12/26</text>
<wire x1="76.2" y1="0" x2="76.2" y2="7.62" width="0.1524" layer="97"/>
<wire x1="101.6" y1="0" x2="205.74" y2="0" width="0.1524" layer="97"/>
<wire x1="205.74" y1="157.48" x2="205.74" y2="0" width="0.1524" layer="97"/>
<wire x1="0" y1="157.48" x2="205.74" y2="157.48" width="0.1524" layer="97"/>
<wire x1="35.56" y1="7.62" x2="35.56" y2="0" width="0.1524" layer="97"/>
<text x="38.1" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Revision A</text>
</plain>
<instances>
<instance part="CN1" gate="G$1" x="139.7" y="40.64"/>
<instance part="U1" gate="G$1" x="48.26" y="38.1"/>
<instance part="GND1" gate="1" x="134.62" y="27.94"/>
<instance part="GND2" gate="1" x="142.24" y="27.94"/>
<instance part="+P2" gate="1" x="134.62" y="48.26"/>
<instance part="CN3" gate="G$1" x="15.24" y="116.84" rot="MR0"/>
<instance part="GND4" gate="1" x="20.32" y="99.06"/>
<instance part="+P4" gate="1" x="33.02" y="144.78" rot="R270"/>
<instance part="C3" gate="G$1" x="25.4" y="137.16"/>
<instance part="GND13" gate="1" x="25.4" y="132.08"/>
<instance part="GND3" gate="1" x="12.7" y="93.98"/>
<instance part="CN2" gate="G$1" x="88.9" y="119.38"/>
<instance part="R2" gate="G$1" x="91.44" y="55.88"/>
<instance part="R3" gate="G$1" x="91.44" y="48.26"/>
<instance part="GND6" gate="1" x="66.04" y="20.32"/>
<instance part="LED1" gate="G$1" x="68.58" y="55.88"/>
<instance part="R1" gate="G$1" x="68.58" y="66.04" rot="R90"/>
<instance part="+P3" gate="1" x="68.58" y="73.66"/>
<instance part="R4" gate="G$1" x="91.44" y="40.64"/>
<instance part="R5" gate="G$1" x="91.44" y="33.02"/>
<instance part="C1" gate="G$1" x="15.24" y="35.56"/>
<instance part="C2" gate="G$1" x="25.4" y="35.56"/>
<instance part="GND5" gate="1" x="25.4" y="22.86"/>
<instance part="+P1" gate="1" x="15.24" y="55.88"/>
<instance part="GND7" gate="1" x="91.44" y="101.6"/>
</instances>
<busses>
</busses>
<nets>
<net name="ENC_A" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="2"/>
<wire x1="137.16" y1="40.64" x2="129.54" y2="40.64" width="0.1524" layer="91"/>
<label x="129.54" y="40.64" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="93.98" y1="55.88" x2="96.52" y2="55.88" width="0.1524" layer="91"/>
<label x="101.6" y="55.88" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="96.52" y1="55.88" x2="101.6" y2="55.88" width="0.1524" layer="91"/>
<wire x1="93.98" y1="48.26" x2="96.52" y2="48.26" width="0.1524" layer="91"/>
<wire x1="96.52" y1="48.26" x2="96.52" y2="55.88" width="0.1524" layer="91"/>
<junction x="96.52" y="55.88"/>
</segment>
</net>
<net name="ENC_B" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="4"/>
<wire x1="137.16" y1="35.56" x2="129.54" y2="35.56" width="0.1524" layer="91"/>
<label x="129.54" y="35.56" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="93.98" y1="33.02" x2="96.52" y2="33.02" width="0.1524" layer="91"/>
<label x="101.6" y="33.02" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R5" gate="G$1" pin="2"/>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="96.52" y1="33.02" x2="101.6" y2="33.02" width="0.1524" layer="91"/>
<wire x1="93.98" y1="40.64" x2="96.52" y2="40.64" width="0.1524" layer="91"/>
<wire x1="96.52" y1="40.64" x2="96.52" y2="33.02" width="0.1524" layer="91"/>
<junction x="96.52" y="33.02"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="134.62" y1="30.48" x2="134.62" y2="38.1" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="3"/>
<wire x1="134.62" y1="38.1" x2="137.16" y2="38.1" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="CN1" gate="G$1" pin="S1"/>
<pinref part="GND2" gate="1" pin="GND"/>
<pinref part="CN1" gate="G$1" pin="S2"/>
<wire x1="142.24" y1="30.48" x2="139.7" y2="30.48" width="0.1524" layer="91"/>
<junction x="142.24" y="30.48"/>
</segment>
<segment>
<pinref part="CN3" gate="G$1" pin="5"/>
<wire x1="17.78" y1="119.38" x2="20.32" y2="119.38" width="0.1524" layer="91"/>
<wire x1="20.32" y1="119.38" x2="20.32" y2="101.6" width="0.1524" layer="91"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="2"/>
<pinref part="GND13" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="CN3" gate="G$1" pin="S2"/>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="12.7" y1="99.06" x2="12.7" y2="96.52" width="0.1524" layer="91"/>
<wire x1="12.7" y1="96.52" x2="15.24" y2="96.52" width="0.1524" layer="91"/>
<pinref part="CN3" gate="G$1" pin="S1"/>
<wire x1="15.24" y1="96.52" x2="15.24" y2="99.06" width="0.1524" layer="91"/>
<junction x="12.7" y="96.52"/>
</segment>
<segment>
<wire x1="63.5" y1="27.94" x2="66.04" y2="27.94" width="0.1524" layer="91"/>
<wire x1="66.04" y1="27.94" x2="66.04" y2="22.86" width="0.1524" layer="91"/>
<pinref part="GND6" gate="1" pin="GND"/>
<wire x1="63.5" y1="33.02" x2="66.04" y2="33.02" width="0.1524" layer="91"/>
<wire x1="66.04" y1="33.02" x2="66.04" y2="30.48" width="0.1524" layer="91"/>
<wire x1="66.04" y1="30.48" x2="66.04" y2="27.94" width="0.1524" layer="91"/>
<wire x1="63.5" y1="30.48" x2="66.04" y2="30.48" width="0.1524" layer="91"/>
<junction x="66.04" y="30.48"/>
<junction x="66.04" y="27.94"/>
<pinref part="U1" gate="G$1" pin="PDIO"/>
<pinref part="U1" gate="G$1" pin="CLK"/>
<pinref part="U1" gate="G$1" pin="!CS"/>
</segment>
<segment>
<pinref part="GND5" gate="1" pin="GND"/>
<wire x1="33.02" y1="25.4" x2="25.4" y2="25.4" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="2"/>
<wire x1="25.4" y1="33.02" x2="25.4" y2="25.4" width="0.1524" layer="91"/>
<wire x1="25.4" y1="25.4" x2="15.24" y2="25.4" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="15.24" y1="25.4" x2="15.24" y2="33.02" width="0.1524" layer="91"/>
<junction x="25.4" y="25.4"/>
<pinref part="U1" gate="G$1" pin="VSS"/>
</segment>
<segment>
<pinref part="CN2" gate="G$1" pin="S1"/>
<wire x1="88.9" y1="106.68" x2="88.9" y2="104.14" width="0.1524" layer="91"/>
<pinref part="GND7" gate="1" pin="GND"/>
<wire x1="88.9" y1="104.14" x2="91.44" y2="104.14" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="S2"/>
<wire x1="91.44" y1="104.14" x2="91.44" y2="106.68" width="0.1524" layer="91"/>
<junction x="91.44" y="104.14"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="1"/>
<wire x1="137.16" y1="43.18" x2="134.62" y2="43.18" width="0.1524" layer="91"/>
<wire x1="134.62" y1="43.18" x2="134.62" y2="45.72" width="0.1524" layer="91"/>
<pinref part="+P2" gate="1" pin="+5V"/>
</segment>
<segment>
<pinref part="CN3" gate="G$1" pin="1"/>
<wire x1="17.78" y1="129.54" x2="20.32" y2="129.54" width="0.1524" layer="91"/>
<wire x1="20.32" y1="129.54" x2="20.32" y2="144.78" width="0.1524" layer="91"/>
<wire x1="20.32" y1="144.78" x2="25.4" y2="144.78" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="25.4" y1="142.24" x2="25.4" y2="144.78" width="0.1524" layer="91"/>
<pinref part="+P4" gate="1" pin="+5V"/>
<wire x1="30.48" y1="144.78" x2="25.4" y2="144.78" width="0.1524" layer="91"/>
<junction x="25.4" y="144.78"/>
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="+P3" gate="1" pin="+5V"/>
<wire x1="68.58" y1="68.58" x2="68.58" y2="71.12" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="15.24" y1="53.34" x2="15.24" y2="50.8" width="0.1524" layer="91"/>
<wire x1="15.24" y1="50.8" x2="15.24" y2="40.64" width="0.1524" layer="91"/>
<wire x1="33.02" y1="50.8" x2="15.24" y2="50.8" width="0.1524" layer="91"/>
<junction x="15.24" y="50.8"/>
<pinref part="+P1" gate="1" pin="+5V"/>
<pinref part="U1" gate="G$1" pin="VDD5V"/>
</segment>
</net>
<net name="MOT_U" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="10"/>
<wire x1="17.78" y1="106.68" x2="25.4" y2="106.68" width="0.1524" layer="91"/>
<wire x1="25.4" y1="106.68" x2="25.4" y2="104.14" width="0.1524" layer="91"/>
<pinref part="CN3" gate="G$1" pin="11"/>
<wire x1="25.4" y1="104.14" x2="17.78" y2="104.14" width="0.1524" layer="91"/>
<wire x1="25.4" y1="106.68" x2="76.2" y2="106.68" width="0.1524" layer="91"/>
<junction x="25.4" y="106.68"/>
<label x="30.48" y="107.188" size="1.27" layer="95" font="vector"/>
<pinref part="CN2" gate="G$1" pin="6"/>
<wire x1="86.36" y1="111.76" x2="76.2" y2="111.76" width="0.1524" layer="91"/>
<wire x1="76.2" y1="111.76" x2="76.2" y2="106.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT_V" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="9"/>
<wire x1="17.78" y1="109.22" x2="25.4" y2="109.22" width="0.1524" layer="91"/>
<wire x1="25.4" y1="109.22" x2="25.4" y2="111.76" width="0.1524" layer="91"/>
<pinref part="CN3" gate="G$1" pin="8"/>
<wire x1="25.4" y1="111.76" x2="17.78" y2="111.76" width="0.1524" layer="91"/>
<wire x1="25.4" y1="111.76" x2="73.66" y2="111.76" width="0.1524" layer="91"/>
<junction x="25.4" y="111.76"/>
<label x="30.48" y="112.268" size="1.27" layer="95" font="vector"/>
<wire x1="73.66" y1="111.76" x2="73.66" y2="114.3" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="5"/>
<wire x1="73.66" y1="114.3" x2="86.36" y2="114.3" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT_W" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="7"/>
<wire x1="17.78" y1="114.3" x2="25.4" y2="114.3" width="0.1524" layer="91"/>
<wire x1="25.4" y1="114.3" x2="25.4" y2="116.84" width="0.1524" layer="91"/>
<pinref part="CN3" gate="G$1" pin="6"/>
<wire x1="25.4" y1="116.84" x2="17.78" y2="116.84" width="0.1524" layer="91"/>
<wire x1="25.4" y1="116.84" x2="86.36" y2="116.84" width="0.1524" layer="91"/>
<junction x="25.4" y="116.84"/>
<label x="30.48" y="117.348" size="1.27" layer="95" font="vector"/>
<pinref part="CN2" gate="G$1" pin="4"/>
</segment>
</net>
<net name="HALL_V" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="4"/>
<wire x1="17.78" y1="121.92" x2="86.36" y2="121.92" width="0.1524" layer="91"/>
<label x="30.48" y="122.428" size="1.27" layer="95" font="vector"/>
<pinref part="CN2" gate="G$1" pin="2"/>
</segment>
</net>
<net name="HALL_U" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="3"/>
<wire x1="17.78" y1="124.46" x2="73.66" y2="124.46" width="0.1524" layer="91"/>
<label x="30.48" y="124.968" size="1.27" layer="95" font="vector"/>
<wire x1="73.66" y1="119.38" x2="73.66" y2="124.46" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="3"/>
<wire x1="73.66" y1="119.38" x2="86.36" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="HALL_W" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="2"/>
<wire x1="17.78" y1="127" x2="76.2" y2="127" width="0.1524" layer="91"/>
<label x="30.48" y="127.508" size="1.27" layer="95" font="vector"/>
<wire x1="76.2" y1="127" x2="76.2" y2="124.46" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="1"/>
<wire x1="76.2" y1="124.46" x2="86.36" y2="124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="63.5" y1="48.26" x2="68.58" y2="48.26" width="0.1524" layer="91"/>
<wire x1="68.58" y1="48.26" x2="68.58" y2="50.8" width="0.1524" layer="91"/>
<wire x1="68.58" y1="50.8" x2="63.5" y2="50.8" width="0.1524" layer="91"/>
<wire x1="68.58" y1="50.8" x2="68.58" y2="53.34" width="0.1524" layer="91"/>
<pinref part="LED1" gate="G$1" pin="K"/>
<junction x="68.58" y="50.8"/>
<pinref part="U1" gate="G$1" pin="!MAGDEC"/>
<pinref part="U1" gate="G$1" pin="!MAGINC"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="A"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="68.58" y1="60.96" x2="68.58" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<wire x1="63.5" y1="45.72" x2="81.28" y2="45.72" width="0.1524" layer="91"/>
<wire x1="81.28" y1="45.72" x2="81.28" y2="55.88" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="81.28" y1="55.88" x2="86.36" y2="55.88" width="0.1524" layer="91"/>
<wire x1="81.28" y1="45.72" x2="81.28" y2="40.64" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="1"/>
<wire x1="81.28" y1="40.64" x2="86.36" y2="40.64" width="0.1524" layer="91"/>
<junction x="81.28" y="45.72"/>
<pinref part="U1" gate="G$1" pin="DTEST1/A"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="63.5" y1="43.18" x2="78.74" y2="43.18" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="78.74" y1="48.26" x2="86.36" y2="48.26" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="86.36" y1="33.02" x2="78.74" y2="33.02" width="0.1524" layer="91"/>
<wire x1="78.74" y1="33.02" x2="78.74" y2="43.18" width="0.1524" layer="91"/>
<wire x1="78.74" y1="43.18" x2="78.74" y2="48.26" width="0.1524" layer="91"/>
<junction x="78.74" y="43.18"/>
<pinref part="U1" gate="G$1" pin="DTEST2/B"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="33.02" y1="48.26" x2="25.4" y2="48.26" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="25.4" y1="40.64" x2="25.4" y2="48.26" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="VDD3V3"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
