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
<library name="ic-LT">
<description>Linear Technology</description>
<packages>
<package name="QFN28-0.5-PAD">
<wire x1="-2" y1="-2.5" x2="-2" y2="-2.05" width="0.127" layer="21"/>
<wire x1="-2" y1="-2.5" x2="-1.55" y2="-2.5" width="0.127" layer="21"/>
<wire x1="-2" y1="2.05" x2="-2" y2="2.5" width="0.127" layer="21"/>
<wire x1="-2" y1="2.5" x2="-1.55" y2="2.5" width="0.127" layer="21"/>
<wire x1="1.55" y1="2.5" x2="2" y2="2.5" width="0.127" layer="21"/>
<wire x1="2" y1="2.5" x2="2" y2="2.05" width="0.127" layer="21"/>
<wire x1="2" y1="-2.5" x2="2" y2="-2.05" width="0.127" layer="21"/>
<wire x1="2" y1="-2.5" x2="1.55" y2="-2.5" width="0.127" layer="21"/>
<wire x1="1.55" y1="-2.5" x2="-1.55" y2="-2.5" width="0.127" layer="51"/>
<wire x1="-2" y1="-2.05" x2="-2" y2="2.05" width="0.127" layer="51"/>
<wire x1="-1.55" y1="2.5" x2="1.55" y2="2.5" width="0.127" layer="51"/>
<wire x1="2" y1="2.05" x2="2" y2="-2.05" width="0.127" layer="51"/>
<circle x="-1.7" y="2.2" radius="0.1" width="0.127" layer="21"/>
<smd name="1" x="-2.2" y="1.75" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<text x="3.175" y="3.175" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="3.175" y="-3.81" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-2" y1="1.625" x2="-1.6" y2="1.875" layer="51"/>
<smd name="2" x="-2.2" y="1.25" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="-2" y1="1.125" x2="-1.6" y2="1.375" layer="51"/>
<smd name="3" x="-2.2" y="0.75" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="-2" y1="0.625" x2="-1.6" y2="0.875" layer="51"/>
<smd name="4" x="-2.2" y="0.25" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="-2" y1="0.125" x2="-1.6" y2="0.375" layer="51"/>
<smd name="5" x="-2.2" y="-0.25" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="-2" y1="-0.375" x2="-1.6" y2="-0.125" layer="51"/>
<smd name="6" x="-2.2" y="-0.75" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="-2" y1="-0.875" x2="-1.6" y2="-0.625" layer="51"/>
<smd name="7" x="-2.2" y="-1.25" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<smd name="8" x="-2.2" y="-1.75" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<smd name="9" x="-1.25" y="-2.7" dx="1.2" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-1.45" y1="-2.425" x2="-1.05" y2="-2.175" layer="51" rot="R90"/>
<smd name="10" x="-0.75" y="-2.7" dx="1.2" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-0.95" y1="-2.425" x2="-0.55" y2="-2.175" layer="51" rot="R90"/>
<smd name="11" x="-0.25" y="-2.7" dx="1.2" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-0.45" y1="-2.425" x2="-0.05" y2="-2.175" layer="51" rot="R90"/>
<smd name="12" x="0.25" y="-2.7" dx="1.2" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="0.05" y1="-2.425" x2="0.45" y2="-2.175" layer="51" rot="R90"/>
<smd name="13" x="0.75" y="-2.7" dx="1.2" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="0.55" y1="-2.425" x2="0.95" y2="-2.175" layer="51" rot="R90"/>
<smd name="14" x="1.25" y="-2.7" dx="1.2" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="1.05" y1="-2.425" x2="1.45" y2="-2.175" layer="51" rot="R90"/>
<smd name="15" x="2.2" y="-1.75" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="-1.875" x2="2" y2="-1.625" layer="51" rot="R180"/>
<smd name="16" x="2.2" y="-1.25" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="-1.375" x2="2" y2="-1.125" layer="51" rot="R180"/>
<smd name="17" x="2.2" y="-0.75" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="-0.875" x2="2" y2="-0.625" layer="51" rot="R180"/>
<smd name="18" x="2.2" y="-0.25" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="-0.375" x2="2" y2="-0.125" layer="51" rot="R180"/>
<smd name="19" x="2.2" y="0.25" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="0.125" x2="2" y2="0.375" layer="51" rot="R180"/>
<smd name="20" x="2.2" y="0.75" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="0.625" x2="2" y2="0.875" layer="51" rot="R180"/>
<smd name="21" x="2.2" y="1.25" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="1.125" x2="2" y2="1.375" layer="51" rot="R180"/>
<smd name="22" x="2.2" y="1.75" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="1.625" x2="2" y2="1.875" layer="51" rot="R180"/>
<smd name="23" x="1.25" y="2.7" dx="1.2" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="1.05" y1="2.175" x2="1.45" y2="2.425" layer="51" rot="R270"/>
<smd name="24" x="0.75" y="2.7" dx="1.2" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="0.55" y1="2.175" x2="0.95" y2="2.425" layer="51" rot="R270"/>
<smd name="25" x="0.25" y="2.7" dx="1.2" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="0.05" y1="2.175" x2="0.45" y2="2.425" layer="51" rot="R270"/>
<smd name="26" x="-0.25" y="2.7" dx="1.2" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-0.45" y1="2.175" x2="-0.05" y2="2.425" layer="51" rot="R270"/>
<smd name="27" x="-0.75" y="2.7" dx="1.2" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-0.95" y1="2.175" x2="-0.55" y2="2.425" layer="51" rot="R270"/>
<smd name="28" x="-1.25" y="2.7" dx="1.2" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-1.45" y1="2.175" x2="-1.05" y2="2.425" layer="51" rot="R270"/>
<rectangle x1="-2" y1="-1.375" x2="-1.6" y2="-1.125" layer="51"/>
<rectangle x1="-2" y1="-1.875" x2="-1.6" y2="-1.625" layer="51"/>
<pad name="PAD" x="0" y="0" drill="2.1" diameter="2.6" shape="square"/>
<rectangle x1="-1.4016" y1="-1.9016" x2="1.4016" y2="1.9016" layer="29"/>
<polygon width="0.2" layer="1">
<vertex x="-1.2" y="1.7"/>
<vertex x="1.2" y="1.7"/>
<vertex x="1.2" y="-1.7"/>
<vertex x="-1.2" y="-1.7"/>
</polygon>
</package>
</packages>
<symbols>
<symbol name="LT3504">
<wire x1="-12.7" y1="-43.18" x2="12.7" y2="-43.18" width="0.254" layer="94"/>
<wire x1="12.7" y1="-43.18" x2="12.7" y2="43.18" width="0.254" layer="94"/>
<wire x1="12.7" y1="43.18" x2="-12.7" y2="43.18" width="0.254" layer="94"/>
<wire x1="-12.7" y1="43.18" x2="-12.7" y2="-43.18" width="0.254" layer="94"/>
<text x="-12.7" y="43.688" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-12.7" y="-45.72" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="GND" x="-15.24" y="25.4" length="short"/>
<pin name="DA2" x="15.24" y="7.62" length="short" rot="R180"/>
<pin name="PAD" x="-15.24" y="22.86" visible="pin" length="short"/>
<pin name="DA1" x="15.24" y="30.48" length="short" rot="R180"/>
<pin name="DA3" x="15.24" y="-15.24" length="short" rot="R180"/>
<pin name="DA4" x="15.24" y="-38.1" length="short" rot="R180"/>
<pin name="SW2" x="15.24" y="17.78" length="short" rot="R180"/>
<pin name="SW1" x="15.24" y="40.64" length="short" rot="R180"/>
<pin name="SW3" x="15.24" y="-5.08" length="short" rot="R180"/>
<pin name="SW4" x="15.24" y="-27.94" length="short" rot="R180"/>
<pin name="RUN/SS1" x="-15.24" y="-17.78" length="short"/>
<pin name="RUN/SS2" x="-15.24" y="-20.32" length="short"/>
<pin name="RUN/SS3" x="-15.24" y="-22.86" length="short"/>
<pin name="RUN/SS4" x="-15.24" y="-25.4" length="short"/>
<pin name="RT/SYNC" x="-15.24" y="-30.48" length="short"/>
<pin name="FB4" x="15.24" y="-40.64" length="short" rot="R180"/>
<pin name="EN/UVLO" x="-15.24" y="-12.7" length="short"/>
<pin name="FB1" x="15.24" y="27.94" length="short" rot="R180"/>
<pin name="FB2" x="15.24" y="5.08" length="short" rot="R180"/>
<pin name="FB3" x="15.24" y="-17.78" length="short" rot="R180"/>
<pin name="SKY" x="-15.24" y="12.7" length="short"/>
<pin name="SW5" x="-15.24" y="0" length="short"/>
<pin name="PG" x="-15.24" y="-7.62" length="short"/>
<pin name="VIN" x="-15.24" y="33.02" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="LT3504" prefix="U">
<gates>
<gate name="G$1" symbol="LT3504" x="0" y="0"/>
</gates>
<devices>
<device name="" package="QFN28-0.5-PAD">
<connects>
<connect gate="G$1" pin="DA1" pad="6"/>
<connect gate="G$1" pin="DA2" pad="1"/>
<connect gate="G$1" pin="DA3" pad="3"/>
<connect gate="G$1" pin="DA4" pad="8"/>
<connect gate="G$1" pin="EN/UVLO" pad="16"/>
<connect gate="G$1" pin="FB1" pad="20"/>
<connect gate="G$1" pin="FB2" pad="22"/>
<connect gate="G$1" pin="FB3" pad="21"/>
<connect gate="G$1" pin="FB4" pad="19"/>
<connect gate="G$1" pin="GND" pad="10 18 27"/>
<connect gate="G$1" pin="PAD" pad="PAD"/>
<connect gate="G$1" pin="PG" pad="23"/>
<connect gate="G$1" pin="RT/SYNC" pad="17"/>
<connect gate="G$1" pin="RUN/SS1" pad="13"/>
<connect gate="G$1" pin="RUN/SS2" pad="14"/>
<connect gate="G$1" pin="RUN/SS3" pad="15"/>
<connect gate="G$1" pin="RUN/SS4" pad="12"/>
<connect gate="G$1" pin="SKY" pad="25"/>
<connect gate="G$1" pin="SW1" pad="5"/>
<connect gate="G$1" pin="SW2" pad="2"/>
<connect gate="G$1" pin="SW3" pad="4"/>
<connect gate="G$1" pin="SW4" pad="7"/>
<connect gate="G$1" pin="SW5" pad="24"/>
<connect gate="G$1" pin="VIN" pad="9 11 26 28"/>
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
<symbol name="VBAT">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="VBAT" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="+1V2">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+1V2" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+5V/2">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+5V/2" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+5V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+12V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.27" y1="-0.635" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="-1.27" y2="-0.635" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+12V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
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
<symbol name="+5V/3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+5V/3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
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
<deviceset name="+1V2" prefix="+P">
<gates>
<gate name="G$1" symbol="+1V2" x="0" y="0"/>
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
<deviceset name="+5V/2" prefix="+P">
<gates>
<gate name="1" symbol="+5V/2" x="0" y="0"/>
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
<deviceset name="+12V" prefix="+P">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="+12V" x="0" y="0"/>
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
<deviceset name="+5V/3" prefix="+P">
<gates>
<gate name="1" symbol="+5V/3" x="0" y="0"/>
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
<library name="Passive">
<description>Register, Capacitor, Inductor</description>
<packages>
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
<package name="1005-A4">
<smd name="A1" x="-0.6" y="0.8" dx="0.6" dy="0.35" layer="1"/>
<smd name="A2" x="0.6" y="0.8" dx="0.6" dy="0.35" layer="1"/>
<text x="-1.2" y="1.4" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.2" y="-2.2" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.5" y1="0.55" x2="-0.3" y2="1" layer="51"/>
<rectangle x1="0.3" y1="0.55" x2="0.5" y2="1" layer="51"/>
<smd name="B1" x="-0.6" y="0.25" dx="0.6" dy="0.25" layer="1"/>
<smd name="B2" x="0.6" y="0.25" dx="0.6" dy="0.25" layer="1"/>
<smd name="C1" x="-0.6" y="-0.25" dx="0.6" dy="0.25" layer="1"/>
<smd name="C2" x="0.6" y="-0.25" dx="0.6" dy="0.25" layer="1"/>
<smd name="D2" x="0.6" y="-0.8" dx="0.6" dy="0.35" layer="1"/>
<smd name="D1" x="-0.6" y="-0.8" dx="0.6" dy="0.35" layer="1"/>
<rectangle x1="-0.5" y1="0.075" x2="-0.3" y2="0.425" layer="51"/>
<rectangle x1="0.3" y1="0.075" x2="0.5" y2="0.425" layer="51"/>
<rectangle x1="-0.5" y1="-0.425" x2="-0.3" y2="-0.075" layer="51"/>
<rectangle x1="0.3" y1="-0.425" x2="0.5" y2="-0.075" layer="51"/>
<rectangle x1="-0.5" y1="-1" x2="-0.3" y2="-0.55" layer="51"/>
<rectangle x1="0.3" y1="-1" x2="0.5" y2="-0.55" layer="51"/>
<rectangle x1="-0.3" y1="-1" x2="0.3" y2="-0.9" layer="51"/>
<rectangle x1="0.2" y1="-0.9" x2="0.3" y2="0.9" layer="51"/>
<rectangle x1="-0.3" y1="0.9" x2="0.3" y2="1" layer="51"/>
<rectangle x1="-0.3" y1="-0.9" x2="-0.2" y2="0.9" layer="51"/>
<wire x1="-1.15" y1="1.2" x2="1.15" y2="1.2" width="0.127" layer="21"/>
<wire x1="1.15" y1="1.2" x2="1.15" y2="-1.2" width="0.127" layer="21"/>
<wire x1="1.15" y1="-1.2" x2="-1.15" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-1.15" y1="-1.2" x2="-1.15" y2="1.2" width="0.127" layer="21"/>
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
<package name="VR">
<pad name="A" x="-2.54" y="0" drill="0.8" diameter="1.3"/>
<pad name="B" x="2.54" y="0" drill="0.8" diameter="1.3"/>
<text x="4" y="0" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="4" y="-1" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<pad name="W" x="0" y="2.54" drill="0.8" diameter="1.3"/>
<wire x1="-3.3" y1="3.46" x2="3.3" y2="3.46" width="0.127" layer="21"/>
<wire x1="-3.3" y1="-3.53" x2="3.3" y2="-3.53" width="0.127" layer="21"/>
<circle x="0" y="0.31" radius="2" width="0.127" layer="51"/>
<wire x1="-1" y1="0.31" x2="1" y2="0.31" width="0.127" layer="51"/>
<wire x1="0" y1="1.31" x2="0" y2="-0.69" width="0.127" layer="51"/>
<wire x1="-3.3" y1="3.46" x2="-3.3" y2="0.3" width="0.127" layer="21"/>
<wire x1="-3.3" y1="-3.53" x2="-3.3" y2="-0.3" width="0.127" layer="21"/>
<wire x1="-3.3" y1="0.3" x2="-3.3" y2="-0.3" width="0.127" layer="51"/>
<wire x1="3.3" y1="3.46" x2="3.3" y2="0.3" width="0.127" layer="21"/>
<wire x1="3.3" y1="-3.53" x2="3.3" y2="-0.3" width="0.127" layer="21"/>
<wire x1="3.3" y1="0.3" x2="3.3" y2="-0.3" width="0.127" layer="51"/>
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
<symbol name="POTENTIOMETER">
<wire x1="0" y1="-2.54" x2="-1.016" y2="-2.159" width="0.2032" layer="94"/>
<wire x1="-1.016" y1="-2.159" x2="1.016" y2="-1.524" width="0.2032" layer="94"/>
<wire x1="1.016" y1="-1.524" x2="-1.016" y2="-0.889" width="0.2032" layer="94"/>
<text x="-2.54" y="-0.0254" size="1.778" layer="95" font="vector" align="bottom-right">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.778" layer="96" font="vector" align="bottom-right">&gt;VALUE</text>
<pin name="A" x="0" y="5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="B" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
<wire x1="-1.016" y1="1.651" x2="1.016" y2="2.286" width="0.2032" layer="94"/>
<wire x1="1.016" y1="2.286" x2="0" y2="2.54" width="0.2032" layer="94"/>
<wire x1="-1.016" y1="-0.889" x2="1.016" y2="-0.254" width="0.2032" layer="94"/>
<wire x1="1.016" y1="-0.254" x2="-1.016" y2="0.381" width="0.2032" layer="94"/>
<wire x1="-1.016" y1="0.381" x2="1.016" y2="1.016" width="0.2032" layer="94"/>
<wire x1="1.016" y1="1.016" x2="-1.016" y2="1.651" width="0.2032" layer="94"/>
<wire x1="2.54" y1="0" x2="1.27" y2="0" width="0.1524" layer="94"/>
<pin name="W" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<polygon width="0.254" layer="94">
<vertex x="1.27" y="0"/>
<vertex x="2.032" y="0.254"/>
<vertex x="2.032" y="-0.254"/>
</polygon>
</symbol>
<symbol name="RESETTABLE-FUSE">
<text x="-2.54" y="2.54" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<wire x1="-2.54" y1="0.762" x2="-2.54" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-0.762" x2="2.54" y2="-0.762" width="0.254" layer="94"/>
<wire x1="2.54" y1="-0.762" x2="2.54" y2="0.762" width="0.254" layer="94"/>
<wire x1="2.54" y1="0.762" x2="-2.54" y2="0.762" width="0.254" layer="94"/>
<wire x1="-2.794" y1="-1.778" x2="-1.524" y2="-1.778" width="0.254" layer="94"/>
<wire x1="-1.524" y1="-1.778" x2="2.794" y2="1.778" width="0.254" layer="94"/>
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
<deviceset name="RA4" prefix="RA" uservalue="yes">
<gates>
<gate name="A" symbol="RESISTOR" x="0" y="12.7"/>
<gate name="B" symbol="RESISTOR" x="0" y="5.08"/>
<gate name="C" symbol="RESISTOR" x="0" y="-2.54"/>
<gate name="D" symbol="RESISTOR" x="0" y="-10.16"/>
</gates>
<devices>
<device name="" package="1005-A4">
<connects>
<connect gate="A" pin="1" pad="A1"/>
<connect gate="A" pin="2" pad="A2"/>
<connect gate="B" pin="1" pad="B1"/>
<connect gate="B" pin="2" pad="B2"/>
<connect gate="C" pin="1" pad="C1"/>
<connect gate="C" pin="2" pad="C2"/>
<connect gate="D" pin="1" pad="D1"/>
<connect gate="D" pin="2" pad="D2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VR" prefix="VR" uservalue="yes">
<gates>
<gate name="G$1" symbol="POTENTIOMETER" x="0" y="0"/>
</gates>
<devices>
<device name="" package="VR">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="W" pad="W"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="RF" prefix="RF" uservalue="yes">
<gates>
<gate name="G$1" symbol="RESETTABLE-FUSE" x="0" y="0"/>
</gates>
<devices>
<device name="2012" package="2012">
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
<device name="3216" package="3216">
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
<text x="-1.27" y="1.905" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
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
<library name="ic-ATMEL">
<description>ATMEL</description>
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
<symbol name="AT32UC3B0512">
<wire x1="-35.56" y1="66.04" x2="35.56" y2="66.04" width="0.254" layer="94"/>
<wire x1="35.56" y1="66.04" x2="35.56" y2="-66.04" width="0.254" layer="94"/>
<wire x1="35.56" y1="-66.04" x2="-35.56" y2="-66.04" width="0.254" layer="94"/>
<wire x1="-35.56" y1="-66.04" x2="-35.56" y2="66.04" width="0.254" layer="94"/>
<text x="-35.56" y="66.548" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-35.56" y="-68.58" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="PA03/AD0/GCLK0/USB_ID/ABDAC-DATA0" x="38.1" y="50.8" length="short" swaplevel="1" rot="R180"/>
<pin name="PA04/AD1/GCLK1/USB_VBOF/ABDAC-DATAN0" x="38.1" y="48.26" length="short" swaplevel="1" rot="R180"/>
<pin name="PA05/AD2/INT0/USART1-DCD/ABDAC-DATA1" x="38.1" y="45.72" length="short" swaplevel="1" rot="R180"/>
<pin name="PA06/AD3/INT1/USART1-DSR/ABDAC-DATAN1" x="38.1" y="43.18" length="short" swaplevel="1" rot="R180"/>
<pin name="PA00/TDI" x="38.1" y="58.42" length="short" swaplevel="1" rot="R180"/>
<pin name="PA01/TDO" x="38.1" y="55.88" length="short" swaplevel="1" rot="R180"/>
<pin name="PA02/TMS" x="38.1" y="53.34" length="short" swaplevel="1" rot="R180"/>
<pin name="PA07/AD4/PWM0/USART1-DTR/SSC-RXFRM" x="38.1" y="40.64" length="short" swaplevel="1" rot="R180"/>
<pin name="PA08/AD5/PWM1/USART1-RI/SSC-RXCLK" x="38.1" y="35.56" length="short" swaplevel="1" rot="R180"/>
<pin name="PA09/SCL/SPI0-NPCS2/USART1-CTS" x="38.1" y="33.02" length="short" swaplevel="1" rot="R180"/>
<pin name="PA10/SDA/SPI0-NPCS3/USART1-RTS" x="38.1" y="30.48" length="short" swaplevel="1" rot="R180"/>
<pin name="PA11/XIN32/PWM0/TC-A2/USART0-RTS/SSC-RXDAT" x="38.1" y="27.94" length="short" swaplevel="1" rot="R180"/>
<pin name="PA12/XOUT32/PWM1/TC-B2/USART0-CTS/USART1-TXD" x="38.1" y="25.4" length="short" swaplevel="1" rot="R180"/>
<pin name="PA13/PWM2/NMI/USART0-CLK/SSC-RXCLK" x="38.1" y="22.86" length="short" swaplevel="1" rot="R180"/>
<pin name="PA14/PWM3/INT2/SPI0-MOSI/GCLK2" x="38.1" y="20.32" length="short" swaplevel="1" rot="R180"/>
<pin name="PA15/PWM4/USART2-CLK/SPI0-SCK" x="38.1" y="17.78" length="short" swaplevel="1" rot="R180"/>
<pin name="PA16/PWM4/TC-CLK1/SPI0-NPCS0" x="38.1" y="12.7" length="short" swaplevel="1" rot="R180"/>
<pin name="PA17/TC-CLK2/SPI0-SCK/SPI0-NPCS1/USART1-RXD" x="38.1" y="10.16" length="short" swaplevel="1" rot="R180"/>
<pin name="PA18/XIN0/PWM5/USART0-RXD/SPI0-MISO/SSC-RXFRM" x="38.1" y="7.62" length="short" swaplevel="1" rot="R180"/>
<pin name="PA19/XOUT0/PWM6/USART0-TXD/SPI0-MOSI/SSC-TXCLK" x="38.1" y="5.08" length="short" swaplevel="1" rot="R180"/>
<pin name="PA20/TC-CLK0/USART1-CLK/USART2-RXD/SSC-TXDAT" x="38.1" y="2.54" length="short" swaplevel="1" rot="R180"/>
<pin name="PA21/TC-A1/PWM2/USART2-TXD/SSC-TXFRM" x="38.1" y="0" length="short" swaplevel="1" rot="R180"/>
<pin name="PA22/TC-B1/PWM6/TRIGGER/ABDAC-DATA0" x="38.1" y="-2.54" length="short" swaplevel="1" rot="R180"/>
<pin name="PA23/INT3/USART1-TXD/SPI0-NPCS1/PWM0" x="38.1" y="-5.08" length="short" swaplevel="1" rot="R180"/>
<pin name="PA24/INT4/USART1-RXD/SPI0-NPCS0/PWM1" x="38.1" y="-10.16" length="short" swaplevel="1" rot="R180"/>
<pin name="PA25/INT5/PWM3/SPI0-MISO" x="38.1" y="-12.7" length="short" swaplevel="1" rot="R180"/>
<pin name="PA26/TC-A0/USB_ID/USART2-TXD/ABDAC-DATA1" x="38.1" y="-15.24" length="short" swaplevel="1" rot="R180"/>
<pin name="PA27/TC-B0/USB_VBOF/USART2-RXD/ABDAC-DATAN1" x="38.1" y="-17.78" length="short" swaplevel="1" rot="R180"/>
<pin name="TCK" x="38.1" y="63.5" length="short" rot="R180"/>
<pin name="!RESET" x="-38.1" y="63.5" length="short" function="dot"/>
<pin name="VDDIN" x="-38.1" y="55.88" length="short"/>
<pin name="VDDOUT" x="-38.1" y="53.34" length="short"/>
<pin name="VDDCORE" x="-38.1" y="35.56" length="short"/>
<pin name="VDDPLL" x="-38.1" y="33.02" length="short"/>
<pin name="VDDANA" x="-38.1" y="12.7" length="short"/>
<pin name="VDDIO" x="-38.1" y="15.24" length="short"/>
<pin name="GND" x="-38.1" y="-5.08" length="short"/>
<pin name="GNDANA" x="-38.1" y="-2.54" length="short"/>
<pin name="DP" x="-38.1" y="-30.48" length="short"/>
<pin name="DM" x="-38.1" y="-33.02" length="short"/>
<pin name="ADVREF" x="-38.1" y="-50.8" length="short"/>
<pin name="VBUS" x="-38.1" y="-25.4" length="short"/>
<pin name="PA28/XIN1/USART0-CLK/PWM4/SPI0-MISO/ABDAC-DATAN0" x="38.1" y="-20.32" length="short" swaplevel="1" rot="R180"/>
<pin name="PA29/XOUT1/TC-CLK0/TC-CLK1/SPI0-MOSI" x="38.1" y="-22.86" length="short" swaplevel="1" rot="R180"/>
<pin name="PA30/AD6/GCLK2" x="38.1" y="-25.4" length="short" swaplevel="1" rot="R180"/>
<pin name="PA31/AD7/PWM6" x="38.1" y="-27.94" length="short" swaplevel="1" rot="R180"/>
<pin name="PB00/TC-A0/USART2-CTS" x="38.1" y="-33.02" length="short" swaplevel="1" rot="R180"/>
<pin name="PB01/TC-B0/USART2-RTS" x="38.1" y="-35.56" length="short" swaplevel="1" rot="R180"/>
<pin name="PB02/TC-A1/USART1-TXD" x="38.1" y="-38.1" length="short" swaplevel="1" rot="R180"/>
<pin name="PB03/TC-B1/USART1-RXD" x="38.1" y="-40.64" length="short" swaplevel="1" rot="R180"/>
<pin name="PB04/USART1-CTS/SPI0-NPCS3/TC-CLK2" x="38.1" y="-43.18" length="short" swaplevel="1" rot="R180"/>
<pin name="PB05/USART1-RTS/SPI0-NPCS2/PWM5" x="38.1" y="-45.72" length="short" swaplevel="1" rot="R180"/>
<pin name="PB06/SSC-RXCLK/USART1-DCD/ABDAC-DATA0" x="38.1" y="-48.26" length="short" swaplevel="1" rot="R180"/>
<pin name="PB07/SSC-RXDAT/USART1-DSR/ABDAC-DATAN0" x="38.1" y="-50.8" length="short" swaplevel="1" rot="R180"/>
<pin name="PB08/SSC-RXFRM/USART1-DTR/ABDAC-DATA1" x="38.1" y="-55.88" length="short" swaplevel="1" rot="R180"/>
<pin name="PB09/SSC-TXCLK/USART1-RI/ABDAC-DATAN1" x="38.1" y="-58.42" length="short" swaplevel="1" rot="R180"/>
<pin name="PB10/SSC-TXDAT/TC-A2/USART0-RXD" x="38.1" y="-60.96" length="short" swaplevel="1" rot="R180"/>
<pin name="PB11/SSC-TXFRM/TC-B2/USART0-TXD" x="38.1" y="-63.5" length="short" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="AT32UC3B0512" prefix="U">
<gates>
<gate name="G$1" symbol="AT32UC3B0512" x="0" y="0"/>
</gates>
<devices>
<device name="-AU" package="QFP64-0.5">
<connects>
<connect gate="G$1" pin="!RESET" pad="63"/>
<connect gate="G$1" pin="ADVREF" pad="18"/>
<connect gate="G$1" pin="DM" pad="51"/>
<connect gate="G$1" pin="DP" pad="50"/>
<connect gate="G$1" pin="GND" pad="1 23 49"/>
<connect gate="G$1" pin="GNDANA" pad="17"/>
<connect gate="G$1" pin="PA00/TDI" pad="3"/>
<connect gate="G$1" pin="PA01/TDO" pad="4"/>
<connect gate="G$1" pin="PA02/TMS" pad="5"/>
<connect gate="G$1" pin="PA03/AD0/GCLK0/USB_ID/ABDAC-DATA0" pad="9"/>
<connect gate="G$1" pin="PA04/AD1/GCLK1/USB_VBOF/ABDAC-DATAN0" pad="10"/>
<connect gate="G$1" pin="PA05/AD2/INT0/USART1-DCD/ABDAC-DATA1" pad="11"/>
<connect gate="G$1" pin="PA06/AD3/INT1/USART1-DSR/ABDAC-DATAN1" pad="12"/>
<connect gate="G$1" pin="PA07/AD4/PWM0/USART1-DTR/SSC-RXFRM" pad="13"/>
<connect gate="G$1" pin="PA08/AD5/PWM1/USART1-RI/SSC-RXCLK" pad="14"/>
<connect gate="G$1" pin="PA09/SCL/SPI0-NPCS2/USART1-CTS" pad="28"/>
<connect gate="G$1" pin="PA10/SDA/SPI0-NPCS3/USART1-RTS" pad="29"/>
<connect gate="G$1" pin="PA11/XIN32/PWM0/TC-A2/USART0-RTS/SSC-RXDAT" pad="30"/>
<connect gate="G$1" pin="PA12/XOUT32/PWM1/TC-B2/USART0-CTS/USART1-TXD" pad="31"/>
<connect gate="G$1" pin="PA13/PWM2/NMI/USART0-CLK/SSC-RXCLK" pad="33"/>
<connect gate="G$1" pin="PA14/PWM3/INT2/SPI0-MOSI/GCLK2" pad="34"/>
<connect gate="G$1" pin="PA15/PWM4/USART2-CLK/SPI0-SCK" pad="35"/>
<connect gate="G$1" pin="PA16/PWM4/TC-CLK1/SPI0-NPCS0" pad="36"/>
<connect gate="G$1" pin="PA17/TC-CLK2/SPI0-SCK/SPI0-NPCS1/USART1-RXD" pad="37"/>
<connect gate="G$1" pin="PA18/XIN0/PWM5/USART0-RXD/SPI0-MISO/SSC-RXFRM" pad="39"/>
<connect gate="G$1" pin="PA19/XOUT0/PWM6/USART0-TXD/SPI0-MOSI/SSC-TXCLK" pad="40"/>
<connect gate="G$1" pin="PA20/TC-CLK0/USART1-CLK/USART2-RXD/SSC-TXDAT" pad="44"/>
<connect gate="G$1" pin="PA21/TC-A1/PWM2/USART2-TXD/SSC-TXFRM" pad="45"/>
<connect gate="G$1" pin="PA22/TC-B1/PWM6/TRIGGER/ABDAC-DATA0" pad="46"/>
<connect gate="G$1" pin="PA23/INT3/USART1-TXD/SPI0-NPCS1/PWM0" pad="47"/>
<connect gate="G$1" pin="PA24/INT4/USART1-RXD/SPI0-NPCS0/PWM1" pad="59"/>
<connect gate="G$1" pin="PA25/INT5/PWM3/SPI0-MISO" pad="60"/>
<connect gate="G$1" pin="PA26/TC-A0/USB_ID/USART2-TXD/ABDAC-DATA1" pad="61"/>
<connect gate="G$1" pin="PA27/TC-B0/USB_VBOF/USART2-RXD/ABDAC-DATAN1" pad="62"/>
<connect gate="G$1" pin="PA28/XIN1/USART0-CLK/PWM4/SPI0-MISO/ABDAC-DATAN0" pad="41"/>
<connect gate="G$1" pin="PA29/XOUT1/TC-CLK0/TC-CLK1/SPI0-MOSI" pad="42"/>
<connect gate="G$1" pin="PA30/AD6/GCLK2" pad="15"/>
<connect gate="G$1" pin="PA31/AD7/PWM6" pad="16"/>
<connect gate="G$1" pin="PB00/TC-A0/USART2-CTS" pad="6"/>
<connect gate="G$1" pin="PB01/TC-B0/USART2-RTS" pad="7"/>
<connect gate="G$1" pin="PB02/TC-A1/USART1-TXD" pad="24"/>
<connect gate="G$1" pin="PB03/TC-B1/USART1-RXD" pad="25"/>
<connect gate="G$1" pin="PB04/USART1-CTS/SPI0-NPCS3/TC-CLK2" pad="26"/>
<connect gate="G$1" pin="PB05/USART1-RTS/SPI0-NPCS2/PWM5" pad="27"/>
<connect gate="G$1" pin="PB06/SSC-RXCLK/USART1-DCD/ABDAC-DATA0" pad="38"/>
<connect gate="G$1" pin="PB07/SSC-RXDAT/USART1-DSR/ABDAC-DATAN0" pad="43"/>
<connect gate="G$1" pin="PB08/SSC-RXFRM/USART1-DTR/ABDAC-DATA1" pad="54"/>
<connect gate="G$1" pin="PB09/SSC-TXCLK/USART1-RI/ABDAC-DATAN1" pad="55"/>
<connect gate="G$1" pin="PB10/SSC-TXDAT/TC-A2/USART0-RXD" pad="57"/>
<connect gate="G$1" pin="PB11/SSC-TXFRM/TC-B2/USART0-TXD" pad="58"/>
<connect gate="G$1" pin="TCK" pad="2"/>
<connect gate="G$1" pin="VBUS" pad="52"/>
<connect gate="G$1" pin="VDDANA" pad="19"/>
<connect gate="G$1" pin="VDDCORE" pad="8 22 56"/>
<connect gate="G$1" pin="VDDIN" pad="21"/>
<connect gate="G$1" pin="VDDIO" pad="32 48 64"/>
<connect gate="G$1" pin="VDDOUT" pad="20"/>
<connect gate="G$1" pin="VDDPLL" pad="53"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-Xilinx">
<packages>
<package name="QFP144-0.5">
<wire x1="9.6" y1="10" x2="10" y2="9.6" width="0.127" layer="21"/>
<wire x1="10" y1="9.6" x2="10" y2="-9.6" width="0.127" layer="21"/>
<wire x1="10" y1="-9.6" x2="9.6" y2="-10" width="0.127" layer="21"/>
<wire x1="9.6" y1="-10" x2="-9.6" y2="-10" width="0.127" layer="21"/>
<wire x1="-9.6" y1="-10" x2="-10" y2="-9.6" width="0.127" layer="21"/>
<wire x1="-10" y1="-9.6" x2="-10" y2="9.6" width="0.127" layer="21"/>
<wire x1="-10" y1="9.6" x2="-9.6" y2="10" width="0.127" layer="21"/>
<wire x1="-9.6" y1="10" x2="9.6" y2="10" width="0.127" layer="21"/>
<circle x="-9.25" y="9.25" radius="0.2499" width="0.127" layer="21"/>
<smd name="1" x="-11.2" y="8.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="2" x="-11.2" y="8.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="3" x="-11.2" y="7.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="4" x="-11.2" y="7.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="5" x="-11.2" y="6.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="6" x="-11.2" y="6.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="7" x="-11.2" y="5.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="8" x="-11.2" y="5.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="9" x="-11.2" y="4.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="10" x="-11.2" y="4.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="11" x="-11.2" y="3.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="12" x="-11.2" y="3.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="17" x="-11.2" y="0.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="33" x="-11.2" y="-7.25" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="49" x="-2.75" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="13" x="-11.2" y="2.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="14" x="-11.2" y="2.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="15" x="-11.2" y="1.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="16" x="-11.2" y="1.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="18" x="-11.2" y="0.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="19" x="-11.2" y="-0.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="20" x="-11.2" y="-0.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="21" x="-11.2" y="-1.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="22" x="-11.2" y="-1.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="23" x="-11.2" y="-2.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="24" x="-11.2" y="-2.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="25" x="-11.2" y="-3.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="26" x="-11.2" y="-3.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="27" x="-11.2" y="-4.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="28" x="-11.2" y="-4.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="29" x="-11.2" y="-5.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="30" x="-11.2" y="-5.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="31" x="-11.2" y="-6.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="32" x="-11.2" y="-6.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="34" x="-11.2" y="-7.75" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="35" x="-11.2" y="-8.25" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="36" x="-11.2" y="-8.75" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="37" x="-8.75" y="-11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="38" x="-8.25" y="-11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="39" x="-7.75" y="-11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="40" x="-7.25" y="-11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="41" x="-6.75" y="-11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="42" x="-6.25" y="-11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="43" x="-5.75" y="-11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="44" x="-5.25" y="-11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="45" x="-4.75" y="-11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="46" x="-4.25" y="-11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="47" x="-3.75" y="-11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="48" x="-3.25" y="-11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="50" x="-2.25" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="51" x="-1.75" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="52" x="-1.25" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="53" x="-0.75" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="54" x="-0.25" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="55" x="0.25" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="56" x="0.75" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="57" x="1.25" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="58" x="1.75" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="59" x="2.25" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="60" x="2.75" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="61" x="3.25" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="62" x="3.75" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="63" x="4.25" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="64" x="4.75" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="65" x="5.25" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="66" x="5.75" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="67" x="6.25" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="68" x="6.75" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="69" x="7.25" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="70" x="7.75" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="71" x="8.25" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="72" x="8.75" y="-11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="73" x="11.2" y="-8.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="74" x="11.2" y="-8.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="75" x="11.2" y="-7.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="76" x="11.2" y="-7.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="77" x="11.2" y="-6.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="78" x="11.2" y="-6.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="79" x="11.2" y="-5.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="80" x="11.2" y="-5.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="81" x="11.2" y="-4.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="82" x="11.2" y="-4.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="83" x="11.2" y="-3.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="84" x="11.2" y="-3.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="85" x="11.2" y="-2.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="86" x="11.2" y="-2.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="87" x="11.2" y="-1.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="88" x="11.2" y="-1.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="89" x="11.2" y="-0.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="90" x="11.2" y="-0.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="91" x="11.2" y="0.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="92" x="11.2" y="0.75" dx="1.6" dy="0.25" layer="1" rot="R180"/>
<smd name="93" x="11.2" y="1.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="94" x="11.2" y="1.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="95" x="11.2" y="2.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="96" x="11.2" y="2.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="97" x="11.2" y="3.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="98" x="11.2" y="3.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="99" x="11.2" y="4.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="100" x="11.2" y="4.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="101" x="11.2" y="5.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="102" x="11.2" y="5.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="103" x="11.2" y="6.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="104" x="11.2" y="6.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="105" x="11.2" y="7.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="106" x="11.2" y="7.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="107" x="11.2" y="8.25" dx="1.6" dy="0.25" layer="1"/>
<smd name="108" x="11.2" y="8.75" dx="1.6" dy="0.25" layer="1"/>
<smd name="109" x="8.75" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="110" x="8.25" y="11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="111" x="7.75" y="11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="112" x="7.25" y="11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="113" x="6.75" y="11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="114" x="6.25" y="11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="115" x="5.75" y="11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="116" x="5.25" y="11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="117" x="4.75" y="11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="118" x="4.25" y="11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="119" x="3.75" y="11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="120" x="3.25" y="11.2" dx="0.25" dy="1.6" layer="1" rot="R180"/>
<smd name="121" x="2.75" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="122" x="2.25" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="123" x="1.75" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="124" x="1.25" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="125" x="0.75" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="126" x="0.25" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="127" x="-0.25" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="128" x="-0.75" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="129" x="-1.25" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="130" x="-1.75" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="131" x="-2.25" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="132" x="-2.75" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="133" x="-3.25" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="134" x="-3.75" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="135" x="-4.25" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="136" x="-4.75" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="137" x="-5.25" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="138" x="-5.75" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="139" x="-6.25" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="140" x="-6.75" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="141" x="-7.25" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="142" x="-7.75" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="143" x="-8.25" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<smd name="144" x="-8.75" y="11.2" dx="0.25" dy="1.6" layer="1"/>
<text x="-6.35" y="0" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-6.35" y="-1.27" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-11" y1="8.625" x2="-10" y2="8.875" layer="51"/>
<rectangle x1="-11" y1="8.125" x2="-10" y2="8.375" layer="51"/>
<rectangle x1="-11" y1="7.625" x2="-10" y2="7.875" layer="51"/>
<rectangle x1="-11" y1="7.125" x2="-10" y2="7.375" layer="51"/>
<rectangle x1="-11" y1="6.625" x2="-10" y2="6.875" layer="51"/>
<rectangle x1="-11" y1="6.125" x2="-10" y2="6.375" layer="51"/>
<rectangle x1="-11" y1="5.625" x2="-10" y2="5.875" layer="51"/>
<rectangle x1="-10.625" y1="0.25" x2="-10.375" y2="1.25" layer="51" rot="R270"/>
<rectangle x1="-11" y1="5.125" x2="-10" y2="5.375" layer="51"/>
<rectangle x1="-11" y1="4.625" x2="-10" y2="4.875" layer="51"/>
<rectangle x1="-11" y1="4.125" x2="-10" y2="4.375" layer="51"/>
<rectangle x1="-11" y1="3.625" x2="-10" y2="3.875" layer="51"/>
<rectangle x1="-11" y1="3.125" x2="-10" y2="3.375" layer="51"/>
<rectangle x1="-11" y1="-7.375" x2="-10" y2="-7.125" layer="51"/>
<rectangle x1="-2.875" y1="-11" x2="-2.625" y2="-10" layer="51" rot="R180"/>
<rectangle x1="-11" y1="2.625" x2="-10" y2="2.875" layer="51"/>
<rectangle x1="-11" y1="2.125" x2="-10" y2="2.375" layer="51"/>
<rectangle x1="-11" y1="1.625" x2="-10" y2="1.875" layer="51"/>
<rectangle x1="-11" y1="1.125" x2="-10" y2="1.375" layer="51"/>
<rectangle x1="-10.625" y1="-0.25" x2="-10.375" y2="0.75" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-0.75" x2="-10.375" y2="0.25" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-1.25" x2="-10.375" y2="-0.25" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-1.75" x2="-10.375" y2="-0.75" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-2.25" x2="-10.375" y2="-1.25" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-2.75" x2="-10.375" y2="-1.75" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-3.25" x2="-10.375" y2="-2.25" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-3.75" x2="-10.375" y2="-2.75" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-4.25" x2="-10.375" y2="-3.25" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-4.75" x2="-10.375" y2="-3.75" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-5.25" x2="-10.375" y2="-4.25" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-5.75" x2="-10.375" y2="-4.75" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-6.25" x2="-10.375" y2="-5.25" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-6.75" x2="-10.375" y2="-5.75" layer="51" rot="R270"/>
<rectangle x1="-10.625" y1="-7.25" x2="-10.375" y2="-6.25" layer="51" rot="R270"/>
<rectangle x1="-11" y1="-7.875" x2="-10" y2="-7.625" layer="51"/>
<rectangle x1="-11" y1="-8.375" x2="-10" y2="-8.125" layer="51"/>
<rectangle x1="-11" y1="-8.875" x2="-10" y2="-8.625" layer="51"/>
<rectangle x1="-9.25" y1="-10.625" x2="-8.25" y2="-10.375" layer="51" rot="R90"/>
<rectangle x1="-8.75" y1="-10.625" x2="-7.75" y2="-10.375" layer="51" rot="R90"/>
<rectangle x1="-8.25" y1="-10.625" x2="-7.25" y2="-10.375" layer="51" rot="R90"/>
<rectangle x1="-7.75" y1="-10.625" x2="-6.75" y2="-10.375" layer="51" rot="R90"/>
<rectangle x1="-7.25" y1="-10.625" x2="-6.25" y2="-10.375" layer="51" rot="R90"/>
<rectangle x1="-6.75" y1="-10.625" x2="-5.75" y2="-10.375" layer="51" rot="R90"/>
<rectangle x1="-6.25" y1="-10.625" x2="-5.25" y2="-10.375" layer="51" rot="R90"/>
<rectangle x1="-5.75" y1="-10.625" x2="-4.75" y2="-10.375" layer="51" rot="R90"/>
<rectangle x1="-5.25" y1="-10.625" x2="-4.25" y2="-10.375" layer="51" rot="R90"/>
<rectangle x1="-4.75" y1="-10.625" x2="-3.75" y2="-10.375" layer="51" rot="R90"/>
<rectangle x1="-4.25" y1="-10.625" x2="-3.25" y2="-10.375" layer="51" rot="R90"/>
<rectangle x1="-3.75" y1="-10.625" x2="-2.75" y2="-10.375" layer="51" rot="R90"/>
<rectangle x1="-2.375" y1="-11" x2="-2.125" y2="-10" layer="51" rot="R180"/>
<rectangle x1="-1.875" y1="-11" x2="-1.625" y2="-10" layer="51" rot="R180"/>
<rectangle x1="-1.375" y1="-11" x2="-1.125" y2="-10" layer="51" rot="R180"/>
<rectangle x1="-0.875" y1="-11" x2="-0.625" y2="-10" layer="51" rot="R180"/>
<rectangle x1="-0.375" y1="-11" x2="-0.125" y2="-10" layer="51" rot="R180"/>
<rectangle x1="0.125" y1="-11" x2="0.375" y2="-10" layer="51" rot="R180"/>
<rectangle x1="0.625" y1="-11" x2="0.875" y2="-10" layer="51" rot="R180"/>
<rectangle x1="1.125" y1="-11" x2="1.375" y2="-10" layer="51" rot="R180"/>
<rectangle x1="1.625" y1="-11" x2="1.875" y2="-10" layer="51" rot="R180"/>
<rectangle x1="2.125" y1="-11" x2="2.375" y2="-10" layer="51" rot="R180"/>
<rectangle x1="2.625" y1="-11" x2="2.875" y2="-10" layer="51" rot="R180"/>
<rectangle x1="3.125" y1="-11" x2="3.375" y2="-10" layer="51" rot="R180"/>
<rectangle x1="3.625" y1="-11" x2="3.875" y2="-10" layer="51" rot="R180"/>
<rectangle x1="4.125" y1="-11" x2="4.375" y2="-10" layer="51" rot="R180"/>
<rectangle x1="4.625" y1="-11" x2="4.875" y2="-10" layer="51" rot="R180"/>
<rectangle x1="5.125" y1="-11" x2="5.375" y2="-10" layer="51" rot="R180"/>
<rectangle x1="5.625" y1="-11" x2="5.875" y2="-10" layer="51" rot="R180"/>
<rectangle x1="6.125" y1="-11" x2="6.375" y2="-10" layer="51" rot="R180"/>
<rectangle x1="6.625" y1="-11" x2="6.875" y2="-10" layer="51" rot="R180"/>
<rectangle x1="7.125" y1="-11" x2="7.375" y2="-10" layer="51" rot="R180"/>
<rectangle x1="7.625" y1="-11" x2="7.875" y2="-10" layer="51" rot="R180"/>
<rectangle x1="8.125" y1="-11" x2="8.375" y2="-10" layer="51" rot="R180"/>
<rectangle x1="8.625" y1="-11" x2="8.875" y2="-10" layer="51" rot="R180"/>
<rectangle x1="10" y1="-8.875" x2="11" y2="-8.625" layer="51" rot="R180"/>
<rectangle x1="8.25" y1="10.375" x2="9.25" y2="10.625" layer="51" rot="R270"/>
<rectangle x1="7.75" y1="10.375" x2="8.75" y2="10.625" layer="51" rot="R270"/>
<rectangle x1="7.25" y1="10.375" x2="8.25" y2="10.625" layer="51" rot="R270"/>
<rectangle x1="6.75" y1="10.375" x2="7.75" y2="10.625" layer="51" rot="R270"/>
<rectangle x1="6.25" y1="10.375" x2="7.25" y2="10.625" layer="51" rot="R270"/>
<rectangle x1="5.75" y1="10.375" x2="6.75" y2="10.625" layer="51" rot="R270"/>
<rectangle x1="5.25" y1="10.375" x2="6.25" y2="10.625" layer="51" rot="R270"/>
<rectangle x1="4.75" y1="10.375" x2="5.75" y2="10.625" layer="51" rot="R270"/>
<rectangle x1="4.25" y1="10.375" x2="5.25" y2="10.625" layer="51" rot="R270"/>
<rectangle x1="3.75" y1="10.375" x2="4.75" y2="10.625" layer="51" rot="R270"/>
<rectangle x1="3.25" y1="10.375" x2="4.25" y2="10.625" layer="51" rot="R270"/>
<rectangle x1="2.75" y1="10.375" x2="3.75" y2="10.625" layer="51" rot="R270"/>
<rectangle x1="2.125" y1="10" x2="2.375" y2="11" layer="51"/>
<rectangle x1="1.625" y1="10" x2="1.875" y2="11" layer="51"/>
<rectangle x1="1.125" y1="10" x2="1.375" y2="11" layer="51"/>
<rectangle x1="0.625" y1="10" x2="0.875" y2="11" layer="51"/>
<rectangle x1="0.125" y1="10" x2="0.375" y2="11" layer="51"/>
<rectangle x1="-0.375" y1="10" x2="-0.125" y2="11" layer="51"/>
<rectangle x1="-0.875" y1="10" x2="-0.625" y2="11" layer="51"/>
<rectangle x1="-1.375" y1="10" x2="-1.125" y2="11" layer="51"/>
<rectangle x1="-1.875" y1="10" x2="-1.625" y2="11" layer="51"/>
<rectangle x1="-2.375" y1="10" x2="-2.125" y2="11" layer="51"/>
<rectangle x1="-2.875" y1="10" x2="-2.625" y2="11" layer="51"/>
<rectangle x1="-3.375" y1="10" x2="-3.125" y2="11" layer="51"/>
<rectangle x1="-3.875" y1="10" x2="-3.625" y2="11" layer="51"/>
<rectangle x1="-4.375" y1="10" x2="-4.125" y2="11" layer="51"/>
<rectangle x1="-4.875" y1="10" x2="-4.625" y2="11" layer="51"/>
<rectangle x1="-5.375" y1="10" x2="-5.125" y2="11" layer="51"/>
<rectangle x1="-5.875" y1="10" x2="-5.625" y2="11" layer="51"/>
<rectangle x1="-6.375" y1="10" x2="-6.125" y2="11" layer="51"/>
<rectangle x1="-6.875" y1="10" x2="-6.625" y2="11" layer="51"/>
<rectangle x1="-7.375" y1="10" x2="-7.125" y2="11" layer="51"/>
<rectangle x1="-7.875" y1="10" x2="-7.625" y2="11" layer="51"/>
<rectangle x1="-8.375" y1="10" x2="-8.125" y2="11" layer="51"/>
<rectangle x1="-8.875" y1="10" x2="-8.625" y2="11" layer="51"/>
<rectangle x1="10" y1="-8.375" x2="11" y2="-8.125" layer="51" rot="R180"/>
<rectangle x1="10" y1="-7.875" x2="11" y2="-7.625" layer="51" rot="R180"/>
<rectangle x1="10" y1="-7.375" x2="11" y2="-7.125" layer="51" rot="R180"/>
<rectangle x1="10" y1="-6.875" x2="11" y2="-6.625" layer="51" rot="R180"/>
<rectangle x1="10" y1="-6.375" x2="11" y2="-6.125" layer="51" rot="R180"/>
<rectangle x1="10" y1="-5.875" x2="11" y2="-5.625" layer="51" rot="R180"/>
<rectangle x1="10" y1="-5.375" x2="11" y2="-5.125" layer="51" rot="R180"/>
<rectangle x1="10" y1="-4.875" x2="11" y2="-4.625" layer="51" rot="R180"/>
<rectangle x1="10" y1="-4.375" x2="11" y2="-4.125" layer="51" rot="R180"/>
<rectangle x1="10" y1="-3.875" x2="11" y2="-3.625" layer="51" rot="R180"/>
<rectangle x1="10" y1="-3.375" x2="11" y2="-3.125" layer="51" rot="R180"/>
<rectangle x1="10" y1="-2.875" x2="11" y2="-2.625" layer="51" rot="R180"/>
<rectangle x1="10" y1="-2.375" x2="11" y2="-2.125" layer="51" rot="R180"/>
<rectangle x1="10" y1="-1.875" x2="11" y2="-1.625" layer="51" rot="R180"/>
<rectangle x1="10" y1="-1.375" x2="11" y2="-1.125" layer="51" rot="R180"/>
<rectangle x1="10" y1="-0.875" x2="11" y2="-0.625" layer="51" rot="R180"/>
<rectangle x1="10" y1="-0.375" x2="11" y2="-0.125" layer="51" rot="R180"/>
<rectangle x1="10" y1="0.125" x2="11" y2="0.375" layer="51" rot="R180"/>
<rectangle x1="10" y1="0.625" x2="11" y2="0.875" layer="51" rot="R180"/>
<rectangle x1="10" y1="1.125" x2="11" y2="1.375" layer="51" rot="R180"/>
<rectangle x1="10" y1="1.625" x2="11" y2="1.875" layer="51" rot="R180"/>
<rectangle x1="10" y1="2.125" x2="11" y2="2.375" layer="51" rot="R180"/>
<rectangle x1="10" y1="2.625" x2="11" y2="2.875" layer="51" rot="R180"/>
<rectangle x1="10" y1="3.125" x2="11" y2="3.375" layer="51" rot="R180"/>
<rectangle x1="10" y1="3.625" x2="11" y2="3.875" layer="51" rot="R180"/>
<rectangle x1="10" y1="4.125" x2="11" y2="4.375" layer="51" rot="R180"/>
<rectangle x1="10" y1="4.625" x2="11" y2="4.875" layer="51" rot="R180"/>
<rectangle x1="10" y1="5.125" x2="11" y2="5.375" layer="51" rot="R180"/>
<rectangle x1="10" y1="5.625" x2="11" y2="5.875" layer="51" rot="R180"/>
<rectangle x1="10" y1="6.125" x2="11" y2="6.375" layer="51" rot="R180"/>
<rectangle x1="10" y1="6.625" x2="11" y2="6.875" layer="51" rot="R180"/>
<rectangle x1="10" y1="7.125" x2="11" y2="7.375" layer="51" rot="R180"/>
<rectangle x1="10" y1="7.625" x2="11" y2="7.875" layer="51" rot="R180"/>
<rectangle x1="10" y1="8.125" x2="11" y2="8.375" layer="51" rot="R180"/>
<rectangle x1="10" y1="8.625" x2="11" y2="8.875" layer="51" rot="R180"/>
<rectangle x1="2.25" y1="10.375" x2="3.25" y2="10.625" layer="51" rot="R270"/>
</package>
</packages>
<symbols>
<symbol name="XC6SLX-TQ144_LEFT">
<wire x1="0" y1="35.56" x2="0" y2="-33.02" width="0.254" layer="94"/>
<text x="-2.54" y="-35.56" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="-38.1" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="IO_L51N_3" x="-2.54" y="22.86" length="short"/>
<pin name="IO_L51P_3" x="-2.54" y="20.32" length="short"/>
<pin name="IO_L50N_3" x="-2.54" y="17.78" length="short"/>
<pin name="IO_L50P_3" x="-2.54" y="15.24" length="short"/>
<pin name="IO_L49N_3" x="-2.54" y="12.7" length="short"/>
<pin name="IO_L49P_3" x="-2.54" y="10.16" length="short"/>
<pin name="IO_L44N_GCLK20_3" x="-2.54" y="7.62" length="short"/>
<pin name="IO_L44P_GCLK21_3" x="-2.54" y="5.08" length="short"/>
<pin name="IO_L43N_GCLK22_IRDY2_3" x="-2.54" y="2.54" length="short"/>
<pin name="IO_L43P_GCLK23_3" x="-2.54" y="0" length="short"/>
<pin name="IO_L42N_GCLK24_3" x="-2.54" y="-2.54" length="short"/>
<pin name="IO_L42P_GCLK25_TRDY2_3" x="-2.54" y="-5.08" length="short"/>
<pin name="IO_L41N_GCLK26_3" x="-2.54" y="-7.62" length="short"/>
<pin name="IO_L41P_GCLK27_3" x="-2.54" y="-10.16" length="short"/>
<pin name="IO_L37N_3" x="-2.54" y="-12.7" length="short"/>
<pin name="IO_L37P_3" x="-2.54" y="-15.24" length="short"/>
<pin name="IO_L36N_3" x="-2.54" y="-17.78" length="short"/>
<pin name="IO_L36P_3" x="-2.54" y="-20.32" length="short"/>
<pin name="IO_L2N_3" x="-2.54" y="-22.86" length="short"/>
<pin name="IO_L2P_3" x="-2.54" y="-25.4" length="short"/>
<pin name="IO_L1N_VREF_3" x="-2.54" y="-27.94" length="short"/>
<pin name="IO_L1P_3" x="-2.54" y="-30.48" length="short"/>
<pin name="IO_L52P_3" x="-2.54" y="25.4" length="short"/>
<pin name="IO_L52N_3" x="-2.54" y="27.94" length="short"/>
<pin name="IO_L83P_3" x="-2.54" y="30.48" length="short"/>
<pin name="IO_L83N_VREF_3" x="-2.54" y="33.02" length="short"/>
</symbol>
<symbol name="XC6SLX-TQ144_BOTTOM">
<wire x1="-43.18" y1="0" x2="38.1" y2="0" width="0.254" layer="94"/>
<text x="39.37" y="1.27" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="39.37" y="-1.27" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="IO_L62N_D6_2" x="-25.4" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L62P_D5_2" x="-22.86" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L49N_D4_2" x="-20.32" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L49P_D3_2" x="-17.78" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L48N_RDWR_B_VREF_2" x="-15.24" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L48P_D7_2" x="-12.7" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L31N_GCLK30_D15_2" x="-10.16" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L31P_GCLK31_D14_2" x="-7.62" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L30N_GCLK0_USERCCLK_2" x="-5.08" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L30P_GCLK1_D13_2" x="-2.54" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L14N_D12_2" x="0" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L14P_D11_2" x="2.54" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L13N_D10_2" x="5.08" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L13P_M1_2" x="7.62" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L12N_D2_MISO3_2" x="10.16" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L12P_D1_MISO2_2" x="12.7" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L3N_MOSI_CSI_B_MISO0_2" x="15.24" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L3P_D0_DIN_MISO_MISO1_2" x="17.78" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L2N_CMPMOSI_2" x="20.32" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L2P_CMPCLK_2" x="22.86" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L1N_M0_CMPMISO_2" x="25.4" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L1P_CCLK_2" x="27.94" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L64P_D8_2" x="-27.94" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L64N_D9_2" x="-30.48" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L65P_INIT_B_2" x="-33.02" y="-2.54" length="short" rot="R90"/>
<pin name="IO_L65N_CSO_B_2" x="-35.56" y="-2.54" length="short" rot="R90"/>
<pin name="PROGRAM_B_2" x="-40.64" y="-2.54" length="short" rot="R90"/>
<pin name="DONE_2" x="33.02" y="-2.54" length="short" rot="R90"/>
<pin name="CMPCS_B_2" x="35.56" y="-2.54" length="short" rot="R90"/>
</symbol>
<symbol name="XC6SLX-TQ144_RIGHT">
<wire x1="0" y1="-35.56" x2="0" y2="40.64" width="0.254" layer="94"/>
<text x="-5.08" y="-38.1" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-5.08" y="-40.64" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="IO_L46N_1" x="2.54" y="-17.78" length="short" rot="R180"/>
<pin name="IO_L46P_1" x="2.54" y="-15.24" length="short" rot="R180"/>
<pin name="IO_L45N_1" x="2.54" y="-12.7" length="short" rot="R180"/>
<pin name="IO_L45P_1" x="2.54" y="-10.16" length="short" rot="R180"/>
<pin name="IO_L43N_GCLK4_1" x="2.54" y="-7.62" length="short" rot="R180"/>
<pin name="IO_L43P_GCLK5_1" x="2.54" y="-5.08" length="short" rot="R180"/>
<pin name="IO_L42N_GCLK6_TRDY1_1" x="2.54" y="-2.54" length="short" rot="R180"/>
<pin name="IO_L42P_GCLK7_1" x="2.54" y="0" length="short" rot="R180"/>
<pin name="IO_L41N_GCLK8_1" x="2.54" y="2.54" length="short" rot="R180"/>
<pin name="IO_L41P_GCLK9_IRDY1_1" x="2.54" y="5.08" length="short" rot="R180"/>
<pin name="IO_L40N_GCLK10_1" x="2.54" y="7.62" length="short" rot="R180"/>
<pin name="IO_L40P_GCLK11_1" x="2.54" y="10.16" length="short" rot="R180"/>
<pin name="IO_L34N_1" x="2.54" y="12.7" length="short" rot="R180"/>
<pin name="IO_L34P_1" x="2.54" y="15.24" length="short" rot="R180"/>
<pin name="IO_L33N_1" x="2.54" y="17.78" length="short" rot="R180"/>
<pin name="IO_L33P_1" x="2.54" y="20.32" length="short" rot="R180"/>
<pin name="IO_L32N_1" x="2.54" y="22.86" length="short" rot="R180"/>
<pin name="IO_L32P_1" x="2.54" y="25.4" length="short" rot="R180"/>
<pin name="IO_L1N__VREF_1" x="2.54" y="27.94" length="short" rot="R180"/>
<pin name="IO_L1P_1" x="2.54" y="30.48" length="short" rot="R180"/>
<pin name="IO_L47P_1" x="2.54" y="-20.32" length="short" rot="R180"/>
<pin name="IO_L47N_1" x="2.54" y="-22.86" length="short" rot="R180"/>
<pin name="IO_L74P_AWAKE_1" x="2.54" y="-25.4" length="short" rot="R180"/>
<pin name="IO_L74N_DOUT_BUSY_1" x="2.54" y="-27.94" length="short" rot="R180"/>
<pin name="SUSPEND" x="2.54" y="-33.02" length="short" rot="R180"/>
<pin name="TDO" x="2.54" y="35.56" length="short" rot="R180"/>
<pin name="TMS" x="2.54" y="38.1" length="short" rot="R180"/>
</symbol>
<symbol name="XC6SLX-TQ144_TOP">
<wire x1="35.56" y1="0" x2="-40.64" y2="0" width="0.254" layer="94"/>
<text x="36.83" y="1.27" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="36.83" y="-1.27" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="IO_L64N_SCP4_0" x="15.24" y="2.54" length="short" rot="R270"/>
<pin name="IO_L64P_SCP5_0" x="12.7" y="2.54" length="short" rot="R270"/>
<pin name="IO_L63N_SCP6_0" x="10.16" y="2.54" length="short" rot="R270"/>
<pin name="IO_L63P_SCP7_0" x="7.62" y="2.54" length="short" rot="R270"/>
<pin name="IO_L62N_VREF_0" x="5.08" y="2.54" length="short" rot="R270"/>
<pin name="IO_L62P_0" x="2.54" y="2.54" length="short" rot="R270"/>
<pin name="IO_L37N_GCLK12_0" x="0" y="2.54" length="short" rot="R270"/>
<pin name="IO_L37P_GCLK13_0" x="-2.54" y="2.54" length="short" rot="R270"/>
<pin name="IO_L36N_GCLK14_0" x="-5.08" y="2.54" length="short" rot="R270"/>
<pin name="IO_L36P_GCLK15_0" x="-7.62" y="2.54" length="short" rot="R270"/>
<pin name="IO_L35N_GCLK16_0" x="-10.16" y="2.54" length="short" rot="R270"/>
<pin name="IO_L35P_GCLK17_0" x="-12.7" y="2.54" length="short" rot="R270"/>
<pin name="IO_L34N_GCLK18_0" x="-15.24" y="2.54" length="short" rot="R270"/>
<pin name="IO_L34P_GCLK19_0" x="-17.78" y="2.54" length="short" rot="R270"/>
<pin name="IO_L4N_0" x="-20.32" y="2.54" length="short" rot="R270"/>
<pin name="IO_L4P_0" x="-22.86" y="2.54" length="short" rot="R270"/>
<pin name="IO_L3N_0" x="-25.4" y="2.54" length="short" rot="R270"/>
<pin name="IO_L3P_0" x="-27.94" y="2.54" length="short" rot="R270"/>
<pin name="IO_L2N_0" x="-30.48" y="2.54" length="short" rot="R270"/>
<pin name="IO_L2P_0" x="-33.02" y="2.54" length="short" rot="R270"/>
<pin name="IO_L1N_VREF_0" x="-35.56" y="2.54" length="short" rot="R270"/>
<pin name="IO_L1P_HSWAPEN_0" x="-38.1" y="2.54" length="short" rot="R270"/>
<pin name="IO_L65P_SCP3_0" x="17.78" y="2.54" length="short" rot="R270"/>
<pin name="IO_L65N_SCP2_0" x="20.32" y="2.54" length="short" rot="R270"/>
<pin name="IO_L66P_SCP1_0" x="22.86" y="2.54" length="short" rot="R270"/>
<pin name="IO_L66N_SCP0_0" x="25.4" y="2.54" length="short" rot="R270"/>
<pin name="TCK" x="30.48" y="2.54" length="short" rot="R270"/>
<pin name="TDI" x="33.02" y="2.54" length="short" rot="R270"/>
</symbol>
<symbol name="XC6SLX-TQ144_POWER">
<wire x1="-15.24" y1="-20.32" x2="15.24" y2="-20.32" width="0.254" layer="94"/>
<wire x1="15.24" y1="-20.32" x2="15.24" y2="20.32" width="0.254" layer="94"/>
<wire x1="15.24" y1="20.32" x2="-15.24" y2="20.32" width="0.254" layer="94"/>
<wire x1="-15.24" y1="20.32" x2="-15.24" y2="-20.32" width="0.254" layer="94"/>
<text x="-15.24" y="23.114" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-15.24" y="20.828" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VCCAUX" x="-17.78" y="17.78" length="short"/>
<pin name="VCCINT@19" x="17.78" y="17.78" length="short" rot="R180"/>
<pin name="GND" x="0" y="-22.86" length="short" rot="R90"/>
<pin name="VCCO_0" x="-17.78" y="0" length="short"/>
<pin name="VCCO_1" x="-17.78" y="-17.78" length="short"/>
<pin name="VCCO_2" x="17.78" y="0" length="short" rot="R180"/>
<pin name="VCCO_3" x="17.78" y="-17.78" length="short" rot="R180"/>
<pin name="VCCINT@28" x="17.78" y="15.24" length="short" rot="R180"/>
<pin name="VCCINT@52" x="17.78" y="12.7" length="short" rot="R180"/>
<pin name="VCCINT@89" x="17.78" y="10.16" length="short" rot="R180"/>
<pin name="VCCINT@128" x="17.78" y="7.62" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="XC6SLX9-TQ144" prefix="U">
<gates>
<gate name="L" symbol="XC6SLX-TQ144_LEFT" x="-45.72" y="2.54"/>
<gate name="B" symbol="XC6SLX-TQ144_BOTTOM" x="2.54" y="-38.1"/>
<gate name="R" symbol="XC6SLX-TQ144_RIGHT" x="48.26" y="5.08"/>
<gate name="T" symbol="XC6SLX-TQ144_TOP" x="5.08" y="53.34"/>
<gate name="P" symbol="XC6SLX-TQ144_POWER" x="86.36" y="-63.5"/>
</gates>
<devices>
<device name="" package="QFP144-0.5">
<connects>
<connect gate="B" pin="CMPCS_B_2" pad="72"/>
<connect gate="B" pin="DONE_2" pad="71"/>
<connect gate="B" pin="IO_L12N_D2_MISO3_2" pad="61"/>
<connect gate="B" pin="IO_L12P_D1_MISO2_2" pad="62"/>
<connect gate="B" pin="IO_L13N_D10_2" pad="59"/>
<connect gate="B" pin="IO_L13P_M1_2" pad="60"/>
<connect gate="B" pin="IO_L14N_D12_2" pad="57"/>
<connect gate="B" pin="IO_L14P_D11_2" pad="58"/>
<connect gate="B" pin="IO_L1N_M0_CMPMISO_2" pad="69"/>
<connect gate="B" pin="IO_L1P_CCLK_2" pad="70"/>
<connect gate="B" pin="IO_L2N_CMPMOSI_2" pad="66"/>
<connect gate="B" pin="IO_L2P_CMPCLK_2" pad="67"/>
<connect gate="B" pin="IO_L30N_GCLK0_USERCCLK_2" pad="55"/>
<connect gate="B" pin="IO_L30P_GCLK1_D13_2" pad="56"/>
<connect gate="B" pin="IO_L31N_GCLK30_D15_2" pad="50"/>
<connect gate="B" pin="IO_L31P_GCLK31_D14_2" pad="51"/>
<connect gate="B" pin="IO_L3N_MOSI_CSI_B_MISO0_2" pad="64"/>
<connect gate="B" pin="IO_L3P_D0_DIN_MISO_MISO1_2" pad="65"/>
<connect gate="B" pin="IO_L48N_RDWR_B_VREF_2" pad="47"/>
<connect gate="B" pin="IO_L48P_D7_2" pad="48"/>
<connect gate="B" pin="IO_L49N_D4_2" pad="45"/>
<connect gate="B" pin="IO_L49P_D3_2" pad="46"/>
<connect gate="B" pin="IO_L62N_D6_2" pad="43"/>
<connect gate="B" pin="IO_L62P_D5_2" pad="44"/>
<connect gate="B" pin="IO_L64N_D9_2" pad="40"/>
<connect gate="B" pin="IO_L64P_D8_2" pad="41"/>
<connect gate="B" pin="IO_L65N_CSO_B_2" pad="38"/>
<connect gate="B" pin="IO_L65P_INIT_B_2" pad="39"/>
<connect gate="B" pin="PROGRAM_B_2" pad="37"/>
<connect gate="L" pin="IO_L1N_VREF_3" pad="34"/>
<connect gate="L" pin="IO_L1P_3" pad="35"/>
<connect gate="L" pin="IO_L2N_3" pad="32"/>
<connect gate="L" pin="IO_L2P_3" pad="33"/>
<connect gate="L" pin="IO_L36N_3" pad="29"/>
<connect gate="L" pin="IO_L36P_3" pad="30"/>
<connect gate="L" pin="IO_L37N_3" pad="26"/>
<connect gate="L" pin="IO_L37P_3" pad="27"/>
<connect gate="L" pin="IO_L41N_GCLK26_3" pad="23"/>
<connect gate="L" pin="IO_L41P_GCLK27_3" pad="24"/>
<connect gate="L" pin="IO_L42N_GCLK24_3" pad="21"/>
<connect gate="L" pin="IO_L42P_GCLK25_TRDY2_3" pad="22"/>
<connect gate="L" pin="IO_L43N_GCLK22_IRDY2_3" pad="16"/>
<connect gate="L" pin="IO_L43P_GCLK23_3" pad="17"/>
<connect gate="L" pin="IO_L44N_GCLK20_3" pad="14"/>
<connect gate="L" pin="IO_L44P_GCLK21_3" pad="15"/>
<connect gate="L" pin="IO_L49N_3" pad="11"/>
<connect gate="L" pin="IO_L49P_3" pad="12"/>
<connect gate="L" pin="IO_L50N_3" pad="9"/>
<connect gate="L" pin="IO_L50P_3" pad="10"/>
<connect gate="L" pin="IO_L51N_3" pad="7"/>
<connect gate="L" pin="IO_L51P_3" pad="8"/>
<connect gate="L" pin="IO_L52N_3" pad="5"/>
<connect gate="L" pin="IO_L52P_3" pad="6"/>
<connect gate="L" pin="IO_L83N_VREF_3" pad="1"/>
<connect gate="L" pin="IO_L83P_3" pad="2"/>
<connect gate="P" pin="GND" pad="3 13 25 49 54 68 77 91 96 108 113 130 136"/>
<connect gate="P" pin="VCCAUX" pad="20 36 53 90 129"/>
<connect gate="P" pin="VCCINT@128" pad="128"/>
<connect gate="P" pin="VCCINT@19" pad="19"/>
<connect gate="P" pin="VCCINT@28" pad="28"/>
<connect gate="P" pin="VCCINT@52" pad="52"/>
<connect gate="P" pin="VCCINT@89" pad="89"/>
<connect gate="P" pin="VCCO_0" pad="122 125 135"/>
<connect gate="P" pin="VCCO_1" pad="76 86 103"/>
<connect gate="P" pin="VCCO_2" pad="42 63"/>
<connect gate="P" pin="VCCO_3" pad="4 18 31"/>
<connect gate="R" pin="IO_L1N__VREF_1" pad="104"/>
<connect gate="R" pin="IO_L1P_1" pad="105"/>
<connect gate="R" pin="IO_L32N_1" pad="101"/>
<connect gate="R" pin="IO_L32P_1" pad="102"/>
<connect gate="R" pin="IO_L33N_1" pad="99"/>
<connect gate="R" pin="IO_L33P_1" pad="100"/>
<connect gate="R" pin="IO_L34N_1" pad="97"/>
<connect gate="R" pin="IO_L34P_1" pad="98"/>
<connect gate="R" pin="IO_L40N_GCLK10_1" pad="94"/>
<connect gate="R" pin="IO_L40P_GCLK11_1" pad="95"/>
<connect gate="R" pin="IO_L41N_GCLK8_1" pad="92"/>
<connect gate="R" pin="IO_L41P_GCLK9_IRDY1_1" pad="93"/>
<connect gate="R" pin="IO_L42N_GCLK6_TRDY1_1" pad="87"/>
<connect gate="R" pin="IO_L42P_GCLK7_1" pad="88"/>
<connect gate="R" pin="IO_L43N_GCLK4_1" pad="84"/>
<connect gate="R" pin="IO_L43P_GCLK5_1" pad="85"/>
<connect gate="R" pin="IO_L45N_1" pad="82"/>
<connect gate="R" pin="IO_L45P_1" pad="83"/>
<connect gate="R" pin="IO_L46N_1" pad="80"/>
<connect gate="R" pin="IO_L46P_1" pad="81"/>
<connect gate="R" pin="IO_L47N_1" pad="78"/>
<connect gate="R" pin="IO_L47P_1" pad="79"/>
<connect gate="R" pin="IO_L74N_DOUT_BUSY_1" pad="74"/>
<connect gate="R" pin="IO_L74P_AWAKE_1" pad="75"/>
<connect gate="R" pin="SUSPEND" pad="73"/>
<connect gate="R" pin="TDO" pad="106"/>
<connect gate="R" pin="TMS" pad="107"/>
<connect gate="T" pin="IO_L1N_VREF_0" pad="143"/>
<connect gate="T" pin="IO_L1P_HSWAPEN_0" pad="144"/>
<connect gate="T" pin="IO_L2N_0" pad="141"/>
<connect gate="T" pin="IO_L2P_0" pad="142"/>
<connect gate="T" pin="IO_L34N_GCLK18_0" pad="133"/>
<connect gate="T" pin="IO_L34P_GCLK19_0" pad="134"/>
<connect gate="T" pin="IO_L35N_GCLK16_0" pad="131"/>
<connect gate="T" pin="IO_L35P_GCLK17_0" pad="132"/>
<connect gate="T" pin="IO_L36N_GCLK14_0" pad="126"/>
<connect gate="T" pin="IO_L36P_GCLK15_0" pad="127"/>
<connect gate="T" pin="IO_L37N_GCLK12_0" pad="123"/>
<connect gate="T" pin="IO_L37P_GCLK13_0" pad="124"/>
<connect gate="T" pin="IO_L3N_0" pad="139"/>
<connect gate="T" pin="IO_L3P_0" pad="140"/>
<connect gate="T" pin="IO_L4N_0" pad="137"/>
<connect gate="T" pin="IO_L4P_0" pad="138"/>
<connect gate="T" pin="IO_L62N_VREF_0" pad="120"/>
<connect gate="T" pin="IO_L62P_0" pad="121"/>
<connect gate="T" pin="IO_L63N_SCP6_0" pad="118"/>
<connect gate="T" pin="IO_L63P_SCP7_0" pad="119"/>
<connect gate="T" pin="IO_L64N_SCP4_0" pad="116"/>
<connect gate="T" pin="IO_L64P_SCP5_0" pad="117"/>
<connect gate="T" pin="IO_L65N_SCP2_0" pad="114"/>
<connect gate="T" pin="IO_L65P_SCP3_0" pad="115"/>
<connect gate="T" pin="IO_L66N_SCP0_0" pad="111"/>
<connect gate="T" pin="IO_L66P_SCP1_0" pad="112"/>
<connect gate="T" pin="TCK" pad="109"/>
<connect gate="T" pin="TDI" pad="110"/>
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
<package name="PIN2X5">
<wire x1="-6.35" y1="1.905" x2="-6.35" y2="0.635" width="0.127" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-4.445" y2="2.54" width="0.127" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="-3.81" y2="1.905" width="0.127" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-4.445" y2="0" width="0.127" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-6.35" y2="1.905" width="0.127" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-5.715" y2="0" width="0.127" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.81" y2="0.635" width="0.127" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-1.905" y2="2.54" width="0.127" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-1.27" y2="1.905" width="0.127" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.905" y2="0" width="0.127" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-3.81" y2="1.905" width="0.127" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.175" y2="0" width="0.127" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="0.635" width="0.127" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0.635" y2="2.54" width="0.127" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="-1.27" y2="1.905" width="0.127" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="0" width="0.127" layer="21"/>
<wire x1="-6.35" y1="0" x2="-6.35" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-5.715" y1="0" x2="-4.445" y2="0" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.81" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-3.175" y1="0" x2="-1.905" y2="0" width="0.127" layer="21"/>
<wire x1="-1.905" y1="0" x2="-1.27" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.905" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-3.175" y1="0" x2="-3.81" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.175" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.27" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-0.635" y1="0" x2="0.635" y2="0" width="0.127" layer="21"/>
<wire x1="-0.635" y1="0" x2="-1.27" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-0.635" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-6.35" y1="-2.54" x2="-3.81" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-3.175" y1="-2.54" x2="-1.905" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="0.635" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-2.54" x2="-3.81" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.81" y2="0" width="0.127" layer="21"/>
<wire x1="-3.81" y1="0" x2="-4.445" y2="0" width="0.127" layer="21"/>
<wire x1="-6.35" y1="0" x2="-5.715" y2="0" width="0.127" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.27" y2="1.905" width="0.127" layer="21"/>
<wire x1="1.27" y1="0.635" x2="0.635" y2="0" width="0.127" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.27" y2="0.635" width="0.127" layer="21"/>
<wire x1="1.905" y1="2.54" x2="3.175" y2="2.54" width="0.127" layer="21"/>
<wire x1="1.905" y1="2.54" x2="1.27" y2="1.905" width="0.127" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="0" width="0.127" layer="21"/>
<wire x1="0.635" y1="0" x2="1.27" y2="-0.635" width="0.127" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="0.635" y2="-2.54" width="0.127" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="1.27" y2="-1.905" width="0.127" layer="21"/>
<wire x1="1.905" y1="0" x2="3.175" y2="0" width="0.127" layer="21"/>
<wire x1="1.905" y1="0" x2="1.27" y2="-0.635" width="0.127" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.905" y2="-2.54" width="0.127" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="3.175" y2="-2.54" width="0.127" layer="21"/>
<wire x1="3.175" y1="2.54" x2="3.81" y2="1.905" width="0.127" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.175" y2="0" width="0.127" layer="21"/>
<wire x1="3.81" y1="1.905" x2="3.81" y2="0.635" width="0.127" layer="21"/>
<wire x1="4.445" y1="2.54" x2="5.715" y2="2.54" width="0.127" layer="21"/>
<wire x1="5.715" y1="2.54" x2="6.35" y2="1.905" width="0.127" layer="21"/>
<wire x1="6.35" y1="0.635" x2="5.715" y2="0" width="0.127" layer="21"/>
<wire x1="4.445" y1="2.54" x2="3.81" y2="1.905" width="0.127" layer="21"/>
<wire x1="3.81" y1="0.635" x2="4.445" y2="0" width="0.127" layer="21"/>
<wire x1="3.175" y1="0" x2="3.81" y2="-0.635" width="0.127" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.175" y2="-2.54" width="0.127" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.81" y2="-1.905" width="0.127" layer="21"/>
<wire x1="4.445" y1="0" x2="5.715" y2="0" width="0.127" layer="21"/>
<wire x1="5.715" y1="0" x2="6.35" y2="-0.635" width="0.127" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="5.715" y2="-2.54" width="0.127" layer="21"/>
<wire x1="4.445" y1="0" x2="3.81" y2="-0.635" width="0.127" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="4.445" y2="-2.54" width="0.127" layer="21"/>
<wire x1="4.445" y1="-2.54" x2="5.715" y2="-2.54" width="0.127" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="6.35" y2="-1.905" width="0.127" layer="21"/>
<wire x1="6.35" y1="1.905" x2="6.35" y2="0.635" width="0.127" layer="21"/>
<pad name="1" x="-5.08" y="-1.27" drill="1.3" shape="square"/>
<pad name="2" x="-5.08" y="1.27" drill="1.3" shape="octagon"/>
<pad name="3" x="-2.54" y="-1.27" drill="1.3" shape="octagon"/>
<pad name="4" x="-2.54" y="1.27" drill="1.3" shape="octagon"/>
<pad name="5" x="0" y="-1.27" drill="1.3" shape="octagon"/>
<pad name="6" x="0" y="1.27" drill="1.3" shape="octagon"/>
<pad name="7" x="2.54" y="-1.27" drill="1.3" shape="octagon"/>
<pad name="8" x="2.54" y="1.27" drill="1.3" shape="octagon"/>
<pad name="9" x="5.08" y="-1.27" drill="1.3" shape="octagon"/>
<pad name="10" x="5.08" y="1.27" drill="1.3" shape="octagon"/>
<text x="-6.35" y="2.794" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-6.35" y="-3.556" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
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
<package name="T-CON">
<text x="-6.35" y="5.08" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-6.35" y="3.81" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<wire x1="0.1" y1="3.75" x2="6.5" y2="3.75" width="0.127" layer="21"/>
<wire x1="6.5" y1="-3.75" x2="0.1" y2="-3.75" width="0.127" layer="21"/>
<wire x1="-6.5" y1="-3.25" x2="-6.5" y2="3.25" width="0.127" layer="21"/>
<wire x1="6.5" y1="-3.75" x2="6.5" y2="3.75" width="0.127" layer="21"/>
<wire x1="-6.5" y1="3.25" x2="-0.1" y2="3.25" width="0.127" layer="21"/>
<wire x1="-0.1" y1="3.25" x2="0.1" y2="3.75" width="0.127" layer="21"/>
<wire x1="-6.5" y1="-3.25" x2="-0.1" y2="-3.25" width="0.127" layer="21"/>
<wire x1="-0.1" y1="-3.25" x2="0.1" y2="-3.75" width="0.127" layer="21"/>
<pad name="P" x="3" y="0" drill="4.2" diameter="5.3"/>
<pad name="N" x="-3" y="-0.25" drill="4.2" diameter="5.3"/>
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
<package name="PIN2X5-BOX">
<pad name="1" x="-5.08" y="-1.27" drill="1.3" diameter="1.9" shape="square"/>
<pad name="2" x="-5.08" y="1.27" drill="1.3" diameter="1.9" shape="octagon"/>
<pad name="3" x="-2.54" y="-1.27" drill="1.3" diameter="1.9" shape="octagon"/>
<pad name="4" x="-2.54" y="1.27" drill="1.3" diameter="1.9" shape="octagon"/>
<pad name="5" x="0" y="-1.27" drill="1.3" diameter="1.9" shape="octagon"/>
<pad name="6" x="0" y="1.27" drill="1.3" diameter="1.9" shape="octagon"/>
<pad name="7" x="2.54" y="-1.27" drill="1.3" diameter="1.9" shape="octagon"/>
<pad name="8" x="2.54" y="1.27" drill="1.3" diameter="1.9" shape="octagon"/>
<pad name="9" x="5.08" y="-1.27" drill="1.3" diameter="1.9" shape="octagon"/>
<pad name="10" x="5.08" y="1.27" drill="1.3" diameter="1.9" shape="octagon"/>
<text x="-10.16" y="6.35" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-10.16" y="5.08" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<wire x1="-10.16" y1="4.572" x2="-10.16" y2="-4.572" width="0.127" layer="21"/>
<wire x1="-10.16" y1="-4.572" x2="-2.032" y2="-4.572" width="0.127" layer="21"/>
<wire x1="-2.032" y1="-4.572" x2="2.032" y2="-4.572" width="0.127" layer="21"/>
<wire x1="2.032" y1="-4.572" x2="10.16" y2="-4.572" width="0.127" layer="21"/>
<wire x1="10.16" y1="-4.572" x2="10.16" y2="4.572" width="0.127" layer="21"/>
<wire x1="10.16" y1="4.572" x2="-10.16" y2="4.572" width="0.127" layer="21"/>
<wire x1="-2.032" y1="-4.572" x2="-2.032" y2="-3.048" width="0.127" layer="21"/>
<wire x1="-2.032" y1="-3.048" x2="2.032" y2="-3.048" width="0.127" layer="21"/>
<wire x1="2.032" y1="-3.048" x2="2.032" y2="-4.572" width="0.127" layer="21"/>
<wire x1="-10.16" y1="1.524" x2="-8.89" y2="1.524" width="0.127" layer="51"/>
<wire x1="-8.89" y1="1.524" x2="-8.89" y2="-1.524" width="0.127" layer="51"/>
<wire x1="-8.89" y1="-1.524" x2="-10.16" y2="-1.524" width="0.127" layer="51"/>
<wire x1="10.16" y1="-1.524" x2="8.89" y2="-1.524" width="0.127" layer="51"/>
<wire x1="8.89" y1="-1.524" x2="8.89" y2="1.524" width="0.127" layer="51"/>
<wire x1="8.89" y1="1.524" x2="10.16" y2="1.524" width="0.127" layer="51"/>
</package>
<package name="PIN2X5-2.0">
<pad name="1" x="-4" y="-1" drill="0.9" diameter="1.3" shape="square"/>
<pad name="2" x="-4" y="1" drill="0.9" diameter="1.3" shape="octagon"/>
<pad name="4" x="-2" y="1" drill="0.9" diameter="1.3" shape="octagon"/>
<pad name="6" x="0" y="1" drill="0.9" diameter="1.3" shape="octagon"/>
<pad name="8" x="2" y="1" drill="0.9" diameter="1.3" shape="octagon"/>
<pad name="10" x="4" y="1" drill="0.9" diameter="1.3" shape="octagon"/>
<text x="-5.08" y="3.81" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-5.08" y="2.54" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<pad name="3" x="-2" y="-1" drill="0.9" diameter="1.3" shape="octagon"/>
<pad name="5" x="0" y="-1" drill="0.9" diameter="1.3" shape="octagon"/>
<pad name="7" x="2" y="-1" drill="0.9" diameter="1.3" shape="octagon"/>
<pad name="9" x="4" y="-1" drill="0.9" diameter="1.3" shape="octagon"/>
<wire x1="-5" y1="1.5" x2="-5" y2="0.5" width="0.127" layer="21"/>
<wire x1="-5" y1="0" x2="-5" y2="-2" width="0.127" layer="21"/>
<wire x1="-5" y1="-2" x2="-3" y2="-2" width="0.127" layer="21"/>
<wire x1="-3.5" y1="2" x2="-4.5" y2="2" width="0.127" layer="21"/>
<wire x1="-5" y1="0" x2="-4.5" y2="0" width="0.127" layer="21"/>
<wire x1="-4.5" y1="0" x2="-3.5" y2="0" width="0.127" layer="21"/>
<wire x1="-3.5" y1="0" x2="-3" y2="0" width="0.127" layer="21"/>
<wire x1="-3" y1="0" x2="-3" y2="-2" width="0.127" layer="21"/>
<wire x1="-3.5" y1="2" x2="-3" y2="1.5" width="0.127" layer="21"/>
<wire x1="-3" y1="1.5" x2="-3" y2="0.5" width="0.127" layer="21"/>
<wire x1="-3" y1="0.5" x2="-2.5" y2="0" width="0.127" layer="21"/>
<wire x1="-3" y1="0.5" x2="-3.5" y2="0" width="0.127" layer="21"/>
<wire x1="-5" y1="1.5" x2="-4.5" y2="2" width="0.127" layer="21"/>
<wire x1="-5" y1="0.5" x2="-4.5" y2="0" width="0.127" layer="21"/>
<wire x1="-1.5" y1="2" x2="-2.5" y2="2" width="0.127" layer="21"/>
<wire x1="-1.5" y1="2" x2="-1" y2="1.5" width="0.127" layer="21"/>
<wire x1="-1" y1="1.5" x2="-0.5" y2="2" width="0.127" layer="21"/>
<wire x1="-3" y1="1.5" x2="-2.5" y2="2" width="0.127" layer="21"/>
<wire x1="0.5" y1="2" x2="-0.5" y2="2" width="0.127" layer="21"/>
<wire x1="0.5" y1="2" x2="1" y2="1.5" width="0.127" layer="21"/>
<wire x1="1" y1="1.5" x2="1.5" y2="2" width="0.127" layer="21"/>
<wire x1="2.5" y1="2" x2="1.5" y2="2" width="0.127" layer="21"/>
<wire x1="2.5" y1="2" x2="3" y2="1.5" width="0.127" layer="21"/>
<wire x1="3" y1="1.5" x2="3.5" y2="2" width="0.127" layer="21"/>
<wire x1="4.5" y1="2" x2="3.5" y2="2" width="0.127" layer="21"/>
<wire x1="4.5" y1="2" x2="5" y2="1.5" width="0.127" layer="21"/>
<wire x1="4.5" y1="0" x2="3.5" y2="0" width="0.127" layer="21"/>
<wire x1="4.5" y1="0" x2="5" y2="-0.5" width="0.127" layer="21"/>
<wire x1="2.5" y1="0" x2="1.5" y2="0" width="0.127" layer="21"/>
<wire x1="0.5" y1="0" x2="-0.5" y2="0" width="0.127" layer="21"/>
<wire x1="-1.5" y1="0" x2="-2.5" y2="0" width="0.127" layer="21"/>
<wire x1="5" y1="0.5" x2="4.5" y2="0" width="0.127" layer="21"/>
<wire x1="3" y1="0.5" x2="2.5" y2="0" width="0.127" layer="21"/>
<wire x1="1" y1="0.5" x2="0.5" y2="0" width="0.127" layer="21"/>
<wire x1="-1" y1="0.5" x2="-1.5" y2="0" width="0.127" layer="21"/>
<wire x1="-1" y1="0.5" x2="-0.5" y2="0" width="0.127" layer="21"/>
<wire x1="1" y1="0.5" x2="1.5" y2="0" width="0.127" layer="21"/>
<wire x1="3" y1="0.5" x2="3.5" y2="0" width="0.127" layer="21"/>
<wire x1="-1" y1="1.5" x2="-1" y2="0.5" width="0.127" layer="21"/>
<wire x1="1" y1="1.5" x2="1" y2="0.5" width="0.127" layer="21"/>
<wire x1="3" y1="1.5" x2="3" y2="0.5" width="0.127" layer="21"/>
<wire x1="5" y1="1.5" x2="5" y2="0.5" width="0.127" layer="21"/>
<wire x1="3.5" y1="-2" x2="4.5" y2="-2" width="0.127" layer="21"/>
<wire x1="3.5" y1="-2" x2="3" y2="-1.5" width="0.127" layer="21"/>
<wire x1="3" y1="-1.5" x2="2.5" y2="-2" width="0.127" layer="21"/>
<wire x1="5" y1="-1.5" x2="4.5" y2="-2" width="0.127" layer="21"/>
<wire x1="1.5" y1="-2" x2="2.5" y2="-2" width="0.127" layer="21"/>
<wire x1="1.5" y1="-2" x2="1" y2="-1.5" width="0.127" layer="21"/>
<wire x1="1" y1="-1.5" x2="0.5" y2="-2" width="0.127" layer="21"/>
<wire x1="-0.5" y1="-2" x2="0.5" y2="-2" width="0.127" layer="21"/>
<wire x1="-0.5" y1="-2" x2="-1" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-1" y1="-1.5" x2="-1.5" y2="-2" width="0.127" layer="21"/>
<wire x1="-2.5" y1="-2" x2="-1.5" y2="-2" width="0.127" layer="21"/>
<wire x1="-2.5" y1="-2" x2="-3" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-3" y1="-0.5" x2="-2.5" y2="0" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.5" x2="-0.5" y2="0" width="0.127" layer="21"/>
<wire x1="1" y1="-0.5" x2="1.5" y2="0" width="0.127" layer="21"/>
<wire x1="3" y1="-0.5" x2="3.5" y2="0" width="0.127" layer="21"/>
<wire x1="3" y1="-0.5" x2="2.5" y2="0" width="0.127" layer="21"/>
<wire x1="1" y1="-0.5" x2="0.5" y2="0" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.5" x2="-1.5" y2="0" width="0.127" layer="21"/>
<wire x1="3" y1="-1.5" x2="3" y2="-0.5" width="0.127" layer="21"/>
<wire x1="1" y1="-1.5" x2="1" y2="-0.5" width="0.127" layer="21"/>
<wire x1="-1" y1="-1.5" x2="-1" y2="-0.5" width="0.127" layer="21"/>
<wire x1="-3" y1="-1.5" x2="-3" y2="-0.5" width="0.127" layer="21"/>
<wire x1="5" y1="-0.5" x2="5" y2="-1.5" width="0.127" layer="21"/>
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
<symbol name="CN-JTAG_ALTERA">
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="7.62" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<text x="-7.62" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-7.62" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="TCK" x="-10.16" y="5.08" length="short" direction="pas"/>
<pin name="GND@0" x="10.16" y="0" length="short" direction="pas" rot="R180"/>
<pin name="TDO" x="-10.16" y="-2.54" length="short" direction="pas"/>
<pin name="VCC" x="10.16" y="5.08" length="short" direction="pas" rot="R180"/>
<pin name="TMS" x="-10.16" y="2.54" length="short" direction="pas"/>
<pin name="TDI" x="-10.16" y="0" length="short" direction="pas"/>
<pin name="GND@1" x="10.16" y="-2.54" length="short" direction="pas" rot="R180"/>
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
<symbol name="T-CON">
<text x="-5.08" y="6.35" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-5.08" y="-8.89" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<rectangle x1="-5.08" y1="-4.064" x2="0" y2="-1.016" layer="94"/>
<pin name="P" x="5.08" y="2.54" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="N" x="5.08" y="-2.54" visible="pad" length="short" direction="pas" rot="R180"/>
<rectangle x1="-5.08" y1="2.032" x2="0" y2="3.048" layer="94"/>
<wire x1="0" y1="5.08" x2="0" y2="-5.08" width="0.254" layer="94"/>
<wire x1="0" y1="-5.08" x2="2.54" y2="-5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="2.54" y2="5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="5.08" x2="0" y2="5.08" width="0.254" layer="94"/>
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
<symbol name="PIN2X5">
<wire x1="-6.35" y1="-7.62" x2="3.81" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-7.62" x2="3.81" y2="7.62" width="0.4064" layer="94"/>
<wire x1="3.81" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-7.62" y="5.08" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="5.08" y="5.08" visible="pad" length="middle" direction="pas" function="dot" rot="R180"/>
<pin name="3" x="-7.62" y="2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="4" x="5.08" y="2.54" visible="pad" length="middle" direction="pas" function="dot" rot="R180"/>
<pin name="5" x="-7.62" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="6" x="5.08" y="0" visible="pad" length="middle" direction="pas" function="dot" rot="R180"/>
<pin name="7" x="-7.62" y="-2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="8" x="5.08" y="-2.54" visible="pad" length="middle" direction="pas" function="dot" rot="R180"/>
<pin name="9" x="-7.62" y="-5.08" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="10" x="5.08" y="-5.08" visible="pad" length="middle" direction="pas" function="dot" rot="R180"/>
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
<deviceset name="CN-JTAG_ALTERA" prefix="J">
<gates>
<gate name="G$1" symbol="CN-JTAG_ALTERA" x="0" y="0"/>
</gates>
<devices>
<device name="" package="PIN2X5">
<connects>
<connect gate="G$1" pin="GND@0" pad="2"/>
<connect gate="G$1" pin="GND@1" pad="10"/>
<connect gate="G$1" pin="TCK" pad="1"/>
<connect gate="G$1" pin="TDI" pad="9"/>
<connect gate="G$1" pin="TDO" pad="3"/>
<connect gate="G$1" pin="TMS" pad="5"/>
<connect gate="G$1" pin="VCC" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-BOX" package="PIN2X5-BOX">
<connects>
<connect gate="G$1" pin="GND@0" pad="2"/>
<connect gate="G$1" pin="GND@1" pad="10"/>
<connect gate="G$1" pin="TCK" pad="1"/>
<connect gate="G$1" pin="TDI" pad="9"/>
<connect gate="G$1" pin="TDO" pad="3"/>
<connect gate="G$1" pin="TMS" pad="5"/>
<connect gate="G$1" pin="VCC" pad="4"/>
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
<deviceset name="T-CON" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="T-CON" x="0" y="0"/>
</gates>
<devices>
<device name="" package="T-CON">
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
<deviceset name="PIN2X5-2.0" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="PIN2X5" x="0" y="0"/>
</gates>
<devices>
<device name="" package="PIN2X5-2.0">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
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
<library name="ic-TI">
<description>Texas Instruments</description>
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
<package name="HSSOP36">
<wire x1="7.95" y1="5.5" x2="7.95" y2="-5.5" width="0.127" layer="21"/>
<wire x1="7.95" y1="-5.5" x2="-7.95" y2="-5.5" width="0.127" layer="21"/>
<wire x1="-7.95" y1="-5.5" x2="-7.95" y2="5.5" width="0.127" layer="21"/>
<circle x="-7.35" y="-4.9" radius="0.25" width="0.127" layer="21"/>
<text x="-6.35" y="3.81" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-6.35" y="2.54" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.475" y1="-7.1" x2="-0.175" y2="-5.5" layer="51"/>
<rectangle x1="-1.125" y1="-7.1" x2="-0.825" y2="-5.5" layer="51"/>
<rectangle x1="-1.775" y1="-7.1" x2="-1.475" y2="-5.5" layer="51"/>
<rectangle x1="-2.425" y1="-7.1" x2="-2.125" y2="-5.5" layer="51"/>
<rectangle x1="-3.075" y1="-7.1" x2="-2.775" y2="-5.5" layer="51"/>
<rectangle x1="-3.725" y1="-7.1" x2="-3.425" y2="-5.5" layer="51"/>
<rectangle x1="-4.375" y1="-7.1" x2="-4.075" y2="-5.5" layer="51"/>
<rectangle x1="-5.025" y1="-7.1" x2="-4.725" y2="-5.5" layer="51"/>
<smd name="2" x="-4.875" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="3" x="-4.225" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="4" x="-3.575" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="5" x="-2.925" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="6" x="-2.275" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="7" x="-1.625" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="8" x="-0.975" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="9" x="-0.325" y="-6.8" dx="0.381" dy="2" layer="1"/>
<rectangle x1="5.375" y1="-7.1" x2="5.675" y2="-5.5" layer="51"/>
<rectangle x1="4.725" y1="-7.1" x2="5.025" y2="-5.5" layer="51"/>
<rectangle x1="4.075" y1="-7.1" x2="4.375" y2="-5.5" layer="51"/>
<rectangle x1="3.425" y1="-7.1" x2="3.725" y2="-5.5" layer="51"/>
<rectangle x1="2.775" y1="-7.1" x2="3.075" y2="-5.5" layer="51"/>
<rectangle x1="2.125" y1="-7.1" x2="2.425" y2="-5.5" layer="51"/>
<rectangle x1="1.475" y1="-7.1" x2="1.775" y2="-5.5" layer="51"/>
<rectangle x1="0.825" y1="-7.1" x2="1.125" y2="-5.5" layer="51"/>
<smd name="11" x="0.975" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="12" x="1.625" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="13" x="2.275" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="14" x="2.925" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="15" x="3.575" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="16" x="4.225" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="17" x="4.875" y="-6.8" dx="0.381" dy="2" layer="1"/>
<smd name="18" x="5.525" y="-6.8" dx="0.381" dy="2" layer="1"/>
<rectangle x1="0.175" y1="-7.1" x2="0.475" y2="-5.5" layer="51"/>
<smd name="10" x="0.325" y="-6.8" dx="0.381" dy="2" layer="1"/>
<rectangle x1="-5.675" y1="-7.1" x2="-5.375" y2="-5.5" layer="51"/>
<smd name="1" x="-5.525" y="-6.8" dx="0.381" dy="2" layer="1"/>
<rectangle x1="0.825" y1="5.5" x2="1.125" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="1.475" y1="5.5" x2="1.775" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="2.125" y1="5.5" x2="2.425" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="2.775" y1="5.5" x2="3.075" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="3.425" y1="5.5" x2="3.725" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="4.075" y1="5.5" x2="4.375" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="4.725" y1="5.5" x2="5.025" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="5.375" y1="5.5" x2="5.675" y2="7.1" layer="51" rot="R180"/>
<smd name="19" x="5.525" y="6.8" dx="0.381" dy="2" layer="1" rot="R180"/>
<smd name="20" x="4.875" y="6.8" dx="0.381" dy="2" layer="1" rot="R180"/>
<smd name="21" x="4.225" y="6.65" dx="0.44" dy="2.3" layer="1" rot="R180"/>
<smd name="22" x="3.575" y="7.1" dx="0.44" dy="2.6" layer="1" rot="R180"/>
<smd name="23" x="2.925" y="6.65" dx="0.44" dy="2.3" layer="1" rot="R180"/>
<smd name="24" x="2.275" y="6.8" dx="0.381" dy="2" layer="1" rot="R180"/>
<smd name="25" x="1.625" y="6.8" dx="0.381" dy="2" layer="1" rot="R180"/>
<smd name="26" x="0.975" y="6.8" dx="0.381" dy="2" layer="1" rot="R180"/>
<rectangle x1="-4.375" y1="5.5" x2="-4.075" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="-3.725" y1="5.5" x2="-3.425" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="-3.075" y1="5.5" x2="-2.775" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="-2.425" y1="5.5" x2="-2.125" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="-1.775" y1="5.5" x2="-1.475" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="-1.125" y1="5.5" x2="-0.825" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="-0.475" y1="5.5" x2="-0.175" y2="7.1" layer="51" rot="R180"/>
<rectangle x1="0.175" y1="5.5" x2="0.475" y2="7.1" layer="51" rot="R180"/>
<smd name="27" x="0.325" y="6.8" dx="0.381" dy="2" layer="1" rot="R180"/>
<smd name="28" x="-0.325" y="6.8" dx="0.381" dy="2" layer="1" rot="R180"/>
<smd name="29" x="-0.975" y="6.65" dx="0.44" dy="2.3" layer="1" rot="R180"/>
<smd name="30" x="-1.625" y="7.1" dx="0.44" dy="2.6" layer="1" rot="R180"/>
<smd name="31" x="-2.275" y="6.65" dx="0.44" dy="2.3" layer="1" rot="R180"/>
<smd name="32" x="-2.925" y="6.65" dx="0.44" dy="2.3" layer="1" rot="R180"/>
<smd name="33" x="-3.575" y="7.1" dx="0.44" dy="2.6" layer="1" rot="R180"/>
<smd name="34" x="-4.225" y="6.65" dx="0.44" dy="2.3" layer="1" rot="R180"/>
<rectangle x1="-5.025" y1="5.5" x2="-4.725" y2="7.1" layer="51" rot="R180"/>
<smd name="35" x="-4.875" y="6.8" dx="0.381" dy="2" layer="1" rot="R180"/>
<rectangle x1="-5.675" y1="5.5" x2="-5.375" y2="7.1" layer="51" rot="R180"/>
<smd name="36" x="-5.525" y="6.8" dx="0.381" dy="2" layer="1" rot="R180"/>
<wire x1="-7.95" y1="5.5" x2="-4.65" y2="5.5" width="0.127" layer="21"/>
<wire x1="-3.8" y1="5.5" x2="-3.35" y2="5.5" width="0.127" layer="21"/>
<wire x1="-1.85" y1="5.5" x2="-1.4" y2="5.5" width="0.127" layer="21"/>
<wire x1="-0.55" y1="5.5" x2="2.5" y2="5.5" width="0.127" layer="21"/>
<wire x1="3.35" y1="5.5" x2="3.8" y2="5.5" width="0.127" layer="21"/>
<wire x1="4.65" y1="5.5" x2="7.95" y2="5.5" width="0.127" layer="21"/>
<wire x1="-4.65" y1="5.5" x2="-3.8" y2="5.5" width="0.127" layer="51"/>
<wire x1="-3.35" y1="5.5" x2="-1.85" y2="5.5" width="0.127" layer="51"/>
<wire x1="-1.4" y1="5.5" x2="-0.55" y2="5.5" width="0.127" layer="51"/>
<wire x1="2.5" y1="5.5" x2="3.35" y2="5.5" width="0.127" layer="51"/>
<wire x1="3.8" y1="5.5" x2="4.65" y2="5.5" width="0.127" layer="51"/>
</package>
<package name="SOT23-8">
<wire x1="-1.45" y1="0.8" x2="1.45" y2="0.8" width="0.127" layer="51"/>
<wire x1="1.45" y1="0.8" x2="1.45" y2="-0.8" width="0.127" layer="21"/>
<wire x1="1.45" y1="-0.8" x2="-1.45" y2="-0.8" width="0.127" layer="51"/>
<wire x1="-1.45" y1="-0.8" x2="-1.45" y2="0.8" width="0.127" layer="21"/>
<smd name="1" x="-0.975" y="-1.3" dx="0.45" dy="1" layer="1"/>
<text x="-1.905" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="2.54" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.45" y1="-0.65" x2="-0.5" y2="0" layer="21"/>
<rectangle x1="-1.125" y1="-1.4" x2="-0.825" y2="-0.8" layer="51"/>
<smd name="2" x="-0.325" y="-1.3" dx="0.45" dy="1" layer="1"/>
<smd name="3" x="0.325" y="-1.3" dx="0.45" dy="1" layer="1"/>
<smd name="4" x="0.975" y="-1.3" dx="0.45" dy="1" layer="1"/>
<smd name="5" x="0.975" y="1.3" dx="0.45" dy="1" layer="1"/>
<smd name="6" x="0.325" y="1.3" dx="0.45" dy="1" layer="1"/>
<smd name="7" x="-0.325" y="1.3" dx="0.45" dy="1" layer="1"/>
<smd name="8" x="-0.975" y="1.3" dx="0.45" dy="1" layer="1"/>
<rectangle x1="-0.475" y1="-1.4" x2="-0.175" y2="-0.8" layer="51"/>
<rectangle x1="0.175" y1="-1.4" x2="0.475" y2="-0.8" layer="51"/>
<rectangle x1="0.825" y1="-1.4" x2="1.125" y2="-0.8" layer="51"/>
<rectangle x1="0.825" y1="0.8" x2="1.125" y2="1.4" layer="51"/>
<rectangle x1="0.175" y1="0.8" x2="0.475" y2="1.4" layer="51"/>
<rectangle x1="-0.475" y1="0.8" x2="-0.175" y2="1.4" layer="51"/>
<rectangle x1="-1.125" y1="0.8" x2="-0.825" y2="1.4" layer="51"/>
</package>
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
<pad name="P" x="0" y="0" drill="2.1" diameter="2.7" shape="square"/>
<smd name="1" x="-2.2" y="1.25" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<text x="2.54" y="2.794" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="2.54" y="-3.556" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-2" y1="1.125" x2="-1.6" y2="1.375" layer="51"/>
<smd name="2" x="-2.2" y="0.75" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="-2" y1="0.625" x2="-1.6" y2="0.875" layer="51"/>
<smd name="3" x="-2.2" y="0.25" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="-2" y1="0.125" x2="-1.6" y2="0.375" layer="51"/>
<smd name="4" x="-2.2" y="-0.25" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="-2" y1="-0.375" x2="-1.6" y2="-0.125" layer="51"/>
<smd name="5" x="-2.2" y="-0.75" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="-2" y1="-0.875" x2="-1.6" y2="-0.625" layer="51"/>
<smd name="6" x="-2.2" y="-1.25" dx="1.2" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="-2" y1="-1.375" x2="-1.6" y2="-1.125" layer="51"/>
<smd name="7" x="-1.25" y="-2.2" dx="1.2" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-1.45" y1="-1.925" x2="-1.05" y2="-1.675" layer="51" rot="R90"/>
<smd name="8" x="-0.75" y="-2.2" dx="1.2" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-0.95" y1="-1.925" x2="-0.55" y2="-1.675" layer="51" rot="R90"/>
<smd name="9" x="-0.25" y="-2.2" dx="1.2" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-0.45" y1="-1.925" x2="-0.05" y2="-1.675" layer="51" rot="R90"/>
<smd name="10" x="0.25" y="-2.2" dx="1.2" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="0.05" y1="-1.925" x2="0.45" y2="-1.675" layer="51" rot="R90"/>
<smd name="11" x="0.75" y="-2.2" dx="1.2" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="0.55" y1="-1.925" x2="0.95" y2="-1.675" layer="51" rot="R90"/>
<smd name="12" x="1.25" y="-2.2" dx="1.2" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="1.05" y1="-1.925" x2="1.45" y2="-1.675" layer="51" rot="R90"/>
<smd name="13" x="2.2" y="-1.25" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="-1.375" x2="2" y2="-1.125" layer="51" rot="R180"/>
<smd name="14" x="2.2" y="-0.75" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="-0.875" x2="2" y2="-0.625" layer="51" rot="R180"/>
<smd name="15" x="2.2" y="-0.25" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="-0.375" x2="2" y2="-0.125" layer="51" rot="R180"/>
<smd name="16" x="2.2" y="0.25" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="0.125" x2="2" y2="0.375" layer="51" rot="R180"/>
<smd name="17" x="2.2" y="0.75" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="0.625" x2="2" y2="0.875" layer="51" rot="R180"/>
<smd name="18" x="2.2" y="1.25" dx="1.2" dy="0.25" layer="1"/>
<rectangle x1="1.6" y1="1.125" x2="2" y2="1.375" layer="51" rot="R180"/>
<smd name="19" x="1.25" y="2.2" dx="1.2" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="1.05" y1="1.675" x2="1.45" y2="1.925" layer="51" rot="R270"/>
<smd name="20" x="0.75" y="2.2" dx="1.2" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="0.55" y1="1.675" x2="0.95" y2="1.925" layer="51" rot="R270"/>
<smd name="21" x="0.25" y="2.2" dx="1.2" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="0.05" y1="1.675" x2="0.45" y2="1.925" layer="51" rot="R270"/>
<smd name="22" x="-0.25" y="2.2" dx="1.2" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-0.45" y1="1.675" x2="-0.05" y2="1.925" layer="51" rot="R270"/>
<smd name="23" x="-0.75" y="2.2" dx="1.2" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-0.95" y1="1.675" x2="-0.55" y2="1.925" layer="51" rot="R270"/>
<smd name="24" x="-1.25" y="2.2" dx="1.2" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-1.45" y1="1.675" x2="-1.05" y2="1.925" layer="51" rot="R270"/>
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
<package name="SC70-5">
<wire x1="-1" y1="0.625" x2="1" y2="0.625" width="0.127" layer="21"/>
<wire x1="1" y1="0.625" x2="1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="1" y1="-0.625" x2="-1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.625" x2="-1" y2="0.625" width="0.127" layer="21"/>
<smd name="5" x="-0.65" y="1.15" dx="0.3" dy="0.7" layer="1"/>
<smd name="4" x="0.65" y="1.15" dx="0.3" dy="0.7" layer="1"/>
<smd name="1" x="-0.65" y="-1.15" dx="0.3" dy="0.7" layer="1" rot="R180"/>
<smd name="2" x="0" y="-1.15" dx="0.3" dy="0.7" layer="1" rot="R180"/>
<smd name="3" x="0.65" y="-1.15" dx="0.3" dy="0.7" layer="1" rot="R180"/>
<text x="-1.524" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="2.286" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<rectangle x1="-1" y1="-0.625" x2="0" y2="0" layer="21"/>
<rectangle x1="0.5375" y1="0.625" x2="0.7625" y2="1.05" layer="51"/>
<rectangle x1="-0.7625" y1="0.625" x2="-0.5375" y2="1.05" layer="51"/>
<rectangle x1="-0.7625" y1="-1.05" x2="-0.5375" y2="-0.625" layer="51" rot="R180"/>
<rectangle x1="-0.1125" y1="-1.05" x2="0.1125" y2="-0.625" layer="51" rot="R180"/>
<rectangle x1="0.5375" y1="-1.05" x2="0.7625" y2="-0.625" layer="51" rot="R180"/>
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
<symbol name="LOGIC_AND">
<wire x1="-2.54" y1="3.81" x2="-2.54" y2="-3.81" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-3.81" x2="1.27" y2="-3.81" width="0.254" layer="94"/>
<wire x1="1.27" y1="3.81" x2="1.27" y2="-3.81" width="0.254" layer="94" curve="-180"/>
<wire x1="1.27" y1="3.81" x2="-2.54" y2="3.81" width="0.254" layer="94"/>
<text x="-2.54" y="5.08" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="-7.62" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="A" x="-5.08" y="2.54" visible="pad" length="short" swaplevel="1"/>
<pin name="Y" x="7.62" y="0" visible="pad" length="short" rot="R180"/>
<pin name="B" x="-5.08" y="-2.54" visible="pad" length="short" swaplevel="1"/>
</symbol>
<symbol name="LOGIC_PWR">
<text x="1.27" y="0" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="1.27" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VCC" x="0" y="5.08" visible="pad" length="short" rot="R270"/>
<pin name="GND" x="0" y="-5.08" visible="pad" length="short" rot="R90"/>
</symbol>
<symbol name="INA199AX">
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-7.62" x2="7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="-7.62" x2="7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="7.62" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<text x="-7.62" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-10.16" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VIN+" x="-10.16" y="2.54" length="short" direction="in"/>
<pin name="VIN-" x="-10.16" y="5.08" length="short" direction="in"/>
<pin name="OUT" x="-10.16" y="-5.08" length="short" direction="out"/>
<pin name="V+" x="10.16" y="2.54" length="short" direction="in" rot="R180"/>
<pin name="GND" x="10.16" y="-5.08" length="short" direction="in" rot="R180"/>
<pin name="REF" x="10.16" y="5.08" length="short" direction="in" rot="R180"/>
</symbol>
<symbol name="DRV8332">
<text x="-20.32" y="30.988" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="10.16" y="-35.56" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<wire x1="-20.32" y1="30.48" x2="-20.32" y2="-33.02" width="0.254" layer="94"/>
<wire x1="-20.32" y1="-33.02" x2="20.32" y2="-33.02" width="0.254" layer="94"/>
<wire x1="20.32" y1="-33.02" x2="20.32" y2="30.48" width="0.254" layer="94"/>
<wire x1="20.32" y1="30.48" x2="-20.32" y2="30.48" width="0.254" layer="94"/>
<pin name="VREG" x="-22.86" y="12.7" length="short"/>
<pin name="M1" x="-22.86" y="5.08" length="short"/>
<pin name="!FAULT" x="-22.86" y="-7.62" length="short"/>
<pin name="M2" x="-22.86" y="2.54" length="short"/>
<pin name="OC_ADJ" x="-22.86" y="-30.48" length="short"/>
<pin name="PWM_A" x="-22.86" y="-12.7" length="short"/>
<pin name="!RESET_A" x="-22.86" y="-20.32" length="short"/>
<pin name="!OTW" x="-22.86" y="-5.08" length="short"/>
<pin name="M3" x="-22.86" y="0" length="short"/>
<pin name="PWM_B" x="-22.86" y="-15.24" length="short"/>
<pin name="PWM_C" x="-22.86" y="-17.78" length="short"/>
<pin name="!RESET_C" x="-22.86" y="-25.4" length="short"/>
<pin name="!RESET_B" x="-22.86" y="-22.86" length="short"/>
<pin name="GVDD_B" x="-22.86" y="22.86" length="short"/>
<pin name="AGND" x="-5.08" y="-35.56" length="short" rot="R90"/>
<pin name="GVDD_A" x="-22.86" y="25.4" length="short"/>
<pin name="BST_A" x="22.86" y="12.7" length="short" rot="R180"/>
<pin name="PVDD_A" x="22.86" y="27.94" length="short" rot="R180"/>
<pin name="OUT_A" x="22.86" y="7.62" length="short" rot="R180"/>
<pin name="GND_A" x="0" y="-35.56" length="short" rot="R90"/>
<pin name="GND_B" x="2.54" y="-35.56" length="short" rot="R90"/>
<pin name="OUT_B" x="22.86" y="-10.16" length="short" rot="R180"/>
<pin name="PVDD_B" x="22.86" y="25.4" length="short" rot="R180"/>
<pin name="BST_B" x="22.86" y="-5.08" length="short" rot="R180"/>
<pin name="GND" x="-2.54" y="-35.56" length="short" rot="R90"/>
<pin name="GND_C" x="5.08" y="-35.56" length="short" rot="R90"/>
<pin name="OUT_C" x="22.86" y="-27.94" length="short" rot="R180"/>
<pin name="PVDD_C" x="22.86" y="22.86" length="short" rot="R180"/>
<pin name="BST_C" x="22.86" y="-22.86" length="short" rot="R180"/>
<pin name="GVDD_C" x="-22.86" y="20.32" length="short"/>
<pin name="VDD" x="-22.86" y="27.94" length="short"/>
</symbol>
<symbol name="INA219">
<wire x1="-7.62" y1="10.16" x2="-7.62" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-10.16" x2="7.62" y2="-10.16" width="0.254" layer="94"/>
<wire x1="7.62" y1="-10.16" x2="7.62" y2="10.16" width="0.254" layer="94"/>
<wire x1="7.62" y1="10.16" x2="-7.62" y2="10.16" width="0.254" layer="94"/>
<text x="-7.62" y="10.668" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-12.7" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VIN+" x="-10.16" y="7.62" length="short" direction="in"/>
<pin name="VIN-" x="10.16" y="7.62" length="short" direction="in" rot="R180"/>
<pin name="SCL" x="10.16" y="0" length="short" rot="R180"/>
<pin name="VS" x="-10.16" y="0" length="short" direction="in"/>
<pin name="GND" x="-10.16" y="-7.62" length="short" direction="in"/>
<pin name="SDA" x="10.16" y="-2.54" length="short" rot="R180"/>
<pin name="A0" x="10.16" y="-5.08" length="short" direction="in" rot="R180"/>
<pin name="A1" x="10.16" y="-7.62" length="short" direction="in" rot="R180"/>
</symbol>
<symbol name="ADS79XX-4CH-QFN">
<wire x1="-12.7" y1="-22.86" x2="12.7" y2="-22.86" width="0.254" layer="94"/>
<wire x1="12.7" y1="-22.86" x2="12.7" y2="22.86" width="0.254" layer="94"/>
<wire x1="12.7" y1="22.86" x2="-12.7" y2="22.86" width="0.254" layer="94"/>
<wire x1="-12.7" y1="22.86" x2="-12.7" y2="-22.86" width="0.254" layer="94"/>
<text x="-12.7" y="25.908" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-12.7" y="23.368" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="SCLK" x="15.24" y="-15.24" length="short" rot="R180"/>
<pin name="SDI" x="15.24" y="-17.78" length="short" rot="R180"/>
<pin name="!CS" x="15.24" y="-12.7" length="short" rot="R180"/>
<pin name="AGND" x="-15.24" y="12.7" length="short"/>
<pin name="+VA" x="-15.24" y="20.32" length="short"/>
<pin name="REFP" x="-15.24" y="-12.7" length="short"/>
<pin name="CH3" x="15.24" y="12.7" length="short" rot="R180"/>
<pin name="CH2" x="15.24" y="15.24" length="short" rot="R180"/>
<pin name="CH1" x="15.24" y="17.78" length="short" rot="R180"/>
<pin name="CH0" x="15.24" y="20.32" length="short" rot="R180"/>
<pin name="SDO" x="15.24" y="-20.32" length="short" rot="R180"/>
<pin name="+VBD" x="-15.24" y="5.08" length="short"/>
<pin name="AINP" x="15.24" y="5.08" length="short" rot="R180"/>
<pin name="REFM" x="-15.24" y="-20.32" length="short"/>
<pin name="AINM" x="15.24" y="0" length="short" rot="R180"/>
<pin name="GPIO0" x="15.24" y="-7.62" length="short" rot="R180"/>
<pin name="MXO" x="15.24" y="7.62" length="short" rot="R180"/>
<pin name="BDGND" x="-15.24" y="-2.54" length="short"/>
<pin name="NC" x="0" y="-25.4" length="short" rot="R90"/>
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
<deviceset name="INA21*" prefix="U">
<gates>
<gate name="G$1" symbol="INA199AX" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SC70-6">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="OUT" pad="6"/>
<connect gate="G$1" pin="REF" pad="1"/>
<connect gate="G$1" pin="V+" pad="3"/>
<connect gate="G$1" pin="VIN+" pad="4"/>
<connect gate="G$1" pin="VIN-" pad="5"/>
</connects>
<technologies>
<technology name="0">
<attribute name="GAIN" value="200" constant="no"/>
</technology>
<technology name="1">
<attribute name="GAIN" value="500" constant="no"/>
</technology>
<technology name="2">
<attribute name="GAIN" value="1000" constant="no"/>
</technology>
<technology name="3">
<attribute name="GAIN" value="50" constant="no"/>
</technology>
<technology name="4">
<attribute name="GAIN" value="100" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="DRV8332" prefix="U">
<gates>
<gate name="G$1" symbol="DRV8332" x="0" y="0"/>
</gates>
<devices>
<device name="" package="HSSOP36">
<connects>
<connect gate="G$1" pin="!FAULT" pad="3"/>
<connect gate="G$1" pin="!OTW" pad="2"/>
<connect gate="G$1" pin="!RESET_A" pad="5"/>
<connect gate="G$1" pin="!RESET_B" pad="14"/>
<connect gate="G$1" pin="!RESET_C" pad="15"/>
<connect gate="G$1" pin="AGND" pad="9"/>
<connect gate="G$1" pin="BST_A" pad="35"/>
<connect gate="G$1" pin="BST_B" pad="28"/>
<connect gate="G$1" pin="BST_C" pad="20"/>
<connect gate="G$1" pin="GND" pad="8 24 25"/>
<connect gate="G$1" pin="GND_A" pad="32"/>
<connect gate="G$1" pin="GND_B" pad="31"/>
<connect gate="G$1" pin="GND_C" pad="23"/>
<connect gate="G$1" pin="GVDD_A" pad="36"/>
<connect gate="G$1" pin="GVDD_B" pad="1"/>
<connect gate="G$1" pin="GVDD_C" pad="18 19"/>
<connect gate="G$1" pin="M1" pad="13"/>
<connect gate="G$1" pin="M2" pad="12"/>
<connect gate="G$1" pin="M3" pad="11"/>
<connect gate="G$1" pin="OC_ADJ" pad="7"/>
<connect gate="G$1" pin="OUT_A" pad="33"/>
<connect gate="G$1" pin="OUT_B" pad="30"/>
<connect gate="G$1" pin="OUT_C" pad="22"/>
<connect gate="G$1" pin="PVDD_A" pad="34"/>
<connect gate="G$1" pin="PVDD_B" pad="29"/>
<connect gate="G$1" pin="PVDD_C" pad="21"/>
<connect gate="G$1" pin="PWM_A" pad="4"/>
<connect gate="G$1" pin="PWM_B" pad="6"/>
<connect gate="G$1" pin="PWM_C" pad="16"/>
<connect gate="G$1" pin="VDD" pad="17"/>
<connect gate="G$1" pin="VREG" pad="10"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="INA219" prefix="U">
<gates>
<gate name="G$1" symbol="INA219" x="0" y="0"/>
</gates>
<devices>
<device name="DCN" package="SOT23-8">
<connects>
<connect gate="G$1" pin="A0" pad="7"/>
<connect gate="G$1" pin="A1" pad="8"/>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="SCL" pad="5"/>
<connect gate="G$1" pin="SDA" pad="6"/>
<connect gate="G$1" pin="VIN+" pad="1"/>
<connect gate="G$1" pin="VIN-" pad="2"/>
<connect gate="G$1" pin="VS" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ADS7950RGE" prefix="U">
<gates>
<gate name="G$1" symbol="ADS79XX-4CH-QFN" x="0" y="0"/>
</gates>
<devices>
<device name="" package="QFN24-0.5">
<connects>
<connect gate="G$1" pin="!CS" pad="16"/>
<connect gate="G$1" pin="+VA" pad="1 14"/>
<connect gate="G$1" pin="+VBD" pad="21"/>
<connect gate="G$1" pin="AGND" pad="2 15 P"/>
<connect gate="G$1" pin="AINM" pad="5"/>
<connect gate="G$1" pin="AINP" pad="4"/>
<connect gate="G$1" pin="BDGND" pad="20"/>
<connect gate="G$1" pin="CH0" pad="11"/>
<connect gate="G$1" pin="CH1" pad="10"/>
<connect gate="G$1" pin="CH2" pad="9"/>
<connect gate="G$1" pin="CH3" pad="8"/>
<connect gate="G$1" pin="GPIO0" pad="22"/>
<connect gate="G$1" pin="MXO" pad="3"/>
<connect gate="G$1" pin="NC" pad="6 7 12 13"/>
<connect gate="G$1" pin="REFM" pad="23"/>
<connect gate="G$1" pin="REFP" pad="24"/>
<connect gate="G$1" pin="SCLK" pad="17"/>
<connect gate="G$1" pin="SDI" pad="18"/>
<connect gate="G$1" pin="SDO" pad="19"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="1G08" prefix="U">
<gates>
<gate name="A" symbol="LOGIC_AND" x="-5.08" y="0"/>
<gate name="P" symbol="LOGIC_PWR" x="7.62" y="0"/>
</gates>
<devices>
<device name="DBV" package="SOT23-5">
<connects>
<connect gate="A" pin="A" pad="1"/>
<connect gate="A" pin="B" pad="2"/>
<connect gate="A" pin="Y" pad="4"/>
<connect gate="P" pin="GND" pad="3"/>
<connect gate="P" pin="VCC" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DCK" package="SC70-5">
<connects>
<connect gate="A" pin="A" pad="1"/>
<connect gate="A" pin="B" pad="2"/>
<connect gate="A" pin="Y" pad="4"/>
<connect gate="P" pin="GND" pad="3"/>
<connect gate="P" pin="VCC" pad="5"/>
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
<library name="ic-Macronix">
<packages>
<package name="SOP8W">
<wire x1="-2.6" y1="2.65" x2="2.6" y2="2.65" width="0.127" layer="21"/>
<wire x1="2.6" y1="2.65" x2="2.6" y2="-2.65" width="0.127" layer="21"/>
<wire x1="-2.6" y1="2.65" x2="-2.6" y2="-2.65" width="0.127" layer="21"/>
<wire x1="-2.6" y1="-2.65" x2="2.6" y2="-2.65" width="0.127" layer="21"/>
<circle x="-1.985" y="-2.04" radius="0.2" width="0.127" layer="21"/>
<smd name="2" x="-0.635" y="-3.65" dx="0.48" dy="1.6" layer="1"/>
<smd name="7" x="-0.635" y="3.65" dx="0.48" dy="1.6" layer="1"/>
<smd name="1" x="-1.905" y="-3.65" dx="0.48" dy="1.6" layer="1"/>
<smd name="3" x="0.635" y="-3.65" dx="0.48" dy="1.6" layer="1"/>
<smd name="4" x="1.905" y="-3.65" dx="0.48" dy="1.6" layer="1"/>
<smd name="8" x="-1.905" y="3.65" dx="0.48" dy="1.6" layer="1"/>
<smd name="6" x="0.635" y="3.65" dx="0.48" dy="1.6" layer="1"/>
<smd name="5" x="1.905" y="3.65" dx="0.48" dy="1.6" layer="1"/>
<text x="-1.905" y="0.635" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.905" y="-0.635" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-2.11" y1="2.65" x2="-1.7" y2="4" layer="51"/>
<rectangle x1="-0.84" y1="2.65" x2="-0.43" y2="4" layer="51"/>
<rectangle x1="0.43" y1="2.65" x2="0.84" y2="4" layer="51"/>
<rectangle x1="1.7" y1="2.65" x2="2.11" y2="4" layer="51"/>
<rectangle x1="-2.11" y1="-4" x2="-1.7" y2="-2.65" layer="51" rot="R180"/>
<rectangle x1="-0.84" y1="-4" x2="-0.43" y2="-2.65" layer="51" rot="R180"/>
<rectangle x1="0.43" y1="-4" x2="0.84" y2="-2.65" layer="51" rot="R180"/>
<rectangle x1="1.7" y1="-4" x2="2.11" y2="-2.65" layer="51" rot="R180"/>
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
<pin name="NC/SIO3" x="12.7" y="-5.08" length="short" rot="R180"/>
<pin name="!WP!/SIO2" x="12.7" y="-2.54" length="short" rot="R180"/>
<pin name="GND" x="-12.7" y="-5.08" length="short"/>
<pin name="!CS" x="12.7" y="7.62" length="short" rot="R180"/>
<pin name="SCLK" x="12.7" y="5.08" length="short" rot="R180"/>
<pin name="SI/SIO0" x="12.7" y="2.54" length="short" rot="R180"/>
<pin name="SO/SIO1" x="12.7" y="0" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MX25L6445E" prefix="U">
<gates>
<gate name="G$1" symbol="SPIFLASH-X4" x="0" y="0"/>
</gates>
<devices>
<device name="M" package="SOP8W">
<connects>
<connect gate="G$1" pin="!CS" pad="1"/>
<connect gate="G$1" pin="!WP!/SIO2" pad="3"/>
<connect gate="G$1" pin="GND" pad="4"/>
<connect gate="G$1" pin="NC/SIO3" pad="7"/>
<connect gate="G$1" pin="SCLK" pad="6"/>
<connect gate="G$1" pin="SI/SIO0" pad="5"/>
<connect gate="G$1" pin="SO/SIO1" pad="2"/>
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
<library name="Switch">
<packages>
<package name="SLE6_10A4">
<text x="-7.62" y="-7.62" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<wire x1="-16" y1="9.4" x2="-5" y2="9.4" width="0.127" layer="21"/>
<wire x1="-5" y1="9.4" x2="-5" y2="-9.4" width="0.127" layer="21"/>
<wire x1="-5" y1="-9.4" x2="-16" y2="-9.4" width="0.127" layer="21"/>
<wire x1="-16" y1="-9.4" x2="-16" y2="9.4" width="0.127" layer="21"/>
<pad name="1" x="0" y="7" drill="1.8" diameter="2.6"/>
<pad name="P" x="0" y="0" drill="1.8" diameter="2.6"/>
<wire x1="-16" y1="10.5" x2="-18" y2="10.5" width="0.127" layer="21"/>
<wire x1="-18" y1="10.5" x2="-18" y2="-10.5" width="0.127" layer="21"/>
<wire x1="-18" y1="-10.5" x2="-16" y2="-10.5" width="0.127" layer="21"/>
<wire x1="-16" y1="-10.5" x2="-16" y2="-9.4" width="0.127" layer="21"/>
<wire x1="-16" y1="10.5" x2="-16" y2="9.4" width="0.127" layer="21"/>
<rectangle x1="-5" y1="-0.6" x2="0" y2="0.6" layer="51"/>
<rectangle x1="-5" y1="6.4" x2="0" y2="7.6" layer="51"/>
<wire x1="-5" y1="8.5" x2="-3.5" y2="8.5" width="0.127" layer="51"/>
<wire x1="-3.5" y1="8.5" x2="-3.5" y2="5.5" width="0.127" layer="51"/>
<wire x1="-3.5" y1="5.5" x2="-5" y2="5.5" width="0.127" layer="51"/>
<wire x1="-5" y1="1.4" x2="-3.5" y2="1.4" width="0.127" layer="51"/>
<wire x1="-3.5" y1="1.4" x2="-3.5" y2="-1.5" width="0.127" layer="51"/>
<wire x1="-3.5" y1="-1.5" x2="-5" y2="-1.5" width="0.127" layer="51"/>
<wire x1="-18" y1="0" x2="-21" y2="7" width="0.127" layer="51"/>
<wire x1="-21" y1="7" x2="-18" y2="8" width="0.127" layer="51"/>
<wire x1="-16" y1="9.4" x2="-12" y2="10" width="0.127" layer="51"/>
<wire x1="-12" y1="10" x2="-8" y2="9.4" width="0.127" layer="51"/>
<wire x1="-16" y1="-9.4" x2="-12" y2="-10" width="0.127" layer="51"/>
<wire x1="-12" y1="-10" x2="-8" y2="-9.4" width="0.127" layer="51"/>
</package>
<package name="EVQ-PU_BDKM">
<wire x1="-2.35" y1="1.75" x2="2.35" y2="1.75" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1.75" x2="-2.35" y2="-1.75" width="0.127" layer="21"/>
<smd name="A1" x="-2.575" y="-0.85" dx="1.45" dy="1" layer="1"/>
<smd name="A2" x="2.575" y="-0.85" dx="1.45" dy="1" layer="1"/>
<smd name="B1" x="-2.575" y="0.85" dx="1.45" dy="1" layer="1"/>
<smd name="B2" x="2.575" y="0.85" dx="1.45" dy="1" layer="1"/>
<wire x1="-2.35" y1="1.75" x2="-2.35" y2="1.55" width="0.127" layer="21"/>
<wire x1="-2.35" y1="0.15" x2="-2.35" y2="-0.15" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-1.75" x2="-2.35" y2="-1.55" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1.75" x2="2.35" y2="-1.55" width="0.127" layer="21"/>
<wire x1="2.35" y1="-0.15" x2="2.35" y2="0.15" width="0.127" layer="21"/>
<wire x1="2.35" y1="1.75" x2="2.35" y2="1.55" width="0.127" layer="21"/>
<wire x1="2.35" y1="1.55" x2="2.35" y2="0.15" width="0.127" layer="51"/>
<wire x1="2.35" y1="-0.15" x2="2.35" y2="-1.55" width="0.127" layer="51"/>
<wire x1="-2.35" y1="-1.55" x2="-2.35" y2="-0.15" width="0.127" layer="51"/>
<wire x1="-2.35" y1="0.15" x2="-2.35" y2="1.55" width="0.127" layer="51"/>
<wire x1="-1.3" y1="-1.75" x2="-1.3" y2="-2.75" width="0.127" layer="51"/>
<wire x1="1.3" y1="-1.75" x2="1.3" y2="-2.75" width="0.127" layer="51"/>
<wire x1="-1.3" y1="-2.75" x2="1.3" y2="-2.75" width="0.127" layer="51"/>
<text x="-2.54" y="3.81" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="2.54" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
<package name="EVQ-P2_3P2">
<wire x1="-2.35" y1="1.75" x2="2.35" y2="1.75" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1.75" x2="-2.35" y2="-1.75" width="0.127" layer="21"/>
<smd name="A1" x="-2.575" y="-0.85" dx="1.45" dy="1" layer="1"/>
<smd name="A2" x="2.575" y="-0.85" dx="1.45" dy="1" layer="1"/>
<smd name="B1" x="-2.575" y="0.85" dx="1.45" dy="1" layer="1"/>
<smd name="B2" x="2.575" y="0.85" dx="1.45" dy="1" layer="1"/>
<wire x1="-2.35" y1="1.75" x2="-2.35" y2="1.55" width="0.127" layer="21"/>
<wire x1="-2.35" y1="0.15" x2="-2.35" y2="-0.15" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-1.75" x2="-2.35" y2="-1.55" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1.75" x2="2.35" y2="-1.55" width="0.127" layer="21"/>
<wire x1="2.35" y1="-0.15" x2="2.35" y2="0.15" width="0.127" layer="21"/>
<wire x1="2.35" y1="1.75" x2="2.35" y2="1.55" width="0.127" layer="21"/>
<wire x1="2.35" y1="1.55" x2="2.35" y2="0.15" width="0.127" layer="51"/>
<wire x1="2.35" y1="-0.15" x2="2.35" y2="-1.55" width="0.127" layer="51"/>
<wire x1="-2.35" y1="-1.55" x2="-2.35" y2="-0.15" width="0.127" layer="51"/>
<wire x1="-2.35" y1="0.15" x2="-2.35" y2="1.55" width="0.127" layer="51"/>
<text x="-2.54" y="3.81" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="2.54" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<circle x="0" y="0" radius="0.9" width="0.127" layer="51"/>
<circle x="0" y="0" radius="1.1" width="0.127" layer="51"/>
</package>
<package name="EVQ-P2_P9">
<wire x1="-2.35" y1="1.75" x2="2.35" y2="1.75" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1.75" x2="-2.35" y2="-1.75" width="0.127" layer="21"/>
<smd name="A1" x="-2.575" y="-0.85" dx="1.45" dy="1" layer="1"/>
<smd name="A2" x="2.575" y="-0.85" dx="1.45" dy="1" layer="1"/>
<smd name="B1" x="-2.575" y="0.85" dx="1.45" dy="1" layer="1"/>
<smd name="B2" x="2.575" y="0.85" dx="1.45" dy="1" layer="1"/>
<wire x1="-2.35" y1="1.75" x2="-2.35" y2="1.55" width="0.127" layer="21"/>
<wire x1="-2.35" y1="0.15" x2="-2.35" y2="-0.15" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-1.75" x2="-2.35" y2="-1.55" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1.75" x2="2.35" y2="-1.55" width="0.127" layer="21"/>
<wire x1="2.35" y1="-0.15" x2="2.35" y2="0.15" width="0.127" layer="21"/>
<wire x1="2.35" y1="1.75" x2="2.35" y2="1.55" width="0.127" layer="21"/>
<wire x1="2.35" y1="1.55" x2="2.35" y2="0.15" width="0.127" layer="51"/>
<wire x1="2.35" y1="-0.15" x2="2.35" y2="-1.55" width="0.127" layer="51"/>
<wire x1="-2.35" y1="-1.55" x2="-2.35" y2="-0.15" width="0.127" layer="51"/>
<wire x1="-2.35" y1="0.15" x2="-2.35" y2="1.55" width="0.127" layer="51"/>
<text x="-2.54" y="3.81" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="2.54" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<wire x1="-1.3" y1="0.8" x2="-0.5" y2="0.8" width="0.127" layer="51"/>
<wire x1="0.5" y1="0.8" x2="1.3" y2="0.8" width="0.127" layer="51"/>
<wire x1="1.3" y1="0.8" x2="1.3" y2="-0.8" width="0.127" layer="51"/>
<wire x1="1.3" y1="-0.8" x2="0.5" y2="-0.8" width="0.127" layer="51"/>
<wire x1="-0.5" y1="-0.8" x2="-1.3" y2="-0.8" width="0.127" layer="51"/>
<wire x1="-1.3" y1="-0.8" x2="-1.3" y2="0.8" width="0.127" layer="51"/>
<wire x1="-0.5" y1="0.8" x2="0.5" y2="0.8" width="0.127" layer="51" curve="-90"/>
<wire x1="0.5" y1="-0.8" x2="-0.5" y2="-0.8" width="0.127" layer="51" curve="-90"/>
</package>
<package name="EVQ-PU_ACJL">
<wire x1="-2.35" y1="1.75" x2="2.35" y2="1.75" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1.75" x2="-2.35" y2="-1.75" width="0.127" layer="21"/>
<smd name="A1" x="-2.6" y="-0.85" dx="1.6" dy="1" layer="1"/>
<smd name="A2" x="2.6" y="-0.85" dx="1.6" dy="1" layer="1"/>
<smd name="B1" x="-2.6" y="0.85" dx="1.6" dy="1" layer="1"/>
<smd name="B2" x="2.6" y="0.85" dx="1.6" dy="1" layer="1"/>
<wire x1="-2.35" y1="1.75" x2="-2.35" y2="1.55" width="0.127" layer="21"/>
<wire x1="-2.35" y1="0.15" x2="-2.35" y2="-0.15" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-1.75" x2="-2.35" y2="-1.55" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1.75" x2="2.35" y2="-1.55" width="0.127" layer="21"/>
<wire x1="2.35" y1="-0.15" x2="2.35" y2="0.15" width="0.127" layer="21"/>
<wire x1="2.35" y1="1.75" x2="2.35" y2="1.55" width="0.127" layer="21"/>
<wire x1="2.35" y1="1.55" x2="2.35" y2="0.15" width="0.127" layer="51"/>
<wire x1="2.35" y1="-0.15" x2="2.35" y2="-1.55" width="0.127" layer="51"/>
<wire x1="-2.35" y1="-1.55" x2="-2.35" y2="-0.15" width="0.127" layer="51"/>
<wire x1="-2.35" y1="0.15" x2="-2.35" y2="1.55" width="0.127" layer="51"/>
<wire x1="-1.3" y1="-1.75" x2="-1.3" y2="-2.75" width="0.127" layer="51"/>
<wire x1="1.3" y1="-1.75" x2="1.3" y2="-2.75" width="0.127" layer="51"/>
<wire x1="-1.3" y1="-2.75" x2="1.3" y2="-2.75" width="0.127" layer="51"/>
<text x="-2.54" y="3.81" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="2.54" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="SWITCH2P">
<wire x1="0" y1="0" x2="2.54" y2="1.27" width="0.1524" layer="94"/>
<circle x="0" y="0" radius="0.127" width="0.254" layer="94"/>
<circle x="2.54" y="0" radius="0.127" width="0.254" layer="94"/>
<text x="-2.54" y="5.588" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="3.048" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="B" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="TACT4P">
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="1.27" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="1.27" width="0.1524" layer="94"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="1.27" x2="-0.762" y2="1.27" width="0.1524" layer="94"/>
<wire x1="0.762" y1="1.27" x2="2.54" y2="1.27" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="2.032" x2="0" y2="2.032" width="0.254" layer="94"/>
<wire x1="0" y1="2.032" x2="1.016" y2="2.032" width="0.254" layer="94"/>
<wire x1="0" y1="2.032" x2="0" y2="2.54" width="0.254" layer="94"/>
<circle x="-0.762" y="1.27" radius="0.127" width="0.254" layer="94"/>
<circle x="0.762" y="1.27" radius="0.127" width="0.254" layer="94"/>
<text x="-1.27" y="3.048" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-3.81" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="A1" x="-2.54" y="2.54" visible="off" length="point" direction="pas"/>
<pin name="A2" x="-2.54" y="0" visible="off" length="point" direction="pas"/>
<pin name="B1" x="2.54" y="2.54" visible="off" length="point" direction="pas" rot="R180"/>
<pin name="B2" x="2.54" y="0" visible="off" length="point" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SLE*A4" prefix="SW" uservalue="yes">
<gates>
<gate name="G$1" symbol="SWITCH2P" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SLE6_10A4">
<connects>
<connect gate="G$1" pin="A" pad="P"/>
<connect gate="G$1" pin="B" pad="1"/>
</connects>
<technologies>
<technology name="10"/>
<technology name="6"/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="EVQ-?" prefix="SW" uservalue="yes">
<gates>
<gate name="G$1" symbol="TACT4P" x="0" y="0"/>
</gates>
<devices>
<device name="PU-J" package="EVQ-PU_BDKM">
<connects>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="B1" pad="B1"/>
<connect gate="G$1" pin="B2" pad="B2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="P2-CIRCLE" package="EVQ-P2_3P2">
<connects>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="B1" pad="B1"/>
<connect gate="G$1" pin="B2" pad="B2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="P2-RECTANGLE" package="EVQ-P2_P9">
<connects>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="B1" pad="B1"/>
<connect gate="G$1" pin="B2" pad="B2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PU-GW" package="EVQ-PU_ACJL">
<connects>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="B1" pad="B1"/>
<connect gate="G$1" pin="B2" pad="B2"/>
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
<package name="53375-04">
<text x="-7.62" y="5.08" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-7.62" y="3.81" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<wire x1="-6.2" y1="3.4" x2="6.2" y2="3.4" width="0.127" layer="21"/>
<wire x1="-6.2" y1="-3.4" x2="6.2" y2="-3.4" width="0.127" layer="21"/>
<wire x1="-6.2" y1="-3.4" x2="-6.2" y2="3.4" width="0.127" layer="21"/>
<wire x1="6.2" y1="3.4" x2="6.2" y2="-3.4" width="0.127" layer="21"/>
<pad name="1" x="3.75" y="0" drill="1" diameter="1.5"/>
<pad name="2" x="1.25" y="0" drill="1" diameter="1.5"/>
<pad name="3" x="-1.25" y="0" drill="1" diameter="1.5"/>
<pad name="4" x="-3.75" y="0" drill="1" diameter="1.5"/>
<hole x="5.35" y="-2.2" drill="1.2"/>
</package>
<package name="70553-0003">
<text x="-5.08" y="3.81" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-5.08" y="2.54" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<wire x1="-6.355" y1="12.91" x2="6.355" y2="12.91" width="0.127" layer="21"/>
<wire x1="-5.5" y1="-0.68" x2="-4.6" y2="-0.68" width="0.127" layer="21"/>
<wire x1="-4.6" y1="-0.68" x2="-3" y2="-0.68" width="0.127" layer="51"/>
<wire x1="-3" y1="-0.68" x2="-2" y2="-0.68" width="0.127" layer="21"/>
<wire x1="-2" y1="-0.68" x2="-0.5" y2="-0.68" width="0.127" layer="51"/>
<wire x1="-0.5" y1="-0.68" x2="0.5" y2="-0.68" width="0.127" layer="21"/>
<wire x1="0.5" y1="-0.68" x2="2" y2="-0.68" width="0.127" layer="51"/>
<wire x1="2" y1="-0.68" x2="3" y2="-0.68" width="0.127" layer="21"/>
<wire x1="4.6" y1="-0.68" x2="5.5" y2="-0.68" width="0.127" layer="21"/>
<wire x1="-6.355" y1="0.8" x2="-6.355" y2="12.91" width="0.127" layer="21"/>
<wire x1="6.355" y1="12.91" x2="6.355" y2="0.8" width="0.127" layer="21"/>
<pad name="1" x="3.81" y="0" drill="1.1" diameter="1.6"/>
<pad name="2" x="1.27" y="0" drill="1.1" diameter="1.6"/>
<pad name="3" x="-1.27" y="0" drill="1.1" diameter="1.6"/>
<pad name="4" x="-3.81" y="0" drill="1.1" diameter="1.6"/>
<rectangle x1="-4.11" y1="-0.3" x2="-3.51" y2="0.3" layer="51"/>
<rectangle x1="-1.57" y1="-0.3" x2="-0.97" y2="0.3" layer="51"/>
<rectangle x1="0.97" y1="-0.3" x2="1.57" y2="0.3" layer="51"/>
<rectangle x1="3.51" y1="-0.3" x2="4.11" y2="0.3" layer="51"/>
<wire x1="-3.81" y1="12.91" x2="-3.81" y2="9" width="0.127" layer="51"/>
<wire x1="-3.81" y1="9" x2="-1.27" y2="9" width="0.127" layer="51"/>
<wire x1="-1.27" y1="9" x2="-1.27" y2="4.02" width="0.127" layer="51"/>
<wire x1="-1.27" y1="4.02" x2="1.27" y2="4.02" width="0.127" layer="51"/>
<wire x1="1.27" y1="4.02" x2="1.27" y2="9" width="0.127" layer="51"/>
<wire x1="1.27" y1="9" x2="3.81" y2="9" width="0.127" layer="51"/>
<wire x1="3.81" y1="9" x2="3.81" y2="12.91" width="0.127" layer="51"/>
<wire x1="-6.355" y1="0.8" x2="-5.5" y2="0.8" width="0.127" layer="21"/>
<wire x1="-5.5" y1="0.8" x2="-5.5" y2="-0.68" width="0.127" layer="21"/>
<wire x1="6.355" y1="0.8" x2="5.5" y2="0.8" width="0.127" layer="21"/>
<wire x1="5.5" y1="0.8" x2="5.5" y2="-0.68" width="0.127" layer="21"/>
<wire x1="3" y1="-0.68" x2="4.6" y2="-0.68" width="0.127" layer="51"/>
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
<symbol name="PIN1X4">
<wire x1="-1.27" y1="-7.62" x2="3.81" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-7.62" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="5.08" x2="-1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="-1.27" y2="-7.62" width="0.4064" layer="94"/>
<text x="-1.27" y="5.588" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-1.27" y="-10.16" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="-2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-5.08" visible="pad" length="middle" direction="pas" function="dot"/>
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
<deviceset name="53375-0410" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="PIN1X4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="53375-04">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="70553-0003" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="PIN1X4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="70553-0003">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Speaker">
<packages>
<package name="PKLCS1212">
<text x="-6.35" y="7.62" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-6.35" y="6.35" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<wire x1="-6" y1="-6" x2="6" y2="-6" width="0.127" layer="21"/>
<wire x1="6" y1="6" x2="-6" y2="6" width="0.127" layer="21"/>
<wire x1="-6" y1="-6" x2="-6" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-6" y1="2.2" x2="-6" y2="6" width="0.127" layer="21"/>
<wire x1="6" y1="-6" x2="6" y2="-2.2" width="0.127" layer="21"/>
<wire x1="6" y1="2.2" x2="6" y2="6" width="0.127" layer="21"/>
<smd name="1" x="-5.8" y="0" dx="1.6" dy="4" layer="1"/>
<smd name="2" x="5.8" y="0" dx="1.6" dy="4" layer="1"/>
<wire x1="3.5" y1="0.5" x2="3.5" y2="-0.5" width="0.127" layer="21"/>
<wire x1="3.5" y1="-0.5" x2="4" y2="0" width="0.127" layer="21"/>
<wire x1="4" y1="0" x2="3.5" y2="0.5" width="0.127" layer="21"/>
<wire x1="-6" y1="2.2" x2="-6" y2="-2.2" width="0.127" layer="51"/>
<wire x1="6" y1="2.2" x2="6" y2="-2.2" width="0.127" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="BUZZER">
<text x="-2.54" y="5.588" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="3.048" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
<pin name="2" x="-5.08" y="-2.54" visible="off" length="short" direction="pas"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="-3.81" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-3.81" x2="0" y2="-3.81" width="0.254" layer="94"/>
<wire x1="0" y1="-3.81" x2="0" y2="-3.048" width="0.254" layer="94"/>
<wire x1="0" y1="-3.048" x2="0" y2="0.508" width="0.254" layer="94"/>
<wire x1="0" y1="0.508" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="-2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-3.048" x2="2.032" y2="-5.08" width="0.254" layer="94"/>
<wire x1="0" y1="0.508" x2="2.032" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.032" y1="2.54" x2="2.032" y2="-5.08" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PKLCS1212E*" prefix="BZ">
<gates>
<gate name="G$1" symbol="BUZZER" x="0" y="0"/>
</gates>
<devices>
<device name="" package="PKLCS1212">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="2400"/>
<technology name="4001"/>
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
<library name="ic-Vishay">
<packages>
<package name="TFBS4650">
<text x="-3.81" y="3.81" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-3.81" y="2.54" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<smd name="4" x="0" y="0.65" dx="0.6" dy="1.3" layer="1"/>
<smd name="1" x="-2.85" y="0.65" dx="0.6" dy="1.3" layer="1"/>
<smd name="2" x="-1.9" y="0.65" dx="0.6" dy="1.3" layer="1"/>
<smd name="3" x="-0.95" y="0.65" dx="0.6" dy="1.3" layer="1"/>
<smd name="5" x="0.95" y="0.65" dx="0.6" dy="1.3" layer="1"/>
<smd name="6" x="1.9" y="0.65" dx="0.6" dy="1.3" layer="1"/>
<smd name="7" x="2.85" y="0.65" dx="0.6" dy="1.3" layer="1"/>
<wire x1="3.4" y1="0.9" x2="3.4" y2="-0.75" width="0.127" layer="21"/>
<wire x1="3.4" y1="-0.75" x2="3.235" y2="-0.75" width="0.127" layer="21"/>
<wire x1="3.235" y1="-0.75" x2="1.235" y2="-0.75" width="0.127" layer="21"/>
<wire x1="1.235" y1="-0.75" x2="-1.235" y2="-0.75" width="0.127" layer="21"/>
<wire x1="-1.235" y1="-0.75" x2="-3.235" y2="-0.75" width="0.127" layer="21"/>
<wire x1="-3.235" y1="-0.75" x2="-3.4" y2="-0.75" width="0.127" layer="21"/>
<wire x1="-3.4" y1="-0.75" x2="-3.4" y2="0.9" width="0.127" layer="21"/>
<wire x1="-1.235" y1="-0.75" x2="-3.235" y2="-0.75" width="0.127" layer="21" curve="-180"/>
<wire x1="3.235" y1="-0.75" x2="1.235" y2="-0.75" width="0.127" layer="21" curve="-180"/>
<wire x1="-3.4" y1="0.9" x2="-3.35" y2="0.9" width="0.127" layer="21"/>
<wire x1="3.4" y1="0.9" x2="3.35" y2="0.9" width="0.127" layer="21"/>
<wire x1="-3.35" y1="0.9" x2="3.35" y2="0.9" width="0.127" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="TFBS4650">
<text x="-10.16" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-10.16" y="-10.16" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<wire x1="-10.16" y1="7.62" x2="-10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-7.62" x2="10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="10.16" y2="7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="7.62" x2="-10.16" y2="7.62" width="0.254" layer="94"/>
<pin name="VCC" x="-12.7" y="2.54" length="short"/>
<pin name="GND" x="-12.7" y="-5.08" length="short"/>
<pin name="IREDA" x="-12.7" y="5.08" length="short"/>
<pin name="IREDC" x="12.7" y="5.08" length="short" rot="R180"/>
<pin name="RXD" x="12.7" y="-2.54" length="short" rot="R180"/>
<pin name="SD" x="12.7" y="-5.08" length="short" rot="R180"/>
<pin name="TXD" x="12.7" y="0" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TFBS4650" prefix="U">
<gates>
<gate name="G$1" symbol="TFBS4650" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TFBS4650">
<connects>
<connect gate="G$1" pin="GND" pad="7"/>
<connect gate="G$1" pin="IREDA" pad="1"/>
<connect gate="G$1" pin="IREDC" pad="2"/>
<connect gate="G$1" pin="RXD" pad="4"/>
<connect gate="G$1" pin="SD" pad="5"/>
<connect gate="G$1" pin="TXD" pad="3"/>
<connect gate="G$1" pin="VCC" pad="6"/>
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
<package name="MOTOR_COMPLEX1">
<wire x1="-8" y1="3.3" x2="8" y2="3.3" width="0.127" layer="21"/>
<smd name="1.1" x="5" y="-2.4" dx="0.6" dy="2" layer="1"/>
<text x="-8.89" y="6.35" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-8.89" y="5.08" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<wire x1="6.45" y1="-1" x2="-6.45" y2="-1" width="0.127" layer="21"/>
<rectangle x1="-8.65" y1="-1" x2="-8" y2="1" layer="51"/>
<rectangle x1="8" y1="-1" x2="8.65" y2="1" layer="51"/>
<wire x1="-8" y1="3.3" x2="-9" y2="3.3" width="0.127" layer="51"/>
<wire x1="-9" y1="3.3" x2="-9" y2="4.4" width="0.127" layer="51"/>
<wire x1="-9" y1="4.4" x2="9" y2="4.4" width="0.127" layer="51"/>
<wire x1="9" y1="4.4" x2="9" y2="3.3" width="0.127" layer="51"/>
<wire x1="9" y1="3.3" x2="8" y2="3.3" width="0.127" layer="51"/>
<smd name="1.2" x="4" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.3" x="3" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.4" x="2" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.5" x="1" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.6" x="0" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.7" x="-1" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.8" x="-2" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.9" x="-3" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.10" x="-4" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.11" x="-5" y="-2.4" dx="0.6" dy="2" layer="1"/>
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
<wire x1="8" y1="1.65" x2="8" y2="3.3" width="0.127" layer="21"/>
<wire x1="-8" y1="3.3" x2="-8" y2="1.65" width="0.127" layer="21"/>
<wire x1="8" y1="1.65" x2="8" y2="-1" width="0.127" layer="51"/>
<wire x1="8" y1="-1" x2="6.45" y2="-1" width="0.127" layer="51"/>
<wire x1="-8" y1="1.65" x2="-8" y2="-1" width="0.127" layer="51"/>
<wire x1="-8" y1="-1" x2="-6.45" y2="-1" width="0.127" layer="51"/>
<pad name="2.1" x="-4.5" y="3.3" drill="1.1"/>
<pad name="2.2" x="-1.5" y="3.3" drill="1.1"/>
<pad name="2.3" x="1.5" y="3.3" drill="1.1"/>
<pad name="2.4" x="4.5" y="3.3" drill="1.1"/>
<pad name="2.5" x="-4.5" y="0.3" drill="1.1"/>
<pad name="2.6" x="-1.5" y="0.3" drill="1.1"/>
<pad name="2.7" x="1.5" y="0.3" drill="1.1"/>
<pad name="2.8" x="4.5" y="0.3" drill="1.1"/>
<rectangle x1="-9.9016" y1="-1.5016" x2="-6.5984" y2="1.5016" layer="29"/>
<pad name="S1" x="-7.5" y="-0.64" drill="1.1" diameter="1.5" shape="square" stop="no" thermals="no"/>
<pad name="S2" x="7.5" y="-0.64" drill="1.1" diameter="1.5" shape="square" stop="no" thermals="no"/>
<rectangle x1="6.5984" y1="-1.5016" x2="9.9016" y2="1.5016" layer="29"/>
<polygon width="0" layer="1">
<vertex x="-9.8" y="1.4"/>
<vertex x="-6.7" y="1.4"/>
<vertex x="-6.7" y="1.3"/>
<vertex x="-6.7" y="-1.4"/>
<vertex x="-9.8" y="-1.4"/>
</polygon>
<polygon width="0" layer="1">
<vertex x="6.7" y="1.4"/>
<vertex x="9.8" y="1.4"/>
<vertex x="9.8" y="-1.4"/>
<vertex x="6.7" y="-1.4"/>
</polygon>
</package>
<package name="MOTOR_COMPLEX2">
<smd name="S1" x="-8.6" y="0" dx="2.4" dy="2.8" layer="1"/>
<wire x1="-8" y1="3.3" x2="8" y2="3.3" width="0.127" layer="21"/>
<smd name="S2" x="8.6" y="0" dx="2.4" dy="2.8" layer="1"/>
<smd name="1.1" x="5" y="-2.4" dx="0.6" dy="2" layer="1"/>
<text x="-6.35" y="1.27" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-6.35" y="0" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<wire x1="7.2" y1="-1" x2="-7.2" y2="-1" width="0.127" layer="21"/>
<rectangle x1="-8.65" y1="-1" x2="-8" y2="1" layer="51"/>
<rectangle x1="8" y1="-1" x2="8.65" y2="1" layer="51"/>
<wire x1="-8" y1="3.3" x2="-9" y2="3.3" width="0.127" layer="51"/>
<wire x1="-9" y1="3.3" x2="-9" y2="4.4" width="0.127" layer="51"/>
<wire x1="-9" y1="4.4" x2="9" y2="4.4" width="0.127" layer="51"/>
<wire x1="9" y1="4.4" x2="9" y2="3.3" width="0.127" layer="51"/>
<wire x1="9" y1="3.3" x2="8" y2="3.3" width="0.127" layer="51"/>
<smd name="1.2" x="4" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.3" x="3" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.4" x="2" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.5" x="1" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.6" x="0" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.7" x="-1" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.8" x="-2" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.9" x="-3" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.10" x="-4" y="-2.4" dx="0.6" dy="2" layer="1"/>
<smd name="1.11" x="-5" y="-2.4" dx="0.6" dy="2" layer="1"/>
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
<pad name="2.1" x="-4.5" y="10" drill="1.1" diameter="1.5"/>
<pad name="2.2" x="-1.5" y="10" drill="1.1" diameter="1.5"/>
<wire x1="-8.075" y1="11.9" x2="8.075" y2="11.9" width="0.127" layer="21"/>
<wire x1="-8.075" y1="4.53" x2="8.075" y2="4.53" width="0.127" layer="21"/>
<wire x1="-8.075" y1="4.53" x2="-8.075" y2="11.9" width="0.127" layer="21"/>
<wire x1="8.075" y1="11.9" x2="8.075" y2="4.53" width="0.127" layer="21"/>
<pad name="2.3" x="1.5" y="10" drill="1.1" diameter="1.5"/>
<pad name="2.4" x="4.5" y="10" drill="1.1" diameter="1.5"/>
<pad name="2.5" x="-4.5" y="7" drill="1.1" diameter="1.5"/>
<pad name="2.6" x="-1.5" y="7" drill="1.1" diameter="1.5"/>
<pad name="2.7" x="1.5" y="7" drill="1.1" diameter="1.5"/>
<pad name="2.8" x="4.5" y="7" drill="1.1" diameter="1.5"/>
<hole x="-7.5" y="6.06" drill="1"/>
<hole x="7.5" y="6.06" drill="1"/>
<rectangle x1="-0.8" y1="3.13" x2="0.8" y2="4.53" layer="51"/>
</package>
<package name="AE-NJU72501">
<text x="0" y="3.81" size="0.762" layer="25" font="vector" ratio="17" rot="R270">&gt;NAME</text>
<text x="-1.27" y="3.81" size="0.762" layer="27" font="vector" ratio="17" rot="R270">&gt;VALUE</text>
<wire x1="-4" y1="-5.5" x2="4" y2="-5.5" width="0.127" layer="21"/>
<smd name="1" x="-3.9" y="3.81" dx="1.2" dy="1.8" layer="1"/>
<smd name="2" x="-3.9" y="1.27" dx="1.2" dy="1.8" layer="1"/>
<smd name="3" x="-3.9" y="-1.27" dx="1.2" dy="1.8" layer="1"/>
<smd name="4" x="-3.9" y="-3.81" dx="1.2" dy="1.8" layer="1"/>
<smd name="5" x="3.9" y="-3.81" dx="1.2" dy="1.8" layer="1"/>
<smd name="6" x="3.9" y="-1.27" dx="1.2" dy="1.8" layer="1"/>
<smd name="7" x="3.9" y="1.27" dx="1.2" dy="1.8" layer="1"/>
<smd name="8" x="3.9" y="3.81" dx="1.2" dy="1.8" layer="1"/>
<wire x1="-4" y1="5.5" x2="-4" y2="4.9" width="0.127" layer="21"/>
<wire x1="4" y1="5.5" x2="4" y2="4.9" width="0.127" layer="21"/>
<wire x1="-4" y1="-5.5" x2="-4" y2="-4.9" width="0.127" layer="21"/>
<wire x1="4" y1="-5.5" x2="4" y2="-4.9" width="0.127" layer="21"/>
<polygon width="0.127" layer="51">
<vertex x="4" y="-4.56" curve="-130"/>
<vertex x="4" y="-3.06"/>
<vertex x="4" y="-2.86" curve="140"/>
<vertex x="4" y="-4.76"/>
</polygon>
<polygon width="0.127" layer="51">
<vertex x="-4" y="-3.06" curve="-130"/>
<vertex x="-4" y="-4.56"/>
<vertex x="-4" y="-4.76" curve="140"/>
<vertex x="-4" y="-2.86"/>
</polygon>
<polygon width="0.127" layer="51">
<vertex x="-4" y="-0.52" curve="-130"/>
<vertex x="-4" y="-2.02"/>
<vertex x="-4" y="-2.22" curve="140"/>
<vertex x="-4" y="-0.32"/>
</polygon>
<polygon width="0.127" layer="51">
<vertex x="-4" y="2.02" curve="-130"/>
<vertex x="-4" y="0.52"/>
<vertex x="-4" y="0.32" curve="140"/>
<vertex x="-4" y="2.22"/>
</polygon>
<polygon width="0.127" layer="51">
<vertex x="-4" y="4.56" curve="-130"/>
<vertex x="-4" y="3.06"/>
<vertex x="-4" y="2.86" curve="140"/>
<vertex x="-4" y="4.76"/>
</polygon>
<polygon width="0.127" layer="51">
<vertex x="4" y="-2.02" curve="-130"/>
<vertex x="4" y="-0.52"/>
<vertex x="4" y="-0.32" curve="140"/>
<vertex x="4" y="-2.22"/>
</polygon>
<polygon width="0.127" layer="51">
<vertex x="4" y="0.52" curve="-130"/>
<vertex x="4" y="2.02"/>
<vertex x="4" y="2.22" curve="140"/>
<vertex x="4" y="0.32"/>
</polygon>
<polygon width="0.127" layer="51">
<vertex x="4" y="3.06" curve="-130"/>
<vertex x="4" y="4.56"/>
<vertex x="4" y="4.76" curve="140"/>
<vertex x="4" y="2.86"/>
</polygon>
<wire x1="-4" y1="4.9" x2="-4" y2="4.75" width="0.127" layer="51"/>
<wire x1="4" y1="4.9" x2="4" y2="4.75" width="0.127" layer="51"/>
<wire x1="-4" y1="-4.9" x2="-4" y2="-4.75" width="0.127" layer="51"/>
<wire x1="4" y1="-4.9" x2="4" y2="-4.75" width="0.127" layer="51"/>
<wire x1="4" y1="-2.85" x2="4" y2="-2.7" width="0.127" layer="51"/>
<wire x1="4" y1="-2.35" x2="4" y2="-2.7" width="0.127" layer="21"/>
<wire x1="4" y1="0.2" x2="4" y2="-0.2" width="0.127" layer="21"/>
<wire x1="4" y1="2.7" x2="4" y2="2.35" width="0.127" layer="21"/>
<wire x1="-4" y1="2.7" x2="-4" y2="2.35" width="0.127" layer="21"/>
<wire x1="-4" y1="0.2" x2="-4" y2="-0.2" width="0.127" layer="21"/>
<wire x1="-4" y1="-2.35" x2="-4" y2="-2.7" width="0.127" layer="21"/>
<wire x1="-4" y1="-2.7" x2="-4" y2="-2.9" width="0.127" layer="51"/>
<wire x1="-4" y1="-2.35" x2="-4" y2="-2.2" width="0.127" layer="51"/>
<wire x1="-4" y1="-0.35" x2="-4" y2="-0.2" width="0.127" layer="51"/>
<wire x1="-4" y1="0.2" x2="-4" y2="0.35" width="0.127" layer="51"/>
<wire x1="-4" y1="2.2" x2="-4" y2="2.35" width="0.127" layer="51"/>
<wire x1="-4" y1="2.7" x2="-4" y2="2.9" width="0.127" layer="51"/>
<wire x1="4" y1="2.7" x2="4" y2="2.9" width="0.127" layer="51"/>
<wire x1="4" y1="2.35" x2="4" y2="2.2" width="0.127" layer="51"/>
<wire x1="4" y1="0.2" x2="4" y2="0.35" width="0.127" layer="51"/>
<wire x1="4" y1="-0.2" x2="4" y2="-0.35" width="0.127" layer="51"/>
<wire x1="4" y1="-2.35" x2="4" y2="-2.2" width="0.127" layer="51"/>
<wire x1="-4" y1="5.5" x2="-1" y2="5.5" width="0.127" layer="21"/>
<wire x1="4" y1="5.5" x2="1" y2="5.5" width="0.127" layer="21"/>
<wire x1="-1" y1="5.5" x2="1" y2="5.5" width="0.127" layer="21" curve="180"/>
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
</packages>
<symbols>
<symbol name="BLDC">
<wire x1="-7.62" y1="12.7" x2="7.62" y2="12.7" width="0.254" layer="94"/>
<wire x1="7.62" y1="12.7" x2="7.62" y2="-12.7" width="0.254" layer="94"/>
<wire x1="7.62" y1="-12.7" x2="-7.62" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-12.7" x2="-7.62" y2="12.7" width="0.254" layer="94"/>
<text x="-7.62" y="15.24" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="13.208" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VCC" x="10.16" y="10.16" length="short" rot="R180"/>
<pin name="GND" x="10.16" y="2.54" length="short" rot="R180"/>
<pin name="HU" x="10.16" y="-5.08" length="short" rot="R180"/>
<pin name="HV" x="10.16" y="-7.62" length="short" rot="R180"/>
<pin name="HW" x="10.16" y="-10.16" length="short" rot="R180"/>
<pin name="V" x="-10.16" y="0" length="short"/>
<pin name="W" x="-10.16" y="-10.16" length="short"/>
<pin name="U" x="-10.16" y="10.16" length="short"/>
<pin name="S1" x="-2.54" y="-15.24" visible="off" length="short" rot="R90"/>
<pin name="S2" x="0" y="-15.24" visible="off" length="short" rot="R90"/>
</symbol>
<symbol name="AE-NJU72501">
<wire x1="-7.62" y1="10.16" x2="7.62" y2="10.16" width="0.254" layer="94"/>
<wire x1="7.62" y1="10.16" x2="7.62" y2="-10.16" width="0.254" layer="94"/>
<wire x1="7.62" y1="-10.16" x2="-7.62" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-10.16" x2="-7.62" y2="10.16" width="0.254" layer="94"/>
<text x="-7.62" y="10.668" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-12.7" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VO1" x="10.16" y="7.62" length="short" rot="R180"/>
<pin name="GND" x="-10.16" y="0" length="short"/>
<pin name="VIN" x="-10.16" y="7.62" length="short"/>
<pin name="DIN" x="-10.16" y="-7.62" length="short"/>
<pin name="VO2" x="10.16" y="5.08" length="short" rot="R180"/>
<pin name="EN1" x="10.16" y="-5.08" length="short" rot="R180"/>
<pin name="EN2" x="10.16" y="-7.62" length="short" rot="R180"/>
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
<deviceset name="EC45FLAT" prefix="CN">
<gates>
<gate name="G$1" symbol="BLDC" x="0" y="0"/>
</gates>
<devices>
<device name="1" package="MOTOR_COMPLEX1">
<connects>
<connect gate="G$1" pin="GND" pad="1.5 2.1"/>
<connect gate="G$1" pin="HU" pad="1.3 2.2"/>
<connect gate="G$1" pin="HV" pad="1.4 2.3"/>
<connect gate="G$1" pin="HW" pad="1.2 2.4"/>
<connect gate="G$1" pin="S1" pad="S1"/>
<connect gate="G$1" pin="S2" pad="S2"/>
<connect gate="G$1" pin="U" pad="1.10 1.11 2.5"/>
<connect gate="G$1" pin="V" pad="1.8 1.9 2.6"/>
<connect gate="G$1" pin="VCC" pad="1.1 2.8"/>
<connect gate="G$1" pin="W" pad="1.6 1.7 2.7"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2" package="MOTOR_COMPLEX2">
<connects>
<connect gate="G$1" pin="GND" pad="1.5 2.1"/>
<connect gate="G$1" pin="HU" pad="1.3 2.2"/>
<connect gate="G$1" pin="HV" pad="1.4 2.3"/>
<connect gate="G$1" pin="HW" pad="1.2 2.4"/>
<connect gate="G$1" pin="S1" pad="S1"/>
<connect gate="G$1" pin="S2" pad="S2"/>
<connect gate="G$1" pin="U" pad="1.10 1.11 2.5"/>
<connect gate="G$1" pin="V" pad="1.8 1.9 2.6"/>
<connect gate="G$1" pin="VCC" pad="1.1 2.8"/>
<connect gate="G$1" pin="W" pad="1.6 1.7 2.7"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="AE-NJU72501" prefix="U">
<gates>
<gate name="G$1" symbol="AE-NJU72501" x="0" y="0"/>
</gates>
<devices>
<device name="" package="AE-NJU72501">
<connects>
<connect gate="G$1" pin="DIN" pad="3"/>
<connect gate="G$1" pin="EN1" pad="6"/>
<connect gate="G$1" pin="EN2" pad="5"/>
<connect gate="G$1" pin="GND" pad="2 4"/>
<connect gate="G$1" pin="VIN" pad="1"/>
<connect gate="G$1" pin="VO1" pad="8"/>
<connect gate="G$1" pin="VO2" pad="7"/>
</connects>
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
</devicesets>
</library>
<library name="ic-Toshiba">
<description>Toshiba</description>
<packages>
<package name="TSSOP14">
<wire x1="2.5" y1="2.2" x2="2.5" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-2.5" y1="2.2" x2="-2.5" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-2.5" y1="2.2" x2="2.5" y2="2.2" width="0.127" layer="21"/>
<wire x1="-2.5" y1="-2.2" x2="2.5" y2="-2.2" width="0.127" layer="21"/>
<circle x="-2" y="-1.7" radius="0.25" width="0.127" layer="21"/>
<smd name="12" x="-0.65" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="10" x="0.65" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="11" x="0" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="9" x="1.3" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="1" x="-1.95" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="2" x="-1.3" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="3" x="-0.65" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="4" x="0" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="5" x="0.65" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="6" x="1.3" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="7" x="1.95" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="8" x="1.95" y="3.1" dx="0.35" dy="1.4" layer="1" rot="R180"/>
<smd name="14" x="-1.95" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="13" x="-1.3" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<text x="-1.905" y="0.635" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.905" y="-0.635" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.125" y1="-3.2" x2="0.125" y2="-2.2" layer="51"/>
<rectangle x1="-0.775" y1="-3.2" x2="-0.525" y2="-2.2" layer="51"/>
<rectangle x1="-1.425" y1="-3.2" x2="-1.175" y2="-2.2" layer="51"/>
<rectangle x1="-2.075" y1="-3.2" x2="-1.825" y2="-2.2" layer="51"/>
<rectangle x1="0.525" y1="-3.2" x2="0.775" y2="-2.2" layer="51"/>
<rectangle x1="1.175" y1="-3.2" x2="1.425" y2="-2.2" layer="51"/>
<rectangle x1="1.825" y1="-3.2" x2="2.075" y2="-2.2" layer="51"/>
<rectangle x1="-2.075" y1="2.2" x2="-1.825" y2="3.2" layer="51"/>
<rectangle x1="-1.425" y1="2.2" x2="-1.175" y2="3.2" layer="51"/>
<rectangle x1="-0.775" y1="2.2" x2="-0.525" y2="3.2" layer="51"/>
<rectangle x1="-0.125" y1="2.2" x2="0.125" y2="3.2" layer="51"/>
<rectangle x1="0.525" y1="2.2" x2="0.775" y2="3.2" layer="51"/>
<rectangle x1="1.175" y1="2.2" x2="1.425" y2="3.2" layer="51"/>
<rectangle x1="1.825" y1="2.2" x2="2.075" y2="3.2" layer="51"/>
</package>
<package name="TSSOP16">
<wire x1="2.5" y1="2.2" x2="2.5" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-2.5" y1="2.2" x2="-2.5" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-2.5" y1="2.2" x2="2.5" y2="2.2" width="0.127" layer="21"/>
<wire x1="-2.5" y1="-2.2" x2="2.5" y2="-2.2" width="0.127" layer="21"/>
<circle x="-1.95" y="-1.7" radius="0.25" width="0.127" layer="21"/>
<smd name="12" x="0.325" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="10" x="1.625" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="11" x="0.975" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="9" x="2.275" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="1" x="-2.275" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="2" x="-1.625" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="3" x="-0.975" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="4" x="-0.325" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="5" x="0.325" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="6" x="0.975" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="7" x="1.625" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="8" x="2.275" y="-3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="16" x="-2.275" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="14" x="-0.975" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="15" x="-1.625" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<smd name="13" x="-0.325" y="3.1" dx="0.35" dy="1.4" layer="1"/>
<text x="-1.905" y="0.635" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.905" y="-0.635" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-2.4" y1="-3.2" x2="-2.15" y2="-2.2" layer="51"/>
<rectangle x1="-1.75" y1="-3.2" x2="-1.5" y2="-2.2" layer="51"/>
<rectangle x1="-1.1" y1="-3.2" x2="-0.85" y2="-2.2" layer="51"/>
<rectangle x1="-0.45" y1="-3.2" x2="-0.2" y2="-2.2" layer="51"/>
<rectangle x1="0.2" y1="-3.2" x2="0.45" y2="-2.2" layer="51"/>
<rectangle x1="0.85" y1="-3.2" x2="1.1" y2="-2.2" layer="51"/>
<rectangle x1="1.5" y1="-3.2" x2="1.75" y2="-2.2" layer="51"/>
<rectangle x1="2.15" y1="-3.2" x2="2.4" y2="-2.2" layer="51"/>
<rectangle x1="-2.4" y1="2.2" x2="-2.15" y2="3.2" layer="51"/>
<rectangle x1="-1.75" y1="2.2" x2="-1.5" y2="3.2" layer="51"/>
<rectangle x1="-1.1" y1="2.2" x2="-0.85" y2="3.2" layer="51"/>
<rectangle x1="-0.45" y1="2.2" x2="-0.2" y2="3.2" layer="51"/>
<rectangle x1="0.2" y1="2.2" x2="0.45" y2="3.2" layer="51"/>
<rectangle x1="0.85" y1="2.2" x2="1.1" y2="3.2" layer="51"/>
<rectangle x1="1.5" y1="2.2" x2="1.75" y2="3.2" layer="51"/>
<rectangle x1="2.15" y1="2.2" x2="2.4" y2="3.2" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="74164">
<wire x1="-7.62" y1="15.24" x2="7.62" y2="15.24" width="0.254" layer="94"/>
<wire x1="7.62" y1="15.24" x2="7.62" y2="-12.7" width="0.254" layer="94"/>
<wire x1="7.62" y1="-12.7" x2="-7.62" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-12.7" x2="-7.62" y2="15.24" width="0.254" layer="94"/>
<text x="-7.62" y="15.748" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-15.24" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="QA" x="10.16" y="10.16" length="short" rot="R180"/>
<pin name="QB" x="10.16" y="7.62" length="short" rot="R180"/>
<pin name="QC" x="10.16" y="5.08" length="short" rot="R180"/>
<pin name="QD" x="10.16" y="2.54" length="short" rot="R180"/>
<pin name="QE" x="10.16" y="0" length="short" rot="R180"/>
<pin name="QF" x="10.16" y="-2.54" length="short" rot="R180"/>
<pin name="QG" x="10.16" y="-5.08" length="short" rot="R180"/>
<pin name="QH" x="10.16" y="-7.62" length="short" rot="R180"/>
<pin name="VCC" x="-10.16" y="12.7" length="short"/>
<pin name="GND" x="-10.16" y="5.08" length="short"/>
<pin name="B" x="-10.16" y="-10.16" length="short"/>
<pin name="!CLR" x="-10.16" y="-2.54" length="short"/>
<pin name="CK" x="-10.16" y="-5.08" length="short" function="clk"/>
<pin name="A" x="-10.16" y="-7.62" length="short"/>
</symbol>
<symbol name="74165">
<wire x1="-7.62" y1="17.78" x2="7.62" y2="17.78" width="0.254" layer="94"/>
<wire x1="7.62" y1="17.78" x2="7.62" y2="-15.24" width="0.254" layer="94"/>
<wire x1="7.62" y1="-15.24" x2="-7.62" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-15.24" x2="-7.62" y2="17.78" width="0.254" layer="94"/>
<text x="-7.62" y="18.288" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-17.78" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VCC" x="-10.16" y="15.24" length="short"/>
<pin name="GND" x="-10.16" y="7.62" length="short"/>
<pin name="SI" x="10.16" y="15.24" length="short" rot="R180"/>
<pin name="A" x="10.16" y="5.08" length="short" rot="R180"/>
<pin name="B" x="10.16" y="2.54" length="short" rot="R180"/>
<pin name="C" x="10.16" y="0" length="short" rot="R180"/>
<pin name="D" x="10.16" y="-2.54" length="short" rot="R180"/>
<pin name="E" x="10.16" y="-5.08" length="short" rot="R180"/>
<pin name="F" x="10.16" y="-7.62" length="short" rot="R180"/>
<pin name="G" x="10.16" y="-10.16" length="short" rot="R180"/>
<pin name="H" x="10.16" y="-12.7" length="short" rot="R180"/>
<pin name="S/!L" x="-10.16" y="0" length="short"/>
<pin name="CK" x="-10.16" y="-2.54" length="short" function="clk"/>
<pin name="CKINH" x="-10.16" y="-5.08" length="short" function="clk"/>
<pin name="QH" x="-10.16" y="-10.16" length="short"/>
<pin name="!QH" x="-10.16" y="-12.7" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TC74VHC164F" prefix="U">
<gates>
<gate name="G$1" symbol="74164" x="0" y="0"/>
</gates>
<devices>
<device name="T" package="TSSOP14">
<connects>
<connect gate="G$1" pin="!CLR" pad="9"/>
<connect gate="G$1" pin="A" pad="1"/>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="CK" pad="8"/>
<connect gate="G$1" pin="GND" pad="7"/>
<connect gate="G$1" pin="QA" pad="3"/>
<connect gate="G$1" pin="QB" pad="4"/>
<connect gate="G$1" pin="QC" pad="5"/>
<connect gate="G$1" pin="QD" pad="6"/>
<connect gate="G$1" pin="QE" pad="10"/>
<connect gate="G$1" pin="QF" pad="11"/>
<connect gate="G$1" pin="QG" pad="12"/>
<connect gate="G$1" pin="QH" pad="13"/>
<connect gate="G$1" pin="VCC" pad="14"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TC74VHC165F" prefix="U">
<gates>
<gate name="G$1" symbol="74165" x="0" y="0"/>
</gates>
<devices>
<device name="T" package="TSSOP16">
<connects>
<connect gate="G$1" pin="!QH" pad="7"/>
<connect gate="G$1" pin="A" pad="11"/>
<connect gate="G$1" pin="B" pad="12"/>
<connect gate="G$1" pin="C" pad="13"/>
<connect gate="G$1" pin="CK" pad="2"/>
<connect gate="G$1" pin="CKINH" pad="15"/>
<connect gate="G$1" pin="D" pad="14"/>
<connect gate="G$1" pin="E" pad="3"/>
<connect gate="G$1" pin="F" pad="4"/>
<connect gate="G$1" pin="G" pad="5"/>
<connect gate="G$1" pin="GND" pad="8"/>
<connect gate="G$1" pin="H" pad="6"/>
<connect gate="G$1" pin="QH" pad="9"/>
<connect gate="G$1" pin="S/!L" pad="1"/>
<connect gate="G$1" pin="SI" pad="10"/>
<connect gate="G$1" pin="VCC" pad="16"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-Exar">
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
</packages>
<symbols>
<symbol name="REGULATOR_EN_NR">
<wire x1="-10.16" y1="-5.08" x2="10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="5.08" x2="-10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="-10.16" y1="5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94"/>
<text x="-10.16" y="5.588" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="2.54" y="-7.62" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="IN" x="-12.7" y="2.54" length="short"/>
<pin name="EN" x="-12.7" y="-2.54" length="short"/>
<pin name="GND" x="0" y="-7.62" length="short" rot="R90"/>
<pin name="NR" x="12.7" y="-2.54" length="short" rot="R180"/>
<pin name="OUT" x="12.7" y="2.54" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SPX3819-*" prefix="U">
<gates>
<gate name="G$1" symbol="REGULATOR_EN_NR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23-5">
<connects>
<connect gate="G$1" pin="EN" pad="3"/>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="NR" pad="4"/>
<connect gate="G$1" pin="OUT" pad="5"/>
</connects>
<technologies>
<technology name="12"/>
<technology name="15"/>
<technology name="18"/>
<technology name="25"/>
<technology name="30"/>
<technology name="33"/>
<technology name="50"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-Fairchild">
<description>Fairchild</description>
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
</packages>
<symbols>
<symbol name="LOAD-SWITCH">
<wire x1="-7.62" y1="7.62" x2="7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="7.62" x2="7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-7.62" x2="7.62" y2="-7.62" width="0.254" layer="94"/>
<text x="-7.62" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-10.16" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="IN" x="-10.16" y="5.08" length="short"/>
<pin name="OUT" x="10.16" y="5.08" length="short" rot="R180"/>
<pin name="R2" x="10.16" y="-5.08" length="short" rot="R180"/>
<pin name="EN" x="-10.16" y="-5.08" length="short"/>
<pin name="R1" x="-10.16" y="0" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="FDG6323L" prefix="U">
<gates>
<gate name="G$1" symbol="LOAD-SWITCH" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SC70-6">
<connects>
<connect gate="G$1" pin="EN" pad="5"/>
<connect gate="G$1" pin="IN" pad="4"/>
<connect gate="G$1" pin="OUT" pad="2 3"/>
<connect gate="G$1" pin="R1" pad="6"/>
<connect gate="G$1" pin="R2" pad="1"/>
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
<library name="Filter">
<packages>
<package name="NFM18">
<wire x1="-0.516" y1="0.317" x2="0.516" y2="0.317" width="0.1524" layer="51"/>
<wire x1="-0.516" y1="-0.319" x2="0.516" y2="-0.319" width="0.1524" layer="51"/>
<wire x1="1.27" y1="0.5715" x2="1.27" y2="-0.5715" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-0.5715" x2="-1.27" y2="0.5715" width="0.127" layer="21"/>
<wire x1="-1.27" y1="0.5715" x2="-0.381" y2="0.5715" width="0.127" layer="21"/>
<wire x1="1.27" y1="0.5715" x2="0.381" y2="0.5715" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-0.5715" x2="-0.381" y2="-0.5715" width="0.127" layer="21"/>
<wire x1="1.27" y1="-0.5715" x2="0.381" y2="-0.5715" width="0.127" layer="21"/>
<wire x1="-0.381" y1="0.5715" x2="0.381" y2="0.5715" width="0.127" layer="51"/>
<wire x1="-0.381" y1="-0.5715" x2="0.381" y2="-0.5715" width="0.127" layer="51"/>
<smd name="1" x="-0.8" y="0" dx="0.6" dy="0.8" layer="1"/>
<smd name="2" x="0.8" y="0" dx="0.6" dy="0.8" layer="1"/>
<smd name="GND" x="0" y="0" dx="0.4" dy="1.6" layer="1"/>
<text x="-1.27" y="1.27" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="-1.905" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.8" y1="-0.4" x2="-0.5" y2="0.4" layer="51"/>
<rectangle x1="0.5" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
</package>
<package name="NFM21">
<wire x1="-0.756" y1="0.535" x2="0.756" y2="0.535" width="0.1524" layer="51"/>
<wire x1="-0.756" y1="-0.535" x2="0.756" y2="-0.535" width="0.1524" layer="51"/>
<wire x1="1.7145" y1="0.8255" x2="1.7145" y2="-0.8255" width="0.127" layer="21"/>
<wire x1="-1.7145" y1="-0.8255" x2="-1.7145" y2="0.8255" width="0.127" layer="21"/>
<wire x1="-1.7145" y1="0.8255" x2="-0.508" y2="0.8255" width="0.127" layer="21"/>
<wire x1="1.7145" y1="0.8255" x2="0.508" y2="0.8255" width="0.127" layer="21"/>
<wire x1="-1.7145" y1="-0.8255" x2="-0.508" y2="-0.8255" width="0.127" layer="21"/>
<wire x1="1.7145" y1="-0.8255" x2="0.508" y2="-0.8255" width="0.127" layer="21"/>
<wire x1="-0.508" y1="-0.8255" x2="0.508" y2="-0.8255" width="0.127" layer="51"/>
<wire x1="-0.508" y1="0.8255" x2="0.508" y2="0.8255" width="0.127" layer="51"/>
<smd name="1" x="-1.1" y="0" dx="0.8" dy="1.25" layer="1"/>
<smd name="2" x="1.1" y="0" dx="0.8" dy="1.25" layer="1"/>
<smd name="GND" x="0" y="0" dx="0.6" dy="2" layer="1"/>
<text x="-1.27" y="1.524" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="-2.286" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-1" y1="-0.625" x2="-0.7" y2="0.625" layer="51"/>
<rectangle x1="0.7" y1="-0.625" x2="1" y2="0.625" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="THRU-CAPACITOR">
<wire x1="-1.27" y1="-0.508" x2="0" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="0" y1="-0.508" x2="1.27" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="0.508" x2="1.27" y2="0.508" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-0.508" width="0.1524" layer="94"/>
<text x="-1.27" y="1.27" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="1.27" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="GND" x="0" y="-2.54" visible="off" length="point" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CT" prefix="C" uservalue="yes">
<gates>
<gate name="G$1" symbol="THRU-CAPACITOR" x="0" y="0"/>
</gates>
<devices>
<device name="1608" package="NFM18">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="GND" pad="GND"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012" package="NFM21">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="GND" pad="GND"/>
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
<package name="SC70-5">
<wire x1="-1" y1="0.625" x2="1" y2="0.625" width="0.127" layer="21"/>
<wire x1="1" y1="0.625" x2="1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="1" y1="-0.625" x2="-1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.625" x2="-1" y2="0.625" width="0.127" layer="21"/>
<smd name="5" x="-0.65" y="1.15" dx="0.3" dy="0.7" layer="1"/>
<smd name="4" x="0.65" y="1.15" dx="0.3" dy="0.7" layer="1"/>
<smd name="1" x="-0.65" y="-1.15" dx="0.3" dy="0.7" layer="1" rot="R180"/>
<smd name="2" x="0" y="-1.15" dx="0.3" dy="0.7" layer="1" rot="R180"/>
<smd name="3" x="0.65" y="-1.15" dx="0.3" dy="0.7" layer="1" rot="R180"/>
<text x="-1.524" y="-1.27" size="0.762" layer="25" font="vector" ratio="17" rot="R90">&gt;NAME</text>
<text x="2.286" y="-2.54" size="0.762" layer="27" font="vector" ratio="17" rot="R90">&gt;VALUE</text>
<rectangle x1="-1" y1="-0.625" x2="0" y2="0" layer="21"/>
<rectangle x1="0.5375" y1="0.625" x2="0.7625" y2="1.05" layer="51"/>
<rectangle x1="-0.7625" y1="0.625" x2="-0.5375" y2="1.05" layer="51"/>
<rectangle x1="-0.7625" y1="-1.05" x2="-0.5375" y2="-0.625" layer="51" rot="R180"/>
<rectangle x1="-0.1125" y1="-1.05" x2="0.1125" y2="-0.625" layer="51" rot="R180"/>
<rectangle x1="0.5375" y1="-1.05" x2="0.7625" y2="-0.625" layer="51" rot="R180"/>
</package>
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
<symbol name="TMP05_6">
<wire x1="-10.16" y1="-5.08" x2="10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="10.16" y2="7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="7.62" x2="-10.16" y2="7.62" width="0.254" layer="94"/>
<wire x1="-10.16" y1="7.62" x2="-10.16" y2="-5.08" width="0.254" layer="94"/>
<text x="-10.16" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-10.16" y="-7.62" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="FUNC" x="12.7" y="-2.54" length="short" rot="R180"/>
<pin name="VDD" x="-12.7" y="5.08" length="short"/>
<pin name="CONV/IN" x="12.7" y="0" length="short" rot="R180"/>
<pin name="OUT" x="12.7" y="5.08" length="short" rot="R180"/>
<pin name="GND" x="-12.7" y="-2.54" length="short"/>
</symbol>
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
<deviceset name="TMP0*" prefix="U">
<gates>
<gate name="G$1" symbol="TMP05_6" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SC70-5">
<connects>
<connect gate="G$1" pin="CONV/IN" pad="2"/>
<connect gate="G$1" pin="FUNC" pad="3"/>
<connect gate="G$1" pin="GND" pad="4"/>
<connect gate="G$1" pin="OUT" pad="1"/>
<connect gate="G$1" pin="VDD" pad="5"/>
</connects>
<technologies>
<technology name="5"/>
<technology name="6"/>
</technologies>
</device>
</devices>
</deviceset>
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
<part name="U2" library="ic-LT" deviceset="LT3504" device=""/>
<part name="+P1" library="supply1" deviceset="VBAT" device=""/>
<part name="D2" library="Diode" deviceset="ZENER-*" device="DO-214AC" value="SMAJ22A"/>
<part name="C2" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C3" library="Passive" deviceset="CPOL" device="S-6.3" value="100u"/>
<part name="C13" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C11" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C9" library="Passive" deviceset="C" device="3225" value="22u"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="+P2" library="supply1" deviceset="VBAT" device=""/>
<part name="D7" library="Diode" deviceset="SBD-*" device="SDO123W" value="PMEG4030ER"/>
<part name="C10" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="L1" library="Passive" deviceset="L" device="2520" value="4.7u"/>
<part name="C12" library="Passive" deviceset="C" device="1005" value="10n"/>
<part name="L4" library="Passive" deviceset="L" device="2520" value="4.7u"/>
<part name="L5" library="Passive" deviceset="L" device="2520" value="4.7u"/>
<part name="L2" library="Passive" deviceset="L" device="2520" value="3.3u"/>
<part name="L3" library="Passive" deviceset="L" device="40" value="10u"/>
<part name="D8" library="Diode" deviceset="SBD-*" device="SDO123W" value="PMEG4030ER"/>
<part name="D5" library="Diode" deviceset="SBD-*" device="SDO123W" value="PMEG4030ER"/>
<part name="D6" library="Diode" deviceset="SBD-*" device="SDO123W" value="PMEG4030ER"/>
<part name="R12" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="R9" library="Passive" deviceset="R" device="1608" value="100k"/>
<part name="R10" library="Passive" deviceset="R" device="1608" value="24k"/>
<part name="C15" library="Passive" deviceset="C" device="3225" value="100u"/>
<part name="C18" library="Passive" deviceset="C" device="3225" value="100u"/>
<part name="C17" library="Passive" deviceset="C" device="3216" value="22u"/>
<part name="C16" library="Passive" deviceset="C" device="3225" value="22u"/>
<part name="R14" library="Passive" deviceset="R" device="1608" value="3.9k"/>
<part name="R15" library="Passive" deviceset="R" device="1608" value="7.5k"/>
<part name="R20" library="Passive" deviceset="R" device="1608" value="24k"/>
<part name="R21" library="Passive" deviceset="R" device="1608" value="7.5k"/>
<part name="R18" library="Passive" deviceset="R" device="1608" value="24k"/>
<part name="R19" library="Passive" deviceset="R" device="1608" value="3.9k"/>
<part name="R16" library="Passive" deviceset="R" device="1608" value="24k"/>
<part name="R17" library="Passive" deviceset="R" device="1608" value="1.65k"/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="GND15" library="supply1" deviceset="GND" device=""/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="GND17" library="supply1" deviceset="GND" device=""/>
<part name="+P3" library="supply1" deviceset="+1V2" device=""/>
<part name="+P4" library="supply1" deviceset="+3V3" device=""/>
<part name="+P5" library="supply1" deviceset="+5V" device=""/>
<part name="+P6" library="supply1" deviceset="+12V" device=""/>
<part name="GND19" library="supply1" deviceset="GND" device=""/>
<part name="+P8" library="supply1" deviceset="VBAT" device=""/>
<part name="F2" library="Passive" deviceset="F" device="3216" value="10"/>
<part name="Q3" library="Transistor" deviceset="MOS-P-*" device="SOP8" value="Si4483ADY"/>
<part name="R23" library="Passive" deviceset="R" device="1005" value="33k"/>
<part name="Q1" library="Transistor" deviceset="MOS-N-*" device="SOT23"/>
<part name="GND21" library="supply1" deviceset="GND" device=""/>
<part name="R27" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R13" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="C14" library="Passive" deviceset="C" device="1005" value="1n"/>
<part name="P+1" library="supply1" deviceset="VCC/1" device=""/>
<part name="+P9" library="supply1" deviceset="+3V3" device=""/>
<part name="F1" library="Passive" deviceset="F" device="3216" value="15"/>
<part name="R11" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND22" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="GND23" library="supply1" deviceset="GND" device=""/>
<part name="GND24" library="supply1" deviceset="GND" device=""/>
<part name="X1" library="Oscillator" deviceset="ASDM" device="" technology="B" value="24MHz"/>
<part name="U5" library="ic-ATMEL" deviceset="AT32UC3B0512" device="-AU" value="AT32UC3B0512-AU"/>
<part name="R36" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="+P7" library="supply1" deviceset="+3V3" device=""/>
<part name="GND26" library="supply1" deviceset="GND" device=""/>
<part name="R34" library="Passive" deviceset="R" device="1005" value="22"/>
<part name="R35" library="Passive" deviceset="R" device="1005" value="22"/>
<part name="R33" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="C22" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND31" library="supply1" deviceset="GND" device=""/>
<part name="+P14" library="supply1" deviceset="+3V3" device=""/>
<part name="R32" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="+P15" library="supply1" deviceset="+3V3" device=""/>
<part name="C23" library="Passive" deviceset="C" device="1005" value="10n"/>
<part name="GND40" library="supply1" deviceset="GND" device=""/>
<part name="U9" library="ic-Xilinx" deviceset="XC6SLX9-TQ144" device=""/>
<part name="GND48" library="supply1" deviceset="GND" device=""/>
<part name="+P20" library="supply1" deviceset="+3V3" device=""/>
<part name="CN4" library="Connector" deviceset="CN-JTAG_ALTERA" device="-BOX" value="CN-JTAG_ALTERA-BOX"/>
<part name="GND49" library="supply1" deviceset="GND" device=""/>
<part name="+P21" library="supply1" deviceset="+3V3" device=""/>
<part name="R37" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="+P22" library="supply1" deviceset="+3V3" device=""/>
<part name="+P23" library="supply1" deviceset="+3V3" device=""/>
<part name="GND50" library="supply1" deviceset="GND" device=""/>
<part name="C38" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C37" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND51" library="supply1" deviceset="GND" device=""/>
<part name="+P24" library="supply1" deviceset="+3V3" device=""/>
<part name="U7" library="ic-Macronix" deviceset="MX25L6445E" device="M"/>
<part name="CN7" library="Connector" deviceset="XBEE-*" device="TH" value="XBee"/>
<part name="GND74" library="supply1" deviceset="GND" device=""/>
<part name="FB1" library="Passive" deviceset="FB" device="1608"/>
<part name="C66" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="GND47" library="supply1" deviceset="GND" device=""/>
<part name="+P40" library="supply1" deviceset="+3V3" device=""/>
<part name="CN5" library="con-Molex" deviceset="70553-0003" device="" value="Debug"/>
<part name="GND33" library="supply1" deviceset="GND" device=""/>
<part name="R53" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND38" library="supply1" deviceset="GND" device=""/>
<part name="+P10" library="supply1" deviceset="VBAT" device=""/>
<part name="CN1" library="Connector" deviceset="T-CON" device="" value="Battery"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="U1" library="ic-TI" deviceset="INA219" device="DCN"/>
<part name="C1" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="+P11" library="supply1" deviceset="+3V3" device=""/>
<part name="R4" library="Passive" deviceset="R" device="1608" value="100k"/>
<part name="R5" library="Passive" deviceset="R" device="1608" value="10k"/>
<part name="GND39" library="supply1" deviceset="GND" device=""/>
<part name="C5" library="Passive" deviceset="C" device="1005" value="10n"/>
<part name="GND41" library="supply1" deviceset="GND" device=""/>
<part name="GND75" library="supply1" deviceset="GND" device=""/>
<part name="R2" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R3" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="+P41" library="supply1" deviceset="+3V3" device=""/>
<part name="R29" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="D3" library="Diode" deviceset="SBD-*" device="SDO123W" value="PMEG4030ER"/>
<part name="C7" library="Passive" deviceset="CPOL" device="S2-8" value="330u"/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="+P42" library="supply1" deviceset="VBAT" device=""/>
<part name="F3" library="Passive" deviceset="F" device="3216" value="10"/>
<part name="Q4" library="Transistor" deviceset="MOS-P-*" device="SOP8" value="Si4483ADY"/>
<part name="R24" library="Passive" deviceset="R" device="1005" value="33k"/>
<part name="Q2" library="Transistor" deviceset="MOS-N-*" device="SOT23"/>
<part name="GND37" library="supply1" deviceset="GND" device=""/>
<part name="R28" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="P+6" library="supply1" deviceset="VCC/2" device=""/>
<part name="R30" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="D4" library="Diode" deviceset="ZENER-*" device="DO-214AC" value="SMAJ24A"/>
<part name="GND76" library="supply1" deviceset="GND" device=""/>
<part name="C4" library="Passive" deviceset="CPOL" device="S-6.3" value="100u"/>
<part name="GND77" library="supply1" deviceset="GND" device=""/>
<part name="SW1" library="Switch" deviceset="SLE*A4" device="" technology="6" value="Power"/>
<part name="CN2" library="con-Molex" deviceset="43045-0800" device="" value="Kicker"/>
<part name="GND20" library="supply1" deviceset="GND" device=""/>
<part name="CN10" library="con-Molex" deviceset="53375-0410" device="" value="Motor1"/>
<part name="GND78" library="supply1" deviceset="GND" device=""/>
<part name="GND80" library="supply1" deviceset="GND" device=""/>
<part name="CN12" library="con-Molex" deviceset="53375-0410" device="" value="Motor2"/>
<part name="GND81" library="supply1" deviceset="GND" device=""/>
<part name="CN14" library="con-Molex" deviceset="53375-0410" device="" value="Motor3"/>
<part name="CN16" library="con-Molex" deviceset="53375-0410" device="" value="Motor4"/>
<part name="BZ1" library="Speaker" deviceset="PKLCS1212E*" device="" technology="4001"/>
<part name="GND84" library="supply1" deviceset="GND" device=""/>
<part name="GND30" library="supply1" deviceset="GND" device=""/>
<part name="+P16" library="supply1" deviceset="+1V2" device=""/>
<part name="+P17" library="supply1" deviceset="+3V3" device=""/>
<part name="+P18" library="supply1" deviceset="+3V3" device=""/>
<part name="+P19" library="supply1" deviceset="+3V3" device=""/>
<part name="GND42" library="supply1" deviceset="GND" device=""/>
<part name="C44" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C46" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C48" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C50" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C52" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND43" library="supply1" deviceset="GND" device=""/>
<part name="GND44" library="supply1" deviceset="GND" device=""/>
<part name="C41" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C43" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C45" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C47" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C49" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C51" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND45" library="supply1" deviceset="GND" device=""/>
<part name="C53" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C54" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C57" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C59" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C61" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND46" library="supply1" deviceset="GND" device=""/>
<part name="C26" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C31" library="Passive" deviceset="C" device="2012" value="22u"/>
<part name="+P12" library="supply1" deviceset="+3V3" device=""/>
<part name="+P13" library="supply1" deviceset="+3V3" device=""/>
<part name="GND27" library="supply1" deviceset="GND" device=""/>
<part name="GND28" library="supply1" deviceset="GND" device=""/>
<part name="C27" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C29" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C32" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C34" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND32" library="supply1" deviceset="GND" device=""/>
<part name="C28" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C30" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C33" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C35" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND29" library="supply1" deviceset="GND" device=""/>
<part name="C95" library="Passive" deviceset="CPOL" device="3.5-8" value="220u"/>
<part name="R66" library="Passive" deviceset="R" device="1608" value="33k"/>
<part name="C89" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C90" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C91" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="R68" library="Passive" deviceset="R" device="3216" value="5m"/>
<part name="R69" library="Passive" deviceset="R" device="3216" value="5m"/>
<part name="U18" library="ic-TI" deviceset="INA21*" device="" technology="4" value="INA214">
<attribute name="GAIN" value="500"/>
</part>
<part name="GND61" library="supply1" deviceset="GND" device=""/>
<part name="C96" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="U19" library="ic-TI" deviceset="INA21*" device="" technology="4" value="INA214">
<attribute name="GAIN" value="500"/>
</part>
<part name="GND62" library="supply1" deviceset="GND" device=""/>
<part name="C97" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="U17" library="ic-TI" deviceset="DRV8332" device=""/>
<part name="GND64" library="supply1" deviceset="GND" device=""/>
<part name="R67" library="Passive" deviceset="R" device="1005" value="1"/>
<part name="GND65" library="supply1" deviceset="GND" device=""/>
<part name="C87" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C94" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="GND66" library="supply1" deviceset="GND" device=""/>
<part name="C93" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C92" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C84" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C85" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C86" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C88" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="GND67" library="supply1" deviceset="GND" device=""/>
<part name="C83" library="Passive" deviceset="CPOL" device="2.5-6.3" value="100u"/>
<part name="P+4" library="supply1" deviceset="VCC/1" device=""/>
<part name="+P29" library="supply1" deviceset="+12V" device=""/>
<part name="RA4" library="Passive" deviceset="RA4" device="" value="51"/>
<part name="RA5" library="Passive" deviceset="RA4" device="" value="51"/>
<part name="C80" library="Passive" deviceset="CPOL" device="3.5-8" value="220u"/>
<part name="R62" library="Passive" deviceset="R" device="1608" value="33k"/>
<part name="C74" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C75" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C76" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="R65" library="Passive" deviceset="R" device="3216" value="5m"/>
<part name="R64" library="Passive" deviceset="R" device="3216" value="5m"/>
<part name="U16" library="ic-TI" deviceset="INA21*" device="" technology="4" value="INA214">
<attribute name="GAIN" value="500"/>
</part>
<part name="GND25" library="supply1" deviceset="GND" device=""/>
<part name="C82" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="U15" library="ic-TI" deviceset="INA21*" device="" technology="4" value="INA214">
<attribute name="GAIN" value="500"/>
</part>
<part name="GND55" library="supply1" deviceset="GND" device=""/>
<part name="C81" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="U14" library="ic-TI" deviceset="DRV8332" device=""/>
<part name="GND57" library="supply1" deviceset="GND" device=""/>
<part name="R63" library="Passive" deviceset="R" device="1005" value="1"/>
<part name="GND58" library="supply1" deviceset="GND" device=""/>
<part name="C72" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C79" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="GND59" library="supply1" deviceset="GND" device=""/>
<part name="C78" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C77" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C69" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C70" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C71" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C73" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="GND60" library="supply1" deviceset="GND" device=""/>
<part name="C68" library="Passive" deviceset="CPOL" device="2.5-6.3" value="100u"/>
<part name="P+3" library="supply1" deviceset="VCC/1" device=""/>
<part name="+P27" library="supply1" deviceset="+12V" device=""/>
<part name="RA2" library="Passive" deviceset="RA4" device="" value="51"/>
<part name="RA3" library="Passive" deviceset="RA4" device="" value="51"/>
<part name="C136" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="R101" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="C135" library="Passive" deviceset="C" device="2012" value="22u"/>
<part name="C139" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="+P38" library="supply1" deviceset="+3V3" device=""/>
<part name="R103" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="C134" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="CN3" library="con-Hirose" deviceset="UX60S" device="C-MB-5ST"/>
<part name="+P25" library="supply1" deviceset="+3V3" device=""/>
<part name="U6" library="ic-Vishay" deviceset="TFBS4650" device=""/>
<part name="C36" library="Passive" deviceset="C" device="1608" value="10u"/>
<part name="+P50" library="supply1" deviceset="+3V3" device=""/>
<part name="GND53" library="supply1" deviceset="GND" device=""/>
<part name="CN17" library="Connector" deviceset="PIN1X8" device="" value="Dribble"/>
<part name="C110" library="Passive" deviceset="CPOL" device="3.5-8" value="220u"/>
<part name="R70" library="Passive" deviceset="R" device="1608" value="33k"/>
<part name="C104" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C105" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C106" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="R73" library="Passive" deviceset="R" device="3216" value="5m"/>
<part name="R72" library="Passive" deviceset="R" device="3216" value="5m"/>
<part name="U22" library="ic-TI" deviceset="INA21*" device="" technology="4" value="INA214">
<attribute name="GAIN" value="500"/>
</part>
<part name="GND85" library="supply1" deviceset="GND" device=""/>
<part name="C112" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="U21" library="ic-TI" deviceset="INA21*" device="" technology="4" value="INA214">
<attribute name="GAIN" value="500"/>
</part>
<part name="GND86" library="supply1" deviceset="GND" device=""/>
<part name="C111" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="U20" library="ic-TI" deviceset="DRV8332" device=""/>
<part name="GND88" library="supply1" deviceset="GND" device=""/>
<part name="R71" library="Passive" deviceset="R" device="1005" value="1"/>
<part name="GND89" library="supply1" deviceset="GND" device=""/>
<part name="C102" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C109" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="GND90" library="supply1" deviceset="GND" device=""/>
<part name="C108" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C107" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C99" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C100" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C101" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C103" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="GND91" library="supply1" deviceset="GND" device=""/>
<part name="C98" library="Passive" deviceset="CPOL" device="2.5-6.3" value="100u"/>
<part name="+P51" library="supply1" deviceset="+12V" device=""/>
<part name="RA6" library="Passive" deviceset="RA4" device="" value="51"/>
<part name="RA7" library="Passive" deviceset="RA4" device="" value="51"/>
<part name="C125" library="Passive" deviceset="CPOL" device="3.5-8" value="220u"/>
<part name="R74" library="Passive" deviceset="R" device="1608" value="33k"/>
<part name="C119" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C120" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C121" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="R76" library="Passive" deviceset="R" device="3216" value="5m"/>
<part name="R77" library="Passive" deviceset="R" device="3216" value="5m"/>
<part name="U24" library="ic-TI" deviceset="INA21*" device="" technology="4" value="INA214">
<attribute name="GAIN" value="500"/>
</part>
<part name="GND95" library="supply1" deviceset="GND" device=""/>
<part name="C126" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="U25" library="ic-TI" deviceset="INA21*" device="" technology="4" value="INA214">
<attribute name="GAIN" value="500"/>
</part>
<part name="GND96" library="supply1" deviceset="GND" device=""/>
<part name="C127" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="U23" library="ic-TI" deviceset="DRV8332" device=""/>
<part name="GND98" library="supply1" deviceset="GND" device=""/>
<part name="R75" library="Passive" deviceset="R" device="1005" value="1"/>
<part name="GND99" library="supply1" deviceset="GND" device=""/>
<part name="C117" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C124" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="GND100" library="supply1" deviceset="GND" device=""/>
<part name="C123" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C122" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C114" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C115" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C116" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C118" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="GND101" library="supply1" deviceset="GND" device=""/>
<part name="C113" library="Passive" deviceset="CPOL" device="2.5-6.3" value="100u"/>
<part name="+P57" library="supply1" deviceset="+12V" device=""/>
<part name="RA8" library="Passive" deviceset="RA4" device="" value="51"/>
<part name="RA9" library="Passive" deviceset="RA4" device="" value="51"/>
<part name="C161" library="Passive" deviceset="CPOL" device="3.5-8" value="220u"/>
<part name="R117" library="Passive" deviceset="R" device="1608" value="33k"/>
<part name="C155" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C156" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C157" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="U37" library="ic-TI" deviceset="DRV8332" device=""/>
<part name="C153" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C160" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="GND110" library="supply1" deviceset="GND" device=""/>
<part name="C159" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C158" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="C150" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C151" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C152" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="C154" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="GND111" library="supply1" deviceset="GND" device=""/>
<part name="C149" library="Passive" deviceset="CPOL" device="2.5-6.3" value="100u"/>
<part name="+P63" library="supply1" deviceset="+12V" device=""/>
<part name="RA10" library="Passive" deviceset="RA4" device="" value="51"/>
<part name="RA11" library="Passive" deviceset="RA4" device="" value="51"/>
<part name="GND106" library="supply1" deviceset="GND" device=""/>
<part name="C132" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="+P68" library="supply1" deviceset="+3V3" device=""/>
<part name="P+2" library="supply1" deviceset="VCC/2" device=""/>
<part name="P+5" library="supply1" deviceset="VCC/2" device=""/>
<part name="P+7" library="supply1" deviceset="VCC/2" device=""/>
<part name="U28" library="ic-AD" deviceset="ADR504*" device="" technology="1"/>
<part name="+P70" library="supply1" deviceset="+5V" device=""/>
<part name="+P71" library="supply1" deviceset="+3V3" device=""/>
<part name="GND35" library="supply1" deviceset="GND" device=""/>
<part name="R100" library="Passive" deviceset="R" device="1608" value="3.9k"/>
<part name="+P32" library="supply1" deviceset="+5V" device=""/>
<part name="C128" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="GND63" library="supply1" deviceset="GND" device=""/>
<part name="C129" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="GND68" library="supply1" deviceset="GND" device=""/>
<part name="U29" library="ic-TI" deviceset="ADS7950RGE" device=""/>
<part name="CN9" library="ProjectOnly" deviceset="EC45FLAT" device="2" value="EC45FLAT2"/>
<part name="GND69" library="supply1" deviceset="GND" device=""/>
<part name="CN11" library="ProjectOnly" deviceset="EC45FLAT" device="2" value="EC45FLAT2"/>
<part name="GND70" library="supply1" deviceset="GND" device=""/>
<part name="U26" library="ic-Toshiba" deviceset="TC74VHC165F" device="T"/>
<part name="GND71" library="supply1" deviceset="GND" device=""/>
<part name="CN13" library="ProjectOnly" deviceset="EC45FLAT" device="2" value="EC45FLAT2"/>
<part name="GND72" library="supply1" deviceset="GND" device=""/>
<part name="GND73" library="supply1" deviceset="GND" device=""/>
<part name="CN15" library="ProjectOnly" deviceset="EC45FLAT" device="2" value="EC45FLAT2"/>
<part name="GND79" library="supply1" deviceset="GND" device=""/>
<part name="GND83" library="supply1" deviceset="GND" device=""/>
<part name="GND87" library="supply1" deviceset="GND" device=""/>
<part name="GND92" library="supply1" deviceset="GND" device=""/>
<part name="GND94" library="supply1" deviceset="GND" device=""/>
<part name="U27" library="ic-Toshiba" deviceset="TC74VHC165F" device="T"/>
<part name="GND56" library="supply1" deviceset="GND" device=""/>
<part name="GND97" library="supply1" deviceset="GND" device=""/>
<part name="GND102" library="supply1" deviceset="GND" device=""/>
<part name="+P37" library="supply1" deviceset="+3V3" device=""/>
<part name="C133" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND104" library="supply1" deviceset="GND" device=""/>
<part name="GND107" library="supply1" deviceset="GND" device=""/>
<part name="U3" library="ic-Exar" deviceset="SPX3819-*" device="" technology="50"/>
<part name="C19" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="GND113" library="supply1" deviceset="GND" device=""/>
<part name="GND115" library="supply1" deviceset="GND" device=""/>
<part name="C20" library="Passive" deviceset="C" device="1005" value="10n"/>
<part name="GND116" library="supply1" deviceset="GND" device=""/>
<part name="C21" library="Passive" deviceset="C" device="3216" value="22u"/>
<part name="GND117" library="supply1" deviceset="GND" device=""/>
<part name="R22" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND118" library="supply1" deviceset="GND" device=""/>
<part name="C137" library="Passive" deviceset="C" device="2012" value="22u"/>
<part name="GND119" library="supply1" deviceset="GND" device=""/>
<part name="C138" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="R102" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="GND120" library="supply1" deviceset="GND" device=""/>
<part name="R118" library="Passive" deviceset="R" device="1005" value="1"/>
<part name="GND109" library="supply1" deviceset="GND" device=""/>
<part name="R119" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R120" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R121" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="C144" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="R107" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="C143" library="Passive" deviceset="C" device="2012" value="22u"/>
<part name="C147" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="+P26" library="supply1" deviceset="+3V3" device=""/>
<part name="R109" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="C142" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="U32" library="ic-AD" deviceset="ADR504*" device="" technology="1"/>
<part name="+P28" library="supply1" deviceset="+5V" device=""/>
<part name="+P30" library="supply1" deviceset="+3V3" device=""/>
<part name="GND112" library="supply1" deviceset="GND" device=""/>
<part name="R106" library="Passive" deviceset="R" device="1608" value="3.9k"/>
<part name="+P31" library="supply1" deviceset="+5V" device=""/>
<part name="U33" library="ic-TI" deviceset="ADS7950RGE" device=""/>
<part name="GND114" library="supply1" deviceset="GND" device=""/>
<part name="GND121" library="supply1" deviceset="GND" device=""/>
<part name="GND122" library="supply1" deviceset="GND" device=""/>
<part name="GND123" library="supply1" deviceset="GND" device=""/>
<part name="C145" library="Passive" deviceset="C" device="2012" value="22u"/>
<part name="GND124" library="supply1" deviceset="GND" device=""/>
<part name="C146" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="R108" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="GND125" library="supply1" deviceset="GND" device=""/>
<part name="C130" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="GND126" library="supply1" deviceset="GND" device=""/>
<part name="C131" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="GND127" library="supply1" deviceset="GND" device=""/>
<part name="GND34" library="supply1" deviceset="GND" device=""/>
<part name="GND82" library="supply1" deviceset="GND" device=""/>
<part name="GND93" library="supply1" deviceset="GND" device=""/>
<part name="C140" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="+P53" library="supply1" deviceset="+3V3" device=""/>
<part name="U30" library="ic-Toshiba" deviceset="TC74VHC165F" device="T"/>
<part name="U31" library="ic-Toshiba" deviceset="TC74VHC165F" device="T"/>
<part name="GND103" library="supply1" deviceset="GND" device=""/>
<part name="GND128" library="supply1" deviceset="GND" device=""/>
<part name="GND129" library="supply1" deviceset="GND" device=""/>
<part name="+P54" library="supply1" deviceset="+3V3" device=""/>
<part name="C141" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND130" library="supply1" deviceset="GND" device=""/>
<part name="GND131" library="supply1" deviceset="GND" device=""/>
<part name="+P55" library="supply1" deviceset="+3V3" device=""/>
<part name="GND132" library="supply1" deviceset="GND" device=""/>
<part name="C162" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND108" library="supply1" deviceset="GND" device=""/>
<part name="U36" library="ic-TI" deviceset="INA219" device="DCN"/>
<part name="R114" library="Passive" deviceset="R" device="3216" value="5m"/>
<part name="C148" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND105" library="supply1" deviceset="GND" device=""/>
<part name="+P64" library="supply1" deviceset="+3V3" device=""/>
<part name="GND142" library="supply1" deviceset="GND" device=""/>
<part name="R115" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R116" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="+P73" library="supply1" deviceset="+3V3" device=""/>
<part name="CN8" library="con-Molex" deviceset="53375-0410" device="" value="Ball Sensor"/>
<part name="R56" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="+P74" library="supply1" deviceset="+3V3" device=""/>
<part name="GND143" library="supply1" deviceset="GND" device=""/>
<part name="VR1" library="Passive" deviceset="VR" device="" value="500"/>
<part name="+P76" library="supply1" deviceset="+3V3" device=""/>
<part name="R58" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="R59" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="C67" library="Passive" deviceset="C" device="2012" value="22u"/>
<part name="GND144" library="supply1" deviceset="GND" device=""/>
<part name="+P77" library="supply1" deviceset="+5V/2" device=""/>
<part name="+P78" library="supply1" deviceset="+5V" device=""/>
<part name="RF3" library="Passive" deviceset="RF" device="2012" value="200m"/>
<part name="+P33" library="supply1" deviceset="+5V/2" device=""/>
<part name="+P34" library="supply1" deviceset="+5V/2" device=""/>
<part name="+P44" library="supply1" deviceset="+5V/2" device=""/>
<part name="+P45" library="supply1" deviceset="+5V/2" device=""/>
<part name="+P46" library="supply1" deviceset="+5V/2" device=""/>
<part name="+P47" library="supply1" deviceset="+5V/2" device=""/>
<part name="RF4" library="Passive" deviceset="RF" device="2012" value="200m"/>
<part name="+P79" library="supply1" deviceset="+5V/3" device=""/>
<part name="+P35" library="supply1" deviceset="+5V/3" device=""/>
<part name="+P36" library="supply1" deviceset="+5V/3" device=""/>
<part name="+P39" library="supply1" deviceset="+5V/3" device=""/>
<part name="+P43" library="supply1" deviceset="+5V/3" device=""/>
<part name="+P48" library="supply1" deviceset="+5V/3" device=""/>
<part name="+P52" library="supply1" deviceset="+5V/3" device=""/>
<part name="+P81" library="supply1" deviceset="+5V/3" device=""/>
<part name="+P65" library="supply1" deviceset="+5V/3" device=""/>
<part name="U34" library="ic-Fairchild" deviceset="FDG6323L" device=""/>
<part name="GND145" library="supply1" deviceset="GND" device=""/>
<part name="R111" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R110" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND146" library="supply1" deviceset="GND" device=""/>
<part name="+P67" library="supply1" deviceset="+5V" device=""/>
<part name="U35" library="ic-Fairchild" deviceset="FDG6323L" device=""/>
<part name="GND147" library="supply1" deviceset="GND" device=""/>
<part name="R113" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R112" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND148" library="supply1" deviceset="GND" device=""/>
<part name="+P75" library="supply1" deviceset="+5V" device=""/>
<part name="RF1" library="Passive" deviceset="RF" device="2012" value="200m"/>
<part name="U12" library="ic-Fairchild" deviceset="FDG6323L" device=""/>
<part name="GND149" library="supply1" deviceset="GND" device=""/>
<part name="R61" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R60" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND150" library="supply1" deviceset="GND" device=""/>
<part name="RF2" library="Passive" deviceset="RF" device="2012" value="200m"/>
<part name="+P80" library="supply1" deviceset="+3V3" device=""/>
<part name="R57" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="R54" library="Passive" deviceset="R" device="1608" value="3.9k"/>
<part name="R55" library="Passive" deviceset="R" device="1608" value="3.9k"/>
<part name="J1" library="Connector" deviceset="PIN2X5-2.0" device="" value="Setting"/>
<part name="GND151" library="supply1" deviceset="GND" device=""/>
<part name="U11" library="ic-Toshiba" deviceset="TC74VHC164F" device="T"/>
<part name="C64" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="+P82" library="supply1" deviceset="+3V3" device=""/>
<part name="GND153" library="supply1" deviceset="GND" device=""/>
<part name="+P83" library="supply1" deviceset="+3V3" device=""/>
<part name="LED10" library="Opto" deviceset="LED" device="1608"/>
<part name="LED9" library="Opto" deviceset="LED" device="1608"/>
<part name="LED8" library="Opto" deviceset="LED" device="1608"/>
<part name="LED4" library="Opto" deviceset="LED" device="1608"/>
<part name="R52" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="R51" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="R50" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="R46" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="LED7" library="Opto" deviceset="LED" device="1608"/>
<part name="LED6" library="Opto" deviceset="LED" device="1608"/>
<part name="LED5" library="Opto" deviceset="LED" device="1608"/>
<part name="R49" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="R48" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="R47" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="U13" library="ProjectOnly" deviceset="AE-NJU72501" device=""/>
<part name="+P49" library="supply1" deviceset="+3V3" device=""/>
<part name="+P84" library="supply1" deviceset="+3V3" device=""/>
<part name="GND154" library="supply1" deviceset="GND" device=""/>
<part name="C65" library="Passive" deviceset="C" device="1005" value="1n"/>
<part name="R45" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND160" library="supply1" deviceset="GND" device=""/>
<part name="C62" library="Filter" deviceset="CT" device="1608" value="100n"/>
<part name="C60" library="Filter" deviceset="CT" device="1608" value="100n"/>
<part name="C58" library="Filter" deviceset="CT" device="1608" value="100n"/>
<part name="C56" library="Filter" deviceset="CT" device="1608" value="100n"/>
<part name="C55" library="Filter" deviceset="CT" device="1608" value="100n"/>
<part name="C39" library="Passive" deviceset="C" device="1005" value="1n"/>
<part name="C40" library="Passive" deviceset="C" device="1005" value="1n"/>
<part name="C63" library="Passive" deviceset="C" device="3225" value="100u"/>
<part name="GND161" library="supply1" deviceset="GND" device=""/>
<part name="C42" library="Passive" deviceset="C" device="3225" value="100u"/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="R8" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="C8" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="SW2" library="Switch" deviceset="EVQ-?" device="P2-RECTANGLE"/>
<part name="SW3" library="Switch" deviceset="EVQ-?" device="P2-RECTANGLE"/>
<part name="GND36" library="supply1" deviceset="GND" device=""/>
<part name="R44" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND54" library="supply1" deviceset="GND" device=""/>
<part name="U38" library="ic-AD" deviceset="TMP0*" device="" technology="5"/>
<part name="+P58" library="supply1" deviceset="+3V3" device=""/>
<part name="GND134" library="supply1" deviceset="GND" device=""/>
<part name="C164" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="U40" library="ic-AD" deviceset="TMP0*" device="" technology="5"/>
<part name="+P59" library="supply1" deviceset="+3V3" device=""/>
<part name="GND135" library="supply1" deviceset="GND" device=""/>
<part name="C165" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="U41" library="ic-AD" deviceset="TMP0*" device="" technology="5"/>
<part name="RA1" library="Passive" deviceset="RA4" device="" value="51"/>
<part name="R39" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="U8" library="ic-TI" deviceset="1G08" device="DCK"/>
<part name="U10" library="ic-TI" deviceset="1G08" device="DCK"/>
<part name="R1" library="ProjectOnly" deviceset="FC4L" device="" value="2m"/>
<part name="D1" library="Diode" deviceset="ZENER-*" device="DO-214AC" value="SMAJ22A"/>
<part name="GND136" library="supply1" deviceset="GND" device=""/>
<part name="R38" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="R31" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="C25" library="Passive" deviceset="C" device="1005" value="1n"/>
<part name="LED1" library="Opto" deviceset="LED" device="1608"/>
<part name="LED2" library="Opto" deviceset="LED" device="1608"/>
<part name="R40" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="R41" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="GND137" library="supply1" deviceset="GND" device=""/>
<part name="GND138" library="supply1" deviceset="GND" device=""/>
<part name="+P85" library="supply1" deviceset="VBAT" device=""/>
<part name="R6" library="Passive" deviceset="R" device="1608" value="100k"/>
<part name="R7" library="Passive" deviceset="R" device="1608" value="10k"/>
<part name="GND156" library="supply1" deviceset="GND" device=""/>
<part name="C6" library="Passive" deviceset="C" device="1005" value="10n"/>
<part name="GND157" library="supply1" deviceset="GND" device=""/>
<part name="+P86" library="supply1" deviceset="+12V" device=""/>
<part name="U39" library="ic-Microchip" deviceset="MCP970*" device="/LT" technology="1"/>
<part name="+P69" library="supply1" deviceset="+3V3" device=""/>
<part name="GND140" library="supply1" deviceset="GND" device=""/>
<part name="C163" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="R42" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="LED3" library="Opto" deviceset="LED" device="1608"/>
<part name="+P56" library="supply1" deviceset="+3V3" device=""/>
<part name="LOGO1" library="ProjectOnly" deviceset="LOGO-876_SMALL" device=""/>
<part name="R99" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R98" library="Passive" deviceset="R" device="1005" value="33k"/>
<part name="P+8" library="supply1" deviceset="VCC/1" device=""/>
<part name="GND18" library="supply1" deviceset="GND" device=""/>
<part name="R104" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R105" library="Passive" deviceset="R" device="1005" value="33k"/>
<part name="GND133" library="supply1" deviceset="GND" device=""/>
<part name="P+9" library="supply1" deviceset="VCC/2" device=""/>
<part name="GND139" library="supply1" deviceset="GND" device=""/>
<part name="GND141" library="supply1" deviceset="GND" device=""/>
<part name="GND155" library="supply1" deviceset="GND" device=""/>
<part name="R80" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R81" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R82" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R78" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R79" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="GND159" library="supply1" deviceset="GND" device=""/>
<part name="GND162" library="supply1" deviceset="GND" device=""/>
<part name="R85" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R86" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R87" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="GND163" library="supply1" deviceset="GND" device=""/>
<part name="R83" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R84" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="GND164" library="supply1" deviceset="GND" device=""/>
<part name="R90" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R91" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R92" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="GND165" library="supply1" deviceset="GND" device=""/>
<part name="R88" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R89" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="GND166" library="supply1" deviceset="GND" device=""/>
<part name="R95" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R96" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R97" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="GND167" library="supply1" deviceset="GND" device=""/>
<part name="R93" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="R94" library="Passive" deviceset="R" device="1005" value="100k"/>
<part name="GND168" library="supply1" deviceset="GND" device=""/>
<part name="U4" library="ic-TI" deviceset="TPD2S017" device="" value="IP4234CZ6"/>
<part name="GND169" library="supply1" deviceset="GND" device=""/>
<part name="R25" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="R26" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="C166" library="Passive" deviceset="C" device="1005" value="10n"/>
<part name="C167" library="Passive" deviceset="C" device="1005" value="10n"/>
<part name="R122" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="R123" library="Passive" deviceset="R" device="1005" value="1k"/>
<part name="CN6" library="Connector" deviceset="PIN1X8" device="" value="External SPI 1"/>
<part name="+P60" library="supply1" deviceset="+3V3" device=""/>
<part name="GND152" library="supply1" deviceset="GND" device=""/>
<part name="P1" library="ic-package" deviceset="PAD" device="" value="TCK"/>
<part name="P2" library="ic-package" deviceset="PAD" device="" value="TDI"/>
<part name="P3" library="ic-package" deviceset="PAD" device="" value="TDO"/>
<part name="P4" library="ic-package" deviceset="PAD" device="" value="TMS"/>
<part name="CN18" library="Connector" deviceset="PIN2X4" device="" value="External SPI 2"/>
<part name="GND158" library="supply1" deviceset="GND" device=""/>
<part name="+P61" library="supply1" deviceset="+3V3" device=""/>
<part name="+P62" library="supply1" deviceset="+3V3" device=""/>
</parts>
<sheets>
<sheet>
<description>Power Supply</description>
<plain>
<wire x1="0" y1="0" x2="38.1" y2="0" width="0.1524" layer="97"/>
<wire x1="38.1" y1="0" x2="58.42" y2="0" width="0.1524" layer="97"/>
<wire x1="58.42" y1="0" x2="83.82" y2="0" width="0.1524" layer="97"/>
<wire x1="0" y1="0" x2="0" y2="7.62" width="0.1524" layer="97"/>
<wire x1="0" y1="7.62" x2="0" y2="190.5" width="0.1524" layer="97"/>
<wire x1="83.82" y1="0" x2="279.4" y2="0" width="0.1524" layer="97"/>
<text x="243.84" y="81.28" size="1.778" layer="97">コンデンサの充電器へ</text>
<text x="190.5" y="43.18" size="1.778" layer="97">モーター1,2へ</text>
<text x="160.02" y="175.26" size="1.778" layer="97">FPGA用</text>
<text x="160.02" y="91.44" size="1.778" layer="97">各種ロジック</text>
<text x="205.74" y="127" size="1.778" layer="97">ホールセンサー・アナログ系</text>
<text x="160.02" y="149.86" size="1.778" layer="97">モータードライバー</text>
<text x="256.54" y="43.18" size="1.778" layer="97">モーター3,4,5へ</text>
<text x="2.54" y="5.08" size="1.778" layer="97" font="vector" align="center-left">KIKS2013</text>
<text x="2.54" y="2.54" size="1.778" layer="97" font="vector" align="center-left">Gen.5's Base Board</text>
<wire x1="0" y1="7.62" x2="38.1" y2="7.62" width="0.1524" layer="97"/>
<wire x1="38.1" y1="7.62" x2="38.1" y2="0" width="0.1524" layer="97"/>
<wire x1="38.1" y1="7.62" x2="58.42" y2="7.62" width="0.1524" layer="97"/>
<wire x1="58.42" y1="7.62" x2="83.82" y2="7.62" width="0.1524" layer="97"/>
<wire x1="83.82" y1="7.62" x2="83.82" y2="0" width="0.1524" layer="97"/>
<text x="60.96" y="2.54" size="1.778" layer="97" font="vector" align="center-left">FUJII NAOMICHI</text>
<text x="60.96" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Designed by</text>
<text x="40.64" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Date</text>
<text x="40.64" y="2.54" size="1.778" layer="97" font="vector" align="center-left">2012/09/23</text>
<wire x1="58.42" y1="0" x2="58.42" y2="7.62" width="0.1524" layer="97"/>
<wire x1="279.4" y1="190.5" x2="279.4" y2="0" width="0.1524" layer="97"/>
<wire x1="0" y1="190.5" x2="279.4" y2="190.5" width="0.1524" layer="97"/>
<wire x1="40.64" y1="187.96" x2="162.56" y2="187.96" width="0.508" layer="102"/>
<wire x1="162.56" y1="187.96" x2="162.56" y2="76.2" width="0.508" layer="102"/>
<wire x1="162.56" y1="76.2" x2="58.42" y2="76.2" width="0.508" layer="102"/>
<wire x1="58.42" y1="76.2" x2="58.42" y2="104.14" width="0.508" layer="102"/>
<wire x1="58.42" y1="104.14" x2="40.64" y2="104.14" width="0.508" layer="102"/>
<wire x1="40.64" y1="104.14" x2="40.64" y2="187.96" width="0.508" layer="102"/>
<wire x1="27.94" y1="101.6" x2="55.88" y2="101.6" width="0.508" layer="102"/>
<wire x1="55.88" y1="101.6" x2="55.88" y2="73.66" width="0.508" layer="102"/>
<wire x1="55.88" y1="73.66" x2="165.1" y2="73.66" width="0.508" layer="102"/>
<wire x1="165.1" y1="73.66" x2="165.1" y2="187.96" width="0.508" layer="102"/>
<wire x1="276.86" y1="93.98" x2="195.58" y2="93.98" width="0.508" layer="102"/>
<wire x1="195.58" y1="93.98" x2="195.58" y2="68.58" width="0.508" layer="102"/>
<wire x1="195.58" y1="68.58" x2="27.94" y2="68.58" width="0.508" layer="102"/>
<wire x1="27.94" y1="68.58" x2="27.94" y2="101.6" width="0.508" layer="102"/>
<wire x1="38.1" y1="104.14" x2="38.1" y2="187.96" width="0.508" layer="102"/>
<wire x1="38.1" y1="187.96" x2="2.54" y2="187.96" width="0.508" layer="102"/>
<wire x1="2.54" y1="187.96" x2="2.54" y2="45.72" width="0.508" layer="102"/>
<wire x1="38.1" y1="104.14" x2="25.4" y2="104.14" width="0.508" layer="102"/>
<wire x1="25.4" y1="104.14" x2="25.4" y2="66.04" width="0.508" layer="102"/>
<wire x1="25.4" y1="66.04" x2="53.34" y2="66.04" width="0.508" layer="102"/>
<wire x1="53.34" y1="66.04" x2="66.04" y2="66.04" width="0.508" layer="102"/>
<wire x1="66.04" y1="66.04" x2="200.66" y2="66.04" width="0.508" layer="102"/>
<wire x1="200.66" y1="66.04" x2="200.66" y2="88.9" width="0.508" layer="102"/>
<wire x1="276.86" y1="88.9" x2="276.86" y2="2.54" width="0.508" layer="102"/>
<wire x1="276.86" y1="2.54" x2="127" y2="2.54" width="0.508" layer="102"/>
<wire x1="127" y1="2.54" x2="127" y2="45.72" width="0.508" layer="102"/>
<wire x1="127" y1="45.72" x2="2.54" y2="45.72" width="0.508" layer="102"/>
<wire x1="53.34" y1="55.88" x2="66.04" y2="66.04" width="0.508" layer="102"/>
<wire x1="53.34" y1="66.04" x2="66.04" y2="55.88" width="0.508" layer="102"/>
<wire x1="35.56" y1="43.18" x2="91.44" y2="12.7" width="0.508" layer="102"/>
<wire x1="91.44" y1="43.18" x2="35.56" y2="12.7" width="0.508" layer="102"/>
<text x="45.72" y="182.88" size="5.08" layer="102" align="center">①</text>
<text x="271.78" y="182.88" size="5.08" layer="102" align="center">②</text>
<text x="33.02" y="73.66" size="5.08" layer="102" align="center">②</text>
<wire x1="165.1" y1="187.96" x2="276.86" y2="187.96" width="0.508" layer="102"/>
<wire x1="276.86" y1="187.96" x2="276.86" y2="93.98" width="0.508" layer="102"/>
<wire x1="276.86" y1="88.9" x2="200.66" y2="88.9" width="0.508" layer="102"/>
<text x="7.62" y="182.88" size="5.08" layer="102" align="center">④</text>
<text x="132.08" y="7.62" size="5.08" layer="102" align="center">④</text>
</plain>
<instances>
<instance part="U2" gate="G$1" x="86.36" y="124.46"/>
<instance part="+P1" gate="G$1" x="129.54" y="63.5" rot="R270"/>
<instance part="D2" gate="G$1" x="88.9" y="58.42" rot="R90"/>
<instance part="C2" gate="G$1" x="99.06" y="55.88"/>
<instance part="C3" gate="G$1" x="111.76" y="55.88"/>
<instance part="C13" gate="G$1" x="63.5" y="152.4"/>
<instance part="C11" gate="G$1" x="58.42" y="152.4"/>
<instance part="C9" gate="G$1" x="50.8" y="152.4"/>
<instance part="GND4" gate="1" x="68.58" y="144.78"/>
<instance part="+P2" gate="G$1" x="10.16" y="157.48" rot="MR270"/>
<instance part="D7" gate="G$1" x="116.84" y="114.3"/>
<instance part="C10" gate="G$1" x="55.88" y="129.54"/>
<instance part="L1" gate="G$1" x="63.5" y="124.46"/>
<instance part="C12" gate="G$1" x="60.96" y="91.44"/>
<instance part="L4" gate="G$1" x="129.54" y="119.38"/>
<instance part="L5" gate="G$1" x="129.54" y="96.52"/>
<instance part="L2" gate="G$1" x="129.54" y="180.34"/>
<instance part="L3" gate="G$1" x="129.54" y="142.24"/>
<instance part="D8" gate="G$1" x="116.84" y="91.44"/>
<instance part="D5" gate="G$1" x="116.84" y="175.26"/>
<instance part="D6" gate="G$1" x="116.84" y="137.16"/>
<instance part="R12" gate="G$1" x="68.58" y="88.9" rot="R90"/>
<instance part="GND6" gate="1" x="68.58" y="81.28"/>
<instance part="GND7" gate="1" x="60.96" y="81.28"/>
<instance part="GND8" gate="1" x="45.72" y="106.68"/>
<instance part="R9" gate="G$1" x="45.72" y="127" rot="R90"/>
<instance part="R10" gate="G$1" x="45.72" y="114.3" rot="R90"/>
<instance part="C15" gate="G$1" x="147.32" y="172.72"/>
<instance part="C18" gate="G$1" x="147.32" y="88.9"/>
<instance part="C17" gate="G$1" x="147.32" y="111.76"/>
<instance part="C16" gate="G$1" x="147.32" y="134.62"/>
<instance part="R14" gate="G$1" x="139.7" y="177.8" rot="R90"/>
<instance part="R15" gate="G$1" x="139.7" y="170.18" rot="R90"/>
<instance part="R20" gate="G$1" x="139.7" y="93.98" rot="R90"/>
<instance part="R21" gate="G$1" x="139.7" y="86.36" rot="R90"/>
<instance part="R18" gate="G$1" x="139.7" y="116.84" rot="R90"/>
<instance part="R19" gate="G$1" x="139.7" y="109.22" rot="R90"/>
<instance part="R16" gate="G$1" x="139.7" y="139.7" rot="R90"/>
<instance part="R17" gate="G$1" x="139.7" y="132.08" rot="R90"/>
<instance part="GND9" gate="1" x="139.7" y="162.56"/>
<instance part="GND10" gate="1" x="139.7" y="78.74"/>
<instance part="GND11" gate="1" x="139.7" y="101.6"/>
<instance part="GND12" gate="1" x="139.7" y="124.46"/>
<instance part="GND13" gate="1" x="147.32" y="167.64"/>
<instance part="GND15" gate="1" x="147.32" y="83.82"/>
<instance part="GND16" gate="1" x="147.32" y="106.68"/>
<instance part="GND17" gate="1" x="147.32" y="129.54"/>
<instance part="+P3" gate="G$1" x="157.48" y="180.34" rot="R270"/>
<instance part="+P4" gate="1" x="157.48" y="96.52" rot="R270"/>
<instance part="+P5" gate="1" x="231.14" y="119.38" rot="R270"/>
<instance part="+P6" gate="1" x="157.48" y="142.24" rot="R270"/>
<instance part="GND19" gate="1" x="236.22" y="66.04"/>
<instance part="+P8" gate="G$1" x="144.78" y="50.8" rot="MR270"/>
<instance part="F2" gate="G$1" x="180.34" y="50.8"/>
<instance part="Q3" gate="G$1" x="160.02" y="50.8" smashed="yes" rot="MR90">
<attribute name="VALUE" x="154.94" y="53.34" size="1.778" layer="96" font="vector"/>
<attribute name="NAME" x="154.94" y="55.88" size="1.778" layer="95" font="vector"/>
</instance>
<instance part="R23" gate="G$1" x="152.4" y="45.72" rot="R90"/>
<instance part="Q1" gate="G$1" x="157.48" y="30.48" rot="MR0"/>
<instance part="GND21" gate="1" x="157.48" y="10.16"/>
<instance part="R27" gate="G$1" x="167.64" y="12.7"/>
<instance part="R13" gate="G$1" x="124.46" y="152.4" rot="R180"/>
<instance part="C14" gate="G$1" x="137.16" y="152.4" rot="R90"/>
<instance part="P+1" gate="G$1" x="193.04" y="50.8" rot="R270"/>
<instance part="+P9" gate="1" x="210.82" y="73.66" rot="R90"/>
<instance part="F1" gate="G$1" x="33.02" y="63.5"/>
<instance part="R11" gate="G$1" x="53.34" y="93.98" rot="R90"/>
<instance part="GND22" gate="1" x="25.4" y="55.88"/>
<instance part="GND3" gate="1" x="88.9" y="50.8"/>
<instance part="GND23" gate="1" x="99.06" y="50.8"/>
<instance part="GND24" gate="1" x="111.76" y="50.8"/>
<instance part="+P10" gate="G$1" x="210.82" y="78.74" rot="MR270"/>
<instance part="CN1" gate="G$1" x="17.78" y="60.96"/>
<instance part="GND1" gate="1" x="48.26" y="81.28"/>
<instance part="U1" gate="G$1" x="60.96" y="25.4"/>
<instance part="C1" gate="G$1" x="43.18" y="20.32"/>
<instance part="GND5" gate="1" x="43.18" y="15.24"/>
<instance part="+P11" gate="1" x="38.1" y="25.4" rot="MR270"/>
<instance part="R4" gate="G$1" x="185.42" y="167.64" rot="R90"/>
<instance part="R5" gate="G$1" x="185.42" y="154.94" rot="R90"/>
<instance part="GND39" gate="1" x="185.42" y="147.32"/>
<instance part="C5" gate="G$1" x="200.66" y="152.4"/>
<instance part="GND41" gate="1" x="200.66" y="147.32"/>
<instance part="GND75" gate="1" x="73.66" y="15.24"/>
<instance part="R2" gate="G$1" x="78.74" y="33.02" rot="R90"/>
<instance part="R3" gate="G$1" x="83.82" y="33.02" rot="R90"/>
<instance part="+P41" gate="1" x="81.28" y="43.18" rot="MR0"/>
<instance part="R29" gate="G$1" x="172.72" y="27.94"/>
<instance part="D3" gate="G$1" x="20.32" y="157.48" smashed="yes">
<attribute name="NAME" x="17.78" y="162.433" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="17.78" y="160.147" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="C7" gate="G$1" x="35.56" y="147.32"/>
<instance part="GND2" gate="1" x="35.56" y="139.7"/>
<instance part="+P42" gate="G$1" x="210.82" y="50.8" rot="MR270"/>
<instance part="F3" gate="G$1" x="246.38" y="50.8"/>
<instance part="Q4" gate="G$1" x="226.06" y="50.8" smashed="yes" rot="MR90">
<attribute name="VALUE" x="220.98" y="53.34" size="1.778" layer="96" font="vector"/>
<attribute name="NAME" x="220.98" y="55.88" size="1.778" layer="95" font="vector"/>
</instance>
<instance part="R24" gate="G$1" x="218.44" y="45.72" rot="R90"/>
<instance part="Q2" gate="G$1" x="223.52" y="30.48" rot="MR0"/>
<instance part="GND37" gate="1" x="223.52" y="10.16"/>
<instance part="R28" gate="G$1" x="233.68" y="12.7"/>
<instance part="P+6" gate="G$1" x="259.08" y="50.8" rot="R270"/>
<instance part="R30" gate="G$1" x="238.76" y="27.94"/>
<instance part="D4" gate="G$1" x="27.94" y="144.78" rot="R90"/>
<instance part="GND76" gate="1" x="27.94" y="139.7"/>
<instance part="C4" gate="G$1" x="121.92" y="55.88"/>
<instance part="GND77" gate="1" x="121.92" y="50.8"/>
<instance part="SW1" gate="G$1" x="76.2" y="63.5"/>
<instance part="CN2" gate="G$1" x="228.6" y="73.66"/>
<instance part="GND20" gate="1" x="218.44" y="66.04"/>
<instance part="U3" gate="G$1" x="193.04" y="116.84"/>
<instance part="C19" gate="G$1" x="170.18" y="111.76"/>
<instance part="GND113" gate="1" x="170.18" y="106.68"/>
<instance part="GND115" gate="1" x="193.04" y="106.68"/>
<instance part="C20" gate="G$1" x="213.36" y="106.68"/>
<instance part="GND116" gate="1" x="213.36" y="101.6"/>
<instance part="C21" gate="G$1" x="223.52" y="111.76"/>
<instance part="GND117" gate="1" x="223.52" y="106.68"/>
<instance part="R22" gate="G$1" x="185.42" y="96.52" rot="R90"/>
<instance part="GND118" gate="1" x="185.42" y="88.9"/>
<instance part="R8" gate="G$1" x="38.1" y="99.06"/>
<instance part="C8" gate="G$1" x="43.18" y="91.44"/>
<instance part="R1" gate="G$1" x="60.96" y="60.96"/>
<instance part="D1" gate="G$1" x="40.64" y="58.42" rot="R90"/>
<instance part="GND136" gate="1" x="40.64" y="50.8"/>
<instance part="+P85" gate="G$1" x="185.42" y="175.26"/>
<instance part="R6" gate="G$1" x="231.14" y="167.64" rot="R90"/>
<instance part="R7" gate="G$1" x="231.14" y="154.94" rot="R90"/>
<instance part="GND156" gate="1" x="231.14" y="147.32"/>
<instance part="C6" gate="G$1" x="248.92" y="152.4"/>
<instance part="GND157" gate="1" x="248.92" y="147.32"/>
<instance part="+P86" gate="1" x="231.14" y="175.26"/>
<instance part="LOGO1" gate="G$1" x="10.16" y="15.24"/>
<instance part="R25" gate="G$1" x="157.48" y="20.32" rot="R90"/>
<instance part="R26" gate="G$1" x="223.52" y="20.32" rot="R90"/>
<instance part="C166" gate="G$1" x="167.64" y="43.18"/>
<instance part="C167" gate="G$1" x="233.68" y="43.18"/>
<instance part="R122" gate="G$1" x="195.58" y="160.02"/>
<instance part="R123" gate="G$1" x="241.3" y="160.02"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="PAD"/>
<wire x1="71.12" y1="147.32" x2="68.58" y2="147.32" width="0.1524" layer="91"/>
<wire x1="68.58" y1="147.32" x2="68.58" y2="149.86" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="GND"/>
<wire x1="68.58" y1="149.86" x2="71.12" y2="149.86" width="0.1524" layer="91"/>
<pinref part="C13" gate="G$1" pin="2"/>
<wire x1="68.58" y1="149.86" x2="63.5" y2="149.86" width="0.1524" layer="91"/>
<pinref part="C11" gate="G$1" pin="2"/>
<wire x1="63.5" y1="149.86" x2="58.42" y2="149.86" width="0.1524" layer="91"/>
<junction x="68.58" y="149.86"/>
<junction x="63.5" y="149.86"/>
<pinref part="C9" gate="G$1" pin="2"/>
<wire x1="50.8" y1="149.86" x2="58.42" y2="149.86" width="0.1524" layer="91"/>
<junction x="58.42" y="149.86"/>
<pinref part="GND4" gate="1" pin="GND"/>
<junction x="68.58" y="147.32"/>
</segment>
<segment>
<pinref part="R12" gate="G$1" pin="1"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C12" gate="G$1" pin="2"/>
<wire x1="60.96" y1="88.9" x2="60.96" y2="83.82" width="0.1524" layer="91"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R10" gate="G$1" pin="1"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R15" gate="G$1" pin="1"/>
<pinref part="GND9" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R21" gate="G$1" pin="1"/>
<pinref part="GND10" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R19" gate="G$1" pin="1"/>
<pinref part="GND11" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R17" gate="G$1" pin="1"/>
<pinref part="GND12" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C15" gate="G$1" pin="2"/>
<pinref part="GND13" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C17" gate="G$1" pin="2"/>
<pinref part="GND16" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C16" gate="G$1" pin="2"/>
<pinref part="GND17" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C18" gate="G$1" pin="2"/>
<pinref part="GND15" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND21" gate="1" pin="GND"/>
<pinref part="R27" gate="G$1" pin="1"/>
<wire x1="157.48" y1="12.7" x2="162.56" y2="12.7" width="0.1524" layer="91"/>
<pinref part="R25" gate="G$1" pin="1"/>
<wire x1="157.48" y1="15.24" x2="157.48" y2="12.7" width="0.1524" layer="91"/>
<junction x="157.48" y="12.7"/>
</segment>
<segment>
<pinref part="D2" gate="G$1" pin="A"/>
<wire x1="88.9" y1="53.34" x2="88.9" y2="55.88" width="0.1524" layer="91"/>
<pinref part="GND3" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C2" gate="G$1" pin="2"/>
<pinref part="GND23" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="N"/>
<pinref part="GND24" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND22" gate="1" pin="GND"/>
<wire x1="22.86" y1="58.42" x2="25.4" y2="58.42" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="N"/>
</segment>
<segment>
<pinref part="R11" gate="G$1" pin="1"/>
<wire x1="53.34" y1="88.9" x2="53.34" y2="86.36" width="0.1524" layer="91"/>
<wire x1="53.34" y1="86.36" x2="48.26" y2="86.36" width="0.1524" layer="91"/>
<wire x1="48.26" y1="86.36" x2="48.26" y2="83.82" width="0.1524" layer="91"/>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="48.26" y1="86.36" x2="43.18" y2="86.36" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="2"/>
<wire x1="43.18" y1="86.36" x2="43.18" y2="88.9" width="0.1524" layer="91"/>
<junction x="48.26" y="86.36"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="2"/>
<pinref part="U1" gate="G$1" pin="GND"/>
<wire x1="43.18" y1="17.78" x2="50.8" y2="17.78" width="0.1524" layer="91"/>
<pinref part="GND5" gate="1" pin="GND"/>
<junction x="43.18" y="17.78"/>
</segment>
<segment>
<pinref part="R5" gate="G$1" pin="1"/>
<pinref part="GND39" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C5" gate="G$1" pin="2"/>
<pinref part="GND41" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="A1"/>
<pinref part="GND75" gate="1" pin="GND"/>
<wire x1="71.12" y1="17.78" x2="73.66" y2="17.78" width="0.1524" layer="91"/>
<wire x1="73.66" y1="17.78" x2="73.66" y2="20.32" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="A0"/>
<wire x1="73.66" y1="20.32" x2="71.12" y2="20.32" width="0.1524" layer="91"/>
<junction x="73.66" y="17.78"/>
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="N"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="35.56" y1="142.24" x2="35.56" y2="144.78" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND37" gate="1" pin="GND"/>
<pinref part="R28" gate="G$1" pin="1"/>
<wire x1="223.52" y1="12.7" x2="228.6" y2="12.7" width="0.1524" layer="91"/>
<pinref part="R26" gate="G$1" pin="1"/>
<wire x1="223.52" y1="12.7" x2="223.52" y2="15.24" width="0.1524" layer="91"/>
<junction x="223.52" y="12.7"/>
</segment>
<segment>
<pinref part="D4" gate="G$1" pin="A"/>
<pinref part="GND76" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C4" gate="G$1" pin="N"/>
<pinref part="GND77" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND19" gate="1" pin="GND"/>
<wire x1="236.22" y1="68.58" x2="236.22" y2="76.2" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="7"/>
<wire x1="236.22" y1="76.2" x2="233.68" y2="76.2" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND20" gate="1" pin="GND"/>
<wire x1="218.44" y1="68.58" x2="218.44" y2="71.12" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="3"/>
<wire x1="218.44" y1="71.12" x2="218.44" y2="76.2" width="0.1524" layer="91"/>
<wire x1="218.44" y1="76.2" x2="220.98" y2="76.2" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="1"/>
<wire x1="220.98" y1="71.12" x2="218.44" y2="71.12" width="0.1524" layer="91"/>
<junction x="218.44" y="71.12"/>
</segment>
<segment>
<pinref part="C19" gate="G$1" pin="2"/>
<pinref part="GND113" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GND"/>
<pinref part="GND115" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C20" gate="G$1" pin="2"/>
<pinref part="GND116" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C21" gate="G$1" pin="2"/>
<pinref part="GND117" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R22" gate="G$1" pin="1"/>
<pinref part="GND118" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="D1" gate="G$1" pin="A"/>
<wire x1="40.64" y1="55.88" x2="40.64" y2="53.34" width="0.1524" layer="91"/>
<pinref part="GND136" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R7" gate="G$1" pin="1"/>
<pinref part="GND156" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="GND157" gate="1" pin="GND"/>
</segment>
</net>
<net name="VBAT" class="0">
<segment>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="185.42" y1="170.18" x2="185.42" y2="172.72" width="0.1524" layer="91"/>
<pinref part="+P85" gate="G$1" pin="VBAT"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="P"/>
<pinref part="+P1" gate="G$1" pin="VBAT"/>
<wire x1="127" y1="63.5" x2="121.92" y2="63.5" width="0.1524" layer="91"/>
<wire x1="121.92" y1="63.5" x2="111.76" y2="63.5" width="0.1524" layer="91"/>
<wire x1="111.76" y1="63.5" x2="111.76" y2="60.96" width="0.1524" layer="91"/>
<junction x="111.76" y="63.5"/>
<wire x1="99.06" y1="63.5" x2="111.76" y2="63.5" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="P"/>
<wire x1="121.92" y1="60.96" x2="121.92" y2="63.5" width="0.1524" layer="91"/>
<junction x="121.92" y="63.5"/>
<pinref part="D2" gate="G$1" pin="K"/>
<wire x1="88.9" y1="63.5" x2="88.9" y2="60.96" width="0.1524" layer="91"/>
<wire x1="88.9" y1="63.5" x2="99.06" y2="63.5" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="99.06" y1="60.96" x2="99.06" y2="63.5" width="0.1524" layer="91"/>
<junction x="99.06" y="63.5"/>
<pinref part="SW1" gate="G$1" pin="B"/>
<wire x1="81.28" y1="63.5" x2="88.9" y2="63.5" width="0.1524" layer="91"/>
<junction x="88.9" y="63.5"/>
</segment>
<segment>
<pinref part="+P2" gate="G$1" pin="VBAT"/>
<pinref part="D3" gate="G$1" pin="A"/>
<wire x1="12.7" y1="157.48" x2="17.78" y2="157.48" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="+P8" gate="G$1" pin="VBAT"/>
<pinref part="Q3" gate="G$1" pin="S"/>
<junction x="152.4" y="50.8"/>
<wire x1="147.32" y1="50.8" x2="152.4" y2="50.8" width="0.1524" layer="91"/>
<wire x1="152.4" y1="50.8" x2="154.94" y2="50.8" width="0.1524" layer="91"/>
<pinref part="R23" gate="G$1" pin="2"/>
<wire x1="152.4" y1="48.26" x2="152.4" y2="50.8" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="+P42" gate="G$1" pin="VBAT"/>
<pinref part="Q4" gate="G$1" pin="S"/>
<junction x="218.44" y="50.8"/>
<wire x1="213.36" y1="50.8" x2="218.44" y2="50.8" width="0.1524" layer="91"/>
<wire x1="218.44" y1="50.8" x2="220.98" y2="50.8" width="0.1524" layer="91"/>
<pinref part="R24" gate="G$1" pin="2"/>
<wire x1="218.44" y1="48.26" x2="218.44" y2="50.8" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="218.44" y1="78.74" x2="213.36" y2="78.74" width="0.1524" layer="91"/>
<wire x1="218.44" y1="78.74" x2="218.44" y2="86.36" width="0.1524" layer="91"/>
<wire x1="218.44" y1="86.36" x2="236.22" y2="86.36" width="0.1524" layer="91"/>
<wire x1="236.22" y1="86.36" x2="236.22" y2="78.74" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="4"/>
<wire x1="218.44" y1="78.74" x2="220.98" y2="78.74" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="8"/>
<wire x1="236.22" y1="78.74" x2="233.68" y2="78.74" width="0.1524" layer="91"/>
<junction x="218.44" y="78.74"/>
<pinref part="+P10" gate="G$1" pin="VBAT"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="L1" gate="G$1" pin="2"/>
<pinref part="U2" gate="G$1" pin="SW5"/>
<wire x1="68.58" y1="124.46" x2="71.12" y2="124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="C12" gate="G$1" pin="1"/>
<pinref part="U2" gate="G$1" pin="RUN/SS1"/>
<wire x1="60.96" y1="101.6" x2="60.96" y2="99.06" width="0.1524" layer="91"/>
<wire x1="60.96" y1="99.06" x2="60.96" y2="96.52" width="0.1524" layer="91"/>
<wire x1="71.12" y1="106.68" x2="60.96" y2="106.68" width="0.1524" layer="91"/>
<wire x1="60.96" y1="106.68" x2="60.96" y2="101.6" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="RUN/SS3"/>
<wire x1="71.12" y1="101.6" x2="60.96" y2="101.6" width="0.1524" layer="91"/>
<junction x="60.96" y="101.6"/>
<pinref part="U2" gate="G$1" pin="RUN/SS4"/>
<wire x1="60.96" y1="99.06" x2="71.12" y2="99.06" width="0.1524" layer="91"/>
<junction x="60.96" y="99.06"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="68.58" y1="91.44" x2="68.58" y2="93.98" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="RT/SYNC"/>
<wire x1="68.58" y1="93.98" x2="71.12" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="SKY"/>
<wire x1="71.12" y1="137.16" x2="55.88" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="1"/>
<wire x1="55.88" y1="137.16" x2="55.88" y2="134.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="L2" gate="G$1" pin="1"/>
<pinref part="U2" gate="G$1" pin="SW1"/>
<wire x1="101.6" y1="165.1" x2="104.14" y2="165.1" width="0.1524" layer="91"/>
<wire x1="104.14" y1="165.1" x2="104.14" y2="180.34" width="0.1524" layer="91"/>
<wire x1="104.14" y1="180.34" x2="121.92" y2="180.34" width="0.1524" layer="91"/>
<pinref part="D5" gate="G$1" pin="K"/>
<wire x1="121.92" y1="180.34" x2="124.46" y2="180.34" width="0.1524" layer="91"/>
<wire x1="119.38" y1="175.26" x2="121.92" y2="175.26" width="0.1524" layer="91"/>
<wire x1="121.92" y1="175.26" x2="121.92" y2="180.34" width="0.1524" layer="91"/>
<junction x="121.92" y="180.34"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="L3" gate="G$1" pin="1"/>
<wire x1="121.92" y1="142.24" x2="124.46" y2="142.24" width="0.1524" layer="91"/>
<pinref part="R13" gate="G$1" pin="2"/>
<wire x1="121.92" y1="152.4" x2="121.92" y2="142.24" width="0.1524" layer="91"/>
<pinref part="D6" gate="G$1" pin="K"/>
<wire x1="119.38" y1="137.16" x2="121.92" y2="137.16" width="0.1524" layer="91"/>
<wire x1="121.92" y1="137.16" x2="121.92" y2="142.24" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="SW2"/>
<wire x1="121.92" y1="142.24" x2="101.6" y2="142.24" width="0.1524" layer="91"/>
<junction x="121.92" y="142.24"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="R20" gate="G$1" pin="1"/>
<pinref part="R21" gate="G$1" pin="2"/>
<junction x="139.7" y="88.9"/>
<wire x1="139.7" y1="88.9" x2="132.08" y2="88.9" width="0.1524" layer="91"/>
<wire x1="132.08" y1="88.9" x2="132.08" y2="83.82" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="FB4"/>
<wire x1="132.08" y1="83.82" x2="101.6" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="R14" gate="G$1" pin="1"/>
<pinref part="R15" gate="G$1" pin="2"/>
<wire x1="132.08" y1="172.72" x2="139.7" y2="172.72" width="0.1524" layer="91"/>
<junction x="139.7" y="172.72"/>
<wire x1="132.08" y1="172.72" x2="132.08" y2="167.64" width="0.1524" layer="91"/>
<wire x1="132.08" y1="167.64" x2="109.22" y2="167.64" width="0.1524" layer="91"/>
<wire x1="109.22" y1="167.64" x2="109.22" y2="152.4" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="FB1"/>
<wire x1="109.22" y1="152.4" x2="101.6" y2="152.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="R16" gate="G$1" pin="1"/>
<pinref part="R17" gate="G$1" pin="2"/>
<pinref part="U2" gate="G$1" pin="FB2"/>
<wire x1="101.6" y1="129.54" x2="132.08" y2="129.54" width="0.1524" layer="91"/>
<wire x1="132.08" y1="129.54" x2="132.08" y2="134.62" width="0.1524" layer="91"/>
<wire x1="132.08" y1="134.62" x2="139.7" y2="134.62" width="0.1524" layer="91"/>
<junction x="139.7" y="134.62"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="L5" gate="G$1" pin="2"/>
<pinref part="R20" gate="G$1" pin="2"/>
<wire x1="134.62" y1="96.52" x2="139.7" y2="96.52" width="0.1524" layer="91"/>
<wire x1="139.7" y1="96.52" x2="147.32" y2="96.52" width="0.1524" layer="91"/>
<pinref part="C18" gate="G$1" pin="1"/>
<wire x1="147.32" y1="96.52" x2="147.32" y2="93.98" width="0.1524" layer="91"/>
<junction x="139.7" y="96.52"/>
<junction x="147.32" y="96.52"/>
<pinref part="+P4" gate="1" pin="+3V3"/>
<wire x1="147.32" y1="96.52" x2="154.94" y2="96.52" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="VS"/>
<wire x1="50.8" y1="25.4" x2="43.18" y2="25.4" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="1"/>
<pinref part="+P11" gate="1" pin="+3V3"/>
<wire x1="40.64" y1="25.4" x2="43.18" y2="25.4" width="0.1524" layer="91"/>
<junction x="43.18" y="25.4"/>
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="78.74" y1="35.56" x2="78.74" y2="38.1" width="0.1524" layer="91"/>
<wire x1="78.74" y1="38.1" x2="81.28" y2="38.1" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="81.28" y1="38.1" x2="83.82" y2="38.1" width="0.1524" layer="91"/>
<wire x1="83.82" y1="38.1" x2="83.82" y2="35.56" width="0.1524" layer="91"/>
<pinref part="+P41" gate="1" pin="+3V3"/>
<wire x1="81.28" y1="38.1" x2="81.28" y2="40.64" width="0.1524" layer="91"/>
<junction x="81.28" y="38.1"/>
</segment>
<segment>
<pinref part="+P9" gate="1" pin="+3V3"/>
<pinref part="CN2" gate="G$1" pin="2"/>
<wire x1="213.36" y1="73.66" x2="220.98" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+12V" class="0">
<segment>
<pinref part="L3" gate="G$1" pin="2"/>
<pinref part="R16" gate="G$1" pin="2"/>
<wire x1="134.62" y1="142.24" x2="139.7" y2="142.24" width="0.1524" layer="91"/>
<wire x1="139.7" y1="142.24" x2="147.32" y2="142.24" width="0.1524" layer="91"/>
<pinref part="C16" gate="G$1" pin="1"/>
<wire x1="147.32" y1="142.24" x2="147.32" y2="139.7" width="0.1524" layer="91"/>
<junction x="139.7" y="142.24"/>
<wire x1="147.32" y1="142.24" x2="154.94" y2="142.24" width="0.1524" layer="91"/>
<junction x="147.32" y="142.24"/>
<pinref part="+P6" gate="1" pin="+12V"/>
<pinref part="C14" gate="G$1" pin="2"/>
<wire x1="139.7" y1="152.4" x2="139.7" y2="142.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="231.14" y1="170.18" x2="231.14" y2="172.72" width="0.1524" layer="91"/>
<pinref part="+P86" gate="1" pin="+12V"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="Q3" gate="G$1" pin="D"/>
<pinref part="F2" gate="G$1" pin="1"/>
<wire x1="165.1" y1="50.8" x2="167.64" y2="50.8" width="0.1524" layer="91"/>
<pinref part="C166" gate="G$1" pin="1"/>
<wire x1="167.64" y1="50.8" x2="175.26" y2="50.8" width="0.1524" layer="91"/>
<wire x1="167.64" y1="48.26" x2="167.64" y2="50.8" width="0.1524" layer="91"/>
<junction x="167.64" y="50.8"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<wire x1="152.4" y1="38.1" x2="157.48" y2="38.1" width="0.1524" layer="91"/>
<pinref part="Q3" gate="G$1" pin="G"/>
<wire x1="157.48" y1="38.1" x2="157.48" y2="45.72" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="D"/>
<wire x1="157.48" y1="35.56" x2="157.48" y2="38.1" width="0.1524" layer="91"/>
<junction x="157.48" y="38.1"/>
<pinref part="R23" gate="G$1" pin="1"/>
<wire x1="152.4" y1="38.1" x2="152.4" y2="40.64" width="0.1524" layer="91"/>
<wire x1="157.48" y1="38.1" x2="167.64" y2="38.1" width="0.1524" layer="91"/>
<pinref part="C166" gate="G$1" pin="2"/>
<wire x1="167.64" y1="38.1" x2="167.64" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="R13" gate="G$1" pin="1"/>
<pinref part="C14" gate="G$1" pin="1"/>
<wire x1="132.08" y1="152.4" x2="129.54" y2="152.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PWR_MOTOR1" class="0">
<segment>
<label x="182.88" y="27.94" size="1.27" layer="95" xref="yes"/>
<pinref part="R27" gate="G$1" pin="2"/>
<wire x1="177.8" y1="27.94" x2="182.88" y2="27.94" width="0.1524" layer="91"/>
<wire x1="170.18" y1="12.7" x2="177.8" y2="12.7" width="0.1524" layer="91"/>
<wire x1="177.8" y1="12.7" x2="177.8" y2="27.94" width="0.1524" layer="91"/>
<pinref part="R29" gate="G$1" pin="2"/>
<wire x1="175.26" y1="27.94" x2="177.8" y2="27.94" width="0.1524" layer="91"/>
<junction x="177.8" y="27.94"/>
</segment>
</net>
<net name="VCC/1" class="0">
<segment>
<pinref part="F2" gate="G$1" pin="2"/>
<wire x1="185.42" y1="50.8" x2="190.5" y2="50.8" width="0.1524" layer="91"/>
<pinref part="P+1" gate="G$1" pin="VCC/1"/>
</segment>
</net>
<net name="CHARGER_RX" class="0">
<segment>
<label x="243.84" y="71.12" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="233.68" y1="71.12" x2="243.84" y2="71.12" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="5"/>
</segment>
</net>
<net name="CHARGER_TX" class="0">
<segment>
<label x="243.84" y="73.66" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="243.84" y1="73.66" x2="233.68" y2="73.66" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="6"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="VIN"/>
<pinref part="C13" gate="G$1" pin="1"/>
<wire x1="71.12" y1="157.48" x2="63.5" y2="157.48" width="0.1524" layer="91"/>
<pinref part="C11" gate="G$1" pin="1"/>
<wire x1="63.5" y1="157.48" x2="58.42" y2="157.48" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="1"/>
<wire x1="58.42" y1="157.48" x2="50.8" y2="157.48" width="0.1524" layer="91"/>
<junction x="50.8" y="157.48"/>
<junction x="58.42" y="157.48"/>
<junction x="63.5" y="157.48"/>
<wire x1="45.72" y1="157.48" x2="50.8" y2="157.48" width="0.1524" layer="91"/>
<wire x1="45.72" y1="157.48" x2="45.72" y2="132.08" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="2"/>
<wire x1="45.72" y1="132.08" x2="45.72" y2="129.54" width="0.1524" layer="91"/>
<junction x="45.72" y="157.48"/>
<pinref part="L1" gate="G$1" pin="1"/>
<wire x1="55.88" y1="124.46" x2="58.42" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="2"/>
<wire x1="55.88" y1="127" x2="55.88" y2="124.46" width="0.1524" layer="91"/>
<junction x="55.88" y="124.46"/>
<wire x1="55.88" y1="124.46" x2="50.8" y2="124.46" width="0.1524" layer="91"/>
<wire x1="50.8" y1="124.46" x2="50.8" y2="132.08" width="0.1524" layer="91"/>
<wire x1="45.72" y1="132.08" x2="50.8" y2="132.08" width="0.1524" layer="91"/>
<junction x="45.72" y="132.08"/>
<pinref part="D3" gate="G$1" pin="K"/>
<wire x1="22.86" y1="157.48" x2="27.94" y2="157.48" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="P"/>
<wire x1="27.94" y1="157.48" x2="35.56" y2="157.48" width="0.1524" layer="91"/>
<wire x1="35.56" y1="157.48" x2="45.72" y2="157.48" width="0.1524" layer="91"/>
<wire x1="35.56" y1="152.4" x2="35.56" y2="157.48" width="0.1524" layer="91"/>
<junction x="35.56" y="157.48"/>
<pinref part="D4" gate="G$1" pin="K"/>
<wire x1="27.94" y1="147.32" x2="27.94" y2="157.48" width="0.1524" layer="91"/>
<junction x="27.94" y="157.48"/>
</segment>
</net>
<net name="+1V2" class="0">
<segment>
<pinref part="R14" gate="G$1" pin="2"/>
<wire x1="139.7" y1="180.34" x2="147.32" y2="180.34" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="1"/>
<wire x1="147.32" y1="180.34" x2="147.32" y2="177.8" width="0.1524" layer="91"/>
<junction x="147.32" y="180.34"/>
<pinref part="+P3" gate="G$1" pin="+1V2"/>
<wire x1="147.32" y1="180.34" x2="154.94" y2="180.34" width="0.1524" layer="91"/>
<pinref part="L2" gate="G$1" pin="2"/>
<wire x1="139.7" y1="180.34" x2="134.62" y2="180.34" width="0.1524" layer="91"/>
<junction x="139.7" y="180.34"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="R10" gate="G$1" pin="2"/>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="45.72" y1="116.84" x2="45.72" y2="119.38" width="0.1524" layer="91"/>
<wire x1="45.72" y1="119.38" x2="45.72" y2="121.92" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="EN/UVLO"/>
<wire x1="71.12" y1="111.76" x2="60.96" y2="111.76" width="0.1524" layer="91"/>
<wire x1="60.96" y1="119.38" x2="60.96" y2="111.76" width="0.1524" layer="91"/>
<junction x="45.72" y="119.38"/>
<wire x1="60.96" y1="119.38" x2="45.72" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VOLT_BAT" class="0">
<segment>
<label x="205.74" y="160.02" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<wire x1="198.12" y1="160.02" x2="200.66" y2="160.02" width="0.1524" layer="91"/>
<pinref part="R122" gate="G$1" pin="2"/>
<pinref part="C5" gate="G$1" pin="1"/>
<wire x1="200.66" y1="160.02" x2="205.74" y2="160.02" width="0.1524" layer="91"/>
<wire x1="200.66" y1="160.02" x2="200.66" y2="157.48" width="0.1524" layer="91"/>
<junction x="200.66" y="160.02"/>
</segment>
</net>
<net name="POWER_SCL" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SCL"/>
<wire x1="71.12" y1="25.4" x2="78.74" y2="25.4" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="78.74" y1="25.4" x2="88.9" y2="25.4" width="0.1524" layer="91"/>
<wire x1="78.74" y1="27.94" x2="78.74" y2="25.4" width="0.1524" layer="91"/>
<label x="88.9" y="25.4" size="1.27" layer="95" font="vector" xref="yes"/>
<junction x="78.74" y="25.4"/>
</segment>
</net>
<net name="POWER_SDA" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SDA"/>
<wire x1="71.12" y1="22.86" x2="83.82" y2="22.86" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="83.82" y1="22.86" x2="88.9" y2="22.86" width="0.1524" layer="91"/>
<wire x1="83.82" y1="27.94" x2="83.82" y2="22.86" width="0.1524" layer="91"/>
<label x="88.9" y="22.86" size="1.27" layer="95" font="vector" xref="yes"/>
<junction x="83.82" y="22.86"/>
</segment>
</net>
<net name="N$47" class="0">
<segment>
<pinref part="Q1" gate="G$1" pin="G"/>
<pinref part="R29" gate="G$1" pin="1"/>
<wire x1="162.56" y1="27.94" x2="167.64" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="Q4" gate="G$1" pin="D"/>
<pinref part="F3" gate="G$1" pin="1"/>
<wire x1="231.14" y1="50.8" x2="233.68" y2="50.8" width="0.1524" layer="91"/>
<pinref part="C167" gate="G$1" pin="1"/>
<wire x1="233.68" y1="50.8" x2="241.3" y2="50.8" width="0.1524" layer="91"/>
<wire x1="233.68" y1="48.26" x2="233.68" y2="50.8" width="0.1524" layer="91"/>
<junction x="233.68" y="50.8"/>
</segment>
</net>
<net name="N$45" class="0">
<segment>
<wire x1="218.44" y1="38.1" x2="223.52" y2="38.1" width="0.1524" layer="91"/>
<pinref part="Q4" gate="G$1" pin="G"/>
<wire x1="223.52" y1="38.1" x2="223.52" y2="45.72" width="0.1524" layer="91"/>
<pinref part="Q2" gate="G$1" pin="D"/>
<wire x1="223.52" y1="35.56" x2="223.52" y2="38.1" width="0.1524" layer="91"/>
<junction x="223.52" y="38.1"/>
<pinref part="R24" gate="G$1" pin="1"/>
<wire x1="218.44" y1="38.1" x2="218.44" y2="40.64" width="0.1524" layer="91"/>
<wire x1="223.52" y1="38.1" x2="233.68" y2="38.1" width="0.1524" layer="91"/>
<pinref part="C167" gate="G$1" pin="2"/>
<wire x1="233.68" y1="38.1" x2="233.68" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$46" class="0">
<segment>
<pinref part="Q2" gate="G$1" pin="G"/>
<pinref part="R30" gate="G$1" pin="1"/>
<wire x1="228.6" y1="27.94" x2="233.68" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VCC/2" class="0">
<segment>
<pinref part="F3" gate="G$1" pin="2"/>
<pinref part="P+6" gate="G$1" pin="VCC/2"/>
<wire x1="251.46" y1="50.8" x2="256.54" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PWR_MOTOR2" class="0">
<segment>
<label x="248.92" y="27.94" size="1.27" layer="95" xref="yes"/>
<pinref part="R28" gate="G$1" pin="2"/>
<wire x1="243.84" y1="27.94" x2="248.92" y2="27.94" width="0.1524" layer="91"/>
<wire x1="236.22" y1="12.7" x2="243.84" y2="12.7" width="0.1524" layer="91"/>
<wire x1="243.84" y1="12.7" x2="243.84" y2="27.94" width="0.1524" layer="91"/>
<pinref part="R30" gate="G$1" pin="2"/>
<wire x1="241.3" y1="27.94" x2="243.84" y2="27.94" width="0.1524" layer="91"/>
<junction x="243.84" y="27.94"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="D6" gate="G$1" pin="A"/>
<wire x1="114.3" y1="137.16" x2="111.76" y2="137.16" width="0.1524" layer="91"/>
<wire x1="111.76" y1="137.16" x2="111.76" y2="132.08" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="DA2"/>
<wire x1="111.76" y1="132.08" x2="101.6" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="R18" gate="G$1" pin="1"/>
<pinref part="R19" gate="G$1" pin="2"/>
<wire x1="139.7" y1="111.76" x2="132.08" y2="111.76" width="0.1524" layer="91"/>
<wire x1="132.08" y1="111.76" x2="132.08" y2="106.68" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="FB3"/>
<wire x1="132.08" y1="106.68" x2="101.6" y2="106.68" width="0.1524" layer="91"/>
<junction x="139.7" y="111.76"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="DA3"/>
<wire x1="101.6" y1="109.22" x2="111.76" y2="109.22" width="0.1524" layer="91"/>
<wire x1="111.76" y1="109.22" x2="111.76" y2="114.3" width="0.1524" layer="91"/>
<pinref part="D7" gate="G$1" pin="A"/>
<wire x1="111.76" y1="114.3" x2="114.3" y2="114.3" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="SW3"/>
<pinref part="L4" gate="G$1" pin="1"/>
<wire x1="101.6" y1="119.38" x2="121.92" y2="119.38" width="0.1524" layer="91"/>
<pinref part="D7" gate="G$1" pin="K"/>
<wire x1="121.92" y1="119.38" x2="124.46" y2="119.38" width="0.1524" layer="91"/>
<wire x1="119.38" y1="114.3" x2="121.92" y2="114.3" width="0.1524" layer="91"/>
<wire x1="121.92" y1="114.3" x2="121.92" y2="119.38" width="0.1524" layer="91"/>
<junction x="121.92" y="119.38"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="SW4"/>
<pinref part="L5" gate="G$1" pin="1"/>
<wire x1="101.6" y1="96.52" x2="121.92" y2="96.52" width="0.1524" layer="91"/>
<pinref part="D8" gate="G$1" pin="K"/>
<wire x1="121.92" y1="96.52" x2="124.46" y2="96.52" width="0.1524" layer="91"/>
<wire x1="119.38" y1="91.44" x2="121.92" y2="91.44" width="0.1524" layer="91"/>
<wire x1="121.92" y1="91.44" x2="121.92" y2="96.52" width="0.1524" layer="91"/>
<junction x="121.92" y="96.52"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="D8" gate="G$1" pin="A"/>
<wire x1="114.3" y1="91.44" x2="111.76" y2="91.44" width="0.1524" layer="91"/>
<wire x1="111.76" y1="91.44" x2="111.76" y2="86.36" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="DA4"/>
<wire x1="111.76" y1="86.36" x2="101.6" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$44" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="DA1"/>
<wire x1="101.6" y1="154.94" x2="106.68" y2="154.94" width="0.1524" layer="91"/>
<wire x1="106.68" y1="154.94" x2="106.68" y2="175.26" width="0.1524" layer="91"/>
<pinref part="D5" gate="G$1" pin="A"/>
<wire x1="106.68" y1="175.26" x2="114.3" y2="175.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="R18" gate="G$1" pin="2"/>
<wire x1="139.7" y1="119.38" x2="147.32" y2="119.38" width="0.1524" layer="91"/>
<pinref part="C17" gate="G$1" pin="1"/>
<wire x1="147.32" y1="119.38" x2="147.32" y2="116.84" width="0.1524" layer="91"/>
<pinref part="L4" gate="G$1" pin="2"/>
<wire x1="134.62" y1="119.38" x2="139.7" y2="119.38" width="0.1524" layer="91"/>
<junction x="139.7" y="119.38"/>
<pinref part="U3" gate="G$1" pin="IN"/>
<wire x1="147.32" y1="119.38" x2="170.18" y2="119.38" width="0.1524" layer="91"/>
<pinref part="C19" gate="G$1" pin="1"/>
<wire x1="170.18" y1="119.38" x2="180.34" y2="119.38" width="0.1524" layer="91"/>
<wire x1="170.18" y1="116.84" x2="170.18" y2="119.38" width="0.1524" layer="91"/>
<junction x="147.32" y="119.38"/>
<junction x="170.18" y="119.38"/>
</segment>
</net>
<net name="N$60" class="0">
<segment>
<pinref part="C20" gate="G$1" pin="1"/>
<wire x1="213.36" y1="111.76" x2="213.36" y2="114.3" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="NR"/>
<wire x1="213.36" y1="114.3" x2="205.74" y2="114.3" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="OUT"/>
<pinref part="+P5" gate="1" pin="+5V"/>
<wire x1="205.74" y1="119.38" x2="223.52" y2="119.38" width="0.1524" layer="91"/>
<pinref part="C21" gate="G$1" pin="1"/>
<wire x1="223.52" y1="119.38" x2="228.6" y2="119.38" width="0.1524" layer="91"/>
<wire x1="223.52" y1="116.84" x2="223.52" y2="119.38" width="0.1524" layer="91"/>
<junction x="223.52" y="119.38"/>
</segment>
</net>
<net name="PWR_5V" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="EN"/>
<wire x1="180.34" y1="114.3" x2="177.8" y2="114.3" width="0.1524" layer="91"/>
<wire x1="177.8" y1="114.3" x2="177.8" y2="101.6" width="0.1524" layer="91"/>
<wire x1="177.8" y1="101.6" x2="185.42" y2="101.6" width="0.1524" layer="91"/>
<label x="190.5" y="101.6" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R22" gate="G$1" pin="2"/>
<wire x1="185.42" y1="101.6" x2="190.5" y2="101.6" width="0.1524" layer="91"/>
<wire x1="185.42" y1="99.06" x2="185.42" y2="101.6" width="0.1524" layer="91"/>
<junction x="185.42" y="101.6"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="R11" gate="G$1" pin="2"/>
<pinref part="U2" gate="G$1" pin="RUN/SS2"/>
<wire x1="71.12" y1="104.14" x2="53.34" y2="104.14" width="0.1524" layer="91"/>
<wire x1="53.34" y1="104.14" x2="53.34" y2="99.06" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="2"/>
<wire x1="53.34" y1="99.06" x2="53.34" y2="96.52" width="0.1524" layer="91"/>
<wire x1="40.64" y1="99.06" x2="43.18" y2="99.06" width="0.1524" layer="91"/>
<junction x="53.34" y="99.06"/>
<pinref part="C8" gate="G$1" pin="1"/>
<wire x1="43.18" y1="99.06" x2="53.34" y2="99.06" width="0.1524" layer="91"/>
<wire x1="43.18" y1="96.52" x2="43.18" y2="99.06" width="0.1524" layer="91"/>
<junction x="43.18" y="99.06"/>
</segment>
</net>
<net name="PWR_12V" class="0">
<segment>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="33.02" y1="99.06" x2="27.94" y2="99.06" width="0.1524" layer="91"/>
<label x="27.94" y="99.06" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="N$89" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="P"/>
<pinref part="F1" gate="G$1" pin="1"/>
<wire x1="22.86" y1="63.5" x2="27.94" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VIN+"/>
<wire x1="50.8" y1="33.02" x2="48.26" y2="33.02" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="I1"/>
<wire x1="53.34" y1="58.42" x2="48.26" y2="58.42" width="0.1524" layer="91"/>
<wire x1="48.26" y1="58.42" x2="48.26" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$171" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VIN-"/>
<wire x1="71.12" y1="33.02" x2="73.66" y2="33.02" width="0.1524" layer="91"/>
<wire x1="73.66" y1="33.02" x2="73.66" y2="58.42" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="I2"/>
<wire x1="73.66" y1="58.42" x2="66.04" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$172" class="0">
<segment>
<pinref part="D1" gate="G$1" pin="K"/>
<wire x1="40.64" y1="60.96" x2="40.64" y2="63.5" width="0.1524" layer="91"/>
<pinref part="F1" gate="G$1" pin="2"/>
<wire x1="40.64" y1="63.5" x2="38.1" y2="63.5" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="V1"/>
<wire x1="40.64" y1="63.5" x2="53.34" y2="63.5" width="0.1524" layer="91"/>
<junction x="40.64" y="63.5"/>
</segment>
</net>
<net name="N$174" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="V2"/>
<pinref part="SW1" gate="G$1" pin="A"/>
<wire x1="66.04" y1="63.5" x2="73.66" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VOLT_12V" class="0">
<segment>
<label x="254" y="160.02" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<wire x1="248.92" y1="160.02" x2="254" y2="160.02" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="1"/>
<wire x1="248.92" y1="157.48" x2="248.92" y2="160.02" width="0.1524" layer="91"/>
<pinref part="R123" gate="G$1" pin="2"/>
<wire x1="243.84" y1="160.02" x2="248.92" y2="160.02" width="0.1524" layer="91"/>
<junction x="248.92" y="160.02"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="R25" gate="G$1" pin="2"/>
<pinref part="Q1" gate="G$1" pin="S"/>
<wire x1="157.48" y1="22.86" x2="157.48" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$170" class="0">
<segment>
<pinref part="R26" gate="G$1" pin="2"/>
<pinref part="Q2" gate="G$1" pin="S"/>
<wire x1="223.52" y1="22.86" x2="223.52" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$175" class="0">
<segment>
<wire x1="185.42" y1="160.02" x2="190.5" y2="160.02" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="1"/>
<wire x1="185.42" y1="160.02" x2="185.42" y2="162.56" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="185.42" y1="160.02" x2="185.42" y2="157.48" width="0.1524" layer="91"/>
<junction x="185.42" y="160.02"/>
<pinref part="R122" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$176" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="2"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="231.14" y1="162.56" x2="231.14" y2="160.02" width="0.1524" layer="91"/>
<pinref part="R123" gate="G$1" pin="1"/>
<wire x1="231.14" y1="160.02" x2="231.14" y2="157.48" width="0.1524" layer="91"/>
<wire x1="231.14" y1="160.02" x2="236.22" y2="160.02" width="0.1524" layer="91"/>
<junction x="231.14" y="160.02"/>
</segment>
</net>
</nets>
</sheet>
<sheet>
<description>Logic(1/2)</description>
<plain>
<wire x1="0" y1="0" x2="0" y2="190.5" width="0.1524" layer="97"/>
<wire x1="0" y1="0" x2="279.4" y2="0" width="0.1524" layer="97"/>
<wire x1="279.4" y1="190.5" x2="279.4" y2="0" width="0.1524" layer="97"/>
<wire x1="0" y1="190.5" x2="279.4" y2="190.5" width="0.1524" layer="97"/>
<text x="86.36" y="25.4" size="1.778" layer="97">ジャンパーによる設定</text>
<text x="35.56" y="142.24" size="1.778" layer="97">なんとなくパターンだけあるIrDAトランシーバ</text>
<text x="27.94" y="162.56" size="1.778" layer="97">ほぼ使わない有線デバッグインターフェース</text>
<wire x1="83.82" y1="187.96" x2="83.82" y2="109.22" width="0.508" layer="102"/>
<wire x1="83.82" y1="109.22" x2="2.54" y2="109.22" width="0.508" layer="102"/>
<wire x1="2.54" y1="109.22" x2="2.54" y2="30.48" width="0.508" layer="102"/>
<wire x1="2.54" y1="30.48" x2="238.76" y2="30.48" width="0.508" layer="102"/>
<wire x1="238.76" y1="30.48" x2="238.76" y2="83.82" width="0.508" layer="102"/>
<wire x1="238.76" y1="83.82" x2="276.86" y2="83.82" width="0.508" layer="102"/>
<wire x1="276.86" y1="83.82" x2="276.86" y2="187.96" width="0.508" layer="102"/>
<wire x1="276.86" y1="187.96" x2="83.82" y2="187.96" width="0.508" layer="102"/>
<wire x1="129.54" y1="27.94" x2="129.54" y2="2.54" width="0.508" layer="102"/>
<wire x1="129.54" y1="27.94" x2="241.3" y2="27.94" width="0.508" layer="102"/>
<wire x1="241.3" y1="27.94" x2="241.3" y2="81.28" width="0.508" layer="102"/>
<wire x1="241.3" y1="81.28" x2="276.86" y2="81.28" width="0.508" layer="102"/>
<wire x1="276.86" y1="81.28" x2="276.86" y2="2.54" width="0.508" layer="102"/>
<wire x1="276.86" y1="2.54" x2="129.54" y2="2.54" width="0.508" layer="102"/>
<wire x1="5.08" y1="185.42" x2="78.74" y2="114.3" width="0.508" layer="102"/>
<wire x1="78.74" y1="185.42" x2="5.08" y2="114.3" width="0.508" layer="102"/>
<text x="88.9" y="182.88" size="5.08" layer="102" align="center">②</text>
<text x="134.62" y="22.86" size="5.08" layer="102" align="center">③</text>
<wire x1="119.38" y1="27.94" x2="119.38" y2="2.54" width="0.508" layer="102"/>
<wire x1="55.88" y1="27.94" x2="119.38" y2="27.94" width="0.508" layer="102"/>
<text x="60.96" y="22.86" size="5.08" layer="102" align="center">⑦</text>
<wire x1="55.88" y1="2.54" x2="119.38" y2="2.54" width="0.508" layer="102"/>
<wire x1="55.88" y1="27.94" x2="55.88" y2="2.54" width="0.508" layer="102"/>
</plain>
<instances>
<instance part="X1" gate="G$1" x="30.48" y="50.8"/>
<instance part="U5" gate="G$1" x="162.56" y="99.06"/>
<instance part="R36" gate="G$1" x="119.38" y="170.18" rot="R90"/>
<instance part="+P7" gate="1" x="119.38" y="177.8"/>
<instance part="GND26" gate="1" x="121.92" y="91.44"/>
<instance part="R34" gate="G$1" x="109.22" y="68.58"/>
<instance part="R35" gate="G$1" x="116.84" y="66.04"/>
<instance part="R33" gate="G$1" x="86.36" y="91.44" rot="R90"/>
<instance part="C22" gate="G$1" x="30.48" y="83.82"/>
<instance part="GND31" gate="1" x="30.48" y="76.2"/>
<instance part="+P14" gate="1" x="116.84" y="48.26" rot="MR270"/>
<instance part="R32" gate="G$1" x="48.26" y="43.18"/>
<instance part="+P15" gate="1" x="15.24" y="58.42"/>
<instance part="C23" gate="G$1" x="15.24" y="48.26" rot="MR0"/>
<instance part="GND40" gate="1" x="15.24" y="43.18"/>
<instance part="CN4" gate="G$1" x="236.22" y="172.72"/>
<instance part="GND49" gate="1" x="248.92" y="165.1"/>
<instance part="+P21" gate="1" x="248.92" y="182.88" rot="MR0"/>
<instance part="R37" gate="G$1" x="205.74" y="170.18" rot="R90"/>
<instance part="+P22" gate="1" x="205.74" y="177.8"/>
<instance part="C37" gate="G$1" x="215.9" y="15.24" rot="MR0"/>
<instance part="GND51" gate="1" x="215.9" y="7.62"/>
<instance part="+P24" gate="1" x="208.28" y="22.86" rot="MR270"/>
<instance part="U7" gate="G$1" x="231.14" y="15.24"/>
<instance part="CN5" gate="G$1" x="15.24" y="170.18" rot="MR0"/>
<instance part="GND33" gate="1" x="20.32" y="160.02"/>
<instance part="GND30" gate="1" x="15.24" y="73.66"/>
<instance part="C26" gate="G$1" x="99.06" y="144.78"/>
<instance part="C31" gate="G$1" x="109.22" y="144.78"/>
<instance part="+P12" gate="1" x="91.44" y="154.94" rot="MR270"/>
<instance part="+P13" gate="1" x="91.44" y="114.3" rot="MR270"/>
<instance part="GND27" gate="1" x="109.22" y="139.7"/>
<instance part="GND28" gate="1" x="99.06" y="139.7"/>
<instance part="C27" gate="G$1" x="99.06" y="127" smashed="yes">
<attribute name="NAME" x="115.824" y="127.381" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="118.364" y="122.301" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="C29" gate="G$1" x="104.14" y="127" smashed="yes">
<attribute name="NAME" x="120.904" y="127.381" size="1.778" layer="95" font="vector"/>
</instance>
<instance part="C32" gate="G$1" x="109.22" y="127" smashed="yes">
<attribute name="NAME" x="115.824" y="124.841" size="1.778" layer="95" font="vector"/>
</instance>
<instance part="C34" gate="G$1" x="114.3" y="127" smashed="yes">
<attribute name="NAME" x="120.904" y="124.841" size="1.778" layer="95" font="vector"/>
</instance>
<instance part="GND32" gate="1" x="114.3" y="119.38"/>
<instance part="C28" gate="G$1" x="99.06" y="106.68" smashed="yes">
<attribute name="NAME" x="115.824" y="107.061" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="118.364" y="101.981" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="C30" gate="G$1" x="104.14" y="106.68" smashed="yes">
<attribute name="NAME" x="120.904" y="107.061" size="1.778" layer="95" font="vector"/>
</instance>
<instance part="C33" gate="G$1" x="109.22" y="106.68" smashed="yes">
<attribute name="NAME" x="115.824" y="104.521" size="1.778" layer="95" font="vector"/>
</instance>
<instance part="C35" gate="G$1" x="114.3" y="106.68" smashed="yes">
<attribute name="NAME" x="120.904" y="104.521" size="1.778" layer="95" font="vector"/>
</instance>
<instance part="GND29" gate="1" x="114.3" y="99.06"/>
<instance part="CN3" gate="G$1" x="17.78" y="91.44"/>
<instance part="+P25" gate="1" x="22.86" y="180.34"/>
<instance part="U6" gate="G$1" x="50.8" y="129.54"/>
<instance part="C36" gate="G$1" x="30.48" y="127"/>
<instance part="+P50" gate="1" x="10.16" y="139.7" rot="MR270"/>
<instance part="GND53" gate="1" x="30.48" y="121.92"/>
<instance part="J1" gate="G$1" x="81.28" y="15.24"/>
<instance part="GND151" gate="1" x="71.12" y="7.62"/>
<instance part="SW2" gate="G$1" x="254" y="73.66"/>
<instance part="SW3" gate="G$1" x="254" y="58.42"/>
<instance part="GND36" gate="1" x="246.38" y="53.34"/>
<instance part="RA1" gate="C" x="208.28" y="38.1"/>
<instance part="R39" gate="G$1" x="208.28" y="81.28"/>
<instance part="R38" gate="G$1" x="208.28" y="83.82"/>
<instance part="R31" gate="G$1" x="48.26" y="53.34"/>
<instance part="RA1" gate="D" x="25.4" y="139.7"/>
<instance part="RA1" gate="A" x="208.28" y="35.56"/>
<instance part="RA1" gate="B" x="25.4" y="132.08"/>
<instance part="C25" gate="G$1" x="91.44" y="127"/>
<instance part="LED1" gate="G$1" x="254" y="134.62" rot="MR0"/>
<instance part="LED2" gate="G$1" x="264.16" y="134.62"/>
<instance part="R40" gate="G$1" x="254" y="144.78" rot="R90"/>
<instance part="R41" gate="G$1" x="264.16" y="144.78" rot="R90"/>
<instance part="GND137" gate="1" x="264.16" y="127"/>
<instance part="GND138" gate="1" x="254" y="127"/>
<instance part="R42" gate="G$1" x="254" y="106.68" rot="R90"/>
<instance part="LED3" gate="G$1" x="254" y="96.52"/>
<instance part="+P56" gate="1" x="254" y="114.3"/>
<instance part="U4" gate="G$1" x="58.42" y="86.36"/>
<instance part="GND169" gate="1" x="58.42" y="76.2"/>
<instance part="+P62" gate="1" x="251.46" y="12.7" rot="MR90"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="GNDANA"/>
<wire x1="124.46" y1="96.52" x2="121.92" y2="96.52" width="0.1524" layer="91"/>
<wire x1="121.92" y1="96.52" x2="121.92" y2="93.98" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="GND"/>
<wire x1="121.92" y1="93.98" x2="124.46" y2="93.98" width="0.1524" layer="91"/>
<pinref part="GND26" gate="1" pin="GND"/>
<junction x="121.92" y="93.98"/>
</segment>
<segment>
<wire x1="22.86" y1="86.36" x2="25.4" y2="86.36" width="0.1524" layer="91"/>
<wire x1="25.4" y1="86.36" x2="25.4" y2="78.74" width="0.1524" layer="91"/>
<wire x1="25.4" y1="78.74" x2="30.48" y2="78.74" width="0.1524" layer="91"/>
<pinref part="C22" gate="G$1" pin="2"/>
<wire x1="30.48" y1="78.74" x2="30.48" y2="81.28" width="0.1524" layer="91"/>
<pinref part="GND31" gate="1" pin="GND"/>
<junction x="30.48" y="78.74"/>
<pinref part="CN3" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="GND"/>
<pinref part="C23" gate="G$1" pin="2"/>
<wire x1="22.86" y1="45.72" x2="15.24" y2="45.72" width="0.1524" layer="91"/>
<pinref part="GND40" gate="1" pin="GND"/>
<junction x="15.24" y="45.72"/>
</segment>
<segment>
<pinref part="CN4" gate="G$1" pin="GND@0"/>
<wire x1="248.92" y1="172.72" x2="246.38" y2="172.72" width="0.1524" layer="91"/>
<wire x1="248.92" y1="167.64" x2="248.92" y2="170.18" width="0.1524" layer="91"/>
<pinref part="GND49" gate="1" pin="GND"/>
<pinref part="CN4" gate="G$1" pin="GND@1"/>
<wire x1="248.92" y1="170.18" x2="248.92" y2="172.72" width="0.1524" layer="91"/>
<wire x1="246.38" y1="170.18" x2="248.92" y2="170.18" width="0.1524" layer="91"/>
<junction x="248.92" y="170.18"/>
</segment>
<segment>
<pinref part="GND51" gate="1" pin="GND"/>
<pinref part="C37" gate="G$1" pin="2"/>
<wire x1="215.9" y1="10.16" x2="215.9" y2="12.7" width="0.1524" layer="91"/>
<wire x1="215.9" y1="10.16" x2="218.44" y2="10.16" width="0.1524" layer="91"/>
<junction x="215.9" y="10.16"/>
<pinref part="U7" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="GND30" gate="1" pin="GND"/>
<wire x1="15.24" y1="76.2" x2="15.24" y2="78.74" width="0.1524" layer="91"/>
<wire x1="15.24" y1="76.2" x2="17.78" y2="76.2" width="0.1524" layer="91"/>
<wire x1="17.78" y1="76.2" x2="17.78" y2="78.74" width="0.1524" layer="91"/>
<junction x="15.24" y="76.2"/>
<pinref part="CN3" gate="G$1" pin="S1"/>
<pinref part="CN3" gate="G$1" pin="S2"/>
</segment>
<segment>
<pinref part="C31" gate="G$1" pin="2"/>
<pinref part="GND27" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C26" gate="G$1" pin="2"/>
<pinref part="GND28" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C34" gate="G$1" pin="2"/>
<pinref part="GND32" gate="1" pin="GND"/>
<wire x1="114.3" y1="121.92" x2="114.3" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C27" gate="G$1" pin="2"/>
<wire x1="99.06" y1="124.46" x2="99.06" y2="121.92" width="0.1524" layer="91"/>
<wire x1="99.06" y1="121.92" x2="104.14" y2="121.92" width="0.1524" layer="91"/>
<pinref part="C29" gate="G$1" pin="2"/>
<wire x1="104.14" y1="121.92" x2="109.22" y2="121.92" width="0.1524" layer="91"/>
<wire x1="109.22" y1="121.92" x2="114.3" y2="121.92" width="0.1524" layer="91"/>
<wire x1="104.14" y1="124.46" x2="104.14" y2="121.92" width="0.1524" layer="91"/>
<pinref part="C32" gate="G$1" pin="2"/>
<wire x1="109.22" y1="124.46" x2="109.22" y2="121.92" width="0.1524" layer="91"/>
<junction x="104.14" y="121.92"/>
<junction x="109.22" y="121.92"/>
<junction x="114.3" y="121.92"/>
<pinref part="C25" gate="G$1" pin="2"/>
<wire x1="91.44" y1="124.46" x2="91.44" y2="121.92" width="0.1524" layer="91"/>
<wire x1="91.44" y1="121.92" x2="99.06" y2="121.92" width="0.1524" layer="91"/>
<junction x="99.06" y="121.92"/>
</segment>
<segment>
<pinref part="C28" gate="G$1" pin="2"/>
<wire x1="99.06" y1="104.14" x2="99.06" y2="101.6" width="0.1524" layer="91"/>
<wire x1="99.06" y1="101.6" x2="104.14" y2="101.6" width="0.1524" layer="91"/>
<pinref part="C35" gate="G$1" pin="2"/>
<wire x1="104.14" y1="101.6" x2="109.22" y2="101.6" width="0.1524" layer="91"/>
<wire x1="109.22" y1="101.6" x2="114.3" y2="101.6" width="0.1524" layer="91"/>
<wire x1="114.3" y1="101.6" x2="114.3" y2="104.14" width="0.1524" layer="91"/>
<pinref part="C33" gate="G$1" pin="2"/>
<wire x1="109.22" y1="104.14" x2="109.22" y2="101.6" width="0.1524" layer="91"/>
<pinref part="C30" gate="G$1" pin="2"/>
<wire x1="104.14" y1="104.14" x2="104.14" y2="101.6" width="0.1524" layer="91"/>
<pinref part="GND29" gate="1" pin="GND"/>
<junction x="114.3" y="101.6"/>
<junction x="104.14" y="101.6"/>
<junction x="109.22" y="101.6"/>
</segment>
<segment>
<pinref part="C36" gate="G$1" pin="2"/>
<junction x="30.48" y="124.46"/>
<pinref part="GND53" gate="1" pin="GND"/>
<pinref part="U6" gate="G$1" pin="GND"/>
<wire x1="30.48" y1="124.46" x2="38.1" y2="124.46" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="1"/>
<wire x1="73.66" y1="20.32" x2="71.12" y2="20.32" width="0.1524" layer="91"/>
<wire x1="71.12" y1="20.32" x2="71.12" y2="17.78" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="9"/>
<wire x1="71.12" y1="17.78" x2="71.12" y2="15.24" width="0.1524" layer="91"/>
<wire x1="71.12" y1="15.24" x2="71.12" y2="12.7" width="0.1524" layer="91"/>
<wire x1="71.12" y1="12.7" x2="71.12" y2="10.16" width="0.1524" layer="91"/>
<wire x1="71.12" y1="10.16" x2="73.66" y2="10.16" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="7"/>
<wire x1="73.66" y1="12.7" x2="71.12" y2="12.7" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="5"/>
<wire x1="71.12" y1="15.24" x2="73.66" y2="15.24" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="3"/>
<wire x1="73.66" y1="17.78" x2="71.12" y2="17.78" width="0.1524" layer="91"/>
<pinref part="GND151" gate="1" pin="GND"/>
<junction x="71.12" y="10.16"/>
<junction x="71.12" y="12.7"/>
<junction x="71.12" y="15.24"/>
<junction x="71.12" y="17.78"/>
</segment>
<segment>
<pinref part="SW3" gate="G$1" pin="A2"/>
<wire x1="251.46" y1="58.42" x2="251.46" y2="55.88" width="0.1524" layer="91"/>
<pinref part="GND36" gate="1" pin="GND"/>
<wire x1="251.46" y1="55.88" x2="246.38" y2="55.88" width="0.1524" layer="91"/>
<pinref part="SW3" gate="G$1" pin="A1"/>
<wire x1="251.46" y1="60.96" x2="251.46" y2="63.5" width="0.1524" layer="91"/>
<wire x1="251.46" y1="63.5" x2="246.38" y2="63.5" width="0.1524" layer="91"/>
<wire x1="246.38" y1="63.5" x2="246.38" y2="55.88" width="0.1524" layer="91"/>
<pinref part="SW2" gate="G$1" pin="A2"/>
<wire x1="251.46" y1="73.66" x2="251.46" y2="71.12" width="0.1524" layer="91"/>
<wire x1="251.46" y1="71.12" x2="246.38" y2="71.12" width="0.1524" layer="91"/>
<wire x1="246.38" y1="71.12" x2="246.38" y2="63.5" width="0.1524" layer="91"/>
<pinref part="SW2" gate="G$1" pin="A1"/>
<wire x1="251.46" y1="76.2" x2="251.46" y2="78.74" width="0.1524" layer="91"/>
<wire x1="251.46" y1="78.74" x2="246.38" y2="78.74" width="0.1524" layer="91"/>
<wire x1="246.38" y1="78.74" x2="246.38" y2="71.12" width="0.1524" layer="91"/>
<junction x="246.38" y="71.12"/>
<junction x="246.38" y="63.5"/>
<junction x="246.38" y="55.88"/>
</segment>
<segment>
<pinref part="CN5" gate="G$1" pin="4"/>
<wire x1="17.78" y1="165.1" x2="20.32" y2="165.1" width="0.1524" layer="91"/>
<pinref part="GND33" gate="1" pin="GND"/>
<wire x1="20.32" y1="165.1" x2="20.32" y2="162.56" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="LED2" gate="G$1" pin="K"/>
<wire x1="264.16" y1="129.54" x2="264.16" y2="132.08" width="0.1524" layer="91"/>
<pinref part="GND137" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="LED1" gate="G$1" pin="K"/>
<wire x1="254" y1="132.08" x2="254" y2="129.54" width="0.1524" layer="91"/>
<pinref part="GND138" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="V-"/>
<pinref part="GND169" gate="1" pin="GND"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="R36" gate="G$1" pin="2"/>
<wire x1="119.38" y1="172.72" x2="119.38" y2="175.26" width="0.1524" layer="91"/>
<pinref part="+P7" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="ADVREF"/>
<wire x1="124.46" y1="48.26" x2="119.38" y2="48.26" width="0.1524" layer="91"/>
<pinref part="+P14" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="VDD"/>
<pinref part="+P15" gate="1" pin="+3V3"/>
<wire x1="22.86" y1="53.34" x2="15.24" y2="53.34" width="0.1524" layer="91"/>
<wire x1="15.24" y1="53.34" x2="15.24" y2="55.88" width="0.1524" layer="91"/>
<pinref part="C23" gate="G$1" pin="1"/>
<junction x="15.24" y="53.34"/>
</segment>
<segment>
<pinref part="CN4" gate="G$1" pin="VCC"/>
<wire x1="246.38" y1="177.8" x2="248.92" y2="177.8" width="0.1524" layer="91"/>
<wire x1="248.92" y1="177.8" x2="248.92" y2="180.34" width="0.1524" layer="91"/>
<pinref part="+P21" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="R37" gate="G$1" pin="2"/>
<pinref part="+P22" gate="1" pin="+3V3"/>
<wire x1="205.74" y1="172.72" x2="205.74" y2="175.26" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="+P24" gate="1" pin="+3V3"/>
<wire x1="210.82" y1="22.86" x2="215.9" y2="22.86" width="0.1524" layer="91"/>
<pinref part="C37" gate="G$1" pin="1"/>
<wire x1="215.9" y1="22.86" x2="218.44" y2="22.86" width="0.1524" layer="91"/>
<wire x1="215.9" y1="20.32" x2="215.9" y2="22.86" width="0.1524" layer="91"/>
<junction x="215.9" y="22.86"/>
<pinref part="U7" gate="G$1" pin="VCC"/>
</segment>
<segment>
<wire x1="124.46" y1="154.94" x2="99.06" y2="154.94" width="0.1524" layer="91"/>
<pinref part="C26" gate="G$1" pin="1"/>
<wire x1="99.06" y1="154.94" x2="93.98" y2="154.94" width="0.1524" layer="91"/>
<wire x1="99.06" y1="149.86" x2="99.06" y2="154.94" width="0.1524" layer="91"/>
<junction x="99.06" y="154.94"/>
<pinref part="+P12" gate="1" pin="+3V3"/>
<pinref part="U5" gate="G$1" pin="VDDIN"/>
</segment>
<segment>
<pinref part="+P13" gate="1" pin="+3V3"/>
<wire x1="93.98" y1="114.3" x2="99.06" y2="114.3" width="0.1524" layer="91"/>
<wire x1="99.06" y1="114.3" x2="104.14" y2="114.3" width="0.1524" layer="91"/>
<wire x1="104.14" y1="114.3" x2="109.22" y2="114.3" width="0.1524" layer="91"/>
<wire x1="109.22" y1="114.3" x2="114.3" y2="114.3" width="0.1524" layer="91"/>
<wire x1="114.3" y1="114.3" x2="121.92" y2="114.3" width="0.1524" layer="91"/>
<wire x1="121.92" y1="114.3" x2="124.46" y2="114.3" width="0.1524" layer="91"/>
<wire x1="124.46" y1="111.76" x2="121.92" y2="111.76" width="0.1524" layer="91"/>
<wire x1="121.92" y1="111.76" x2="121.92" y2="114.3" width="0.1524" layer="91"/>
<junction x="121.92" y="114.3"/>
<pinref part="C28" gate="G$1" pin="1"/>
<wire x1="99.06" y1="111.76" x2="99.06" y2="114.3" width="0.1524" layer="91"/>
<pinref part="C30" gate="G$1" pin="1"/>
<wire x1="104.14" y1="111.76" x2="104.14" y2="114.3" width="0.1524" layer="91"/>
<pinref part="C33" gate="G$1" pin="1"/>
<wire x1="109.22" y1="111.76" x2="109.22" y2="114.3" width="0.1524" layer="91"/>
<pinref part="C35" gate="G$1" pin="1"/>
<wire x1="114.3" y1="111.76" x2="114.3" y2="114.3" width="0.1524" layer="91"/>
<junction x="114.3" y="114.3"/>
<junction x="109.22" y="114.3"/>
<junction x="104.14" y="114.3"/>
<junction x="99.06" y="114.3"/>
<pinref part="U5" gate="G$1" pin="VDDANA"/>
<pinref part="U5" gate="G$1" pin="VDDIO"/>
</segment>
<segment>
<pinref part="+P25" gate="1" pin="+3V3"/>
<pinref part="CN5" gate="G$1" pin="3"/>
<wire x1="22.86" y1="167.64" x2="22.86" y2="177.8" width="0.1524" layer="91"/>
<wire x1="17.78" y1="167.64" x2="22.86" y2="167.64" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="20.32" y1="132.08" x2="17.78" y2="132.08" width="0.1524" layer="91"/>
<wire x1="17.78" y1="132.08" x2="17.78" y2="139.7" width="0.1524" layer="91"/>
<wire x1="17.78" y1="139.7" x2="20.32" y2="139.7" width="0.1524" layer="91"/>
<wire x1="17.78" y1="139.7" x2="12.7" y2="139.7" width="0.1524" layer="91"/>
<pinref part="+P50" gate="1" pin="+3V3"/>
<junction x="17.78" y="139.7"/>
<pinref part="RA1" gate="D" pin="1"/>
<pinref part="RA1" gate="B" pin="1"/>
</segment>
<segment>
<pinref part="R42" gate="G$1" pin="2"/>
<wire x1="254" y1="109.22" x2="254" y2="111.76" width="0.1524" layer="91"/>
<pinref part="+P56" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="!WP!/SIO2"/>
<wire x1="248.92" y1="12.7" x2="243.84" y2="12.7" width="0.1524" layer="91"/>
<pinref part="+P62" gate="1" pin="+3V3"/>
</segment>
</net>
<net name="PWR_MOTOR1" class="0">
<segment>
<label x="213.36" y="66.04" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="200.66" y1="66.04" x2="213.36" y2="66.04" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="PB00/TC-A0/USART2-CTS"/>
</segment>
</net>
<net name="PWR_12V" class="0">
<segment>
<wire x1="200.66" y1="48.26" x2="213.36" y2="48.26" width="0.1524" layer="91"/>
<label x="213.36" y="48.26" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PB07/SSC-RXDAT/USART1-DSR/ABDAC-DATAN0"/>
</segment>
</net>
<net name="!MCU_RESET" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="!RESET"/>
<wire x1="124.46" y1="162.56" x2="119.38" y2="162.56" width="0.1524" layer="91"/>
<pinref part="R36" gate="G$1" pin="1"/>
<wire x1="119.38" y1="162.56" x2="119.38" y2="165.1" width="0.1524" layer="91"/>
<wire x1="119.38" y1="162.56" x2="114.3" y2="162.56" width="0.1524" layer="91"/>
<label x="114.3" y="162.56" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<junction x="119.38" y="162.56"/>
</segment>
<segment>
<pinref part="SW2" gate="G$1" pin="B2"/>
<wire x1="256.54" y1="73.66" x2="256.54" y2="71.12" width="0.1524" layer="91"/>
<wire x1="256.54" y1="71.12" x2="261.62" y2="71.12" width="0.1524" layer="91"/>
<label x="261.62" y="71.12" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="R34" gate="G$1" pin="2"/>
<pinref part="U5" gate="G$1" pin="DP"/>
<wire x1="111.76" y1="68.58" x2="124.46" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="DM"/>
<pinref part="R35" gate="G$1" pin="2"/>
<wire x1="124.46" y1="66.04" x2="119.38" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="R35" gate="G$1" pin="1"/>
<wire x1="81.28" y1="88.9" x2="81.28" y2="66.04" width="0.1524" layer="91"/>
<wire x1="81.28" y1="66.04" x2="111.76" y2="66.04" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="I2"/>
<wire x1="68.58" y1="88.9" x2="81.28" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="R34" gate="G$1" pin="1"/>
<wire x1="104.14" y1="68.58" x2="78.74" y2="68.58" width="0.1524" layer="91"/>
<wire x1="78.74" y1="68.58" x2="78.74" y2="83.82" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="I1"/>
<wire x1="68.58" y1="83.82" x2="78.74" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="DEBUG_TX" class="0">
<segment>
<label x="27.94" y="172.72" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN5" gate="G$1" pin="1"/>
<wire x1="17.78" y1="172.72" x2="27.94" y2="172.72" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="210.82" y1="35.56" x2="213.36" y2="35.56" width="0.1524" layer="91"/>
<label x="213.36" y="35.56" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="RA1" gate="A" pin="2"/>
</segment>
</net>
<net name="DEBUG_RX" class="0">
<segment>
<label x="27.94" y="170.18" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN5" gate="G$1" pin="2"/>
<wire x1="17.78" y1="170.18" x2="27.94" y2="170.18" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="210.82" y1="38.1" x2="213.36" y2="38.1" width="0.1524" layer="91"/>
<label x="213.36" y="38.1" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="RA1" gate="C" pin="2"/>
</segment>
</net>
<net name="N$54" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="OUT"/>
<wire x1="38.1" y1="48.26" x2="40.64" y2="48.26" width="0.1524" layer="91"/>
<wire x1="40.64" y1="48.26" x2="40.64" y2="53.34" width="0.1524" layer="91"/>
<wire x1="40.64" y1="53.34" x2="43.18" y2="53.34" width="0.1524" layer="91"/>
<wire x1="40.64" y1="48.26" x2="40.64" y2="43.18" width="0.1524" layer="91"/>
<wire x1="40.64" y1="43.18" x2="43.18" y2="43.18" width="0.1524" layer="91"/>
<junction x="40.64" y="48.26"/>
<pinref part="R32" gate="G$1" pin="1"/>
<pinref part="R31" gate="G$1" pin="1"/>
</segment>
</net>
<net name="MCU_CLK" class="0">
<segment>
<wire x1="50.8" y1="53.34" x2="55.88" y2="53.34" width="0.1524" layer="91"/>
<label x="55.88" y="53.34" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R31" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="PA28/XIN1/USART0-CLK/PWM4/SPI0-MISO/ABDAC-DATAN0"/>
<wire x1="200.66" y1="78.74" x2="213.36" y2="78.74" width="0.1524" layer="91"/>
<label x="213.36" y="78.74" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="FPGA_CLK" class="0">
<segment>
<pinref part="R32" gate="G$1" pin="2"/>
<wire x1="50.8" y1="43.18" x2="55.88" y2="43.18" width="0.1524" layer="91"/>
<label x="55.88" y="43.18" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<pinref part="CN4" gate="G$1" pin="TCK"/>
<wire x1="226.06" y1="177.8" x2="213.36" y2="177.8" width="0.1524" layer="91"/>
<wire x1="213.36" y1="177.8" x2="213.36" y2="162.56" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="TCK"/>
<wire x1="213.36" y1="162.56" x2="205.74" y2="162.56" width="0.1524" layer="91"/>
<wire x1="205.74" y1="162.56" x2="200.66" y2="162.56" width="0.1524" layer="91"/>
<wire x1="205.74" y1="162.56" x2="205.74" y2="165.1" width="0.1524" layer="91"/>
<pinref part="R37" gate="G$1" pin="1"/>
<junction x="205.74" y="162.56"/>
</segment>
</net>
<net name="N$51" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="PA00/TDI"/>
<wire x1="200.66" y1="157.48" x2="215.9" y2="157.48" width="0.1524" layer="91"/>
<wire x1="215.9" y1="157.48" x2="215.9" y2="172.72" width="0.1524" layer="91"/>
<pinref part="CN4" gate="G$1" pin="TDI"/>
<wire x1="215.9" y1="172.72" x2="226.06" y2="172.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$52" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="PA01/TDO"/>
<wire x1="200.66" y1="154.94" x2="218.44" y2="154.94" width="0.1524" layer="91"/>
<wire x1="218.44" y1="154.94" x2="218.44" y2="170.18" width="0.1524" layer="91"/>
<pinref part="CN4" gate="G$1" pin="TDO"/>
<wire x1="218.44" y1="170.18" x2="226.06" y2="170.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$53" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="PA02/TMS"/>
<wire x1="200.66" y1="152.4" x2="220.98" y2="152.4" width="0.1524" layer="91"/>
<wire x1="220.98" y1="152.4" x2="220.98" y2="175.26" width="0.1524" layer="91"/>
<pinref part="CN4" gate="G$1" pin="TMS"/>
<wire x1="220.98" y1="175.26" x2="226.06" y2="175.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!FPGA_PROG" class="0">
<segment>
<label x="213.36" y="111.76" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA16/PWM4/TC-CLK1/SPI0-NPCS0"/>
<wire x1="213.36" y1="111.76" x2="200.66" y2="111.76" width="0.1524" layer="91"/>
</segment>
</net>
<net name="FPGA_CONF" class="0">
<segment>
<wire x1="200.66" y1="121.92" x2="213.36" y2="121.92" width="0.1524" layer="91"/>
<label x="213.36" y="121.92" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA13/PWM2/NMI/USART0-CLK/SSC-RXCLK"/>
</segment>
</net>
<net name="FPGA_DONE" class="0">
<segment>
<wire x1="200.66" y1="124.46" x2="213.36" y2="124.46" width="0.1524" layer="91"/>
<label x="213.36" y="124.46" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA12/XOUT32/PWM1/TC-B2/USART0-CTS/USART1-TXD"/>
</segment>
</net>
<net name="!FPGA_CS" class="0">
<segment>
<wire x1="213.36" y1="53.34" x2="200.66" y2="53.34" width="0.1524" layer="91"/>
<label x="213.36" y="53.34" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PB05/USART1-RTS/SPI0-NPCS2/PWM5"/>
</segment>
</net>
<net name="!FLASH_CS" class="0">
<segment>
<wire x1="243.84" y1="22.86" x2="254" y2="22.86" width="0.1524" layer="91"/>
<label x="254" y="22.86" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U7" gate="G$1" pin="!CS"/>
</segment>
<segment>
<label x="213.36" y="109.22" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA17/TC-CLK2/SPI0-SCK/SPI0-NPCS1/USART1-RXD"/>
<wire x1="213.36" y1="109.22" x2="200.66" y2="109.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SPI_SCLK" class="0">
<segment>
<wire x1="243.84" y1="20.32" x2="254" y2="20.32" width="0.1524" layer="91"/>
<label x="254" y="20.32" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U7" gate="G$1" pin="SCLK"/>
</segment>
<segment>
<label x="213.36" y="116.84" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA15/PWM4/USART2-CLK/SPI0-SCK"/>
<wire x1="213.36" y1="116.84" x2="200.66" y2="116.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SPI_MOSI" class="0">
<segment>
<wire x1="243.84" y1="17.78" x2="254" y2="17.78" width="0.1524" layer="91"/>
<label x="254" y="17.78" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U7" gate="G$1" pin="SI/SIO0"/>
</segment>
<segment>
<label x="213.36" y="119.38" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA14/PWM3/INT2/SPI0-MOSI/GCLK2"/>
<wire x1="213.36" y1="119.38" x2="200.66" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SPI_MISO" class="0">
<segment>
<wire x1="243.84" y1="15.24" x2="254" y2="15.24" width="0.1524" layer="91"/>
<label x="254" y="15.24" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U7" gate="G$1" pin="SO/SIO1"/>
</segment>
<segment>
<wire x1="213.36" y1="106.68" x2="200.66" y2="106.68" width="0.1524" layer="91"/>
<label x="213.36" y="106.68" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA18/XIN0/PWM5/USART0-RXD/SPI0-MISO/SSC-RXFRM"/>
</segment>
</net>
<net name="!FPGA_INIT" class="0">
<segment>
<wire x1="200.66" y1="50.8" x2="213.36" y2="50.8" width="0.1524" layer="91"/>
<label x="213.36" y="50.8" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PB06/SSC-RXCLK/USART1-DCD/ABDAC-DATA0"/>
</segment>
</net>
<net name="CHARGER_RX" class="0">
<segment>
<wire x1="210.82" y1="81.28" x2="213.36" y2="81.28" width="0.1524" layer="91"/>
<label x="213.36" y="81.28" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="R39" gate="G$1" pin="2"/>
</segment>
</net>
<net name="CHARGER_TX" class="0">
<segment>
<wire x1="213.36" y1="83.82" x2="210.82" y2="83.82" width="0.1524" layer="91"/>
<label x="213.36" y="83.82" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="R38" gate="G$1" pin="2"/>
</segment>
</net>
<net name="VOLT_BAT" class="0">
<segment>
<wire x1="200.66" y1="149.86" x2="213.36" y2="149.86" width="0.1524" layer="91"/>
<label x="213.36" y="149.86" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA03/AD0/GCLK0/USB_ID/ABDAC-DATA0"/>
</segment>
</net>
<net name="POWER_SCL" class="0">
<segment>
<wire x1="200.66" y1="132.08" x2="213.36" y2="132.08" width="0.1524" layer="91"/>
<label x="213.36" y="132.08" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA09/SCL/SPI0-NPCS2/USART1-CTS"/>
</segment>
<segment>
<wire x1="200.66" y1="96.52" x2="213.36" y2="96.52" width="0.1524" layer="91"/>
<label x="213.36" y="96.52" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA22/TC-B1/PWM6/TRIGGER/ABDAC-DATA0"/>
</segment>
</net>
<net name="POWER_SDA" class="0">
<segment>
<wire x1="200.66" y1="129.54" x2="213.36" y2="129.54" width="0.1524" layer="91"/>
<label x="213.36" y="129.54" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA10/SDA/SPI0-NPCS3/USART1-RTS"/>
</segment>
<segment>
<wire x1="200.66" y1="99.06" x2="213.36" y2="99.06" width="0.1524" layer="91"/>
<label x="213.36" y="99.06" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA21/TC-A1/PWM2/USART2-TXD/SSC-TXFRM"/>
</segment>
</net>
<net name="PWR_MOTOR2" class="0">
<segment>
<label x="213.36" y="101.6" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="200.66" y1="101.6" x2="213.36" y2="101.6" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="PA20/TC-CLK0/USART1-CLK/USART2-RXD/SSC-TXDAT"/>
</segment>
</net>
<net name="N$48" class="0">
<segment>
<pinref part="R33" gate="G$1" pin="1"/>
<wire x1="86.36" y1="86.36" x2="86.36" y2="73.66" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="VBUS"/>
<wire x1="124.46" y1="73.66" x2="86.36" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+1V8" class="0">
<segment>
<pinref part="C31" gate="G$1" pin="1"/>
<wire x1="109.22" y1="149.86" x2="109.22" y2="152.4" width="0.1524" layer="91"/>
<wire x1="109.22" y1="152.4" x2="121.92" y2="152.4" width="0.1524" layer="91"/>
<wire x1="121.92" y1="152.4" x2="124.46" y2="152.4" width="0.1524" layer="91"/>
<wire x1="121.92" y1="152.4" x2="121.92" y2="134.62" width="0.1524" layer="91"/>
<wire x1="121.92" y1="134.62" x2="124.46" y2="134.62" width="0.1524" layer="91"/>
<wire x1="124.46" y1="132.08" x2="121.92" y2="132.08" width="0.1524" layer="91"/>
<wire x1="121.92" y1="132.08" x2="121.92" y2="134.62" width="0.1524" layer="91"/>
<wire x1="121.92" y1="134.62" x2="114.3" y2="134.62" width="0.1524" layer="91"/>
<junction x="121.92" y="134.62"/>
<junction x="121.92" y="152.4"/>
<pinref part="C27" gate="G$1" pin="1"/>
<wire x1="114.3" y1="134.62" x2="109.22" y2="134.62" width="0.1524" layer="91"/>
<wire x1="109.22" y1="134.62" x2="104.14" y2="134.62" width="0.1524" layer="91"/>
<wire x1="104.14" y1="134.62" x2="99.06" y2="134.62" width="0.1524" layer="91"/>
<wire x1="99.06" y1="132.08" x2="99.06" y2="134.62" width="0.1524" layer="91"/>
<pinref part="C29" gate="G$1" pin="1"/>
<wire x1="104.14" y1="132.08" x2="104.14" y2="134.62" width="0.1524" layer="91"/>
<pinref part="C32" gate="G$1" pin="1"/>
<wire x1="109.22" y1="132.08" x2="109.22" y2="134.62" width="0.1524" layer="91"/>
<pinref part="C34" gate="G$1" pin="1"/>
<wire x1="114.3" y1="132.08" x2="114.3" y2="134.62" width="0.1524" layer="91"/>
<junction x="104.14" y="134.62"/>
<junction x="109.22" y="134.62"/>
<junction x="114.3" y="134.62"/>
<pinref part="U5" gate="G$1" pin="VDDOUT"/>
<pinref part="U5" gate="G$1" pin="VDDCORE"/>
<pinref part="U5" gate="G$1" pin="VDDPLL"/>
<pinref part="C25" gate="G$1" pin="1"/>
<wire x1="91.44" y1="132.08" x2="91.44" y2="134.62" width="0.1524" layer="91"/>
<wire x1="91.44" y1="134.62" x2="99.06" y2="134.62" width="0.1524" layer="91"/>
<junction x="99.06" y="134.62"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="VCC"/>
<wire x1="38.1" y1="132.08" x2="30.48" y2="132.08" width="0.1524" layer="91"/>
<pinref part="C36" gate="G$1" pin="1"/>
<wire x1="27.94" y1="132.08" x2="30.48" y2="132.08" width="0.1524" layer="91"/>
<junction x="30.48" y="132.08"/>
<pinref part="RA1" gate="B" pin="2"/>
</segment>
</net>
<net name="N$49" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="IREDA"/>
<wire x1="38.1" y1="134.62" x2="33.02" y2="134.62" width="0.1524" layer="91"/>
<wire x1="33.02" y1="134.62" x2="33.02" y2="139.7" width="0.1524" layer="91"/>
<wire x1="33.02" y1="139.7" x2="27.94" y2="139.7" width="0.1524" layer="91"/>
<pinref part="RA1" gate="D" pin="2"/>
</segment>
</net>
<net name="IRDA_TX" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="TXD"/>
<wire x1="63.5" y1="129.54" x2="68.58" y2="129.54" width="0.1524" layer="91"/>
<label x="68.58" y="129.54" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="200.66" y1="93.98" x2="213.36" y2="93.98" width="0.1524" layer="91"/>
<label x="213.36" y="93.98" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA23/INT3/USART1-TXD/SPI0-NPCS1/PWM0"/>
</segment>
</net>
<net name="IRDA_RX" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="RXD"/>
<wire x1="63.5" y1="127" x2="68.58" y2="127" width="0.1524" layer="91"/>
<label x="68.58" y="127" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="200.66" y1="88.9" x2="213.36" y2="88.9" width="0.1524" layer="91"/>
<label x="213.36" y="88.9" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA24/INT4/USART1-RXD/SPI0-NPCS0/PWM1"/>
</segment>
</net>
<net name="IRDA_SD" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="SD"/>
<wire x1="63.5" y1="124.46" x2="68.58" y2="124.46" width="0.1524" layer="91"/>
<label x="68.58" y="124.46" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="200.66" y1="43.18" x2="213.36" y2="43.18" width="0.1524" layer="91"/>
<label x="213.36" y="43.18" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PB08/SSC-RXFRM/USART1-DTR/ABDAC-DATA1"/>
</segment>
</net>
<net name="MOT2_TEMP" class="0">
<segment>
<wire x1="200.66" y1="73.66" x2="213.36" y2="73.66" width="0.1524" layer="91"/>
<label x="213.36" y="73.66" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA30/AD6/GCLK2"/>
</segment>
</net>
<net name="!SETTING_BOOTLOADER" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="2"/>
<wire x1="86.36" y1="20.32" x2="91.44" y2="20.32" width="0.1524" layer="91"/>
<label x="91.44" y="20.32" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="200.66" y1="147.32" x2="213.36" y2="147.32" width="0.1524" layer="91"/>
<label x="213.36" y="147.32" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA04/AD1/GCLK1/USB_VBOF/ABDAC-DATAN0"/>
</segment>
</net>
<net name="!SETTING_CHARGER" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="4"/>
<wire x1="86.36" y1="17.78" x2="91.44" y2="17.78" width="0.1524" layer="91"/>
<label x="91.44" y="17.78" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="200.66" y1="63.5" x2="213.36" y2="63.5" width="0.1524" layer="91"/>
<label x="213.36" y="63.5" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PB01/TC-B0/USART2-RTS"/>
</segment>
</net>
<net name="!SETTING_ID0" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="6"/>
<wire x1="86.36" y1="15.24" x2="91.44" y2="15.24" width="0.1524" layer="91"/>
<label x="91.44" y="15.24" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="200.66" y1="144.78" x2="213.36" y2="144.78" width="0.1524" layer="91"/>
<label x="213.36" y="144.78" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA05/AD2/INT0/USART1-DCD/ABDAC-DATA1"/>
</segment>
</net>
<net name="!SETTING_ID1" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="8"/>
<wire x1="91.44" y1="12.7" x2="86.36" y2="12.7" width="0.1524" layer="91"/>
<label x="91.44" y="12.7" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="213.36" y1="142.24" x2="200.66" y2="142.24" width="0.1524" layer="91"/>
<label x="213.36" y="142.24" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA06/AD3/INT1/USART1-DSR/ABDAC-DATAN1"/>
</segment>
</net>
<net name="!SETTING_ID2" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="10"/>
<wire x1="86.36" y1="10.16" x2="91.44" y2="10.16" width="0.1524" layer="91"/>
<label x="91.44" y="10.16" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="200.66" y1="139.7" x2="213.36" y2="139.7" width="0.1524" layer="91"/>
<label x="213.36" y="139.7" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA07/AD4/PWM0/USART1-DTR/SSC-RXFRM"/>
</segment>
</net>
<net name="!SW1" class="0">
<segment>
<pinref part="SW3" gate="G$1" pin="B2"/>
<wire x1="256.54" y1="58.42" x2="256.54" y2="55.88" width="0.1524" layer="91"/>
<wire x1="256.54" y1="55.88" x2="261.62" y2="55.88" width="0.1524" layer="91"/>
<label x="261.62" y="55.88" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="PA31/AD7/PWM6"/>
<wire x1="200.66" y1="71.12" x2="213.36" y2="71.12" width="0.1524" layer="91"/>
<label x="213.36" y="71.12" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="N$42" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="PB10/SSC-TXDAT/TC-A2/USART0-RXD"/>
<pinref part="RA1" gate="C" pin="1"/>
<wire x1="200.66" y1="38.1" x2="203.2" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$168" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="PB11/SSC-TXFRM/TC-B2/USART0-TXD"/>
<wire x1="203.2" y1="35.56" x2="200.66" y2="35.56" width="0.1524" layer="91"/>
<pinref part="RA1" gate="A" pin="1"/>
</segment>
</net>
<net name="N$169" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="PA26/TC-A0/USB_ID/USART2-TXD/ABDAC-DATA1"/>
<wire x1="200.66" y1="83.82" x2="203.2" y2="83.82" width="0.1524" layer="91"/>
<pinref part="R38" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="PA27/TC-B0/USB_VBOF/USART2-RXD/ABDAC-DATAN1"/>
<pinref part="R39" gate="G$1" pin="1"/>
<wire x1="200.66" y1="81.28" x2="203.2" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="FPGA_AUX0" class="0">
<segment>
<wire x1="200.66" y1="127" x2="213.36" y2="127" width="0.1524" layer="91"/>
<label x="213.36" y="127" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA11/XIN32/PWM0/TC-A2/USART0-RTS/SSC-RXDAT"/>
</segment>
</net>
<net name="LED1" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="PB02/TC-A1/USART1-TXD"/>
<wire x1="200.66" y1="60.96" x2="213.36" y2="60.96" width="0.1524" layer="91"/>
<label x="213.36" y="60.96" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="254" y1="147.32" x2="254" y2="149.86" width="0.1524" layer="91"/>
<wire x1="254" y1="149.86" x2="248.92" y2="149.86" width="0.1524" layer="91"/>
<label x="248.92" y="149.86" size="1.27" layer="95" font="vector" rot="R180" xref="yes"/>
<pinref part="R40" gate="G$1" pin="2"/>
</segment>
</net>
<net name="LED2" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="PB03/TC-B1/USART1-RXD"/>
<wire x1="200.66" y1="58.42" x2="213.36" y2="58.42" width="0.1524" layer="91"/>
<label x="213.36" y="58.42" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="264.16" y1="147.32" x2="264.16" y2="152.4" width="0.1524" layer="91"/>
<wire x1="264.16" y1="152.4" x2="248.92" y2="152.4" width="0.1524" layer="91"/>
<label x="248.92" y="152.4" size="1.27" layer="95" font="vector" rot="R180" xref="yes"/>
<pinref part="R41" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="R40" gate="G$1" pin="1"/>
<pinref part="LED1" gate="G$1" pin="A"/>
<wire x1="254" y1="139.7" x2="254" y2="137.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="R41" gate="G$1" pin="1"/>
<pinref part="LED2" gate="G$1" pin="A"/>
<wire x1="264.16" y1="139.7" x2="264.16" y2="137.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VOLT_12V" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="PA08/AD5/PWM1/USART1-RI/SSC-RXCLK"/>
<wire x1="200.66" y1="134.62" x2="213.36" y2="134.62" width="0.1524" layer="91"/>
<label x="213.36" y="134.62" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="FPGA_AUX1" class="0">
<segment>
<label x="213.36" y="55.88" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PB04/USART1-CTS/SPI0-NPCS3/TC-CLK2"/>
<wire x1="200.66" y1="55.88" x2="213.36" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="OSC_EN" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="EN"/>
<wire x1="22.86" y1="50.8" x2="20.32" y2="50.8" width="0.1524" layer="91"/>
<wire x1="20.32" y1="50.8" x2="20.32" y2="35.56" width="0.1524" layer="91"/>
<wire x1="22.86" y1="35.56" x2="20.32" y2="35.56" width="0.1524" layer="91"/>
<label x="22.86" y="35.56" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="213.36" y1="76.2" x2="200.66" y2="76.2" width="0.1524" layer="91"/>
<label x="213.36" y="76.2" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA29/XOUT1/TC-CLK0/TC-CLK1/SPI0-MOSI"/>
</segment>
</net>
<net name="!LED3" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="PB09/SSC-TXCLK/USART1-RI/ABDAC-DATAN1"/>
<wire x1="200.66" y1="40.64" x2="213.36" y2="40.64" width="0.1524" layer="91"/>
<label x="213.36" y="40.64" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="248.92" y1="91.44" x2="254" y2="91.44" width="0.1524" layer="91"/>
<pinref part="LED3" gate="G$1" pin="K"/>
<wire x1="254" y1="91.44" x2="254" y2="93.98" width="0.1524" layer="91"/>
<label x="248.92" y="91.44" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="LED3" gate="G$1" pin="A"/>
<pinref part="R42" gate="G$1" pin="1"/>
<wire x1="254" y1="99.06" x2="254" y2="101.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="D-"/>
<wire x1="22.86" y1="93.98" x2="45.72" y2="93.98" width="0.1524" layer="91"/>
<wire x1="45.72" y1="93.98" x2="45.72" y2="88.9" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="O2"/>
<wire x1="45.72" y1="88.9" x2="48.26" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$119" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="O1"/>
<wire x1="48.26" y1="83.82" x2="43.18" y2="83.82" width="0.1524" layer="91"/>
<wire x1="43.18" y1="83.82" x2="43.18" y2="91.44" width="0.1524" layer="91"/>
<pinref part="CN3" gate="G$1" pin="D+"/>
<wire x1="43.18" y1="91.44" x2="22.86" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$173" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="V+"/>
<wire x1="22.86" y1="96.52" x2="30.48" y2="96.52" width="0.1524" layer="91"/>
<pinref part="R33" gate="G$1" pin="2"/>
<wire x1="30.48" y1="96.52" x2="58.42" y2="96.52" width="0.1524" layer="91"/>
<wire x1="58.42" y1="96.52" x2="86.36" y2="96.52" width="0.1524" layer="91"/>
<wire x1="86.36" y1="93.98" x2="86.36" y2="96.52" width="0.1524" layer="91"/>
<pinref part="C22" gate="G$1" pin="1"/>
<wire x1="30.48" y1="88.9" x2="30.48" y2="96.52" width="0.1524" layer="91"/>
<junction x="30.48" y="96.52"/>
<pinref part="CN3" gate="G$1" pin="VBUS"/>
<wire x1="58.42" y1="93.98" x2="58.42" y2="96.52" width="0.1524" layer="91"/>
<junction x="58.42" y="96.52"/>
</segment>
</net>
<net name="FPGA_AUX2" class="0">
<segment>
<label x="213.36" y="104.14" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U5" gate="G$1" pin="PA19/XOUT0/PWM6/USART0-TXD/SPI0-MOSI/SSC-TXCLK"/>
<wire x1="213.36" y1="104.14" x2="200.66" y2="104.14" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
<sheet>
<description>Logic(2/2)</description>
<plain>
<wire x1="0" y1="0" x2="0" y2="279.4" width="0.1524" layer="97"/>
<wire x1="0" y1="0" x2="406.4" y2="0" width="0.1524" layer="97"/>
<wire x1="406.4" y1="0" x2="406.4" y2="279.4" width="0.1524" layer="97"/>
<wire x1="0" y1="279.4" x2="406.4" y2="279.4" width="0.1524" layer="97"/>
<text x="63.5" y="154.94" size="1.778" layer="97">光センサーの基板によって回路を変える</text>
<text x="53.34" y="208.28" size="1.778" layer="97">CN6,18は実装しない</text>
<wire x1="2.54" y1="71.12" x2="2.54" y2="2.54" width="0.508" layer="102"/>
<wire x1="2.54" y1="2.54" x2="127" y2="2.54" width="0.508" layer="102"/>
<wire x1="127" y1="2.54" x2="127" y2="55.88" width="0.508" layer="102"/>
<wire x1="127" y1="55.88" x2="218.44" y2="55.88" width="0.508" layer="102"/>
<wire x1="218.44" y1="55.88" x2="218.44" y2="2.54" width="0.508" layer="102"/>
<wire x1="218.44" y1="2.54" x2="403.86" y2="2.54" width="0.508" layer="102"/>
<wire x1="403.86" y1="2.54" x2="403.86" y2="276.86" width="0.508" layer="102"/>
<wire x1="403.86" y1="276.86" x2="167.64" y2="276.86" width="0.508" layer="102"/>
<wire x1="167.64" y1="276.86" x2="167.64" y2="71.12" width="0.508" layer="102"/>
<wire x1="2.54" y1="71.12" x2="167.64" y2="71.12" width="0.508" layer="102"/>
<wire x1="2.54" y1="165.1" x2="162.56" y2="165.1" width="0.508" layer="102"/>
<wire x1="162.56" y1="165.1" x2="162.56" y2="76.2" width="0.508" layer="102"/>
<wire x1="162.56" y1="76.2" x2="2.54" y2="76.2" width="0.508" layer="102"/>
<wire x1="2.54" y1="76.2" x2="2.54" y2="165.1" width="0.508" layer="102"/>
<wire x1="132.08" y1="50.8" x2="213.36" y2="50.8" width="0.508" layer="102"/>
<wire x1="213.36" y1="50.8" x2="213.36" y2="2.54" width="0.508" layer="102"/>
<wire x1="213.36" y1="2.54" x2="132.08" y2="2.54" width="0.508" layer="102"/>
<wire x1="132.08" y1="2.54" x2="132.08" y2="50.8" width="0.508" layer="102"/>
<wire x1="25.4" y1="215.9" x2="142.24" y2="170.18" width="0.508" layer="102"/>
<wire x1="142.24" y1="215.9" x2="25.4" y2="170.18" width="0.508" layer="102"/>
<wire x1="5.08" y1="274.32" x2="134.62" y2="274.32" width="0.508" layer="102"/>
<wire x1="134.62" y1="274.32" x2="134.62" y2="226.06" width="0.508" layer="102"/>
<wire x1="134.62" y1="226.06" x2="5.08" y2="226.06" width="0.508" layer="102"/>
<wire x1="5.08" y1="226.06" x2="5.08" y2="274.32" width="0.508" layer="102"/>
<text x="172.72" y="271.78" size="5.08" layer="102" align="center">③</text>
<text x="10.16" y="231.14" size="5.08" layer="102" align="center">⑦</text>
<text x="7.62" y="160.02" size="5.08" layer="102" align="center">⑤</text>
<text x="137.16" y="45.72" size="5.08" layer="102" align="center">⑦</text>
<wire x1="251.46" y1="50.8" x2="256.54" y2="43.18" width="0.508" layer="102"/>
<wire x1="251.46" y1="43.18" x2="256.54" y2="50.8" width="0.508" layer="102"/>
<wire x1="388.62" y1="66.04" x2="393.7" y2="58.42" width="0.508" layer="102"/>
<wire x1="388.62" y1="58.42" x2="393.7" y2="66.04" width="0.508" layer="102"/>
</plain>
<instances>
<instance part="U11" gate="G$1" x="40.64" y="50.8"/>
<instance part="C64" gate="G$1" x="25.4" y="58.42" rot="MR0"/>
<instance part="+P82" gate="1" x="25.4" y="68.58"/>
<instance part="GND153" gate="1" x="25.4" y="53.34"/>
<instance part="+P83" gate="1" x="17.78" y="48.26" rot="MR270"/>
<instance part="LED10" gate="G$1" x="114.3" y="15.24"/>
<instance part="LED9" gate="G$1" x="106.68" y="22.86"/>
<instance part="LED8" gate="G$1" x="99.06" y="15.24"/>
<instance part="LED4" gate="G$1" x="68.58" y="15.24"/>
<instance part="R52" gate="G$1" x="114.3" y="33.02" rot="R90"/>
<instance part="R51" gate="G$1" x="106.68" y="33.02" rot="R90"/>
<instance part="R50" gate="G$1" x="99.06" y="33.02" rot="R90"/>
<instance part="R46" gate="G$1" x="68.58" y="33.02" rot="R90"/>
<instance part="LED7" gate="G$1" x="91.44" y="22.86"/>
<instance part="LED6" gate="G$1" x="83.82" y="15.24"/>
<instance part="LED5" gate="G$1" x="76.2" y="22.86"/>
<instance part="R49" gate="G$1" x="91.44" y="33.02" rot="R90"/>
<instance part="R48" gate="G$1" x="83.82" y="33.02" rot="R90"/>
<instance part="R47" gate="G$1" x="76.2" y="33.02" rot="R90"/>
<instance part="GND154" gate="1" x="91.44" y="7.62"/>
<instance part="C65" gate="G$1" x="38.1" y="17.78"/>
<instance part="R45" gate="G$1" x="50.8" y="25.4"/>
<instance part="GND160" gate="1" x="38.1" y="12.7"/>
<instance part="U9" gate="L" x="233.68" y="180.34"/>
<instance part="U9" gate="B" x="297.18" y="129.54"/>
<instance part="U9" gate="R" x="360.68" y="180.34"/>
<instance part="U9" gate="T" x="297.18" y="231.14"/>
<instance part="GND48" gate="1" x="365.76" y="144.78"/>
<instance part="+P20" gate="1" x="337.82" y="124.46" rot="MR90"/>
<instance part="+P23" gate="1" x="294.64" y="88.9" rot="MR0"/>
<instance part="GND50" gate="1" x="294.64" y="66.04"/>
<instance part="C38" gate="G$1" x="289.56" y="73.66" rot="MR0"/>
<instance part="R44" gate="G$1" x="236.22" y="116.84" rot="R90"/>
<instance part="GND54" gate="1" x="236.22" y="109.22"/>
<instance part="U8" gate="A" x="246.38" y="124.46"/>
<instance part="U8" gate="P" x="294.64" y="76.2"/>
<instance part="U10" gate="A" x="335.28" y="99.06" rot="MR0"/>
<instance part="U10" gate="P" x="309.88" y="76.2"/>
<instance part="P1" gate="G$1" x="368.3" y="251.46"/>
<instance part="P2" gate="G$1" x="368.3" y="248.92"/>
<instance part="P3" gate="G$1" x="368.3" y="246.38"/>
<instance part="P4" gate="G$1" x="368.3" y="243.84"/>
<instance part="+P16" gate="G$1" x="398.78" y="68.58" rot="R270"/>
<instance part="+P17" gate="1" x="246.38" y="53.34" rot="MR270"/>
<instance part="+P18" gate="1" x="231.14" y="33.02" rot="MR270"/>
<instance part="+P19" gate="1" x="386.08" y="33.02" rot="R270"/>
<instance part="GND42" gate="1" x="320.04" y="7.62"/>
<instance part="C44" gate="G$1" x="261.62" y="45.72"/>
<instance part="C46" gate="G$1" x="269.24" y="45.72"/>
<instance part="C48" gate="G$1" x="276.86" y="45.72"/>
<instance part="C50" gate="G$1" x="284.48" y="45.72"/>
<instance part="C52" gate="G$1" x="292.1" y="45.72"/>
<instance part="GND43" gate="1" x="292.1" y="38.1"/>
<instance part="GND44" gate="1" x="365.76" y="40.64"/>
<instance part="C41" gate="G$1" x="254" y="25.4"/>
<instance part="C43" gate="G$1" x="261.62" y="25.4"/>
<instance part="C45" gate="G$1" x="269.24" y="25.4"/>
<instance part="C47" gate="G$1" x="276.86" y="25.4"/>
<instance part="C49" gate="G$1" x="284.48" y="25.4"/>
<instance part="C51" gate="G$1" x="292.1" y="25.4"/>
<instance part="GND45" gate="1" x="292.1" y="17.78"/>
<instance part="C53" gate="G$1" x="347.98" y="25.4"/>
<instance part="C54" gate="G$1" x="355.6" y="25.4"/>
<instance part="C57" gate="G$1" x="363.22" y="25.4"/>
<instance part="C59" gate="G$1" x="370.84" y="25.4"/>
<instance part="C61" gate="G$1" x="378.46" y="25.4"/>
<instance part="GND46" gate="1" x="347.98" y="17.78"/>
<instance part="U9" gate="P" x="320.04" y="33.02"/>
<instance part="C62" gate="G$1" x="375.92" y="68.58"/>
<instance part="C60" gate="G$1" x="370.84" y="63.5"/>
<instance part="C58" gate="G$1" x="365.76" y="58.42"/>
<instance part="C56" gate="G$1" x="360.68" y="53.34"/>
<instance part="C55" gate="G$1" x="355.6" y="48.26"/>
<instance part="C39" gate="G$1" x="238.76" y="25.4"/>
<instance part="C40" gate="G$1" x="246.38" y="25.4"/>
<instance part="C63" gate="G$1" x="391.16" y="60.96"/>
<instance part="GND161" gate="1" x="391.16" y="55.88"/>
<instance part="C42" gate="G$1" x="254" y="45.72"/>
<instance part="GND14" gate="1" x="254" y="40.64"/>
<instance part="BZ1" gate="G$1" x="190.5" y="33.02"/>
<instance part="GND84" gate="1" x="154.94" y="22.86"/>
<instance part="CN8" gate="G$1" x="25.4" y="129.54" rot="MR0"/>
<instance part="R56" gate="G$1" x="68.58" y="144.78"/>
<instance part="+P74" gate="1" x="50.8" y="162.56"/>
<instance part="GND143" gate="1" x="33.02" y="119.38"/>
<instance part="VR1" gate="G$1" x="50.8" y="127" rot="MR270"/>
<instance part="+P76" gate="1" x="101.6" y="127" rot="R270"/>
<instance part="R58" gate="G$1" x="76.2" y="127"/>
<instance part="R59" gate="G$1" x="76.2" y="119.38"/>
<instance part="C67" gate="G$1" x="93.98" y="119.38"/>
<instance part="GND144" gate="1" x="93.98" y="114.3"/>
<instance part="+P75" gate="1" x="101.6" y="104.14" rot="R270"/>
<instance part="RF1" gate="G$1" x="83.82" y="104.14"/>
<instance part="U12" gate="G$1" x="50.8" y="99.06" rot="MR0"/>
<instance part="GND149" gate="1" x="38.1" y="91.44"/>
<instance part="R61" gate="G$1" x="71.12" y="99.06"/>
<instance part="R60" gate="G$1" x="66.04" y="88.9" rot="R90"/>
<instance part="GND150" gate="1" x="66.04" y="81.28"/>
<instance part="RF2" gate="G$1" x="91.44" y="99.06"/>
<instance part="+P80" gate="1" x="101.6" y="99.06" rot="MR90"/>
<instance part="R57" gate="G$1" x="68.58" y="137.16"/>
<instance part="R54" gate="G$1" x="45.72" y="152.4" rot="R90"/>
<instance part="R55" gate="G$1" x="55.88" y="152.4" rot="R90"/>
<instance part="U13" gate="G$1" x="167.64" y="25.4"/>
<instance part="+P49" gate="1" x="187.96" y="20.32" rot="MR90"/>
<instance part="+P84" gate="1" x="149.86" y="33.02" rot="MR270"/>
<instance part="CN7" gate="G$1" x="88.9" y="251.46"/>
<instance part="GND74" gate="1" x="63.5" y="236.22"/>
<instance part="FB1" gate="G$1" x="22.86" y="261.62"/>
<instance part="C66" gate="G$1" x="30.48" y="254"/>
<instance part="GND47" gate="1" x="30.48" y="248.92"/>
<instance part="+P40" gate="1" x="12.7" y="261.62" rot="MR270"/>
<instance part="R53" gate="G$1" x="58.42" y="246.38" rot="R90"/>
<instance part="GND38" gate="1" x="58.42" y="236.22"/>
<instance part="CN6" gate="G$1" x="50.8" y="187.96"/>
<instance part="+P60" gate="1" x="45.72" y="203.2"/>
<instance part="GND152" gate="1" x="45.72" y="177.8"/>
<instance part="CN18" gate="G$1" x="101.6" y="187.96"/>
<instance part="GND158" gate="1" x="91.44" y="180.34"/>
<instance part="+P61" gate="1" x="109.22" y="198.12" rot="MR0"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="U11" gate="G$1" pin="GND"/>
<wire x1="30.48" y1="55.88" x2="25.4" y2="55.88" width="0.1524" layer="91"/>
<pinref part="C64" gate="G$1" pin="2"/>
<pinref part="GND153" gate="1" pin="GND"/>
<junction x="25.4" y="55.88"/>
</segment>
<segment>
<pinref part="LED9" gate="G$1" pin="K"/>
<wire x1="106.68" y1="20.32" x2="106.68" y2="10.16" width="0.1524" layer="91"/>
<pinref part="LED8" gate="G$1" pin="K"/>
<wire x1="99.06" y1="12.7" x2="99.06" y2="10.16" width="0.1524" layer="91"/>
<wire x1="99.06" y1="10.16" x2="106.68" y2="10.16" width="0.1524" layer="91"/>
<pinref part="LED10" gate="G$1" pin="K"/>
<wire x1="114.3" y1="12.7" x2="114.3" y2="10.16" width="0.1524" layer="91"/>
<wire x1="106.68" y1="10.16" x2="114.3" y2="10.16" width="0.1524" layer="91"/>
<junction x="99.06" y="10.16"/>
<junction x="106.68" y="10.16"/>
<wire x1="76.2" y1="10.16" x2="83.82" y2="10.16" width="0.1524" layer="91"/>
<pinref part="LED5" gate="G$1" pin="K"/>
<wire x1="83.82" y1="10.16" x2="91.44" y2="10.16" width="0.1524" layer="91"/>
<wire x1="91.44" y1="10.16" x2="99.06" y2="10.16" width="0.1524" layer="91"/>
<wire x1="76.2" y1="20.32" x2="76.2" y2="10.16" width="0.1524" layer="91"/>
<pinref part="LED6" gate="G$1" pin="K"/>
<wire x1="83.82" y1="12.7" x2="83.82" y2="10.16" width="0.1524" layer="91"/>
<pinref part="LED7" gate="G$1" pin="K"/>
<wire x1="91.44" y1="20.32" x2="91.44" y2="10.16" width="0.1524" layer="91"/>
<pinref part="GND154" gate="1" pin="GND"/>
<junction x="91.44" y="10.16"/>
<junction x="91.44" y="10.16"/>
<junction x="83.82" y="10.16"/>
<pinref part="LED4" gate="G$1" pin="K"/>
<wire x1="68.58" y1="12.7" x2="68.58" y2="10.16" width="0.1524" layer="91"/>
<wire x1="68.58" y1="10.16" x2="76.2" y2="10.16" width="0.1524" layer="91"/>
<junction x="76.2" y="10.16"/>
</segment>
<segment>
<pinref part="C65" gate="G$1" pin="2"/>
<pinref part="GND160" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND50" gate="1" pin="GND"/>
<wire x1="294.64" y1="68.58" x2="289.56" y2="68.58" width="0.1524" layer="91"/>
<wire x1="294.64" y1="68.58" x2="294.64" y2="71.12" width="0.1524" layer="91"/>
<junction x="294.64" y="68.58"/>
<pinref part="C38" gate="G$1" pin="2"/>
<wire x1="289.56" y1="68.58" x2="289.56" y2="71.12" width="0.1524" layer="91"/>
<pinref part="U8" gate="P" pin="GND"/>
<pinref part="U10" gate="P" pin="GND"/>
<wire x1="309.88" y1="71.12" x2="309.88" y2="68.58" width="0.1524" layer="91"/>
<wire x1="309.88" y1="68.58" x2="294.64" y2="68.58" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R44" gate="G$1" pin="1"/>
<pinref part="GND54" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U9" gate="R" pin="SUSPEND"/>
<pinref part="GND48" gate="1" pin="GND"/>
<wire x1="363.22" y1="147.32" x2="365.76" y2="147.32" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C52" gate="G$1" pin="2"/>
<pinref part="GND43" gate="1" pin="GND"/>
<wire x1="292.1" y1="40.64" x2="292.1" y2="43.18" width="0.1524" layer="91"/>
<pinref part="C44" gate="G$1" pin="2"/>
<wire x1="292.1" y1="40.64" x2="284.48" y2="40.64" width="0.1524" layer="91"/>
<wire x1="284.48" y1="40.64" x2="276.86" y2="40.64" width="0.1524" layer="91"/>
<wire x1="276.86" y1="40.64" x2="269.24" y2="40.64" width="0.1524" layer="91"/>
<wire x1="269.24" y1="40.64" x2="261.62" y2="40.64" width="0.1524" layer="91"/>
<wire x1="261.62" y1="40.64" x2="261.62" y2="43.18" width="0.1524" layer="91"/>
<pinref part="C50" gate="G$1" pin="2"/>
<wire x1="284.48" y1="40.64" x2="284.48" y2="43.18" width="0.1524" layer="91"/>
<pinref part="C48" gate="G$1" pin="2"/>
<wire x1="276.86" y1="40.64" x2="276.86" y2="43.18" width="0.1524" layer="91"/>
<pinref part="C46" gate="G$1" pin="2"/>
<wire x1="269.24" y1="40.64" x2="269.24" y2="43.18" width="0.1524" layer="91"/>
<junction x="292.1" y="40.64"/>
<junction x="284.48" y="40.64"/>
<junction x="276.86" y="40.64"/>
<junction x="269.24" y="40.64"/>
</segment>
<segment>
<pinref part="C51" gate="G$1" pin="2"/>
<pinref part="GND45" gate="1" pin="GND"/>
<wire x1="292.1" y1="20.32" x2="292.1" y2="22.86" width="0.1524" layer="91"/>
<pinref part="C41" gate="G$1" pin="2"/>
<wire x1="254" y1="22.86" x2="254" y2="20.32" width="0.1524" layer="91"/>
<wire x1="254" y1="20.32" x2="261.62" y2="20.32" width="0.1524" layer="91"/>
<pinref part="C49" gate="G$1" pin="2"/>
<wire x1="261.62" y1="20.32" x2="269.24" y2="20.32" width="0.1524" layer="91"/>
<wire x1="269.24" y1="20.32" x2="276.86" y2="20.32" width="0.1524" layer="91"/>
<wire x1="276.86" y1="20.32" x2="284.48" y2="20.32" width="0.1524" layer="91"/>
<wire x1="284.48" y1="20.32" x2="292.1" y2="20.32" width="0.1524" layer="91"/>
<wire x1="284.48" y1="20.32" x2="284.48" y2="22.86" width="0.1524" layer="91"/>
<pinref part="C47" gate="G$1" pin="2"/>
<wire x1="276.86" y1="20.32" x2="276.86" y2="22.86" width="0.1524" layer="91"/>
<pinref part="C45" gate="G$1" pin="2"/>
<wire x1="269.24" y1="20.32" x2="269.24" y2="22.86" width="0.1524" layer="91"/>
<pinref part="C43" gate="G$1" pin="2"/>
<wire x1="261.62" y1="20.32" x2="261.62" y2="22.86" width="0.1524" layer="91"/>
<junction x="261.62" y="20.32"/>
<junction x="269.24" y="20.32"/>
<junction x="276.86" y="20.32"/>
<junction x="284.48" y="20.32"/>
<junction x="292.1" y="20.32"/>
<pinref part="C40" gate="G$1" pin="2"/>
<wire x1="246.38" y1="22.86" x2="246.38" y2="20.32" width="0.1524" layer="91"/>
<wire x1="246.38" y1="20.32" x2="254" y2="20.32" width="0.1524" layer="91"/>
<pinref part="C39" gate="G$1" pin="2"/>
<wire x1="238.76" y1="22.86" x2="238.76" y2="20.32" width="0.1524" layer="91"/>
<wire x1="238.76" y1="20.32" x2="246.38" y2="20.32" width="0.1524" layer="91"/>
<junction x="254" y="20.32"/>
<junction x="246.38" y="20.32"/>
</segment>
<segment>
<pinref part="C53" gate="G$1" pin="2"/>
<pinref part="GND46" gate="1" pin="GND"/>
<wire x1="347.98" y1="20.32" x2="347.98" y2="22.86" width="0.1524" layer="91"/>
<wire x1="347.98" y1="20.32" x2="355.6" y2="20.32" width="0.1524" layer="91"/>
<pinref part="C54" gate="G$1" pin="2"/>
<wire x1="355.6" y1="20.32" x2="355.6" y2="22.86" width="0.1524" layer="91"/>
<pinref part="C57" gate="G$1" pin="2"/>
<wire x1="363.22" y1="22.86" x2="363.22" y2="20.32" width="0.1524" layer="91"/>
<wire x1="363.22" y1="20.32" x2="355.6" y2="20.32" width="0.1524" layer="91"/>
<wire x1="363.22" y1="20.32" x2="370.84" y2="20.32" width="0.1524" layer="91"/>
<pinref part="C59" gate="G$1" pin="2"/>
<wire x1="370.84" y1="20.32" x2="370.84" y2="22.86" width="0.1524" layer="91"/>
<wire x1="370.84" y1="20.32" x2="378.46" y2="20.32" width="0.1524" layer="91"/>
<pinref part="C61" gate="G$1" pin="2"/>
<wire x1="378.46" y1="20.32" x2="378.46" y2="22.86" width="0.1524" layer="91"/>
<junction x="370.84" y="20.32"/>
<junction x="363.22" y="20.32"/>
<junction x="355.6" y="20.32"/>
<junction x="347.98" y="20.32"/>
</segment>
<segment>
<pinref part="GND42" gate="1" pin="GND"/>
<pinref part="U9" gate="P" pin="GND"/>
</segment>
<segment>
<pinref part="C62" gate="G$1" pin="GND"/>
<wire x1="375.92" y1="66.04" x2="375.92" y2="43.18" width="0.1524" layer="91"/>
<wire x1="375.92" y1="43.18" x2="370.84" y2="43.18" width="0.1524" layer="91"/>
<pinref part="C58" gate="G$1" pin="GND"/>
<wire x1="370.84" y1="43.18" x2="365.76" y2="43.18" width="0.1524" layer="91"/>
<wire x1="365.76" y1="43.18" x2="365.76" y2="55.88" width="0.1524" layer="91"/>
<pinref part="C56" gate="G$1" pin="GND"/>
<wire x1="360.68" y1="50.8" x2="360.68" y2="43.18" width="0.1524" layer="91"/>
<wire x1="360.68" y1="43.18" x2="365.76" y2="43.18" width="0.1524" layer="91"/>
<pinref part="C55" gate="G$1" pin="GND"/>
<wire x1="355.6" y1="45.72" x2="355.6" y2="43.18" width="0.1524" layer="91"/>
<wire x1="355.6" y1="43.18" x2="360.68" y2="43.18" width="0.1524" layer="91"/>
<pinref part="C60" gate="G$1" pin="GND"/>
<wire x1="370.84" y1="60.96" x2="370.84" y2="43.18" width="0.1524" layer="91"/>
<pinref part="GND44" gate="1" pin="GND"/>
<junction x="365.76" y="43.18"/>
<junction x="360.68" y="43.18"/>
<junction x="370.84" y="43.18"/>
</segment>
<segment>
<pinref part="C63" gate="G$1" pin="2"/>
<pinref part="GND161" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C42" gate="G$1" pin="2"/>
<pinref part="GND14" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="CN8" gate="G$1" pin="2"/>
<wire x1="27.94" y1="129.54" x2="33.02" y2="129.54" width="0.1524" layer="91"/>
<wire x1="33.02" y1="129.54" x2="33.02" y2="121.92" width="0.1524" layer="91"/>
<pinref part="GND143" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C67" gate="G$1" pin="2"/>
<pinref part="GND144" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U12" gate="G$1" pin="R2"/>
<wire x1="40.64" y1="93.98" x2="38.1" y2="93.98" width="0.1524" layer="91"/>
<pinref part="GND149" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R60" gate="G$1" pin="1"/>
<pinref part="GND150" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND84" gate="1" pin="GND"/>
<pinref part="U13" gate="G$1" pin="GND"/>
<wire x1="154.94" y1="25.4" x2="157.48" y2="25.4" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="CN7" gate="G$1" pin="GND"/>
<wire x1="66.04" y1="238.76" x2="63.5" y2="238.76" width="0.1524" layer="91"/>
<pinref part="GND74" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C66" gate="G$1" pin="2"/>
<pinref part="GND47" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND38" gate="1" pin="GND"/>
<pinref part="R53" gate="G$1" pin="1"/>
<wire x1="58.42" y1="238.76" x2="58.42" y2="241.3" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND152" gate="1" pin="GND"/>
<pinref part="CN6" gate="G$1" pin="8"/>
<wire x1="45.72" y1="180.34" x2="48.26" y2="180.34" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="CN18" gate="G$1" pin="1"/>
<wire x1="93.98" y1="193.04" x2="91.44" y2="193.04" width="0.1524" layer="91"/>
<wire x1="91.44" y1="193.04" x2="91.44" y2="182.88" width="0.1524" layer="91"/>
<pinref part="GND158" gate="1" pin="GND"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="U11" gate="G$1" pin="VCC"/>
<wire x1="30.48" y1="63.5" x2="25.4" y2="63.5" width="0.1524" layer="91"/>
<pinref part="C64" gate="G$1" pin="1"/>
<wire x1="25.4" y1="63.5" x2="25.4" y2="66.04" width="0.1524" layer="91"/>
<pinref part="+P82" gate="1" pin="+3V3"/>
<junction x="25.4" y="63.5"/>
</segment>
<segment>
<pinref part="U11" gate="G$1" pin="!CLR"/>
<pinref part="+P83" gate="1" pin="+3V3"/>
<wire x1="30.48" y1="48.26" x2="27.94" y2="48.26" width="0.1524" layer="91"/>
<pinref part="U11" gate="G$1" pin="A"/>
<wire x1="27.94" y1="48.26" x2="20.32" y2="48.26" width="0.1524" layer="91"/>
<wire x1="30.48" y1="43.18" x2="27.94" y2="43.18" width="0.1524" layer="91"/>
<wire x1="27.94" y1="43.18" x2="27.94" y2="48.26" width="0.1524" layer="91"/>
<junction x="27.94" y="48.26"/>
</segment>
<segment>
<pinref part="+P20" gate="1" pin="+3V3"/>
<pinref part="U9" gate="B" pin="CMPCS_B_2"/>
<wire x1="335.28" y1="124.46" x2="332.74" y2="124.46" width="0.1524" layer="91"/>
<wire x1="332.74" y1="124.46" x2="332.74" y2="127" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="+P23" gate="1" pin="+3V3"/>
<wire x1="294.64" y1="86.36" x2="294.64" y2="83.82" width="0.1524" layer="91"/>
<pinref part="U8" gate="P" pin="VCC"/>
<pinref part="C38" gate="G$1" pin="1"/>
<wire x1="294.64" y1="83.82" x2="294.64" y2="81.28" width="0.1524" layer="91"/>
<wire x1="289.56" y1="78.74" x2="289.56" y2="83.82" width="0.1524" layer="91"/>
<wire x1="289.56" y1="83.82" x2="294.64" y2="83.82" width="0.1524" layer="91"/>
<wire x1="294.64" y1="83.82" x2="309.88" y2="83.82" width="0.1524" layer="91"/>
<pinref part="U10" gate="P" pin="VCC"/>
<wire x1="309.88" y1="83.82" x2="309.88" y2="81.28" width="0.1524" layer="91"/>
<junction x="294.64" y="83.82"/>
</segment>
<segment>
<pinref part="+P17" gate="1" pin="+3V3"/>
<wire x1="248.92" y1="53.34" x2="254" y2="53.34" width="0.1524" layer="91"/>
<pinref part="C52" gate="G$1" pin="1"/>
<wire x1="254" y1="53.34" x2="261.62" y2="53.34" width="0.1524" layer="91"/>
<wire x1="261.62" y1="53.34" x2="269.24" y2="53.34" width="0.1524" layer="91"/>
<wire x1="269.24" y1="53.34" x2="276.86" y2="53.34" width="0.1524" layer="91"/>
<wire x1="276.86" y1="53.34" x2="284.48" y2="53.34" width="0.1524" layer="91"/>
<wire x1="284.48" y1="53.34" x2="292.1" y2="53.34" width="0.1524" layer="91"/>
<wire x1="292.1" y1="53.34" x2="299.72" y2="53.34" width="0.1524" layer="91"/>
<wire x1="299.72" y1="53.34" x2="299.72" y2="50.8" width="0.1524" layer="91"/>
<wire x1="299.72" y1="50.8" x2="302.26" y2="50.8" width="0.1524" layer="91"/>
<wire x1="292.1" y1="50.8" x2="292.1" y2="53.34" width="0.1524" layer="91"/>
<pinref part="C50" gate="G$1" pin="1"/>
<wire x1="284.48" y1="50.8" x2="284.48" y2="53.34" width="0.1524" layer="91"/>
<pinref part="C48" gate="G$1" pin="1"/>
<wire x1="276.86" y1="50.8" x2="276.86" y2="53.34" width="0.1524" layer="91"/>
<pinref part="C46" gate="G$1" pin="1"/>
<wire x1="269.24" y1="50.8" x2="269.24" y2="53.34" width="0.1524" layer="91"/>
<pinref part="C44" gate="G$1" pin="1"/>
<wire x1="261.62" y1="50.8" x2="261.62" y2="53.34" width="0.1524" layer="91"/>
<junction x="261.62" y="53.34"/>
<junction x="269.24" y="53.34"/>
<junction x="276.86" y="53.34"/>
<junction x="284.48" y="53.34"/>
<junction x="292.1" y="53.34"/>
<pinref part="U9" gate="P" pin="VCCAUX"/>
<pinref part="C42" gate="G$1" pin="1"/>
<wire x1="254" y1="50.8" x2="254" y2="53.34" width="0.1524" layer="91"/>
<junction x="254" y="53.34"/>
</segment>
<segment>
<wire x1="299.72" y1="33.02" x2="302.26" y2="33.02" width="0.1524" layer="91"/>
<wire x1="302.26" y1="15.24" x2="299.72" y2="15.24" width="0.1524" layer="91"/>
<wire x1="299.72" y1="15.24" x2="299.72" y2="33.02" width="0.1524" layer="91"/>
<pinref part="+P18" gate="1" pin="+3V3"/>
<wire x1="299.72" y1="33.02" x2="292.1" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C51" gate="G$1" pin="1"/>
<wire x1="292.1" y1="33.02" x2="284.48" y2="33.02" width="0.1524" layer="91"/>
<wire x1="284.48" y1="33.02" x2="276.86" y2="33.02" width="0.1524" layer="91"/>
<wire x1="276.86" y1="33.02" x2="269.24" y2="33.02" width="0.1524" layer="91"/>
<wire x1="269.24" y1="33.02" x2="261.62" y2="33.02" width="0.1524" layer="91"/>
<wire x1="261.62" y1="33.02" x2="254" y2="33.02" width="0.1524" layer="91"/>
<wire x1="254" y1="33.02" x2="246.38" y2="33.02" width="0.1524" layer="91"/>
<wire x1="246.38" y1="33.02" x2="238.76" y2="33.02" width="0.1524" layer="91"/>
<wire x1="238.76" y1="33.02" x2="233.68" y2="33.02" width="0.1524" layer="91"/>
<wire x1="292.1" y1="30.48" x2="292.1" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C49" gate="G$1" pin="1"/>
<wire x1="284.48" y1="30.48" x2="284.48" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C47" gate="G$1" pin="1"/>
<wire x1="276.86" y1="30.48" x2="276.86" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C45" gate="G$1" pin="1"/>
<wire x1="269.24" y1="30.48" x2="269.24" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C43" gate="G$1" pin="1"/>
<wire x1="261.62" y1="30.48" x2="261.62" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C41" gate="G$1" pin="1"/>
<wire x1="254" y1="30.48" x2="254" y2="33.02" width="0.1524" layer="91"/>
<junction x="299.72" y="33.02"/>
<junction x="292.1" y="33.02"/>
<junction x="284.48" y="33.02"/>
<junction x="276.86" y="33.02"/>
<junction x="269.24" y="33.02"/>
<junction x="261.62" y="33.02"/>
<junction x="254" y="33.02"/>
<pinref part="U9" gate="P" pin="VCCO_0"/>
<pinref part="U9" gate="P" pin="VCCO_1"/>
<pinref part="C39" gate="G$1" pin="1"/>
<wire x1="238.76" y1="30.48" x2="238.76" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C40" gate="G$1" pin="1"/>
<wire x1="246.38" y1="30.48" x2="246.38" y2="33.02" width="0.1524" layer="91"/>
<junction x="238.76" y="33.02"/>
<junction x="246.38" y="33.02"/>
</segment>
<segment>
<wire x1="340.36" y1="33.02" x2="337.82" y2="33.02" width="0.1524" layer="91"/>
<wire x1="340.36" y1="15.24" x2="340.36" y2="33.02" width="0.1524" layer="91"/>
<wire x1="337.82" y1="15.24" x2="340.36" y2="15.24" width="0.1524" layer="91"/>
<pinref part="+P19" gate="1" pin="+3V3"/>
<wire x1="383.54" y1="33.02" x2="378.46" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C53" gate="G$1" pin="1"/>
<wire x1="378.46" y1="33.02" x2="370.84" y2="33.02" width="0.1524" layer="91"/>
<wire x1="370.84" y1="33.02" x2="363.22" y2="33.02" width="0.1524" layer="91"/>
<wire x1="363.22" y1="33.02" x2="355.6" y2="33.02" width="0.1524" layer="91"/>
<wire x1="355.6" y1="33.02" x2="347.98" y2="33.02" width="0.1524" layer="91"/>
<wire x1="347.98" y1="33.02" x2="340.36" y2="33.02" width="0.1524" layer="91"/>
<wire x1="347.98" y1="30.48" x2="347.98" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C54" gate="G$1" pin="1"/>
<wire x1="355.6" y1="30.48" x2="355.6" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C57" gate="G$1" pin="1"/>
<wire x1="363.22" y1="30.48" x2="363.22" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C59" gate="G$1" pin="1"/>
<wire x1="370.84" y1="30.48" x2="370.84" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C61" gate="G$1" pin="1"/>
<wire x1="378.46" y1="30.48" x2="378.46" y2="33.02" width="0.1524" layer="91"/>
<junction x="378.46" y="33.02"/>
<junction x="370.84" y="33.02"/>
<junction x="363.22" y="33.02"/>
<junction x="355.6" y="33.02"/>
<junction x="347.98" y="33.02"/>
<junction x="340.36" y="33.02"/>
<pinref part="U9" gate="P" pin="VCCO_2"/>
<pinref part="U9" gate="P" pin="VCCO_3"/>
</segment>
<segment>
<pinref part="+P76" gate="1" pin="+3V3"/>
<pinref part="R58" gate="G$1" pin="2"/>
<wire x1="99.06" y1="127" x2="93.98" y2="127" width="0.1524" layer="91"/>
<wire x1="93.98" y1="127" x2="81.28" y2="127" width="0.1524" layer="91"/>
<wire x1="81.28" y1="127" x2="78.74" y2="127" width="0.1524" layer="91"/>
<wire x1="81.28" y1="127" x2="81.28" y2="119.38" width="0.1524" layer="91"/>
<wire x1="81.28" y1="119.38" x2="78.74" y2="119.38" width="0.1524" layer="91"/>
<pinref part="R59" gate="G$1" pin="2"/>
<junction x="81.28" y="127"/>
<pinref part="C67" gate="G$1" pin="1"/>
<wire x1="93.98" y1="124.46" x2="93.98" y2="127" width="0.1524" layer="91"/>
<junction x="93.98" y="127"/>
</segment>
<segment>
<pinref part="RF2" gate="G$1" pin="2"/>
<pinref part="+P80" gate="1" pin="+3V3"/>
<wire x1="96.52" y1="99.06" x2="99.06" y2="99.06" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R55" gate="G$1" pin="2"/>
<wire x1="55.88" y1="154.94" x2="55.88" y2="157.48" width="0.1524" layer="91"/>
<wire x1="55.88" y1="157.48" x2="50.8" y2="157.48" width="0.1524" layer="91"/>
<pinref part="+P74" gate="1" pin="+3V3"/>
<wire x1="50.8" y1="157.48" x2="50.8" y2="160.02" width="0.1524" layer="91"/>
<wire x1="50.8" y1="157.48" x2="45.72" y2="157.48" width="0.1524" layer="91"/>
<pinref part="R54" gate="G$1" pin="2"/>
<wire x1="45.72" y1="157.48" x2="45.72" y2="154.94" width="0.1524" layer="91"/>
<junction x="50.8" y="157.48"/>
</segment>
<segment>
<pinref part="U13" gate="G$1" pin="EN1"/>
<wire x1="177.8" y1="20.32" x2="180.34" y2="20.32" width="0.1524" layer="91"/>
<pinref part="U13" gate="G$1" pin="EN2"/>
<wire x1="180.34" y1="20.32" x2="185.42" y2="20.32" width="0.1524" layer="91"/>
<wire x1="177.8" y1="17.78" x2="180.34" y2="17.78" width="0.1524" layer="91"/>
<wire x1="180.34" y1="17.78" x2="180.34" y2="20.32" width="0.1524" layer="91"/>
<pinref part="+P49" gate="1" pin="+3V3"/>
<junction x="180.34" y="20.32"/>
</segment>
<segment>
<pinref part="U13" gate="G$1" pin="VIN"/>
<wire x1="157.48" y1="33.02" x2="152.4" y2="33.02" width="0.1524" layer="91"/>
<pinref part="+P84" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="+P40" gate="1" pin="+3V3"/>
<pinref part="FB1" gate="G$1" pin="1"/>
<wire x1="15.24" y1="261.62" x2="17.78" y2="261.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="CN6" gate="G$1" pin="1"/>
<wire x1="48.26" y1="198.12" x2="45.72" y2="198.12" width="0.1524" layer="91"/>
<wire x1="45.72" y1="198.12" x2="45.72" y2="200.66" width="0.1524" layer="91"/>
<pinref part="+P60" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="CN18" gate="G$1" pin="2"/>
<wire x1="106.68" y1="193.04" x2="109.22" y2="193.04" width="0.1524" layer="91"/>
<wire x1="109.22" y1="193.04" x2="109.22" y2="195.58" width="0.1524" layer="91"/>
<pinref part="+P61" gate="1" pin="+3V3"/>
</segment>
</net>
<net name="LED_CLK" class="0">
<segment>
<pinref part="U11" gate="G$1" pin="CK"/>
<wire x1="30.48" y1="45.72" x2="25.4" y2="45.72" width="0.1524" layer="91"/>
<label x="25.4" y="45.72" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<label x="287.02" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L35N_GCLK16_0"/>
<wire x1="287.02" y1="238.76" x2="287.02" y2="233.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="LED_DO" class="0">
<segment>
<pinref part="U11" gate="G$1" pin="B"/>
<wire x1="30.48" y1="40.64" x2="25.4" y2="40.64" width="0.1524" layer="91"/>
<label x="25.4" y="40.64" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<label x="292.1" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L36N_GCLK14_0"/>
<wire x1="292.1" y1="238.76" x2="292.1" y2="233.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$153" class="0">
<segment>
<pinref part="R50" gate="G$1" pin="1"/>
<pinref part="LED8" gate="G$1" pin="A"/>
<wire x1="99.06" y1="27.94" x2="99.06" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$154" class="0">
<segment>
<pinref part="LED9" gate="G$1" pin="A"/>
<pinref part="R51" gate="G$1" pin="1"/>
<wire x1="106.68" y1="25.4" x2="106.68" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$155" class="0">
<segment>
<pinref part="R52" gate="G$1" pin="1"/>
<pinref part="LED10" gate="G$1" pin="A"/>
<wire x1="114.3" y1="27.94" x2="114.3" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="BUZZER_PWM" class="0">
<segment>
<wire x1="33.02" y1="25.4" x2="38.1" y2="25.4" width="0.1524" layer="91"/>
<label x="33.02" y="25.4" size="1.27" layer="95" font="vector" rot="R180" xref="yes"/>
<pinref part="R45" gate="G$1" pin="1"/>
<pinref part="C65" gate="G$1" pin="1"/>
<wire x1="38.1" y1="25.4" x2="45.72" y2="25.4" width="0.1524" layer="91"/>
<wire x1="38.1" y1="22.86" x2="38.1" y2="25.4" width="0.1524" layer="91"/>
<junction x="38.1" y="25.4"/>
</segment>
<segment>
<label x="149.86" y="17.78" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U13" gate="G$1" pin="DIN"/>
<wire x1="149.86" y1="17.78" x2="157.48" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$146" class="0">
<segment>
<pinref part="R46" gate="G$1" pin="1"/>
<pinref part="LED4" gate="G$1" pin="A"/>
<wire x1="68.58" y1="27.94" x2="68.58" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$148" class="0">
<segment>
<pinref part="R49" gate="G$1" pin="1"/>
<pinref part="LED7" gate="G$1" pin="A"/>
<wire x1="91.44" y1="27.94" x2="91.44" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$149" class="0">
<segment>
<pinref part="R48" gate="G$1" pin="1"/>
<pinref part="LED6" gate="G$1" pin="A"/>
<wire x1="83.82" y1="27.94" x2="83.82" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$150" class="0">
<segment>
<pinref part="R47" gate="G$1" pin="1"/>
<pinref part="LED5" gate="G$1" pin="A"/>
<wire x1="76.2" y1="27.94" x2="76.2" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$152" class="0">
<segment>
<pinref part="R47" gate="G$1" pin="2"/>
<wire x1="76.2" y1="35.56" x2="76.2" y2="45.72" width="0.1524" layer="91"/>
<pinref part="U11" gate="G$1" pin="QG"/>
<wire x1="50.8" y1="45.72" x2="76.2" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$156" class="0">
<segment>
<pinref part="R48" gate="G$1" pin="2"/>
<wire x1="83.82" y1="48.26" x2="83.82" y2="35.56" width="0.1524" layer="91"/>
<pinref part="U11" gate="G$1" pin="QF"/>
<wire x1="83.82" y1="48.26" x2="50.8" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$157" class="0">
<segment>
<pinref part="R49" gate="G$1" pin="2"/>
<wire x1="91.44" y1="35.56" x2="91.44" y2="50.8" width="0.1524" layer="91"/>
<pinref part="U11" gate="G$1" pin="QE"/>
<wire x1="91.44" y1="50.8" x2="50.8" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$158" class="0">
<segment>
<pinref part="R46" gate="G$1" pin="2"/>
<pinref part="U11" gate="G$1" pin="QH"/>
<wire x1="68.58" y1="43.18" x2="68.58" y2="35.56" width="0.1524" layer="91"/>
<wire x1="50.8" y1="43.18" x2="68.58" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$159" class="0">
<segment>
<pinref part="R50" gate="G$1" pin="2"/>
<wire x1="99.06" y1="53.34" x2="99.06" y2="35.56" width="0.1524" layer="91"/>
<pinref part="U11" gate="G$1" pin="QD"/>
<wire x1="50.8" y1="53.34" x2="99.06" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$160" class="0">
<segment>
<pinref part="R51" gate="G$1" pin="2"/>
<wire x1="106.68" y1="55.88" x2="106.68" y2="35.56" width="0.1524" layer="91"/>
<pinref part="U11" gate="G$1" pin="QC"/>
<wire x1="106.68" y1="55.88" x2="50.8" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$161" class="0">
<segment>
<pinref part="R52" gate="G$1" pin="2"/>
<wire x1="114.3" y1="58.42" x2="114.3" y2="35.56" width="0.1524" layer="91"/>
<pinref part="U11" gate="G$1" pin="QB"/>
<wire x1="50.8" y1="58.42" x2="114.3" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$162" class="0">
<segment>
<pinref part="R45" gate="G$1" pin="2"/>
<wire x1="60.96" y1="25.4" x2="53.34" y2="25.4" width="0.1524" layer="91"/>
<wire x1="60.96" y1="25.4" x2="60.96" y2="60.96" width="0.1524" layer="91"/>
<pinref part="U11" gate="G$1" pin="QA"/>
<wire x1="60.96" y1="60.96" x2="50.8" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="FPGA_CLK" class="0">
<segment>
<wire x1="287.02" y1="127" x2="287.02" y2="121.92" width="0.1524" layer="91"/>
<label x="287.02" y="121.92" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
<pinref part="U9" gate="B" pin="IO_L31N_GCLK30_D15_2"/>
</segment>
</net>
<net name="N$55" class="0">
<segment>
<wire x1="254" y1="124.46" x2="256.54" y2="124.46" width="0.1524" layer="91"/>
<pinref part="U9" gate="B" pin="PROGRAM_B_2"/>
<wire x1="256.54" y1="124.46" x2="256.54" y2="127" width="0.1524" layer="91"/>
<pinref part="U8" gate="A" pin="Y"/>
</segment>
</net>
<net name="!FPGA_PROG" class="0">
<segment>
<label x="231.14" y="127" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="241.3" y1="121.92" x2="236.22" y2="121.92" width="0.1524" layer="91"/>
<pinref part="R44" gate="G$1" pin="2"/>
<wire x1="236.22" y1="119.38" x2="236.22" y2="121.92" width="0.1524" layer="91"/>
<junction x="236.22" y="121.92"/>
<wire x1="231.14" y1="127" x2="236.22" y2="127" width="0.1524" layer="91"/>
<wire x1="236.22" y1="127" x2="241.3" y2="127" width="0.1524" layer="91"/>
<wire x1="236.22" y1="121.92" x2="236.22" y2="127" width="0.1524" layer="91"/>
<junction x="236.22" y="127"/>
<pinref part="U8" gate="A" pin="A"/>
<pinref part="U8" gate="A" pin="B"/>
</segment>
</net>
<net name="N$56" class="0">
<segment>
<pinref part="U9" gate="B" pin="IO_L1P_CCLK_2"/>
<wire x1="325.12" y1="127" x2="325.12" y2="99.06" width="0.1524" layer="91"/>
<wire x1="325.12" y1="99.06" x2="327.66" y2="99.06" width="0.1524" layer="91"/>
<pinref part="U10" gate="A" pin="Y"/>
</segment>
</net>
<net name="FPGA_CONF" class="0">
<segment>
<wire x1="340.36" y1="101.6" x2="345.44" y2="101.6" width="0.1524" layer="91"/>
<label x="345.44" y="101.6" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U10" gate="A" pin="A"/>
</segment>
</net>
<net name="FPGA_DONE" class="0">
<segment>
<pinref part="U9" gate="B" pin="DONE_2"/>
<wire x1="330.2" y1="127" x2="330.2" y2="121.92" width="0.1524" layer="91"/>
<label x="330.2" y="121.92" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
</segment>
</net>
<net name="!FPGA_CS" class="0">
<segment>
<label x="320.04" y="121.92" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
<pinref part="U9" gate="B" pin="IO_L2P_CMPCLK_2"/>
<wire x1="320.04" y1="121.92" x2="320.04" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SPI_SCLK" class="0">
<segment>
<label x="294.64" y="121.92" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
<pinref part="U9" gate="B" pin="IO_L30P_GCLK1_D13_2"/>
<wire x1="294.64" y1="121.92" x2="294.64" y2="127" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="340.36" y1="96.52" x2="345.44" y2="96.52" width="0.1524" layer="91"/>
<label x="345.44" y="96.52" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U10" gate="A" pin="B"/>
</segment>
<segment>
<wire x1="93.98" y1="187.96" x2="83.82" y2="187.96" width="0.1524" layer="91"/>
<label x="83.82" y="187.96" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN18" gate="G$1" pin="5"/>
</segment>
</net>
<net name="SPI_MOSI" class="0">
<segment>
<pinref part="U9" gate="B" pin="IO_L3P_D0_DIN_MISO_MISO1_2"/>
<wire x1="314.96" y1="127" x2="314.96" y2="121.92" width="0.1524" layer="91"/>
<label x="314.96" y="121.92" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="106.68" y1="187.96" x2="116.84" y2="187.96" width="0.1524" layer="91"/>
<label x="116.84" y="187.96" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN18" gate="G$1" pin="6"/>
</segment>
</net>
<net name="SPI_MISO" class="0">
<segment>
<label x="317.5" y="121.92" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
<pinref part="U9" gate="B" pin="IO_L2N_CMPMOSI_2"/>
<wire x1="317.5" y1="121.92" x2="317.5" y2="127" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="93.98" y1="185.42" x2="83.82" y2="185.42" width="0.1524" layer="91"/>
<label x="83.82" y="185.42" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN18" gate="G$1" pin="7"/>
</segment>
</net>
<net name="!FPGA_INIT" class="0">
<segment>
<pinref part="U9" gate="B" pin="IO_L65P_INIT_B_2"/>
<wire x1="264.16" y1="127" x2="264.16" y2="121.92" width="0.1524" layer="91"/>
<label x="264.16" y="121.92" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
</segment>
</net>
<net name="XBEE_RX" class="0">
<segment>
<label x="307.34" y="238.76" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L63N_SCP6_0"/>
<wire x1="307.34" y1="238.76" x2="307.34" y2="233.68" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="CN7" gate="G$1" pin="DOUT"/>
<wire x1="66.04" y1="259.08" x2="60.96" y2="259.08" width="0.1524" layer="91"/>
<label x="60.96" y="259.08" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="XBEE_TX" class="0">
<segment>
<wire x1="302.26" y1="238.76" x2="302.26" y2="233.68" width="0.1524" layer="91"/>
<label x="302.26" y="238.76" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L62N_VREF_0"/>
</segment>
<segment>
<pinref part="CN7" gate="G$1" pin="DIN/!CONFIG"/>
<wire x1="60.96" y1="256.54" x2="66.04" y2="256.54" width="0.1524" layer="91"/>
<label x="60.96" y="256.54" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="!XBEE_RST" class="0">
<segment>
<label x="297.18" y="238.76" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L37N_GCLK12_0"/>
<wire x1="297.18" y1="238.76" x2="297.18" y2="233.68" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="CN7" gate="G$1" pin="!RESET"/>
<wire x1="66.04" y1="251.46" x2="58.42" y2="251.46" width="0.1524" layer="91"/>
<label x="53.34" y="251.46" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="R53" gate="G$1" pin="2"/>
<wire x1="58.42" y1="251.46" x2="53.34" y2="251.46" width="0.1524" layer="91"/>
<wire x1="58.42" y1="248.92" x2="58.42" y2="251.46" width="0.1524" layer="91"/>
<junction x="58.42" y="251.46"/>
</segment>
</net>
<net name="!XBEE_CTS" class="0">
<segment>
<wire x1="314.96" y1="233.68" x2="314.96" y2="238.76" width="0.1524" layer="91"/>
<label x="314.96" y="238.76" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L65P_SCP3_0"/>
</segment>
<segment>
<pinref part="CN7" gate="G$1" pin="!CTS!/DIO7"/>
<wire x1="111.76" y1="241.3" x2="116.84" y2="241.3" width="0.1524" layer="91"/>
<label x="116.84" y="241.3" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="MOT1_PWM_A" class="0">
<segment>
<wire x1="363.22" y1="205.74" x2="368.3" y2="205.74" width="0.1524" layer="91"/>
<label x="368.3" y="205.74" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L32P_1"/>
</segment>
</net>
<net name="!MOT1_RESET_A" class="0">
<segment>
<wire x1="368.3" y1="203.2" x2="363.22" y2="203.2" width="0.1524" layer="91"/>
<label x="368.3" y="203.2" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L32N_1"/>
</segment>
</net>
<net name="MOT1_PWM_B" class="0">
<segment>
<wire x1="368.3" y1="200.66" x2="363.22" y2="200.66" width="0.1524" layer="91"/>
<label x="368.3" y="200.66" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L33P_1"/>
</segment>
</net>
<net name="!MOT1_RESET_B" class="0">
<segment>
<wire x1="363.22" y1="198.12" x2="368.3" y2="198.12" width="0.1524" layer="91"/>
<label x="368.3" y="198.12" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L33N_1"/>
</segment>
</net>
<net name="!MOT1_RESET_C" class="0">
<segment>
<wire x1="368.3" y1="195.58" x2="363.22" y2="195.58" width="0.1524" layer="91"/>
<label x="368.3" y="195.58" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L34P_1"/>
</segment>
</net>
<net name="MOT1_PWM_C" class="0">
<segment>
<wire x1="363.22" y1="193.04" x2="368.3" y2="193.04" width="0.1524" layer="91"/>
<label x="368.3" y="193.04" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L34N_1"/>
</segment>
</net>
<net name="!MOT1_OTW" class="0">
<segment>
<wire x1="368.3" y1="210.82" x2="363.22" y2="210.82" width="0.1524" layer="91"/>
<label x="368.3" y="210.82" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L1P_1"/>
</segment>
</net>
<net name="!MOT1_FAULT" class="0">
<segment>
<wire x1="368.3" y1="208.28" x2="363.22" y2="208.28" width="0.1524" layer="91"/>
<label x="368.3" y="208.28" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L1N__VREF_1"/>
</segment>
</net>
<net name="!MOT2_OTW" class="0">
<segment>
<label x="368.3" y="170.18" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<wire x1="368.3" y1="170.18" x2="363.22" y2="170.18" width="0.1524" layer="91"/>
<pinref part="U9" gate="R" pin="IO_L45P_1"/>
</segment>
</net>
<net name="!MOT2_FAULT" class="0">
<segment>
<wire x1="368.3" y1="167.64" x2="363.22" y2="167.64" width="0.1524" layer="91"/>
<label x="368.3" y="167.64" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L45N_1"/>
</segment>
</net>
<net name="MOT2_PWM_A" class="0">
<segment>
<wire x1="363.22" y1="165.1" x2="368.3" y2="165.1" width="0.1524" layer="91"/>
<label x="368.3" y="165.1" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L46P_1"/>
</segment>
</net>
<net name="MOT2_PWM_B" class="0">
<segment>
<wire x1="368.3" y1="160.02" x2="363.22" y2="160.02" width="0.1524" layer="91"/>
<label x="368.3" y="160.02" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L47P_1"/>
</segment>
</net>
<net name="MOT2_PWM_C" class="0">
<segment>
<wire x1="363.22" y1="152.4" x2="368.3" y2="152.4" width="0.1524" layer="91"/>
<label x="368.3" y="152.4" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L74N_DOUT_BUSY_1"/>
</segment>
</net>
<net name="!MOT2_RESET_B" class="0">
<segment>
<wire x1="363.22" y1="157.48" x2="368.3" y2="157.48" width="0.1524" layer="91"/>
<label x="368.3" y="157.48" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L47N_1"/>
</segment>
</net>
<net name="!MOT2_RESET_C" class="0">
<segment>
<wire x1="368.3" y1="154.94" x2="363.22" y2="154.94" width="0.1524" layer="91"/>
<label x="368.3" y="154.94" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L74P_AWAKE_1"/>
</segment>
</net>
<net name="!MOT2_RESET_A" class="0">
<segment>
<wire x1="368.3" y1="162.56" x2="363.22" y2="162.56" width="0.1524" layer="91"/>
<label x="368.3" y="162.56" size="1.27" layer="95" font="vector" rot="MR180" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L46N_1"/>
</segment>
</net>
<net name="!ADC1_CS" class="0">
<segment>
<label x="368.3" y="182.88" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="363.22" y1="182.88" x2="368.3" y2="182.88" width="0.1524" layer="91"/>
<pinref part="U9" gate="R" pin="IO_L41N_GCLK8_1"/>
</segment>
</net>
<net name="ADC1_SCLK" class="0">
<segment>
<wire x1="368.3" y1="180.34" x2="363.22" y2="180.34" width="0.1524" layer="91"/>
<label x="368.3" y="180.34" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L42P_GCLK7_1"/>
</segment>
</net>
<net name="ADC1_MOSI" class="0">
<segment>
<wire x1="363.22" y1="177.8" x2="368.3" y2="177.8" width="0.1524" layer="91"/>
<label x="368.3" y="177.8" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L42N_GCLK6_TRDY1_1"/>
</segment>
</net>
<net name="ADC1_MISO" class="0">
<segment>
<wire x1="368.3" y1="175.26" x2="363.22" y2="175.26" width="0.1524" layer="91"/>
<label x="368.3" y="175.26" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L43P_GCLK5_1"/>
</segment>
</net>
<net name="!MOT1_2_DO" class="0">
<segment>
<wire x1="363.22" y1="185.42" x2="368.3" y2="185.42" width="0.1524" layer="91"/>
<label x="368.3" y="185.42" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L41P_GCLK9_IRDY1_1"/>
</segment>
</net>
<net name="MOT1_2_CLK" class="0">
<segment>
<wire x1="363.22" y1="187.96" x2="368.3" y2="187.96" width="0.1524" layer="91"/>
<label x="368.3" y="187.96" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L40N_GCLK10_1"/>
</segment>
</net>
<net name="!MOT1_2_LATCH" class="0">
<segment>
<wire x1="368.3" y1="190.5" x2="363.22" y2="190.5" width="0.1524" layer="91"/>
<label x="368.3" y="190.5" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U9" gate="R" pin="IO_L40P_GCLK11_1"/>
</segment>
</net>
<net name="!MOT3_4_5_DO" class="0">
<segment>
<wire x1="226.06" y1="177.8" x2="231.14" y2="177.8" width="0.1524" layer="91"/>
<label x="226.06" y="177.8" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L42N_GCLK24_3"/>
</segment>
</net>
<net name="MOT3_4_5_CLK" class="0">
<segment>
<wire x1="231.14" y1="175.26" x2="226.06" y2="175.26" width="0.1524" layer="91"/>
<label x="226.06" y="175.26" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L42P_GCLK25_TRDY2_3"/>
</segment>
</net>
<net name="!MOT3_4_5_LATCH" class="0">
<segment>
<wire x1="226.06" y1="172.72" x2="231.14" y2="172.72" width="0.1524" layer="91"/>
<label x="226.06" y="172.72" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L41N_GCLK26_3"/>
</segment>
</net>
<net name="PWR_5V" class="0">
<segment>
<wire x1="266.7" y1="127" x2="266.7" y2="121.92" width="0.1524" layer="91"/>
<label x="266.7" y="121.92" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
<pinref part="U9" gate="B" pin="IO_L64N_D9_2"/>
</segment>
</net>
<net name="ADC2_MISO" class="0">
<segment>
<wire x1="226.06" y1="187.96" x2="231.14" y2="187.96" width="0.1524" layer="91"/>
<label x="226.06" y="187.96" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L44N_GCLK20_3"/>
</segment>
</net>
<net name="ADC2_MOSI" class="0">
<segment>
<wire x1="231.14" y1="185.42" x2="226.06" y2="185.42" width="0.1524" layer="91"/>
<label x="226.06" y="185.42" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L44P_GCLK21_3"/>
</segment>
</net>
<net name="ADC2_SCLK" class="0">
<segment>
<wire x1="226.06" y1="182.88" x2="231.14" y2="182.88" width="0.1524" layer="91"/>
<label x="226.06" y="182.88" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L43N_GCLK22_IRDY2_3"/>
</segment>
</net>
<net name="!ADC2_CS" class="0">
<segment>
<label x="226.06" y="180.34" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="231.14" y1="180.34" x2="226.06" y2="180.34" width="0.1524" layer="91"/>
<pinref part="U9" gate="L" pin="IO_L43P_GCLK23_3"/>
</segment>
</net>
<net name="MOT1_TEMP" class="0">
<segment>
<wire x1="322.58" y1="233.68" x2="322.58" y2="238.76" width="0.1524" layer="91"/>
<label x="322.58" y="238.76" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L66N_SCP0_0"/>
</segment>
</net>
<net name="MOT3_TEMP" class="0">
<segment>
<wire x1="231.14" y1="149.86" x2="226.06" y2="149.86" width="0.1524" layer="91"/>
<label x="226.06" y="149.86" size="1.27" layer="95" font="vector" rot="R180" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L1P_3"/>
</segment>
</net>
<net name="MOT4_TEMP" class="0">
<segment>
<wire x1="231.14" y1="213.36" x2="226.06" y2="213.36" width="0.1524" layer="91"/>
<label x="226.06" y="213.36" size="1.27" layer="95" font="vector" rot="R180" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L83N_VREF_3"/>
</segment>
</net>
<net name="!MOT3_OTW" class="0">
<segment>
<label x="226.06" y="152.4" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="226.06" y1="152.4" x2="231.14" y2="152.4" width="0.1524" layer="91"/>
<pinref part="U9" gate="L" pin="IO_L1N_VREF_3"/>
</segment>
</net>
<net name="MOT3_PWM_A" class="0">
<segment>
<wire x1="231.14" y1="157.48" x2="226.06" y2="157.48" width="0.1524" layer="91"/>
<label x="226.06" y="157.48" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L2N_3"/>
</segment>
</net>
<net name="!MOT3_FAULT" class="0">
<segment>
<wire x1="226.06" y1="154.94" x2="231.14" y2="154.94" width="0.1524" layer="91"/>
<label x="226.06" y="154.94" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L2P_3"/>
</segment>
</net>
<net name="MOT3_PWM_B" class="0">
<segment>
<wire x1="226.06" y1="162.56" x2="231.14" y2="162.56" width="0.1524" layer="91"/>
<label x="226.06" y="162.56" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L36N_3"/>
</segment>
</net>
<net name="MOT3_PWM_C" class="0">
<segment>
<wire x1="231.14" y1="170.18" x2="226.06" y2="170.18" width="0.1524" layer="91"/>
<label x="226.06" y="170.18" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L41P_GCLK27_3"/>
</segment>
</net>
<net name="!MOT3_RESET_A" class="0">
<segment>
<wire x1="226.06" y1="160.02" x2="231.14" y2="160.02" width="0.1524" layer="91"/>
<label x="226.06" y="160.02" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L36P_3"/>
</segment>
</net>
<net name="!MOT3_RESET_B" class="0">
<segment>
<wire x1="231.14" y1="165.1" x2="226.06" y2="165.1" width="0.1524" layer="91"/>
<label x="226.06" y="165.1" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L37P_3"/>
</segment>
</net>
<net name="!MOT3_RESET_C" class="0">
<segment>
<wire x1="226.06" y1="167.64" x2="231.14" y2="167.64" width="0.1524" layer="91"/>
<label x="226.06" y="167.64" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L37N_3"/>
</segment>
</net>
<net name="!MOT4_OTW" class="0">
<segment>
<label x="226.06" y="193.04" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="226.06" y1="193.04" x2="231.14" y2="193.04" width="0.1524" layer="91"/>
<pinref part="U9" gate="L" pin="IO_L49N_3"/>
</segment>
</net>
<net name="!MOT4_FAULT" class="0">
<segment>
<wire x1="226.06" y1="195.58" x2="231.14" y2="195.58" width="0.1524" layer="91"/>
<label x="226.06" y="195.58" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L50P_3"/>
</segment>
</net>
<net name="MOT4_PWM_A" class="0">
<segment>
<wire x1="231.14" y1="198.12" x2="226.06" y2="198.12" width="0.1524" layer="91"/>
<label x="226.06" y="198.12" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L50N_3"/>
</segment>
</net>
<net name="MOT4_PWM_B" class="0">
<segment>
<wire x1="226.06" y1="203.2" x2="231.14" y2="203.2" width="0.1524" layer="91"/>
<label x="226.06" y="203.2" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L51N_3"/>
</segment>
</net>
<net name="MOT4_PWM_C" class="0">
<segment>
<wire x1="231.14" y1="210.82" x2="226.06" y2="210.82" width="0.1524" layer="91"/>
<label x="226.06" y="210.82" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L83P_3"/>
</segment>
</net>
<net name="!MOT4_RESET_A" class="0">
<segment>
<wire x1="226.06" y1="200.66" x2="231.14" y2="200.66" width="0.1524" layer="91"/>
<label x="226.06" y="200.66" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L51P_3"/>
</segment>
</net>
<net name="!MOT4_RESET_B" class="0">
<segment>
<wire x1="231.14" y1="205.74" x2="226.06" y2="205.74" width="0.1524" layer="91"/>
<label x="226.06" y="205.74" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L52P_3"/>
</segment>
</net>
<net name="!MOT4_RESET_C" class="0">
<segment>
<wire x1="226.06" y1="208.28" x2="231.14" y2="208.28" width="0.1524" layer="91"/>
<label x="226.06" y="208.28" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U9" gate="L" pin="IO_L52N_3"/>
</segment>
</net>
<net name="MOT5_CUR_SCL" class="0">
<segment>
<wire x1="259.08" y1="233.68" x2="259.08" y2="238.76" width="0.1524" layer="91"/>
<label x="259.08" y="238.76" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L1P_HSWAPEN_0"/>
</segment>
</net>
<net name="MOT5_CUR_SDA" class="0">
<segment>
<wire x1="261.62" y1="233.68" x2="261.62" y2="238.76" width="0.1524" layer="91"/>
<label x="261.62" y="238.76" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L1N_VREF_0"/>
</segment>
</net>
<net name="BALL_DETECT/BALL_SDA" class="0">
<segment>
<wire x1="320.04" y1="233.68" x2="320.04" y2="238.76" width="0.1524" layer="91"/>
<label x="320.04" y="238.76" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L66P_SCP1_0"/>
</segment>
<segment>
<pinref part="R56" gate="G$1" pin="2"/>
<wire x1="71.12" y1="144.78" x2="76.2" y2="144.78" width="0.1524" layer="91"/>
<label x="76.2" y="144.78" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="MOT1_2_EN_SENSOR" class="0">
<segment>
<label x="368.3" y="172.72" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="363.22" y1="172.72" x2="368.3" y2="172.72" width="0.1524" layer="91"/>
<pinref part="U9" gate="R" pin="IO_L43N_GCLK4_1"/>
</segment>
</net>
<net name="MOT3_4_5_EN_SENSOR" class="0">
<segment>
<label x="226.06" y="190.5" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="231.14" y1="190.5" x2="226.06" y2="190.5" width="0.1524" layer="91"/>
<pinref part="U9" gate="L" pin="IO_L49P_3"/>
</segment>
</net>
<net name="BALL_EN" class="0">
<segment>
<label x="312.42" y="238.76" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
<wire x1="312.42" y1="233.68" x2="312.42" y2="238.76" width="0.1524" layer="91"/>
<pinref part="U9" gate="T" pin="IO_L64N_SCP4_0"/>
</segment>
<segment>
<pinref part="U12" gate="G$1" pin="EN"/>
<wire x1="60.96" y1="93.98" x2="66.04" y2="93.98" width="0.1524" layer="91"/>
<label x="73.66" y="93.98" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R60" gate="G$1" pin="2"/>
<wire x1="66.04" y1="93.98" x2="73.66" y2="93.98" width="0.1524" layer="91"/>
<wire x1="66.04" y1="91.44" x2="66.04" y2="93.98" width="0.1524" layer="91"/>
<junction x="66.04" y="93.98"/>
</segment>
</net>
<net name="BALL_SCL" class="0">
<segment>
<wire x1="317.5" y1="233.68" x2="317.5" y2="238.76" width="0.1524" layer="91"/>
<label x="317.5" y="238.76" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L65N_SCP2_0"/>
</segment>
<segment>
<label x="76.2" y="137.16" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R57" gate="G$1" pin="2"/>
<wire x1="71.12" y1="137.16" x2="76.2" y2="137.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!MOT5_OTW" class="0">
<segment>
<wire x1="264.16" y1="238.76" x2="264.16" y2="233.68" width="0.1524" layer="91"/>
<label x="264.16" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L2P_0"/>
</segment>
</net>
<net name="!MOT5_FAULT" class="0">
<segment>
<wire x1="266.7" y1="238.76" x2="266.7" y2="233.68" width="0.1524" layer="91"/>
<label x="266.7" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L2N_0"/>
</segment>
</net>
<net name="MOT5_PWM_A" class="0">
<segment>
<wire x1="269.24" y1="233.68" x2="269.24" y2="238.76" width="0.1524" layer="91"/>
<label x="269.24" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L3P_0"/>
</segment>
</net>
<net name="MOT5_PWM_B" class="0">
<segment>
<wire x1="274.32" y1="238.76" x2="274.32" y2="233.68" width="0.1524" layer="91"/>
<label x="274.32" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L4P_0"/>
</segment>
</net>
<net name="MOT5_PWM_C" class="0">
<segment>
<wire x1="281.94" y1="233.68" x2="281.94" y2="238.76" width="0.1524" layer="91"/>
<label x="281.94" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L34N_GCLK18_0"/>
</segment>
</net>
<net name="!MOT5_RESET_A" class="0">
<segment>
<wire x1="271.78" y1="238.76" x2="271.78" y2="233.68" width="0.1524" layer="91"/>
<label x="271.78" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L3N_0"/>
</segment>
</net>
<net name="!MOT5_RESET_C" class="0">
<segment>
<wire x1="279.4" y1="238.76" x2="279.4" y2="233.68" width="0.1524" layer="91"/>
<label x="279.4" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L34P_GCLK19_0"/>
</segment>
</net>
<net name="!MOT5_RESET_B" class="0">
<segment>
<wire x1="276.86" y1="233.68" x2="276.86" y2="238.76" width="0.1524" layer="91"/>
<label x="276.86" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L4N_0"/>
</segment>
</net>
<net name="FPGA_AUX0" class="0">
<segment>
<pinref part="U9" gate="B" pin="IO_L1N_M0_CMPMISO_2"/>
<wire x1="322.58" y1="127" x2="322.58" y2="121.92" width="0.1524" layer="91"/>
<label x="322.58" y="121.92" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="106.68" y1="185.42" x2="116.84" y2="185.42" width="0.1524" layer="91"/>
<label x="116.84" y="185.42" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN18" gate="G$1" pin="8"/>
</segment>
</net>
<net name="FPGA_AUX1" class="0">
<segment>
<label x="312.42" y="121.92" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
<pinref part="U9" gate="B" pin="IO_L3N_MOSI_CSI_B_MISO0_2"/>
<wire x1="312.42" y1="121.92" x2="312.42" y2="127" width="0.1524" layer="91"/>
</segment>
<segment>
<label x="116.84" y="190.5" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="106.68" y1="190.5" x2="116.84" y2="190.5" width="0.1524" layer="91"/>
<pinref part="CN18" gate="G$1" pin="4"/>
</segment>
</net>
<net name="FPGA_TCK" class="0">
<segment>
<wire x1="327.66" y1="233.68" x2="327.66" y2="238.76" width="0.1524" layer="91"/>
<label x="327.66" y="238.76" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
<pinref part="U9" gate="T" pin="TCK"/>
</segment>
<segment>
<wire x1="365.76" y1="251.46" x2="360.68" y2="251.46" width="0.1524" layer="91"/>
<label x="360.68" y="251.46" size="1.27" layer="95" font="vector" rot="R180" xref="yes"/>
<pinref part="P1" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="FPGA_TDI" class="0">
<segment>
<wire x1="330.2" y1="233.68" x2="330.2" y2="238.76" width="0.1524" layer="91"/>
<label x="330.2" y="238.76" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
<pinref part="U9" gate="T" pin="TDI"/>
</segment>
<segment>
<wire x1="365.76" y1="248.92" x2="360.68" y2="248.92" width="0.1524" layer="91"/>
<label x="360.68" y="248.92" size="1.27" layer="95" font="vector" rot="R180" xref="yes"/>
<pinref part="P2" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="FPGA_TMS" class="0">
<segment>
<wire x1="363.22" y1="218.44" x2="368.3" y2="218.44" width="0.1524" layer="91"/>
<label x="368.3" y="218.44" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U9" gate="R" pin="TMS"/>
</segment>
<segment>
<wire x1="365.76" y1="243.84" x2="360.68" y2="243.84" width="0.1524" layer="91"/>
<label x="360.68" y="243.84" size="1.27" layer="95" font="vector" rot="R180" xref="yes"/>
<pinref part="P4" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="FPGA_TDO" class="0">
<segment>
<wire x1="368.3" y1="215.9" x2="363.22" y2="215.9" width="0.1524" layer="91"/>
<label x="368.3" y="215.9" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U9" gate="R" pin="TDO"/>
</segment>
<segment>
<wire x1="360.68" y1="246.38" x2="365.76" y2="246.38" width="0.1524" layer="91"/>
<label x="360.68" y="246.38" size="1.27" layer="95" font="vector" rot="R180" xref="yes"/>
<pinref part="P3" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="EXT1_CE" class="0">
<segment>
<wire x1="309.88" y1="233.68" x2="309.88" y2="238.76" width="0.1524" layer="91"/>
<label x="309.88" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L64P_SCP5_0"/>
</segment>
<segment>
<pinref part="CN6" gate="G$1" pin="2"/>
<wire x1="48.26" y1="195.58" x2="38.1" y2="195.58" width="0.1524" layer="91"/>
<label x="38.1" y="195.58" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="EXT1_CSN" class="0">
<segment>
<wire x1="304.8" y1="238.76" x2="304.8" y2="233.68" width="0.1524" layer="91"/>
<label x="304.8" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L63P_SCP7_0"/>
</segment>
<segment>
<pinref part="CN6" gate="G$1" pin="3"/>
<wire x1="38.1" y1="193.04" x2="48.26" y2="193.04" width="0.1524" layer="91"/>
<label x="38.1" y="193.04" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="EXT1_SCK" class="0">
<segment>
<wire x1="299.72" y1="233.68" x2="299.72" y2="238.76" width="0.1524" layer="91"/>
<label x="299.72" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L62P_0"/>
</segment>
<segment>
<pinref part="CN6" gate="G$1" pin="4"/>
<wire x1="48.26" y1="190.5" x2="38.1" y2="190.5" width="0.1524" layer="91"/>
<label x="38.1" y="190.5" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="EXT1_MOSI" class="0">
<segment>
<wire x1="294.64" y1="238.76" x2="294.64" y2="233.68" width="0.1524" layer="91"/>
<label x="294.64" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L37P_GCLK13_0"/>
</segment>
<segment>
<pinref part="CN6" gate="G$1" pin="5"/>
<wire x1="38.1" y1="187.96" x2="48.26" y2="187.96" width="0.1524" layer="91"/>
<label x="38.1" y="187.96" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="EXT1_MISO" class="0">
<segment>
<wire x1="289.56" y1="233.68" x2="289.56" y2="238.76" width="0.1524" layer="91"/>
<label x="289.56" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L36P_GCLK15_0"/>
</segment>
<segment>
<pinref part="CN6" gate="G$1" pin="6"/>
<wire x1="48.26" y1="185.42" x2="38.1" y2="185.42" width="0.1524" layer="91"/>
<label x="38.1" y="185.42" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="EXT1_IRQ" class="0">
<segment>
<wire x1="284.48" y1="238.76" x2="284.48" y2="233.68" width="0.1524" layer="91"/>
<label x="284.48" y="238.76" size="1.27" layer="95" font="vector" rot="MR90" xref="yes"/>
<pinref part="U9" gate="T" pin="IO_L35P_GCLK17_0"/>
</segment>
<segment>
<pinref part="CN6" gate="G$1" pin="7"/>
<wire x1="38.1" y1="182.88" x2="48.26" y2="182.88" width="0.1524" layer="91"/>
<label x="38.1" y="182.88" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="FPGA_AUX2" class="0">
<segment>
<label x="284.48" y="121.92" size="1.27" layer="95" font="vector" rot="MR270" xref="yes"/>
<wire x1="284.48" y1="127" x2="284.48" y2="121.92" width="0.1524" layer="91"/>
<pinref part="U9" gate="B" pin="IO_L48P_D7_2"/>
</segment>
<segment>
<label x="83.82" y="190.5" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="93.98" y1="190.5" x2="83.82" y2="190.5" width="0.1524" layer="91"/>
<pinref part="CN18" gate="G$1" pin="3"/>
</segment>
</net>
<net name="N$163" class="0">
<segment>
<pinref part="U9" gate="P" pin="VCCINT@19"/>
<wire x1="337.82" y1="50.8" x2="340.36" y2="50.8" width="0.1524" layer="91"/>
<wire x1="340.36" y1="50.8" x2="340.36" y2="68.58" width="0.1524" layer="91"/>
<pinref part="C62" gate="G$1" pin="1"/>
<wire x1="340.36" y1="68.58" x2="373.38" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$164" class="0">
<segment>
<pinref part="C60" gate="G$1" pin="1"/>
<wire x1="368.3" y1="63.5" x2="342.9" y2="63.5" width="0.1524" layer="91"/>
<wire x1="342.9" y1="63.5" x2="342.9" y2="48.26" width="0.1524" layer="91"/>
<pinref part="U9" gate="P" pin="VCCINT@28"/>
<wire x1="342.9" y1="48.26" x2="337.82" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$165" class="0">
<segment>
<pinref part="U9" gate="P" pin="VCCINT@52"/>
<wire x1="337.82" y1="45.72" x2="345.44" y2="45.72" width="0.1524" layer="91"/>
<wire x1="345.44" y1="45.72" x2="345.44" y2="58.42" width="0.1524" layer="91"/>
<pinref part="C58" gate="G$1" pin="1"/>
<wire x1="345.44" y1="58.42" x2="363.22" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$166" class="0">
<segment>
<pinref part="C56" gate="G$1" pin="1"/>
<wire x1="358.14" y1="53.34" x2="347.98" y2="53.34" width="0.1524" layer="91"/>
<wire x1="347.98" y1="53.34" x2="347.98" y2="43.18" width="0.1524" layer="91"/>
<pinref part="U9" gate="P" pin="VCCINT@89"/>
<wire x1="347.98" y1="43.18" x2="337.82" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$167" class="0">
<segment>
<pinref part="U9" gate="P" pin="VCCINT@128"/>
<wire x1="337.82" y1="40.64" x2="350.52" y2="40.64" width="0.1524" layer="91"/>
<wire x1="350.52" y1="40.64" x2="350.52" y2="48.26" width="0.1524" layer="91"/>
<pinref part="C55" gate="G$1" pin="1"/>
<wire x1="350.52" y1="48.26" x2="353.06" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+1V2" class="0">
<segment>
<pinref part="C62" gate="G$1" pin="2"/>
<pinref part="+P16" gate="G$1" pin="+1V2"/>
<wire x1="378.46" y1="68.58" x2="386.08" y2="68.58" width="0.1524" layer="91"/>
<pinref part="C55" gate="G$1" pin="2"/>
<wire x1="386.08" y1="68.58" x2="391.16" y2="68.58" width="0.1524" layer="91"/>
<wire x1="391.16" y1="68.58" x2="396.24" y2="68.58" width="0.1524" layer="91"/>
<wire x1="358.14" y1="48.26" x2="386.08" y2="48.26" width="0.1524" layer="91"/>
<wire x1="386.08" y1="48.26" x2="386.08" y2="53.34" width="0.1524" layer="91"/>
<pinref part="C60" gate="G$1" pin="2"/>
<wire x1="386.08" y1="53.34" x2="386.08" y2="58.42" width="0.1524" layer="91"/>
<wire x1="386.08" y1="58.42" x2="386.08" y2="63.5" width="0.1524" layer="91"/>
<wire x1="386.08" y1="63.5" x2="386.08" y2="68.58" width="0.1524" layer="91"/>
<wire x1="373.38" y1="63.5" x2="386.08" y2="63.5" width="0.1524" layer="91"/>
<pinref part="C58" gate="G$1" pin="2"/>
<wire x1="368.3" y1="58.42" x2="386.08" y2="58.42" width="0.1524" layer="91"/>
<pinref part="C56" gate="G$1" pin="2"/>
<wire x1="363.22" y1="53.34" x2="386.08" y2="53.34" width="0.1524" layer="91"/>
<junction x="386.08" y="53.34"/>
<junction x="386.08" y="58.42"/>
<junction x="386.08" y="63.5"/>
<junction x="386.08" y="68.58"/>
<pinref part="C63" gate="G$1" pin="1"/>
<wire x1="391.16" y1="66.04" x2="391.16" y2="68.58" width="0.1524" layer="91"/>
<junction x="391.16" y="68.58"/>
</segment>
</net>
<net name="N$138" class="0">
<segment>
<pinref part="CN8" gate="G$1" pin="1"/>
<wire x1="27.94" y1="132.08" x2="33.02" y2="132.08" width="0.1524" layer="91"/>
<wire x1="33.02" y1="132.08" x2="33.02" y2="144.78" width="0.1524" layer="91"/>
<wire x1="33.02" y1="144.78" x2="45.72" y2="144.78" width="0.1524" layer="91"/>
<pinref part="R56" gate="G$1" pin="1"/>
<wire x1="45.72" y1="144.78" x2="63.5" y2="144.78" width="0.1524" layer="91"/>
<wire x1="45.72" y1="147.32" x2="45.72" y2="144.78" width="0.1524" layer="91"/>
<junction x="45.72" y="144.78"/>
<pinref part="R54" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$139" class="0">
<segment>
<pinref part="CN8" gate="G$1" pin="3"/>
<pinref part="VR1" gate="G$1" pin="A"/>
<wire x1="27.94" y1="127" x2="35.56" y2="127" width="0.1524" layer="91"/>
<pinref part="R57" gate="G$1" pin="1"/>
<wire x1="35.56" y1="127" x2="45.72" y2="127" width="0.1524" layer="91"/>
<wire x1="63.5" y1="137.16" x2="55.88" y2="137.16" width="0.1524" layer="91"/>
<wire x1="55.88" y1="137.16" x2="35.56" y2="137.16" width="0.1524" layer="91"/>
<wire x1="35.56" y1="137.16" x2="35.56" y2="127" width="0.1524" layer="91"/>
<pinref part="R55" gate="G$1" pin="1"/>
<wire x1="55.88" y1="147.32" x2="55.88" y2="137.16" width="0.1524" layer="91"/>
<junction x="55.88" y="137.16"/>
<junction x="35.56" y="127"/>
</segment>
</net>
<net name="N$141" class="0">
<segment>
<pinref part="VR1" gate="G$1" pin="B"/>
<wire x1="55.88" y1="127" x2="58.42" y2="127" width="0.1524" layer="91"/>
<wire x1="58.42" y1="127" x2="58.42" y2="119.38" width="0.1524" layer="91"/>
<wire x1="58.42" y1="119.38" x2="50.8" y2="119.38" width="0.1524" layer="91"/>
<pinref part="VR1" gate="G$1" pin="W"/>
<wire x1="50.8" y1="119.38" x2="50.8" y2="121.92" width="0.1524" layer="91"/>
<pinref part="R58" gate="G$1" pin="1"/>
<wire x1="58.42" y1="127" x2="68.58" y2="127" width="0.1524" layer="91"/>
<wire x1="68.58" y1="127" x2="71.12" y2="127" width="0.1524" layer="91"/>
<wire x1="68.58" y1="127" x2="68.58" y2="119.38" width="0.1524" layer="91"/>
<wire x1="68.58" y1="119.38" x2="71.12" y2="119.38" width="0.1524" layer="91"/>
<pinref part="R59" gate="G$1" pin="1"/>
<junction x="58.42" y="127"/>
<junction x="68.58" y="127"/>
</segment>
</net>
<net name="N$140" class="0">
<segment>
<pinref part="CN8" gate="G$1" pin="4"/>
<wire x1="27.94" y1="124.46" x2="38.1" y2="124.46" width="0.1524" layer="91"/>
<wire x1="38.1" y1="124.46" x2="38.1" y2="104.14" width="0.1524" layer="91"/>
<pinref part="U12" gate="G$1" pin="OUT"/>
<wire x1="38.1" y1="104.14" x2="40.64" y2="104.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$147" class="0">
<segment>
<pinref part="U12" gate="G$1" pin="R1"/>
<pinref part="R61" gate="G$1" pin="1"/>
<wire x1="66.04" y1="99.06" x2="60.96" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$151" class="0">
<segment>
<pinref part="U12" gate="G$1" pin="IN"/>
<wire x1="60.96" y1="104.14" x2="76.2" y2="104.14" width="0.1524" layer="91"/>
<pinref part="R61" gate="G$1" pin="2"/>
<wire x1="73.66" y1="99.06" x2="76.2" y2="99.06" width="0.1524" layer="91"/>
<wire x1="76.2" y1="99.06" x2="76.2" y2="104.14" width="0.1524" layer="91"/>
<pinref part="RF1" gate="G$1" pin="1"/>
<wire x1="78.74" y1="104.14" x2="76.2" y2="104.14" width="0.1524" layer="91"/>
<pinref part="RF2" gate="G$1" pin="1"/>
<wire x1="76.2" y1="99.06" x2="86.36" y2="99.06" width="0.1524" layer="91"/>
<junction x="76.2" y="104.14"/>
<junction x="76.2" y="99.06"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="+P75" gate="1" pin="+5V"/>
<wire x1="99.06" y1="104.14" x2="88.9" y2="104.14" width="0.1524" layer="91"/>
<pinref part="RF1" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$50" class="0">
<segment>
<pinref part="U13" gate="G$1" pin="VO1"/>
<pinref part="BZ1" gate="G$1" pin="1"/>
<wire x1="185.42" y1="33.02" x2="177.8" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$90" class="0">
<segment>
<pinref part="U13" gate="G$1" pin="VO2"/>
<pinref part="BZ1" gate="G$1" pin="2"/>
<wire x1="185.42" y1="30.48" x2="177.8" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$41" class="0">
<segment>
<pinref part="FB1" gate="G$1" pin="2"/>
<wire x1="27.94" y1="261.62" x2="30.48" y2="261.62" width="0.1524" layer="91"/>
<pinref part="C66" gate="G$1" pin="1"/>
<wire x1="30.48" y1="261.62" x2="30.48" y2="259.08" width="0.1524" layer="91"/>
<pinref part="CN7" gate="G$1" pin="VCC"/>
<wire x1="30.48" y1="261.62" x2="66.04" y2="261.62" width="0.1524" layer="91"/>
<junction x="30.48" y="261.62"/>
</segment>
</net>
</nets>
</sheet>
<sheet>
<description>Motor Driver(1/2)</description>
<plain>
<wire x1="0" y1="0" x2="0" y2="279.4" width="0.1524" layer="97"/>
<wire x1="0" y1="0" x2="406.4" y2="0" width="0.1524" layer="97"/>
<wire x1="406.4" y1="0" x2="406.4" y2="279.4" width="0.1524" layer="97"/>
<wire x1="0" y1="279.4" x2="406.4" y2="279.4" width="0.1524" layer="97"/>
<wire x1="2.54" y1="88.9" x2="403.86" y2="88.9" width="0.508" layer="102"/>
<wire x1="403.86" y1="88.9" x2="403.86" y2="2.54" width="0.508" layer="102"/>
<wire x1="403.86" y1="2.54" x2="2.54" y2="2.54" width="0.508" layer="102"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="88.9" width="0.508" layer="102"/>
<wire x1="119.38" y1="248.92" x2="167.64" y2="187.96" width="0.508" layer="102"/>
<wire x1="119.38" y1="187.96" x2="167.64" y2="248.92" width="0.508" layer="102"/>
<wire x1="119.38" y1="152.4" x2="167.64" y2="91.44" width="0.508" layer="102"/>
<wire x1="119.38" y1="91.44" x2="167.64" y2="152.4" width="0.508" layer="102"/>
<wire x1="317.5" y1="248.92" x2="365.76" y2="187.96" width="0.508" layer="102"/>
<wire x1="317.5" y1="187.96" x2="365.76" y2="248.92" width="0.508" layer="102"/>
<wire x1="317.5" y1="152.4" x2="365.76" y2="91.44" width="0.508" layer="102"/>
<wire x1="317.5" y1="91.44" x2="365.76" y2="152.4" width="0.508" layer="102"/>
<wire x1="2.54" y1="276.86" x2="403.86" y2="276.86" width="0.508" layer="102"/>
<wire x1="403.86" y1="276.86" x2="403.86" y2="91.44" width="0.508" layer="102"/>
<wire x1="403.86" y1="91.44" x2="2.54" y2="91.44" width="0.508" layer="102"/>
<wire x1="2.54" y1="91.44" x2="2.54" y2="276.86" width="0.508" layer="102"/>
<text x="398.78" y="40.64" size="5.08" layer="102" align="center-right">⑤
抵抗</text>
<text x="398.78" y="17.78" size="5.08" layer="102" align="center-right">⑦
コネクタ
コンデンサ</text>
<text x="398.78" y="271.78" size="5.08" layer="102" align="center">⑥</text>
</plain>
<instances>
<instance part="CN10" gate="G$1" x="53.34" y="27.94"/>
<instance part="GND78" gate="1" x="48.26" y="17.78"/>
<instance part="GND80" gate="1" x="63.5" y="68.58"/>
<instance part="CN12" gate="G$1" x="147.32" y="27.94"/>
<instance part="GND81" gate="1" x="157.48" y="68.58"/>
<instance part="CN14" gate="G$1" x="241.3" y="27.94"/>
<instance part="CN16" gate="G$1" x="335.28" y="27.94"/>
<instance part="C95" gate="G$1" x="134.62" y="259.08"/>
<instance part="R66" gate="G$1" x="50.8" y="208.28"/>
<instance part="C89" gate="G$1" x="106.68" y="251.46" rot="R90"/>
<instance part="C90" gate="G$1" x="106.68" y="233.68" rot="R90"/>
<instance part="C91" gate="G$1" x="106.68" y="215.9" rot="R90"/>
<instance part="R68" gate="G$1" x="129.54" y="246.38"/>
<instance part="R69" gate="G$1" x="129.54" y="218.44"/>
<instance part="U18" gate="G$1" x="147.32" y="233.68"/>
<instance part="GND61" gate="1" x="160.02" y="226.06"/>
<instance part="C96" gate="G$1" x="160.02" y="231.14"/>
<instance part="U19" gate="G$1" x="147.32" y="205.74"/>
<instance part="GND62" gate="1" x="160.02" y="198.12"/>
<instance part="C97" gate="G$1" x="160.02" y="203.2"/>
<instance part="U17" gate="G$1" x="76.2" y="238.76"/>
<instance part="GND64" gate="1" x="78.74" y="198.12"/>
<instance part="R67" gate="G$1" x="71.12" y="198.12" rot="R90"/>
<instance part="GND65" gate="1" x="71.12" y="190.5"/>
<instance part="C87" gate="G$1" x="38.1" y="243.84"/>
<instance part="C94" gate="G$1" x="127" y="259.08" smashed="yes">
<attribute name="NAME" x="128.524" y="269.621" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="128.524" y="267.081" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="GND66" gate="1" x="127" y="254"/>
<instance part="C93" gate="G$1" x="121.92" y="259.08" smashed="yes">
<attribute name="NAME" x="120.904" y="269.621" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="120.904" y="267.081" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="C92" gate="G$1" x="116.84" y="259.08" smashed="yes">
<attribute name="NAME" x="113.284" y="269.621" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="113.284" y="267.081" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="C84" gate="G$1" x="27.94" y="259.08"/>
<instance part="C85" gate="G$1" x="33.02" y="259.08"/>
<instance part="C86" gate="G$1" x="38.1" y="259.08"/>
<instance part="C88" gate="G$1" x="43.18" y="259.08"/>
<instance part="GND67" gate="1" x="33.02" y="254"/>
<instance part="C83" gate="G$1" x="20.32" y="259.08"/>
<instance part="P+4" gate="G$1" x="142.24" y="266.7" rot="R270"/>
<instance part="+P29" gate="1" x="12.7" y="266.7" rot="MR270"/>
<instance part="RA4" gate="A" x="45.72" y="233.68"/>
<instance part="RA4" gate="B" x="45.72" y="231.14"/>
<instance part="RA4" gate="C" x="45.72" y="226.06"/>
<instance part="RA4" gate="D" x="45.72" y="218.44"/>
<instance part="RA5" gate="A" x="45.72" y="223.52"/>
<instance part="RA5" gate="B" x="45.72" y="215.9"/>
<instance part="RA5" gate="C" x="45.72" y="213.36"/>
<instance part="RA5" gate="D" x="45.72" y="220.98"/>
<instance part="C80" gate="G$1" x="134.62" y="167.64"/>
<instance part="R62" gate="G$1" x="50.8" y="116.84"/>
<instance part="C74" gate="G$1" x="106.68" y="160.02" rot="R90"/>
<instance part="C75" gate="G$1" x="106.68" y="142.24" rot="R90"/>
<instance part="C76" gate="G$1" x="106.68" y="124.46" rot="R90"/>
<instance part="R65" gate="G$1" x="129.54" y="119.38"/>
<instance part="R64" gate="G$1" x="129.54" y="147.32"/>
<instance part="U16" gate="G$1" x="147.32" y="106.68"/>
<instance part="GND25" gate="1" x="160.02" y="99.06"/>
<instance part="C82" gate="G$1" x="160.02" y="104.14"/>
<instance part="U15" gate="G$1" x="147.32" y="134.62"/>
<instance part="GND55" gate="1" x="160.02" y="127"/>
<instance part="C81" gate="G$1" x="160.02" y="132.08"/>
<instance part="U14" gate="G$1" x="76.2" y="147.32"/>
<instance part="GND57" gate="1" x="78.74" y="106.68"/>
<instance part="R63" gate="G$1" x="71.12" y="106.68" rot="R90"/>
<instance part="GND58" gate="1" x="71.12" y="99.06"/>
<instance part="C72" gate="G$1" x="38.1" y="152.4"/>
<instance part="C79" gate="G$1" x="127" y="167.64" smashed="yes">
<attribute name="NAME" x="128.524" y="178.181" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="128.524" y="175.641" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="GND59" gate="1" x="127" y="162.56"/>
<instance part="C78" gate="G$1" x="121.92" y="167.64" smashed="yes">
<attribute name="NAME" x="120.904" y="178.181" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="120.904" y="175.641" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="C77" gate="G$1" x="116.84" y="167.64" smashed="yes">
<attribute name="NAME" x="113.284" y="178.181" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="113.284" y="175.641" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="C69" gate="G$1" x="27.94" y="167.64"/>
<instance part="C70" gate="G$1" x="33.02" y="167.64"/>
<instance part="C71" gate="G$1" x="38.1" y="167.64"/>
<instance part="C73" gate="G$1" x="43.18" y="167.64"/>
<instance part="GND60" gate="1" x="33.02" y="162.56"/>
<instance part="C68" gate="G$1" x="20.32" y="167.64"/>
<instance part="P+3" gate="G$1" x="142.24" y="175.26" rot="R270"/>
<instance part="+P27" gate="1" x="12.7" y="175.26" rot="MR270"/>
<instance part="RA2" gate="A" x="45.72" y="142.24"/>
<instance part="RA2" gate="B" x="45.72" y="139.7"/>
<instance part="RA2" gate="C" x="45.72" y="134.62"/>
<instance part="RA2" gate="D" x="45.72" y="127"/>
<instance part="RA3" gate="A" x="45.72" y="132.08"/>
<instance part="RA3" gate="B" x="45.72" y="124.46"/>
<instance part="RA3" gate="C" x="45.72" y="121.92"/>
<instance part="RA3" gate="D" x="45.72" y="129.54"/>
<instance part="C110" gate="G$1" x="332.74" y="167.64"/>
<instance part="R70" gate="G$1" x="248.92" y="116.84"/>
<instance part="C104" gate="G$1" x="304.8" y="160.02" rot="R90"/>
<instance part="C105" gate="G$1" x="304.8" y="142.24" rot="R90"/>
<instance part="C106" gate="G$1" x="304.8" y="124.46" rot="R90"/>
<instance part="R73" gate="G$1" x="327.66" y="119.38"/>
<instance part="R72" gate="G$1" x="327.66" y="147.32"/>
<instance part="U22" gate="G$1" x="345.44" y="106.68"/>
<instance part="GND85" gate="1" x="358.14" y="99.06"/>
<instance part="C112" gate="G$1" x="358.14" y="104.14"/>
<instance part="U21" gate="G$1" x="345.44" y="134.62"/>
<instance part="GND86" gate="1" x="358.14" y="127"/>
<instance part="C111" gate="G$1" x="358.14" y="132.08"/>
<instance part="U20" gate="G$1" x="274.32" y="147.32"/>
<instance part="GND88" gate="1" x="276.86" y="106.68"/>
<instance part="R71" gate="G$1" x="269.24" y="106.68" rot="R90"/>
<instance part="GND89" gate="1" x="269.24" y="99.06"/>
<instance part="C102" gate="G$1" x="236.22" y="152.4"/>
<instance part="C109" gate="G$1" x="325.12" y="167.64" smashed="yes">
<attribute name="NAME" x="326.644" y="178.181" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="326.644" y="175.641" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="GND90" gate="1" x="325.12" y="162.56"/>
<instance part="C108" gate="G$1" x="320.04" y="167.64" smashed="yes">
<attribute name="NAME" x="319.024" y="178.181" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="319.024" y="175.641" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="C107" gate="G$1" x="314.96" y="167.64" smashed="yes">
<attribute name="NAME" x="311.404" y="178.181" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="311.404" y="175.641" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="C99" gate="G$1" x="226.06" y="167.64"/>
<instance part="C100" gate="G$1" x="231.14" y="167.64"/>
<instance part="C101" gate="G$1" x="236.22" y="167.64"/>
<instance part="C103" gate="G$1" x="241.3" y="167.64"/>
<instance part="GND91" gate="1" x="231.14" y="162.56"/>
<instance part="C98" gate="G$1" x="218.44" y="167.64"/>
<instance part="+P51" gate="1" x="210.82" y="175.26" rot="MR270"/>
<instance part="RA6" gate="A" x="243.84" y="142.24"/>
<instance part="RA6" gate="B" x="243.84" y="139.7"/>
<instance part="RA6" gate="C" x="243.84" y="134.62"/>
<instance part="RA6" gate="D" x="243.84" y="127"/>
<instance part="RA7" gate="A" x="243.84" y="132.08"/>
<instance part="RA7" gate="B" x="243.84" y="124.46"/>
<instance part="RA7" gate="C" x="243.84" y="121.92"/>
<instance part="RA7" gate="D" x="243.84" y="129.54"/>
<instance part="C125" gate="G$1" x="332.74" y="259.08"/>
<instance part="R74" gate="G$1" x="248.92" y="208.28"/>
<instance part="C119" gate="G$1" x="304.8" y="251.46" rot="R90"/>
<instance part="C120" gate="G$1" x="304.8" y="233.68" rot="R90"/>
<instance part="C121" gate="G$1" x="304.8" y="215.9" rot="R90"/>
<instance part="R76" gate="G$1" x="327.66" y="246.38"/>
<instance part="R77" gate="G$1" x="327.66" y="218.44"/>
<instance part="U24" gate="G$1" x="345.44" y="233.68"/>
<instance part="GND95" gate="1" x="358.14" y="226.06"/>
<instance part="C126" gate="G$1" x="358.14" y="231.14"/>
<instance part="U25" gate="G$1" x="345.44" y="205.74"/>
<instance part="GND96" gate="1" x="358.14" y="198.12"/>
<instance part="C127" gate="G$1" x="358.14" y="203.2"/>
<instance part="U23" gate="G$1" x="274.32" y="238.76"/>
<instance part="GND98" gate="1" x="276.86" y="198.12"/>
<instance part="R75" gate="G$1" x="269.24" y="198.12" rot="R90"/>
<instance part="GND99" gate="1" x="269.24" y="190.5"/>
<instance part="C117" gate="G$1" x="236.22" y="243.84"/>
<instance part="C124" gate="G$1" x="325.12" y="259.08" smashed="yes">
<attribute name="NAME" x="326.644" y="269.621" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="326.644" y="267.081" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="GND100" gate="1" x="325.12" y="254"/>
<instance part="C123" gate="G$1" x="320.04" y="259.08" smashed="yes">
<attribute name="NAME" x="319.024" y="269.621" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="319.024" y="267.081" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="C122" gate="G$1" x="314.96" y="259.08" smashed="yes">
<attribute name="NAME" x="311.404" y="269.621" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="311.404" y="267.081" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="C114" gate="G$1" x="226.06" y="259.08"/>
<instance part="C115" gate="G$1" x="231.14" y="259.08"/>
<instance part="C116" gate="G$1" x="236.22" y="259.08"/>
<instance part="C118" gate="G$1" x="241.3" y="259.08"/>
<instance part="GND101" gate="1" x="231.14" y="254"/>
<instance part="C113" gate="G$1" x="218.44" y="259.08"/>
<instance part="+P57" gate="1" x="210.82" y="266.7" rot="MR270"/>
<instance part="RA8" gate="A" x="243.84" y="233.68"/>
<instance part="RA8" gate="B" x="243.84" y="231.14"/>
<instance part="RA8" gate="C" x="243.84" y="226.06"/>
<instance part="RA8" gate="D" x="243.84" y="218.44"/>
<instance part="RA9" gate="A" x="243.84" y="223.52"/>
<instance part="RA9" gate="B" x="243.84" y="215.9"/>
<instance part="RA9" gate="C" x="243.84" y="213.36"/>
<instance part="RA9" gate="D" x="243.84" y="220.98"/>
<instance part="P+2" gate="G$1" x="340.36" y="266.7" rot="R270"/>
<instance part="P+5" gate="G$1" x="340.36" y="175.26" rot="R270"/>
<instance part="C128" gate="G$1" x="71.12" y="20.32"/>
<instance part="GND63" gate="1" x="71.12" y="15.24"/>
<instance part="C129" gate="G$1" x="165.1" y="20.32"/>
<instance part="GND68" gate="1" x="165.1" y="15.24"/>
<instance part="CN9" gate="G$1" x="50.8" y="68.58"/>
<instance part="GND69" gate="1" x="48.26" y="50.8"/>
<instance part="CN11" gate="G$1" x="144.78" y="68.58"/>
<instance part="GND70" gate="1" x="142.24" y="50.8"/>
<instance part="GND71" gate="1" x="251.46" y="68.58"/>
<instance part="CN13" gate="G$1" x="238.76" y="68.58"/>
<instance part="GND72" gate="1" x="236.22" y="50.8"/>
<instance part="GND73" gate="1" x="345.44" y="68.58"/>
<instance part="CN15" gate="G$1" x="332.74" y="68.58"/>
<instance part="GND79" gate="1" x="330.2" y="50.8"/>
<instance part="C130" gate="G$1" x="259.08" y="20.32"/>
<instance part="GND126" gate="1" x="259.08" y="15.24"/>
<instance part="C131" gate="G$1" x="353.06" y="20.32"/>
<instance part="GND127" gate="1" x="353.06" y="15.24"/>
<instance part="GND34" gate="1" x="142.24" y="17.78"/>
<instance part="GND82" gate="1" x="236.22" y="17.78"/>
<instance part="GND93" gate="1" x="330.2" y="17.78"/>
<instance part="+P33" gate="1" x="71.12" y="78.74" rot="R270"/>
<instance part="+P34" gate="1" x="165.1" y="30.48"/>
<instance part="+P44" gate="1" x="139.7" y="35.56"/>
<instance part="+P45" gate="1" x="45.72" y="35.56"/>
<instance part="+P46" gate="1" x="71.12" y="30.48"/>
<instance part="+P47" gate="1" x="165.1" y="78.74" rot="R270"/>
<instance part="+P35" gate="1" x="327.66" y="35.56"/>
<instance part="+P36" gate="1" x="353.06" y="30.48"/>
<instance part="+P39" gate="1" x="233.68" y="35.56"/>
<instance part="+P43" gate="1" x="259.08" y="30.48"/>
<instance part="+P48" gate="1" x="259.08" y="78.74" rot="R270"/>
<instance part="+P52" gate="1" x="353.06" y="78.74" rot="R270"/>
<instance part="R80" gate="G$1" x="66.04" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="59.4614" y="48.26" size="1.778" layer="95" font="vector" rot="R90"/>
<attribute name="VALUE" x="74.422" y="48.26" size="1.778" layer="96" font="vector" rot="R90"/>
</instance>
<instance part="R81" gate="G$1" x="68.58" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="62.0014" y="48.26" size="1.778" layer="95" font="vector" rot="R90"/>
</instance>
<instance part="R82" gate="G$1" x="71.12" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="64.5414" y="48.26" size="1.778" layer="95" font="vector" rot="R90"/>
</instance>
<instance part="R78" gate="G$1" x="38.1" y="20.32" smashed="yes" rot="R90">
<attribute name="NAME" x="34.0614" y="15.24" size="1.778" layer="95" font="vector" rot="R90"/>
<attribute name="VALUE" x="43.942" y="15.24" size="1.778" layer="96" font="vector" rot="R90"/>
</instance>
<instance part="R79" gate="G$1" x="40.64" y="20.32" smashed="yes" rot="R90">
<attribute name="NAME" x="36.6014" y="15.24" size="1.778" layer="95" font="vector" rot="R90"/>
</instance>
<instance part="GND159" gate="1" x="68.58" y="43.18"/>
<instance part="GND162" gate="1" x="40.64" y="10.16"/>
<instance part="R85" gate="G$1" x="160.02" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="153.4414" y="48.26" size="1.778" layer="95" font="vector" rot="R90"/>
<attribute name="VALUE" x="168.402" y="48.26" size="1.778" layer="96" font="vector" rot="R90"/>
</instance>
<instance part="R86" gate="G$1" x="162.56" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="155.9814" y="48.26" size="1.778" layer="95" font="vector" rot="R90"/>
</instance>
<instance part="R87" gate="G$1" x="165.1" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="158.5214" y="48.26" size="1.778" layer="95" font="vector" rot="R90"/>
</instance>
<instance part="GND163" gate="1" x="162.56" y="43.18"/>
<instance part="R83" gate="G$1" x="132.08" y="20.32" smashed="yes" rot="R90">
<attribute name="NAME" x="128.0414" y="15.24" size="1.778" layer="95" font="vector" rot="R90"/>
<attribute name="VALUE" x="137.922" y="15.24" size="1.778" layer="96" font="vector" rot="R90"/>
</instance>
<instance part="R84" gate="G$1" x="134.62" y="20.32" smashed="yes" rot="R90">
<attribute name="NAME" x="130.5814" y="15.24" size="1.778" layer="95" font="vector" rot="R90"/>
</instance>
<instance part="GND164" gate="1" x="134.62" y="10.16"/>
<instance part="R90" gate="G$1" x="254" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="247.4214" y="48.26" size="1.778" layer="95" font="vector" rot="R90"/>
<attribute name="VALUE" x="262.382" y="48.26" size="1.778" layer="96" font="vector" rot="R90"/>
</instance>
<instance part="R91" gate="G$1" x="256.54" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="249.9614" y="48.26" size="1.778" layer="95" font="vector" rot="R90"/>
</instance>
<instance part="R92" gate="G$1" x="259.08" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="252.5014" y="48.26" size="1.778" layer="95" font="vector" rot="R90"/>
</instance>
<instance part="GND165" gate="1" x="256.54" y="43.18"/>
<instance part="R88" gate="G$1" x="226.06" y="20.32" smashed="yes" rot="R90">
<attribute name="NAME" x="222.0214" y="15.24" size="1.778" layer="95" font="vector" rot="R90"/>
<attribute name="VALUE" x="231.902" y="15.24" size="1.778" layer="96" font="vector" rot="R90"/>
</instance>
<instance part="R89" gate="G$1" x="228.6" y="20.32" smashed="yes" rot="R90">
<attribute name="NAME" x="224.5614" y="15.24" size="1.778" layer="95" font="vector" rot="R90"/>
</instance>
<instance part="GND166" gate="1" x="228.6" y="10.16"/>
<instance part="R95" gate="G$1" x="347.98" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="341.4014" y="48.26" size="1.778" layer="95" font="vector" rot="R90"/>
<attribute name="VALUE" x="356.362" y="48.26" size="1.778" layer="96" font="vector" rot="R90"/>
</instance>
<instance part="R96" gate="G$1" x="350.52" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="343.9414" y="48.26" size="1.778" layer="95" font="vector" rot="R90"/>
</instance>
<instance part="R97" gate="G$1" x="353.06" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="346.4814" y="48.26" size="1.778" layer="95" font="vector" rot="R90"/>
</instance>
<instance part="GND167" gate="1" x="350.52" y="43.18"/>
<instance part="R93" gate="G$1" x="320.04" y="20.32" smashed="yes" rot="R90">
<attribute name="NAME" x="316.0014" y="15.24" size="1.778" layer="95" font="vector" rot="R90"/>
<attribute name="VALUE" x="325.882" y="15.24" size="1.778" layer="96" font="vector" rot="R90"/>
</instance>
<instance part="R94" gate="G$1" x="322.58" y="20.32" smashed="yes" rot="R90">
<attribute name="NAME" x="318.5414" y="15.24" size="1.778" layer="95" font="vector" rot="R90"/>
</instance>
<instance part="GND168" gate="1" x="322.58" y="10.16"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<wire x1="60.96" y1="71.12" x2="63.5" y2="71.12" width="0.1524" layer="91"/>
<pinref part="GND80" gate="1" pin="GND"/>
<pinref part="CN9" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U18" gate="G$1" pin="GND"/>
<wire x1="157.48" y1="228.6" x2="160.02" y2="228.6" width="0.1524" layer="91"/>
<pinref part="GND61" gate="1" pin="GND"/>
<pinref part="C96" gate="G$1" pin="2"/>
<junction x="160.02" y="228.6"/>
</segment>
<segment>
<pinref part="U19" gate="G$1" pin="GND"/>
<wire x1="157.48" y1="200.66" x2="160.02" y2="200.66" width="0.1524" layer="91"/>
<pinref part="GND62" gate="1" pin="GND"/>
<pinref part="C97" gate="G$1" pin="2"/>
<junction x="160.02" y="200.66"/>
</segment>
<segment>
<pinref part="U17" gate="G$1" pin="GND"/>
<wire x1="73.66" y1="203.2" x2="73.66" y2="200.66" width="0.1524" layer="91"/>
<wire x1="73.66" y1="200.66" x2="76.2" y2="200.66" width="0.1524" layer="91"/>
<wire x1="76.2" y1="200.66" x2="78.74" y2="200.66" width="0.1524" layer="91"/>
<wire x1="78.74" y1="200.66" x2="81.28" y2="200.66" width="0.1524" layer="91"/>
<pinref part="U17" gate="G$1" pin="GND_C"/>
<wire x1="81.28" y1="203.2" x2="81.28" y2="200.66" width="0.1524" layer="91"/>
<pinref part="U17" gate="G$1" pin="GND_B"/>
<wire x1="78.74" y1="203.2" x2="78.74" y2="200.66" width="0.1524" layer="91"/>
<pinref part="U17" gate="G$1" pin="GND_A"/>
<wire x1="76.2" y1="203.2" x2="76.2" y2="200.66" width="0.1524" layer="91"/>
<junction x="76.2" y="200.66"/>
<junction x="78.74" y="200.66"/>
<pinref part="GND64" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R67" gate="G$1" pin="1"/>
<pinref part="GND65" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C95" gate="G$1" pin="N"/>
<pinref part="GND66" gate="1" pin="GND"/>
<pinref part="C94" gate="G$1" pin="2"/>
<junction x="127" y="256.54"/>
<wire x1="127" y1="256.54" x2="134.62" y2="256.54" width="0.1524" layer="91"/>
<pinref part="C92" gate="G$1" pin="2"/>
<pinref part="C93" gate="G$1" pin="2"/>
<wire x1="116.84" y1="256.54" x2="121.92" y2="256.54" width="0.1524" layer="91"/>
<wire x1="121.92" y1="256.54" x2="127" y2="256.54" width="0.1524" layer="91"/>
<junction x="121.92" y="256.54"/>
</segment>
<segment>
<pinref part="C85" gate="G$1" pin="2"/>
<pinref part="GND67" gate="1" pin="GND"/>
<pinref part="C86" gate="G$1" pin="2"/>
<wire x1="33.02" y1="256.54" x2="38.1" y2="256.54" width="0.1524" layer="91"/>
<pinref part="C88" gate="G$1" pin="2"/>
<wire x1="38.1" y1="256.54" x2="43.18" y2="256.54" width="0.1524" layer="91"/>
<pinref part="C84" gate="G$1" pin="2"/>
<wire x1="33.02" y1="256.54" x2="27.94" y2="256.54" width="0.1524" layer="91"/>
<pinref part="C83" gate="G$1" pin="N"/>
<wire x1="20.32" y1="256.54" x2="27.94" y2="256.54" width="0.1524" layer="91"/>
<junction x="27.94" y="256.54"/>
<junction x="33.02" y="256.54"/>
<junction x="38.1" y="256.54"/>
</segment>
<segment>
<pinref part="U16" gate="G$1" pin="GND"/>
<wire x1="157.48" y1="101.6" x2="160.02" y2="101.6" width="0.1524" layer="91"/>
<pinref part="GND25" gate="1" pin="GND"/>
<pinref part="C82" gate="G$1" pin="2"/>
<junction x="160.02" y="101.6"/>
</segment>
<segment>
<pinref part="U15" gate="G$1" pin="GND"/>
<wire x1="157.48" y1="129.54" x2="160.02" y2="129.54" width="0.1524" layer="91"/>
<pinref part="GND55" gate="1" pin="GND"/>
<pinref part="C81" gate="G$1" pin="2"/>
<junction x="160.02" y="129.54"/>
</segment>
<segment>
<pinref part="U14" gate="G$1" pin="GND"/>
<wire x1="73.66" y1="111.76" x2="73.66" y2="109.22" width="0.1524" layer="91"/>
<wire x1="73.66" y1="109.22" x2="76.2" y2="109.22" width="0.1524" layer="91"/>
<wire x1="76.2" y1="109.22" x2="78.74" y2="109.22" width="0.1524" layer="91"/>
<wire x1="78.74" y1="109.22" x2="81.28" y2="109.22" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="GND_C"/>
<wire x1="81.28" y1="111.76" x2="81.28" y2="109.22" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="GND_B"/>
<wire x1="78.74" y1="111.76" x2="78.74" y2="109.22" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="GND_A"/>
<wire x1="76.2" y1="111.76" x2="76.2" y2="109.22" width="0.1524" layer="91"/>
<junction x="76.2" y="109.22"/>
<junction x="78.74" y="109.22"/>
<pinref part="GND57" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R63" gate="G$1" pin="1"/>
<pinref part="GND58" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C80" gate="G$1" pin="N"/>
<pinref part="GND59" gate="1" pin="GND"/>
<pinref part="C79" gate="G$1" pin="2"/>
<junction x="127" y="165.1"/>
<wire x1="127" y1="165.1" x2="134.62" y2="165.1" width="0.1524" layer="91"/>
<pinref part="C77" gate="G$1" pin="2"/>
<pinref part="C78" gate="G$1" pin="2"/>
<wire x1="116.84" y1="165.1" x2="121.92" y2="165.1" width="0.1524" layer="91"/>
<wire x1="121.92" y1="165.1" x2="127" y2="165.1" width="0.1524" layer="91"/>
<junction x="121.92" y="165.1"/>
</segment>
<segment>
<pinref part="C70" gate="G$1" pin="2"/>
<pinref part="GND60" gate="1" pin="GND"/>
<pinref part="C71" gate="G$1" pin="2"/>
<wire x1="33.02" y1="165.1" x2="38.1" y2="165.1" width="0.1524" layer="91"/>
<pinref part="C73" gate="G$1" pin="2"/>
<wire x1="38.1" y1="165.1" x2="43.18" y2="165.1" width="0.1524" layer="91"/>
<pinref part="C69" gate="G$1" pin="2"/>
<wire x1="33.02" y1="165.1" x2="27.94" y2="165.1" width="0.1524" layer="91"/>
<pinref part="C68" gate="G$1" pin="N"/>
<wire x1="20.32" y1="165.1" x2="27.94" y2="165.1" width="0.1524" layer="91"/>
<junction x="27.94" y="165.1"/>
<junction x="33.02" y="165.1"/>
<junction x="38.1" y="165.1"/>
</segment>
<segment>
<pinref part="U22" gate="G$1" pin="GND"/>
<wire x1="355.6" y1="101.6" x2="358.14" y2="101.6" width="0.1524" layer="91"/>
<pinref part="GND85" gate="1" pin="GND"/>
<pinref part="C112" gate="G$1" pin="2"/>
<junction x="358.14" y="101.6"/>
</segment>
<segment>
<pinref part="U21" gate="G$1" pin="GND"/>
<wire x1="355.6" y1="129.54" x2="358.14" y2="129.54" width="0.1524" layer="91"/>
<pinref part="GND86" gate="1" pin="GND"/>
<pinref part="C111" gate="G$1" pin="2"/>
<junction x="358.14" y="129.54"/>
</segment>
<segment>
<pinref part="U20" gate="G$1" pin="GND"/>
<wire x1="271.78" y1="111.76" x2="271.78" y2="109.22" width="0.1524" layer="91"/>
<wire x1="271.78" y1="109.22" x2="274.32" y2="109.22" width="0.1524" layer="91"/>
<wire x1="274.32" y1="109.22" x2="276.86" y2="109.22" width="0.1524" layer="91"/>
<wire x1="276.86" y1="109.22" x2="279.4" y2="109.22" width="0.1524" layer="91"/>
<pinref part="U20" gate="G$1" pin="GND_C"/>
<wire x1="279.4" y1="111.76" x2="279.4" y2="109.22" width="0.1524" layer="91"/>
<pinref part="U20" gate="G$1" pin="GND_B"/>
<wire x1="276.86" y1="111.76" x2="276.86" y2="109.22" width="0.1524" layer="91"/>
<pinref part="U20" gate="G$1" pin="GND_A"/>
<wire x1="274.32" y1="111.76" x2="274.32" y2="109.22" width="0.1524" layer="91"/>
<junction x="274.32" y="109.22"/>
<junction x="276.86" y="109.22"/>
<pinref part="GND88" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R71" gate="G$1" pin="1"/>
<pinref part="GND89" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C110" gate="G$1" pin="N"/>
<pinref part="GND90" gate="1" pin="GND"/>
<pinref part="C109" gate="G$1" pin="2"/>
<junction x="325.12" y="165.1"/>
<wire x1="325.12" y1="165.1" x2="332.74" y2="165.1" width="0.1524" layer="91"/>
<pinref part="C107" gate="G$1" pin="2"/>
<pinref part="C108" gate="G$1" pin="2"/>
<wire x1="314.96" y1="165.1" x2="320.04" y2="165.1" width="0.1524" layer="91"/>
<wire x1="320.04" y1="165.1" x2="325.12" y2="165.1" width="0.1524" layer="91"/>
<junction x="320.04" y="165.1"/>
</segment>
<segment>
<pinref part="C100" gate="G$1" pin="2"/>
<pinref part="GND91" gate="1" pin="GND"/>
<pinref part="C101" gate="G$1" pin="2"/>
<wire x1="231.14" y1="165.1" x2="236.22" y2="165.1" width="0.1524" layer="91"/>
<pinref part="C103" gate="G$1" pin="2"/>
<wire x1="236.22" y1="165.1" x2="241.3" y2="165.1" width="0.1524" layer="91"/>
<pinref part="C99" gate="G$1" pin="2"/>
<wire x1="231.14" y1="165.1" x2="226.06" y2="165.1" width="0.1524" layer="91"/>
<pinref part="C98" gate="G$1" pin="N"/>
<wire x1="218.44" y1="165.1" x2="226.06" y2="165.1" width="0.1524" layer="91"/>
<junction x="226.06" y="165.1"/>
<junction x="231.14" y="165.1"/>
<junction x="236.22" y="165.1"/>
</segment>
<segment>
<pinref part="U24" gate="G$1" pin="GND"/>
<wire x1="355.6" y1="228.6" x2="358.14" y2="228.6" width="0.1524" layer="91"/>
<pinref part="GND95" gate="1" pin="GND"/>
<pinref part="C126" gate="G$1" pin="2"/>
<junction x="358.14" y="228.6"/>
</segment>
<segment>
<pinref part="U25" gate="G$1" pin="GND"/>
<wire x1="355.6" y1="200.66" x2="358.14" y2="200.66" width="0.1524" layer="91"/>
<pinref part="GND96" gate="1" pin="GND"/>
<pinref part="C127" gate="G$1" pin="2"/>
<junction x="358.14" y="200.66"/>
</segment>
<segment>
<pinref part="U23" gate="G$1" pin="GND"/>
<wire x1="271.78" y1="203.2" x2="271.78" y2="200.66" width="0.1524" layer="91"/>
<wire x1="271.78" y1="200.66" x2="274.32" y2="200.66" width="0.1524" layer="91"/>
<wire x1="274.32" y1="200.66" x2="276.86" y2="200.66" width="0.1524" layer="91"/>
<wire x1="276.86" y1="200.66" x2="279.4" y2="200.66" width="0.1524" layer="91"/>
<pinref part="U23" gate="G$1" pin="GND_C"/>
<wire x1="279.4" y1="203.2" x2="279.4" y2="200.66" width="0.1524" layer="91"/>
<pinref part="U23" gate="G$1" pin="GND_B"/>
<wire x1="276.86" y1="203.2" x2="276.86" y2="200.66" width="0.1524" layer="91"/>
<pinref part="U23" gate="G$1" pin="GND_A"/>
<wire x1="274.32" y1="203.2" x2="274.32" y2="200.66" width="0.1524" layer="91"/>
<junction x="274.32" y="200.66"/>
<junction x="276.86" y="200.66"/>
<pinref part="GND98" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R75" gate="G$1" pin="1"/>
<pinref part="GND99" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C125" gate="G$1" pin="N"/>
<pinref part="GND100" gate="1" pin="GND"/>
<pinref part="C124" gate="G$1" pin="2"/>
<junction x="325.12" y="256.54"/>
<wire x1="325.12" y1="256.54" x2="332.74" y2="256.54" width="0.1524" layer="91"/>
<pinref part="C122" gate="G$1" pin="2"/>
<pinref part="C123" gate="G$1" pin="2"/>
<wire x1="314.96" y1="256.54" x2="320.04" y2="256.54" width="0.1524" layer="91"/>
<wire x1="320.04" y1="256.54" x2="325.12" y2="256.54" width="0.1524" layer="91"/>
<junction x="320.04" y="256.54"/>
</segment>
<segment>
<pinref part="C115" gate="G$1" pin="2"/>
<pinref part="GND101" gate="1" pin="GND"/>
<pinref part="C116" gate="G$1" pin="2"/>
<wire x1="231.14" y1="256.54" x2="236.22" y2="256.54" width="0.1524" layer="91"/>
<pinref part="C118" gate="G$1" pin="2"/>
<wire x1="236.22" y1="256.54" x2="241.3" y2="256.54" width="0.1524" layer="91"/>
<pinref part="C114" gate="G$1" pin="2"/>
<wire x1="231.14" y1="256.54" x2="226.06" y2="256.54" width="0.1524" layer="91"/>
<pinref part="C113" gate="G$1" pin="N"/>
<wire x1="218.44" y1="256.54" x2="226.06" y2="256.54" width="0.1524" layer="91"/>
<junction x="226.06" y="256.54"/>
<junction x="231.14" y="256.54"/>
<junction x="236.22" y="256.54"/>
</segment>
<segment>
<pinref part="C128" gate="G$1" pin="2"/>
<pinref part="GND63" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C129" gate="G$1" pin="2"/>
<pinref part="GND68" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="CN9" gate="G$1" pin="S1"/>
<pinref part="GND69" gate="1" pin="GND"/>
<pinref part="CN9" gate="G$1" pin="S2"/>
<wire x1="48.26" y1="53.34" x2="50.8" y2="53.34" width="0.1524" layer="91"/>
<junction x="48.26" y="53.34"/>
</segment>
<segment>
<pinref part="CN11" gate="G$1" pin="GND"/>
<pinref part="GND81" gate="1" pin="GND"/>
<wire x1="154.94" y1="71.12" x2="157.48" y2="71.12" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="CN11" gate="G$1" pin="S1"/>
<pinref part="GND70" gate="1" pin="GND"/>
<pinref part="CN11" gate="G$1" pin="S2"/>
<wire x1="142.24" y1="53.34" x2="144.78" y2="53.34" width="0.1524" layer="91"/>
<junction x="142.24" y="53.34"/>
</segment>
<segment>
<pinref part="CN13" gate="G$1" pin="GND"/>
<pinref part="GND71" gate="1" pin="GND"/>
<wire x1="248.92" y1="71.12" x2="251.46" y2="71.12" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="CN13" gate="G$1" pin="S1"/>
<pinref part="GND72" gate="1" pin="GND"/>
<pinref part="CN13" gate="G$1" pin="S2"/>
<wire x1="236.22" y1="53.34" x2="238.76" y2="53.34" width="0.1524" layer="91"/>
<junction x="236.22" y="53.34"/>
</segment>
<segment>
<pinref part="CN15" gate="G$1" pin="GND"/>
<pinref part="GND73" gate="1" pin="GND"/>
<wire x1="342.9" y1="71.12" x2="345.44" y2="71.12" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="CN15" gate="G$1" pin="S1"/>
<pinref part="GND79" gate="1" pin="GND"/>
<pinref part="CN15" gate="G$1" pin="S2"/>
<wire x1="330.2" y1="53.34" x2="332.74" y2="53.34" width="0.1524" layer="91"/>
<junction x="330.2" y="53.34"/>
</segment>
<segment>
<pinref part="C130" gate="G$1" pin="2"/>
<pinref part="GND126" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C131" gate="G$1" pin="2"/>
<pinref part="GND127" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND78" gate="1" pin="GND"/>
<wire x1="48.26" y1="20.32" x2="48.26" y2="27.94" width="0.1524" layer="91"/>
<pinref part="CN10" gate="G$1" pin="2"/>
<wire x1="48.26" y1="27.94" x2="50.8" y2="27.94" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND34" gate="1" pin="GND"/>
<wire x1="142.24" y1="20.32" x2="142.24" y2="27.94" width="0.1524" layer="91"/>
<wire x1="142.24" y1="27.94" x2="144.78" y2="27.94" width="0.1524" layer="91"/>
<pinref part="CN12" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="GND82" gate="1" pin="GND"/>
<wire x1="236.22" y1="20.32" x2="236.22" y2="27.94" width="0.1524" layer="91"/>
<wire x1="236.22" y1="27.94" x2="238.76" y2="27.94" width="0.1524" layer="91"/>
<pinref part="CN14" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="GND93" gate="1" pin="GND"/>
<wire x1="330.2" y1="20.32" x2="330.2" y2="27.94" width="0.1524" layer="91"/>
<wire x1="330.2" y1="27.94" x2="332.74" y2="27.94" width="0.1524" layer="91"/>
<pinref part="CN16" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="R80" gate="G$1" pin="1"/>
<wire x1="66.04" y1="48.26" x2="66.04" y2="45.72" width="0.1524" layer="91"/>
<wire x1="66.04" y1="45.72" x2="68.58" y2="45.72" width="0.1524" layer="91"/>
<pinref part="R81" gate="G$1" pin="1"/>
<wire x1="68.58" y1="45.72" x2="68.58" y2="48.26" width="0.1524" layer="91"/>
<pinref part="R82" gate="G$1" pin="1"/>
<wire x1="71.12" y1="48.26" x2="71.12" y2="45.72" width="0.1524" layer="91"/>
<wire x1="71.12" y1="45.72" x2="68.58" y2="45.72" width="0.1524" layer="91"/>
<pinref part="GND159" gate="1" pin="GND"/>
<junction x="68.58" y="45.72"/>
</segment>
<segment>
<pinref part="R78" gate="G$1" pin="1"/>
<wire x1="38.1" y1="15.24" x2="38.1" y2="12.7" width="0.1524" layer="91"/>
<wire x1="38.1" y1="12.7" x2="40.64" y2="12.7" width="0.1524" layer="91"/>
<pinref part="R79" gate="G$1" pin="1"/>
<wire x1="40.64" y1="12.7" x2="40.64" y2="15.24" width="0.1524" layer="91"/>
<pinref part="GND162" gate="1" pin="GND"/>
<junction x="40.64" y="12.7"/>
</segment>
<segment>
<pinref part="R85" gate="G$1" pin="1"/>
<wire x1="160.02" y1="48.26" x2="160.02" y2="45.72" width="0.1524" layer="91"/>
<wire x1="160.02" y1="45.72" x2="162.56" y2="45.72" width="0.1524" layer="91"/>
<pinref part="R86" gate="G$1" pin="1"/>
<wire x1="162.56" y1="45.72" x2="162.56" y2="48.26" width="0.1524" layer="91"/>
<pinref part="R87" gate="G$1" pin="1"/>
<wire x1="165.1" y1="48.26" x2="165.1" y2="45.72" width="0.1524" layer="91"/>
<wire x1="165.1" y1="45.72" x2="162.56" y2="45.72" width="0.1524" layer="91"/>
<pinref part="GND163" gate="1" pin="GND"/>
<junction x="162.56" y="45.72"/>
</segment>
<segment>
<pinref part="R83" gate="G$1" pin="1"/>
<wire x1="132.08" y1="15.24" x2="132.08" y2="12.7" width="0.1524" layer="91"/>
<wire x1="132.08" y1="12.7" x2="134.62" y2="12.7" width="0.1524" layer="91"/>
<pinref part="R84" gate="G$1" pin="1"/>
<wire x1="134.62" y1="12.7" x2="134.62" y2="15.24" width="0.1524" layer="91"/>
<pinref part="GND164" gate="1" pin="GND"/>
<junction x="134.62" y="12.7"/>
</segment>
<segment>
<pinref part="R90" gate="G$1" pin="1"/>
<wire x1="254" y1="48.26" x2="254" y2="45.72" width="0.1524" layer="91"/>
<wire x1="254" y1="45.72" x2="256.54" y2="45.72" width="0.1524" layer="91"/>
<pinref part="R91" gate="G$1" pin="1"/>
<wire x1="256.54" y1="45.72" x2="256.54" y2="48.26" width="0.1524" layer="91"/>
<pinref part="R92" gate="G$1" pin="1"/>
<wire x1="259.08" y1="48.26" x2="259.08" y2="45.72" width="0.1524" layer="91"/>
<wire x1="259.08" y1="45.72" x2="256.54" y2="45.72" width="0.1524" layer="91"/>
<pinref part="GND165" gate="1" pin="GND"/>
<junction x="256.54" y="45.72"/>
</segment>
<segment>
<pinref part="R88" gate="G$1" pin="1"/>
<wire x1="226.06" y1="15.24" x2="226.06" y2="12.7" width="0.1524" layer="91"/>
<wire x1="226.06" y1="12.7" x2="228.6" y2="12.7" width="0.1524" layer="91"/>
<pinref part="R89" gate="G$1" pin="1"/>
<wire x1="228.6" y1="12.7" x2="228.6" y2="15.24" width="0.1524" layer="91"/>
<pinref part="GND166" gate="1" pin="GND"/>
<junction x="228.6" y="12.7"/>
</segment>
<segment>
<pinref part="R95" gate="G$1" pin="1"/>
<wire x1="347.98" y1="48.26" x2="347.98" y2="45.72" width="0.1524" layer="91"/>
<wire x1="347.98" y1="45.72" x2="350.52" y2="45.72" width="0.1524" layer="91"/>
<pinref part="R96" gate="G$1" pin="1"/>
<wire x1="350.52" y1="45.72" x2="350.52" y2="48.26" width="0.1524" layer="91"/>
<pinref part="R97" gate="G$1" pin="1"/>
<wire x1="353.06" y1="48.26" x2="353.06" y2="45.72" width="0.1524" layer="91"/>
<wire x1="353.06" y1="45.72" x2="350.52" y2="45.72" width="0.1524" layer="91"/>
<pinref part="GND167" gate="1" pin="GND"/>
<junction x="350.52" y="45.72"/>
</segment>
<segment>
<pinref part="R93" gate="G$1" pin="1"/>
<wire x1="320.04" y1="15.24" x2="320.04" y2="12.7" width="0.1524" layer="91"/>
<wire x1="320.04" y1="12.7" x2="322.58" y2="12.7" width="0.1524" layer="91"/>
<pinref part="R94" gate="G$1" pin="1"/>
<wire x1="322.58" y1="12.7" x2="322.58" y2="15.24" width="0.1524" layer="91"/>
<pinref part="GND168" gate="1" pin="GND"/>
<junction x="322.58" y="12.7"/>
</segment>
</net>
<net name="!MOT1_RESET_A" class="0">
<segment>
<pinref part="RA2" gate="D" pin="1"/>
<wire x1="35.56" y1="127" x2="40.64" y2="127" width="0.1524" layer="91"/>
<label x="35.56" y="127" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT1_OUT_W" class="0">
<segment>
<wire x1="40.64" y1="58.42" x2="30.48" y2="58.42" width="0.1524" layer="91"/>
<label x="30.48" y="58.42" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN9" gate="G$1" pin="W"/>
</segment>
<segment>
<pinref part="R65" gate="G$1" pin="2"/>
<wire x1="132.08" y1="119.38" x2="134.62" y2="119.38" width="0.1524" layer="91"/>
<label x="142.24" y="119.38" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U16" gate="G$1" pin="VIN-"/>
<wire x1="134.62" y1="119.38" x2="142.24" y2="119.38" width="0.1524" layer="91"/>
<wire x1="137.16" y1="111.76" x2="134.62" y2="111.76" width="0.1524" layer="91"/>
<wire x1="134.62" y1="111.76" x2="134.62" y2="119.38" width="0.1524" layer="91"/>
<junction x="134.62" y="119.38"/>
</segment>
</net>
<net name="MOT1_OUT_U" class="0">
<segment>
<wire x1="40.64" y1="78.74" x2="30.48" y2="78.74" width="0.1524" layer="91"/>
<label x="30.48" y="78.74" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN9" gate="G$1" pin="U"/>
</segment>
<segment>
<pinref part="C74" gate="G$1" pin="2"/>
<wire x1="109.22" y1="160.02" x2="111.76" y2="160.02" width="0.1524" layer="91"/>
<wire x1="111.76" y1="160.02" x2="111.76" y2="154.94" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="OUT_A"/>
<wire x1="111.76" y1="154.94" x2="99.06" y2="154.94" width="0.1524" layer="91"/>
<wire x1="111.76" y1="154.94" x2="142.24" y2="154.94" width="0.1524" layer="91"/>
<junction x="111.76" y="154.94"/>
<label x="142.24" y="154.94" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="MOT1_OUT_V" class="0">
<segment>
<wire x1="40.64" y1="68.58" x2="30.48" y2="68.58" width="0.1524" layer="91"/>
<label x="30.48" y="68.58" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN9" gate="G$1" pin="V"/>
</segment>
<segment>
<pinref part="R64" gate="G$1" pin="2"/>
<label x="142.24" y="147.32" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="132.08" y1="147.32" x2="134.62" y2="147.32" width="0.1524" layer="91"/>
<pinref part="U15" gate="G$1" pin="VIN-"/>
<wire x1="134.62" y1="147.32" x2="142.24" y2="147.32" width="0.1524" layer="91"/>
<wire x1="134.62" y1="139.7" x2="137.16" y2="139.7" width="0.1524" layer="91"/>
<wire x1="134.62" y1="139.7" x2="134.62" y2="147.32" width="0.1524" layer="91"/>
<junction x="134.62" y="147.32"/>
</segment>
</net>
<net name="!MOT1_HU_5" class="0">
<segment>
<wire x1="60.96" y1="63.5" x2="66.04" y2="63.5" width="0.1524" layer="91"/>
<label x="73.66" y="63.5" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN9" gate="G$1" pin="HU"/>
<pinref part="R80" gate="G$1" pin="2"/>
<wire x1="66.04" y1="63.5" x2="73.66" y2="63.5" width="0.1524" layer="91"/>
<wire x1="66.04" y1="55.88" x2="66.04" y2="63.5" width="0.1524" layer="91"/>
<junction x="66.04" y="63.5"/>
</segment>
</net>
<net name="!MOT1_HV_5" class="0">
<segment>
<wire x1="73.66" y1="60.96" x2="68.58" y2="60.96" width="0.1524" layer="91"/>
<label x="73.66" y="60.96" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN9" gate="G$1" pin="HV"/>
<pinref part="R81" gate="G$1" pin="2"/>
<wire x1="68.58" y1="60.96" x2="60.96" y2="60.96" width="0.1524" layer="91"/>
<wire x1="68.58" y1="55.88" x2="68.58" y2="60.96" width="0.1524" layer="91"/>
<junction x="68.58" y="60.96"/>
</segment>
</net>
<net name="!MOT1_HW_5" class="0">
<segment>
<wire x1="60.96" y1="58.42" x2="71.12" y2="58.42" width="0.1524" layer="91"/>
<label x="73.66" y="58.42" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN9" gate="G$1" pin="HW"/>
<pinref part="R82" gate="G$1" pin="2"/>
<wire x1="71.12" y1="58.42" x2="73.66" y2="58.42" width="0.1524" layer="91"/>
<wire x1="71.12" y1="55.88" x2="71.12" y2="58.42" width="0.1524" layer="91"/>
<junction x="71.12" y="58.42"/>
</segment>
</net>
<net name="MOT1_2_CUR_REF" class="0">
<segment>
<pinref part="U18" gate="G$1" pin="REF"/>
<wire x1="157.48" y1="238.76" x2="167.64" y2="238.76" width="0.1524" layer="91"/>
<label x="167.64" y="238.76" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<pinref part="U19" gate="G$1" pin="REF"/>
<wire x1="157.48" y1="210.82" x2="167.64" y2="210.82" width="0.1524" layer="91"/>
<label x="167.64" y="210.82" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<pinref part="U16" gate="G$1" pin="REF"/>
<wire x1="157.48" y1="111.76" x2="167.64" y2="111.76" width="0.1524" layer="91"/>
<label x="167.64" y="111.76" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<pinref part="U15" gate="G$1" pin="REF"/>
<wire x1="157.48" y1="139.7" x2="167.64" y2="139.7" width="0.1524" layer="91"/>
<label x="167.64" y="139.7" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="VCC/1" class="0">
<segment>
<pinref part="U17" gate="G$1" pin="PVDD_A"/>
<wire x1="99.06" y1="266.7" x2="101.6" y2="266.7" width="0.1524" layer="91"/>
<wire x1="101.6" y1="266.7" x2="116.84" y2="266.7" width="0.1524" layer="91"/>
<wire x1="116.84" y1="266.7" x2="121.92" y2="266.7" width="0.1524" layer="91"/>
<wire x1="121.92" y1="266.7" x2="127" y2="266.7" width="0.1524" layer="91"/>
<wire x1="127" y1="266.7" x2="134.62" y2="266.7" width="0.1524" layer="91"/>
<pinref part="U17" gate="G$1" pin="PVDD_B"/>
<wire x1="99.06" y1="264.16" x2="101.6" y2="264.16" width="0.1524" layer="91"/>
<wire x1="101.6" y1="264.16" x2="101.6" y2="266.7" width="0.1524" layer="91"/>
<pinref part="U17" gate="G$1" pin="PVDD_C"/>
<wire x1="99.06" y1="261.62" x2="101.6" y2="261.62" width="0.1524" layer="91"/>
<wire x1="101.6" y1="261.62" x2="101.6" y2="264.16" width="0.1524" layer="91"/>
<junction x="101.6" y="264.16"/>
<junction x="101.6" y="266.7"/>
<pinref part="C94" gate="G$1" pin="1"/>
<wire x1="127" y1="264.16" x2="127" y2="266.7" width="0.1524" layer="91"/>
<pinref part="C95" gate="G$1" pin="P"/>
<wire x1="134.62" y1="264.16" x2="134.62" y2="266.7" width="0.1524" layer="91"/>
<junction x="127" y="266.7"/>
<pinref part="C93" gate="G$1" pin="1"/>
<wire x1="121.92" y1="264.16" x2="121.92" y2="266.7" width="0.1524" layer="91"/>
<pinref part="C92" gate="G$1" pin="1"/>
<wire x1="116.84" y1="264.16" x2="116.84" y2="266.7" width="0.1524" layer="91"/>
<junction x="116.84" y="266.7"/>
<junction x="121.92" y="266.7"/>
<pinref part="P+4" gate="G$1" pin="VCC/1"/>
<wire x1="134.62" y1="266.7" x2="139.7" y2="266.7" width="0.1524" layer="91" style="longdash"/>
<junction x="134.62" y="266.7"/>
</segment>
<segment>
<pinref part="U14" gate="G$1" pin="PVDD_A"/>
<wire x1="99.06" y1="175.26" x2="101.6" y2="175.26" width="0.1524" layer="91"/>
<wire x1="101.6" y1="175.26" x2="116.84" y2="175.26" width="0.1524" layer="91"/>
<wire x1="116.84" y1="175.26" x2="121.92" y2="175.26" width="0.1524" layer="91"/>
<wire x1="121.92" y1="175.26" x2="127" y2="175.26" width="0.1524" layer="91"/>
<wire x1="127" y1="175.26" x2="134.62" y2="175.26" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="PVDD_B"/>
<wire x1="99.06" y1="172.72" x2="101.6" y2="172.72" width="0.1524" layer="91"/>
<wire x1="101.6" y1="172.72" x2="101.6" y2="175.26" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="PVDD_C"/>
<wire x1="99.06" y1="170.18" x2="101.6" y2="170.18" width="0.1524" layer="91"/>
<wire x1="101.6" y1="170.18" x2="101.6" y2="172.72" width="0.1524" layer="91"/>
<junction x="101.6" y="172.72"/>
<junction x="101.6" y="175.26"/>
<pinref part="C79" gate="G$1" pin="1"/>
<wire x1="127" y1="172.72" x2="127" y2="175.26" width="0.1524" layer="91"/>
<pinref part="C80" gate="G$1" pin="P"/>
<wire x1="134.62" y1="172.72" x2="134.62" y2="175.26" width="0.1524" layer="91"/>
<junction x="127" y="175.26"/>
<pinref part="C78" gate="G$1" pin="1"/>
<wire x1="121.92" y1="172.72" x2="121.92" y2="175.26" width="0.1524" layer="91"/>
<pinref part="C77" gate="G$1" pin="1"/>
<wire x1="116.84" y1="172.72" x2="116.84" y2="175.26" width="0.1524" layer="91"/>
<junction x="116.84" y="175.26"/>
<junction x="121.92" y="175.26"/>
<pinref part="P+3" gate="G$1" pin="VCC/1"/>
<wire x1="134.62" y1="175.26" x2="139.7" y2="175.26" width="0.1524" layer="91" style="longdash"/>
<junction x="134.62" y="175.26"/>
</segment>
</net>
<net name="MOT1_B_5" class="0">
<segment>
<label x="30.48" y="30.48" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN10" gate="G$1" pin="1"/>
<wire x1="30.48" y1="30.48" x2="40.64" y2="30.48" width="0.1524" layer="91"/>
<pinref part="R79" gate="G$1" pin="2"/>
<wire x1="40.64" y1="30.48" x2="50.8" y2="30.48" width="0.1524" layer="91"/>
<wire x1="40.64" y1="22.86" x2="40.64" y2="30.48" width="0.1524" layer="91"/>
<junction x="40.64" y="30.48"/>
</segment>
</net>
<net name="MOT1_A_5" class="0">
<segment>
<label x="30.48" y="25.4" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN10" gate="G$1" pin="3"/>
<wire x1="30.48" y1="25.4" x2="38.1" y2="25.4" width="0.1524" layer="91"/>
<pinref part="R78" gate="G$1" pin="2"/>
<wire x1="38.1" y1="25.4" x2="50.8" y2="25.4" width="0.1524" layer="91"/>
<wire x1="38.1" y1="22.86" x2="38.1" y2="25.4" width="0.1524" layer="91"/>
<junction x="38.1" y="25.4"/>
</segment>
</net>
<net name="+12V" class="0">
<segment>
<pinref part="U17" gate="G$1" pin="GVDD_C"/>
<wire x1="53.34" y1="259.08" x2="50.8" y2="259.08" width="0.1524" layer="91"/>
<wire x1="50.8" y1="259.08" x2="50.8" y2="261.62" width="0.1524" layer="91"/>
<pinref part="U17" gate="G$1" pin="VDD"/>
<wire x1="50.8" y1="261.62" x2="50.8" y2="264.16" width="0.1524" layer="91"/>
<wire x1="50.8" y1="264.16" x2="50.8" y2="266.7" width="0.1524" layer="91"/>
<wire x1="50.8" y1="266.7" x2="53.34" y2="266.7" width="0.1524" layer="91"/>
<pinref part="U17" gate="G$1" pin="GVDD_A"/>
<wire x1="53.34" y1="264.16" x2="50.8" y2="264.16" width="0.1524" layer="91"/>
<pinref part="U17" gate="G$1" pin="GVDD_B"/>
<wire x1="53.34" y1="261.62" x2="50.8" y2="261.62" width="0.1524" layer="91"/>
<wire x1="50.8" y1="266.7" x2="43.18" y2="266.7" width="0.1524" layer="91"/>
<junction x="50.8" y="266.7"/>
<junction x="50.8" y="264.16"/>
<junction x="50.8" y="261.62"/>
<pinref part="C88" gate="G$1" pin="1"/>
<wire x1="43.18" y1="266.7" x2="38.1" y2="266.7" width="0.1524" layer="91"/>
<wire x1="38.1" y1="266.7" x2="33.02" y2="266.7" width="0.1524" layer="91"/>
<wire x1="33.02" y1="266.7" x2="27.94" y2="266.7" width="0.1524" layer="91"/>
<wire x1="27.94" y1="266.7" x2="20.32" y2="266.7" width="0.1524" layer="91"/>
<wire x1="20.32" y1="266.7" x2="15.24" y2="266.7" width="0.1524" layer="91"/>
<wire x1="43.18" y1="264.16" x2="43.18" y2="266.7" width="0.1524" layer="91"/>
<pinref part="C86" gate="G$1" pin="1"/>
<wire x1="38.1" y1="264.16" x2="38.1" y2="266.7" width="0.1524" layer="91"/>
<pinref part="C85" gate="G$1" pin="1"/>
<wire x1="33.02" y1="264.16" x2="33.02" y2="266.7" width="0.1524" layer="91"/>
<pinref part="C84" gate="G$1" pin="1"/>
<wire x1="27.94" y1="264.16" x2="27.94" y2="266.7" width="0.1524" layer="91"/>
<junction x="27.94" y="266.7"/>
<junction x="33.02" y="266.7"/>
<junction x="38.1" y="266.7"/>
<junction x="43.18" y="266.7"/>
<pinref part="C83" gate="G$1" pin="P"/>
<wire x1="20.32" y1="264.16" x2="20.32" y2="266.7" width="0.1524" layer="91"/>
<junction x="20.32" y="266.7"/>
<pinref part="+P29" gate="1" pin="+12V"/>
</segment>
<segment>
<pinref part="U14" gate="G$1" pin="GVDD_C"/>
<wire x1="53.34" y1="167.64" x2="50.8" y2="167.64" width="0.1524" layer="91"/>
<wire x1="50.8" y1="167.64" x2="50.8" y2="170.18" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="VDD"/>
<wire x1="50.8" y1="170.18" x2="50.8" y2="172.72" width="0.1524" layer="91"/>
<wire x1="50.8" y1="172.72" x2="50.8" y2="175.26" width="0.1524" layer="91"/>
<wire x1="50.8" y1="175.26" x2="53.34" y2="175.26" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="GVDD_A"/>
<wire x1="53.34" y1="172.72" x2="50.8" y2="172.72" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="GVDD_B"/>
<wire x1="53.34" y1="170.18" x2="50.8" y2="170.18" width="0.1524" layer="91"/>
<wire x1="50.8" y1="175.26" x2="43.18" y2="175.26" width="0.1524" layer="91"/>
<junction x="50.8" y="175.26"/>
<junction x="50.8" y="172.72"/>
<junction x="50.8" y="170.18"/>
<pinref part="C73" gate="G$1" pin="1"/>
<wire x1="43.18" y1="175.26" x2="38.1" y2="175.26" width="0.1524" layer="91"/>
<wire x1="38.1" y1="175.26" x2="33.02" y2="175.26" width="0.1524" layer="91"/>
<wire x1="33.02" y1="175.26" x2="27.94" y2="175.26" width="0.1524" layer="91"/>
<wire x1="27.94" y1="175.26" x2="20.32" y2="175.26" width="0.1524" layer="91"/>
<wire x1="20.32" y1="175.26" x2="15.24" y2="175.26" width="0.1524" layer="91"/>
<wire x1="43.18" y1="172.72" x2="43.18" y2="175.26" width="0.1524" layer="91"/>
<pinref part="C71" gate="G$1" pin="1"/>
<wire x1="38.1" y1="172.72" x2="38.1" y2="175.26" width="0.1524" layer="91"/>
<pinref part="C70" gate="G$1" pin="1"/>
<wire x1="33.02" y1="172.72" x2="33.02" y2="175.26" width="0.1524" layer="91"/>
<pinref part="C69" gate="G$1" pin="1"/>
<wire x1="27.94" y1="172.72" x2="27.94" y2="175.26" width="0.1524" layer="91"/>
<junction x="27.94" y="175.26"/>
<junction x="33.02" y="175.26"/>
<junction x="38.1" y="175.26"/>
<junction x="43.18" y="175.26"/>
<pinref part="C68" gate="G$1" pin="P"/>
<wire x1="20.32" y1="172.72" x2="20.32" y2="175.26" width="0.1524" layer="91"/>
<junction x="20.32" y="175.26"/>
<pinref part="+P27" gate="1" pin="+12V"/>
</segment>
<segment>
<pinref part="U20" gate="G$1" pin="GVDD_C"/>
<wire x1="251.46" y1="167.64" x2="248.92" y2="167.64" width="0.1524" layer="91"/>
<wire x1="248.92" y1="167.64" x2="248.92" y2="170.18" width="0.1524" layer="91"/>
<pinref part="U20" gate="G$1" pin="VDD"/>
<wire x1="248.92" y1="170.18" x2="248.92" y2="172.72" width="0.1524" layer="91"/>
<wire x1="248.92" y1="172.72" x2="248.92" y2="175.26" width="0.1524" layer="91"/>
<wire x1="248.92" y1="175.26" x2="251.46" y2="175.26" width="0.1524" layer="91"/>
<pinref part="U20" gate="G$1" pin="GVDD_A"/>
<wire x1="251.46" y1="172.72" x2="248.92" y2="172.72" width="0.1524" layer="91"/>
<pinref part="U20" gate="G$1" pin="GVDD_B"/>
<wire x1="251.46" y1="170.18" x2="248.92" y2="170.18" width="0.1524" layer="91"/>
<wire x1="248.92" y1="175.26" x2="241.3" y2="175.26" width="0.1524" layer="91"/>
<junction x="248.92" y="175.26"/>
<junction x="248.92" y="172.72"/>
<junction x="248.92" y="170.18"/>
<pinref part="C103" gate="G$1" pin="1"/>
<wire x1="241.3" y1="175.26" x2="236.22" y2="175.26" width="0.1524" layer="91"/>
<wire x1="236.22" y1="175.26" x2="231.14" y2="175.26" width="0.1524" layer="91"/>
<wire x1="231.14" y1="175.26" x2="226.06" y2="175.26" width="0.1524" layer="91"/>
<wire x1="226.06" y1="175.26" x2="218.44" y2="175.26" width="0.1524" layer="91"/>
<wire x1="218.44" y1="175.26" x2="213.36" y2="175.26" width="0.1524" layer="91"/>
<wire x1="241.3" y1="172.72" x2="241.3" y2="175.26" width="0.1524" layer="91"/>
<pinref part="C101" gate="G$1" pin="1"/>
<wire x1="236.22" y1="172.72" x2="236.22" y2="175.26" width="0.1524" layer="91"/>
<pinref part="C100" gate="G$1" pin="1"/>
<wire x1="231.14" y1="172.72" x2="231.14" y2="175.26" width="0.1524" layer="91"/>
<pinref part="C99" gate="G$1" pin="1"/>
<wire x1="226.06" y1="172.72" x2="226.06" y2="175.26" width="0.1524" layer="91"/>
<junction x="226.06" y="175.26"/>
<junction x="231.14" y="175.26"/>
<junction x="236.22" y="175.26"/>
<junction x="241.3" y="175.26"/>
<pinref part="C98" gate="G$1" pin="P"/>
<wire x1="218.44" y1="172.72" x2="218.44" y2="175.26" width="0.1524" layer="91"/>
<junction x="218.44" y="175.26"/>
<pinref part="+P51" gate="1" pin="+12V"/>
</segment>
<segment>
<pinref part="U23" gate="G$1" pin="GVDD_C"/>
<wire x1="251.46" y1="259.08" x2="248.92" y2="259.08" width="0.1524" layer="91"/>
<wire x1="248.92" y1="259.08" x2="248.92" y2="261.62" width="0.1524" layer="91"/>
<pinref part="U23" gate="G$1" pin="VDD"/>
<wire x1="248.92" y1="261.62" x2="248.92" y2="264.16" width="0.1524" layer="91"/>
<wire x1="248.92" y1="264.16" x2="248.92" y2="266.7" width="0.1524" layer="91"/>
<wire x1="248.92" y1="266.7" x2="251.46" y2="266.7" width="0.1524" layer="91"/>
<pinref part="U23" gate="G$1" pin="GVDD_A"/>
<wire x1="251.46" y1="264.16" x2="248.92" y2="264.16" width="0.1524" layer="91"/>
<pinref part="U23" gate="G$1" pin="GVDD_B"/>
<wire x1="251.46" y1="261.62" x2="248.92" y2="261.62" width="0.1524" layer="91"/>
<wire x1="248.92" y1="266.7" x2="241.3" y2="266.7" width="0.1524" layer="91"/>
<junction x="248.92" y="266.7"/>
<junction x="248.92" y="264.16"/>
<junction x="248.92" y="261.62"/>
<pinref part="C118" gate="G$1" pin="1"/>
<wire x1="241.3" y1="266.7" x2="236.22" y2="266.7" width="0.1524" layer="91"/>
<wire x1="236.22" y1="266.7" x2="231.14" y2="266.7" width="0.1524" layer="91"/>
<wire x1="231.14" y1="266.7" x2="226.06" y2="266.7" width="0.1524" layer="91"/>
<wire x1="226.06" y1="266.7" x2="218.44" y2="266.7" width="0.1524" layer="91"/>
<wire x1="218.44" y1="266.7" x2="213.36" y2="266.7" width="0.1524" layer="91"/>
<wire x1="241.3" y1="264.16" x2="241.3" y2="266.7" width="0.1524" layer="91"/>
<pinref part="C116" gate="G$1" pin="1"/>
<wire x1="236.22" y1="264.16" x2="236.22" y2="266.7" width="0.1524" layer="91"/>
<pinref part="C115" gate="G$1" pin="1"/>
<wire x1="231.14" y1="264.16" x2="231.14" y2="266.7" width="0.1524" layer="91"/>
<pinref part="C114" gate="G$1" pin="1"/>
<wire x1="226.06" y1="264.16" x2="226.06" y2="266.7" width="0.1524" layer="91"/>
<junction x="226.06" y="266.7"/>
<junction x="231.14" y="266.7"/>
<junction x="236.22" y="266.7"/>
<junction x="241.3" y="266.7"/>
<pinref part="C113" gate="G$1" pin="P"/>
<wire x1="218.44" y1="264.16" x2="218.44" y2="266.7" width="0.1524" layer="91"/>
<junction x="218.44" y="266.7"/>
<pinref part="+P57" gate="1" pin="+12V"/>
</segment>
</net>
<net name="MOT2_OUT_U" class="0">
<segment>
<wire x1="134.62" y1="78.74" x2="124.46" y2="78.74" width="0.1524" layer="91"/>
<label x="124.46" y="78.74" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN11" gate="G$1" pin="U"/>
</segment>
<segment>
<pinref part="R68" gate="G$1" pin="2"/>
<label x="142.24" y="246.38" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="132.08" y1="246.38" x2="134.62" y2="246.38" width="0.1524" layer="91"/>
<wire x1="134.62" y1="246.38" x2="142.24" y2="246.38" width="0.1524" layer="91"/>
<wire x1="134.62" y1="246.38" x2="134.62" y2="236.22" width="0.1524" layer="91"/>
<pinref part="U18" gate="G$1" pin="VIN+"/>
<wire x1="134.62" y1="236.22" x2="137.16" y2="236.22" width="0.1524" layer="91"/>
<junction x="134.62" y="246.38"/>
</segment>
</net>
<net name="MOT2_OUT_V" class="0">
<segment>
<wire x1="134.62" y1="68.58" x2="124.46" y2="68.58" width="0.1524" layer="91"/>
<label x="124.46" y="68.58" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN11" gate="G$1" pin="V"/>
</segment>
<segment>
<pinref part="R69" gate="G$1" pin="2"/>
<wire x1="132.08" y1="218.44" x2="134.62" y2="218.44" width="0.1524" layer="91"/>
<label x="142.24" y="218.44" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="134.62" y1="218.44" x2="142.24" y2="218.44" width="0.1524" layer="91"/>
<wire x1="134.62" y1="208.28" x2="134.62" y2="218.44" width="0.1524" layer="91"/>
<junction x="134.62" y="218.44"/>
<pinref part="U19" gate="G$1" pin="VIN+"/>
<wire x1="134.62" y1="208.28" x2="137.16" y2="208.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT2_OUT_W" class="0">
<segment>
<wire x1="134.62" y1="58.42" x2="124.46" y2="58.42" width="0.1524" layer="91"/>
<label x="124.46" y="58.42" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN11" gate="G$1" pin="W"/>
</segment>
<segment>
<label x="142.24" y="190.5" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="111.76" y1="210.82" x2="116.84" y2="210.82" width="0.1524" layer="91"/>
<wire x1="116.84" y1="210.82" x2="116.84" y2="190.5" width="0.1524" layer="91"/>
<wire x1="116.84" y1="190.5" x2="142.24" y2="190.5" width="0.1524" layer="91"/>
<pinref part="C91" gate="G$1" pin="2"/>
<wire x1="109.22" y1="215.9" x2="111.76" y2="215.9" width="0.1524" layer="91"/>
<wire x1="111.76" y1="215.9" x2="111.76" y2="210.82" width="0.1524" layer="91"/>
<pinref part="U17" gate="G$1" pin="OUT_C"/>
<wire x1="111.76" y1="210.82" x2="99.06" y2="210.82" width="0.1524" layer="91"/>
<junction x="111.76" y="210.82"/>
</segment>
</net>
<net name="MOT2_B_5" class="0">
<segment>
<label x="124.46" y="30.48" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="124.46" y1="30.48" x2="134.62" y2="30.48" width="0.1524" layer="91"/>
<pinref part="CN12" gate="G$1" pin="1"/>
<pinref part="R84" gate="G$1" pin="2"/>
<wire x1="134.62" y1="30.48" x2="144.78" y2="30.48" width="0.1524" layer="91"/>
<wire x1="134.62" y1="22.86" x2="134.62" y2="30.48" width="0.1524" layer="91"/>
<junction x="134.62" y="30.48"/>
</segment>
</net>
<net name="MOT2_A_5" class="0">
<segment>
<label x="124.46" y="25.4" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="124.46" y1="25.4" x2="132.08" y2="25.4" width="0.1524" layer="91"/>
<pinref part="CN12" gate="G$1" pin="3"/>
<pinref part="R83" gate="G$1" pin="2"/>
<wire x1="132.08" y1="25.4" x2="144.78" y2="25.4" width="0.1524" layer="91"/>
<wire x1="132.08" y1="22.86" x2="132.08" y2="25.4" width="0.1524" layer="91"/>
<junction x="132.08" y="25.4"/>
</segment>
</net>
<net name="!MOT2_HU_5" class="0">
<segment>
<wire x1="167.64" y1="63.5" x2="160.02" y2="63.5" width="0.1524" layer="91"/>
<label x="167.64" y="63.5" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN11" gate="G$1" pin="HU"/>
<pinref part="R85" gate="G$1" pin="2"/>
<wire x1="160.02" y1="63.5" x2="154.94" y2="63.5" width="0.1524" layer="91"/>
<wire x1="160.02" y1="55.88" x2="160.02" y2="63.5" width="0.1524" layer="91"/>
<junction x="160.02" y="63.5"/>
</segment>
</net>
<net name="!MOT2_HV_5" class="0">
<segment>
<wire x1="154.94" y1="60.96" x2="162.56" y2="60.96" width="0.1524" layer="91"/>
<label x="167.64" y="60.96" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN11" gate="G$1" pin="HV"/>
<pinref part="R86" gate="G$1" pin="2"/>
<wire x1="162.56" y1="60.96" x2="167.64" y2="60.96" width="0.1524" layer="91"/>
<wire x1="162.56" y1="55.88" x2="162.56" y2="60.96" width="0.1524" layer="91"/>
<junction x="162.56" y="60.96"/>
</segment>
</net>
<net name="!MOT2_HW_5" class="0">
<segment>
<wire x1="154.94" y1="58.42" x2="165.1" y2="58.42" width="0.1524" layer="91"/>
<label x="167.64" y="58.42" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN11" gate="G$1" pin="HW"/>
<pinref part="R87" gate="G$1" pin="2"/>
<wire x1="165.1" y1="58.42" x2="167.64" y2="58.42" width="0.1524" layer="91"/>
<wire x1="165.1" y1="55.88" x2="165.1" y2="58.42" width="0.1524" layer="91"/>
<junction x="165.1" y="58.42"/>
</segment>
</net>
<net name="N$63" class="0">
<segment>
<pinref part="R68" gate="G$1" pin="1"/>
<wire x1="124.46" y1="246.38" x2="121.92" y2="246.38" width="0.1524" layer="91"/>
<pinref part="C89" gate="G$1" pin="2"/>
<wire x1="109.22" y1="251.46" x2="111.76" y2="251.46" width="0.1524" layer="91"/>
<wire x1="111.76" y1="251.46" x2="111.76" y2="246.38" width="0.1524" layer="91"/>
<pinref part="U17" gate="G$1" pin="OUT_A"/>
<wire x1="111.76" y1="246.38" x2="99.06" y2="246.38" width="0.1524" layer="91"/>
<wire x1="111.76" y1="246.38" x2="121.92" y2="246.38" width="0.1524" layer="91"/>
<junction x="111.76" y="246.38"/>
<pinref part="U18" gate="G$1" pin="VIN-"/>
<wire x1="137.16" y1="238.76" x2="121.92" y2="238.76" width="0.1524" layer="91"/>
<wire x1="121.92" y1="238.76" x2="121.92" y2="246.38" width="0.1524" layer="91"/>
<junction x="121.92" y="246.38"/>
</segment>
</net>
<net name="N$64" class="0">
<segment>
<pinref part="U17" gate="G$1" pin="OC_ADJ"/>
<pinref part="R66" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$65" class="0">
<segment>
<pinref part="U17" gate="G$1" pin="BST_A"/>
<pinref part="C89" gate="G$1" pin="1"/>
<wire x1="99.06" y1="251.46" x2="101.6" y2="251.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$66" class="0">
<segment>
<pinref part="U17" gate="G$1" pin="BST_B"/>
<pinref part="C90" gate="G$1" pin="1"/>
<wire x1="99.06" y1="233.68" x2="101.6" y2="233.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$67" class="0">
<segment>
<pinref part="C90" gate="G$1" pin="2"/>
<wire x1="109.22" y1="233.68" x2="111.76" y2="233.68" width="0.1524" layer="91"/>
<wire x1="111.76" y1="233.68" x2="111.76" y2="228.6" width="0.1524" layer="91"/>
<pinref part="U17" gate="G$1" pin="OUT_B"/>
<wire x1="111.76" y1="228.6" x2="99.06" y2="228.6" width="0.1524" layer="91"/>
<wire x1="111.76" y1="228.6" x2="116.84" y2="228.6" width="0.1524" layer="91"/>
<junction x="111.76" y="228.6"/>
<wire x1="116.84" y1="228.6" x2="116.84" y2="218.44" width="0.1524" layer="91"/>
<pinref part="R69" gate="G$1" pin="1"/>
<wire x1="116.84" y1="218.44" x2="121.92" y2="218.44" width="0.1524" layer="91"/>
<wire x1="121.92" y1="218.44" x2="124.46" y2="218.44" width="0.1524" layer="91"/>
<wire x1="121.92" y1="218.44" x2="121.92" y2="210.82" width="0.1524" layer="91"/>
<wire x1="121.92" y1="210.82" x2="137.16" y2="210.82" width="0.1524" layer="91"/>
<pinref part="U19" gate="G$1" pin="VIN-"/>
<junction x="121.92" y="218.44"/>
</segment>
</net>
<net name="N$68" class="0">
<segment>
<pinref part="U17" gate="G$1" pin="BST_C"/>
<pinref part="C91" gate="G$1" pin="1"/>
<wire x1="99.06" y1="215.9" x2="101.6" y2="215.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$69" class="0">
<segment>
<pinref part="U17" gate="G$1" pin="VREG"/>
<wire x1="53.34" y1="251.46" x2="50.8" y2="251.46" width="0.1524" layer="91"/>
<pinref part="C87" gate="G$1" pin="1"/>
<wire x1="50.8" y1="251.46" x2="38.1" y2="251.46" width="0.1524" layer="91"/>
<wire x1="38.1" y1="251.46" x2="38.1" y2="248.92" width="0.1524" layer="91"/>
<pinref part="U17" gate="G$1" pin="M3"/>
<wire x1="53.34" y1="238.76" x2="50.8" y2="238.76" width="0.1524" layer="91"/>
<wire x1="50.8" y1="238.76" x2="50.8" y2="243.84" width="0.1524" layer="91"/>
<junction x="50.8" y="251.46"/>
<pinref part="U17" gate="G$1" pin="M1"/>
<wire x1="50.8" y1="243.84" x2="50.8" y2="251.46" width="0.1524" layer="91"/>
<wire x1="50.8" y1="243.84" x2="53.34" y2="243.84" width="0.1524" layer="91"/>
<junction x="50.8" y="243.84"/>
</segment>
</net>
<net name="MOT2_GND" class="0">
<segment>
<pinref part="C87" gate="G$1" pin="2"/>
<wire x1="38.1" y1="241.3" x2="38.1" y2="238.76" width="0.1524" layer="91"/>
<wire x1="38.1" y1="238.76" x2="35.56" y2="238.76" width="0.1524" layer="91"/>
<label x="35.56" y="238.76" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="48.26" y1="241.3" x2="48.26" y2="238.76" width="0.1524" layer="91"/>
<wire x1="48.26" y1="238.76" x2="38.1" y2="238.76" width="0.1524" layer="91"/>
<pinref part="U17" gate="G$1" pin="M2"/>
<wire x1="53.34" y1="241.3" x2="48.26" y2="241.3" width="0.1524" layer="91"/>
<junction x="38.1" y="238.76"/>
</segment>
<segment>
<pinref part="U17" gate="G$1" pin="AGND"/>
<pinref part="R67" gate="G$1" pin="2"/>
<wire x1="71.12" y1="200.66" x2="66.04" y2="200.66" width="0.1524" layer="91"/>
<wire x1="71.12" y1="200.66" x2="71.12" y2="203.2" width="0.1524" layer="91"/>
<junction x="71.12" y="200.66"/>
<label x="66.04" y="200.66" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="R66" gate="G$1" pin="1"/>
<wire x1="45.72" y1="208.28" x2="40.64" y2="208.28" width="0.1524" layer="91"/>
<label x="40.64" y="208.28" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="!MOT2_OTW" class="0">
<segment>
<label x="35.56" y="233.68" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="35.56" y1="233.68" x2="40.64" y2="233.68" width="0.1524" layer="91"/>
<pinref part="RA4" gate="A" pin="1"/>
</segment>
</net>
<net name="!MOT2_FAULT" class="0">
<segment>
<wire x1="35.56" y1="231.14" x2="40.64" y2="231.14" width="0.1524" layer="91"/>
<label x="35.56" y="231.14" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA4" gate="B" pin="1"/>
</segment>
</net>
<net name="MOT2_PWM_A" class="0">
<segment>
<wire x1="40.64" y1="226.06" x2="35.56" y2="226.06" width="0.1524" layer="91"/>
<label x="35.56" y="226.06" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA4" gate="C" pin="1"/>
</segment>
</net>
<net name="MOT2_PWM_B" class="0">
<segment>
<wire x1="35.56" y1="223.52" x2="40.64" y2="223.52" width="0.1524" layer="91"/>
<label x="35.56" y="223.52" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA5" gate="A" pin="1"/>
</segment>
</net>
<net name="MOT2_PWM_C" class="0">
<segment>
<wire x1="40.64" y1="220.98" x2="35.56" y2="220.98" width="0.1524" layer="91"/>
<label x="35.56" y="220.98" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA5" gate="D" pin="1"/>
</segment>
</net>
<net name="!MOT2_RESET_B" class="0">
<segment>
<wire x1="40.64" y1="215.9" x2="35.56" y2="215.9" width="0.1524" layer="91"/>
<label x="35.56" y="215.9" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA5" gate="B" pin="1"/>
</segment>
</net>
<net name="!MOT2_RESET_C" class="0">
<segment>
<wire x1="35.56" y1="213.36" x2="40.64" y2="213.36" width="0.1524" layer="91"/>
<label x="35.56" y="213.36" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA5" gate="C" pin="1"/>
</segment>
</net>
<net name="MOT2_CUR_U" class="0">
<segment>
<pinref part="U18" gate="G$1" pin="OUT"/>
<wire x1="137.16" y1="228.6" x2="134.62" y2="228.6" width="0.1524" layer="91"/>
<label x="134.62" y="228.6" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT2_CUR_V" class="0">
<segment>
<pinref part="U19" gate="G$1" pin="OUT"/>
<wire x1="137.16" y1="200.66" x2="134.62" y2="200.66" width="0.1524" layer="91"/>
<label x="134.62" y="200.66" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="N$81" class="0">
<segment>
<pinref part="RA4" gate="A" pin="2"/>
<pinref part="U17" gate="G$1" pin="!OTW"/>
<wire x1="48.26" y1="233.68" x2="53.34" y2="233.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$82" class="0">
<segment>
<pinref part="U17" gate="G$1" pin="!FAULT"/>
<pinref part="RA4" gate="B" pin="2"/>
<wire x1="53.34" y1="231.14" x2="48.26" y2="231.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$83" class="0">
<segment>
<pinref part="RA4" gate="C" pin="2"/>
<pinref part="U17" gate="G$1" pin="PWM_A"/>
<wire x1="48.26" y1="226.06" x2="53.34" y2="226.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$84" class="0">
<segment>
<pinref part="U17" gate="G$1" pin="PWM_B"/>
<pinref part="RA5" gate="A" pin="2"/>
<wire x1="53.34" y1="223.52" x2="48.26" y2="223.52" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$85" class="0">
<segment>
<pinref part="RA5" gate="D" pin="2"/>
<pinref part="U17" gate="G$1" pin="PWM_C"/>
<wire x1="48.26" y1="220.98" x2="53.34" y2="220.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$86" class="0">
<segment>
<pinref part="U17" gate="G$1" pin="!RESET_A"/>
<pinref part="RA4" gate="D" pin="2"/>
<wire x1="53.34" y1="218.44" x2="48.26" y2="218.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$87" class="0">
<segment>
<pinref part="RA5" gate="B" pin="2"/>
<pinref part="U17" gate="G$1" pin="!RESET_B"/>
<wire x1="48.26" y1="215.9" x2="53.34" y2="215.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$88" class="0">
<segment>
<pinref part="U17" gate="G$1" pin="!RESET_C"/>
<pinref part="RA5" gate="C" pin="2"/>
<wire x1="53.34" y1="213.36" x2="48.26" y2="213.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT1_PWM_A" class="0">
<segment>
<pinref part="RA2" gate="C" pin="1"/>
<wire x1="40.64" y1="134.62" x2="35.56" y2="134.62" width="0.1524" layer="91"/>
<label x="35.56" y="134.62" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT1_PWM_B" class="0">
<segment>
<pinref part="RA3" gate="A" pin="1"/>
<wire x1="35.56" y1="132.08" x2="40.64" y2="132.08" width="0.1524" layer="91"/>
<label x="35.56" y="132.08" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="!MOT1_RESET_B" class="0">
<segment>
<pinref part="RA3" gate="B" pin="1"/>
<wire x1="40.64" y1="124.46" x2="35.56" y2="124.46" width="0.1524" layer="91"/>
<label x="35.56" y="124.46" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="!MOT1_RESET_C" class="0">
<segment>
<pinref part="RA3" gate="C" pin="1"/>
<wire x1="35.56" y1="121.92" x2="40.64" y2="121.92" width="0.1524" layer="91"/>
<label x="35.56" y="121.92" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT1_PWM_C" class="0">
<segment>
<pinref part="RA3" gate="D" pin="1"/>
<wire x1="40.64" y1="129.54" x2="35.56" y2="129.54" width="0.1524" layer="91"/>
<label x="35.56" y="129.54" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="!MOT1_OTW" class="0">
<segment>
<pinref part="RA2" gate="A" pin="1"/>
<wire x1="35.56" y1="142.24" x2="40.64" y2="142.24" width="0.1524" layer="91"/>
<label x="35.56" y="142.24" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="!MOT1_FAULT" class="0">
<segment>
<pinref part="RA2" gate="B" pin="1"/>
<wire x1="35.56" y1="139.7" x2="40.64" y2="139.7" width="0.1524" layer="91"/>
<label x="35.56" y="139.7" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT1_CUR_V" class="0">
<segment>
<pinref part="U15" gate="G$1" pin="OUT"/>
<wire x1="137.16" y1="129.54" x2="134.62" y2="129.54" width="0.1524" layer="91"/>
<label x="134.62" y="129.54" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="U14" gate="G$1" pin="OC_ADJ"/>
<pinref part="R62" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="U14" gate="G$1" pin="BST_A"/>
<pinref part="C74" gate="G$1" pin="1"/>
<wire x1="99.06" y1="160.02" x2="101.6" y2="160.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$59" class="0">
<segment>
<pinref part="U14" gate="G$1" pin="BST_B"/>
<pinref part="C75" gate="G$1" pin="1"/>
<wire x1="99.06" y1="142.24" x2="101.6" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$61" class="0">
<segment>
<pinref part="U14" gate="G$1" pin="BST_C"/>
<pinref part="C76" gate="G$1" pin="1"/>
<wire x1="99.06" y1="124.46" x2="101.6" y2="124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT1_GND" class="0">
<segment>
<pinref part="U14" gate="G$1" pin="AGND"/>
<pinref part="R63" gate="G$1" pin="2"/>
<wire x1="71.12" y1="109.22" x2="66.04" y2="109.22" width="0.1524" layer="91"/>
<wire x1="71.12" y1="109.22" x2="71.12" y2="111.76" width="0.1524" layer="91"/>
<junction x="71.12" y="109.22"/>
<label x="66.04" y="109.22" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="C72" gate="G$1" pin="2"/>
<wire x1="38.1" y1="149.86" x2="38.1" y2="147.32" width="0.1524" layer="91"/>
<wire x1="38.1" y1="147.32" x2="35.56" y2="147.32" width="0.1524" layer="91"/>
<label x="35.56" y="147.32" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="48.26" y1="149.86" x2="48.26" y2="147.32" width="0.1524" layer="91"/>
<wire x1="48.26" y1="147.32" x2="38.1" y2="147.32" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="M2"/>
<wire x1="53.34" y1="149.86" x2="48.26" y2="149.86" width="0.1524" layer="91"/>
<junction x="38.1" y="147.32"/>
</segment>
<segment>
<pinref part="R62" gate="G$1" pin="1"/>
<wire x1="45.72" y1="116.84" x2="40.64" y2="116.84" width="0.1524" layer="91"/>
<label x="40.64" y="116.84" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="N$62" class="0">
<segment>
<pinref part="U14" gate="G$1" pin="VREG"/>
<wire x1="53.34" y1="160.02" x2="50.8" y2="160.02" width="0.1524" layer="91"/>
<pinref part="C72" gate="G$1" pin="1"/>
<wire x1="50.8" y1="160.02" x2="38.1" y2="160.02" width="0.1524" layer="91"/>
<wire x1="38.1" y1="160.02" x2="38.1" y2="157.48" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="M3"/>
<wire x1="53.34" y1="147.32" x2="50.8" y2="147.32" width="0.1524" layer="91"/>
<wire x1="50.8" y1="147.32" x2="50.8" y2="152.4" width="0.1524" layer="91"/>
<junction x="50.8" y="160.02"/>
<pinref part="U14" gate="G$1" pin="M1"/>
<wire x1="50.8" y1="152.4" x2="50.8" y2="160.02" width="0.1524" layer="91"/>
<wire x1="53.34" y1="152.4" x2="50.8" y2="152.4" width="0.1524" layer="91"/>
<junction x="50.8" y="152.4"/>
</segment>
</net>
<net name="N$73" class="0">
<segment>
<pinref part="RA3" gate="C" pin="2"/>
<pinref part="U14" gate="G$1" pin="!RESET_C"/>
<wire x1="48.26" y1="121.92" x2="53.34" y2="121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$74" class="0">
<segment>
<pinref part="U14" gate="G$1" pin="!RESET_B"/>
<pinref part="RA3" gate="B" pin="2"/>
<wire x1="53.34" y1="124.46" x2="48.26" y2="124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$75" class="0">
<segment>
<pinref part="RA2" gate="D" pin="2"/>
<pinref part="U14" gate="G$1" pin="!RESET_A"/>
<wire x1="48.26" y1="127" x2="53.34" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$76" class="0">
<segment>
<pinref part="U14" gate="G$1" pin="PWM_C"/>
<pinref part="RA3" gate="D" pin="2"/>
<wire x1="53.34" y1="129.54" x2="48.26" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$77" class="0">
<segment>
<pinref part="RA3" gate="A" pin="2"/>
<pinref part="U14" gate="G$1" pin="PWM_B"/>
<wire x1="48.26" y1="132.08" x2="53.34" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$78" class="0">
<segment>
<pinref part="U14" gate="G$1" pin="PWM_A"/>
<pinref part="RA2" gate="C" pin="2"/>
<wire x1="53.34" y1="134.62" x2="48.26" y2="134.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$79" class="0">
<segment>
<pinref part="RA2" gate="B" pin="2"/>
<pinref part="U14" gate="G$1" pin="!FAULT"/>
<wire x1="48.26" y1="139.7" x2="53.34" y2="139.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$80" class="0">
<segment>
<pinref part="U14" gate="G$1" pin="!OTW"/>
<pinref part="RA2" gate="A" pin="2"/>
<wire x1="53.34" y1="142.24" x2="48.26" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT3_4_CUR_REF" class="0">
<segment>
<pinref part="U21" gate="G$1" pin="REF"/>
<wire x1="355.6" y1="139.7" x2="365.76" y2="139.7" width="0.1524" layer="91"/>
<label x="365.76" y="139.7" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<pinref part="U22" gate="G$1" pin="REF"/>
<wire x1="355.6" y1="111.76" x2="365.76" y2="111.76" width="0.1524" layer="91"/>
<label x="365.76" y="111.76" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<pinref part="U25" gate="G$1" pin="REF"/>
<wire x1="355.6" y1="210.82" x2="365.76" y2="210.82" width="0.1524" layer="91"/>
<label x="365.76" y="210.82" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<pinref part="U24" gate="G$1" pin="REF"/>
<wire x1="355.6" y1="238.76" x2="365.76" y2="238.76" width="0.1524" layer="91"/>
<label x="365.76" y="238.76" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="N$58" class="0">
<segment>
<pinref part="U20" gate="G$1" pin="OC_ADJ"/>
<pinref part="R70" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$91" class="0">
<segment>
<pinref part="U20" gate="G$1" pin="BST_A"/>
<pinref part="C104" gate="G$1" pin="1"/>
<wire x1="297.18" y1="160.02" x2="299.72" y2="160.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$92" class="0">
<segment>
<pinref part="U20" gate="G$1" pin="BST_B"/>
<pinref part="C105" gate="G$1" pin="1"/>
<wire x1="297.18" y1="142.24" x2="299.72" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$93" class="0">
<segment>
<pinref part="C105" gate="G$1" pin="2"/>
<wire x1="307.34" y1="142.24" x2="309.88" y2="142.24" width="0.1524" layer="91"/>
<wire x1="309.88" y1="142.24" x2="309.88" y2="137.16" width="0.1524" layer="91"/>
<pinref part="U20" gate="G$1" pin="OUT_B"/>
<wire x1="309.88" y1="137.16" x2="297.18" y2="137.16" width="0.1524" layer="91"/>
<wire x1="309.88" y1="137.16" x2="314.96" y2="137.16" width="0.1524" layer="91"/>
<junction x="309.88" y="137.16"/>
<wire x1="314.96" y1="137.16" x2="314.96" y2="147.32" width="0.1524" layer="91"/>
<pinref part="R72" gate="G$1" pin="1"/>
<wire x1="314.96" y1="147.32" x2="320.04" y2="147.32" width="0.1524" layer="91"/>
<pinref part="U21" gate="G$1" pin="VIN+"/>
<wire x1="320.04" y1="147.32" x2="322.58" y2="147.32" width="0.1524" layer="91"/>
<wire x1="335.28" y1="137.16" x2="320.04" y2="137.16" width="0.1524" layer="91"/>
<wire x1="320.04" y1="137.16" x2="320.04" y2="147.32" width="0.1524" layer="91"/>
<junction x="320.04" y="147.32"/>
</segment>
</net>
<net name="N$94" class="0">
<segment>
<pinref part="U20" gate="G$1" pin="BST_C"/>
<pinref part="C106" gate="G$1" pin="1"/>
<wire x1="297.18" y1="124.46" x2="299.72" y2="124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$95" class="0">
<segment>
<pinref part="U20" gate="G$1" pin="VREG"/>
<wire x1="251.46" y1="160.02" x2="248.92" y2="160.02" width="0.1524" layer="91"/>
<pinref part="C102" gate="G$1" pin="1"/>
<wire x1="248.92" y1="160.02" x2="236.22" y2="160.02" width="0.1524" layer="91"/>
<wire x1="236.22" y1="160.02" x2="236.22" y2="157.48" width="0.1524" layer="91"/>
<pinref part="U20" gate="G$1" pin="M3"/>
<wire x1="251.46" y1="147.32" x2="248.92" y2="147.32" width="0.1524" layer="91"/>
<wire x1="248.92" y1="147.32" x2="248.92" y2="152.4" width="0.1524" layer="91"/>
<junction x="248.92" y="160.02"/>
<pinref part="U20" gate="G$1" pin="M1"/>
<wire x1="248.92" y1="152.4" x2="248.92" y2="160.02" width="0.1524" layer="91"/>
<wire x1="251.46" y1="152.4" x2="248.92" y2="152.4" width="0.1524" layer="91"/>
<junction x="248.92" y="152.4"/>
</segment>
</net>
<net name="N$96" class="0">
<segment>
<pinref part="RA6" gate="A" pin="2"/>
<pinref part="U20" gate="G$1" pin="!OTW"/>
<wire x1="246.38" y1="142.24" x2="251.46" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$97" class="0">
<segment>
<pinref part="U20" gate="G$1" pin="!FAULT"/>
<pinref part="RA6" gate="B" pin="2"/>
<wire x1="251.46" y1="139.7" x2="246.38" y2="139.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$98" class="0">
<segment>
<pinref part="RA6" gate="C" pin="2"/>
<pinref part="U20" gate="G$1" pin="PWM_A"/>
<wire x1="246.38" y1="134.62" x2="251.46" y2="134.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$99" class="0">
<segment>
<pinref part="U20" gate="G$1" pin="PWM_B"/>
<pinref part="RA7" gate="A" pin="2"/>
<wire x1="251.46" y1="132.08" x2="246.38" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$100" class="0">
<segment>
<pinref part="RA7" gate="D" pin="2"/>
<pinref part="U20" gate="G$1" pin="PWM_C"/>
<wire x1="246.38" y1="129.54" x2="251.46" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$101" class="0">
<segment>
<pinref part="U20" gate="G$1" pin="!RESET_A"/>
<pinref part="RA6" gate="D" pin="2"/>
<wire x1="251.46" y1="127" x2="246.38" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$102" class="0">
<segment>
<pinref part="RA7" gate="B" pin="2"/>
<pinref part="U20" gate="G$1" pin="!RESET_B"/>
<wire x1="246.38" y1="124.46" x2="251.46" y2="124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$103" class="0">
<segment>
<pinref part="U20" gate="G$1" pin="!RESET_C"/>
<pinref part="RA7" gate="C" pin="2"/>
<wire x1="251.46" y1="121.92" x2="246.38" y2="121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT3_GND" class="0">
<segment>
<pinref part="C102" gate="G$1" pin="2"/>
<wire x1="236.22" y1="149.86" x2="236.22" y2="147.32" width="0.1524" layer="91"/>
<wire x1="236.22" y1="147.32" x2="233.68" y2="147.32" width="0.1524" layer="91"/>
<label x="233.68" y="147.32" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="246.38" y1="149.86" x2="246.38" y2="147.32" width="0.1524" layer="91"/>
<wire x1="246.38" y1="147.32" x2="236.22" y2="147.32" width="0.1524" layer="91"/>
<pinref part="U20" gate="G$1" pin="M2"/>
<wire x1="251.46" y1="149.86" x2="246.38" y2="149.86" width="0.1524" layer="91"/>
<junction x="236.22" y="147.32"/>
</segment>
<segment>
<pinref part="U20" gate="G$1" pin="AGND"/>
<pinref part="R71" gate="G$1" pin="2"/>
<wire x1="269.24" y1="109.22" x2="264.16" y2="109.22" width="0.1524" layer="91"/>
<wire x1="269.24" y1="109.22" x2="269.24" y2="111.76" width="0.1524" layer="91"/>
<junction x="269.24" y="109.22"/>
<label x="264.16" y="109.22" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="R70" gate="G$1" pin="1"/>
<wire x1="238.76" y1="116.84" x2="243.84" y2="116.84" width="0.1524" layer="91"/>
<label x="238.76" y="116.84" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="!MOT3_OTW" class="0">
<segment>
<label x="233.68" y="142.24" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="233.68" y1="142.24" x2="238.76" y2="142.24" width="0.1524" layer="91"/>
<pinref part="RA6" gate="A" pin="1"/>
</segment>
</net>
<net name="!MOT3_FAULT" class="0">
<segment>
<wire x1="233.68" y1="139.7" x2="238.76" y2="139.7" width="0.1524" layer="91"/>
<label x="233.68" y="139.7" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA6" gate="B" pin="1"/>
</segment>
</net>
<net name="MOT3_PWM_A" class="0">
<segment>
<wire x1="238.76" y1="134.62" x2="233.68" y2="134.62" width="0.1524" layer="91"/>
<label x="233.68" y="134.62" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA6" gate="C" pin="1"/>
</segment>
</net>
<net name="MOT3_PWM_B" class="0">
<segment>
<wire x1="233.68" y1="132.08" x2="238.76" y2="132.08" width="0.1524" layer="91"/>
<label x="233.68" y="132.08" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA7" gate="A" pin="1"/>
</segment>
</net>
<net name="MOT3_PWM_C" class="0">
<segment>
<wire x1="238.76" y1="129.54" x2="233.68" y2="129.54" width="0.1524" layer="91"/>
<label x="233.68" y="129.54" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA7" gate="D" pin="1"/>
</segment>
</net>
<net name="!MOT3_RESET_A" class="0">
<segment>
<wire x1="233.68" y1="127" x2="238.76" y2="127" width="0.1524" layer="91"/>
<label x="233.68" y="127" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA6" gate="D" pin="1"/>
</segment>
</net>
<net name="!MOT2_RESET_A" class="0">
<segment>
<wire x1="35.56" y1="218.44" x2="40.64" y2="218.44" width="0.1524" layer="91"/>
<label x="35.56" y="218.44" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA4" gate="D" pin="1"/>
</segment>
</net>
<net name="!MOT3_RESET_B" class="0">
<segment>
<wire x1="238.76" y1="124.46" x2="233.68" y2="124.46" width="0.1524" layer="91"/>
<label x="233.68" y="124.46" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA7" gate="B" pin="1"/>
</segment>
</net>
<net name="!MOT3_RESET_C" class="0">
<segment>
<wire x1="233.68" y1="121.92" x2="238.76" y2="121.92" width="0.1524" layer="91"/>
<label x="233.68" y="121.92" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA7" gate="C" pin="1"/>
</segment>
</net>
<net name="MOT3_OUT_U" class="0">
<segment>
<wire x1="228.6" y1="78.74" x2="218.44" y2="78.74" width="0.1524" layer="91"/>
<label x="218.44" y="78.74" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN13" gate="G$1" pin="U"/>
</segment>
<segment>
<pinref part="C104" gate="G$1" pin="2"/>
<wire x1="307.34" y1="160.02" x2="309.88" y2="160.02" width="0.1524" layer="91"/>
<wire x1="309.88" y1="160.02" x2="309.88" y2="154.94" width="0.1524" layer="91"/>
<pinref part="U20" gate="G$1" pin="OUT_A"/>
<wire x1="309.88" y1="154.94" x2="297.18" y2="154.94" width="0.1524" layer="91"/>
<wire x1="309.88" y1="154.94" x2="340.36" y2="154.94" width="0.1524" layer="91"/>
<junction x="309.88" y="154.94"/>
<label x="340.36" y="154.94" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="MOT3_CUR_W" class="0">
<segment>
<pinref part="U22" gate="G$1" pin="OUT"/>
<wire x1="335.28" y1="101.6" x2="332.74" y2="101.6" width="0.1524" layer="91"/>
<label x="332.74" y="101.6" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT3_OUT_V" class="0">
<segment>
<pinref part="R72" gate="G$1" pin="2"/>
<label x="340.36" y="147.32" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="330.2" y1="147.32" x2="332.74" y2="147.32" width="0.1524" layer="91"/>
<pinref part="U21" gate="G$1" pin="VIN-"/>
<wire x1="332.74" y1="147.32" x2="340.36" y2="147.32" width="0.1524" layer="91"/>
<wire x1="335.28" y1="139.7" x2="332.74" y2="139.7" width="0.1524" layer="91"/>
<wire x1="332.74" y1="139.7" x2="332.74" y2="147.32" width="0.1524" layer="91"/>
<junction x="332.74" y="147.32"/>
</segment>
<segment>
<wire x1="228.6" y1="68.58" x2="218.44" y2="68.58" width="0.1524" layer="91"/>
<label x="218.44" y="68.58" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN13" gate="G$1" pin="V"/>
</segment>
</net>
<net name="MOT3_CUR_V" class="0">
<segment>
<pinref part="U21" gate="G$1" pin="OUT"/>
<wire x1="335.28" y1="129.54" x2="332.74" y2="129.54" width="0.1524" layer="91"/>
<label x="332.74" y="129.54" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT3_OUT_W" class="0">
<segment>
<wire x1="228.6" y1="58.42" x2="218.44" y2="58.42" width="0.1524" layer="91"/>
<label x="218.44" y="58.42" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN13" gate="G$1" pin="W"/>
</segment>
<segment>
<pinref part="R73" gate="G$1" pin="2"/>
<wire x1="330.2" y1="119.38" x2="332.74" y2="119.38" width="0.1524" layer="91"/>
<label x="340.36" y="119.38" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U22" gate="G$1" pin="VIN-"/>
<wire x1="332.74" y1="119.38" x2="340.36" y2="119.38" width="0.1524" layer="91"/>
<wire x1="335.28" y1="111.76" x2="332.74" y2="111.76" width="0.1524" layer="91"/>
<wire x1="332.74" y1="111.76" x2="332.74" y2="119.38" width="0.1524" layer="91"/>
<junction x="332.74" y="119.38"/>
</segment>
</net>
<net name="N$104" class="0">
<segment>
<pinref part="R76" gate="G$1" pin="1"/>
<wire x1="322.58" y1="246.38" x2="320.04" y2="246.38" width="0.1524" layer="91"/>
<pinref part="C119" gate="G$1" pin="2"/>
<wire x1="307.34" y1="251.46" x2="309.88" y2="251.46" width="0.1524" layer="91"/>
<wire x1="309.88" y1="251.46" x2="309.88" y2="246.38" width="0.1524" layer="91"/>
<pinref part="U23" gate="G$1" pin="OUT_A"/>
<wire x1="309.88" y1="246.38" x2="297.18" y2="246.38" width="0.1524" layer="91"/>
<wire x1="309.88" y1="246.38" x2="320.04" y2="246.38" width="0.1524" layer="91"/>
<junction x="309.88" y="246.38"/>
<pinref part="U24" gate="G$1" pin="VIN-"/>
<wire x1="335.28" y1="238.76" x2="320.04" y2="238.76" width="0.1524" layer="91"/>
<wire x1="320.04" y1="238.76" x2="320.04" y2="246.38" width="0.1524" layer="91"/>
<junction x="320.04" y="246.38"/>
</segment>
</net>
<net name="N$105" class="0">
<segment>
<pinref part="U23" gate="G$1" pin="OC_ADJ"/>
<pinref part="R74" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$106" class="0">
<segment>
<pinref part="U23" gate="G$1" pin="BST_A"/>
<pinref part="C119" gate="G$1" pin="1"/>
<wire x1="297.18" y1="251.46" x2="299.72" y2="251.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$107" class="0">
<segment>
<pinref part="U23" gate="G$1" pin="BST_B"/>
<pinref part="C120" gate="G$1" pin="1"/>
<wire x1="297.18" y1="233.68" x2="299.72" y2="233.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$108" class="0">
<segment>
<pinref part="C120" gate="G$1" pin="2"/>
<wire x1="307.34" y1="233.68" x2="309.88" y2="233.68" width="0.1524" layer="91"/>
<wire x1="309.88" y1="233.68" x2="309.88" y2="228.6" width="0.1524" layer="91"/>
<pinref part="U23" gate="G$1" pin="OUT_B"/>
<wire x1="309.88" y1="228.6" x2="297.18" y2="228.6" width="0.1524" layer="91"/>
<wire x1="309.88" y1="228.6" x2="314.96" y2="228.6" width="0.1524" layer="91"/>
<junction x="309.88" y="228.6"/>
<wire x1="314.96" y1="228.6" x2="314.96" y2="218.44" width="0.1524" layer="91"/>
<pinref part="R77" gate="G$1" pin="1"/>
<wire x1="314.96" y1="218.44" x2="320.04" y2="218.44" width="0.1524" layer="91"/>
<wire x1="320.04" y1="218.44" x2="322.58" y2="218.44" width="0.1524" layer="91"/>
<wire x1="320.04" y1="218.44" x2="320.04" y2="210.82" width="0.1524" layer="91"/>
<wire x1="320.04" y1="210.82" x2="335.28" y2="210.82" width="0.1524" layer="91"/>
<pinref part="U25" gate="G$1" pin="VIN-"/>
<junction x="320.04" y="218.44"/>
</segment>
</net>
<net name="N$109" class="0">
<segment>
<pinref part="U23" gate="G$1" pin="BST_C"/>
<pinref part="C121" gate="G$1" pin="1"/>
<wire x1="297.18" y1="215.9" x2="299.72" y2="215.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$110" class="0">
<segment>
<pinref part="U23" gate="G$1" pin="VREG"/>
<wire x1="251.46" y1="251.46" x2="248.92" y2="251.46" width="0.1524" layer="91"/>
<pinref part="C117" gate="G$1" pin="1"/>
<wire x1="248.92" y1="251.46" x2="236.22" y2="251.46" width="0.1524" layer="91"/>
<wire x1="236.22" y1="251.46" x2="236.22" y2="248.92" width="0.1524" layer="91"/>
<pinref part="U23" gate="G$1" pin="M3"/>
<wire x1="251.46" y1="238.76" x2="248.92" y2="238.76" width="0.1524" layer="91"/>
<wire x1="248.92" y1="238.76" x2="248.92" y2="243.84" width="0.1524" layer="91"/>
<junction x="248.92" y="251.46"/>
<pinref part="U23" gate="G$1" pin="M1"/>
<wire x1="248.92" y1="243.84" x2="248.92" y2="251.46" width="0.1524" layer="91"/>
<wire x1="248.92" y1="243.84" x2="251.46" y2="243.84" width="0.1524" layer="91"/>
<junction x="248.92" y="243.84"/>
</segment>
</net>
<net name="N$111" class="0">
<segment>
<pinref part="RA8" gate="A" pin="2"/>
<pinref part="U23" gate="G$1" pin="!OTW"/>
<wire x1="246.38" y1="233.68" x2="251.46" y2="233.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$112" class="0">
<segment>
<pinref part="U23" gate="G$1" pin="!FAULT"/>
<pinref part="RA8" gate="B" pin="2"/>
<wire x1="251.46" y1="231.14" x2="246.38" y2="231.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$113" class="0">
<segment>
<pinref part="RA8" gate="C" pin="2"/>
<pinref part="U23" gate="G$1" pin="PWM_A"/>
<wire x1="246.38" y1="226.06" x2="251.46" y2="226.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$114" class="0">
<segment>
<pinref part="U23" gate="G$1" pin="PWM_B"/>
<pinref part="RA9" gate="A" pin="2"/>
<wire x1="251.46" y1="223.52" x2="246.38" y2="223.52" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$115" class="0">
<segment>
<pinref part="RA9" gate="D" pin="2"/>
<pinref part="U23" gate="G$1" pin="PWM_C"/>
<wire x1="246.38" y1="220.98" x2="251.46" y2="220.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$116" class="0">
<segment>
<pinref part="U23" gate="G$1" pin="!RESET_A"/>
<pinref part="RA8" gate="D" pin="2"/>
<wire x1="251.46" y1="218.44" x2="246.38" y2="218.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$117" class="0">
<segment>
<pinref part="RA9" gate="B" pin="2"/>
<pinref part="U23" gate="G$1" pin="!RESET_B"/>
<wire x1="246.38" y1="215.9" x2="251.46" y2="215.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$118" class="0">
<segment>
<pinref part="U23" gate="G$1" pin="!RESET_C"/>
<pinref part="RA9" gate="C" pin="2"/>
<wire x1="251.46" y1="213.36" x2="246.38" y2="213.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT4_GND" class="0">
<segment>
<pinref part="C117" gate="G$1" pin="2"/>
<wire x1="236.22" y1="241.3" x2="236.22" y2="238.76" width="0.1524" layer="91"/>
<wire x1="236.22" y1="238.76" x2="233.68" y2="238.76" width="0.1524" layer="91"/>
<label x="233.68" y="238.76" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="246.38" y1="241.3" x2="246.38" y2="238.76" width="0.1524" layer="91"/>
<wire x1="246.38" y1="238.76" x2="236.22" y2="238.76" width="0.1524" layer="91"/>
<pinref part="U23" gate="G$1" pin="M2"/>
<wire x1="251.46" y1="241.3" x2="246.38" y2="241.3" width="0.1524" layer="91"/>
<junction x="236.22" y="238.76"/>
</segment>
<segment>
<pinref part="U23" gate="G$1" pin="AGND"/>
<pinref part="R75" gate="G$1" pin="2"/>
<wire x1="269.24" y1="200.66" x2="264.16" y2="200.66" width="0.1524" layer="91"/>
<wire x1="269.24" y1="200.66" x2="269.24" y2="203.2" width="0.1524" layer="91"/>
<junction x="269.24" y="200.66"/>
<label x="264.16" y="200.66" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="R74" gate="G$1" pin="1"/>
<wire x1="238.76" y1="208.28" x2="243.84" y2="208.28" width="0.1524" layer="91"/>
<label x="238.76" y="208.28" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="!MOT4_OTW" class="0">
<segment>
<label x="233.68" y="233.68" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="233.68" y1="233.68" x2="238.76" y2="233.68" width="0.1524" layer="91"/>
<pinref part="RA8" gate="A" pin="1"/>
</segment>
</net>
<net name="!MOT4_FAULT" class="0">
<segment>
<wire x1="233.68" y1="231.14" x2="238.76" y2="231.14" width="0.1524" layer="91"/>
<label x="233.68" y="231.14" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA8" gate="B" pin="1"/>
</segment>
</net>
<net name="MOT4_PWM_A" class="0">
<segment>
<wire x1="238.76" y1="226.06" x2="233.68" y2="226.06" width="0.1524" layer="91"/>
<label x="233.68" y="226.06" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA8" gate="C" pin="1"/>
</segment>
</net>
<net name="MOT4_PWM_B" class="0">
<segment>
<wire x1="233.68" y1="223.52" x2="238.76" y2="223.52" width="0.1524" layer="91"/>
<label x="233.68" y="223.52" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA9" gate="A" pin="1"/>
</segment>
</net>
<net name="MOT4_PWM_C" class="0">
<segment>
<wire x1="238.76" y1="220.98" x2="233.68" y2="220.98" width="0.1524" layer="91"/>
<label x="233.68" y="220.98" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA9" gate="D" pin="1"/>
</segment>
</net>
<net name="!MOT4_RESET_A" class="0">
<segment>
<wire x1="233.68" y1="218.44" x2="238.76" y2="218.44" width="0.1524" layer="91"/>
<label x="233.68" y="218.44" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA8" gate="D" pin="1"/>
</segment>
</net>
<net name="!MOT4_RESET_B" class="0">
<segment>
<wire x1="238.76" y1="215.9" x2="233.68" y2="215.9" width="0.1524" layer="91"/>
<label x="233.68" y="215.9" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA9" gate="B" pin="1"/>
</segment>
</net>
<net name="!MOT4_RESET_C" class="0">
<segment>
<wire x1="233.68" y1="213.36" x2="238.76" y2="213.36" width="0.1524" layer="91"/>
<label x="233.68" y="213.36" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="RA9" gate="C" pin="1"/>
</segment>
</net>
<net name="MOT4_OUT_U" class="0">
<segment>
<pinref part="R76" gate="G$1" pin="2"/>
<label x="340.36" y="246.38" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="330.2" y1="246.38" x2="332.74" y2="246.38" width="0.1524" layer="91"/>
<wire x1="332.74" y1="246.38" x2="340.36" y2="246.38" width="0.1524" layer="91"/>
<wire x1="332.74" y1="246.38" x2="332.74" y2="236.22" width="0.1524" layer="91"/>
<pinref part="U24" gate="G$1" pin="VIN+"/>
<wire x1="332.74" y1="236.22" x2="335.28" y2="236.22" width="0.1524" layer="91"/>
<junction x="332.74" y="246.38"/>
</segment>
<segment>
<wire x1="322.58" y1="78.74" x2="312.42" y2="78.74" width="0.1524" layer="91"/>
<label x="312.42" y="78.74" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN15" gate="G$1" pin="U"/>
</segment>
</net>
<net name="MOT4_CUR_V" class="0">
<segment>
<pinref part="U25" gate="G$1" pin="OUT"/>
<wire x1="335.28" y1="200.66" x2="332.74" y2="200.66" width="0.1524" layer="91"/>
<label x="332.74" y="200.66" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT4_CUR_U" class="0">
<segment>
<pinref part="U24" gate="G$1" pin="OUT"/>
<wire x1="335.28" y1="228.6" x2="332.74" y2="228.6" width="0.1524" layer="91"/>
<label x="332.74" y="228.6" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT4_OUT_V" class="0">
<segment>
<pinref part="R77" gate="G$1" pin="2"/>
<wire x1="330.2" y1="218.44" x2="332.74" y2="218.44" width="0.1524" layer="91"/>
<label x="340.36" y="218.44" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="332.74" y1="218.44" x2="340.36" y2="218.44" width="0.1524" layer="91"/>
<wire x1="332.74" y1="208.28" x2="332.74" y2="218.44" width="0.1524" layer="91"/>
<junction x="332.74" y="218.44"/>
<pinref part="U25" gate="G$1" pin="VIN+"/>
<wire x1="332.74" y1="208.28" x2="335.28" y2="208.28" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="322.58" y1="68.58" x2="312.42" y2="68.58" width="0.1524" layer="91"/>
<label x="312.42" y="68.58" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN15" gate="G$1" pin="V"/>
</segment>
</net>
<net name="MOT4_OUT_W" class="0">
<segment>
<label x="340.36" y="190.5" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="309.88" y1="210.82" x2="314.96" y2="210.82" width="0.1524" layer="91"/>
<wire x1="314.96" y1="210.82" x2="314.96" y2="190.5" width="0.1524" layer="91"/>
<wire x1="314.96" y1="190.5" x2="340.36" y2="190.5" width="0.1524" layer="91"/>
<pinref part="C121" gate="G$1" pin="2"/>
<wire x1="307.34" y1="215.9" x2="309.88" y2="215.9" width="0.1524" layer="91"/>
<wire x1="309.88" y1="215.9" x2="309.88" y2="210.82" width="0.1524" layer="91"/>
<pinref part="U23" gate="G$1" pin="OUT_C"/>
<wire x1="309.88" y1="210.82" x2="297.18" y2="210.82" width="0.1524" layer="91"/>
<junction x="309.88" y="210.82"/>
</segment>
<segment>
<wire x1="322.58" y1="58.42" x2="312.42" y2="58.42" width="0.1524" layer="91"/>
<label x="312.42" y="58.42" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN15" gate="G$1" pin="W"/>
</segment>
</net>
<net name="VCC/2" class="0">
<segment>
<pinref part="U20" gate="G$1" pin="PVDD_A"/>
<wire x1="297.18" y1="175.26" x2="299.72" y2="175.26" width="0.1524" layer="91"/>
<wire x1="299.72" y1="175.26" x2="314.96" y2="175.26" width="0.1524" layer="91"/>
<wire x1="314.96" y1="175.26" x2="320.04" y2="175.26" width="0.1524" layer="91"/>
<wire x1="320.04" y1="175.26" x2="325.12" y2="175.26" width="0.1524" layer="91"/>
<wire x1="325.12" y1="175.26" x2="332.74" y2="175.26" width="0.1524" layer="91"/>
<pinref part="U20" gate="G$1" pin="PVDD_B"/>
<wire x1="297.18" y1="172.72" x2="299.72" y2="172.72" width="0.1524" layer="91"/>
<wire x1="299.72" y1="172.72" x2="299.72" y2="175.26" width="0.1524" layer="91"/>
<pinref part="U20" gate="G$1" pin="PVDD_C"/>
<wire x1="297.18" y1="170.18" x2="299.72" y2="170.18" width="0.1524" layer="91"/>
<wire x1="299.72" y1="170.18" x2="299.72" y2="172.72" width="0.1524" layer="91"/>
<junction x="299.72" y="172.72"/>
<junction x="299.72" y="175.26"/>
<pinref part="C109" gate="G$1" pin="1"/>
<wire x1="325.12" y1="172.72" x2="325.12" y2="175.26" width="0.1524" layer="91"/>
<pinref part="C110" gate="G$1" pin="P"/>
<wire x1="332.74" y1="172.72" x2="332.74" y2="175.26" width="0.1524" layer="91"/>
<junction x="325.12" y="175.26"/>
<pinref part="C108" gate="G$1" pin="1"/>
<wire x1="320.04" y1="172.72" x2="320.04" y2="175.26" width="0.1524" layer="91"/>
<pinref part="C107" gate="G$1" pin="1"/>
<wire x1="314.96" y1="172.72" x2="314.96" y2="175.26" width="0.1524" layer="91"/>
<junction x="314.96" y="175.26"/>
<junction x="320.04" y="175.26"/>
<wire x1="332.74" y1="175.26" x2="337.82" y2="175.26" width="0.1524" layer="91" style="longdash"/>
<junction x="332.74" y="175.26"/>
<pinref part="P+5" gate="G$1" pin="VCC/2"/>
</segment>
<segment>
<pinref part="U23" gate="G$1" pin="PVDD_A"/>
<wire x1="297.18" y1="266.7" x2="299.72" y2="266.7" width="0.1524" layer="91"/>
<wire x1="299.72" y1="266.7" x2="314.96" y2="266.7" width="0.1524" layer="91"/>
<wire x1="314.96" y1="266.7" x2="320.04" y2="266.7" width="0.1524" layer="91"/>
<wire x1="320.04" y1="266.7" x2="325.12" y2="266.7" width="0.1524" layer="91"/>
<wire x1="325.12" y1="266.7" x2="332.74" y2="266.7" width="0.1524" layer="91"/>
<pinref part="U23" gate="G$1" pin="PVDD_B"/>
<wire x1="297.18" y1="264.16" x2="299.72" y2="264.16" width="0.1524" layer="91"/>
<wire x1="299.72" y1="264.16" x2="299.72" y2="266.7" width="0.1524" layer="91"/>
<pinref part="U23" gate="G$1" pin="PVDD_C"/>
<wire x1="297.18" y1="261.62" x2="299.72" y2="261.62" width="0.1524" layer="91"/>
<wire x1="299.72" y1="261.62" x2="299.72" y2="264.16" width="0.1524" layer="91"/>
<junction x="299.72" y="264.16"/>
<junction x="299.72" y="266.7"/>
<pinref part="C124" gate="G$1" pin="1"/>
<wire x1="325.12" y1="264.16" x2="325.12" y2="266.7" width="0.1524" layer="91"/>
<pinref part="C125" gate="G$1" pin="P"/>
<wire x1="332.74" y1="264.16" x2="332.74" y2="266.7" width="0.1524" layer="91"/>
<junction x="325.12" y="266.7"/>
<pinref part="C123" gate="G$1" pin="1"/>
<wire x1="320.04" y1="264.16" x2="320.04" y2="266.7" width="0.1524" layer="91"/>
<pinref part="C122" gate="G$1" pin="1"/>
<wire x1="314.96" y1="264.16" x2="314.96" y2="266.7" width="0.1524" layer="91"/>
<junction x="314.96" y="266.7"/>
<junction x="320.04" y="266.7"/>
<wire x1="332.74" y1="266.7" x2="337.82" y2="266.7" width="0.1524" layer="91" style="longdash"/>
<junction x="332.74" y="266.7"/>
<pinref part="P+2" gate="G$1" pin="VCC/2"/>
</segment>
</net>
<net name="!MOT3_HU_5" class="0">
<segment>
<wire x1="261.62" y1="63.5" x2="254" y2="63.5" width="0.1524" layer="91"/>
<label x="261.62" y="63.5" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN13" gate="G$1" pin="HU"/>
<pinref part="R90" gate="G$1" pin="2"/>
<wire x1="254" y1="63.5" x2="248.92" y2="63.5" width="0.1524" layer="91"/>
<wire x1="254" y1="55.88" x2="254" y2="63.5" width="0.1524" layer="91"/>
<junction x="254" y="63.5"/>
</segment>
</net>
<net name="!MOT3_HV_5" class="0">
<segment>
<wire x1="248.92" y1="60.96" x2="256.54" y2="60.96" width="0.1524" layer="91"/>
<label x="261.62" y="60.96" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN13" gate="G$1" pin="HV"/>
<pinref part="R91" gate="G$1" pin="2"/>
<wire x1="256.54" y1="60.96" x2="261.62" y2="60.96" width="0.1524" layer="91"/>
<wire x1="256.54" y1="55.88" x2="256.54" y2="60.96" width="0.1524" layer="91"/>
<junction x="256.54" y="60.96"/>
</segment>
</net>
<net name="!MOT3_HW_5" class="0">
<segment>
<wire x1="248.92" y1="58.42" x2="259.08" y2="58.42" width="0.1524" layer="91"/>
<label x="261.62" y="58.42" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN13" gate="G$1" pin="HW"/>
<pinref part="R92" gate="G$1" pin="2"/>
<wire x1="259.08" y1="58.42" x2="261.62" y2="58.42" width="0.1524" layer="91"/>
<wire x1="259.08" y1="55.88" x2="259.08" y2="58.42" width="0.1524" layer="91"/>
<junction x="259.08" y="58.42"/>
</segment>
</net>
<net name="!MOT4_HU_5" class="0">
<segment>
<wire x1="355.6" y1="63.5" x2="347.98" y2="63.5" width="0.1524" layer="91"/>
<label x="355.6" y="63.5" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN15" gate="G$1" pin="HU"/>
<pinref part="R95" gate="G$1" pin="2"/>
<wire x1="347.98" y1="63.5" x2="342.9" y2="63.5" width="0.1524" layer="91"/>
<wire x1="347.98" y1="55.88" x2="347.98" y2="63.5" width="0.1524" layer="91"/>
<junction x="347.98" y="63.5"/>
</segment>
</net>
<net name="!MOT4_HW_5" class="0">
<segment>
<wire x1="342.9" y1="58.42" x2="353.06" y2="58.42" width="0.1524" layer="91"/>
<label x="355.6" y="58.42" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN15" gate="G$1" pin="HW"/>
<pinref part="R97" gate="G$1" pin="2"/>
<wire x1="353.06" y1="58.42" x2="355.6" y2="58.42" width="0.1524" layer="91"/>
<wire x1="353.06" y1="55.88" x2="353.06" y2="58.42" width="0.1524" layer="91"/>
<junction x="353.06" y="58.42"/>
</segment>
</net>
<net name="!MOT4_HV_5" class="0">
<segment>
<wire x1="342.9" y1="60.96" x2="350.52" y2="60.96" width="0.1524" layer="91"/>
<label x="355.6" y="60.96" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="CN15" gate="G$1" pin="HV"/>
<pinref part="R96" gate="G$1" pin="2"/>
<wire x1="350.52" y1="60.96" x2="355.6" y2="60.96" width="0.1524" layer="91"/>
<wire x1="350.52" y1="55.88" x2="350.52" y2="60.96" width="0.1524" layer="91"/>
<junction x="350.52" y="60.96"/>
</segment>
</net>
<net name="MOT1_2_5V" class="0">
<segment>
<pinref part="U15" gate="G$1" pin="V+"/>
<wire x1="157.48" y1="137.16" x2="160.02" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C81" gate="G$1" pin="1"/>
<wire x1="160.02" y1="137.16" x2="167.64" y2="137.16" width="0.1524" layer="91"/>
<label x="167.64" y="137.16" size="1.27" layer="95" font="vector" xref="yes"/>
<junction x="160.02" y="137.16"/>
</segment>
<segment>
<pinref part="U16" gate="G$1" pin="V+"/>
<wire x1="157.48" y1="109.22" x2="160.02" y2="109.22" width="0.1524" layer="91"/>
<pinref part="C82" gate="G$1" pin="1"/>
<wire x1="160.02" y1="109.22" x2="167.64" y2="109.22" width="0.1524" layer="91"/>
<label x="167.64" y="109.22" size="1.27" layer="95" font="vector" xref="yes"/>
<junction x="160.02" y="109.22"/>
</segment>
<segment>
<wire x1="160.02" y1="208.28" x2="167.64" y2="208.28" width="0.1524" layer="91"/>
<label x="167.64" y="208.28" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="160.02" y1="236.22" x2="167.64" y2="236.22" width="0.1524" layer="91"/>
<label x="167.64" y="236.22" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U18" gate="G$1" pin="V+"/>
<wire x1="157.48" y1="236.22" x2="160.02" y2="236.22" width="0.1524" layer="91"/>
<pinref part="C96" gate="G$1" pin="1"/>
<junction x="160.02" y="236.22"/>
<pinref part="U19" gate="G$1" pin="V+"/>
<wire x1="157.48" y1="208.28" x2="160.02" y2="208.28" width="0.1524" layer="91"/>
<pinref part="C97" gate="G$1" pin="1"/>
<junction x="160.02" y="208.28"/>
</segment>
</net>
<net name="N$71" class="0">
<segment>
<pinref part="R65" gate="G$1" pin="1"/>
<wire x1="121.92" y1="119.38" x2="124.46" y2="119.38" width="0.1524" layer="91"/>
<junction x="121.92" y="119.38"/>
<pinref part="U16" gate="G$1" pin="VIN+"/>
<wire x1="137.16" y1="109.22" x2="121.92" y2="109.22" width="0.1524" layer="91"/>
<wire x1="121.92" y1="109.22" x2="121.92" y2="119.38" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="OUT_C"/>
<wire x1="121.92" y1="119.38" x2="111.76" y2="119.38" width="0.1524" layer="91"/>
<pinref part="C76" gate="G$1" pin="2"/>
<wire x1="111.76" y1="119.38" x2="99.06" y2="119.38" width="0.1524" layer="91"/>
<wire x1="109.22" y1="124.46" x2="111.76" y2="124.46" width="0.1524" layer="91"/>
<wire x1="111.76" y1="124.46" x2="111.76" y2="119.38" width="0.1524" layer="91"/>
<junction x="111.76" y="119.38"/>
</segment>
</net>
<net name="MOT1_CUR_W" class="0">
<segment>
<pinref part="U16" gate="G$1" pin="OUT"/>
<wire x1="137.16" y1="101.6" x2="134.62" y2="101.6" width="0.1524" layer="91"/>
<label x="134.62" y="101.6" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="N$70" class="0">
<segment>
<pinref part="R73" gate="G$1" pin="1"/>
<wire x1="320.04" y1="119.38" x2="322.58" y2="119.38" width="0.1524" layer="91"/>
<junction x="320.04" y="119.38"/>
<pinref part="U22" gate="G$1" pin="VIN+"/>
<wire x1="335.28" y1="109.22" x2="320.04" y2="109.22" width="0.1524" layer="91"/>
<wire x1="320.04" y1="109.22" x2="320.04" y2="119.38" width="0.1524" layer="91"/>
<pinref part="U20" gate="G$1" pin="OUT_C"/>
<wire x1="297.18" y1="119.38" x2="309.88" y2="119.38" width="0.1524" layer="91"/>
<pinref part="C106" gate="G$1" pin="2"/>
<wire x1="309.88" y1="119.38" x2="320.04" y2="119.38" width="0.1524" layer="91"/>
<wire x1="307.34" y1="124.46" x2="309.88" y2="124.46" width="0.1524" layer="91"/>
<wire x1="309.88" y1="124.46" x2="309.88" y2="119.38" width="0.1524" layer="91"/>
<junction x="309.88" y="119.38"/>
</segment>
</net>
<net name="MOT3_4_5V" class="0">
<segment>
<pinref part="U21" gate="G$1" pin="V+"/>
<wire x1="355.6" y1="137.16" x2="358.14" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C111" gate="G$1" pin="1"/>
<wire x1="358.14" y1="137.16" x2="365.76" y2="137.16" width="0.1524" layer="91"/>
<label x="365.76" y="137.16" size="1.27" layer="95" font="vector" xref="yes"/>
<junction x="358.14" y="137.16"/>
</segment>
<segment>
<pinref part="U22" gate="G$1" pin="V+"/>
<wire x1="355.6" y1="109.22" x2="358.14" y2="109.22" width="0.1524" layer="91"/>
<pinref part="C112" gate="G$1" pin="1"/>
<wire x1="358.14" y1="109.22" x2="365.76" y2="109.22" width="0.1524" layer="91"/>
<label x="365.76" y="109.22" size="1.27" layer="95" font="vector" xref="yes"/>
<junction x="358.14" y="109.22"/>
</segment>
<segment>
<pinref part="U24" gate="G$1" pin="V+"/>
<wire x1="355.6" y1="236.22" x2="358.14" y2="236.22" width="0.1524" layer="91"/>
<pinref part="C126" gate="G$1" pin="1"/>
<wire x1="358.14" y1="236.22" x2="365.76" y2="236.22" width="0.1524" layer="91"/>
<junction x="358.14" y="236.22"/>
<label x="365.76" y="236.22" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<pinref part="U25" gate="G$1" pin="V+"/>
<wire x1="355.6" y1="208.28" x2="358.14" y2="208.28" width="0.1524" layer="91"/>
<pinref part="C127" gate="G$1" pin="1"/>
<wire x1="358.14" y1="208.28" x2="365.76" y2="208.28" width="0.1524" layer="91"/>
<junction x="358.14" y="208.28"/>
<label x="365.76" y="208.28" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="MOT3_B_5" class="0">
<segment>
<label x="218.44" y="30.48" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="218.44" y1="30.48" x2="228.6" y2="30.48" width="0.1524" layer="91"/>
<pinref part="CN14" gate="G$1" pin="1"/>
<pinref part="R89" gate="G$1" pin="2"/>
<wire x1="228.6" y1="30.48" x2="238.76" y2="30.48" width="0.1524" layer="91"/>
<wire x1="228.6" y1="22.86" x2="228.6" y2="30.48" width="0.1524" layer="91"/>
<junction x="228.6" y="30.48"/>
</segment>
</net>
<net name="MOT3_A_5" class="0">
<segment>
<label x="218.44" y="25.4" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="218.44" y1="25.4" x2="226.06" y2="25.4" width="0.1524" layer="91"/>
<pinref part="CN14" gate="G$1" pin="3"/>
<pinref part="R88" gate="G$1" pin="2"/>
<wire x1="226.06" y1="25.4" x2="238.76" y2="25.4" width="0.1524" layer="91"/>
<wire x1="226.06" y1="22.86" x2="226.06" y2="25.4" width="0.1524" layer="91"/>
<junction x="226.06" y="25.4"/>
</segment>
</net>
<net name="MOT4_B_5" class="0">
<segment>
<label x="312.42" y="30.48" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="312.42" y1="30.48" x2="322.58" y2="30.48" width="0.1524" layer="91"/>
<pinref part="CN16" gate="G$1" pin="1"/>
<pinref part="R94" gate="G$1" pin="2"/>
<wire x1="322.58" y1="30.48" x2="332.74" y2="30.48" width="0.1524" layer="91"/>
<wire x1="322.58" y1="22.86" x2="322.58" y2="30.48" width="0.1524" layer="91"/>
<junction x="322.58" y="30.48"/>
</segment>
</net>
<net name="MOT4_A_5" class="0">
<segment>
<label x="312.42" y="25.4" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="312.42" y1="25.4" x2="320.04" y2="25.4" width="0.1524" layer="91"/>
<pinref part="CN16" gate="G$1" pin="3"/>
<pinref part="R93" gate="G$1" pin="2"/>
<wire x1="320.04" y1="25.4" x2="332.74" y2="25.4" width="0.1524" layer="91"/>
<wire x1="320.04" y1="22.86" x2="320.04" y2="25.4" width="0.1524" layer="91"/>
<junction x="320.04" y="25.4"/>
</segment>
</net>
<net name="+5V/2" class="0">
<segment>
<wire x1="60.96" y1="78.74" x2="68.58" y2="78.74" width="0.1524" layer="91"/>
<pinref part="CN9" gate="G$1" pin="VCC"/>
<pinref part="+P33" gate="1" pin="+5V/2"/>
</segment>
<segment>
<pinref part="C129" gate="G$1" pin="1"/>
<wire x1="165.1" y1="25.4" x2="165.1" y2="27.94" width="0.1524" layer="91"/>
<pinref part="+P34" gate="1" pin="+5V/2"/>
</segment>
<segment>
<wire x1="144.78" y1="22.86" x2="139.7" y2="22.86" width="0.1524" layer="91"/>
<wire x1="139.7" y1="22.86" x2="139.7" y2="33.02" width="0.1524" layer="91"/>
<pinref part="CN12" gate="G$1" pin="4"/>
<pinref part="+P44" gate="1" pin="+5V/2"/>
</segment>
<segment>
<pinref part="CN10" gate="G$1" pin="4"/>
<wire x1="50.8" y1="22.86" x2="45.72" y2="22.86" width="0.1524" layer="91"/>
<wire x1="45.72" y1="22.86" x2="45.72" y2="33.02" width="0.1524" layer="91"/>
<pinref part="+P45" gate="1" pin="+5V/2"/>
</segment>
<segment>
<pinref part="C128" gate="G$1" pin="1"/>
<wire x1="71.12" y1="25.4" x2="71.12" y2="27.94" width="0.1524" layer="91"/>
<pinref part="+P46" gate="1" pin="+5V/2"/>
</segment>
<segment>
<wire x1="154.94" y1="78.74" x2="162.56" y2="78.74" width="0.1524" layer="91"/>
<pinref part="CN11" gate="G$1" pin="VCC"/>
<pinref part="+P47" gate="1" pin="+5V/2"/>
</segment>
</net>
<net name="+5V/3" class="0">
<segment>
<wire x1="332.74" y1="22.86" x2="327.66" y2="22.86" width="0.1524" layer="91"/>
<wire x1="327.66" y1="22.86" x2="327.66" y2="33.02" width="0.1524" layer="91"/>
<pinref part="CN16" gate="G$1" pin="4"/>
<pinref part="+P35" gate="1" pin="+5V/3"/>
</segment>
<segment>
<pinref part="C131" gate="G$1" pin="1"/>
<wire x1="353.06" y1="25.4" x2="353.06" y2="27.94" width="0.1524" layer="91"/>
<pinref part="+P36" gate="1" pin="+5V/3"/>
</segment>
<segment>
<wire x1="238.76" y1="22.86" x2="233.68" y2="22.86" width="0.1524" layer="91"/>
<wire x1="233.68" y1="22.86" x2="233.68" y2="33.02" width="0.1524" layer="91"/>
<pinref part="CN14" gate="G$1" pin="4"/>
<pinref part="+P39" gate="1" pin="+5V/3"/>
</segment>
<segment>
<pinref part="C130" gate="G$1" pin="1"/>
<wire x1="259.08" y1="25.4" x2="259.08" y2="27.94" width="0.1524" layer="91"/>
<pinref part="+P43" gate="1" pin="+5V/3"/>
</segment>
<segment>
<wire x1="248.92" y1="78.74" x2="256.54" y2="78.74" width="0.1524" layer="91"/>
<pinref part="CN13" gate="G$1" pin="VCC"/>
<pinref part="+P48" gate="1" pin="+5V/3"/>
</segment>
<segment>
<wire x1="342.9" y1="78.74" x2="350.52" y2="78.74" width="0.1524" layer="91"/>
<pinref part="CN15" gate="G$1" pin="VCC"/>
<pinref part="+P52" gate="1" pin="+5V/3"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="U15" gate="G$1" pin="VIN+"/>
<wire x1="137.16" y1="137.16" x2="121.92" y2="137.16" width="0.1524" layer="91"/>
<pinref part="R64" gate="G$1" pin="1"/>
<wire x1="116.84" y1="147.32" x2="121.92" y2="147.32" width="0.1524" layer="91"/>
<pinref part="C75" gate="G$1" pin="2"/>
<wire x1="121.92" y1="147.32" x2="124.46" y2="147.32" width="0.1524" layer="91"/>
<wire x1="109.22" y1="142.24" x2="111.76" y2="142.24" width="0.1524" layer="91"/>
<wire x1="111.76" y1="142.24" x2="111.76" y2="137.16" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="OUT_B"/>
<wire x1="111.76" y1="137.16" x2="99.06" y2="137.16" width="0.1524" layer="91"/>
<wire x1="111.76" y1="137.16" x2="116.84" y2="137.16" width="0.1524" layer="91"/>
<junction x="111.76" y="137.16"/>
<wire x1="116.84" y1="147.32" x2="116.84" y2="137.16" width="0.1524" layer="91"/>
<wire x1="121.92" y1="137.16" x2="121.92" y2="147.32" width="0.1524" layer="91"/>
<junction x="121.92" y="147.32"/>
</segment>
</net>
</nets>
</sheet>
<sheet>
<description>Motor Driver(2/2)</description>
<plain>
<wire x1="0" y1="0" x2="0" y2="279.4" width="0.1524" layer="97"/>
<wire x1="0" y1="0" x2="406.4" y2="0" width="0.1524" layer="97"/>
<wire x1="406.4" y1="0" x2="406.4" y2="279.4" width="0.1524" layer="97"/>
<wire x1="0" y1="279.4" x2="406.4" y2="279.4" width="0.1524" layer="97"/>
<text x="129.54" y="259.08" size="1.778" layer="97">温度センサーはU39のみ実装</text>
<wire x1="2.54" y1="276.86" x2="180.34" y2="276.86" width="0.508" layer="102"/>
<wire x1="180.34" y1="276.86" x2="180.34" y2="236.22" width="0.508" layer="102"/>
<wire x1="180.34" y1="236.22" x2="99.06" y2="236.22" width="0.508" layer="102"/>
<wire x1="99.06" y1="236.22" x2="99.06" y2="185.42" width="0.508" layer="102"/>
<wire x1="99.06" y1="185.42" x2="2.54" y2="185.42" width="0.508" layer="102"/>
<wire x1="2.54" y1="185.42" x2="2.54" y2="276.86" width="0.508" layer="102"/>
<wire x1="147.32" y1="200.66" x2="147.32" y2="2.54" width="0.508" layer="102"/>
<wire x1="147.32" y1="2.54" x2="246.38" y2="2.54" width="0.508" layer="102"/>
<wire x1="246.38" y1="2.54" x2="246.38" y2="147.32" width="0.508" layer="102"/>
<wire x1="246.38" y1="147.32" x2="350.52" y2="147.32" width="0.508" layer="102"/>
<wire x1="350.52" y1="147.32" x2="350.52" y2="200.66" width="0.508" layer="102"/>
<wire x1="350.52" y1="200.66" x2="147.32" y2="200.66" width="0.508" layer="102"/>
<wire x1="187.96" y1="261.62" x2="236.22" y2="210.82" width="0.508" layer="102"/>
<wire x1="111.76" y1="213.36" x2="152.4" y2="231.14" width="0.508" layer="102"/>
<wire x1="111.76" y1="231.14" x2="152.4" y2="213.36" width="0.508" layer="102"/>
<wire x1="187.96" y1="210.82" x2="236.22" y2="261.62" width="0.508" layer="102"/>
<wire x1="15.24" y1="172.72" x2="137.16" y2="7.62" width="0.508" layer="102"/>
<wire x1="137.16" y1="172.72" x2="15.24" y2="7.62" width="0.508" layer="102"/>
<wire x1="355.6" y1="200.66" x2="403.86" y2="200.66" width="0.508" layer="102"/>
<wire x1="403.86" y1="200.66" x2="403.86" y2="2.54" width="0.508" layer="102"/>
<wire x1="403.86" y1="2.54" x2="248.92" y2="2.54" width="0.508" layer="102"/>
<wire x1="248.92" y1="2.54" x2="248.92" y2="93.98" width="0.508" layer="102"/>
<wire x1="248.92" y1="93.98" x2="355.6" y2="93.98" width="0.508" layer="102"/>
<wire x1="355.6" y1="93.98" x2="355.6" y2="200.66" width="0.508" layer="102"/>
<text x="7.62" y="271.78" size="5.08" layer="102" align="center">④</text>
<text x="152.4" y="195.58" size="5.08" layer="102" align="center">⑤</text>
<text x="360.68" y="195.58" size="5.08" layer="102" align="center">⑥</text>
<wire x1="302.26" y1="142.24" x2="350.52" y2="99.06" width="0.508" layer="102"/>
<wire x1="350.52" y1="142.24" x2="302.26" y2="99.06" width="0.508" layer="102"/>
</plain>
<instances>
<instance part="C136" gate="G$1" x="58.42" y="63.5"/>
<instance part="R101" gate="G$1" x="53.34" y="73.66" rot="R270"/>
<instance part="C135" gate="G$1" x="53.34" y="63.5"/>
<instance part="C139" gate="G$1" x="63.5" y="48.26"/>
<instance part="+P38" gate="1" x="121.92" y="40.64" rot="R270"/>
<instance part="R103" gate="G$1" x="114.3" y="40.64"/>
<instance part="C134" gate="G$1" x="38.1" y="20.32"/>
<instance part="U28" gate="G$1" x="45.72" y="20.32"/>
<instance part="+P70" gate="1" x="53.34" y="83.82"/>
<instance part="+P71" gate="1" x="55.88" y="53.34" rot="R90"/>
<instance part="GND35" gate="1" x="45.72" y="12.7"/>
<instance part="R100" gate="G$1" x="45.72" y="35.56" rot="R90"/>
<instance part="+P32" gate="1" x="45.72" y="43.18"/>
<instance part="U29" gate="G$1" x="88.9" y="48.26"/>
<instance part="GND83" gate="1" x="106.68" y="45.72"/>
<instance part="GND87" gate="1" x="71.12" y="25.4"/>
<instance part="GND92" gate="1" x="63.5" y="43.18"/>
<instance part="GND94" gate="1" x="53.34" y="58.42"/>
<instance part="C137" gate="G$1" x="60.96" y="27.94"/>
<instance part="GND119" gate="1" x="60.96" y="22.86"/>
<instance part="C138" gate="G$1" x="63.5" y="63.5"/>
<instance part="R102" gate="G$1" x="111.76" y="27.94"/>
<instance part="GND120" gate="1" x="88.9" y="20.32"/>
<instance part="C144" gate="G$1" x="58.42" y="144.78"/>
<instance part="R107" gate="G$1" x="53.34" y="154.94" rot="R270"/>
<instance part="C143" gate="G$1" x="53.34" y="144.78"/>
<instance part="C147" gate="G$1" x="63.5" y="129.54"/>
<instance part="+P26" gate="1" x="121.92" y="121.92" rot="R270"/>
<instance part="R109" gate="G$1" x="114.3" y="121.92"/>
<instance part="C142" gate="G$1" x="38.1" y="101.6"/>
<instance part="U32" gate="G$1" x="45.72" y="101.6"/>
<instance part="+P28" gate="1" x="53.34" y="165.1"/>
<instance part="+P30" gate="1" x="55.88" y="134.62" rot="R90"/>
<instance part="GND112" gate="1" x="45.72" y="93.98"/>
<instance part="R106" gate="G$1" x="45.72" y="116.84" rot="R90"/>
<instance part="+P31" gate="1" x="45.72" y="124.46"/>
<instance part="U33" gate="G$1" x="88.9" y="129.54"/>
<instance part="GND114" gate="1" x="106.68" y="127"/>
<instance part="GND121" gate="1" x="71.12" y="106.68"/>
<instance part="GND122" gate="1" x="63.5" y="124.46"/>
<instance part="GND123" gate="1" x="53.34" y="139.7"/>
<instance part="C145" gate="G$1" x="60.96" y="109.22"/>
<instance part="GND124" gate="1" x="60.96" y="104.14"/>
<instance part="C146" gate="G$1" x="63.5" y="144.78"/>
<instance part="R108" gate="G$1" x="111.76" y="109.22"/>
<instance part="GND125" gate="1" x="88.9" y="101.6"/>
<instance part="+P55" gate="1" x="121.92" y="231.14"/>
<instance part="GND132" gate="1" x="121.92" y="215.9"/>
<instance part="C162" gate="G$1" x="121.92" y="220.98" rot="MR0"/>
<instance part="U38" gate="G$1" x="139.7" y="220.98"/>
<instance part="+P58" gate="1" x="193.04" y="231.14"/>
<instance part="GND134" gate="1" x="193.04" y="215.9"/>
<instance part="C164" gate="G$1" x="193.04" y="220.98" rot="MR0"/>
<instance part="U40" gate="G$1" x="210.82" y="220.98"/>
<instance part="+P59" gate="1" x="193.04" y="256.54"/>
<instance part="GND135" gate="1" x="193.04" y="241.3"/>
<instance part="C165" gate="G$1" x="193.04" y="246.38" rot="MR0"/>
<instance part="U41" gate="G$1" x="210.82" y="246.38"/>
<instance part="U39" gate="1" x="139.7" y="246.38"/>
<instance part="+P69" gate="1" x="121.92" y="256.54"/>
<instance part="GND140" gate="1" x="121.92" y="241.3"/>
<instance part="C163" gate="G$1" x="121.92" y="246.38" rot="MR0"/>
<instance part="RF4" gate="G$1" x="30.48" y="254"/>
<instance part="+P79" gate="1" x="20.32" y="254" rot="MR270"/>
<instance part="+P67" gate="1" x="76.2" y="254" rot="R270"/>
<instance part="U35" gate="G$1" x="48.26" y="248.92" rot="MR0"/>
<instance part="GND147" gate="1" x="35.56" y="241.3"/>
<instance part="R113" gate="G$1" x="66.04" y="248.92"/>
<instance part="R112" gate="G$1" x="60.96" y="238.76" rot="R90"/>
<instance part="GND148" gate="1" x="60.96" y="231.14"/>
<instance part="+P77" gate="1" x="20.32" y="218.44" rot="MR270"/>
<instance part="+P78" gate="1" x="76.2" y="218.44" rot="R270"/>
<instance part="RF3" gate="G$1" x="30.48" y="218.44"/>
<instance part="U34" gate="G$1" x="48.26" y="213.36" rot="MR0"/>
<instance part="GND145" gate="1" x="35.56" y="205.74"/>
<instance part="R111" gate="G$1" x="66.04" y="213.36"/>
<instance part="R110" gate="G$1" x="60.96" y="203.2" rot="R90"/>
<instance part="GND146" gate="1" x="60.96" y="195.58"/>
<instance part="C132" gate="G$1" x="182.88" y="83.82" rot="MR0"/>
<instance part="+P68" gate="1" x="182.88" y="48.26"/>
<instance part="U26" gate="G$1" x="198.12" y="73.66"/>
<instance part="U27" gate="G$1" x="198.12" y="27.94"/>
<instance part="GND56" gate="1" x="210.82" y="86.36"/>
<instance part="GND97" gate="1" x="182.88" y="78.74"/>
<instance part="GND102" gate="1" x="182.88" y="33.02"/>
<instance part="+P37" gate="1" x="182.88" y="93.98"/>
<instance part="C133" gate="G$1" x="182.88" y="38.1" rot="MR0"/>
<instance part="GND104" gate="1" x="185.42" y="20.32"/>
<instance part="GND107" gate="1" x="185.42" y="66.04"/>
<instance part="C140" gate="G$1" x="182.88" y="175.26" rot="MR0"/>
<instance part="+P53" gate="1" x="182.88" y="139.7"/>
<instance part="U30" gate="G$1" x="198.12" y="165.1"/>
<instance part="U31" gate="G$1" x="198.12" y="119.38"/>
<instance part="GND103" gate="1" x="210.82" y="177.8"/>
<instance part="GND128" gate="1" x="182.88" y="170.18"/>
<instance part="GND129" gate="1" x="182.88" y="124.46"/>
<instance part="+P54" gate="1" x="182.88" y="185.42"/>
<instance part="C141" gate="G$1" x="182.88" y="129.54" rot="MR0"/>
<instance part="GND130" gate="1" x="185.42" y="111.76"/>
<instance part="GND131" gate="1" x="185.42" y="157.48"/>
<instance part="R99" gate="G$1" x="226.06" y="48.26"/>
<instance part="R98" gate="G$1" x="218.44" y="43.18" rot="R90"/>
<instance part="P+8" gate="G$1" x="233.68" y="48.26" rot="R270"/>
<instance part="GND18" gate="1" x="218.44" y="35.56"/>
<instance part="R104" gate="G$1" x="215.9" y="193.04"/>
<instance part="R105" gate="G$1" x="220.98" y="187.96" rot="R90"/>
<instance part="GND133" gate="1" x="220.98" y="180.34"/>
<instance part="P+9" gate="G$1" x="205.74" y="193.04" rot="MR270"/>
<instance part="GND139" gate="1" x="210.82" y="147.32"/>
<instance part="GND141" gate="1" x="210.82" y="55.88"/>
<instance part="GND155" gate="1" x="210.82" y="12.7"/>
<instance part="CN17" gate="G$1" x="383.54" y="165.1"/>
<instance part="C161" gate="G$1" x="383.54" y="78.74"/>
<instance part="R117" gate="G$1" x="299.72" y="27.94"/>
<instance part="C155" gate="G$1" x="355.6" y="71.12" rot="R90"/>
<instance part="C156" gate="G$1" x="355.6" y="53.34" rot="R90"/>
<instance part="C157" gate="G$1" x="355.6" y="35.56" rot="R90"/>
<instance part="U37" gate="G$1" x="325.12" y="58.42"/>
<instance part="C153" gate="G$1" x="287.02" y="63.5"/>
<instance part="C160" gate="G$1" x="375.92" y="78.74" smashed="yes">
<attribute name="NAME" x="377.444" y="89.281" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="377.444" y="86.741" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="GND110" gate="1" x="375.92" y="73.66"/>
<instance part="C159" gate="G$1" x="370.84" y="78.74" smashed="yes">
<attribute name="NAME" x="369.824" y="89.281" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="369.824" y="86.741" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="C158" gate="G$1" x="365.76" y="78.74" smashed="yes">
<attribute name="NAME" x="362.204" y="89.281" size="1.778" layer="95" font="vector"/>
<attribute name="VALUE" x="362.204" y="86.741" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="C150" gate="G$1" x="276.86" y="78.74"/>
<instance part="C151" gate="G$1" x="281.94" y="78.74"/>
<instance part="C152" gate="G$1" x="287.02" y="78.74"/>
<instance part="C154" gate="G$1" x="292.1" y="78.74"/>
<instance part="GND111" gate="1" x="281.94" y="73.66"/>
<instance part="C149" gate="G$1" x="269.24" y="78.74"/>
<instance part="+P63" gate="1" x="261.62" y="86.36" rot="MR270"/>
<instance part="RA10" gate="A" x="294.64" y="53.34"/>
<instance part="RA10" gate="B" x="294.64" y="50.8"/>
<instance part="RA10" gate="C" x="294.64" y="45.72"/>
<instance part="RA10" gate="D" x="294.64" y="38.1"/>
<instance part="RA11" gate="A" x="294.64" y="43.18"/>
<instance part="RA11" gate="B" x="294.64" y="35.56"/>
<instance part="RA11" gate="C" x="294.64" y="33.02"/>
<instance part="RA11" gate="D" x="294.64" y="40.64"/>
<instance part="GND106" gate="1" x="378.46" y="152.4"/>
<instance part="P+7" gate="G$1" x="307.34" y="134.62" rot="MR270"/>
<instance part="R118" gate="G$1" x="320.04" y="17.78" rot="R90"/>
<instance part="GND109" gate="1" x="320.04" y="10.16"/>
<instance part="R119" gate="G$1" x="327.66" y="167.64" rot="R90"/>
<instance part="R120" gate="G$1" x="335.28" y="167.64" rot="R90"/>
<instance part="R121" gate="G$1" x="342.9" y="167.64" rot="R90"/>
<instance part="GND108" gate="1" x="327.66" y="17.78"/>
<instance part="U36" gate="G$1" x="325.12" y="111.76"/>
<instance part="R114" gate="G$1" x="325.12" y="134.62"/>
<instance part="C148" gate="G$1" x="307.34" y="106.68"/>
<instance part="GND105" gate="1" x="307.34" y="101.6"/>
<instance part="+P64" gate="1" x="302.26" y="111.76" rot="MR270"/>
<instance part="GND142" gate="1" x="337.82" y="101.6"/>
<instance part="R115" gate="G$1" x="342.9" y="119.38" rot="R90"/>
<instance part="R116" gate="G$1" x="347.98" y="119.38" rot="R90"/>
<instance part="+P73" gate="1" x="345.44" y="129.54" rot="MR0"/>
<instance part="+P81" gate="1" x="378.46" y="182.88"/>
<instance part="+P65" gate="1" x="335.28" y="177.8"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="GND35" gate="1" pin="GND"/>
<pinref part="U28" gate="G$1" pin="A"/>
<wire x1="45.72" y1="15.24" x2="45.72" y2="17.78" width="0.1524" layer="91"/>
<pinref part="C134" gate="G$1" pin="2"/>
<wire x1="38.1" y1="17.78" x2="38.1" y2="15.24" width="0.1524" layer="91"/>
<wire x1="38.1" y1="15.24" x2="45.72" y2="15.24" width="0.1524" layer="91"/>
<junction x="45.72" y="15.24"/>
</segment>
<segment>
<pinref part="U29" gate="G$1" pin="AINM"/>
<wire x1="104.14" y1="48.26" x2="106.68" y2="48.26" width="0.1524" layer="91"/>
<pinref part="GND83" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U29" gate="G$1" pin="AGND"/>
<pinref part="GND94" gate="1" pin="GND"/>
<wire x1="73.66" y1="60.96" x2="63.5" y2="60.96" width="0.1524" layer="91"/>
<pinref part="C135" gate="G$1" pin="2"/>
<junction x="53.34" y="60.96"/>
<pinref part="C136" gate="G$1" pin="2"/>
<junction x="58.42" y="60.96"/>
<wire x1="63.5" y1="60.96" x2="58.42" y2="60.96" width="0.1524" layer="91"/>
<wire x1="58.42" y1="60.96" x2="53.34" y2="60.96" width="0.1524" layer="91"/>
<pinref part="C138" gate="G$1" pin="2"/>
<junction x="63.5" y="60.96"/>
</segment>
<segment>
<pinref part="U29" gate="G$1" pin="BDGND"/>
<pinref part="GND92" gate="1" pin="GND"/>
<wire x1="73.66" y1="45.72" x2="63.5" y2="45.72" width="0.1524" layer="91"/>
<pinref part="C139" gate="G$1" pin="2"/>
<junction x="63.5" y="45.72"/>
</segment>
<segment>
<pinref part="U29" gate="G$1" pin="REFM"/>
<pinref part="GND87" gate="1" pin="GND"/>
<wire x1="73.66" y1="27.94" x2="71.12" y2="27.94" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C137" gate="G$1" pin="2"/>
<pinref part="GND119" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U29" gate="G$1" pin="NC"/>
<pinref part="GND120" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND112" gate="1" pin="GND"/>
<pinref part="U32" gate="G$1" pin="A"/>
<wire x1="45.72" y1="96.52" x2="45.72" y2="99.06" width="0.1524" layer="91"/>
<pinref part="C142" gate="G$1" pin="2"/>
<wire x1="38.1" y1="99.06" x2="38.1" y2="96.52" width="0.1524" layer="91"/>
<wire x1="38.1" y1="96.52" x2="45.72" y2="96.52" width="0.1524" layer="91"/>
<junction x="45.72" y="96.52"/>
</segment>
<segment>
<pinref part="U33" gate="G$1" pin="AINM"/>
<wire x1="104.14" y1="129.54" x2="106.68" y2="129.54" width="0.1524" layer="91"/>
<pinref part="GND114" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U33" gate="G$1" pin="AGND"/>
<pinref part="GND123" gate="1" pin="GND"/>
<wire x1="73.66" y1="142.24" x2="63.5" y2="142.24" width="0.1524" layer="91"/>
<pinref part="C143" gate="G$1" pin="2"/>
<junction x="53.34" y="142.24"/>
<pinref part="C144" gate="G$1" pin="2"/>
<junction x="58.42" y="142.24"/>
<wire x1="63.5" y1="142.24" x2="58.42" y2="142.24" width="0.1524" layer="91"/>
<wire x1="58.42" y1="142.24" x2="53.34" y2="142.24" width="0.1524" layer="91"/>
<pinref part="C146" gate="G$1" pin="2"/>
<junction x="63.5" y="142.24"/>
</segment>
<segment>
<pinref part="U33" gate="G$1" pin="BDGND"/>
<pinref part="GND122" gate="1" pin="GND"/>
<wire x1="73.66" y1="127" x2="63.5" y2="127" width="0.1524" layer="91"/>
<pinref part="C147" gate="G$1" pin="2"/>
<junction x="63.5" y="127"/>
</segment>
<segment>
<pinref part="U33" gate="G$1" pin="REFM"/>
<pinref part="GND121" gate="1" pin="GND"/>
<wire x1="73.66" y1="109.22" x2="71.12" y2="109.22" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C145" gate="G$1" pin="2"/>
<pinref part="GND124" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U33" gate="G$1" pin="NC"/>
<pinref part="GND125" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND132" gate="1" pin="GND"/>
<pinref part="C162" gate="G$1" pin="2"/>
<pinref part="U38" gate="G$1" pin="GND"/>
<wire x1="127" y1="218.44" x2="121.92" y2="218.44" width="0.1524" layer="91"/>
<junction x="121.92" y="218.44"/>
</segment>
<segment>
<pinref part="GND134" gate="1" pin="GND"/>
<pinref part="C164" gate="G$1" pin="2"/>
<pinref part="U40" gate="G$1" pin="GND"/>
<wire x1="198.12" y1="218.44" x2="193.04" y2="218.44" width="0.1524" layer="91"/>
<junction x="193.04" y="218.44"/>
</segment>
<segment>
<pinref part="GND135" gate="1" pin="GND"/>
<pinref part="C165" gate="G$1" pin="2"/>
<pinref part="U41" gate="G$1" pin="GND"/>
<wire x1="198.12" y1="243.84" x2="193.04" y2="243.84" width="0.1524" layer="91"/>
<junction x="193.04" y="243.84"/>
</segment>
<segment>
<pinref part="GND140" gate="1" pin="GND"/>
<pinref part="C163" gate="G$1" pin="2"/>
<pinref part="U39" gate="1" pin="GND"/>
<wire x1="121.92" y1="243.84" x2="132.08" y2="243.84" width="0.1524" layer="91"/>
<junction x="121.92" y="243.84"/>
</segment>
<segment>
<pinref part="U35" gate="G$1" pin="R2"/>
<wire x1="38.1" y1="243.84" x2="35.56" y2="243.84" width="0.1524" layer="91"/>
<pinref part="GND147" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R112" gate="G$1" pin="1"/>
<pinref part="GND148" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U34" gate="G$1" pin="R2"/>
<wire x1="38.1" y1="208.28" x2="35.56" y2="208.28" width="0.1524" layer="91"/>
<pinref part="GND145" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R110" gate="G$1" pin="1"/>
<pinref part="GND146" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U26" gate="G$1" pin="SI"/>
<wire x1="208.28" y1="88.9" x2="210.82" y2="88.9" width="0.1524" layer="91"/>
<pinref part="GND56" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND97" gate="1" pin="GND"/>
<pinref part="C132" gate="G$1" pin="2"/>
<pinref part="U26" gate="G$1" pin="GND"/>
<wire x1="187.96" y1="81.28" x2="182.88" y2="81.28" width="0.1524" layer="91"/>
<junction x="182.88" y="81.28"/>
</segment>
<segment>
<pinref part="GND102" gate="1" pin="GND"/>
<pinref part="C133" gate="G$1" pin="2"/>
<pinref part="U27" gate="G$1" pin="GND"/>
<wire x1="187.96" y1="35.56" x2="182.88" y2="35.56" width="0.1524" layer="91"/>
<junction x="182.88" y="35.56"/>
</segment>
<segment>
<pinref part="U27" gate="G$1" pin="CKINH"/>
<wire x1="187.96" y1="22.86" x2="185.42" y2="22.86" width="0.1524" layer="91"/>
<pinref part="GND104" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U26" gate="G$1" pin="CKINH"/>
<wire x1="187.96" y1="68.58" x2="185.42" y2="68.58" width="0.1524" layer="91"/>
<pinref part="GND107" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U30" gate="G$1" pin="SI"/>
<wire x1="208.28" y1="180.34" x2="210.82" y2="180.34" width="0.1524" layer="91"/>
<pinref part="GND103" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND128" gate="1" pin="GND"/>
<pinref part="C140" gate="G$1" pin="2"/>
<pinref part="U30" gate="G$1" pin="GND"/>
<wire x1="187.96" y1="172.72" x2="182.88" y2="172.72" width="0.1524" layer="91"/>
<junction x="182.88" y="172.72"/>
</segment>
<segment>
<pinref part="GND129" gate="1" pin="GND"/>
<pinref part="C141" gate="G$1" pin="2"/>
<pinref part="U31" gate="G$1" pin="GND"/>
<wire x1="187.96" y1="127" x2="182.88" y2="127" width="0.1524" layer="91"/>
<junction x="182.88" y="127"/>
</segment>
<segment>
<pinref part="U31" gate="G$1" pin="CKINH"/>
<wire x1="187.96" y1="114.3" x2="185.42" y2="114.3" width="0.1524" layer="91"/>
<pinref part="GND130" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U30" gate="G$1" pin="CKINH"/>
<wire x1="187.96" y1="160.02" x2="185.42" y2="160.02" width="0.1524" layer="91"/>
<pinref part="GND131" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R98" gate="G$1" pin="1"/>
<pinref part="GND18" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R105" gate="G$1" pin="1"/>
<pinref part="GND133" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U30" gate="G$1" pin="C"/>
<wire x1="208.28" y1="165.1" x2="210.82" y2="165.1" width="0.1524" layer="91"/>
<wire x1="210.82" y1="165.1" x2="210.82" y2="162.56" width="0.1524" layer="91"/>
<pinref part="U30" gate="G$1" pin="D"/>
<wire x1="210.82" y1="162.56" x2="210.82" y2="149.86" width="0.1524" layer="91"/>
<wire x1="208.28" y1="162.56" x2="210.82" y2="162.56" width="0.1524" layer="91"/>
<pinref part="GND139" gate="1" pin="GND"/>
<junction x="210.82" y="162.56"/>
</segment>
<segment>
<pinref part="U26" gate="G$1" pin="C"/>
<wire x1="208.28" y1="73.66" x2="210.82" y2="73.66" width="0.1524" layer="91"/>
<pinref part="GND141" gate="1" pin="GND"/>
<wire x1="210.82" y1="73.66" x2="210.82" y2="71.12" width="0.1524" layer="91"/>
<pinref part="U26" gate="G$1" pin="D"/>
<wire x1="210.82" y1="71.12" x2="210.82" y2="68.58" width="0.1524" layer="91"/>
<wire x1="210.82" y1="68.58" x2="210.82" y2="58.42" width="0.1524" layer="91"/>
<wire x1="208.28" y1="71.12" x2="210.82" y2="71.12" width="0.1524" layer="91"/>
<pinref part="U26" gate="G$1" pin="E"/>
<wire x1="208.28" y1="68.58" x2="210.82" y2="68.58" width="0.1524" layer="91"/>
<junction x="210.82" y="68.58"/>
<junction x="210.82" y="71.12"/>
</segment>
<segment>
<pinref part="U27" gate="G$1" pin="H"/>
<wire x1="208.28" y1="15.24" x2="210.82" y2="15.24" width="0.1524" layer="91"/>
<pinref part="GND155" gate="1" pin="GND"/>
<pinref part="U27" gate="G$1" pin="G"/>
<wire x1="208.28" y1="17.78" x2="210.82" y2="17.78" width="0.1524" layer="91"/>
<wire x1="210.82" y1="17.78" x2="210.82" y2="15.24" width="0.1524" layer="91"/>
<junction x="210.82" y="15.24"/>
</segment>
<segment>
<pinref part="C161" gate="G$1" pin="N"/>
<pinref part="GND110" gate="1" pin="GND"/>
<pinref part="C160" gate="G$1" pin="2"/>
<junction x="375.92" y="76.2"/>
<wire x1="375.92" y1="76.2" x2="383.54" y2="76.2" width="0.1524" layer="91"/>
<pinref part="C158" gate="G$1" pin="2"/>
<pinref part="C159" gate="G$1" pin="2"/>
<wire x1="365.76" y1="76.2" x2="370.84" y2="76.2" width="0.1524" layer="91"/>
<wire x1="370.84" y1="76.2" x2="375.92" y2="76.2" width="0.1524" layer="91"/>
<junction x="370.84" y="76.2"/>
</segment>
<segment>
<pinref part="C151" gate="G$1" pin="2"/>
<pinref part="GND111" gate="1" pin="GND"/>
<pinref part="C152" gate="G$1" pin="2"/>
<wire x1="281.94" y1="76.2" x2="287.02" y2="76.2" width="0.1524" layer="91"/>
<pinref part="C154" gate="G$1" pin="2"/>
<wire x1="287.02" y1="76.2" x2="292.1" y2="76.2" width="0.1524" layer="91"/>
<pinref part="C150" gate="G$1" pin="2"/>
<wire x1="281.94" y1="76.2" x2="276.86" y2="76.2" width="0.1524" layer="91"/>
<pinref part="C149" gate="G$1" pin="N"/>
<wire x1="269.24" y1="76.2" x2="276.86" y2="76.2" width="0.1524" layer="91"/>
<junction x="276.86" y="76.2"/>
<junction x="281.94" y="76.2"/>
<junction x="287.02" y="76.2"/>
</segment>
<segment>
<pinref part="CN17" gate="G$1" pin="5"/>
<wire x1="381" y1="165.1" x2="378.46" y2="165.1" width="0.1524" layer="91"/>
<pinref part="GND106" gate="1" pin="GND"/>
<wire x1="378.46" y1="165.1" x2="378.46" y2="154.94" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R118" gate="G$1" pin="1"/>
<pinref part="GND109" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U37" gate="G$1" pin="GND"/>
<wire x1="322.58" y1="22.86" x2="322.58" y2="20.32" width="0.1524" layer="91"/>
<wire x1="322.58" y1="20.32" x2="325.12" y2="20.32" width="0.1524" layer="91"/>
<pinref part="U37" gate="G$1" pin="GND_C"/>
<wire x1="325.12" y1="20.32" x2="327.66" y2="20.32" width="0.1524" layer="91"/>
<wire x1="327.66" y1="20.32" x2="330.2" y2="20.32" width="0.1524" layer="91"/>
<wire x1="330.2" y1="20.32" x2="330.2" y2="22.86" width="0.1524" layer="91"/>
<pinref part="U37" gate="G$1" pin="GND_B"/>
<wire x1="327.66" y1="22.86" x2="327.66" y2="20.32" width="0.1524" layer="91"/>
<pinref part="U37" gate="G$1" pin="GND_A"/>
<wire x1="325.12" y1="22.86" x2="325.12" y2="20.32" width="0.1524" layer="91"/>
<pinref part="GND108" gate="1" pin="GND"/>
<junction x="327.66" y="20.32"/>
<junction x="325.12" y="20.32"/>
</segment>
<segment>
<pinref part="C148" gate="G$1" pin="2"/>
<pinref part="U36" gate="G$1" pin="GND"/>
<wire x1="307.34" y1="104.14" x2="314.96" y2="104.14" width="0.1524" layer="91"/>
<pinref part="GND105" gate="1" pin="GND"/>
<junction x="307.34" y="104.14"/>
</segment>
<segment>
<pinref part="U36" gate="G$1" pin="A1"/>
<pinref part="GND142" gate="1" pin="GND"/>
<wire x1="335.28" y1="104.14" x2="337.82" y2="104.14" width="0.1524" layer="91"/>
<wire x1="337.82" y1="104.14" x2="337.82" y2="106.68" width="0.1524" layer="91"/>
<pinref part="U36" gate="G$1" pin="A0"/>
<wire x1="337.82" y1="106.68" x2="335.28" y2="106.68" width="0.1524" layer="91"/>
<junction x="337.82" y="104.14"/>
</segment>
</net>
<net name="MOT1_2_CUR_REF" class="0">
<segment>
<wire x1="55.88" y1="27.94" x2="45.72" y2="27.94" width="0.1524" layer="91"/>
<wire x1="45.72" y1="27.94" x2="38.1" y2="27.94" width="0.1524" layer="91"/>
<label x="33.02" y="27.94" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<junction x="45.72" y="27.94"/>
<wire x1="38.1" y1="27.94" x2="33.02" y2="27.94" width="0.1524" layer="91"/>
<wire x1="45.72" y1="22.86" x2="45.72" y2="27.94" width="0.1524" layer="91"/>
<pinref part="C134" gate="G$1" pin="1"/>
<wire x1="38.1" y1="25.4" x2="38.1" y2="27.94" width="0.1524" layer="91"/>
<pinref part="U28" gate="G$1" pin="K"/>
<junction x="38.1" y="27.94"/>
<pinref part="R100" gate="G$1" pin="1"/>
<wire x1="45.72" y1="30.48" x2="45.72" y2="27.94" width="0.1524" layer="91"/>
<pinref part="U29" gate="G$1" pin="REFP"/>
<wire x1="73.66" y1="35.56" x2="60.96" y2="35.56" width="0.1524" layer="91"/>
<wire x1="60.96" y1="35.56" x2="55.88" y2="35.56" width="0.1524" layer="91"/>
<wire x1="55.88" y1="35.56" x2="55.88" y2="27.94" width="0.1524" layer="91"/>
<pinref part="C137" gate="G$1" pin="1"/>
<wire x1="60.96" y1="33.02" x2="60.96" y2="35.56" width="0.1524" layer="91"/>
<junction x="60.96" y="35.56"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="R100" gate="G$1" pin="2"/>
<pinref part="+P32" gate="1" pin="+5V"/>
<wire x1="45.72" y1="38.1" x2="45.72" y2="40.64" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="+P70" gate="1" pin="+5V"/>
<pinref part="R101" gate="G$1" pin="1"/>
<wire x1="53.34" y1="81.28" x2="53.34" y2="78.74" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R106" gate="G$1" pin="2"/>
<pinref part="+P31" gate="1" pin="+5V"/>
<wire x1="45.72" y1="119.38" x2="45.72" y2="121.92" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="+P28" gate="1" pin="+5V"/>
<pinref part="R107" gate="G$1" pin="1"/>
<wire x1="53.34" y1="162.56" x2="53.34" y2="160.02" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U35" gate="G$1" pin="IN"/>
<pinref part="+P67" gate="1" pin="+5V"/>
<wire x1="58.42" y1="254" x2="71.12" y2="254" width="0.1524" layer="91"/>
<pinref part="R113" gate="G$1" pin="2"/>
<wire x1="71.12" y1="254" x2="73.66" y2="254" width="0.1524" layer="91"/>
<wire x1="68.58" y1="248.92" x2="71.12" y2="248.92" width="0.1524" layer="91"/>
<wire x1="71.12" y1="248.92" x2="71.12" y2="254" width="0.1524" layer="91"/>
<junction x="71.12" y="254"/>
</segment>
<segment>
<pinref part="U34" gate="G$1" pin="IN"/>
<pinref part="+P78" gate="1" pin="+5V"/>
<wire x1="58.42" y1="218.44" x2="71.12" y2="218.44" width="0.1524" layer="91"/>
<pinref part="R111" gate="G$1" pin="2"/>
<wire x1="71.12" y1="218.44" x2="73.66" y2="218.44" width="0.1524" layer="91"/>
<wire x1="68.58" y1="213.36" x2="71.12" y2="213.36" width="0.1524" layer="91"/>
<wire x1="71.12" y1="213.36" x2="71.12" y2="218.44" width="0.1524" layer="91"/>
<junction x="71.12" y="218.44"/>
</segment>
</net>
<net name="MOT2_CUR_U" class="0">
<segment>
<label x="114.3" y="63.5" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U29" gate="G$1" pin="CH2"/>
<wire x1="114.3" y1="63.5" x2="104.14" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT2_CUR_V" class="0">
<segment>
<label x="114.3" y="60.96" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U29" gate="G$1" pin="CH3"/>
<wire x1="104.14" y1="60.96" x2="114.3" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT1_CUR_V" class="0">
<segment>
<label x="114.3" y="66.04" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U29" gate="G$1" pin="CH1"/>
<wire x1="104.14" y1="66.04" x2="114.3" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT3_4_CUR_REF" class="0">
<segment>
<wire x1="55.88" y1="109.22" x2="45.72" y2="109.22" width="0.1524" layer="91"/>
<wire x1="45.72" y1="109.22" x2="38.1" y2="109.22" width="0.1524" layer="91"/>
<label x="33.02" y="109.22" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<junction x="45.72" y="109.22"/>
<wire x1="38.1" y1="109.22" x2="33.02" y2="109.22" width="0.1524" layer="91"/>
<wire x1="45.72" y1="104.14" x2="45.72" y2="109.22" width="0.1524" layer="91"/>
<pinref part="C142" gate="G$1" pin="1"/>
<wire x1="38.1" y1="106.68" x2="38.1" y2="109.22" width="0.1524" layer="91"/>
<pinref part="U32" gate="G$1" pin="K"/>
<junction x="38.1" y="109.22"/>
<pinref part="R106" gate="G$1" pin="1"/>
<wire x1="45.72" y1="111.76" x2="45.72" y2="109.22" width="0.1524" layer="91"/>
<pinref part="U33" gate="G$1" pin="REFP"/>
<wire x1="73.66" y1="116.84" x2="60.96" y2="116.84" width="0.1524" layer="91"/>
<wire x1="60.96" y1="116.84" x2="55.88" y2="116.84" width="0.1524" layer="91"/>
<wire x1="55.88" y1="116.84" x2="55.88" y2="109.22" width="0.1524" layer="91"/>
<pinref part="C145" gate="G$1" pin="1"/>
<wire x1="60.96" y1="114.3" x2="60.96" y2="116.84" width="0.1524" layer="91"/>
<junction x="60.96" y="116.84"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="R103" gate="G$1" pin="2"/>
<pinref part="+P38" gate="1" pin="+3V3"/>
<wire x1="116.84" y1="40.64" x2="119.38" y2="40.64" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U29" gate="G$1" pin="+VBD"/>
<pinref part="C139" gate="G$1" pin="1"/>
<wire x1="73.66" y1="53.34" x2="63.5" y2="53.34" width="0.1524" layer="91"/>
<pinref part="+P71" gate="1" pin="+3V3"/>
<wire x1="63.5" y1="53.34" x2="58.42" y2="53.34" width="0.1524" layer="91"/>
<junction x="63.5" y="53.34"/>
</segment>
<segment>
<pinref part="R109" gate="G$1" pin="2"/>
<pinref part="+P26" gate="1" pin="+3V3"/>
<wire x1="116.84" y1="121.92" x2="119.38" y2="121.92" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U33" gate="G$1" pin="+VBD"/>
<pinref part="C147" gate="G$1" pin="1"/>
<wire x1="73.66" y1="134.62" x2="63.5" y2="134.62" width="0.1524" layer="91"/>
<pinref part="+P30" gate="1" pin="+3V3"/>
<wire x1="63.5" y1="134.62" x2="58.42" y2="134.62" width="0.1524" layer="91"/>
<junction x="63.5" y="134.62"/>
</segment>
<segment>
<pinref part="+P55" gate="1" pin="+3V3"/>
<wire x1="121.92" y1="228.6" x2="121.92" y2="226.06" width="0.1524" layer="91"/>
<pinref part="C162" gate="G$1" pin="1"/>
<pinref part="U38" gate="G$1" pin="VDD"/>
<wire x1="121.92" y1="226.06" x2="127" y2="226.06" width="0.1524" layer="91"/>
<junction x="121.92" y="226.06"/>
</segment>
<segment>
<pinref part="+P58" gate="1" pin="+3V3"/>
<wire x1="193.04" y1="228.6" x2="193.04" y2="226.06" width="0.1524" layer="91"/>
<pinref part="C164" gate="G$1" pin="1"/>
<pinref part="U40" gate="G$1" pin="VDD"/>
<wire x1="193.04" y1="226.06" x2="198.12" y2="226.06" width="0.1524" layer="91"/>
<junction x="193.04" y="226.06"/>
</segment>
<segment>
<pinref part="+P59" gate="1" pin="+3V3"/>
<wire x1="193.04" y1="254" x2="193.04" y2="251.46" width="0.1524" layer="91"/>
<pinref part="C165" gate="G$1" pin="1"/>
<pinref part="U41" gate="G$1" pin="VDD"/>
<wire x1="193.04" y1="251.46" x2="198.12" y2="251.46" width="0.1524" layer="91"/>
<junction x="193.04" y="251.46"/>
</segment>
<segment>
<pinref part="U39" gate="1" pin="VDD"/>
<wire x1="132.08" y1="251.46" x2="121.92" y2="251.46" width="0.1524" layer="91"/>
<pinref part="+P69" gate="1" pin="+3V3"/>
<pinref part="C163" gate="G$1" pin="1"/>
<junction x="121.92" y="251.46"/>
<wire x1="121.92" y1="251.46" x2="121.92" y2="254" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C133" gate="G$1" pin="1"/>
<pinref part="U27" gate="G$1" pin="VCC"/>
<wire x1="182.88" y1="43.18" x2="187.96" y2="43.18" width="0.1524" layer="91"/>
<pinref part="+P68" gate="1" pin="+3V3"/>
<wire x1="182.88" y1="43.18" x2="182.88" y2="45.72" width="0.1524" layer="91"/>
<junction x="182.88" y="43.18"/>
</segment>
<segment>
<pinref part="+P37" gate="1" pin="+3V3"/>
<pinref part="C132" gate="G$1" pin="1"/>
<wire x1="182.88" y1="91.44" x2="182.88" y2="88.9" width="0.1524" layer="91"/>
<pinref part="U26" gate="G$1" pin="VCC"/>
<wire x1="182.88" y1="88.9" x2="187.96" y2="88.9" width="0.1524" layer="91"/>
<junction x="182.88" y="88.9"/>
</segment>
<segment>
<pinref part="C141" gate="G$1" pin="1"/>
<pinref part="U31" gate="G$1" pin="VCC"/>
<wire x1="182.88" y1="134.62" x2="187.96" y2="134.62" width="0.1524" layer="91"/>
<pinref part="+P53" gate="1" pin="+3V3"/>
<wire x1="182.88" y1="134.62" x2="182.88" y2="137.16" width="0.1524" layer="91"/>
<junction x="182.88" y="134.62"/>
</segment>
<segment>
<pinref part="+P54" gate="1" pin="+3V3"/>
<pinref part="C140" gate="G$1" pin="1"/>
<wire x1="182.88" y1="182.88" x2="182.88" y2="180.34" width="0.1524" layer="91"/>
<pinref part="U30" gate="G$1" pin="VCC"/>
<wire x1="182.88" y1="180.34" x2="187.96" y2="180.34" width="0.1524" layer="91"/>
<junction x="182.88" y="180.34"/>
</segment>
<segment>
<pinref part="U36" gate="G$1" pin="VS"/>
<wire x1="314.96" y1="111.76" x2="307.34" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C148" gate="G$1" pin="1"/>
<pinref part="+P64" gate="1" pin="+3V3"/>
<wire x1="304.8" y1="111.76" x2="307.34" y2="111.76" width="0.1524" layer="91"/>
<junction x="307.34" y="111.76"/>
</segment>
<segment>
<pinref part="R115" gate="G$1" pin="2"/>
<wire x1="342.9" y1="121.92" x2="342.9" y2="124.46" width="0.1524" layer="91"/>
<wire x1="342.9" y1="124.46" x2="345.44" y2="124.46" width="0.1524" layer="91"/>
<pinref part="R116" gate="G$1" pin="2"/>
<wire x1="345.44" y1="124.46" x2="347.98" y2="124.46" width="0.1524" layer="91"/>
<wire x1="347.98" y1="124.46" x2="347.98" y2="121.92" width="0.1524" layer="91"/>
<pinref part="+P73" gate="1" pin="+3V3"/>
<wire x1="345.44" y1="124.46" x2="345.44" y2="127" width="0.1524" layer="91"/>
<junction x="345.44" y="124.46"/>
</segment>
</net>
<net name="MOT3_CUR_W" class="0">
<segment>
<label x="114.3" y="149.86" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U33" gate="G$1" pin="CH0"/>
<wire x1="114.3" y1="149.86" x2="104.14" y2="149.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT3_CUR_V" class="0">
<segment>
<label x="114.3" y="147.32" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U33" gate="G$1" pin="CH1"/>
<wire x1="104.14" y1="147.32" x2="114.3" y2="147.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT4_CUR_V" class="0">
<segment>
<label x="114.3" y="142.24" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U33" gate="G$1" pin="CH3"/>
<wire x1="104.14" y1="142.24" x2="114.3" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT4_CUR_U" class="0">
<segment>
<label x="114.3" y="144.78" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U33" gate="G$1" pin="CH2"/>
<wire x1="114.3" y1="144.78" x2="104.14" y2="144.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="ADC1_MISO" class="0">
<segment>
<label x="119.38" y="27.94" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R102" gate="G$1" pin="2"/>
<wire x1="114.3" y1="27.94" x2="119.38" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="ADC1_MOSI" class="0">
<segment>
<pinref part="U29" gate="G$1" pin="SDI"/>
<wire x1="104.14" y1="30.48" x2="119.38" y2="30.48" width="0.1524" layer="91"/>
<label x="119.38" y="30.48" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="ADC1_SCLK" class="0">
<segment>
<pinref part="U29" gate="G$1" pin="SCLK"/>
<wire x1="104.14" y1="33.02" x2="119.38" y2="33.02" width="0.1524" layer="91"/>
<label x="119.38" y="33.02" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="!ADC1_CS" class="0">
<segment>
<pinref part="U29" gate="G$1" pin="!CS"/>
<wire x1="104.14" y1="35.56" x2="106.68" y2="35.56" width="0.1524" layer="91"/>
<label x="119.38" y="35.56" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="106.68" y1="35.56" x2="119.38" y2="35.56" width="0.1524" layer="91"/>
<wire x1="106.68" y1="35.56" x2="106.68" y2="40.64" width="0.1524" layer="91"/>
<pinref part="R103" gate="G$1" pin="1"/>
<wire x1="106.68" y1="40.64" x2="109.22" y2="40.64" width="0.1524" layer="91"/>
<junction x="106.68" y="35.56"/>
</segment>
</net>
<net name="N$72" class="0">
<segment>
<pinref part="U29" gate="G$1" pin="AINP"/>
<wire x1="104.14" y1="53.34" x2="106.68" y2="53.34" width="0.1524" layer="91"/>
<wire x1="106.68" y1="53.34" x2="106.68" y2="55.88" width="0.1524" layer="91"/>
<pinref part="U29" gate="G$1" pin="MXO"/>
<wire x1="106.68" y1="55.88" x2="104.14" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT1_2_5V" class="0">
<segment>
<pinref part="R101" gate="G$1" pin="2"/>
<pinref part="U29" gate="G$1" pin="+VA"/>
<wire x1="53.34" y1="71.12" x2="53.34" y2="68.58" width="0.1524" layer="91"/>
<pinref part="C135" gate="G$1" pin="1"/>
<wire x1="53.34" y1="68.58" x2="58.42" y2="68.58" width="0.1524" layer="91"/>
<wire x1="58.42" y1="68.58" x2="63.5" y2="68.58" width="0.1524" layer="91"/>
<pinref part="C136" gate="G$1" pin="1"/>
<junction x="58.42" y="68.58"/>
<junction x="53.34" y="68.58"/>
<pinref part="C138" gate="G$1" pin="1"/>
<wire x1="63.5" y1="68.58" x2="73.66" y2="68.58" width="0.1524" layer="91"/>
<junction x="63.5" y="68.58"/>
<wire x1="53.34" y1="68.58" x2="48.26" y2="68.58" width="0.1524" layer="91"/>
<label x="48.26" y="68.58" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT1_CUR_W" class="0">
<segment>
<label x="114.3" y="68.58" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U29" gate="G$1" pin="CH0"/>
<wire x1="114.3" y1="68.58" x2="104.14" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$123" class="0">
<segment>
<pinref part="U29" gate="G$1" pin="SDO"/>
<pinref part="R102" gate="G$1" pin="1"/>
<wire x1="104.14" y1="27.94" x2="106.68" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$57" class="0">
<segment>
<pinref part="U33" gate="G$1" pin="AINP"/>
<wire x1="104.14" y1="134.62" x2="106.68" y2="134.62" width="0.1524" layer="91"/>
<wire x1="106.68" y1="134.62" x2="106.68" y2="137.16" width="0.1524" layer="91"/>
<pinref part="U33" gate="G$1" pin="MXO"/>
<wire x1="106.68" y1="137.16" x2="104.14" y2="137.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$134" class="0">
<segment>
<pinref part="U33" gate="G$1" pin="SDO"/>
<pinref part="R108" gate="G$1" pin="1"/>
<wire x1="104.14" y1="109.22" x2="106.68" y2="109.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!ADC2_CS" class="0">
<segment>
<pinref part="U33" gate="G$1" pin="!CS"/>
<wire x1="104.14" y1="116.84" x2="106.68" y2="116.84" width="0.1524" layer="91"/>
<label x="119.38" y="116.84" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="106.68" y1="116.84" x2="119.38" y2="116.84" width="0.1524" layer="91"/>
<wire x1="106.68" y1="116.84" x2="106.68" y2="121.92" width="0.1524" layer="91"/>
<pinref part="R109" gate="G$1" pin="1"/>
<wire x1="106.68" y1="121.92" x2="109.22" y2="121.92" width="0.1524" layer="91"/>
<junction x="106.68" y="116.84"/>
</segment>
</net>
<net name="ADC2_SCLK" class="0">
<segment>
<pinref part="U33" gate="G$1" pin="SCLK"/>
<wire x1="104.14" y1="114.3" x2="119.38" y2="114.3" width="0.1524" layer="91"/>
<label x="119.38" y="114.3" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="ADC2_MOSI" class="0">
<segment>
<pinref part="U33" gate="G$1" pin="SDI"/>
<wire x1="104.14" y1="111.76" x2="119.38" y2="111.76" width="0.1524" layer="91"/>
<label x="119.38" y="111.76" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="ADC2_MISO" class="0">
<segment>
<label x="119.38" y="109.22" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R108" gate="G$1" pin="2"/>
<wire x1="114.3" y1="109.22" x2="119.38" y2="109.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT3_4_5V" class="0">
<segment>
<pinref part="R107" gate="G$1" pin="2"/>
<pinref part="U33" gate="G$1" pin="+VA"/>
<wire x1="53.34" y1="152.4" x2="53.34" y2="149.86" width="0.1524" layer="91"/>
<pinref part="C143" gate="G$1" pin="1"/>
<wire x1="53.34" y1="149.86" x2="58.42" y2="149.86" width="0.1524" layer="91"/>
<wire x1="58.42" y1="149.86" x2="63.5" y2="149.86" width="0.1524" layer="91"/>
<pinref part="C144" gate="G$1" pin="1"/>
<junction x="58.42" y="149.86"/>
<junction x="53.34" y="149.86"/>
<pinref part="C146" gate="G$1" pin="1"/>
<wire x1="63.5" y1="149.86" x2="73.66" y2="149.86" width="0.1524" layer="91"/>
<junction x="63.5" y="149.86"/>
<wire x1="53.34" y1="149.86" x2="48.26" y2="149.86" width="0.1524" layer="91"/>
<label x="48.26" y="149.86" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT1_TEMP" class="0">
<segment>
<label x="157.48" y="226.06" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U38" gate="G$1" pin="OUT"/>
<wire x1="152.4" y1="226.06" x2="157.48" y2="226.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT3_TEMP" class="0">
<segment>
<label x="228.6" y="226.06" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U40" gate="G$1" pin="OUT"/>
<wire x1="223.52" y1="226.06" x2="228.6" y2="226.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT4_TEMP" class="0">
<segment>
<label x="228.6" y="251.46" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U41" gate="G$1" pin="OUT"/>
<wire x1="223.52" y1="251.46" x2="228.6" y2="251.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT2_TEMP" class="0">
<segment>
<pinref part="U39" gate="1" pin="VOUT"/>
<wire x1="147.32" y1="248.92" x2="157.48" y2="248.92" width="0.1524" layer="91"/>
<label x="157.48" y="248.92" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="+5V/3" class="0">
<segment>
<pinref part="RF4" gate="G$1" pin="1"/>
<wire x1="25.4" y1="254" x2="22.86" y2="254" width="0.1524" layer="91"/>
<pinref part="+P79" gate="1" pin="+5V/3"/>
</segment>
<segment>
<pinref part="CN17" gate="G$1" pin="4"/>
<wire x1="381" y1="167.64" x2="378.46" y2="167.64" width="0.1524" layer="91"/>
<wire x1="378.46" y1="180.34" x2="378.46" y2="167.64" width="0.1524" layer="91"/>
<pinref part="+P81" gate="1" pin="+5V/3"/>
</segment>
<segment>
<pinref part="R119" gate="G$1" pin="2"/>
<wire x1="327.66" y1="170.18" x2="327.66" y2="172.72" width="0.1524" layer="91"/>
<wire x1="327.66" y1="172.72" x2="335.28" y2="172.72" width="0.1524" layer="91"/>
<pinref part="R121" gate="G$1" pin="2"/>
<wire x1="335.28" y1="172.72" x2="342.9" y2="172.72" width="0.1524" layer="91"/>
<wire x1="342.9" y1="172.72" x2="342.9" y2="170.18" width="0.1524" layer="91"/>
<pinref part="R120" gate="G$1" pin="2"/>
<wire x1="335.28" y1="170.18" x2="335.28" y2="172.72" width="0.1524" layer="91"/>
<wire x1="335.28" y1="172.72" x2="335.28" y2="175.26" width="0.1524" layer="91"/>
<junction x="335.28" y="172.72"/>
<pinref part="+P65" gate="1" pin="+5V/3"/>
</segment>
</net>
<net name="N$143" class="0">
<segment>
<pinref part="U35" gate="G$1" pin="OUT"/>
<wire x1="35.56" y1="254" x2="38.1" y2="254" width="0.1524" layer="91"/>
<pinref part="RF4" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$145" class="0">
<segment>
<pinref part="U35" gate="G$1" pin="R1"/>
<pinref part="R113" gate="G$1" pin="1"/>
<wire x1="60.96" y1="248.92" x2="58.42" y2="248.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT3_4_5_EN_SENSOR" class="0">
<segment>
<pinref part="U35" gate="G$1" pin="EN"/>
<wire x1="58.42" y1="243.84" x2="60.96" y2="243.84" width="0.1524" layer="91"/>
<label x="68.58" y="243.84" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R112" gate="G$1" pin="2"/>
<wire x1="60.96" y1="243.84" x2="68.58" y2="243.84" width="0.1524" layer="91"/>
<wire x1="60.96" y1="241.3" x2="60.96" y2="243.84" width="0.1524" layer="91"/>
<junction x="60.96" y="243.84"/>
</segment>
</net>
<net name="+5V/2" class="0">
<segment>
<pinref part="RF3" gate="G$1" pin="1"/>
<pinref part="+P77" gate="1" pin="+5V/2"/>
<wire x1="25.4" y1="218.44" x2="22.86" y2="218.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$142" class="0">
<segment>
<pinref part="RF3" gate="G$1" pin="2"/>
<pinref part="U34" gate="G$1" pin="OUT"/>
<wire x1="35.56" y1="218.44" x2="38.1" y2="218.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$144" class="0">
<segment>
<pinref part="U34" gate="G$1" pin="R1"/>
<pinref part="R111" gate="G$1" pin="1"/>
<wire x1="60.96" y1="213.36" x2="58.42" y2="213.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT1_2_EN_SENSOR" class="0">
<segment>
<pinref part="U34" gate="G$1" pin="EN"/>
<wire x1="58.42" y1="208.28" x2="60.96" y2="208.28" width="0.1524" layer="91"/>
<label x="68.58" y="208.28" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R110" gate="G$1" pin="2"/>
<wire x1="60.96" y1="208.28" x2="68.58" y2="208.28" width="0.1524" layer="91"/>
<wire x1="60.96" y1="205.74" x2="60.96" y2="208.28" width="0.1524" layer="91"/>
<junction x="60.96" y="208.28"/>
</segment>
</net>
<net name="!MOT1_HU_5" class="0">
<segment>
<label x="213.36" y="63.5" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U26" gate="G$1" pin="G"/>
<wire x1="208.28" y1="63.5" x2="213.36" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!MOT1_HV_5" class="0">
<segment>
<label x="213.36" y="60.96" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U26" gate="G$1" pin="H"/>
<wire x1="208.28" y1="60.96" x2="213.36" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!MOT1_HW_5" class="0">
<segment>
<label x="213.36" y="66.04" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U26" gate="G$1" pin="F"/>
<wire x1="208.28" y1="66.04" x2="213.36" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VCC/1" class="0">
<segment>
<pinref part="R99" gate="G$1" pin="2"/>
<wire x1="228.6" y1="48.26" x2="231.14" y2="48.26" width="0.1524" layer="91"/>
<pinref part="P+8" gate="G$1" pin="VCC/1"/>
</segment>
</net>
<net name="MOT1_B_5" class="0">
<segment>
<wire x1="213.36" y1="78.74" x2="208.28" y2="78.74" width="0.1524" layer="91"/>
<label x="213.36" y="78.74" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U26" gate="G$1" pin="A"/>
</segment>
</net>
<net name="MOT1_A_5" class="0">
<segment>
<wire x1="213.36" y1="76.2" x2="208.28" y2="76.2" width="0.1524" layer="91"/>
<label x="213.36" y="76.2" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U26" gate="G$1" pin="B"/>
</segment>
</net>
<net name="MOT2_B_5" class="0">
<segment>
<wire x1="213.36" y1="22.86" x2="208.28" y2="22.86" width="0.1524" layer="91"/>
<label x="213.36" y="22.86" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U27" gate="G$1" pin="E"/>
</segment>
</net>
<net name="MOT2_A_5" class="0">
<segment>
<wire x1="213.36" y1="20.32" x2="208.28" y2="20.32" width="0.1524" layer="91"/>
<label x="213.36" y="20.32" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U27" gate="G$1" pin="F"/>
</segment>
</net>
<net name="!MOT2_HU_5" class="0">
<segment>
<label x="213.36" y="27.94" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U27" gate="G$1" pin="C"/>
<wire x1="208.28" y1="27.94" x2="213.36" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!MOT2_HV_5" class="0">
<segment>
<label x="213.36" y="30.48" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U27" gate="G$1" pin="B"/>
<wire x1="208.28" y1="30.48" x2="213.36" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!MOT2_HW_5" class="0">
<segment>
<label x="213.36" y="25.4" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U27" gate="G$1" pin="D"/>
<wire x1="208.28" y1="25.4" x2="213.36" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!MOT5_HU_5" class="0">
<segment>
<wire x1="208.28" y1="109.22" x2="213.36" y2="109.22" width="0.1524" layer="91"/>
<label x="213.36" y="109.22" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U31" gate="G$1" pin="G"/>
</segment>
<segment>
<pinref part="CN17" gate="G$1" pin="6"/>
<wire x1="381" y1="162.56" x2="373.38" y2="162.56" width="0.1524" layer="91"/>
<label x="373.38" y="162.56" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<label x="325.12" y="160.02" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="327.66" y1="160.02" x2="325.12" y2="160.02" width="0.1524" layer="91"/>
<wire x1="327.66" y1="160.02" x2="327.66" y2="162.56" width="0.1524" layer="91"/>
<pinref part="R119" gate="G$1" pin="1"/>
</segment>
</net>
<net name="!MOT5_HV_5" class="0">
<segment>
<wire x1="208.28" y1="106.68" x2="213.36" y2="106.68" width="0.1524" layer="91"/>
<label x="213.36" y="106.68" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U31" gate="G$1" pin="H"/>
</segment>
<segment>
<pinref part="CN17" gate="G$1" pin="7"/>
<wire x1="373.38" y1="160.02" x2="381" y2="160.02" width="0.1524" layer="91"/>
<label x="373.38" y="160.02" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="325.12" y1="157.48" x2="335.28" y2="157.48" width="0.1524" layer="91"/>
<label x="325.12" y="157.48" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="335.28" y1="157.48" x2="335.28" y2="162.56" width="0.1524" layer="91"/>
<pinref part="R120" gate="G$1" pin="1"/>
</segment>
</net>
<net name="!MOT5_HW_5" class="0">
<segment>
<wire x1="208.28" y1="116.84" x2="213.36" y2="116.84" width="0.1524" layer="91"/>
<label x="213.36" y="116.84" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U31" gate="G$1" pin="D"/>
</segment>
<segment>
<pinref part="CN17" gate="G$1" pin="8"/>
<wire x1="381" y1="157.48" x2="373.38" y2="157.48" width="0.1524" layer="91"/>
<label x="373.38" y="157.48" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<label x="325.12" y="154.94" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="342.9" y1="154.94" x2="325.12" y2="154.94" width="0.1524" layer="91"/>
<wire x1="342.9" y1="154.94" x2="342.9" y2="162.56" width="0.1524" layer="91"/>
<pinref part="R121" gate="G$1" pin="1"/>
</segment>
</net>
<net name="VCC/2" class="0">
<segment>
<pinref part="R104" gate="G$1" pin="1"/>
<wire x1="210.82" y1="193.04" x2="208.28" y2="193.04" width="0.1524" layer="91"/>
<pinref part="P+9" gate="G$1" pin="VCC/2"/>
</segment>
<segment>
<pinref part="R114" gate="G$1" pin="1"/>
<pinref part="U36" gate="G$1" pin="VIN+"/>
<wire x1="309.88" y1="134.62" x2="312.42" y2="134.62" width="0.1524" layer="91"/>
<wire x1="312.42" y1="134.62" x2="320.04" y2="134.62" width="0.1524" layer="91"/>
<wire x1="314.96" y1="119.38" x2="312.42" y2="119.38" width="0.1524" layer="91"/>
<wire x1="312.42" y1="119.38" x2="312.42" y2="134.62" width="0.1524" layer="91"/>
<junction x="312.42" y="134.62"/>
<pinref part="P+7" gate="G$1" pin="VCC/2"/>
</segment>
</net>
<net name="!MOT3_HU_5" class="0">
<segment>
<label x="213.36" y="154.94" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U30" gate="G$1" pin="G"/>
<wire x1="208.28" y1="154.94" x2="213.36" y2="154.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!MOT3_HV_5" class="0">
<segment>
<label x="213.36" y="152.4" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U30" gate="G$1" pin="H"/>
<wire x1="208.28" y1="152.4" x2="213.36" y2="152.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!MOT3_HW_5" class="0">
<segment>
<label x="213.36" y="157.48" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U30" gate="G$1" pin="F"/>
<wire x1="208.28" y1="157.48" x2="213.36" y2="157.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!MOT4_HU_5" class="0">
<segment>
<label x="213.36" y="121.92" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="208.28" y1="121.92" x2="213.36" y2="121.92" width="0.1524" layer="91"/>
<pinref part="U31" gate="G$1" pin="B"/>
</segment>
</net>
<net name="!MOT4_HW_5" class="0">
<segment>
<wire x1="213.36" y1="119.38" x2="208.28" y2="119.38" width="0.1524" layer="91"/>
<label x="213.36" y="119.38" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U31" gate="G$1" pin="C"/>
</segment>
</net>
<net name="!MOT4_HV_5" class="0">
<segment>
<wire x1="213.36" y1="124.46" x2="208.28" y2="124.46" width="0.1524" layer="91"/>
<label x="213.36" y="124.46" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U31" gate="G$1" pin="A"/>
</segment>
</net>
<net name="!MOT1_2_DO" class="0">
<segment>
<label x="177.8" y="15.24" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U27" gate="G$1" pin="!QH"/>
<wire x1="177.8" y1="15.24" x2="187.96" y2="15.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$136" class="0">
<segment>
<pinref part="U26" gate="G$1" pin="QH"/>
<wire x1="187.96" y1="63.5" x2="185.42" y2="63.5" width="0.1524" layer="91"/>
<wire x1="185.42" y1="63.5" x2="185.42" y2="50.8" width="0.1524" layer="91"/>
<wire x1="185.42" y1="50.8" x2="210.82" y2="50.8" width="0.1524" layer="91"/>
<wire x1="210.82" y1="50.8" x2="210.82" y2="43.18" width="0.1524" layer="91"/>
<pinref part="U27" gate="G$1" pin="SI"/>
<wire x1="210.82" y1="43.18" x2="208.28" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT1_2_CLK" class="0">
<segment>
<wire x1="177.8" y1="71.12" x2="187.96" y2="71.12" width="0.1524" layer="91"/>
<label x="177.8" y="71.12" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U26" gate="G$1" pin="CK"/>
</segment>
<segment>
<wire x1="177.8" y1="25.4" x2="187.96" y2="25.4" width="0.1524" layer="91"/>
<label x="177.8" y="25.4" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U27" gate="G$1" pin="CK"/>
</segment>
</net>
<net name="!MOT1_2_LATCH" class="0">
<segment>
<wire x1="187.96" y1="73.66" x2="177.8" y2="73.66" width="0.1524" layer="91"/>
<label x="177.8" y="73.66" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U26" gate="G$1" pin="S/!L"/>
</segment>
<segment>
<wire x1="187.96" y1="27.94" x2="177.8" y2="27.94" width="0.1524" layer="91"/>
<label x="177.8" y="27.94" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U27" gate="G$1" pin="S/!L"/>
</segment>
</net>
<net name="MOT3_B_5" class="0">
<segment>
<wire x1="213.36" y1="170.18" x2="208.28" y2="170.18" width="0.1524" layer="91"/>
<label x="213.36" y="170.18" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U30" gate="G$1" pin="A"/>
</segment>
</net>
<net name="MOT3_A_5" class="0">
<segment>
<wire x1="213.36" y1="167.64" x2="208.28" y2="167.64" width="0.1524" layer="91"/>
<label x="213.36" y="167.64" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U30" gate="G$1" pin="B"/>
</segment>
</net>
<net name="MOT4_B_5" class="0">
<segment>
<wire x1="213.36" y1="114.3" x2="208.28" y2="114.3" width="0.1524" layer="91"/>
<label x="213.36" y="114.3" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U31" gate="G$1" pin="E"/>
</segment>
</net>
<net name="MOT4_A_5" class="0">
<segment>
<wire x1="213.36" y1="111.76" x2="208.28" y2="111.76" width="0.1524" layer="91"/>
<label x="213.36" y="111.76" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U31" gate="G$1" pin="F"/>
</segment>
</net>
<net name="N$137" class="0">
<segment>
<pinref part="U30" gate="G$1" pin="QH"/>
<wire x1="187.96" y1="154.94" x2="185.42" y2="154.94" width="0.1524" layer="91"/>
<wire x1="185.42" y1="154.94" x2="185.42" y2="142.24" width="0.1524" layer="91"/>
<wire x1="185.42" y1="142.24" x2="210.82" y2="142.24" width="0.1524" layer="91"/>
<wire x1="210.82" y1="142.24" x2="210.82" y2="134.62" width="0.1524" layer="91"/>
<pinref part="U31" gate="G$1" pin="SI"/>
<wire x1="210.82" y1="134.62" x2="208.28" y2="134.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!MOT3_4_5_LATCH" class="0">
<segment>
<wire x1="187.96" y1="165.1" x2="177.8" y2="165.1" width="0.1524" layer="91"/>
<label x="177.8" y="165.1" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U30" gate="G$1" pin="S/!L"/>
</segment>
<segment>
<wire x1="187.96" y1="119.38" x2="177.8" y2="119.38" width="0.1524" layer="91"/>
<label x="177.8" y="119.38" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U31" gate="G$1" pin="S/!L"/>
</segment>
</net>
<net name="MOT3_4_5_CLK" class="0">
<segment>
<wire x1="177.8" y1="162.56" x2="187.96" y2="162.56" width="0.1524" layer="91"/>
<label x="177.8" y="162.56" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U30" gate="G$1" pin="CK"/>
</segment>
<segment>
<wire x1="177.8" y1="116.84" x2="187.96" y2="116.84" width="0.1524" layer="91"/>
<label x="177.8" y="116.84" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U31" gate="G$1" pin="CK"/>
</segment>
</net>
<net name="!MOT3_4_5_DO" class="0">
<segment>
<label x="177.8" y="106.68" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U31" gate="G$1" pin="!QH"/>
<wire x1="177.8" y1="106.68" x2="187.96" y2="106.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="U27" gate="G$1" pin="A"/>
<wire x1="208.28" y1="33.02" x2="213.36" y2="33.02" width="0.1524" layer="91"/>
<wire x1="213.36" y1="33.02" x2="213.36" y2="48.26" width="0.1524" layer="91"/>
<pinref part="R99" gate="G$1" pin="1"/>
<wire x1="213.36" y1="48.26" x2="218.44" y2="48.26" width="0.1524" layer="91"/>
<pinref part="R98" gate="G$1" pin="2"/>
<wire x1="218.44" y1="48.26" x2="220.98" y2="48.26" width="0.1524" layer="91"/>
<wire x1="218.44" y1="48.26" x2="218.44" y2="45.72" width="0.1524" layer="91"/>
<junction x="218.44" y="48.26"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<pinref part="R104" gate="G$1" pin="2"/>
<pinref part="R105" gate="G$1" pin="2"/>
<wire x1="218.44" y1="193.04" x2="220.98" y2="193.04" width="0.1524" layer="91"/>
<pinref part="U30" gate="G$1" pin="E"/>
<wire x1="220.98" y1="193.04" x2="220.98" y2="190.5" width="0.1524" layer="91"/>
<wire x1="208.28" y1="160.02" x2="228.6" y2="160.02" width="0.1524" layer="91"/>
<wire x1="228.6" y1="160.02" x2="228.6" y2="193.04" width="0.1524" layer="91"/>
<wire x1="228.6" y1="193.04" x2="220.98" y2="193.04" width="0.1524" layer="91"/>
<junction x="220.98" y="193.04"/>
</segment>
</net>
<net name="+12V" class="0">
<segment>
<pinref part="U37" gate="G$1" pin="GVDD_C"/>
<wire x1="302.26" y1="78.74" x2="299.72" y2="78.74" width="0.1524" layer="91"/>
<wire x1="299.72" y1="78.74" x2="299.72" y2="81.28" width="0.1524" layer="91"/>
<pinref part="U37" gate="G$1" pin="VDD"/>
<wire x1="299.72" y1="81.28" x2="299.72" y2="83.82" width="0.1524" layer="91"/>
<wire x1="299.72" y1="83.82" x2="299.72" y2="86.36" width="0.1524" layer="91"/>
<wire x1="299.72" y1="86.36" x2="302.26" y2="86.36" width="0.1524" layer="91"/>
<pinref part="U37" gate="G$1" pin="GVDD_A"/>
<wire x1="302.26" y1="83.82" x2="299.72" y2="83.82" width="0.1524" layer="91"/>
<pinref part="U37" gate="G$1" pin="GVDD_B"/>
<wire x1="302.26" y1="81.28" x2="299.72" y2="81.28" width="0.1524" layer="91"/>
<wire x1="299.72" y1="86.36" x2="292.1" y2="86.36" width="0.1524" layer="91"/>
<junction x="299.72" y="86.36"/>
<junction x="299.72" y="83.82"/>
<junction x="299.72" y="81.28"/>
<pinref part="C154" gate="G$1" pin="1"/>
<wire x1="292.1" y1="86.36" x2="287.02" y2="86.36" width="0.1524" layer="91"/>
<wire x1="287.02" y1="86.36" x2="281.94" y2="86.36" width="0.1524" layer="91"/>
<wire x1="281.94" y1="86.36" x2="276.86" y2="86.36" width="0.1524" layer="91"/>
<wire x1="276.86" y1="86.36" x2="269.24" y2="86.36" width="0.1524" layer="91"/>
<wire x1="269.24" y1="86.36" x2="264.16" y2="86.36" width="0.1524" layer="91"/>
<wire x1="292.1" y1="83.82" x2="292.1" y2="86.36" width="0.1524" layer="91"/>
<pinref part="C152" gate="G$1" pin="1"/>
<wire x1="287.02" y1="83.82" x2="287.02" y2="86.36" width="0.1524" layer="91"/>
<pinref part="C151" gate="G$1" pin="1"/>
<wire x1="281.94" y1="83.82" x2="281.94" y2="86.36" width="0.1524" layer="91"/>
<pinref part="C150" gate="G$1" pin="1"/>
<wire x1="276.86" y1="83.82" x2="276.86" y2="86.36" width="0.1524" layer="91"/>
<junction x="276.86" y="86.36"/>
<junction x="281.94" y="86.36"/>
<junction x="287.02" y="86.36"/>
<junction x="292.1" y="86.36"/>
<pinref part="C149" gate="G$1" pin="P"/>
<wire x1="269.24" y1="83.82" x2="269.24" y2="86.36" width="0.1524" layer="91"/>
<junction x="269.24" y="86.36"/>
<pinref part="+P63" gate="1" pin="+12V"/>
</segment>
</net>
<net name="N$121" class="0">
<segment>
<pinref part="U37" gate="G$1" pin="BST_A"/>
<pinref part="C155" gate="G$1" pin="1"/>
<wire x1="347.98" y1="71.12" x2="350.52" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$122" class="0">
<segment>
<pinref part="U37" gate="G$1" pin="BST_B"/>
<pinref part="C156" gate="G$1" pin="1"/>
<wire x1="347.98" y1="53.34" x2="350.52" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$124" class="0">
<segment>
<pinref part="U37" gate="G$1" pin="BST_C"/>
<pinref part="C157" gate="G$1" pin="1"/>
<wire x1="347.98" y1="35.56" x2="350.52" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$125" class="0">
<segment>
<pinref part="U37" gate="G$1" pin="VREG"/>
<wire x1="302.26" y1="71.12" x2="299.72" y2="71.12" width="0.1524" layer="91"/>
<pinref part="C153" gate="G$1" pin="1"/>
<wire x1="299.72" y1="71.12" x2="287.02" y2="71.12" width="0.1524" layer="91"/>
<wire x1="287.02" y1="71.12" x2="287.02" y2="68.58" width="0.1524" layer="91"/>
<pinref part="U37" gate="G$1" pin="M3"/>
<wire x1="302.26" y1="58.42" x2="299.72" y2="58.42" width="0.1524" layer="91"/>
<wire x1="299.72" y1="58.42" x2="299.72" y2="63.5" width="0.1524" layer="91"/>
<junction x="299.72" y="71.12"/>
<pinref part="U37" gate="G$1" pin="M1"/>
<wire x1="299.72" y1="63.5" x2="299.72" y2="71.12" width="0.1524" layer="91"/>
<wire x1="302.26" y1="63.5" x2="299.72" y2="63.5" width="0.1524" layer="91"/>
<junction x="299.72" y="63.5"/>
</segment>
</net>
<net name="N$126" class="0">
<segment>
<pinref part="RA11" gate="C" pin="2"/>
<pinref part="U37" gate="G$1" pin="!RESET_C"/>
<wire x1="297.18" y1="33.02" x2="302.26" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$127" class="0">
<segment>
<pinref part="U37" gate="G$1" pin="!RESET_B"/>
<pinref part="RA11" gate="B" pin="2"/>
<wire x1="302.26" y1="35.56" x2="297.18" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$128" class="0">
<segment>
<pinref part="RA10" gate="D" pin="2"/>
<pinref part="U37" gate="G$1" pin="!RESET_A"/>
<wire x1="297.18" y1="38.1" x2="302.26" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$129" class="0">
<segment>
<pinref part="U37" gate="G$1" pin="PWM_C"/>
<pinref part="RA11" gate="D" pin="2"/>
<wire x1="302.26" y1="40.64" x2="297.18" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$130" class="0">
<segment>
<pinref part="RA11" gate="A" pin="2"/>
<pinref part="U37" gate="G$1" pin="PWM_B"/>
<wire x1="297.18" y1="43.18" x2="302.26" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$131" class="0">
<segment>
<pinref part="U37" gate="G$1" pin="PWM_A"/>
<pinref part="RA10" gate="C" pin="2"/>
<wire x1="302.26" y1="45.72" x2="297.18" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$132" class="0">
<segment>
<pinref part="RA10" gate="B" pin="2"/>
<pinref part="U37" gate="G$1" pin="!FAULT"/>
<wire x1="297.18" y1="50.8" x2="302.26" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$133" class="0">
<segment>
<pinref part="U37" gate="G$1" pin="!OTW"/>
<pinref part="RA10" gate="A" pin="2"/>
<wire x1="302.26" y1="53.34" x2="297.18" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MOT5_GND" class="0">
<segment>
<pinref part="C153" gate="G$1" pin="2"/>
<wire x1="287.02" y1="60.96" x2="287.02" y2="58.42" width="0.1524" layer="91"/>
<wire x1="287.02" y1="58.42" x2="284.48" y2="58.42" width="0.1524" layer="91"/>
<label x="284.48" y="58.42" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="297.18" y1="60.96" x2="297.18" y2="58.42" width="0.1524" layer="91"/>
<wire x1="297.18" y1="58.42" x2="287.02" y2="58.42" width="0.1524" layer="91"/>
<pinref part="U37" gate="G$1" pin="M2"/>
<wire x1="302.26" y1="60.96" x2="297.18" y2="60.96" width="0.1524" layer="91"/>
<junction x="287.02" y="58.42"/>
</segment>
<segment>
<pinref part="R117" gate="G$1" pin="1"/>
<wire x1="294.64" y1="27.94" x2="289.56" y2="27.94" width="0.1524" layer="91"/>
<label x="289.56" y="27.94" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="R118" gate="G$1" pin="2"/>
<wire x1="320.04" y1="20.32" x2="314.96" y2="20.32" width="0.1524" layer="91"/>
<wire x1="320.04" y1="20.32" x2="320.04" y2="22.86" width="0.1524" layer="91"/>
<junction x="320.04" y="20.32"/>
<label x="314.96" y="20.32" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U37" gate="G$1" pin="AGND"/>
</segment>
</net>
<net name="!MOT5_OTW" class="0">
<segment>
<pinref part="RA10" gate="A" pin="1"/>
<wire x1="284.48" y1="53.34" x2="289.56" y2="53.34" width="0.1524" layer="91"/>
<label x="284.48" y="53.34" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="!MOT5_FAULT" class="0">
<segment>
<pinref part="RA10" gate="B" pin="1"/>
<wire x1="284.48" y1="50.8" x2="289.56" y2="50.8" width="0.1524" layer="91"/>
<label x="284.48" y="50.8" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT5_PWM_A" class="0">
<segment>
<pinref part="RA10" gate="C" pin="1"/>
<wire x1="289.56" y1="45.72" x2="284.48" y2="45.72" width="0.1524" layer="91"/>
<label x="284.48" y="45.72" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT5_PWM_B" class="0">
<segment>
<pinref part="RA11" gate="A" pin="1"/>
<wire x1="284.48" y1="43.18" x2="289.56" y2="43.18" width="0.1524" layer="91"/>
<label x="284.48" y="43.18" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT5_PWM_C" class="0">
<segment>
<pinref part="RA11" gate="D" pin="1"/>
<wire x1="289.56" y1="40.64" x2="284.48" y2="40.64" width="0.1524" layer="91"/>
<label x="284.48" y="40.64" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="!MOT5_RESET_A" class="0">
<segment>
<pinref part="RA10" gate="D" pin="1"/>
<wire x1="284.48" y1="38.1" x2="289.56" y2="38.1" width="0.1524" layer="91"/>
<label x="284.48" y="38.1" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="!MOT5_RESET_C" class="0">
<segment>
<pinref part="RA11" gate="C" pin="1"/>
<wire x1="284.48" y1="33.02" x2="289.56" y2="33.02" width="0.1524" layer="91"/>
<label x="284.48" y="33.02" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="!MOT5_RESET_B" class="0">
<segment>
<pinref part="RA11" gate="B" pin="1"/>
<wire x1="289.56" y1="35.56" x2="284.48" y2="35.56" width="0.1524" layer="91"/>
<label x="284.48" y="35.56" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT5_OUT_U" class="0">
<segment>
<label x="365.76" y="66.04" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U37" gate="G$1" pin="OUT_A"/>
<pinref part="C155" gate="G$1" pin="2"/>
<wire x1="358.14" y1="71.12" x2="360.68" y2="71.12" width="0.1524" layer="91"/>
<wire x1="360.68" y1="71.12" x2="360.68" y2="66.04" width="0.1524" layer="91"/>
<wire x1="360.68" y1="66.04" x2="347.98" y2="66.04" width="0.1524" layer="91"/>
<wire x1="360.68" y1="66.04" x2="365.76" y2="66.04" width="0.1524" layer="91"/>
<junction x="360.68" y="66.04"/>
</segment>
<segment>
<pinref part="CN17" gate="G$1" pin="1"/>
<wire x1="381" y1="175.26" x2="373.38" y2="175.26" width="0.1524" layer="91"/>
<label x="373.38" y="175.26" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT5_OUT_V" class="0">
<segment>
<label x="365.76" y="48.26" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="C156" gate="G$1" pin="2"/>
<wire x1="358.14" y1="53.34" x2="360.68" y2="53.34" width="0.1524" layer="91"/>
<wire x1="360.68" y1="53.34" x2="360.68" y2="48.26" width="0.1524" layer="91"/>
<pinref part="U37" gate="G$1" pin="OUT_B"/>
<wire x1="360.68" y1="48.26" x2="347.98" y2="48.26" width="0.1524" layer="91"/>
<wire x1="360.68" y1="48.26" x2="365.76" y2="48.26" width="0.1524" layer="91"/>
<junction x="360.68" y="48.26"/>
</segment>
<segment>
<pinref part="CN17" gate="G$1" pin="2"/>
<wire x1="373.38" y1="172.72" x2="381" y2="172.72" width="0.1524" layer="91"/>
<label x="373.38" y="172.72" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="MOT5_OUT_W" class="0">
<segment>
<label x="365.76" y="30.48" size="1.27" layer="95" font="vector" xref="yes"/>
<wire x1="360.68" y1="30.48" x2="365.76" y2="30.48" width="0.1524" layer="91"/>
<pinref part="C157" gate="G$1" pin="2"/>
<wire x1="358.14" y1="35.56" x2="360.68" y2="35.56" width="0.1524" layer="91"/>
<wire x1="360.68" y1="35.56" x2="360.68" y2="30.48" width="0.1524" layer="91"/>
<pinref part="U37" gate="G$1" pin="OUT_C"/>
<wire x1="360.68" y1="30.48" x2="347.98" y2="30.48" width="0.1524" layer="91"/>
<junction x="360.68" y="30.48"/>
</segment>
<segment>
<pinref part="CN17" gate="G$1" pin="3"/>
<wire x1="381" y1="170.18" x2="373.38" y2="170.18" width="0.1524" layer="91"/>
<label x="373.38" y="170.18" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="N$120" class="0">
<segment>
<pinref part="U37" gate="G$1" pin="OC_ADJ"/>
<pinref part="R117" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$135" class="0">
<segment>
<pinref part="U36" gate="G$1" pin="VIN-"/>
<wire x1="335.28" y1="119.38" x2="337.82" y2="119.38" width="0.1524" layer="91"/>
<wire x1="337.82" y1="119.38" x2="337.82" y2="134.62" width="0.1524" layer="91"/>
<pinref part="R114" gate="G$1" pin="2"/>
<wire x1="337.82" y1="134.62" x2="327.66" y2="134.62" width="0.1524" layer="91"/>
<junction x="337.82" y="134.62"/>
<wire x1="337.82" y1="134.62" x2="388.62" y2="134.62" width="0.1524" layer="91"/>
<wire x1="388.62" y1="134.62" x2="388.62" y2="86.36" width="0.1524" layer="91"/>
<pinref part="U37" gate="G$1" pin="PVDD_A"/>
<wire x1="347.98" y1="86.36" x2="350.52" y2="86.36" width="0.1524" layer="91"/>
<wire x1="350.52" y1="86.36" x2="365.76" y2="86.36" width="0.1524" layer="91"/>
<wire x1="365.76" y1="86.36" x2="370.84" y2="86.36" width="0.1524" layer="91"/>
<wire x1="370.84" y1="86.36" x2="375.92" y2="86.36" width="0.1524" layer="91"/>
<wire x1="375.92" y1="86.36" x2="383.54" y2="86.36" width="0.1524" layer="91"/>
<pinref part="U37" gate="G$1" pin="PVDD_B"/>
<wire x1="347.98" y1="83.82" x2="350.52" y2="83.82" width="0.1524" layer="91"/>
<wire x1="350.52" y1="83.82" x2="350.52" y2="86.36" width="0.1524" layer="91"/>
<pinref part="U37" gate="G$1" pin="PVDD_C"/>
<wire x1="347.98" y1="81.28" x2="350.52" y2="81.28" width="0.1524" layer="91"/>
<wire x1="350.52" y1="81.28" x2="350.52" y2="83.82" width="0.1524" layer="91"/>
<junction x="350.52" y="83.82"/>
<junction x="350.52" y="86.36"/>
<pinref part="C160" gate="G$1" pin="1"/>
<wire x1="375.92" y1="83.82" x2="375.92" y2="86.36" width="0.1524" layer="91"/>
<pinref part="C161" gate="G$1" pin="P"/>
<wire x1="383.54" y1="83.82" x2="383.54" y2="86.36" width="0.1524" layer="91"/>
<junction x="375.92" y="86.36"/>
<pinref part="C159" gate="G$1" pin="1"/>
<wire x1="370.84" y1="83.82" x2="370.84" y2="86.36" width="0.1524" layer="91"/>
<pinref part="C158" gate="G$1" pin="1"/>
<wire x1="365.76" y1="83.82" x2="365.76" y2="86.36" width="0.1524" layer="91"/>
<junction x="365.76" y="86.36"/>
<junction x="370.84" y="86.36"/>
<wire x1="388.62" y1="86.36" x2="383.54" y2="86.36" width="0.1524" layer="91"/>
<junction x="383.54" y="86.36"/>
</segment>
</net>
<net name="MOT5_CUR_SCL" class="0">
<segment>
<pinref part="U36" gate="G$1" pin="SCL"/>
<wire x1="335.28" y1="111.76" x2="342.9" y2="111.76" width="0.1524" layer="91"/>
<pinref part="R115" gate="G$1" pin="1"/>
<wire x1="342.9" y1="111.76" x2="353.06" y2="111.76" width="0.1524" layer="91"/>
<wire x1="342.9" y1="114.3" x2="342.9" y2="111.76" width="0.1524" layer="91"/>
<label x="353.06" y="111.76" size="1.27" layer="95" font="vector" xref="yes"/>
<junction x="342.9" y="111.76"/>
</segment>
</net>
<net name="MOT5_CUR_SDA" class="0">
<segment>
<pinref part="U36" gate="G$1" pin="SDA"/>
<wire x1="335.28" y1="109.22" x2="347.98" y2="109.22" width="0.1524" layer="91"/>
<pinref part="R116" gate="G$1" pin="1"/>
<wire x1="347.98" y1="109.22" x2="353.06" y2="109.22" width="0.1524" layer="91"/>
<wire x1="347.98" y1="114.3" x2="347.98" y2="109.22" width="0.1524" layer="91"/>
<label x="353.06" y="109.22" size="1.27" layer="95" font="vector" xref="yes"/>
<junction x="347.98" y="109.22"/>
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
