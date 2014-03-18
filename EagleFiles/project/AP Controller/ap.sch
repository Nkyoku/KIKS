<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.0">
<drawing>
<settings>
<setting alwaysvectorfont="yes"/>
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
<package name="USB-MINIB-SMT">
<wire x1="-6.35" y1="3.8" x2="2.55" y2="3.8" width="0.127" layer="21"/>
<wire x1="2.55" y1="3.8" x2="2.55" y2="2.54" width="0.127" layer="21"/>
<wire x1="2.55" y1="2.54" x2="2.19" y2="2.18" width="0.127" layer="21" curve="-90"/>
<wire x1="2.19" y1="2.18" x2="1.65" y2="2.18" width="0.127" layer="21"/>
<wire x1="1.65" y1="2.18" x2="1.29" y2="1.81" width="0.127" layer="21" curve="90"/>
<wire x1="1.29" y1="1.81" x2="1.29" y2="-1.8" width="0.127" layer="21"/>
<wire x1="1.29" y1="-1.8" x2="1.61" y2="-2.18" width="0.127" layer="21" curve="90"/>
<wire x1="1.61" y1="-2.18" x2="2.2" y2="-2.18" width="0.127" layer="21"/>
<wire x1="2.2" y1="-2.18" x2="2.55" y2="-2.53" width="0.127" layer="21" curve="-90"/>
<wire x1="2.55" y1="-2.53" x2="2.55" y2="-3.8" width="0.127" layer="21"/>
<wire x1="2.55" y1="-3.8" x2="-6.35" y2="-3.8" width="0.127" layer="21"/>
<wire x1="-6.35" y1="-3.8" x2="-6.35" y2="3.8" width="0.127" layer="21"/>
<wire x1="2.5511" y1="-3.8064" x2="2.5511" y2="-4.7457" width="0.1016" layer="51"/>
<wire x1="2.5511" y1="-4.7457" x2="2.3968" y2="-4.8999" width="0.1016" layer="51" curve="-90.409919"/>
<wire x1="2.3968" y1="-4.8999" x2="2.3969" y2="-4.8999" width="0.1016" layer="51"/>
<wire x1="2.3969" y1="-4.8999" x2="2.2287" y2="-4.7317" width="0.1016" layer="51" curve="-90"/>
<wire x1="2.2287" y1="-4.7317" x2="2.2287" y2="-4.5775" width="0.1016" layer="51"/>
<wire x1="2.2287" y1="-4.5775" x2="2.0044" y2="-4.3532" width="0.1016" layer="51" curve="90.153471"/>
<wire x1="2.0044" y1="-4.3532" x2="1.9763" y2="-4.3532" width="0.1016" layer="51"/>
<wire x1="1.9763" y1="-4.3532" x2="1.752" y2="-4.5775" width="0.1016" layer="51" curve="90"/>
<wire x1="1.752" y1="-4.5775" x2="1.752" y2="-4.7457" width="0.1016" layer="51"/>
<wire x1="1.752" y1="-4.7457" x2="1.5978" y2="-4.8999" width="0.1016" layer="51" curve="-90"/>
<wire x1="1.5978" y1="-4.8999" x2="1.4296" y2="-4.7317" width="0.1016" layer="51" curve="-90"/>
<wire x1="1.4296" y1="-4.7317" x2="1.4296" y2="-3.8625" width="0.1016" layer="51"/>
<wire x1="-2.7341" y1="-3.8064" x2="-2.7341" y2="-4.7457" width="0.1016" layer="51"/>
<wire x1="-2.7341" y1="-4.7457" x2="-2.8884" y2="-4.8999" width="0.1016" layer="51" curve="-90.484765"/>
<wire x1="-2.8884" y1="-4.8999" x2="-2.8883" y2="-4.8999" width="0.1016" layer="51"/>
<wire x1="-2.8883" y1="-4.8999" x2="-3.0565" y2="-4.7317" width="0.1016" layer="51" curve="-90"/>
<wire x1="-3.0565" y1="-4.7317" x2="-3.0565" y2="-4.5775" width="0.1016" layer="51"/>
<wire x1="-3.0565" y1="-4.5775" x2="-3.2808" y2="-4.3532" width="0.1016" layer="51" curve="90.153471"/>
<wire x1="-3.2808" y1="-4.3532" x2="-3.3089" y2="-4.3532" width="0.1016" layer="51"/>
<wire x1="-3.3089" y1="-4.3532" x2="-3.5332" y2="-4.5775" width="0.1016" layer="51" curve="90.051111"/>
<wire x1="-3.5332" y1="-4.5775" x2="-3.5332" y2="-4.7457" width="0.1016" layer="51"/>
<wire x1="-3.5332" y1="-4.7457" x2="-3.6874" y2="-4.8999" width="0.1016" layer="51" curve="-90"/>
<wire x1="-3.6874" y1="-4.8999" x2="-3.8556" y2="-4.7317" width="0.1016" layer="51" curve="-90"/>
<wire x1="-3.8556" y1="-4.7317" x2="-3.8556" y2="-3.8625" width="0.1016" layer="51"/>
<wire x1="-3.8555" y1="3.8058" x2="-3.8555" y2="4.7451" width="0.1016" layer="51"/>
<wire x1="-3.8555" y1="4.7451" x2="-3.7012" y2="4.8993" width="0.1016" layer="51" curve="-90.484765"/>
<wire x1="-3.7012" y1="4.8993" x2="-3.7013" y2="4.8993" width="0.1016" layer="51"/>
<wire x1="-3.7013" y1="4.8993" x2="-3.5331" y2="4.7311" width="0.1016" layer="51" curve="-90"/>
<wire x1="-3.5331" y1="4.7311" x2="-3.5331" y2="4.5769" width="0.1016" layer="51"/>
<wire x1="-3.5331" y1="4.5769" x2="-3.3088" y2="4.3526" width="0.1016" layer="51" curve="90.102268"/>
<wire x1="-3.3088" y1="4.3526" x2="-3.2807" y2="4.3526" width="0.1016" layer="51"/>
<wire x1="-3.2807" y1="4.3526" x2="-3.0564" y2="4.5769" width="0.1016" layer="51" curve="90.102268"/>
<wire x1="-3.0564" y1="4.5769" x2="-3.0564" y2="4.7451" width="0.1016" layer="51"/>
<wire x1="-3.0564" y1="4.7451" x2="-2.9022" y2="4.8993" width="0.1016" layer="51" curve="-90"/>
<wire x1="-2.9022" y1="4.8993" x2="-2.734" y2="4.7311" width="0.1016" layer="51" curve="-90"/>
<wire x1="-2.734" y1="4.7311" x2="-2.734" y2="3.8619" width="0.1016" layer="51"/>
<wire x1="1.4297" y1="3.8058" x2="1.4297" y2="4.7451" width="0.1016" layer="51"/>
<wire x1="1.4297" y1="4.7451" x2="1.584" y2="4.8993" width="0.1016" layer="51" curve="-90.335171"/>
<wire x1="1.584" y1="4.8993" x2="1.5839" y2="4.8993" width="0.1016" layer="51"/>
<wire x1="1.5839" y1="4.8993" x2="1.7521" y2="4.7311" width="0.1016" layer="51" curve="-90"/>
<wire x1="1.7521" y1="4.7311" x2="1.7521" y2="4.5769" width="0.1016" layer="51"/>
<wire x1="1.7521" y1="4.5769" x2="1.9764" y2="4.3526" width="0.1016" layer="51" curve="90"/>
<wire x1="1.9764" y1="4.3526" x2="2.0045" y2="4.3526" width="0.1016" layer="51"/>
<wire x1="2.0045" y1="4.3526" x2="2.2288" y2="4.5769" width="0.1016" layer="51" curve="90.051111"/>
<wire x1="2.2288" y1="4.5769" x2="2.2288" y2="4.7451" width="0.1016" layer="51"/>
<wire x1="2.2288" y1="4.7451" x2="2.383" y2="4.8993" width="0.1016" layer="51" curve="-90"/>
<wire x1="2.383" y1="4.8993" x2="2.5512" y2="4.7311" width="0.1016" layer="51" curve="-90"/>
<wire x1="2.5512" y1="4.7311" x2="2.5512" y2="3.7918" width="0.1016" layer="51"/>
<wire x1="-0.6452" y1="0.7497" x2="-0.9817" y2="1.0862" width="0.1016" layer="51" curve="89.931933"/>
<wire x1="-0.9817" y1="1.0862" x2="-5.0051" y2="1.2965" width="0.1016" layer="51"/>
<wire x1="-5.0051" y1="1.2965" x2="-5.0191" y2="1.0301" width="0.1016" layer="51" curve="180"/>
<wire x1="-5.0191" y1="1.0301" x2="-1.9069" y2="0.8619" width="0.1016" layer="51"/>
<wire x1="-1.9069" y1="0.8619" x2="-1.4723" y2="0.4273" width="0.1016" layer="51" curve="-90"/>
<wire x1="-1.4723" y1="0.4273" x2="-1.4723" y2="-0.4559" width="0.1016" layer="51"/>
<wire x1="-1.4723" y1="-0.4559" x2="-1.8929" y2="-0.8765" width="0.1016" layer="51" curve="-90"/>
<wire x1="-1.8929" y1="-0.8765" x2="-1.963" y2="-0.8765" width="0.1016" layer="51"/>
<wire x1="-1.963" y1="-0.8765" x2="-5.0051" y2="-1.0167" width="0.1016" layer="51"/>
<wire x1="-5.0051" y1="-1.0167" x2="-5.0051" y2="-1.297" width="0.1016" layer="51" curve="174.689178"/>
<wire x1="-5.0051" y1="-1.297" x2="-1.0097" y2="-1.0868" width="0.1016" layer="51"/>
<wire x1="-1.0097" y1="-1.0868" x2="-0.6452" y2="-0.7223" width="0.1016" layer="51" curve="90"/>
<wire x1="-0.6452" y1="-0.7223" x2="-0.6452" y2="0.7497" width="0.1016" layer="51"/>
<smd name="S3" x="2" y="5" dx="2.2" dy="2" layer="1"/>
<smd name="S4" x="2" y="-5" dx="2.2" dy="2" layer="1"/>
<smd name="S2" x="-3.3" y="5" dx="2.2" dy="2" layer="1"/>
<smd name="S1" x="-3.3" y="-5" dx="2.2" dy="2" layer="1"/>
<smd name="1" x="2.55" y="1.6" dx="2" dy="0.5" layer="1"/>
<smd name="2" x="2.55" y="0.8" dx="2" dy="0.5" layer="1"/>
<smd name="3" x="2.55" y="0" dx="2" dy="0.5" layer="1"/>
<smd name="4" x="2.55" y="-0.8" dx="2" dy="0.5" layer="1"/>
<smd name="5" x="2.55" y="-1.6" dx="2" dy="0.5" layer="1"/>
<text x="-5.08" y="-7.62" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-5.08" y="-8.89" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="1.3034" y1="1.4367" x2="2.6072" y2="1.7731" layer="51"/>
<rectangle x1="1.3034" y1="0.6376" x2="2.6072" y2="0.974" layer="51"/>
<rectangle x1="1.3034" y1="-0.1615" x2="2.6072" y2="0.1749" layer="51"/>
<rectangle x1="1.3034" y1="-0.9606" x2="2.6072" y2="-0.6242" layer="51"/>
<rectangle x1="1.3034" y1="-1.7596" x2="2.6072" y2="-1.4232" layer="51"/>
</package>
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
<package name="XBEE-SMT">
<wire x1="-12.2" y1="-10.89" x2="12.2" y2="-10.89" width="0.127" layer="21"/>
<wire x1="-4.6" y1="16.72" x2="4.6" y2="16.72" width="0.127" layer="21"/>
<wire x1="4.6" y1="16.72" x2="12.2" y2="10.19" width="0.127" layer="21"/>
<wire x1="-12.2" y1="10.19" x2="-4.6" y2="16.72" width="0.127" layer="21"/>
<text x="-12.5" y="9" size="1.27" layer="21" font="vector" align="center-right">1</text>
<text x="-9.5" y="-9" size="1.27" layer="21" font="vector" align="center-left">10</text>
<text x="12.5" y="-9" size="1.27" layer="21" font="vector" align="center-left">11</text>
<text x="9.5" y="9" size="1.27" layer="21" font="vector" align="center-right">20</text>
<text x="-3" y="0" size="1.27" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-3" y="-1.5" size="1.27" layer="27" font="vector" ratio="15">&gt;VALUE</text>
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
</package>
<package name="XBEE">
<wire x1="-12.19" y1="10.19" x2="-12.19" y2="-10.89" width="0.127" layer="21"/>
<wire x1="-12.19" y1="-10.89" x2="12.19" y2="-10.89" width="0.127" layer="21"/>
<wire x1="12.19" y1="-10.89" x2="12.19" y2="10.19" width="0.127" layer="21"/>
<wire x1="-4.6" y1="16.72" x2="4.6" y2="16.72" width="0.127" layer="21"/>
<wire x1="4.6" y1="16.72" x2="12.19" y2="10.19" width="0.127" layer="21"/>
<wire x1="-12.19" y1="10.19" x2="-4.6" y2="16.72" width="0.127" layer="21"/>
<pad name="1" x="-11" y="9" drill="1.1" shape="square"/>
<pad name="2" x="-11" y="7" drill="1.1"/>
<pad name="3" x="-11" y="5" drill="1.1"/>
<pad name="4" x="-11" y="3" drill="1.1"/>
<pad name="5" x="-11" y="1" drill="1.1"/>
<pad name="6" x="-11" y="-1" drill="1.1"/>
<pad name="7" x="-11" y="-3" drill="1.1"/>
<pad name="8" x="-11" y="-5" drill="1.1"/>
<pad name="9" x="-11" y="-7" drill="1.1"/>
<pad name="10" x="-11" y="-9" drill="1.1"/>
<pad name="11" x="11" y="-9" drill="1.1"/>
<pad name="12" x="11" y="-7" drill="1.1"/>
<pad name="13" x="11" y="-5" drill="1.1"/>
<pad name="14" x="11" y="-3" drill="1.1"/>
<pad name="15" x="11" y="-1" drill="1.1"/>
<pad name="16" x="11" y="1" drill="1.1"/>
<pad name="17" x="11" y="3" drill="1.1"/>
<pad name="18" x="11" y="5" drill="1.1"/>
<pad name="19" x="11" y="7" drill="1.1"/>
<pad name="20" x="11" y="9" drill="1.1"/>
<text x="-9.75" y="9" size="1.27" layer="21" font="vector" align="center-left">1</text>
<text x="-9.75" y="-9" size="1.27" layer="21" font="vector" align="center-left">10</text>
<text x="9.75" y="-9" size="1.27" layer="21" font="vector" align="center-right">11</text>
<text x="9.75" y="9" size="1.27" layer="21" font="vector" align="center-right">20</text>
<text x="-3" y="0" size="1.27" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-3" y="-1.5" size="1.27" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<wire x1="-12.19" y1="-10.89" x2="-12.19" y2="-16.22" width="0.127" layer="51"/>
<wire x1="12.19" y1="-10.89" x2="12.19" y2="-16.22" width="0.127" layer="51"/>
<wire x1="12.19" y1="-16.22" x2="-12.19" y2="-16.22" width="0.127" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="USB-MINIB">
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
<pin name="S1" x="-5.08" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S2" x="-2.54" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S3" x="0" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S4" x="2.54" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
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
</symbols>
<devicesets>
<deviceset name="USB-MINIB-SMT" prefix="CN">
<gates>
<gate name="G$1" symbol="USB-MINIB" x="0" y="0"/>
</gates>
<devices>
<device name="" package="USB-MINIB-SMT">
<connects>
<connect gate="G$1" pin="D+" pad="3"/>
<connect gate="G$1" pin="D-" pad="2"/>
<connect gate="G$1" pin="GND" pad="5"/>
<connect gate="G$1" pin="ID" pad="4"/>
<connect gate="G$1" pin="S1" pad="S1"/>
<connect gate="G$1" pin="S2" pad="S2"/>
<connect gate="G$1" pin="S3" pad="S3"/>
<connect gate="G$1" pin="S4" pad="S4"/>
<connect gate="G$1" pin="VBUS" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
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
</devices>
</deviceset>
<deviceset name="XBEE-*" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="XBEE" x="0" y="0"/>
</gates>
<devices>
<device name="TH" package="XBEE">
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
</devices>
</deviceset>
</devicesets>
</library>
<library name="Passive">
<description>Register, Capacitor, Inductor</description>
<packages>
<package name="1608">
<wire x1="-0.416" y1="0.317" x2="0.416" y2="0.317" width="0.1524" layer="51"/>
<wire x1="-0.416" y1="-0.319" x2="0.416" y2="-0.319" width="0.1524" layer="51"/>
<wire x1="1.3335" y1="0.5715" x2="1.3335" y2="-0.5715" width="0.127" layer="21"/>
<wire x1="-1.3335" y1="-0.5715" x2="-1.3335" y2="0.5715" width="0.127" layer="21"/>
<wire x1="-1.3335" y1="0.5715" x2="1.3335" y2="0.5715" width="0.127" layer="21"/>
<wire x1="1.3335" y1="-0.5715" x2="-1.3335" y2="-0.5715" width="0.127" layer="21"/>
<smd name="1" x="-0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<smd name="2" x="0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<text x="-1.397" y="0.762" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.397" y="-1.524" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4" y2="0.4" layer="51"/>
<rectangle x1="0.4" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
</package>
<package name="2012">
<wire x1="-0.756" y1="0.535" x2="0.756" y2="0.535" width="0.1524" layer="51"/>
<wire x1="-0.756" y1="-0.535" x2="0.756" y2="-0.535" width="0.1524" layer="51"/>
<wire x1="-1.7145" y1="0.8255" x2="1.7145" y2="0.8255" width="0.127" layer="21"/>
<wire x1="1.7145" y1="0.8255" x2="1.7145" y2="-0.8255" width="0.127" layer="21"/>
<wire x1="1.7145" y1="-0.8255" x2="-1.7145" y2="-0.8255" width="0.127" layer="21"/>
<wire x1="-1.7145" y1="-0.8255" x2="-1.7145" y2="0.8255" width="0.127" layer="21"/>
<smd name="1" x="-1.125" y="0" dx="0.75" dy="1.25" layer="1"/>
<smd name="2" x="1.125" y="0" dx="0.75" dy="1.25" layer="1"/>
<text x="-1.778" y="1.016" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.778" y="-1.778" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-1" y1="-0.625" x2="-0.75" y2="0.625" layer="51"/>
<rectangle x1="0.75" y1="-0.625" x2="1" y2="0.625" layer="51"/>
</package>
<package name="3216">
<wire x1="-1.165" y1="0.712" x2="1.165" y2="0.712" width="0.1524" layer="51"/>
<wire x1="-1.165" y1="-0.712" x2="1.165" y2="-0.712" width="0.1524" layer="51"/>
<wire x1="2.3495" y1="0.9525" x2="2.3495" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="2.3495" y1="-0.9525" x2="-2.3495" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="-2.3495" y1="-0.9525" x2="-2.3495" y2="0.9525" width="0.127" layer="21"/>
<wire x1="-2.3495" y1="0.9525" x2="2.3495" y2="0.9525" width="0.127" layer="21"/>
<smd name="1" x="-1.625" y="0" dx="1.05" dy="1.6" layer="1"/>
<smd name="2" x="1.625" y="0" dx="1.05" dy="1.6" layer="1"/>
<text x="-2.413" y="1.143" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.413" y="-1.905" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-1.7" y1="-0.8" x2="-1.1" y2="0.8" layer="51"/>
<rectangle x1="1.1" y1="-0.8" x2="1.7" y2="0.8" layer="51"/>
</package>
<package name="6432">
<wire x1="-2.65" y1="1.512" x2="2.65" y2="1.512" width="0.1524" layer="51"/>
<wire x1="-2.65" y1="-1.512" x2="2.65" y2="-1.512" width="0.1524" layer="51"/>
<smd name="1" x="-3.2" y="0" dx="1.2" dy="3.2" layer="1"/>
<smd name="2" x="3.2" y="0" dx="1.2" dy="3.2" layer="1"/>
<text x="-3.81" y="1.905" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-3.81" y="-2.667" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-3.4" y1="-1.6" x2="-2.6" y2="1.6" layer="51"/>
<rectangle x1="2.6" y1="-1.6" x2="3.4" y2="1.6" layer="51"/>
</package>
<package name="1005">
<wire x1="-0.316" y1="0.167" x2="0.316" y2="0.167" width="0.1524" layer="51"/>
<wire x1="-0.316" y1="-0.169" x2="0.316" y2="-0.169" width="0.1524" layer="51"/>
<wire x1="-0.9525" y1="0.4445" x2="0.9525" y2="0.4445" width="0.127" layer="21"/>
<wire x1="0.9525" y1="0.4445" x2="0.9525" y2="-0.4445" width="0.127" layer="21"/>
<wire x1="0.9525" y1="-0.4445" x2="-0.9525" y2="-0.4445" width="0.127" layer="21"/>
<wire x1="-0.9525" y1="-0.4445" x2="-0.9525" y2="0.4445" width="0.127" layer="21"/>
<smd name="1" x="-0.5548" y="0" dx="0.5" dy="0.5" layer="1"/>
<smd name="2" x="0.5548" y="0" dx="0.5" dy="0.5" layer="1"/>
<text x="-1.016" y="0.635" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.016" y="-1.397" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.5" y1="-0.25" x2="-0.25" y2="0.25" layer="51"/>
<rectangle x1="0.25" y1="-0.25" x2="0.5" y2="0.25" layer="51"/>
</package>
<package name="1608-PV">
<wire x1="0.416" y1="-0.317" x2="-0.416" y2="-0.317" width="0.1524" layer="51"/>
<wire x1="0.416" y1="0.319" x2="-0.416" y2="0.319" width="0.1524" layer="51"/>
<wire x1="-1.4605" y1="0.5715" x2="1.4605" y2="0.5715" width="0.127" layer="21"/>
<wire x1="1.4605" y1="0.5715" x2="1.4605" y2="-0.5715" width="0.127" layer="21"/>
<wire x1="1.4605" y1="-0.5715" x2="-1.4605" y2="-0.5715" width="0.127" layer="21"/>
<wire x1="-1.4605" y1="-0.5715" x2="-1.4605" y2="0.5715" width="0.127" layer="21"/>
<pad name="2" x="0.9" y="0" drill="0.6" shape="square" rot="R180" thermals="no"/>
<smd name="1" x="-0.9" y="0" dx="0.8" dy="0.8" layer="1" rot="R180" thermals="no" cream="no"/>
<text x="-1.5" y="1" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-2" y="-2.25" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<rectangle x1="0.4" y1="-0.4" x2="0.8" y2="0.4" layer="51" rot="R180"/>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4" y2="0.4" layer="51" rot="R180"/>
</package>
<package name="1608-VP">
<wire x1="-0.416" y1="0.317" x2="0.416" y2="0.317" width="0.1524" layer="51"/>
<wire x1="-0.416" y1="-0.319" x2="0.416" y2="-0.319" width="0.1524" layer="51"/>
<wire x1="-1.4605" y1="0.5715" x2="1.4605" y2="0.5715" width="0.127" layer="21"/>
<wire x1="1.4605" y1="0.5715" x2="1.4605" y2="-0.5715" width="0.127" layer="21"/>
<wire x1="1.4605" y1="-0.5715" x2="-1.4605" y2="-0.5715" width="0.127" layer="21"/>
<wire x1="-1.4605" y1="-0.5715" x2="-1.4605" y2="0.5715" width="0.127" layer="21"/>
<pad name="1" x="-0.9" y="0" drill="0.6" shape="square" thermals="no"/>
<smd name="2" x="0.9" y="0" dx="0.8" dy="0.8" layer="1" thermals="no" cream="no"/>
<text x="-1.5" y="1" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-2" y="-2.25" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4" y2="0.4" layer="51"/>
<rectangle x1="0.4" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
</package>
<package name="1608-VV">
<wire x1="0.416" y1="-0.317" x2="-0.416" y2="-0.317" width="0.1524" layer="51"/>
<wire x1="0.416" y1="0.319" x2="-0.416" y2="0.319" width="0.1524" layer="51"/>
<wire x1="-1.4605" y1="0.5715" x2="1.4605" y2="0.5715" width="0.127" layer="21"/>
<wire x1="1.4605" y1="0.5715" x2="1.4605" y2="-0.5715" width="0.127" layer="21"/>
<wire x1="1.4605" y1="-0.5715" x2="-1.4605" y2="-0.5715" width="0.127" layer="21"/>
<wire x1="-1.4605" y1="-0.5715" x2="-1.4605" y2="0.5715" width="0.127" layer="21"/>
<pad name="2" x="0.9" y="0" drill="0.6" shape="square" rot="R180" thermals="no"/>
<pad name="1" x="-0.9" y="0" drill="0.6" shape="square" rot="R180" thermals="no"/>
<text x="-1.5" y="1" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-2" y="-2.25" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<rectangle x1="0.4" y1="-0.4" x2="0.8" y2="0.4" layer="51" rot="R180"/>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4" y2="0.4" layer="51" rot="R180"/>
</package>
<package name="2012-PV">
<wire x1="-0.756" y1="0.535" x2="0.756" y2="0.535" width="0.1524" layer="51"/>
<wire x1="-0.756" y1="-0.535" x2="0.756" y2="-0.535" width="0.1524" layer="51"/>
<wire x1="-1.7145" y1="0.762" x2="1.7145" y2="0.762" width="0.127" layer="21"/>
<wire x1="1.7145" y1="0.762" x2="1.7145" y2="-0.762" width="0.127" layer="21"/>
<wire x1="1.7145" y1="-0.762" x2="-1.7145" y2="-0.762" width="0.127" layer="21"/>
<wire x1="-1.7145" y1="-0.762" x2="-1.7145" y2="0.762" width="0.127" layer="21"/>
<pad name="2" x="1" y="0" drill="0.6" diameter="1.0064" shape="square" thermals="no"/>
<smd name="1" x="-1.1" y="0" dx="0.8" dy="1.25" layer="1" thermals="no" cream="no"/>
<text x="-1.5" y="1.25" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-2" y="-2.5" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<rectangle x1="-1" y1="-0.625" x2="-0.7" y2="0.625" layer="51"/>
<rectangle x1="0.7" y1="-0.625" x2="1" y2="0.625" layer="51"/>
</package>
<package name="2012-VP">
<wire x1="-0.756" y1="0.535" x2="0.756" y2="0.535" width="0.1524" layer="51"/>
<wire x1="-0.756" y1="-0.535" x2="0.756" y2="-0.535" width="0.1524" layer="51"/>
<wire x1="-1.7145" y1="0.762" x2="1.7145" y2="0.762" width="0.127" layer="21"/>
<wire x1="1.7145" y1="0.762" x2="1.7145" y2="-0.762" width="0.127" layer="21"/>
<wire x1="1.7145" y1="-0.762" x2="-1.7145" y2="-0.762" width="0.127" layer="21"/>
<wire x1="-1.7145" y1="-0.762" x2="-1.7145" y2="0.762" width="0.127" layer="21"/>
<pad name="1" x="-1" y="0" drill="0.6" diameter="1.0064" shape="square" thermals="no"/>
<smd name="2" x="1.1" y="0" dx="0.8" dy="1.25" layer="1" thermals="no" cream="no"/>
<text x="-1.5" y="1.25" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-2" y="-2.5" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<rectangle x1="-1" y1="-0.625" x2="-0.7" y2="0.625" layer="51"/>
<rectangle x1="0.7" y1="-0.625" x2="1" y2="0.625" layer="51"/>
</package>
<package name="2012-VV">
<wire x1="-0.756" y1="0.535" x2="0.756" y2="0.535" width="0.1524" layer="51"/>
<wire x1="-0.756" y1="-0.535" x2="0.756" y2="-0.535" width="0.1524" layer="51"/>
<wire x1="-1.7145" y1="0.762" x2="1.7145" y2="0.762" width="0.127" layer="21"/>
<wire x1="1.7145" y1="0.762" x2="1.7145" y2="-0.762" width="0.127" layer="21"/>
<wire x1="1.7145" y1="-0.762" x2="-1.7145" y2="-0.762" width="0.127" layer="21"/>
<wire x1="-1.7145" y1="-0.762" x2="-1.7145" y2="0.762" width="0.127" layer="21"/>
<pad name="2" x="1" y="0" drill="0.6" diameter="1.0064" shape="square" thermals="no"/>
<pad name="1" x="-1" y="0" drill="0.6" diameter="1.0064" shape="square" thermals="no"/>
<text x="-1.5" y="1.25" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-2" y="-2.5" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<rectangle x1="-1" y1="-0.625" x2="-0.7" y2="0.625" layer="51"/>
<rectangle x1="0.7" y1="-0.625" x2="1" y2="0.625" layer="51"/>
</package>
<package name="3216-PV">
<wire x1="-1.165" y1="0.712" x2="1.165" y2="0.712" width="0.1524" layer="51"/>
<wire x1="-1.165" y1="-0.712" x2="1.165" y2="-0.712" width="0.1524" layer="51"/>
<wire x1="2.286" y1="0.9525" x2="2.286" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="2.286" y1="-0.9525" x2="-2.286" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="-2.286" y1="-0.9525" x2="-2.286" y2="0.9525" width="0.127" layer="21"/>
<wire x1="-2.286" y1="0.9525" x2="2.286" y2="0.9525" width="0.127" layer="21"/>
<pad name="2" x="1.6" y="0" drill="0.6" shape="square" thermals="no"/>
<smd name="1" x="-1.625" y="0" dx="1.05" dy="1.6" layer="1" thermals="no" cream="no"/>
<text x="-1.5" y="1.5" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-2" y="-2.75" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<rectangle x1="-1.7" y1="-0.8" x2="-1.1" y2="0.8" layer="51"/>
<rectangle x1="1.1" y1="-0.8" x2="1.7" y2="0.8" layer="51"/>
</package>
<package name="3216-VP">
<wire x1="-1.165" y1="0.712" x2="1.165" y2="0.712" width="0.1524" layer="51"/>
<wire x1="-1.165" y1="-0.712" x2="1.165" y2="-0.712" width="0.1524" layer="51"/>
<wire x1="2.286" y1="0.9525" x2="2.286" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="2.286" y1="-0.9525" x2="-2.286" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="-2.286" y1="-0.9525" x2="-2.286" y2="0.9525" width="0.127" layer="21"/>
<wire x1="-2.286" y1="0.9525" x2="2.286" y2="0.9525" width="0.127" layer="21"/>
<pad name="1" x="-1.6" y="0" drill="0.6" shape="square" thermals="no"/>
<smd name="2" x="1.625" y="0" dx="1.05" dy="1.6" layer="1" thermals="no" cream="no"/>
<text x="-1.5" y="1.5" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-2" y="-2.75" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<rectangle x1="-1.7" y1="-0.8" x2="-1.1" y2="0.8" layer="51"/>
<rectangle x1="1.1" y1="-0.8" x2="1.7" y2="0.8" layer="51"/>
</package>
<package name="3216-VV">
<wire x1="-1.165" y1="0.712" x2="1.165" y2="0.712" width="0.1524" layer="51"/>
<wire x1="-1.165" y1="-0.712" x2="1.165" y2="-0.712" width="0.1524" layer="51"/>
<wire x1="2.286" y1="0.9525" x2="2.286" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="2.286" y1="-0.9525" x2="-2.286" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="-2.286" y1="-0.9525" x2="-2.286" y2="0.9525" width="0.127" layer="21"/>
<wire x1="-2.286" y1="0.9525" x2="2.286" y2="0.9525" width="0.127" layer="21"/>
<pad name="1" x="-1.6" y="0" drill="0.6" shape="square" thermals="no"/>
<pad name="2" x="1.6" y="0" drill="0.6" shape="square" thermals="no"/>
<text x="-1.5" y="1.5" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-2" y="-2.75" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<rectangle x1="-1.7" y1="-0.8" x2="-1.1" y2="0.8" layer="51"/>
<rectangle x1="1.1" y1="-0.8" x2="1.7" y2="0.8" layer="51"/>
</package>
<package name="LED1608">
<wire x1="0.25" y1="0" x2="-0.25" y2="0" width="0.127" layer="21"/>
<wire x1="-0.25" y1="0" x2="-0.05" y2="0.2" width="0.127" layer="21"/>
<wire x1="-0.25" y1="0" x2="-0.05" y2="-0.2" width="0.127" layer="21"/>
<wire x1="-0.416" y1="0.317" x2="0.416" y2="0.317" width="0.1524" layer="51"/>
<wire x1="-0.416" y1="-0.319" x2="0.416" y2="-0.319" width="0.1524" layer="51"/>
<wire x1="1.3335" y1="0.5715" x2="1.3335" y2="-0.5715" width="0.127" layer="21"/>
<wire x1="-1.3335" y1="-0.5715" x2="-1.3335" y2="0.5715" width="0.127" layer="21"/>
<wire x1="-1.3335" y1="0.5715" x2="1.3335" y2="0.5715" width="0.127" layer="21"/>
<wire x1="1.3335" y1="-0.5715" x2="-1.3335" y2="-0.5715" width="0.127" layer="21"/>
<smd name="C" x="-0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<smd name="A" x="0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<text x="-1.397" y="0.762" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.397" y="-1.524" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4" y2="0.4" layer="51"/>
<rectangle x1="0.4" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
</package>
<package name="1005-A4">
<smd name="A1" x="-0.5548" y="0.8" dx="0.5" dy="0.35" layer="1"/>
<smd name="A2" x="0.5548" y="0.8" dx="0.5" dy="0.35" layer="1"/>
<text x="-1.016" y="1.524" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.905" y="-2.286" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.5" y1="0.55" x2="-0.3" y2="1" layer="51"/>
<rectangle x1="0.3" y1="0.55" x2="0.5" y2="1" layer="51"/>
<smd name="B1" x="-0.5548" y="0.25" dx="0.5" dy="0.25" layer="1"/>
<smd name="B2" x="0.5548" y="0.25" dx="0.5" dy="0.25" layer="1"/>
<smd name="C1" x="-0.5548" y="-0.25" dx="0.5" dy="0.25" layer="1"/>
<smd name="C2" x="0.5548" y="-0.25" dx="0.5" dy="0.25" layer="1"/>
<smd name="D2" x="0.5548" y="-0.8" dx="0.5" dy="0.35" layer="1"/>
<smd name="D1" x="-0.5548" y="-0.8" dx="0.5" dy="0.35" layer="1"/>
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
<wire x1="-1.016" y1="1.143" x2="1.016" y2="1.143" width="0.127" layer="51"/>
<wire x1="1.016" y1="1.143" x2="1.016" y2="-1.143" width="0.127" layer="51"/>
<wire x1="1.016" y1="-1.143" x2="-1.016" y2="-1.143" width="0.127" layer="51"/>
<wire x1="-1.016" y1="-1.143" x2="-1.016" y2="1.143" width="0.127" layer="51"/>
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
<pin name="C" x="0" y="-2.54" visible="off" length="point" direction="pas" rot="R90"/>
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
<device name="1608PV" package="1608-PV">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1608VP" package="1608-VP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1608VV" package="1608-VV">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012PV" package="2012-PV">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012VP" package="2012-VP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012VV" package="2012-VV">
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
<device name="1608PV" package="1608-PV">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1608VP" package="1608-VP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1608VV" package="1608-VV">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012PV" package="2012-PV">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012VP" package="2012-VP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012VV" package="2012-VV">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3216PV" package="3216-PV">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3216VP" package="3216-VP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3216VV" package="3216-VV">
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
<gate name="G$1" symbol="INDUCTOR" x="0" y="0"/>
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
</devices>
</deviceset>
<deviceset name="LED" prefix="LED" uservalue="yes">
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="1608" package="LED1608">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
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
<symbol name="+5V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+1V8">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+1V8" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="VBUS">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="VBUS" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
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
<deviceset name="+1V8" prefix="+P">
<gates>
<gate name="G$1" symbol="+1V8" x="0" y="0"/>
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
</devicesets>
</library>
<library name="ic-Microchip">
<packages>
<package name="SOT23-3">
<wire x1="-1.45" y1="0.65" x2="1.45" y2="0.65" width="0.127" layer="21"/>
<wire x1="1.45" y1="0.65" x2="1.45" y2="-0.65" width="0.127" layer="21"/>
<wire x1="1.45" y1="-0.65" x2="-1.45" y2="-0.65" width="0.127" layer="21"/>
<wire x1="-1.45" y1="-0.65" x2="-1.45" y2="0.65" width="0.127" layer="21"/>
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
<symbol name="MCP1700">
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
<gate name="G$1" symbol="MCP1700" x="0" y="0"/>
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
<library name="ic-ATMEL">
<description>ATMEL</description>
<packages>
<package name="QFP48-0.5">
<wire x1="-3" y1="-3.3" x2="3" y2="-3.3" width="0.127" layer="21"/>
<wire x1="3.3" y1="-3" x2="3.3" y2="3" width="0.127" layer="21"/>
<wire x1="3" y1="3.3" x2="-3" y2="3.3" width="0.127" layer="21"/>
<wire x1="-3" y1="3.3" x2="-3.3" y2="3" width="0.127" layer="21"/>
<wire x1="-3.3" y1="3" x2="-3.3" y2="-3" width="0.127" layer="21"/>
<wire x1="-3.3" y1="-3" x2="-3" y2="-3.3" width="0.127" layer="21"/>
<wire x1="3" y1="-3.3" x2="3.3" y2="-3" width="0.127" layer="21"/>
<wire x1="3.3" y1="3" x2="3" y2="3.3" width="0.127" layer="21"/>
<wire x1="3.1" y1="3.5" x2="3.5" y2="3.1" width="0.127" layer="51"/>
<wire x1="3.5" y1="3.1" x2="3.5" y2="-3.1" width="0.127" layer="51"/>
<wire x1="3.5" y1="-3.1" x2="3.1" y2="-3.5" width="0.127" layer="51"/>
<wire x1="3.1" y1="-3.5" x2="-3.1" y2="-3.5" width="0.127" layer="51"/>
<wire x1="-3.1" y1="-3.5" x2="-3.5" y2="-3.1" width="0.127" layer="51"/>
<wire x1="-3.5" y1="-3.1" x2="-3.5" y2="3.1" width="0.127" layer="51"/>
<wire x1="-3.5" y1="3.1" x2="-3.1" y2="3.5" width="0.127" layer="51"/>
<wire x1="-3.1" y1="3.5" x2="3.1" y2="3.5" width="0.127" layer="51"/>
<circle x="-2.5" y="2.5" radius="0.2499" width="0.127" layer="21"/>
<smd name="1" x="-4.55" y="2.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="2" x="-4.55" y="2.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="3" x="-4.55" y="1.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="4" x="-4.55" y="1.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="5" x="-4.55" y="0.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="6" x="-4.55" y="0.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="7" x="-4.55" y="-0.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="8" x="-4.55" y="-0.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="9" x="-4.55" y="-1.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="10" x="-4.55" y="-1.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="11" x="-4.55" y="-2.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="12" x="-4.55" y="-2.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="13" x="-2.75" y="-4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="14" x="-2.25" y="-4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="15" x="-1.75" y="-4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="16" x="-1.25" y="-4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="17" x="-0.75" y="-4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="18" x="-0.25" y="-4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="19" x="0.25" y="-4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="20" x="0.75" y="-4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="21" x="1.25" y="-4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="22" x="1.75" y="-4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="23" x="2.25" y="-4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="24" x="2.75" y="-4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="25" x="4.55" y="-2.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="26" x="4.55" y="-2.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="27" x="4.55" y="-1.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="28" x="4.55" y="-1.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="29" x="4.55" y="-0.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="30" x="4.55" y="-0.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="31" x="4.55" y="0.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="32" x="4.55" y="0.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="33" x="4.55" y="1.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="34" x="4.55" y="1.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="35" x="4.55" y="2.25" dx="1.4" dy="0.25" layer="1"/>
<smd name="36" x="4.55" y="2.75" dx="1.4" dy="0.25" layer="1"/>
<smd name="37" x="2.75" y="4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="38" x="2.25" y="4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="39" x="1.75" y="4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="40" x="1.25" y="4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="41" x="0.75" y="4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="42" x="0.25" y="4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="43" x="-0.25" y="4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="44" x="-0.75" y="4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="45" x="-1.25" y="4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="46" x="-1.75" y="4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="47" x="-2.25" y="4.55" dx="0.25" dy="1.4" layer="1"/>
<smd name="48" x="-2.75" y="4.55" dx="0.25" dy="1.4" layer="1"/>
<text x="-2.54" y="0" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.54" y="-1.27" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-4.5" y1="2.625" x2="-3.5" y2="2.875" layer="51"/>
<rectangle x1="-4.5" y1="2.125" x2="-3.5" y2="2.375" layer="51"/>
<rectangle x1="-4.5" y1="1.625" x2="-3.5" y2="1.875" layer="51"/>
<rectangle x1="-4.5" y1="1.125" x2="-3.5" y2="1.375" layer="51"/>
<rectangle x1="-4.5" y1="0.625" x2="-3.5" y2="0.875" layer="51"/>
<rectangle x1="-4.5" y1="0.125" x2="-3.5" y2="0.375" layer="51"/>
<rectangle x1="-4.5" y1="-0.375" x2="-3.5" y2="-0.125" layer="51"/>
<rectangle x1="-2.875" y1="-4.5" x2="-2.625" y2="-3.5" layer="51"/>
<rectangle x1="3.5" y1="2.625" x2="4.5" y2="2.875" layer="51" rot="R180"/>
<rectangle x1="-2.875" y1="3.5" x2="-2.625" y2="4.5" layer="51"/>
<rectangle x1="-4.5" y1="-0.875" x2="-3.5" y2="-0.625" layer="51"/>
<rectangle x1="-4.5" y1="-1.375" x2="-3.5" y2="-1.125" layer="51"/>
<rectangle x1="-4.5" y1="-1.875" x2="-3.5" y2="-1.625" layer="51"/>
<rectangle x1="-4.5" y1="-2.375" x2="-3.5" y2="-2.125" layer="51"/>
<rectangle x1="-4.5" y1="-2.875" x2="-3.5" y2="-2.625" layer="51"/>
<rectangle x1="-2.375" y1="-4.5" x2="-2.125" y2="-3.5" layer="51"/>
<rectangle x1="-1.875" y1="-4.5" x2="-1.625" y2="-3.5" layer="51"/>
<rectangle x1="-1.375" y1="-4.5" x2="-1.125" y2="-3.5" layer="51"/>
<rectangle x1="-0.875" y1="-4.5" x2="-0.625" y2="-3.5" layer="51"/>
<rectangle x1="-0.375" y1="-4.5" x2="-0.125" y2="-3.5" layer="51"/>
<rectangle x1="0.125" y1="-4.5" x2="0.375" y2="-3.5" layer="51"/>
<rectangle x1="0.625" y1="-4.5" x2="0.875" y2="-3.5" layer="51"/>
<rectangle x1="1.125" y1="-4.5" x2="1.375" y2="-3.5" layer="51"/>
<rectangle x1="1.625" y1="-4.5" x2="1.875" y2="-3.5" layer="51"/>
<rectangle x1="2.125" y1="-4.5" x2="2.375" y2="-3.5" layer="51"/>
<rectangle x1="2.625" y1="-4.5" x2="2.875" y2="-3.5" layer="51"/>
<rectangle x1="3.5" y1="2.125" x2="4.5" y2="2.375" layer="51" rot="R180"/>
<rectangle x1="3.5" y1="1.625" x2="4.5" y2="1.875" layer="51" rot="R180"/>
<rectangle x1="3.5" y1="1.125" x2="4.5" y2="1.375" layer="51" rot="R180"/>
<rectangle x1="3.5" y1="0.625" x2="4.5" y2="0.875" layer="51" rot="R180"/>
<rectangle x1="3.5" y1="0.125" x2="4.5" y2="0.375" layer="51" rot="R180"/>
<rectangle x1="3.5" y1="-0.375" x2="4.5" y2="-0.125" layer="51" rot="R180"/>
<rectangle x1="3.5" y1="-0.875" x2="4.5" y2="-0.625" layer="51" rot="R180"/>
<rectangle x1="3.5" y1="-1.375" x2="4.5" y2="-1.125" layer="51" rot="R180"/>
<rectangle x1="3.5" y1="-1.875" x2="4.5" y2="-1.625" layer="51" rot="R180"/>
<rectangle x1="3.5" y1="-2.375" x2="4.5" y2="-2.125" layer="51" rot="R180"/>
<rectangle x1="3.5" y1="-2.875" x2="4.5" y2="-2.625" layer="51" rot="R180"/>
<rectangle x1="-2.375" y1="3.5" x2="-2.125" y2="4.5" layer="51"/>
<rectangle x1="-1.875" y1="3.5" x2="-1.625" y2="4.5" layer="51"/>
<rectangle x1="-1.375" y1="3.5" x2="-1.125" y2="4.5" layer="51"/>
<rectangle x1="-0.875" y1="3.5" x2="-0.625" y2="4.5" layer="51"/>
<rectangle x1="-0.375" y1="3.5" x2="-0.125" y2="4.5" layer="51"/>
<rectangle x1="0.625" y1="3.5" x2="0.875" y2="4.5" layer="51"/>
<rectangle x1="0.125" y1="3.5" x2="0.375" y2="4.5" layer="51"/>
<rectangle x1="1.125" y1="3.5" x2="1.375" y2="4.5" layer="51"/>
<rectangle x1="1.625" y1="3.5" x2="1.875" y2="4.5" layer="51"/>
<rectangle x1="2.125" y1="3.5" x2="2.375" y2="4.5" layer="51"/>
<rectangle x1="2.625" y1="3.5" x2="2.875" y2="4.5" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="AT32UC3B1">
<wire x1="-35.56" y1="43.18" x2="35.56" y2="43.18" width="0.254" layer="94"/>
<wire x1="35.56" y1="43.18" x2="35.56" y2="-40.64" width="0.254" layer="94"/>
<wire x1="35.56" y1="-40.64" x2="-35.56" y2="-40.64" width="0.254" layer="94"/>
<wire x1="-35.56" y1="-40.64" x2="-35.56" y2="43.18" width="0.254" layer="94"/>
<text x="-35.56" y="43.688" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-35.56" y="-43.18" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="PA03/AD0/GCLK0/USB_ID" x="38.1" y="27.94" length="short" rot="R180"/>
<pin name="PA04/AD1/GCLK1/USB_VBOF" x="38.1" y="25.4" length="short" rot="R180"/>
<pin name="PA05/AD2/INT0/USART1-DCD" x="38.1" y="22.86" length="short" rot="R180"/>
<pin name="PA06/AD3/INT1/USART1-DSR" x="38.1" y="20.32" length="short" rot="R180"/>
<pin name="PA00/TDI" x="38.1" y="35.56" length="short" rot="R180"/>
<pin name="PA01/TDO" x="38.1" y="33.02" length="short" rot="R180"/>
<pin name="PA02/TMS" x="38.1" y="30.48" length="short" rot="R180"/>
<pin name="PA07/AD4/PWM0/USART1-DTR" x="38.1" y="17.78" length="short" rot="R180"/>
<pin name="PA08/AD5/PWM1/USART1-RI" x="38.1" y="15.24" length="short" rot="R180"/>
<pin name="PA09/SCL/SPI0-NPCS2/USART1-CTS" x="38.1" y="12.7" length="short" rot="R180"/>
<pin name="PA10/SDA/SPI0-NPCS3/USART1-RTS" x="38.1" y="7.62" length="short" rot="R180"/>
<pin name="PA11/XIN32/PWM0/TC-A2/USART0-RTS" x="38.1" y="5.08" length="short" rot="R180"/>
<pin name="PA12/XOUT32/PWM1/TC-B2/USART0-CTS" x="38.1" y="2.54" length="short" rot="R180"/>
<pin name="PA13/PWM2/NMI/USART0-CLK" x="38.1" y="0" length="short" rot="R180"/>
<pin name="PA14/PWM3/INT2/SPI0-MOSI" x="38.1" y="-2.54" length="short" rot="R180"/>
<pin name="PA15/PWM4/USART2-CLK/SPI0-SCK" x="38.1" y="-5.08" length="short" rot="R180"/>
<pin name="PA16/PWM4/TC-CLK1/SPI0-NPCS0" x="38.1" y="-7.62" length="short" rot="R180"/>
<pin name="PA17/TC-CLK2/SPI0-SCK/SPI0-NPCS1" x="38.1" y="-10.16" length="short" rot="R180"/>
<pin name="PA18/XIN0/PWM5/USART0-RXD/SPI0-MISO" x="38.1" y="-12.7" length="short" rot="R180"/>
<pin name="PA19/XOUT0/PWM6/USART0-TXD/SPI0-MOSI" x="38.1" y="-15.24" length="short" rot="R180"/>
<pin name="PA20/TC-CLK0/USART1-CLK/USART2-RXD" x="38.1" y="-20.32" length="short" rot="R180"/>
<pin name="PA21/TC-A1/PWM2/USART2-TXD" x="38.1" y="-22.86" length="short" rot="R180"/>
<pin name="PA22/TC-B1/PWM6/TRIGGER" x="38.1" y="-25.4" length="short" rot="R180"/>
<pin name="PA23/INT3/USART1-TXD/SPI0-NPCS1" x="38.1" y="-27.94" length="short" rot="R180"/>
<pin name="PA24/INT4/USART1-RXD/SPI0-NPCS0" x="38.1" y="-30.48" length="short" rot="R180"/>
<pin name="PA25/INT5/PWM3/SPI0-MISO" x="38.1" y="-33.02" length="short" rot="R180"/>
<pin name="PA26/TC-A0/USB_ID/USART2-TXD" x="38.1" y="-35.56" length="short" rot="R180"/>
<pin name="PA27/TC-B0/USB_VBOF/USART2-RXD" x="38.1" y="-38.1" length="short" rot="R180"/>
<pin name="TCK" x="38.1" y="40.64" length="short" rot="R180"/>
<pin name="!RESET" x="-38.1" y="40.64" length="short" function="dot"/>
<pin name="VDDIN" x="-38.1" y="33.02" length="short"/>
<pin name="VDDOUT" x="-38.1" y="30.48" length="short"/>
<pin name="VDDCORE@0" x="-38.1" y="25.4" length="short"/>
<pin name="VDDCORE@1" x="-38.1" y="22.86" length="short"/>
<pin name="VDDCORE@2" x="-38.1" y="20.32" length="short"/>
<pin name="VDDPLL" x="-38.1" y="17.78" length="short"/>
<pin name="VDDANA" x="-38.1" y="10.16" length="short"/>
<pin name="VDDIO@0" x="-38.1" y="7.62" length="short"/>
<pin name="VDDIO@1" x="-38.1" y="5.08" length="short"/>
<pin name="VDDIO@2" x="-38.1" y="2.54" length="short"/>
<pin name="GND@0" x="-38.1" y="-7.62" length="short"/>
<pin name="GNDANA" x="-38.1" y="-5.08" length="short"/>
<pin name="GND@1" x="-38.1" y="-10.16" length="short"/>
<pin name="GND@2" x="-38.1" y="-12.7" length="short"/>
<pin name="DP" x="-38.1" y="-27.94" length="short"/>
<pin name="DM" x="-38.1" y="-30.48" length="short"/>
<pin name="ADVREF" x="-38.1" y="-38.1" length="short"/>
<pin name="VBUS" x="-38.1" y="-22.86" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="AT32UC3B1*" prefix="U">
<gates>
<gate name="G$1" symbol="AT32UC3B1" x="0" y="0"/>
</gates>
<devices>
<device name="-AU" package="QFP48-0.5">
<connects>
<connect gate="G$1" pin="!RESET" pad="47"/>
<connect gate="G$1" pin="ADVREF" pad="14"/>
<connect gate="G$1" pin="DM" pad="39"/>
<connect gate="G$1" pin="DP" pad="38"/>
<connect gate="G$1" pin="GND@0" pad="1"/>
<connect gate="G$1" pin="GND@1" pad="19"/>
<connect gate="G$1" pin="GND@2" pad="37"/>
<connect gate="G$1" pin="GNDANA" pad="13"/>
<connect gate="G$1" pin="PA00/TDI" pad="3"/>
<connect gate="G$1" pin="PA01/TDO" pad="4"/>
<connect gate="G$1" pin="PA02/TMS" pad="5"/>
<connect gate="G$1" pin="PA03/AD0/GCLK0/USB_ID" pad="7"/>
<connect gate="G$1" pin="PA04/AD1/GCLK1/USB_VBOF" pad="8"/>
<connect gate="G$1" pin="PA05/AD2/INT0/USART1-DCD" pad="9"/>
<connect gate="G$1" pin="PA06/AD3/INT1/USART1-DSR" pad="10"/>
<connect gate="G$1" pin="PA07/AD4/PWM0/USART1-DTR" pad="11"/>
<connect gate="G$1" pin="PA08/AD5/PWM1/USART1-RI" pad="12"/>
<connect gate="G$1" pin="PA09/SCL/SPI0-NPCS2/USART1-CTS" pad="20"/>
<connect gate="G$1" pin="PA10/SDA/SPI0-NPCS3/USART1-RTS" pad="21"/>
<connect gate="G$1" pin="PA11/XIN32/PWM0/TC-A2/USART0-RTS" pad="22"/>
<connect gate="G$1" pin="PA12/XOUT32/PWM1/TC-B2/USART0-CTS" pad="23"/>
<connect gate="G$1" pin="PA13/PWM2/NMI/USART0-CLK" pad="25"/>
<connect gate="G$1" pin="PA14/PWM3/INT2/SPI0-MOSI" pad="26"/>
<connect gate="G$1" pin="PA15/PWM4/USART2-CLK/SPI0-SCK" pad="27"/>
<connect gate="G$1" pin="PA16/PWM4/TC-CLK1/SPI0-NPCS0" pad="28"/>
<connect gate="G$1" pin="PA17/TC-CLK2/SPI0-SCK/SPI0-NPCS1" pad="29"/>
<connect gate="G$1" pin="PA18/XIN0/PWM5/USART0-RXD/SPI0-MISO" pad="30"/>
<connect gate="G$1" pin="PA19/XOUT0/PWM6/USART0-TXD/SPI0-MOSI" pad="31"/>
<connect gate="G$1" pin="PA20/TC-CLK0/USART1-CLK/USART2-RXD" pad="32"/>
<connect gate="G$1" pin="PA21/TC-A1/PWM2/USART2-TXD" pad="33"/>
<connect gate="G$1" pin="PA22/TC-B1/PWM6/TRIGGER" pad="34"/>
<connect gate="G$1" pin="PA23/INT3/USART1-TXD/SPI0-NPCS1" pad="35"/>
<connect gate="G$1" pin="PA24/INT4/USART1-RXD/SPI0-NPCS0" pad="43"/>
<connect gate="G$1" pin="PA25/INT5/PWM3/SPI0-MISO" pad="44"/>
<connect gate="G$1" pin="PA26/TC-A0/USB_ID/USART2-TXD" pad="45"/>
<connect gate="G$1" pin="PA27/TC-B0/USB_VBOF/USART2-RXD" pad="46"/>
<connect gate="G$1" pin="TCK" pad="2"/>
<connect gate="G$1" pin="VBUS" pad="40"/>
<connect gate="G$1" pin="VDDANA" pad="15"/>
<connect gate="G$1" pin="VDDCORE@0" pad="6"/>
<connect gate="G$1" pin="VDDCORE@1" pad="18"/>
<connect gate="G$1" pin="VDDCORE@2" pad="42"/>
<connect gate="G$1" pin="VDDIN" pad="17"/>
<connect gate="G$1" pin="VDDIO@0" pad="24"/>
<connect gate="G$1" pin="VDDIO@1" pad="36"/>
<connect gate="G$1" pin="VDDIO@2" pad="48"/>
<connect gate="G$1" pin="VDDOUT" pad="16"/>
<connect gate="G$1" pin="VDDPLL" pad="41"/>
</connects>
<technologies>
<technology name="64"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Switch">
<packages>
<package name="TACT4P-SMT6660">
<wire x1="-3.3" y1="3" x2="3.3" y2="3" width="0.127" layer="21"/>
<wire x1="3.3" y1="-3" x2="-3.3" y2="-3" width="0.127" layer="21"/>
<circle x="0" y="0" radius="1.5" width="0.127" layer="51"/>
<smd name="A1" x="-3.4" y="-2" dx="3.2" dy="1" layer="1"/>
<smd name="A2" x="3.4" y="-2" dx="3.2" dy="1" layer="1"/>
<smd name="B1" x="-3.4" y="2" dx="3.2" dy="1" layer="1"/>
<smd name="B2" x="3.4" y="2" dx="3.2" dy="1" layer="1"/>
<wire x1="-3.3" y1="3" x2="-3.3" y2="2.65" width="0.127" layer="21"/>
<wire x1="-3.3" y1="1.35" x2="-3.3" y2="-1.35" width="0.127" layer="21"/>
<wire x1="-3.3" y1="-3" x2="-3.3" y2="-2.65" width="0.127" layer="21"/>
<wire x1="3.3" y1="-3" x2="3.3" y2="-2.65" width="0.127" layer="21"/>
<wire x1="3.3" y1="-1.35" x2="3.3" y2="1.35" width="0.127" layer="21"/>
<wire x1="3.3" y1="3" x2="3.3" y2="2.65" width="0.127" layer="21"/>
<wire x1="3.3" y1="2.65" x2="3.3" y2="1.35" width="0.127" layer="51"/>
<wire x1="3.3" y1="-1.35" x2="3.3" y2="-2.65" width="0.127" layer="51"/>
<wire x1="-3.3" y1="-2.65" x2="-3.3" y2="-1.35" width="0.127" layer="51"/>
<wire x1="-3.3" y1="1.35" x2="-3.3" y2="2.65" width="0.127" layer="51"/>
<circle x="0" y="0" radius="1.9" width="0.127" layer="51"/>
<text x="-3.3" y="3.25" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-3.3" y="-3.25" size="0.762" layer="27" font="vector" ratio="17" align="top-left">&gt;VALUE</text>
</package>
<package name="TACT4P-SMT-6660">
<wire x1="-3.3" y1="3" x2="3.3" y2="3" width="0.127" layer="21"/>
<wire x1="3.3" y1="-3" x2="-3.3" y2="-3" width="0.127" layer="21"/>
<circle x="0" y="0" radius="1.5" width="0.127" layer="51"/>
<smd name="A1" x="-3.4" y="-2" dx="3.2" dy="1" layer="1"/>
<smd name="A2" x="3.4" y="-2" dx="3.2" dy="1" layer="1"/>
<smd name="B1" x="-3.4" y="2" dx="3.2" dy="1" layer="1"/>
<smd name="B2" x="3.4" y="2" dx="3.2" dy="1" layer="1"/>
<wire x1="-3.3" y1="3" x2="-3.3" y2="2.65" width="0.127" layer="21"/>
<wire x1="-3.3" y1="1.35" x2="-3.3" y2="-1.35" width="0.127" layer="21"/>
<wire x1="-3.3" y1="-3" x2="-3.3" y2="-2.65" width="0.127" layer="21"/>
<wire x1="3.3" y1="-3" x2="3.3" y2="-2.65" width="0.127" layer="21"/>
<wire x1="3.3" y1="-1.35" x2="3.3" y2="1.35" width="0.127" layer="21"/>
<wire x1="3.3" y1="3" x2="3.3" y2="2.65" width="0.127" layer="21"/>
<wire x1="3.3" y1="2.65" x2="3.3" y2="1.35" width="0.127" layer="51"/>
<wire x1="3.3" y1="-1.35" x2="3.3" y2="-2.65" width="0.127" layer="51"/>
<wire x1="-3.3" y1="-2.65" x2="-3.3" y2="-1.35" width="0.127" layer="51"/>
<wire x1="-3.3" y1="1.35" x2="-3.3" y2="2.65" width="0.127" layer="51"/>
<circle x="0" y="0" radius="1.9" width="0.127" layer="51"/>
<text x="-3.3" y="3.25" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-3.3" y="-3.25" size="0.762" layer="27" font="vector" ratio="17" align="top-left">&gt;VALUE</text>
</package>
<package name="TACT4P-SMT-4735R">
<wire x1="-2.35" y1="1.75" x2="2.35" y2="1.75" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1.75" x2="-2.35" y2="-1.75" width="0.127" layer="21"/>
<smd name="A1" x="-2.6" y="-0.85" dx="1.6" dy="1" layer="1"/>
<smd name="A2" x="2.6" y="-0.85" dx="1.6" dy="1" layer="1"/>
<smd name="B1" x="-2.6" y="0.85" dx="1.6" dy="1" layer="1"/>
<smd name="B2" x="2.6" y="0.85" dx="1.6" dy="1" layer="1"/>
<wire x1="-2.35" y1="1.75" x2="-2.35" y2="1.5" width="0.127" layer="21"/>
<wire x1="-2.35" y1="0.2" x2="-2.35" y2="-0.2" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-1.75" x2="-2.35" y2="-1.5" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1.75" x2="2.35" y2="-1.5" width="0.127" layer="21"/>
<wire x1="2.35" y1="-0.2" x2="2.35" y2="0.2" width="0.127" layer="21"/>
<wire x1="2.35" y1="1.75" x2="2.35" y2="1.5" width="0.127" layer="21"/>
<wire x1="2.35" y1="1.5" x2="2.35" y2="0.2" width="0.127" layer="51"/>
<wire x1="2.35" y1="-0.2" x2="2.35" y2="-1.5" width="0.127" layer="51"/>
<wire x1="-2.35" y1="-1.5" x2="-2.35" y2="-0.2" width="0.127" layer="51"/>
<wire x1="-2.35" y1="0.2" x2="-2.35" y2="1.5" width="0.127" layer="51"/>
<text x="-2.35" y="2" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2.35" y="3" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<wire x1="-1.3" y1="-1.75" x2="-1.3" y2="-2.75" width="0.127" layer="51"/>
<wire x1="1.3" y1="-1.75" x2="1.3" y2="-2.75" width="0.127" layer="51"/>
<wire x1="-1.3" y1="-2.75" x2="1.3" y2="-2.75" width="0.127" layer="51"/>
</package>
</packages>
<symbols>
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
<deviceset name="TACT4P-SMT" prefix="SW" uservalue="yes">
<gates>
<gate name="G$1" symbol="TACT4P" x="0" y="0"/>
</gates>
<devices>
<device name="6660" package="TACT4P-SMT6660">
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
<deviceset name="TACT4P-SMT-*" prefix="SW" uservalue="yes">
<gates>
<gate name="G$1" symbol="TACT4P" x="0" y="0"/>
</gates>
<devices>
<device name="6660" package="TACT4P-SMT-6660">
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
<device name="4735R" package="TACT4P-SMT-4735R">
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
<library name="Oscillator">
<description>Oscillator</description>
<packages>
<package name="OSC2520">
<wire x1="-1.25" y1="1" x2="-0.3" y2="1" width="0.127" layer="51"/>
<wire x1="-0.3" y1="1" x2="0.3" y2="1" width="0.127" layer="21"/>
<wire x1="0.3" y1="1" x2="1.25" y2="1" width="0.127" layer="51"/>
<wire x1="1.25" y1="-1" x2="0.3" y2="-1" width="0.127" layer="51"/>
<wire x1="0.3" y1="-1" x2="-0.3" y2="-1" width="0.127" layer="21"/>
<wire x1="-0.3" y1="-1" x2="-1.25" y2="-1" width="0.127" layer="51"/>
<wire x1="-1.25" y1="1" x2="-1.25" y2="0.2" width="0.127" layer="51"/>
<wire x1="-1.25" y1="-1" x2="-1.25" y2="-0.2" width="0.127" layer="51"/>
<wire x1="1.25" y1="-1" x2="1.25" y2="-0.2" width="0.127" layer="51"/>
<wire x1="1.25" y1="1" x2="1.25" y2="0.2" width="0.127" layer="51"/>
<wire x1="1.25" y1="0.2" x2="1.25" y2="-0.2" width="0.127" layer="21"/>
<wire x1="-1.25" y1="0.2" x2="-1.25" y2="-0.2" width="0.127" layer="21"/>
<circle x="-0.2" y="-0.7" radius="0.1" width="0.127" layer="21"/>
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
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-FTDI">
<description>FTDI</description>
<packages>
<package name="SSOP28">
<wire x1="-5.175" y1="2.475" x2="5.175" y2="2.475" width="0.127" layer="21"/>
<wire x1="5.175" y1="2.475" x2="5.175" y2="-2.475" width="0.127" layer="21"/>
<wire x1="5.175" y1="-2.475" x2="-5.175" y2="-2.475" width="0.127" layer="21"/>
<wire x1="-5.175" y1="-2.475" x2="-5.175" y2="2.475" width="0.127" layer="21"/>
<circle x="-4.123" y="-1.5845" radius="0.25" width="0.127" layer="21"/>
<smd name="28" x="-4.225" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="27" x="-3.575" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="26" x="-2.925" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="25" x="-2.275" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="24" x="-1.625" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="23" x="-0.975" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="22" x="-0.325" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="20" x="0.975" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="21" x="0.325" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="19" x="1.625" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="18" x="2.275" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="17" x="2.925" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="16" x="3.575" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="15" x="4.225" y="3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="1" x="-4.225" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="2" x="-3.575" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="3" x="-2.925" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="4" x="-2.275" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="5" x="-1.625" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="6" x="-0.975" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="7" x="-0.325" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="8" x="0.325" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="9" x="0.975" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="10" x="1.625" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="11" x="2.275" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="12" x="2.925" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="13" x="3.575" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<smd name="14" x="4.225" y="-3.756" dx="0.381" dy="1.5" layer="1"/>
<text x="-4.445" y="0.635" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-4.445" y="-0.635" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-4.3875" y1="2.5" x2="-4.0625" y2="3.8" layer="51"/>
<rectangle x1="-4.3875" y1="-3.8" x2="-4.0625" y2="-2.5" layer="51"/>
<rectangle x1="-3.7375" y1="-3.8" x2="-3.4125" y2="-2.5" layer="51"/>
<rectangle x1="-3.0875" y1="-3.8" x2="-2.7625" y2="-2.5" layer="51"/>
<rectangle x1="-3.7375" y1="2.5" x2="-3.4125" y2="3.8" layer="51"/>
<rectangle x1="-3.0875" y1="2.5" x2="-2.7625" y2="3.8" layer="51"/>
<rectangle x1="-2.4375" y1="2.5" x2="-2.1125" y2="3.8" layer="51"/>
<rectangle x1="-1.7875" y1="2.5" x2="-1.4625" y2="3.8" layer="51"/>
<rectangle x1="-1.1375" y1="2.5" x2="-0.8125" y2="3.8" layer="51"/>
<rectangle x1="-0.4875" y1="2.5" x2="-0.1625" y2="3.8" layer="51"/>
<rectangle x1="0.1625" y1="2.5" x2="0.4875" y2="3.8" layer="51"/>
<rectangle x1="0.8125" y1="2.5" x2="1.1375" y2="3.8" layer="51"/>
<rectangle x1="1.4625" y1="2.5" x2="1.7875" y2="3.8" layer="51"/>
<rectangle x1="2.1125" y1="2.5" x2="2.4375" y2="3.8" layer="51"/>
<rectangle x1="2.7625" y1="2.5" x2="3.0875" y2="3.8" layer="51"/>
<rectangle x1="3.4125" y1="2.5" x2="3.7375" y2="3.8" layer="51"/>
<rectangle x1="4.0625" y1="2.5" x2="4.3875" y2="3.8" layer="51"/>
<rectangle x1="-2.4375" y1="-3.8" x2="-2.1125" y2="-2.5" layer="51"/>
<rectangle x1="-1.7875" y1="-3.8" x2="-1.4625" y2="-2.5" layer="51"/>
<rectangle x1="-1.1375" y1="-3.8" x2="-0.8125" y2="-2.5" layer="51"/>
<rectangle x1="-0.4875" y1="-3.8" x2="-0.1625" y2="-2.5" layer="51"/>
<rectangle x1="0.1625" y1="-3.8" x2="0.4875" y2="-2.5" layer="51"/>
<rectangle x1="0.8125" y1="-3.8" x2="1.1375" y2="-2.5" layer="51"/>
<rectangle x1="1.4625" y1="-3.8" x2="1.7875" y2="-2.5" layer="51"/>
<rectangle x1="2.1125" y1="-3.8" x2="2.4375" y2="-2.5" layer="51"/>
<rectangle x1="2.7625" y1="-3.8" x2="3.0875" y2="-2.5" layer="51"/>
<rectangle x1="3.4125" y1="-3.8" x2="3.7375" y2="-2.5" layer="51"/>
<rectangle x1="4.0625" y1="-3.8" x2="4.3875" y2="-2.5" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="FT232R">
<wire x1="-20.32" y1="20.32" x2="-20.32" y2="-17.78" width="0.254" layer="94"/>
<wire x1="-20.32" y1="-17.78" x2="20.32" y2="-17.78" width="0.254" layer="94"/>
<wire x1="20.32" y1="-17.78" x2="20.32" y2="20.32" width="0.254" layer="94"/>
<wire x1="20.32" y1="20.32" x2="-20.32" y2="20.32" width="0.254" layer="94"/>
<text x="-20.32" y="20.828" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="10.16" y="-20.32" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="DM" x="-22.86" y="5.08" length="short"/>
<pin name="DP" x="-22.86" y="2.54" length="short"/>
<pin name="!RESET" x="-22.86" y="-2.54" length="short" function="dot"/>
<pin name="OSCI" x="-22.86" y="-7.62" length="short"/>
<pin name="OSCO" x="-22.86" y="-15.24" length="short"/>
<pin name="TEST" x="5.08" y="-20.32" length="short" rot="R90"/>
<pin name="AGND" x="-7.62" y="-20.32" length="short" rot="R90"/>
<pin name="GND@0" x="-5.08" y="-20.32" length="short" rot="R90"/>
<pin name="CBUS4" x="22.86" y="-15.24" length="short" rot="R180"/>
<pin name="CBUS3" x="22.86" y="-12.7" length="short" rot="R180"/>
<pin name="CBUS2" x="22.86" y="-10.16" length="short" rot="R180"/>
<pin name="CBUS1" x="22.86" y="-7.62" length="short" rot="R180"/>
<pin name="CBUS0" x="22.86" y="-5.08" length="short" rot="R180"/>
<pin name="!RI" x="22.86" y="0" length="short" rot="R180"/>
<pin name="!DCD" x="22.86" y="2.54" length="short" rot="R180"/>
<pin name="!DSR" x="22.86" y="5.08" length="short" rot="R180"/>
<pin name="!DTR" x="22.86" y="7.62" length="short" rot="R180"/>
<pin name="!CTS" x="22.86" y="10.16" length="short" rot="R180"/>
<pin name="!RTS" x="22.86" y="12.7" length="short" rot="R180"/>
<pin name="RXD" x="22.86" y="15.24" length="short" rot="R180"/>
<pin name="TXD" x="22.86" y="17.78" length="short" rot="R180"/>
<pin name="VCC" x="-22.86" y="17.78" length="short"/>
<pin name="GND@1" x="-2.54" y="-20.32" length="short" rot="R90"/>
<pin name="GND@2" x="0" y="-20.32" length="short" rot="R90"/>
<pin name="VCCIO" x="-22.86" y="15.24" length="short"/>
<pin name="3V3OUT" x="-22.86" y="12.7" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="FT232R" prefix="U">
<gates>
<gate name="G$1" symbol="FT232R" x="0" y="0"/>
</gates>
<devices>
<device name="L" package="SSOP28">
<connects>
<connect gate="G$1" pin="!CTS" pad="11"/>
<connect gate="G$1" pin="!DCD" pad="10"/>
<connect gate="G$1" pin="!DSR" pad="9"/>
<connect gate="G$1" pin="!DTR" pad="2"/>
<connect gate="G$1" pin="!RESET" pad="19"/>
<connect gate="G$1" pin="!RI" pad="6"/>
<connect gate="G$1" pin="!RTS" pad="3"/>
<connect gate="G$1" pin="3V3OUT" pad="17"/>
<connect gate="G$1" pin="AGND" pad="25"/>
<connect gate="G$1" pin="CBUS0" pad="23"/>
<connect gate="G$1" pin="CBUS1" pad="22"/>
<connect gate="G$1" pin="CBUS2" pad="13"/>
<connect gate="G$1" pin="CBUS3" pad="14"/>
<connect gate="G$1" pin="CBUS4" pad="12"/>
<connect gate="G$1" pin="DM" pad="16"/>
<connect gate="G$1" pin="DP" pad="15"/>
<connect gate="G$1" pin="GND@0" pad="7"/>
<connect gate="G$1" pin="GND@1" pad="18"/>
<connect gate="G$1" pin="GND@2" pad="21"/>
<connect gate="G$1" pin="OSCI" pad="27"/>
<connect gate="G$1" pin="OSCO" pad="28"/>
<connect gate="G$1" pin="RXD" pad="5"/>
<connect gate="G$1" pin="TEST" pad="26"/>
<connect gate="G$1" pin="TXD" pad="1"/>
<connect gate="G$1" pin="VCC" pad="20"/>
<connect gate="G$1" pin="VCCIO" pad="4"/>
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
<package name="3-4E1A">
<wire x1="-1.9" y1="1.2" x2="1.9" y2="1.2" width="0.127" layer="21"/>
<wire x1="1.9" y1="1.15" x2="1.9" y2="-1.15" width="0.127" layer="51"/>
<wire x1="-1.9" y1="-1.2" x2="1.9" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-1.9" y1="1.15" x2="-1.9" y2="-1.15" width="0.127" layer="51"/>
<wire x1="-1.9" y1="-1.2" x2="-1.9" y2="-1.15" width="0.127" layer="21"/>
<wire x1="1.9" y1="-1.2" x2="1.9" y2="-1.15" width="0.127" layer="21"/>
<wire x1="1.9" y1="1.2" x2="1.9" y2="1.15" width="0.127" layer="21"/>
<wire x1="-1.9" y1="1.2" x2="-1.9" y2="1.15" width="0.127" layer="21"/>
<smd name="C" x="-2.25" y="0" dx="1.2" dy="2" layer="1"/>
<smd name="A" x="2.25" y="0" dx="1.2" dy="2" layer="1"/>
<text x="-0.9" y="-0.4" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2" y="-2.5" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-1.4" y1="-1.2" x2="-1.0952" y2="1.2" layer="21"/>
<rectangle x1="-2.35" y1="-0.875" x2="-1.9" y2="0.875" layer="51"/>
<rectangle x1="1.9" y1="-0.875" x2="2.35" y2="0.875" layer="51" rot="R180"/>
</package>
</packages>
<symbols>
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
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CMS*" prefix="D">
<gates>
<gate name="1" symbol="SCHOTTKY-DIODE" x="0" y="0"/>
</gates>
<devices>
<device name="" package="3-4E1A">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name="01"/>
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
<wire x1="2.7" y1="2.2" x2="2.7" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-2.7" y1="2.2" x2="-2.7" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-2.7" y1="2.2" x2="-2.3" y2="2.2" width="0.127" layer="21"/>
<wire x1="2.7" y1="2.2" x2="2.3" y2="2.2" width="0.127" layer="21"/>
<wire x1="-2.7" y1="-2.2" x2="-2.3" y2="-2.2" width="0.127" layer="21"/>
<wire x1="2.7" y1="-2.2" x2="2.3" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-2.3" y1="2.2" x2="2.3" y2="2.2" width="0.127" layer="51"/>
<wire x1="-2.3" y1="-2.2" x2="2.3" y2="-2.2" width="0.127" layer="51"/>
<circle x="-2.2" y="-1.7" radius="0.25" width="0.127" layer="21"/>
<smd name="12" x="-0.65" y="3" dx="0.381" dy="1.6" layer="1"/>
<smd name="10" x="0.65" y="3" dx="0.381" dy="1.6" layer="1"/>
<smd name="11" x="0" y="3" dx="0.381" dy="1.6" layer="1"/>
<smd name="9" x="1.3" y="3" dx="0.381" dy="1.6" layer="1"/>
<smd name="1" x="-1.95" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="2" x="-1.3" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="3" x="-0.65" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="4" x="0" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="5" x="0.65" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="6" x="1.3" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="7" x="1.95" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="8" x="1.95" y="3" dx="0.381" dy="1.6" layer="1" rot="R180"/>
<smd name="14" x="-1.95" y="3" dx="0.381" dy="1.6" layer="1"/>
<smd name="13" x="-1.3" y="3" dx="0.381" dy="1.6" layer="1"/>
<text x="-1.905" y="0.635" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.905" y="-0.635" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-0.15" y1="2.2" x2="0.15" y2="3.2" layer="51"/>
<rectangle x1="0.5" y1="2.2" x2="0.8" y2="3.2" layer="51"/>
<rectangle x1="1.15" y1="2.2" x2="1.45" y2="3.2" layer="51"/>
<rectangle x1="-0.8" y1="2.2" x2="-0.5" y2="3.2" layer="51"/>
<rectangle x1="-2.1" y1="-3.2" x2="-1.8" y2="-2.2" layer="51"/>
<rectangle x1="-1.45" y1="-3.2" x2="-1.15" y2="-2.2" layer="51"/>
<rectangle x1="-0.8" y1="-3.2" x2="-0.5" y2="-2.2" layer="51"/>
<rectangle x1="-0.15" y1="-3.2" x2="0.15" y2="-2.2" layer="51"/>
<rectangle x1="0.5" y1="-3.2" x2="0.8" y2="-2.2" layer="51"/>
<rectangle x1="1.15" y1="-3.2" x2="1.45" y2="-2.2" layer="51"/>
<rectangle x1="1.8" y1="-3.2" x2="2.1" y2="-2.2" layer="51"/>
<rectangle x1="1.8" y1="2.2" x2="2.1" y2="3.2" layer="51" rot="R180"/>
<rectangle x1="-2.1" y1="2.2" x2="-1.8" y2="3.2" layer="51"/>
<rectangle x1="-1.45" y1="2.2" x2="-1.15" y2="3.2" layer="51"/>
</package>
<package name="TSSOP16">
<wire x1="2.7" y1="2.2" x2="2.7" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-2.7" y1="2.2" x2="-2.7" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-2.7" y1="2.2" x2="-2.6" y2="2.2" width="0.127" layer="21"/>
<wire x1="2.7" y1="2.2" x2="2.6" y2="2.2" width="0.127" layer="21"/>
<wire x1="-2.7" y1="-2.2" x2="-2.6" y2="-2.2" width="0.127" layer="21"/>
<wire x1="2.7" y1="-2.2" x2="2.6" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-2.6" y1="2.2" x2="2.6" y2="2.2" width="0.127" layer="51"/>
<wire x1="-2.6" y1="-2.2" x2="2.6" y2="-2.2" width="0.127" layer="51"/>
<circle x="-2.2" y="-1.7" radius="0.25" width="0.127" layer="21"/>
<smd name="12" x="0.325" y="3" dx="0.381" dy="1.6" layer="1"/>
<smd name="10" x="1.625" y="3" dx="0.381" dy="1.6" layer="1"/>
<smd name="11" x="0.975" y="3" dx="0.381" dy="1.6" layer="1"/>
<smd name="9" x="2.275" y="3" dx="0.381" dy="1.6" layer="1"/>
<smd name="1" x="-2.275" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="2" x="-1.625" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="3" x="-0.975" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="4" x="-0.325" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="5" x="0.325" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="6" x="0.975" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="7" x="1.625" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="8" x="2.275" y="-3" dx="0.381" dy="1.6" layer="1"/>
<smd name="16" x="-2.275" y="3" dx="0.381" dy="1.6" layer="1"/>
<smd name="14" x="-0.975" y="3" dx="0.381" dy="1.6" layer="1"/>
<smd name="15" x="-1.625" y="3" dx="0.381" dy="1.6" layer="1"/>
<smd name="13" x="-0.325" y="3" dx="0.381" dy="1.6" layer="1"/>
<text x="-1.905" y="0.635" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-1.905" y="-0.635" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="0.825" y1="2.2" x2="1.125" y2="3.2" layer="51"/>
<rectangle x1="1.475" y1="2.2" x2="1.775" y2="3.2" layer="51"/>
<rectangle x1="2.125" y1="2.2" x2="2.425" y2="3.2" layer="51"/>
<rectangle x1="0.175" y1="2.2" x2="0.475" y2="3.2" layer="51"/>
<rectangle x1="-2.425" y1="-3.2" x2="-2.125" y2="-2.2" layer="51"/>
<rectangle x1="-1.775" y1="-3.2" x2="-1.475" y2="-2.2" layer="51"/>
<rectangle x1="-1.125" y1="-3.2" x2="-0.825" y2="-2.2" layer="51"/>
<rectangle x1="-0.475" y1="-3.2" x2="-0.175" y2="-2.2" layer="51"/>
<rectangle x1="0.175" y1="-3.2" x2="0.475" y2="-2.2" layer="51"/>
<rectangle x1="0.825" y1="-3.2" x2="1.125" y2="-2.2" layer="51"/>
<rectangle x1="1.475" y1="-3.2" x2="1.775" y2="-2.2" layer="51"/>
<rectangle x1="2.125" y1="-3.2" x2="2.425" y2="-2.2" layer="51"/>
<rectangle x1="-1.775" y1="2.2" x2="-1.475" y2="3.2" layer="51"/>
<rectangle x1="-1.125" y1="2.2" x2="-0.825" y2="3.2" layer="51"/>
<rectangle x1="-0.475" y1="2.2" x2="-0.175" y2="3.2" layer="51"/>
<rectangle x1="-2.425" y1="2.2" x2="-2.125" y2="3.2" layer="51"/>
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
<library name="Opto">
<packages>
<package name="ACSC02">
<wire x1="-3.45" y1="5" x2="3.45" y2="5" width="0.127" layer="51"/>
<wire x1="-3.45" y1="4" x2="3.45" y2="4" width="0.127" layer="51"/>
<wire x1="-3.45" y1="-4" x2="3.45" y2="-4" width="0.127" layer="51"/>
<wire x1="-1.5" y1="-2.5" x2="0.5" y2="-2.5" width="0.127" layer="51"/>
<wire x1="0.5" y1="-2.5" x2="1.5" y2="2.5" width="0.127" layer="51"/>
<wire x1="1.5" y1="2.5" x2="-0.5" y2="2.5" width="0.127" layer="51"/>
<wire x1="-0.5" y1="2.5" x2="-1.5" y2="-2.5" width="0.127" layer="51"/>
<wire x1="-1" y1="0" x2="1" y2="0" width="0.127" layer="51"/>
<circle x="1.75" y="-2.25" radius="0.2" width="0.127" layer="51"/>
<smd name="1" x="-2.88" y="-4.8" dx="1" dy="2" layer="1"/>
<smd name="2" x="-1.44" y="-4.8" dx="1" dy="2" layer="1"/>
<smd name="3" x="0" y="-4.8" dx="1" dy="2" layer="1"/>
<smd name="4" x="1.44" y="-4.8" dx="1" dy="2" layer="1"/>
<smd name="5" x="2.88" y="-4.8" dx="1" dy="2" layer="1"/>
<smd name="6" x="2.88" y="4.8" dx="1" dy="2" layer="1"/>
<smd name="7" x="1.44" y="4.8" dx="1" dy="2" layer="1"/>
<smd name="8" x="0" y="4.8" dx="1" dy="2" layer="1"/>
<smd name="9" x="-1.44" y="4.8" dx="1" dy="2" layer="1"/>
<smd name="10" x="-2.88" y="4.8" dx="1" dy="2" layer="1"/>
<wire x1="3.45" y1="-5" x2="-3.45" y2="-5" width="0.127" layer="51"/>
<wire x1="-3.45" y1="5" x2="-3.45" y2="3.65" width="0.127" layer="51"/>
<wire x1="-3.45" y1="3.65" x2="-3.45" y2="-3.65" width="0.127" layer="21"/>
<wire x1="-3.45" y1="-3.65" x2="-3.45" y2="-5" width="0.127" layer="51"/>
<wire x1="3.45" y1="-5" x2="3.45" y2="-3.65" width="0.127" layer="51"/>
<wire x1="3.45" y1="5" x2="3.45" y2="3.65" width="0.127" layer="51"/>
<wire x1="3.45" y1="3.65" x2="3.45" y2="-3.65" width="0.127" layer="21"/>
<wire x1="2.1" y1="-5" x2="2.2" y2="-5" width="0.127" layer="21"/>
<wire x1="0.65" y1="-5" x2="0.75" y2="-5" width="0.127" layer="21"/>
<wire x1="-0.75" y1="-5" x2="-0.65" y2="-5" width="0.127" layer="21"/>
<wire x1="-2.2" y1="-5" x2="-2.1" y2="-5" width="0.127" layer="21"/>
<wire x1="-2.2" y1="5" x2="-2.1" y2="5" width="0.127" layer="21"/>
<wire x1="-0.75" y1="5" x2="-0.65" y2="5" width="0.127" layer="21"/>
<wire x1="0.65" y1="5" x2="0.75" y2="5" width="0.127" layer="21"/>
<wire x1="2.1" y1="5" x2="2.2" y2="5" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="7SEG_CC">
<pin name="A" x="-12.7" y="7.62" length="short"/>
<pin name="B" x="-12.7" y="5.08" length="short"/>
<pin name="C" x="-12.7" y="2.54" length="short"/>
<pin name="D" x="-12.7" y="0" length="short"/>
<pin name="E" x="-12.7" y="-2.54" length="short"/>
<pin name="F" x="-12.7" y="-5.08" length="short"/>
<pin name="G" x="-12.7" y="-7.62" length="short"/>
<pin name="DP" x="-12.7" y="-10.16" length="short"/>
<pin name="K@0" x="12.7" y="-7.62" length="short" rot="R180"/>
<pin name="K@1" x="12.7" y="-10.16" length="short" rot="R180"/>
<wire x1="-10.16" y1="10.16" x2="-10.16" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-12.7" x2="10.16" y2="-12.7" width="0.254" layer="94"/>
<wire x1="10.16" y1="-12.7" x2="10.16" y2="10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="10.16" x2="-10.16" y2="10.16" width="0.254" layer="94"/>
<wire x1="-4.064" y1="-7.62" x2="1.016" y2="-7.62" width="0.254" layer="94"/>
<wire x1="1.016" y1="-7.62" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="4.064" y2="5.08" width="0.254" layer="94"/>
<wire x1="4.064" y1="5.08" x2="-1.016" y2="5.08" width="0.254" layer="94"/>
<wire x1="-1.016" y1="5.08" x2="-2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="-4.064" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<text x="-10.16" y="10.668" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-10.16" y="-15.24" size="1.778" layer="96" font="vector">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="ACSC02" prefix="LED" uservalue="yes">
<gates>
<gate name="G$1" symbol="7SEG_CC" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ACSC02">
<connects>
<connect gate="G$1" pin="A" pad="7"/>
<connect gate="G$1" pin="B" pad="6"/>
<connect gate="G$1" pin="C" pad="4"/>
<connect gate="G$1" pin="D" pad="2"/>
<connect gate="G$1" pin="DP" pad="5"/>
<connect gate="G$1" pin="E" pad="1"/>
<connect gate="G$1" pin="F" pad="9"/>
<connect gate="G$1" pin="G" pad="10"/>
<connect gate="G$1" pin="K@0" pad="3"/>
<connect gate="G$1" pin="K@1" pad="8"/>
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
<part name="CN1" library="Connector" deviceset="USB-MINIB-SMT" device=""/>
<part name="R1" library="Passive" deviceset="R" device="1608" value="1M"/>
<part name="C1" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="+P1" library="supply1" deviceset="+5V" device=""/>
<part name="FB1" library="Passive" deviceset="FB" device="1608" value="600"/>
<part name="C2" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="U1" library="ic-Microchip" deviceset="MCP1700T-*" device="" technology="33"/>
<part name="+P2" library="supply1" deviceset="+3V3" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="C3" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="C4" library="Passive" deviceset="C" device="2012" value="10u"/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="U2" library="ic-ATMEL" deviceset="AT32UC3B1*" device="-AU" technology="64"/>
<part name="R2" library="Passive" deviceset="R" device="1608" value="22"/>
<part name="R3" library="Passive" deviceset="R" device="1608" value="22"/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="+P3" library="supply1" deviceset="+3V3" device=""/>
<part name="+P4" library="supply1" deviceset="+1V8" device=""/>
<part name="+P5" library="supply1" deviceset="+3V3" device=""/>
<part name="+P7" library="supply1" deviceset="+3V3" device=""/>
<part name="+P8" library="supply1" deviceset="+3V3" device=""/>
<part name="C6" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C7" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C8" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C9" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C10" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="+P9" library="supply1" deviceset="+1V8" device=""/>
<part name="C11" library="Passive" deviceset="C" device="2012" value="10u"/>
<part name="C12" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C13" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C14" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C15" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="SW0" library="Switch" deviceset="TACT4P-SMT" device="6660" value="Reset"/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="R6" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="+P10" library="supply1" deviceset="+3V3" device=""/>
<part name="J1" library="Connector" deviceset="CN-JTAG_ALTERA" device="" value="CN-JTAG"/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="+P11" library="supply1" deviceset="+3V3" device=""/>
<part name="CN3" library="Connector" deviceset="XBEE-*" device="SMT"/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="R7" library="Passive" deviceset="R" device="1608"/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="LED1" library="Passive" deviceset="LED" device="1608" value="Power"/>
<part name="LED2" library="Passive" deviceset="LED" device="1608" value="Transaction"/>
<part name="LED4" library="Passive" deviceset="LED" device="1608" value="DV1"/>
<part name="LED5" library="Passive" deviceset="LED" device="1608" value="DV2"/>
<part name="LED6" library="Passive" deviceset="LED" device="1608" value="DV3"/>
<part name="LED7" library="Passive" deviceset="LED" device="1608" value="DV4"/>
<part name="LED8" library="Passive" deviceset="LED" device="1608" value="DV5"/>
<part name="LED12" library="Passive" deviceset="LED" device="1608" value="X_ON"/>
<part name="LED13" library="Passive" deviceset="LED" device="1608" value="X_AS"/>
<part name="LED14" library="Passive" deviceset="LED" device="1608" value="X_RS"/>
<part name="R15" library="Passive" deviceset="R" device="1608" value="1k"/>
<part name="R16" library="Passive" deviceset="R" device="1608" value="1k"/>
<part name="R17" library="Passive" deviceset="R" device="1608" value="1k"/>
<part name="GND15" library="supply1" deviceset="GND" device=""/>
<part name="X1" library="Oscillator" deviceset="ASDM" device="" value="24MHz"/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="C16" library="Passive" deviceset="C" device="1005" value="10n"/>
<part name="+P15" library="supply1" deviceset="+3V3" device=""/>
<part name="U3" library="ic-FTDI" deviceset="FT232R" device="L"/>
<part name="CN2" library="Connector" deviceset="USB-MINIB-SMT" device=""/>
<part name="D1" library="Diode" deviceset="CMS*" device="" technology="01"/>
<part name="GND19" library="supply1" deviceset="GND" device=""/>
<part name="R18" library="Passive" deviceset="R" device="1608" value="1M"/>
<part name="C19" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="GND20" library="supply1" deviceset="GND" device=""/>
<part name="R19" library="Passive" deviceset="R" device="1608" value="22"/>
<part name="R20" library="Passive" deviceset="R" device="1608" value="22"/>
<part name="C20" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="GND21" library="supply1" deviceset="GND" device=""/>
<part name="C21" library="Passive" deviceset="C" device="1608" value="100n"/>
<part name="GND22" library="supply1" deviceset="GND" device=""/>
<part name="GND23" library="supply1" deviceset="GND" device=""/>
<part name="R21" library="Passive" deviceset="R" device="1608"/>
<part name="R22" library="Passive" deviceset="R" device="1608"/>
<part name="C17" library="Passive" deviceset="C" device="1608" value="1u"/>
<part name="+P12" library="supply1" deviceset="+3V3" device=""/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="FB2" library="Passive" deviceset="FB" device="1608" value="600"/>
<part name="SW1" library="Switch" deviceset="TACT4P-SMT-*" device="6660" value="Left"/>
<part name="SW2" library="Switch" deviceset="TACT4P-SMT-*" device="6660" value="Up"/>
<part name="SW3" library="Switch" deviceset="TACT4P-SMT-*" device="6660" value="Right"/>
<part name="SW4" library="Switch" deviceset="TACT4P-SMT-*" device="6660" value="Down"/>
<part name="SW5" library="Switch" deviceset="TACT4P-SMT-*" device="4735R" value="ROL"/>
<part name="SW6" library="Switch" deviceset="TACT4P-SMT-*" device="4735R" value="ROR"/>
<part name="SW7" library="Switch" deviceset="TACT4P-SMT-*" device="6660" value="FN1"/>
<part name="SW8" library="Switch" deviceset="TACT4P-SMT-*" device="6660" value="FN2"/>
<part name="SW9" library="Switch" deviceset="TACT4P-SMT-*" device="6660" value="FN3"/>
<part name="SW10" library="Switch" deviceset="TACT4P-SMT-*" device="6660" value="FN4"/>
<part name="SW13" library="Switch" deviceset="TACT4P-SMT-*" device="4735R" value="FN7"/>
<part name="SW14" library="Switch" deviceset="TACT4P-SMT-*" device="4735R" value="FN8"/>
<part name="LED15" library="Passive" deviceset="LED" device="1608" value="Error"/>
<part name="GND18" library="supply1" deviceset="GND" device=""/>
<part name="U4" library="ic-Toshiba" deviceset="TC74VHC164F" device="T"/>
<part name="C18" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND24" library="supply1" deviceset="GND" device=""/>
<part name="+P13" library="supply1" deviceset="+3V3" device=""/>
<part name="+P14" library="supply1" deviceset="+3V3" device=""/>
<part name="GND27" library="supply1" deviceset="GND" device=""/>
<part name="GND28" library="supply1" deviceset="GND" device=""/>
<part name="GND29" library="supply1" deviceset="GND" device=""/>
<part name="LED9" library="Passive" deviceset="LED" device="1608" value="DV6"/>
<part name="U7" library="ic-Toshiba" deviceset="TC74VHC165F" device="T"/>
<part name="+P18" library="supply1" deviceset="+3V3" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="GND17" library="supply1" deviceset="GND" device=""/>
<part name="R5" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND32" library="supply1" deviceset="GND" device=""/>
<part name="+P6" library="supply1" deviceset="+3V3" device=""/>
<part name="+P19" library="supply1" deviceset="VBUS" device=""/>
<part name="+P20" library="supply1" deviceset="VBUS" device=""/>
<part name="R4" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND31" library="supply1" deviceset="GND" device=""/>
<part name="R28" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R29" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R30" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R31" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R32" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R33" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R34" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R35" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="U8" library="ic-Toshiba" deviceset="TC74VHC165F" device="T"/>
<part name="+P17" library="supply1" deviceset="+3V3" device=""/>
<part name="GND33" library="supply1" deviceset="GND" device=""/>
<part name="GND34" library="supply1" deviceset="GND" device=""/>
<part name="GND30" library="supply1" deviceset="GND" device=""/>
<part name="+P21" library="supply1" deviceset="+3V3" device=""/>
<part name="R36" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R37" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R38" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R39" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="+P22" library="supply1" deviceset="+3V3" device=""/>
<part name="SW11" library="Switch" deviceset="TACT4P-SMT-*" device="6660" value="FN5"/>
<part name="SW12" library="Switch" deviceset="TACT4P-SMT-*" device="6660" value="FN6"/>
<part name="GND25" library="supply1" deviceset="GND" device=""/>
<part name="U5" library="ic-Toshiba" deviceset="TC74VHC164F" device="T"/>
<part name="+P23" library="supply1" deviceset="+3V3" device=""/>
<part name="C5" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="+P24" library="supply1" deviceset="+3V3" device=""/>
<part name="GND26" library="supply1" deviceset="GND" device=""/>
<part name="LED10" library="Opto" deviceset="ACSC02" device=""/>
<part name="LED11" library="Opto" deviceset="ACSC02" device=""/>
<part name="RA1" library="Passive" deviceset="RA4" device="" value="1k"/>
<part name="RA2" library="Passive" deviceset="RA4" device="" value="1k"/>
<part name="GND35" library="supply1" deviceset="GND" device=""/>
<part name="U6" library="ic-Toshiba" deviceset="TC74VHC164F" device="T"/>
<part name="C22" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND36" library="supply1" deviceset="GND" device=""/>
<part name="+P25" library="supply1" deviceset="+3V3" device=""/>
<part name="+P26" library="supply1" deviceset="+3V3" device=""/>
<part name="RA3" library="Passive" deviceset="RA4" device="" value="1k"/>
<part name="RA4" library="Passive" deviceset="RA4" device="" value="1k"/>
<part name="GND37" library="supply1" deviceset="GND" device=""/>
<part name="RA5" library="Passive" deviceset="RA4" device=""/>
<part name="RA6" library="Passive" deviceset="RA4" device=""/>
<part name="RA7" library="Passive" deviceset="RA4" device=""/>
<part name="R8" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND38" library="supply1" deviceset="GND" device=""/>
<part name="C23" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="LED3" library="Passive" deviceset="LED" device="1608" value="Independent"/>
<part name="LED16" library="Passive" deviceset="LED" device="1608" value="DV_WRN"/>
<part name="LED17" library="Passive" deviceset="LED" device="1608" value="DV_ERR"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="CN1" gate="G$1" x="12.7" y="48.26"/>
<instance part="R1" gate="G$1" x="5.08" y="25.4" rot="R90"/>
<instance part="C1" gate="G$1" x="10.16" y="22.86"/>
<instance part="GND1" gate="1" x="7.62" y="15.24"/>
<instance part="GND2" gate="1" x="27.94" y="40.64"/>
<instance part="+P1" gate="1" x="45.72" y="58.42"/>
<instance part="FB1" gate="G$1" x="35.56" y="53.34"/>
<instance part="C2" gate="G$1" x="27.94" y="45.72"/>
<instance part="U1" gate="G$1" x="68.58" y="50.8"/>
<instance part="+P2" gate="1" x="83.82" y="58.42" rot="MR0"/>
<instance part="GND3" gate="1" x="68.58" y="40.64"/>
<instance part="C3" gate="G$1" x="53.34" y="45.72"/>
<instance part="GND4" gate="1" x="53.34" y="40.64"/>
<instance part="C4" gate="G$1" x="83.82" y="45.72"/>
<instance part="GND5" gate="1" x="83.82" y="40.64"/>
<instance part="U2" gate="G$1" x="172.72" y="58.42"/>
<instance part="R2" gate="G$1" x="127" y="30.48"/>
<instance part="R3" gate="G$1" x="127" y="27.94"/>
<instance part="GND6" gate="1" x="132.08" y="43.18"/>
<instance part="+P3" gate="1" x="127" y="91.44" rot="MR270"/>
<instance part="+P4" gate="G$1" x="124.46" y="83.82" rot="R90"/>
<instance part="+P5" gate="1" x="127" y="68.58" rot="MR270"/>
<instance part="+P7" gate="1" x="127" y="20.32" rot="R90"/>
<instance part="+P8" gate="1" x="142.24" y="129.54"/>
<instance part="C6" gate="G$1" x="142.24" y="116.84"/>
<instance part="C7" gate="G$1" x="149.86" y="116.84"/>
<instance part="C8" gate="G$1" x="154.94" y="116.84"/>
<instance part="C9" gate="G$1" x="160.02" y="116.84"/>
<instance part="C10" gate="G$1" x="165.1" y="116.84"/>
<instance part="GND8" gate="1" x="142.24" y="109.22"/>
<instance part="+P9" gate="G$1" x="177.8" y="129.54"/>
<instance part="C11" gate="G$1" x="177.8" y="116.84"/>
<instance part="C12" gate="G$1" x="185.42" y="116.84"/>
<instance part="C13" gate="G$1" x="190.5" y="116.84"/>
<instance part="C14" gate="G$1" x="195.58" y="116.84"/>
<instance part="C15" gate="G$1" x="200.66" y="116.84"/>
<instance part="GND9" gate="1" x="177.8" y="109.22"/>
<instance part="SW0" gate="G$1" x="76.2" y="78.74"/>
<instance part="GND10" gate="1" x="68.58" y="76.2"/>
<instance part="R6" gate="G$1" x="218.44" y="106.68" rot="R90"/>
<instance part="+P10" gate="1" x="218.44" y="114.3"/>
<instance part="J1" gate="G$1" x="248.92" y="106.68"/>
<instance part="GND11" gate="1" x="261.62" y="101.6"/>
<instance part="+P11" gate="1" x="261.62" y="116.84" rot="MR0"/>
<instance part="CN3" gate="G$1" x="340.36" y="99.06"/>
<instance part="GND13" gate="1" x="314.96" y="83.82"/>
<instance part="R7" gate="G$1" x="383.54" y="93.98"/>
<instance part="GND14" gate="1" x="388.62" y="91.44"/>
<instance part="LED1" gate="G$1" x="203.2" y="160.02"/>
<instance part="LED2" gate="G$1" x="215.9" y="157.48"/>
<instance part="LED4" gate="G$1" x="269.24" y="157.48"/>
<instance part="LED5" gate="G$1" x="274.32" y="162.56"/>
<instance part="LED6" gate="G$1" x="279.4" y="157.48"/>
<instance part="LED7" gate="G$1" x="284.48" y="162.56"/>
<instance part="LED8" gate="G$1" x="289.56" y="157.48"/>
<instance part="LED12" gate="G$1" x="335.28" y="160.02"/>
<instance part="LED13" gate="G$1" x="347.98" y="160.02"/>
<instance part="LED14" gate="G$1" x="360.68" y="160.02"/>
<instance part="R15" gate="G$1" x="335.28" y="152.4" rot="R90"/>
<instance part="R16" gate="G$1" x="347.98" y="152.4" rot="R90"/>
<instance part="R17" gate="G$1" x="360.68" y="152.4" rot="R90"/>
<instance part="GND15" gate="1" x="347.98" y="142.24"/>
<instance part="X1" gate="G$1" x="162.56" y="149.86"/>
<instance part="GND16" gate="1" x="144.78" y="142.24"/>
<instance part="C16" gate="G$1" x="144.78" y="147.32"/>
<instance part="+P15" gate="1" x="144.78" y="157.48"/>
<instance part="U3" gate="G$1" x="340.36" y="43.18"/>
<instance part="CN2" gate="G$1" x="12.7" y="101.6"/>
<instance part="D1" gate="1" x="22.86" y="106.68"/>
<instance part="GND19" gate="1" x="20.32" y="93.98"/>
<instance part="R18" gate="G$1" x="10.16" y="78.74" rot="R90"/>
<instance part="C19" gate="G$1" x="15.24" y="76.2"/>
<instance part="GND20" gate="1" x="12.7" y="68.58"/>
<instance part="R19" gate="G$1" x="309.88" y="48.26"/>
<instance part="R20" gate="G$1" x="309.88" y="45.72"/>
<instance part="C20" gate="G$1" x="297.18" y="60.96"/>
<instance part="GND21" gate="1" x="297.18" y="55.88"/>
<instance part="C21" gate="G$1" x="307.34" y="60.96"/>
<instance part="GND22" gate="1" x="307.34" y="55.88"/>
<instance part="GND23" gate="1" x="340.36" y="17.78"/>
<instance part="R21" gate="G$1" x="370.84" y="60.96"/>
<instance part="R22" gate="G$1" x="370.84" y="58.42"/>
<instance part="C17" gate="G$1" x="297.18" y="101.6"/>
<instance part="+P12" gate="1" x="279.4" y="109.22" rot="MR270"/>
<instance part="GND12" gate="1" x="297.18" y="96.52"/>
<instance part="FB2" gate="G$1" x="289.56" y="109.22"/>
<instance part="SW1" gate="G$1" x="-5.08" y="172.72"/>
<instance part="SW2" gate="G$1" x="2.54" y="172.72"/>
<instance part="SW3" gate="G$1" x="10.16" y="172.72"/>
<instance part="SW4" gate="G$1" x="17.78" y="172.72"/>
<instance part="SW5" gate="G$1" x="10.16" y="203.2"/>
<instance part="SW6" gate="G$1" x="40.64" y="203.2"/>
<instance part="SW7" gate="G$1" x="33.02" y="172.72"/>
<instance part="SW8" gate="G$1" x="40.64" y="172.72"/>
<instance part="SW9" gate="G$1" x="48.26" y="172.72"/>
<instance part="SW10" gate="G$1" x="55.88" y="172.72"/>
<instance part="SW13" gate="G$1" x="17.78" y="203.2"/>
<instance part="SW14" gate="G$1" x="33.02" y="203.2"/>
<instance part="LED15" gate="G$1" x="241.3" y="157.48"/>
<instance part="GND18" gate="1" x="215.9" y="142.24"/>
<instance part="U4" gate="G$1" x="279.4" y="281.94"/>
<instance part="C18" gate="G$1" x="261.62" y="289.56"/>
<instance part="GND24" gate="1" x="261.62" y="284.48"/>
<instance part="+P13" gate="1" x="261.62" y="299.72"/>
<instance part="+P14" gate="1" x="264.16" y="271.78" rot="R90"/>
<instance part="GND27" gate="1" x="25.4" y="198.12"/>
<instance part="GND28" gate="1" x="241.3" y="40.64"/>
<instance part="GND29" gate="1" x="284.48" y="142.24"/>
<instance part="LED9" gate="G$1" x="294.64" y="162.56"/>
<instance part="U7" gate="G$1" x="119.38" y="187.96"/>
<instance part="+P18" gate="1" x="104.14" y="203.2" rot="R90"/>
<instance part="GND7" gate="1" x="106.68" y="193.04"/>
<instance part="GND17" gate="1" x="106.68" y="180.34"/>
<instance part="R5" gate="G$1" x="228.6" y="27.94" rot="R90"/>
<instance part="GND32" gate="1" x="228.6" y="20.32"/>
<instance part="+P6" gate="1" x="127" y="35.56" rot="MR270"/>
<instance part="+P19" gate="G$1" x="27.94" y="111.76" rot="MR0"/>
<instance part="+P20" gate="G$1" x="292.1" y="71.12" rot="MR270"/>
<instance part="R4" gate="G$1" x="236.22" y="48.26" rot="R90"/>
<instance part="GND31" gate="1" x="236.22" y="40.64"/>
<instance part="R28" gate="G$1" x="137.16" y="200.66" rot="R90"/>
<instance part="R29" gate="G$1" x="139.7" y="200.66" rot="R90"/>
<instance part="R30" gate="G$1" x="142.24" y="200.66" rot="R90"/>
<instance part="R31" gate="G$1" x="144.78" y="200.66" rot="R90"/>
<instance part="R32" gate="G$1" x="147.32" y="200.66" rot="R90"/>
<instance part="R33" gate="G$1" x="149.86" y="200.66" rot="R90"/>
<instance part="R34" gate="G$1" x="152.4" y="200.66" rot="R90"/>
<instance part="R35" gate="G$1" x="154.94" y="200.66" rot="R90"/>
<instance part="U8" gate="G$1" x="119.38" y="231.14"/>
<instance part="+P17" gate="1" x="101.6" y="251.46"/>
<instance part="GND33" gate="1" x="101.6" y="236.22"/>
<instance part="GND34" gate="1" x="106.68" y="223.52"/>
<instance part="GND30" gate="1" x="132.08" y="243.84"/>
<instance part="+P21" gate="1" x="144.78" y="210.82"/>
<instance part="R36" gate="G$1" x="137.16" y="233.68" rot="R90"/>
<instance part="R37" gate="G$1" x="139.7" y="233.68" rot="R90"/>
<instance part="R38" gate="G$1" x="142.24" y="233.68" rot="R90"/>
<instance part="R39" gate="G$1" x="144.78" y="233.68" rot="R90"/>
<instance part="+P22" gate="1" x="139.7" y="243.84"/>
<instance part="SW11" gate="G$1" x="63.5" y="172.72"/>
<instance part="SW12" gate="G$1" x="71.12" y="172.72"/>
<instance part="GND25" gate="1" x="25.4" y="165.1"/>
<instance part="U5" gate="G$1" x="279.4" y="243.84"/>
<instance part="+P23" gate="1" x="264.16" y="233.68" rot="R90"/>
<instance part="C5" gate="G$1" x="261.62" y="251.46"/>
<instance part="+P24" gate="1" x="261.62" y="261.62"/>
<instance part="GND26" gate="1" x="261.62" y="246.38"/>
<instance part="LED10" gate="G$1" x="330.2" y="246.38"/>
<instance part="LED11" gate="G$1" x="330.2" y="208.28"/>
<instance part="RA1" gate="A" x="299.72" y="254"/>
<instance part="RA1" gate="B" x="299.72" y="251.46"/>
<instance part="RA1" gate="C" x="299.72" y="248.92"/>
<instance part="RA1" gate="D" x="299.72" y="246.38"/>
<instance part="RA2" gate="A" x="299.72" y="243.84"/>
<instance part="RA2" gate="B" x="299.72" y="241.3"/>
<instance part="RA2" gate="C" x="299.72" y="238.76"/>
<instance part="RA2" gate="D" x="299.72" y="236.22"/>
<instance part="GND35" gate="1" x="345.44" y="233.68"/>
<instance part="U6" gate="G$1" x="279.4" y="205.74"/>
<instance part="C22" gate="G$1" x="261.62" y="213.36"/>
<instance part="GND36" gate="1" x="261.62" y="208.28"/>
<instance part="+P25" gate="1" x="261.62" y="223.52"/>
<instance part="+P26" gate="1" x="264.16" y="195.58" rot="R90"/>
<instance part="RA3" gate="A" x="299.72" y="215.9"/>
<instance part="RA3" gate="B" x="299.72" y="213.36"/>
<instance part="RA3" gate="C" x="299.72" y="210.82"/>
<instance part="RA3" gate="D" x="299.72" y="208.28"/>
<instance part="RA4" gate="A" x="299.72" y="205.74"/>
<instance part="RA4" gate="B" x="299.72" y="203.2"/>
<instance part="RA4" gate="C" x="299.72" y="200.66"/>
<instance part="RA4" gate="D" x="299.72" y="198.12"/>
<instance part="GND37" gate="1" x="345.44" y="195.58"/>
<instance part="RA5" gate="A" x="203.2" y="152.4" rot="R90"/>
<instance part="RA5" gate="B" x="215.9" y="152.4" rot="R90"/>
<instance part="RA5" gate="C" x="228.6" y="152.4" rot="R90"/>
<instance part="RA5" gate="D" x="241.3" y="152.4" rot="R90"/>
<instance part="RA6" gate="A" x="269.24" y="152.4" rot="R90"/>
<instance part="RA6" gate="B" x="274.32" y="152.4" rot="R90"/>
<instance part="RA6" gate="C" x="279.4" y="152.4" rot="R90"/>
<instance part="RA6" gate="D" x="284.48" y="152.4" rot="R90"/>
<instance part="RA7" gate="A" x="289.56" y="152.4" rot="R90"/>
<instance part="RA7" gate="B" x="294.64" y="152.4" rot="R90"/>
<instance part="RA7" gate="C" x="304.8" y="152.4" rot="R90"/>
<instance part="RA7" gate="D" x="309.88" y="152.4" rot="R90"/>
<instance part="R8" gate="G$1" x="241.3" y="48.26" rot="R90"/>
<instance part="GND38" gate="1" x="132.08" y="200.66"/>
<instance part="C23" gate="G$1" x="101.6" y="241.3"/>
<instance part="LED3" gate="G$1" x="228.6" y="162.56"/>
<instance part="LED16" gate="G$1" x="304.8" y="157.48"/>
<instance part="LED17" gate="G$1" x="309.88" y="162.56"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$2" class="0">
<segment>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="10.16" y1="27.94" x2="10.16" y2="30.48" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="2"/>
<wire x1="10.16" y1="30.48" x2="7.62" y2="30.48" width="0.1524" layer="91"/>
<wire x1="7.62" y1="30.48" x2="5.08" y2="30.48" width="0.1524" layer="91"/>
<wire x1="5.08" y1="30.48" x2="5.08" y2="27.94" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="S1"/>
<wire x1="7.62" y1="30.48" x2="7.62" y2="35.56" width="0.1524" layer="91"/>
<junction x="7.62" y="30.48"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="10.16" y1="20.32" x2="10.16" y2="17.78" width="0.1524" layer="91"/>
<wire x1="10.16" y1="17.78" x2="7.62" y2="17.78" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="7.62" y1="17.78" x2="5.08" y2="17.78" width="0.1524" layer="91"/>
<wire x1="5.08" y1="17.78" x2="5.08" y2="20.32" width="0.1524" layer="91"/>
<junction x="7.62" y="17.78"/>
<pinref part="GND1" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="CN1" gate="G$1" pin="GND"/>
<wire x1="17.78" y1="43.18" x2="27.94" y2="43.18" width="0.1524" layer="91"/>
<pinref part="GND2" gate="1" pin="GND"/>
<pinref part="C2" gate="G$1" pin="2"/>
<junction x="27.94" y="43.18"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GND"/>
<pinref part="GND3" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="2"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C4" gate="G$1" pin="2"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="GNDANA"/>
<wire x1="134.62" y1="53.34" x2="132.08" y2="53.34" width="0.1524" layer="91"/>
<wire x1="132.08" y1="53.34" x2="132.08" y2="50.8" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="GND@2"/>
<wire x1="132.08" y1="50.8" x2="132.08" y2="48.26" width="0.1524" layer="91"/>
<wire x1="132.08" y1="48.26" x2="132.08" y2="45.72" width="0.1524" layer="91"/>
<wire x1="134.62" y1="45.72" x2="132.08" y2="45.72" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="GND@1"/>
<wire x1="134.62" y1="48.26" x2="132.08" y2="48.26" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="GND@0"/>
<wire x1="134.62" y1="50.8" x2="132.08" y2="50.8" width="0.1524" layer="91"/>
<pinref part="GND6" gate="1" pin="GND"/>
<junction x="132.08" y="45.72"/>
<junction x="132.08" y="48.26"/>
<junction x="132.08" y="50.8"/>
</segment>
<segment>
<pinref part="C10" gate="G$1" pin="2"/>
<wire x1="165.1" y1="114.3" x2="165.1" y2="111.76" width="0.1524" layer="91"/>
<pinref part="GND8" gate="1" pin="GND"/>
<wire x1="165.1" y1="111.76" x2="160.02" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="2"/>
<wire x1="160.02" y1="111.76" x2="154.94" y2="111.76" width="0.1524" layer="91"/>
<wire x1="149.86" y1="111.76" x2="142.24" y2="111.76" width="0.1524" layer="91"/>
<wire x1="142.24" y1="111.76" x2="142.24" y2="114.3" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="2"/>
<wire x1="149.86" y1="114.3" x2="149.86" y2="111.76" width="0.1524" layer="91"/>
<wire x1="149.86" y1="111.76" x2="154.94" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="2"/>
<wire x1="154.94" y1="114.3" x2="154.94" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="2"/>
<wire x1="160.02" y1="114.3" x2="160.02" y2="111.76" width="0.1524" layer="91"/>
<junction x="142.24" y="111.76"/>
<junction x="149.86" y="111.76"/>
<junction x="154.94" y="111.76"/>
<junction x="160.02" y="111.76"/>
</segment>
<segment>
<pinref part="C11" gate="G$1" pin="2"/>
<wire x1="177.8" y1="114.3" x2="177.8" y2="111.76" width="0.1524" layer="91"/>
<wire x1="177.8" y1="111.76" x2="185.42" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="2"/>
<wire x1="185.42" y1="111.76" x2="190.5" y2="111.76" width="0.1524" layer="91"/>
<wire x1="190.5" y1="111.76" x2="195.58" y2="111.76" width="0.1524" layer="91"/>
<wire x1="195.58" y1="111.76" x2="200.66" y2="111.76" width="0.1524" layer="91"/>
<wire x1="200.66" y1="111.76" x2="200.66" y2="114.3" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="2"/>
<wire x1="195.58" y1="114.3" x2="195.58" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C13" gate="G$1" pin="2"/>
<wire x1="190.5" y1="114.3" x2="190.5" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C12" gate="G$1" pin="2"/>
<wire x1="185.42" y1="114.3" x2="185.42" y2="111.76" width="0.1524" layer="91"/>
<pinref part="GND9" gate="1" pin="GND"/>
<junction x="177.8" y="111.76"/>
<junction x="185.42" y="111.76"/>
<junction x="190.5" y="111.76"/>
<junction x="195.58" y="111.76"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="GND@0"/>
<wire x1="259.08" y1="106.68" x2="261.62" y2="106.68" width="0.1524" layer="91"/>
<wire x1="261.62" y1="106.68" x2="261.62" y2="104.14" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="GND@1"/>
<wire x1="261.62" y1="104.14" x2="259.08" y2="104.14" width="0.1524" layer="91"/>
<pinref part="GND11" gate="1" pin="GND"/>
<junction x="261.62" y="104.14"/>
</segment>
<segment>
<pinref part="CN3" gate="G$1" pin="GND"/>
<wire x1="317.5" y1="86.36" x2="314.96" y2="86.36" width="0.1524" layer="91"/>
<pinref part="GND13" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R7" gate="G$1" pin="2"/>
<wire x1="386.08" y1="93.98" x2="388.62" y2="93.98" width="0.1524" layer="91"/>
<pinref part="GND14" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R15" gate="G$1" pin="1"/>
<wire x1="335.28" y1="147.32" x2="335.28" y2="144.78" width="0.1524" layer="91"/>
<wire x1="335.28" y1="144.78" x2="347.98" y2="144.78" width="0.1524" layer="91"/>
<pinref part="R17" gate="G$1" pin="1"/>
<wire x1="347.98" y1="144.78" x2="360.68" y2="144.78" width="0.1524" layer="91"/>
<wire x1="360.68" y1="144.78" x2="360.68" y2="147.32" width="0.1524" layer="91"/>
<pinref part="R16" gate="G$1" pin="1"/>
<wire x1="347.98" y1="147.32" x2="347.98" y2="144.78" width="0.1524" layer="91"/>
<pinref part="GND15" gate="1" pin="GND"/>
<junction x="347.98" y="144.78"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="GND"/>
<wire x1="154.94" y1="144.78" x2="144.78" y2="144.78" width="0.1524" layer="91"/>
<pinref part="GND16" gate="1" pin="GND"/>
<pinref part="C16" gate="G$1" pin="2"/>
<junction x="144.78" y="144.78"/>
</segment>
<segment>
<pinref part="CN2" gate="G$1" pin="GND"/>
<wire x1="17.78" y1="96.52" x2="20.32" y2="96.52" width="0.1524" layer="91"/>
<pinref part="GND19" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C19" gate="G$1" pin="2"/>
<wire x1="15.24" y1="73.66" x2="15.24" y2="71.12" width="0.1524" layer="91"/>
<wire x1="15.24" y1="71.12" x2="12.7" y2="71.12" width="0.1524" layer="91"/>
<pinref part="R18" gate="G$1" pin="1"/>
<wire x1="12.7" y1="71.12" x2="10.16" y2="71.12" width="0.1524" layer="91"/>
<wire x1="10.16" y1="71.12" x2="10.16" y2="73.66" width="0.1524" layer="91"/>
<junction x="12.7" y="71.12"/>
<pinref part="GND20" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C20" gate="G$1" pin="2"/>
<pinref part="GND21" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C21" gate="G$1" pin="2"/>
<pinref part="GND22" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="AGND"/>
<wire x1="332.74" y1="22.86" x2="332.74" y2="20.32" width="0.1524" layer="91"/>
<wire x1="332.74" y1="20.32" x2="335.28" y2="20.32" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="GND@2"/>
<wire x1="335.28" y1="20.32" x2="337.82" y2="20.32" width="0.1524" layer="91"/>
<wire x1="337.82" y1="20.32" x2="340.36" y2="20.32" width="0.1524" layer="91"/>
<wire x1="340.36" y1="20.32" x2="340.36" y2="22.86" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="GND@1"/>
<wire x1="337.82" y1="22.86" x2="337.82" y2="20.32" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="GND@0"/>
<wire x1="335.28" y1="22.86" x2="335.28" y2="20.32" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="TEST"/>
<wire x1="345.44" y1="22.86" x2="345.44" y2="20.32" width="0.1524" layer="91"/>
<wire x1="345.44" y1="20.32" x2="340.36" y2="20.32" width="0.1524" layer="91"/>
<pinref part="GND23" gate="1" pin="GND"/>
<junction x="340.36" y="20.32"/>
<junction x="335.28" y="20.32"/>
<junction x="337.82" y="20.32"/>
</segment>
<segment>
<pinref part="C17" gate="G$1" pin="2"/>
<pinref part="GND12" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="269.24" y1="147.32" x2="269.24" y2="144.78" width="0.1524" layer="91"/>
<wire x1="269.24" y1="144.78" x2="274.32" y2="144.78" width="0.1524" layer="91"/>
<wire x1="274.32" y1="144.78" x2="279.4" y2="144.78" width="0.1524" layer="91"/>
<wire x1="279.4" y1="144.78" x2="284.48" y2="144.78" width="0.1524" layer="91"/>
<wire x1="284.48" y1="144.78" x2="289.56" y2="144.78" width="0.1524" layer="91"/>
<wire x1="289.56" y1="144.78" x2="289.56" y2="147.32" width="0.1524" layer="91"/>
<wire x1="284.48" y1="147.32" x2="284.48" y2="144.78" width="0.1524" layer="91"/>
<wire x1="279.4" y1="147.32" x2="279.4" y2="144.78" width="0.1524" layer="91"/>
<wire x1="274.32" y1="147.32" x2="274.32" y2="144.78" width="0.1524" layer="91"/>
<junction x="279.4" y="144.78"/>
<junction x="274.32" y="144.78"/>
<junction x="284.48" y="144.78"/>
<pinref part="GND29" gate="1" pin="GND"/>
<wire x1="289.56" y1="144.78" x2="294.64" y2="144.78" width="0.1524" layer="91"/>
<wire x1="294.64" y1="147.32" x2="294.64" y2="144.78" width="0.1524" layer="91"/>
<junction x="289.56" y="144.78"/>
<pinref part="RA6" gate="A" pin="1"/>
<pinref part="RA6" gate="B" pin="1"/>
<pinref part="RA6" gate="C" pin="1"/>
<pinref part="RA6" gate="D" pin="1"/>
<pinref part="RA7" gate="A" pin="1"/>
<pinref part="RA7" gate="B" pin="1"/>
<wire x1="294.64" y1="144.78" x2="304.8" y2="144.78" width="0.1524" layer="91"/>
<pinref part="RA7" gate="C" pin="1"/>
<wire x1="304.8" y1="144.78" x2="304.8" y2="147.32" width="0.1524" layer="91"/>
<pinref part="RA7" gate="D" pin="1"/>
<wire x1="309.88" y1="147.32" x2="309.88" y2="144.78" width="0.1524" layer="91"/>
<wire x1="309.88" y1="144.78" x2="304.8" y2="144.78" width="0.1524" layer="91"/>
<junction x="294.64" y="144.78"/>
<junction x="304.8" y="144.78"/>
</segment>
<segment>
<wire x1="215.9" y1="147.32" x2="215.9" y2="144.78" width="0.1524" layer="91"/>
<wire x1="228.6" y1="147.32" x2="228.6" y2="144.78" width="0.1524" layer="91"/>
<wire x1="203.2" y1="147.32" x2="203.2" y2="144.78" width="0.1524" layer="91"/>
<wire x1="228.6" y1="144.78" x2="215.9" y2="144.78" width="0.1524" layer="91"/>
<junction x="215.9" y="144.78"/>
<wire x1="215.9" y1="144.78" x2="203.2" y2="144.78" width="0.1524" layer="91"/>
<pinref part="GND18" gate="1" pin="GND"/>
<pinref part="RA5" gate="A" pin="1"/>
<pinref part="RA5" gate="B" pin="1"/>
<pinref part="RA5" gate="C" pin="1"/>
<wire x1="228.6" y1="144.78" x2="241.3" y2="144.78" width="0.1524" layer="91"/>
<pinref part="RA5" gate="D" pin="1"/>
<wire x1="241.3" y1="144.78" x2="241.3" y2="147.32" width="0.1524" layer="91"/>
<junction x="228.6" y="144.78"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="GND"/>
<pinref part="C18" gate="G$1" pin="2"/>
<wire x1="269.24" y1="287.02" x2="261.62" y2="287.02" width="0.1524" layer="91"/>
<pinref part="GND24" gate="1" pin="GND"/>
<junction x="261.62" y="287.02"/>
</segment>
<segment>
<wire x1="7.62" y1="208.28" x2="15.24" y2="208.28" width="0.1524" layer="91"/>
<junction x="25.4" y="200.66"/>
<pinref part="GND27" gate="1" pin="GND"/>
<pinref part="SW5" gate="G$1" pin="A1"/>
<wire x1="7.62" y1="205.74" x2="7.62" y2="208.28" width="0.1524" layer="91"/>
<pinref part="SW13" gate="G$1" pin="A1"/>
<wire x1="15.24" y1="205.74" x2="15.24" y2="208.28" width="0.1524" layer="91"/>
<junction x="15.24" y="208.28"/>
<wire x1="15.24" y1="208.28" x2="25.4" y2="208.28" width="0.1524" layer="91"/>
<wire x1="25.4" y1="208.28" x2="25.4" y2="200.66" width="0.1524" layer="91"/>
<junction x="25.4" y="208.28"/>
<pinref part="SW5" gate="G$1" pin="A2"/>
<wire x1="30.48" y1="208.28" x2="25.4" y2="208.28" width="0.1524" layer="91"/>
<wire x1="7.62" y1="203.2" x2="7.62" y2="200.66" width="0.1524" layer="91"/>
<wire x1="7.62" y1="200.66" x2="15.24" y2="200.66" width="0.1524" layer="91"/>
<pinref part="SW13" gate="G$1" pin="A2"/>
<wire x1="15.24" y1="200.66" x2="15.24" y2="203.2" width="0.1524" layer="91"/>
<wire x1="15.24" y1="200.66" x2="25.4" y2="200.66" width="0.1524" layer="91"/>
<junction x="15.24" y="200.66"/>
<wire x1="25.4" y1="200.66" x2="30.48" y2="200.66" width="0.1524" layer="91"/>
<wire x1="30.48" y1="200.66" x2="38.1" y2="200.66" width="0.1524" layer="91"/>
<pinref part="SW14" gate="G$1" pin="A2"/>
<wire x1="30.48" y1="200.66" x2="30.48" y2="203.2" width="0.1524" layer="91"/>
<pinref part="SW14" gate="G$1" pin="A1"/>
<wire x1="30.48" y1="205.74" x2="30.48" y2="208.28" width="0.1524" layer="91"/>
<junction x="30.48" y="200.66"/>
<pinref part="SW6" gate="G$1" pin="A2"/>
<wire x1="38.1" y1="200.66" x2="38.1" y2="203.2" width="0.1524" layer="91"/>
<wire x1="30.48" y1="208.28" x2="38.1" y2="208.28" width="0.1524" layer="91"/>
<pinref part="SW6" gate="G$1" pin="A1"/>
<wire x1="38.1" y1="208.28" x2="38.1" y2="205.74" width="0.1524" layer="91"/>
<junction x="30.48" y="208.28"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="GND"/>
<wire x1="109.22" y1="195.58" x2="106.68" y2="195.58" width="0.1524" layer="91"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="CKINH"/>
<wire x1="109.22" y1="182.88" x2="106.68" y2="182.88" width="0.1524" layer="91"/>
<pinref part="GND17" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="SW0" gate="G$1" pin="A1"/>
<wire x1="73.66" y1="81.28" x2="68.58" y2="81.28" width="0.1524" layer="91"/>
<pinref part="GND10" gate="1" pin="GND"/>
<wire x1="68.58" y1="81.28" x2="68.58" y2="78.74" width="0.1524" layer="91"/>
<pinref part="SW0" gate="G$1" pin="A2"/>
<wire x1="68.58" y1="78.74" x2="73.66" y2="78.74" width="0.1524" layer="91"/>
<junction x="68.58" y="78.74"/>
</segment>
<segment>
<pinref part="GND32" gate="1" pin="GND"/>
<pinref part="R5" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="R4" gate="G$1" pin="1"/>
<pinref part="GND31" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND33" gate="1" pin="GND"/>
<pinref part="U8" gate="G$1" pin="GND"/>
<wire x1="101.6" y1="238.76" x2="109.22" y2="238.76" width="0.1524" layer="91"/>
<pinref part="C23" gate="G$1" pin="2"/>
<junction x="101.6" y="238.76"/>
</segment>
<segment>
<pinref part="GND34" gate="1" pin="GND"/>
<pinref part="U8" gate="G$1" pin="CKINH"/>
<wire x1="106.68" y1="226.06" x2="109.22" y2="226.06" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="SI"/>
<wire x1="129.54" y1="246.38" x2="132.08" y2="246.38" width="0.1524" layer="91"/>
<pinref part="GND30" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND25" gate="1" pin="GND"/>
<wire x1="25.4" y1="167.64" x2="25.4" y2="170.18" width="0.1524" layer="91"/>
<pinref part="SW12" gate="G$1" pin="A1"/>
<wire x1="25.4" y1="170.18" x2="25.4" y2="177.8" width="0.1524" layer="91"/>
<wire x1="68.58" y1="175.26" x2="68.58" y2="177.8" width="0.1524" layer="91"/>
<wire x1="68.58" y1="177.8" x2="60.96" y2="177.8" width="0.1524" layer="91"/>
<pinref part="SW12" gate="G$1" pin="A2"/>
<wire x1="60.96" y1="177.8" x2="53.34" y2="177.8" width="0.1524" layer="91"/>
<wire x1="53.34" y1="177.8" x2="45.72" y2="177.8" width="0.1524" layer="91"/>
<wire x1="45.72" y1="177.8" x2="43.18" y2="177.8" width="0.1524" layer="91"/>
<wire x1="43.18" y1="177.8" x2="35.56" y2="177.8" width="0.1524" layer="91"/>
<wire x1="35.56" y1="177.8" x2="25.4" y2="177.8" width="0.1524" layer="91"/>
<wire x1="68.58" y1="172.72" x2="68.58" y2="170.18" width="0.1524" layer="91"/>
<wire x1="68.58" y1="170.18" x2="60.96" y2="170.18" width="0.1524" layer="91"/>
<pinref part="SW11" gate="G$1" pin="A2"/>
<wire x1="60.96" y1="170.18" x2="53.34" y2="170.18" width="0.1524" layer="91"/>
<wire x1="53.34" y1="170.18" x2="45.72" y2="170.18" width="0.1524" layer="91"/>
<wire x1="45.72" y1="170.18" x2="43.18" y2="170.18" width="0.1524" layer="91"/>
<wire x1="43.18" y1="170.18" x2="35.56" y2="170.18" width="0.1524" layer="91"/>
<wire x1="35.56" y1="170.18" x2="25.4" y2="170.18" width="0.1524" layer="91"/>
<wire x1="60.96" y1="172.72" x2="60.96" y2="170.18" width="0.1524" layer="91"/>
<pinref part="SW11" gate="G$1" pin="A1"/>
<wire x1="60.96" y1="175.26" x2="60.96" y2="177.8" width="0.1524" layer="91"/>
<wire x1="25.4" y1="170.18" x2="20.32" y2="170.18" width="0.1524" layer="91"/>
<pinref part="SW1" gate="G$1" pin="B2"/>
<wire x1="20.32" y1="170.18" x2="7.62" y2="170.18" width="0.1524" layer="91"/>
<wire x1="7.62" y1="170.18" x2="5.08" y2="170.18" width="0.1524" layer="91"/>
<wire x1="5.08" y1="170.18" x2="-2.54" y2="170.18" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="170.18" x2="-2.54" y2="172.72" width="0.1524" layer="91"/>
<pinref part="SW2" gate="G$1" pin="B2"/>
<wire x1="5.08" y1="172.72" x2="5.08" y2="170.18" width="0.1524" layer="91"/>
<pinref part="SW4" gate="G$1" pin="B2"/>
<wire x1="20.32" y1="172.72" x2="20.32" y2="170.18" width="0.1524" layer="91"/>
<wire x1="25.4" y1="177.8" x2="20.32" y2="177.8" width="0.1524" layer="91"/>
<pinref part="SW1" gate="G$1" pin="B1"/>
<wire x1="20.32" y1="177.8" x2="7.62" y2="177.8" width="0.1524" layer="91"/>
<wire x1="7.62" y1="177.8" x2="5.08" y2="177.8" width="0.1524" layer="91"/>
<wire x1="5.08" y1="177.8" x2="-2.54" y2="177.8" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="177.8" x2="-2.54" y2="175.26" width="0.1524" layer="91"/>
<pinref part="SW2" gate="G$1" pin="B1"/>
<wire x1="5.08" y1="175.26" x2="5.08" y2="177.8" width="0.1524" layer="91"/>
<pinref part="SW4" gate="G$1" pin="B1"/>
<wire x1="20.32" y1="175.26" x2="20.32" y2="177.8" width="0.1524" layer="91"/>
<junction x="5.08" y="177.8"/>
<junction x="5.08" y="170.18"/>
<junction x="20.32" y="170.18"/>
<junction x="25.4" y="170.18"/>
<junction x="25.4" y="177.8"/>
<junction x="20.32" y="177.8"/>
<junction x="60.96" y="170.18"/>
<junction x="60.96" y="177.8"/>
<pinref part="SW3" gate="G$1" pin="A1"/>
<wire x1="7.62" y1="175.26" x2="7.62" y2="177.8" width="0.1524" layer="91"/>
<pinref part="SW3" gate="G$1" pin="A2"/>
<wire x1="7.62" y1="172.72" x2="7.62" y2="170.18" width="0.1524" layer="91"/>
<junction x="7.62" y="177.8"/>
<junction x="7.62" y="170.18"/>
<pinref part="SW7" gate="G$1" pin="B1"/>
<wire x1="35.56" y1="175.26" x2="35.56" y2="177.8" width="0.1524" layer="91"/>
<pinref part="SW7" gate="G$1" pin="B2"/>
<wire x1="35.56" y1="170.18" x2="35.56" y2="172.72" width="0.1524" layer="91"/>
<pinref part="SW8" gate="G$1" pin="B1"/>
<wire x1="43.18" y1="175.26" x2="43.18" y2="177.8" width="0.1524" layer="91"/>
<pinref part="SW8" gate="G$1" pin="B2"/>
<wire x1="43.18" y1="170.18" x2="43.18" y2="172.72" width="0.1524" layer="91"/>
<junction x="43.18" y="177.8"/>
<junction x="43.18" y="170.18"/>
<junction x="35.56" y="177.8"/>
<junction x="35.56" y="170.18"/>
<pinref part="SW9" gate="G$1" pin="A1"/>
<wire x1="45.72" y1="175.26" x2="45.72" y2="177.8" width="0.1524" layer="91"/>
<pinref part="SW9" gate="G$1" pin="A2"/>
<wire x1="45.72" y1="170.18" x2="45.72" y2="172.72" width="0.1524" layer="91"/>
<pinref part="SW10" gate="G$1" pin="A1"/>
<wire x1="53.34" y1="175.26" x2="53.34" y2="177.8" width="0.1524" layer="91"/>
<pinref part="SW10" gate="G$1" pin="A2"/>
<wire x1="53.34" y1="172.72" x2="53.34" y2="170.18" width="0.1524" layer="91"/>
<junction x="45.72" y="177.8"/>
<junction x="53.34" y="177.8"/>
<junction x="53.34" y="170.18"/>
<junction x="45.72" y="170.18"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="GND"/>
<wire x1="269.24" y1="248.92" x2="261.62" y2="248.92" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="2"/>
<pinref part="GND26" gate="1" pin="GND"/>
<junction x="261.62" y="248.92"/>
</segment>
<segment>
<pinref part="LED10" gate="G$1" pin="K@0"/>
<wire x1="342.9" y1="238.76" x2="345.44" y2="238.76" width="0.1524" layer="91"/>
<wire x1="345.44" y1="238.76" x2="345.44" y2="236.22" width="0.1524" layer="91"/>
<pinref part="LED10" gate="G$1" pin="K@1"/>
<wire x1="345.44" y1="236.22" x2="342.9" y2="236.22" width="0.1524" layer="91"/>
<pinref part="GND35" gate="1" pin="GND"/>
<junction x="345.44" y="236.22"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="GND"/>
<wire x1="269.24" y1="210.82" x2="261.62" y2="210.82" width="0.1524" layer="91"/>
<pinref part="C22" gate="G$1" pin="2"/>
<pinref part="GND36" gate="1" pin="GND"/>
<junction x="261.62" y="210.82"/>
</segment>
<segment>
<pinref part="LED11" gate="G$1" pin="K@0"/>
<wire x1="342.9" y1="200.66" x2="345.44" y2="200.66" width="0.1524" layer="91"/>
<wire x1="345.44" y1="200.66" x2="345.44" y2="198.12" width="0.1524" layer="91"/>
<pinref part="LED11" gate="G$1" pin="K@1"/>
<wire x1="345.44" y1="198.12" x2="342.9" y2="198.12" width="0.1524" layer="91"/>
<pinref part="GND37" gate="1" pin="GND"/>
<junction x="345.44" y="198.12"/>
</segment>
<segment>
<pinref part="GND28" gate="1" pin="GND"/>
<pinref part="R8" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="SI"/>
<wire x1="129.54" y1="203.2" x2="132.08" y2="203.2" width="0.1524" layer="91"/>
<pinref part="GND38" gate="1" pin="GND"/>
</segment>
</net>
<net name="D-" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="D-"/>
<wire x1="17.78" y1="50.8" x2="20.32" y2="50.8" width="0.1524" layer="91"/>
<label x="20.32" y="50.8" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="114.3" y1="27.94" x2="121.92" y2="27.94" width="0.1524" layer="91"/>
<label x="114.3" y="27.94" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="D+" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="D+"/>
<wire x1="17.78" y1="48.26" x2="20.32" y2="48.26" width="0.1524" layer="91"/>
<label x="20.32" y="48.26" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="121.92" y1="30.48" x2="114.3" y2="30.48" width="0.1524" layer="91"/>
<label x="114.3" y="30.48" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="FB1" gate="G$1" pin="2"/>
<pinref part="U1" gate="G$1" pin="VI"/>
<wire x1="40.64" y1="53.34" x2="45.72" y2="53.34" width="0.1524" layer="91"/>
<pinref part="+P1" gate="1" pin="+5V"/>
<wire x1="45.72" y1="53.34" x2="53.34" y2="53.34" width="0.1524" layer="91"/>
<wire x1="53.34" y1="53.34" x2="58.42" y2="53.34" width="0.1524" layer="91"/>
<wire x1="45.72" y1="53.34" x2="45.72" y2="55.88" width="0.1524" layer="91"/>
<junction x="45.72" y="53.34"/>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="53.34" y1="50.8" x2="53.34" y2="53.34" width="0.1524" layer="91"/>
<junction x="53.34" y="53.34"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VO"/>
<wire x1="78.74" y1="53.34" x2="83.82" y2="53.34" width="0.1524" layer="91"/>
<pinref part="+P2" gate="1" pin="+3V3"/>
<wire x1="83.82" y1="53.34" x2="83.82" y2="55.88" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="83.82" y1="50.8" x2="83.82" y2="53.34" width="0.1524" layer="91"/>
<junction x="83.82" y="53.34"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="VDDANA"/>
<wire x1="134.62" y1="68.58" x2="132.08" y2="68.58" width="0.1524" layer="91"/>
<wire x1="132.08" y1="68.58" x2="132.08" y2="66.04" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="VDDIO@2"/>
<wire x1="132.08" y1="66.04" x2="132.08" y2="63.5" width="0.1524" layer="91"/>
<wire x1="132.08" y1="63.5" x2="132.08" y2="60.96" width="0.1524" layer="91"/>
<wire x1="132.08" y1="60.96" x2="134.62" y2="60.96" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="VDDIO@1"/>
<wire x1="134.62" y1="63.5" x2="132.08" y2="63.5" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="VDDIO@0"/>
<wire x1="134.62" y1="66.04" x2="132.08" y2="66.04" width="0.1524" layer="91"/>
<wire x1="132.08" y1="68.58" x2="129.54" y2="68.58" width="0.1524" layer="91"/>
<pinref part="+P5" gate="1" pin="+3V3"/>
<junction x="132.08" y="68.58"/>
<junction x="132.08" y="66.04"/>
<junction x="132.08" y="63.5"/>
</segment>
<segment>
<pinref part="+P3" gate="1" pin="+3V3"/>
<pinref part="U2" gate="G$1" pin="VDDIN"/>
<wire x1="129.54" y1="91.44" x2="134.62" y2="91.44" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="+P8" gate="1" pin="+3V3"/>
<pinref part="C6" gate="G$1" pin="1"/>
<wire x1="142.24" y1="127" x2="142.24" y2="124.46" width="0.1524" layer="91"/>
<wire x1="142.24" y1="124.46" x2="142.24" y2="121.92" width="0.1524" layer="91"/>
<wire x1="142.24" y1="124.46" x2="149.86" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="1"/>
<wire x1="149.86" y1="124.46" x2="154.94" y2="124.46" width="0.1524" layer="91"/>
<wire x1="154.94" y1="124.46" x2="160.02" y2="124.46" width="0.1524" layer="91"/>
<wire x1="160.02" y1="124.46" x2="165.1" y2="124.46" width="0.1524" layer="91"/>
<wire x1="165.1" y1="124.46" x2="165.1" y2="121.92" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="1"/>
<wire x1="149.86" y1="121.92" x2="149.86" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="1"/>
<wire x1="154.94" y1="121.92" x2="154.94" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="1"/>
<wire x1="160.02" y1="121.92" x2="160.02" y2="124.46" width="0.1524" layer="91"/>
<junction x="160.02" y="124.46"/>
<junction x="154.94" y="124.46"/>
<junction x="149.86" y="124.46"/>
<junction x="142.24" y="124.46"/>
</segment>
<segment>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="218.44" y1="111.76" x2="218.44" y2="109.22" width="0.1524" layer="91"/>
<pinref part="+P10" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="VCC"/>
<wire x1="259.08" y1="111.76" x2="261.62" y2="111.76" width="0.1524" layer="91"/>
<wire x1="261.62" y1="111.76" x2="261.62" y2="114.3" width="0.1524" layer="91"/>
<pinref part="+P11" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="EN"/>
<wire x1="154.94" y1="149.86" x2="152.4" y2="149.86" width="0.1524" layer="91"/>
<wire x1="152.4" y1="149.86" x2="152.4" y2="152.4" width="0.1524" layer="91"/>
<pinref part="X1" gate="G$1" pin="VDD"/>
<wire x1="152.4" y1="152.4" x2="154.94" y2="152.4" width="0.1524" layer="91"/>
<wire x1="152.4" y1="152.4" x2="144.78" y2="152.4" width="0.1524" layer="91"/>
<junction x="152.4" y="152.4"/>
<pinref part="C16" gate="G$1" pin="1"/>
<pinref part="+P15" gate="1" pin="+3V3"/>
<wire x1="144.78" y1="152.4" x2="144.78" y2="154.94" width="0.1524" layer="91"/>
<junction x="144.78" y="152.4"/>
</segment>
<segment>
<pinref part="+P12" gate="1" pin="+3V3"/>
<pinref part="FB2" gate="G$1" pin="1"/>
<wire x1="281.94" y1="109.22" x2="284.48" y2="109.22" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="VCC"/>
<pinref part="C18" gate="G$1" pin="1"/>
<wire x1="269.24" y1="294.64" x2="261.62" y2="294.64" width="0.1524" layer="91"/>
<wire x1="261.62" y1="294.64" x2="261.62" y2="297.18" width="0.1524" layer="91"/>
<pinref part="+P13" gate="1" pin="+3V3"/>
<junction x="261.62" y="294.64"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="B"/>
<wire x1="269.24" y1="271.78" x2="266.7" y2="271.78" width="0.1524" layer="91"/>
<pinref part="+P14" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="ADVREF"/>
<wire x1="129.54" y1="20.32" x2="134.62" y2="20.32" width="0.1524" layer="91"/>
<pinref part="+P7" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="VCC"/>
<wire x1="109.22" y1="203.2" x2="106.68" y2="203.2" width="0.1524" layer="91"/>
<pinref part="+P18" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="+P6" gate="1" pin="+3V3"/>
<pinref part="U2" gate="G$1" pin="VBUS"/>
<wire x1="129.54" y1="35.56" x2="134.62" y2="35.56" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="+P17" gate="1" pin="+3V3"/>
<pinref part="U8" gate="G$1" pin="VCC"/>
<pinref part="C23" gate="G$1" pin="1"/>
<junction x="101.6" y="246.38"/>
<wire x1="101.6" y1="248.92" x2="101.6" y2="246.38" width="0.1524" layer="91"/>
<wire x1="101.6" y1="246.38" x2="109.22" y2="246.38" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R28" gate="G$1" pin="2"/>
<wire x1="137.16" y1="203.2" x2="137.16" y2="205.74" width="0.1524" layer="91"/>
<wire x1="137.16" y1="205.74" x2="139.7" y2="205.74" width="0.1524" layer="91"/>
<pinref part="R35" gate="G$1" pin="2"/>
<wire x1="139.7" y1="205.74" x2="142.24" y2="205.74" width="0.1524" layer="91"/>
<wire x1="142.24" y1="205.74" x2="144.78" y2="205.74" width="0.1524" layer="91"/>
<wire x1="144.78" y1="205.74" x2="147.32" y2="205.74" width="0.1524" layer="91"/>
<wire x1="147.32" y1="205.74" x2="149.86" y2="205.74" width="0.1524" layer="91"/>
<wire x1="149.86" y1="205.74" x2="152.4" y2="205.74" width="0.1524" layer="91"/>
<wire x1="152.4" y1="205.74" x2="154.94" y2="205.74" width="0.1524" layer="91"/>
<wire x1="154.94" y1="205.74" x2="154.94" y2="203.2" width="0.1524" layer="91"/>
<pinref part="R29" gate="G$1" pin="2"/>
<wire x1="139.7" y1="203.2" x2="139.7" y2="205.74" width="0.1524" layer="91"/>
<pinref part="R30" gate="G$1" pin="2"/>
<wire x1="142.24" y1="203.2" x2="142.24" y2="205.74" width="0.1524" layer="91"/>
<pinref part="R31" gate="G$1" pin="2"/>
<wire x1="144.78" y1="203.2" x2="144.78" y2="205.74" width="0.1524" layer="91"/>
<pinref part="R32" gate="G$1" pin="2"/>
<wire x1="147.32" y1="203.2" x2="147.32" y2="205.74" width="0.1524" layer="91"/>
<pinref part="R33" gate="G$1" pin="2"/>
<wire x1="149.86" y1="203.2" x2="149.86" y2="205.74" width="0.1524" layer="91"/>
<pinref part="R34" gate="G$1" pin="2"/>
<wire x1="152.4" y1="203.2" x2="152.4" y2="205.74" width="0.1524" layer="91"/>
<pinref part="+P21" gate="1" pin="+3V3"/>
<wire x1="144.78" y1="205.74" x2="144.78" y2="208.28" width="0.1524" layer="91"/>
<junction x="139.7" y="205.74"/>
<junction x="142.24" y="205.74"/>
<junction x="144.78" y="205.74"/>
<junction x="147.32" y="205.74"/>
<junction x="149.86" y="205.74"/>
<junction x="152.4" y="205.74"/>
</segment>
<segment>
<pinref part="R36" gate="G$1" pin="2"/>
<wire x1="137.16" y1="236.22" x2="137.16" y2="238.76" width="0.1524" layer="91"/>
<wire x1="137.16" y1="238.76" x2="139.7" y2="238.76" width="0.1524" layer="91"/>
<pinref part="R39" gate="G$1" pin="2"/>
<wire x1="139.7" y1="238.76" x2="142.24" y2="238.76" width="0.1524" layer="91"/>
<wire x1="142.24" y1="238.76" x2="144.78" y2="238.76" width="0.1524" layer="91"/>
<wire x1="144.78" y1="238.76" x2="144.78" y2="236.22" width="0.1524" layer="91"/>
<pinref part="R38" gate="G$1" pin="2"/>
<wire x1="142.24" y1="236.22" x2="142.24" y2="238.76" width="0.1524" layer="91"/>
<pinref part="R37" gate="G$1" pin="2"/>
<wire x1="139.7" y1="236.22" x2="139.7" y2="238.76" width="0.1524" layer="91"/>
<pinref part="+P22" gate="1" pin="+3V3"/>
<wire x1="139.7" y1="238.76" x2="139.7" y2="241.3" width="0.1524" layer="91"/>
<junction x="139.7" y="238.76"/>
<junction x="142.24" y="238.76"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="B"/>
<wire x1="269.24" y1="233.68" x2="266.7" y2="233.68" width="0.1524" layer="91"/>
<pinref part="+P23" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="VCC"/>
<wire x1="269.24" y1="256.54" x2="261.62" y2="256.54" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="1"/>
<pinref part="+P24" gate="1" pin="+3V3"/>
<wire x1="261.62" y1="256.54" x2="261.62" y2="259.08" width="0.1524" layer="91"/>
<junction x="261.62" y="256.54"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="VCC"/>
<wire x1="269.24" y1="218.44" x2="261.62" y2="218.44" width="0.1524" layer="91"/>
<wire x1="261.62" y1="218.44" x2="261.62" y2="220.98" width="0.1524" layer="91"/>
<pinref part="C22" gate="G$1" pin="1"/>
<junction x="261.62" y="218.44"/>
<pinref part="+P25" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="B"/>
<wire x1="269.24" y1="195.58" x2="266.7" y2="195.58" width="0.1524" layer="91"/>
<pinref part="+P26" gate="1" pin="+3V3"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="DP"/>
<wire x1="134.62" y1="30.48" x2="129.54" y2="30.48" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="DM"/>
<wire x1="134.62" y1="27.94" x2="129.54" y2="27.94" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="2"/>
</segment>
</net>
<net name="+1V8" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="VDDOUT"/>
<wire x1="134.62" y1="88.9" x2="129.54" y2="88.9" width="0.1524" layer="91"/>
<wire x1="129.54" y1="88.9" x2="129.54" y2="83.82" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="VDDCORE@0"/>
<wire x1="132.08" y1="83.82" x2="134.62" y2="83.82" width="0.1524" layer="91"/>
<wire x1="132.08" y1="83.82" x2="132.08" y2="81.28" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="VDDPLL"/>
<wire x1="132.08" y1="81.28" x2="132.08" y2="78.74" width="0.1524" layer="91"/>
<wire x1="132.08" y1="78.74" x2="132.08" y2="76.2" width="0.1524" layer="91"/>
<wire x1="132.08" y1="76.2" x2="134.62" y2="76.2" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="VDDCORE@2"/>
<wire x1="134.62" y1="78.74" x2="132.08" y2="78.74" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="VDDCORE@1"/>
<wire x1="132.08" y1="81.28" x2="134.62" y2="81.28" width="0.1524" layer="91"/>
<junction x="132.08" y="81.28"/>
<junction x="132.08" y="78.74"/>
<wire x1="129.54" y1="83.82" x2="132.08" y2="83.82" width="0.1524" layer="91"/>
<pinref part="+P4" gate="G$1" pin="+1V8"/>
<wire x1="129.54" y1="83.82" x2="127" y2="83.82" width="0.1524" layer="91"/>
<junction x="129.54" y="83.82"/>
<junction x="132.08" y="83.82"/>
</segment>
<segment>
<pinref part="+P9" gate="G$1" pin="+1V8"/>
<pinref part="C11" gate="G$1" pin="1"/>
<wire x1="177.8" y1="127" x2="177.8" y2="124.46" width="0.1524" layer="91"/>
<wire x1="177.8" y1="124.46" x2="177.8" y2="121.92" width="0.1524" layer="91"/>
<wire x1="177.8" y1="124.46" x2="185.42" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="1"/>
<wire x1="185.42" y1="124.46" x2="190.5" y2="124.46" width="0.1524" layer="91"/>
<wire x1="190.5" y1="124.46" x2="195.58" y2="124.46" width="0.1524" layer="91"/>
<wire x1="195.58" y1="124.46" x2="200.66" y2="124.46" width="0.1524" layer="91"/>
<wire x1="200.66" y1="124.46" x2="200.66" y2="121.92" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="1"/>
<wire x1="195.58" y1="121.92" x2="195.58" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C13" gate="G$1" pin="1"/>
<wire x1="190.5" y1="121.92" x2="190.5" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C12" gate="G$1" pin="1"/>
<wire x1="185.42" y1="121.92" x2="185.42" y2="124.46" width="0.1524" layer="91"/>
<junction x="195.58" y="124.46"/>
<junction x="190.5" y="124.46"/>
<junction x="185.42" y="124.46"/>
<junction x="177.8" y="124.46"/>
</segment>
</net>
<net name="!MCU_RST" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="!RESET"/>
<wire x1="134.62" y1="99.06" x2="127" y2="99.06" width="0.1524" layer="91"/>
<label x="127" y="99.06" size="1.27" layer="95" rot="MR0" xref="yes"/>
<wire x1="83.82" y1="81.28" x2="78.74" y2="81.28" width="0.1524" layer="91"/>
<pinref part="SW0" gate="G$1" pin="B1"/>
<label x="83.82" y="81.28" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="TCK"/>
<wire x1="210.82" y1="99.06" x2="218.44" y2="99.06" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="218.44" y1="99.06" x2="218.44" y2="101.6" width="0.1524" layer="91"/>
<junction x="218.44" y="99.06"/>
<pinref part="J1" gate="G$1" pin="TCK"/>
<wire x1="238.76" y1="111.76" x2="228.6" y2="111.76" width="0.1524" layer="91"/>
<wire x1="228.6" y1="111.76" x2="228.6" y2="99.06" width="0.1524" layer="91"/>
<wire x1="228.6" y1="99.06" x2="218.44" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="PA00/TDI"/>
<pinref part="J1" gate="G$1" pin="TDI"/>
<wire x1="238.76" y1="106.68" x2="231.14" y2="106.68" width="0.1524" layer="91"/>
<wire x1="231.14" y1="106.68" x2="231.14" y2="93.98" width="0.1524" layer="91"/>
<wire x1="231.14" y1="93.98" x2="210.82" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="X_RX" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="DOUT"/>
<wire x1="317.5" y1="106.68" x2="312.42" y2="106.68" width="0.1524" layer="91"/>
<label x="312.42" y="106.68" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="210.82" y1="27.94" x2="215.9" y2="27.94" width="0.1524" layer="91"/>
<label x="215.9" y="27.94" size="1.27" layer="95" xref="yes"/>
<pinref part="U2" gate="G$1" pin="PA24/INT4/USART1-RXD/SPI0-NPCS0"/>
</segment>
</net>
<net name="X_TX" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="DIN/!CONFIG"/>
<wire x1="317.5" y1="104.14" x2="312.42" y2="104.14" width="0.1524" layer="91"/>
<label x="312.42" y="104.14" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="210.82" y1="30.48" x2="215.9" y2="30.48" width="0.1524" layer="91"/>
<label x="215.9" y="30.48" size="1.27" layer="95" xref="yes"/>
<pinref part="U2" gate="G$1" pin="PA23/INT3/USART1-TXD/SPI0-NPCS1"/>
</segment>
</net>
<net name="!X_DTR" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="!DTR!/SLEEP_RQ/DIO8"/>
<wire x1="317.5" y1="88.9" x2="312.42" y2="88.9" width="0.1524" layer="91"/>
<label x="312.42" y="88.9" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<label x="215.9" y="48.26" size="1.27" layer="95" xref="yes"/>
<pinref part="U2" gate="G$1" pin="PA17/TC-CLK2/SPI0-SCK/SPI0-NPCS1"/>
<wire x1="210.82" y1="48.26" x2="215.9" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!X_RST" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="!RESET"/>
<wire x1="317.5" y1="99.06" x2="312.42" y2="99.06" width="0.1524" layer="91"/>
<label x="312.42" y="99.06" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<wire x1="210.82" y1="33.02" x2="228.6" y2="33.02" width="0.1524" layer="91"/>
<label x="231.14" y="33.02" size="1.27" layer="95" xref="yes"/>
<wire x1="228.6" y1="33.02" x2="231.14" y2="33.02" width="0.1524" layer="91"/>
<wire x1="228.6" y1="30.48" x2="228.6" y2="33.02" width="0.1524" layer="91"/>
<junction x="228.6" y="33.02"/>
<pinref part="U2" gate="G$1" pin="PA22/TC-B1/PWM6/TRIGGER"/>
<pinref part="R5" gate="G$1" pin="2"/>
</segment>
</net>
<net name="!X_RTS" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="!RTS!/DIO6"/>
<wire x1="363.22" y1="99.06" x2="368.3" y2="99.06" width="0.1524" layer="91"/>
<label x="368.3" y="99.06" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<label x="215.9" y="66.04" size="1.27" layer="95" xref="yes"/>
<pinref part="U2" gate="G$1" pin="PA10/SDA/SPI0-NPCS3/USART1-RTS"/>
<wire x1="210.82" y1="66.04" x2="215.9" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!X_CTS" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="!CTS!/DIO7"/>
<wire x1="363.22" y1="88.9" x2="368.3" y2="88.9" width="0.1524" layer="91"/>
<label x="368.3" y="88.9" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<label x="215.9" y="71.12" size="1.27" layer="95" xref="yes"/>
<pinref part="U2" gate="G$1" pin="PA09/SCL/SPI0-NPCS2/USART1-CTS"/>
<wire x1="210.82" y1="71.12" x2="215.9" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="VREF"/>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="363.22" y1="93.98" x2="378.46" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="DBG_RX" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="PA20/TC-CLK0/USART1-CLK/USART2-RXD"/>
<wire x1="210.82" y1="38.1" x2="215.9" y2="38.1" width="0.1524" layer="91"/>
<label x="215.9" y="38.1" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<label x="378.46" y="60.96" size="1.27" layer="95" xref="yes"/>
<pinref part="R21" gate="G$1" pin="2"/>
<wire x1="378.46" y1="60.96" x2="373.38" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="DBG_TX" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="PA21/TC-A1/PWM2/USART2-TXD"/>
<wire x1="210.82" y1="35.56" x2="215.9" y2="35.56" width="0.1524" layer="91"/>
<label x="215.9" y="35.56" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<label x="378.46" y="58.42" size="1.27" layer="95" xref="yes"/>
<pinref part="R22" gate="G$1" pin="2"/>
<wire x1="373.38" y1="58.42" x2="378.46" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="X_RSSI" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="RSSI/PWM/DIO10"/>
<wire x1="317.5" y1="96.52" x2="312.42" y2="96.52" width="0.1524" layer="91"/>
<label x="312.42" y="96.52" size="1.27" layer="95" rot="MR0" xref="yes"/>
<label x="332.74" y="170.18" size="1.27" layer="95" rot="MR0" xref="yes"/>
<pinref part="LED14" gate="G$1" pin="A"/>
<wire x1="332.74" y1="170.18" x2="360.68" y2="170.18" width="0.1524" layer="91"/>
<wire x1="360.68" y1="170.18" x2="360.68" y2="162.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="X_ASSOC" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="ASSOC/DIO5"/>
<wire x1="363.22" y1="96.52" x2="368.3" y2="96.52" width="0.1524" layer="91"/>
<label x="368.3" y="96.52" size="1.27" layer="95" xref="yes"/>
<label x="332.74" y="167.64" size="1.27" layer="95" rot="MR0" xref="yes"/>
<wire x1="332.74" y1="167.64" x2="347.98" y2="167.64" width="0.1524" layer="91"/>
<pinref part="LED13" gate="G$1" pin="A"/>
<wire x1="347.98" y1="167.64" x2="347.98" y2="162.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="X_COMBTN" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="COM_BTN/AD0/DIO0"/>
<wire x1="363.22" y1="109.22" x2="368.3" y2="109.22" width="0.1524" layer="91"/>
<label x="368.3" y="109.22" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="X_ON" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="ON/!SLEEP"/>
<wire x1="363.22" y1="91.44" x2="368.3" y2="91.44" width="0.1524" layer="91"/>
<label x="368.3" y="91.44" size="1.27" layer="95" xref="yes"/>
<label x="332.74" y="165.1" size="1.27" layer="95" rot="MR0" xref="yes"/>
<wire x1="332.74" y1="165.1" x2="335.28" y2="165.1" width="0.1524" layer="91"/>
<pinref part="LED12" gate="G$1" pin="A"/>
<wire x1="335.28" y1="165.1" x2="335.28" y2="162.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!LED_TRC" class="0">
<segment>
<wire x1="215.9" y1="167.64" x2="200.66" y2="167.64" width="0.1524" layer="91"/>
<label x="200.66" y="167.64" size="1.27" layer="95" rot="MR0" xref="yes"/>
<pinref part="LED2" gate="G$1" pin="A"/>
<wire x1="215.9" y1="167.64" x2="215.9" y2="160.02" width="0.1524" layer="91"/>
</segment>
<segment>
<label x="215.9" y="83.82" size="1.27" layer="95" xref="yes"/>
<pinref part="U2" gate="G$1" pin="PA04/AD1/GCLK1/USB_VBOF"/>
<wire x1="210.82" y1="83.82" x2="215.9" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!LED_DV1" class="0">
<segment>
<wire x1="269.24" y1="165.1" x2="266.7" y2="165.1" width="0.1524" layer="91"/>
<label x="266.7" y="165.1" size="1.27" layer="95" rot="MR0" xref="yes"/>
<pinref part="LED4" gate="G$1" pin="A"/>
<wire x1="269.24" y1="165.1" x2="269.24" y2="160.02" width="0.1524" layer="91"/>
</segment>
<segment>
<label x="294.64" y="292.1" size="1.27" layer="95" xref="yes"/>
<pinref part="U4" gate="G$1" pin="QA"/>
<wire x1="294.64" y1="292.1" x2="289.56" y2="292.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!LED_DV2" class="0">
<segment>
<wire x1="274.32" y1="167.64" x2="266.7" y2="167.64" width="0.1524" layer="91"/>
<label x="266.7" y="167.64" size="1.27" layer="95" rot="MR0" xref="yes"/>
<pinref part="LED5" gate="G$1" pin="A"/>
<wire x1="274.32" y1="167.64" x2="274.32" y2="165.1" width="0.1524" layer="91"/>
</segment>
<segment>
<label x="294.64" y="289.56" size="1.27" layer="95" xref="yes"/>
<pinref part="U4" gate="G$1" pin="QB"/>
<wire x1="289.56" y1="289.56" x2="294.64" y2="289.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!LED_DV3" class="0">
<segment>
<wire x1="266.7" y1="170.18" x2="279.4" y2="170.18" width="0.1524" layer="91"/>
<label x="266.7" y="170.18" size="1.27" layer="95" rot="MR0" xref="yes"/>
<pinref part="LED6" gate="G$1" pin="A"/>
<wire x1="279.4" y1="170.18" x2="279.4" y2="160.02" width="0.1524" layer="91"/>
</segment>
<segment>
<label x="294.64" y="287.02" size="1.27" layer="95" xref="yes"/>
<pinref part="U4" gate="G$1" pin="QC"/>
<wire x1="294.64" y1="287.02" x2="289.56" y2="287.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!LED_DV4" class="0">
<segment>
<wire x1="266.7" y1="172.72" x2="284.48" y2="172.72" width="0.1524" layer="91"/>
<label x="266.7" y="172.72" size="1.27" layer="95" rot="MR0" xref="yes"/>
<pinref part="LED7" gate="G$1" pin="A"/>
<wire x1="284.48" y1="172.72" x2="284.48" y2="165.1" width="0.1524" layer="91"/>
</segment>
<segment>
<label x="294.64" y="284.48" size="1.27" layer="95" xref="yes"/>
<pinref part="U4" gate="G$1" pin="QD"/>
<wire x1="294.64" y1="284.48" x2="289.56" y2="284.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!LED_DV5" class="0">
<segment>
<wire x1="266.7" y1="175.26" x2="289.56" y2="175.26" width="0.1524" layer="91"/>
<label x="266.7" y="175.26" size="1.27" layer="95" rot="MR0" xref="yes"/>
<pinref part="LED8" gate="G$1" pin="A"/>
<wire x1="289.56" y1="160.02" x2="289.56" y2="175.26" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="QH"/>
<wire x1="289.56" y1="274.32" x2="292.1" y2="274.32" width="0.1524" layer="91"/>
<wire x1="292.1" y1="274.32" x2="292.1" y2="264.16" width="0.1524" layer="91"/>
<wire x1="292.1" y1="264.16" x2="266.7" y2="264.16" width="0.1524" layer="91"/>
<wire x1="266.7" y1="264.16" x2="266.7" y2="236.22" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="A"/>
<wire x1="266.7" y1="236.22" x2="269.24" y2="236.22" width="0.1524" layer="91"/>
<wire x1="292.1" y1="274.32" x2="294.64" y2="274.32" width="0.1524" layer="91"/>
<junction x="292.1" y="274.32"/>
<label x="294.64" y="274.32" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="LED12" gate="G$1" pin="C"/>
<pinref part="R15" gate="G$1" pin="2"/>
<wire x1="335.28" y1="154.94" x2="335.28" y2="157.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="LED13" gate="G$1" pin="C"/>
<pinref part="R16" gate="G$1" pin="2"/>
<wire x1="347.98" y1="154.94" x2="347.98" y2="157.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="LED14" gate="G$1" pin="C"/>
<pinref part="R17" gate="G$1" pin="2"/>
<wire x1="360.68" y1="154.94" x2="360.68" y2="157.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CLK" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="OUT"/>
<wire x1="170.18" y1="147.32" x2="175.26" y2="147.32" width="0.1524" layer="91"/>
<label x="175.26" y="147.32" size="1.27" layer="95" xref="yes"/>
<wire x1="210.82" y1="45.72" x2="215.9" y2="45.72" width="0.1524" layer="91"/>
<label x="215.9" y="45.72" size="1.27" layer="95" xref="yes"/>
<pinref part="U2" gate="G$1" pin="PA18/XIN0/PWM5/USART0-RXD/SPI0-MISO"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="DM"/>
<wire x1="317.5" y1="48.26" x2="312.42" y2="48.26" width="0.1524" layer="91"/>
<pinref part="R19" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="DP"/>
<wire x1="312.42" y1="45.72" x2="317.5" y2="45.72" width="0.1524" layer="91"/>
<pinref part="R20" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="3V3OUT"/>
<wire x1="317.5" y1="55.88" x2="314.96" y2="55.88" width="0.1524" layer="91"/>
<wire x1="314.96" y1="55.88" x2="314.96" y2="58.42" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="VCCIO"/>
<wire x1="314.96" y1="58.42" x2="317.5" y2="58.42" width="0.1524" layer="91"/>
<wire x1="314.96" y1="58.42" x2="312.42" y2="58.42" width="0.1524" layer="91"/>
<wire x1="312.42" y1="58.42" x2="312.42" y2="68.58" width="0.1524" layer="91"/>
<wire x1="312.42" y1="68.58" x2="307.34" y2="68.58" width="0.1524" layer="91"/>
<pinref part="C21" gate="G$1" pin="1"/>
<wire x1="307.34" y1="68.58" x2="307.34" y2="66.04" width="0.1524" layer="91"/>
<junction x="314.96" y="58.42"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="CN2" gate="G$1" pin="VBUS"/>
<pinref part="D1" gate="1" pin="A"/>
<wire x1="20.32" y1="106.68" x2="17.78" y2="106.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="DBG_D-" class="0">
<segment>
<pinref part="CN2" gate="G$1" pin="D-"/>
<wire x1="17.78" y1="104.14" x2="30.48" y2="104.14" width="0.1524" layer="91"/>
<label x="30.48" y="104.14" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="R19" gate="G$1" pin="1"/>
<wire x1="304.8" y1="48.26" x2="299.72" y2="48.26" width="0.1524" layer="91"/>
<label x="299.72" y="48.26" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="DBG_D+" class="0">
<segment>
<pinref part="CN2" gate="G$1" pin="D+"/>
<wire x1="17.78" y1="101.6" x2="30.48" y2="101.6" width="0.1524" layer="91"/>
<label x="30.48" y="101.6" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="R20" gate="G$1" pin="1"/>
<wire x1="299.72" y1="45.72" x2="304.8" y2="45.72" width="0.1524" layer="91"/>
<label x="299.72" y="45.72" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="C19" gate="G$1" pin="1"/>
<wire x1="15.24" y1="81.28" x2="15.24" y2="83.82" width="0.1524" layer="91"/>
<pinref part="R18" gate="G$1" pin="2"/>
<wire x1="15.24" y1="83.82" x2="12.7" y2="83.82" width="0.1524" layer="91"/>
<wire x1="12.7" y1="83.82" x2="10.16" y2="83.82" width="0.1524" layer="91"/>
<wire x1="10.16" y1="83.82" x2="10.16" y2="81.28" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="S3"/>
<wire x1="12.7" y1="83.82" x2="12.7" y2="88.9" width="0.1524" layer="91"/>
<junction x="12.7" y="83.82"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="TXD"/>
<pinref part="R21" gate="G$1" pin="1"/>
<wire x1="363.22" y1="60.96" x2="365.76" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="RXD"/>
<pinref part="R22" gate="G$1" pin="1"/>
<wire x1="363.22" y1="58.42" x2="365.76" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="CN3" gate="G$1" pin="VCC"/>
<wire x1="317.5" y1="109.22" x2="297.18" y2="109.22" width="0.1524" layer="91"/>
<pinref part="C17" gate="G$1" pin="1"/>
<wire x1="297.18" y1="106.68" x2="297.18" y2="109.22" width="0.1524" layer="91"/>
<pinref part="FB2" gate="G$1" pin="2"/>
<wire x1="294.64" y1="109.22" x2="297.18" y2="109.22" width="0.1524" layer="91"/>
<junction x="297.18" y="109.22"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="LED2" gate="G$1" pin="C"/>
<pinref part="RA5" gate="B" pin="2"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="C"/>
<wire x1="203.2" y1="157.48" x2="203.2" y2="154.94" width="0.1524" layer="91"/>
<pinref part="RA5" gate="A" pin="2"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="LED4" gate="G$1" pin="C"/>
<pinref part="RA6" gate="A" pin="2"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="LED5" gate="G$1" pin="C"/>
<wire x1="274.32" y1="160.02" x2="274.32" y2="154.94" width="0.1524" layer="91"/>
<pinref part="RA6" gate="B" pin="2"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="LED6" gate="G$1" pin="C"/>
<pinref part="RA6" gate="C" pin="2"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="LED7" gate="G$1" pin="C"/>
<wire x1="284.48" y1="154.94" x2="284.48" y2="160.02" width="0.1524" layer="91"/>
<pinref part="RA6" gate="D" pin="2"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="LED8" gate="G$1" pin="C"/>
<pinref part="RA7" gate="A" pin="2"/>
</segment>
</net>
<net name="!LED_ERR" class="0">
<segment>
<wire x1="241.3" y1="172.72" x2="200.66" y2="172.72" width="0.1524" layer="91"/>
<label x="200.66" y="172.72" size="1.27" layer="95" rot="MR0" xref="yes"/>
<pinref part="LED15" gate="G$1" pin="A"/>
<wire x1="241.3" y1="172.72" x2="241.3" y2="160.02" width="0.1524" layer="91"/>
</segment>
<segment>
<label x="215.9" y="78.74" size="1.27" layer="95" xref="yes"/>
<pinref part="U2" gate="G$1" pin="PA06/AD3/INT1/USART1-DSR"/>
<wire x1="210.82" y1="78.74" x2="215.9" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SR_DO" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="A"/>
<wire x1="269.24" y1="274.32" x2="264.16" y2="274.32" width="0.1524" layer="91"/>
<label x="264.16" y="274.32" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="PA15/PWM4/USART2-CLK/SPI0-SCK"/>
<wire x1="210.82" y1="53.34" x2="215.9" y2="53.34" width="0.1524" layer="91"/>
<label x="215.9" y="53.34" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="!SR_CL" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="!CLR"/>
<wire x1="269.24" y1="279.4" x2="264.16" y2="279.4" width="0.1524" layer="91"/>
<label x="264.16" y="279.4" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="PA14/PWM3/INT2/SPI0-MOSI"/>
<wire x1="210.82" y1="55.88" x2="236.22" y2="55.88" width="0.1524" layer="91"/>
<label x="243.84" y="55.88" size="1.27" layer="95" xref="yes"/>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="236.22" y1="55.88" x2="243.84" y2="55.88" width="0.1524" layer="91"/>
<wire x1="236.22" y1="50.8" x2="236.22" y2="55.88" width="0.1524" layer="91"/>
<junction x="236.22" y="55.88"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="S/!L"/>
<wire x1="109.22" y1="187.96" x2="101.6" y2="187.96" width="0.1524" layer="91"/>
<label x="101.6" y="187.96" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="S/!L"/>
<wire x1="109.22" y1="231.14" x2="101.6" y2="231.14" width="0.1524" layer="91"/>
<label x="101.6" y="231.14" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="!CLR"/>
<wire x1="269.24" y1="241.3" x2="264.16" y2="241.3" width="0.1524" layer="91"/>
<label x="264.16" y="241.3" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="!CLR"/>
<wire x1="264.16" y1="203.2" x2="269.24" y2="203.2" width="0.1524" layer="91"/>
<label x="264.16" y="203.2" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="SW5" class="0">
<segment>
<label x="12.7" y="213.36" size="1.27" layer="95" rot="R90" xref="yes"/>
<pinref part="SW5" gate="G$1" pin="B1"/>
<wire x1="12.7" y1="205.74" x2="12.7" y2="213.36" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="PA27/TC-B0/USB_VBOF/USART2-RXD"/>
<wire x1="210.82" y1="20.32" x2="215.9" y2="20.32" width="0.1524" layer="91"/>
<label x="215.9" y="20.32" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="SW6" class="0">
<segment>
<label x="43.18" y="195.58" size="1.27" layer="95" rot="R270" xref="yes"/>
<pinref part="SW6" gate="G$1" pin="B2"/>
<wire x1="43.18" y1="203.2" x2="43.18" y2="195.58" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="C"/>
<wire x1="129.54" y1="187.96" x2="142.24" y2="187.96" width="0.1524" layer="91"/>
<pinref part="R30" gate="G$1" pin="1"/>
<wire x1="142.24" y1="187.96" x2="157.48" y2="187.96" width="0.1524" layer="91"/>
<wire x1="142.24" y1="195.58" x2="142.24" y2="187.96" width="0.1524" layer="91"/>
<junction x="142.24" y="187.96"/>
<label x="157.48" y="187.96" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="SW13" class="0">
<segment>
<label x="20.32" y="213.36" size="1.27" layer="95" rot="R90" xref="yes"/>
<pinref part="SW13" gate="G$1" pin="B1"/>
<wire x1="20.32" y1="213.36" x2="20.32" y2="205.74" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="PA26/TC-A0/USB_ID/USART2-TXD"/>
<wire x1="210.82" y1="22.86" x2="215.9" y2="22.86" width="0.1524" layer="91"/>
<label x="215.9" y="22.86" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="SW14" class="0">
<segment>
<label x="35.56" y="213.36" size="1.27" layer="95" rot="R90" xref="yes"/>
<pinref part="SW14" gate="G$1" pin="B1"/>
<wire x1="35.56" y1="205.74" x2="35.56" y2="213.36" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="D"/>
<wire x1="129.54" y1="185.42" x2="144.78" y2="185.42" width="0.1524" layer="91"/>
<pinref part="R31" gate="G$1" pin="1"/>
<wire x1="144.78" y1="185.42" x2="157.48" y2="185.42" width="0.1524" layer="91"/>
<wire x1="144.78" y1="195.58" x2="144.78" y2="185.42" width="0.1524" layer="91"/>
<junction x="144.78" y="185.42"/>
<label x="157.48" y="185.42" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="!LED_DV6" class="0">
<segment>
<pinref part="LED9" gate="G$1" pin="A"/>
<wire x1="294.64" y1="165.1" x2="294.64" y2="177.8" width="0.1524" layer="91"/>
<wire x1="294.64" y1="177.8" x2="266.7" y2="177.8" width="0.1524" layer="91"/>
<label x="266.7" y="177.8" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="QG"/>
<wire x1="289.56" y1="276.86" x2="294.64" y2="276.86" width="0.1524" layer="91"/>
<label x="294.64" y="276.86" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="294.64" y1="154.94" x2="294.64" y2="160.02" width="0.1524" layer="91"/>
<pinref part="LED9" gate="G$1" pin="C"/>
<pinref part="RA7" gate="B" pin="2"/>
</segment>
</net>
<net name="VBUS" class="0">
<segment>
<pinref part="D1" gate="1" pin="C"/>
<wire x1="25.4" y1="106.68" x2="27.94" y2="106.68" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="VBUS"/>
<wire x1="17.78" y1="53.34" x2="27.94" y2="53.34" width="0.1524" layer="91"/>
<pinref part="FB1" gate="G$1" pin="1"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="27.94" y1="53.34" x2="30.48" y2="53.34" width="0.1524" layer="91"/>
<wire x1="27.94" y1="50.8" x2="27.94" y2="53.34" width="0.1524" layer="91"/>
<junction x="27.94" y="53.34"/>
<wire x1="27.94" y1="106.68" x2="27.94" y2="53.34" width="0.1524" layer="91"/>
<pinref part="+P19" gate="G$1" pin="VBUS"/>
<wire x1="27.94" y1="106.68" x2="27.94" y2="109.22" width="0.1524" layer="91"/>
<junction x="27.94" y="106.68"/>
</segment>
<segment>
<wire x1="294.64" y1="71.12" x2="297.18" y2="71.12" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="VCC"/>
<wire x1="297.18" y1="71.12" x2="314.96" y2="71.12" width="0.1524" layer="91"/>
<wire x1="317.5" y1="60.96" x2="314.96" y2="60.96" width="0.1524" layer="91"/>
<wire x1="314.96" y1="71.12" x2="314.96" y2="60.96" width="0.1524" layer="91"/>
<pinref part="C20" gate="G$1" pin="1"/>
<wire x1="297.18" y1="66.04" x2="297.18" y2="71.12" width="0.1524" layer="91"/>
<junction x="297.18" y="71.12"/>
<pinref part="+P20" gate="G$1" pin="VBUS"/>
</segment>
</net>
<net name="SR_DI1" class="0">
<segment>
<label x="101.6" y="175.26" size="1.27" layer="95" rot="MR0" xref="yes"/>
<pinref part="U7" gate="G$1" pin="!QH"/>
<wire x1="101.6" y1="175.26" x2="109.22" y2="175.26" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="PA16/PWM4/TC-CLK1/SPI0-NPCS0"/>
<wire x1="210.82" y1="50.8" x2="215.9" y2="50.8" width="0.1524" layer="91"/>
<label x="215.9" y="50.8" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="SR_CLK" class="0">
<segment>
<label x="243.84" y="58.42" size="1.27" layer="95" xref="yes"/>
<wire x1="241.3" y1="58.42" x2="243.84" y2="58.42" width="0.1524" layer="91"/>
<wire x1="241.3" y1="58.42" x2="241.3" y2="50.8" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="PA13/PWM2/NMI/USART0-CLK"/>
<wire x1="210.82" y1="58.42" x2="241.3" y2="58.42" width="0.1524" layer="91"/>
<junction x="241.3" y="58.42"/>
<pinref part="R8" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="CK"/>
<wire x1="269.24" y1="276.86" x2="264.16" y2="276.86" width="0.1524" layer="91"/>
<label x="264.16" y="276.86" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="CK"/>
<wire x1="109.22" y1="185.42" x2="101.6" y2="185.42" width="0.1524" layer="91"/>
<label x="101.6" y="185.42" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="CK"/>
<wire x1="101.6" y1="228.6" x2="109.22" y2="228.6" width="0.1524" layer="91"/>
<label x="101.6" y="228.6" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="CK"/>
<wire x1="269.24" y1="238.76" x2="264.16" y2="238.76" width="0.1524" layer="91"/>
<label x="264.16" y="238.76" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="CK"/>
<wire x1="269.24" y1="200.66" x2="264.16" y2="200.66" width="0.1524" layer="91"/>
<label x="264.16" y="200.66" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="PA01/TDO"/>
<pinref part="J1" gate="G$1" pin="TDO"/>
<wire x1="238.76" y1="104.14" x2="233.68" y2="104.14" width="0.1524" layer="91"/>
<wire x1="233.68" y1="104.14" x2="233.68" y2="91.44" width="0.1524" layer="91"/>
<wire x1="233.68" y1="91.44" x2="210.82" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$100" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="PA02/TMS"/>
<pinref part="J1" gate="G$1" pin="TMS"/>
<wire x1="238.76" y1="109.22" x2="236.22" y2="109.22" width="0.1524" layer="91"/>
<wire x1="236.22" y1="109.22" x2="236.22" y2="88.9" width="0.1524" layer="91"/>
<wire x1="236.22" y1="88.9" x2="210.82" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SW4" class="0">
<segment>
<pinref part="U8" gate="G$1" pin="G"/>
<wire x1="129.54" y1="220.98" x2="142.24" y2="220.98" width="0.1524" layer="91"/>
<label x="147.32" y="220.98" size="1.27" layer="95" xref="yes"/>
<pinref part="R38" gate="G$1" pin="1"/>
<wire x1="142.24" y1="220.98" x2="147.32" y2="220.98" width="0.1524" layer="91"/>
<wire x1="142.24" y1="228.6" x2="142.24" y2="220.98" width="0.1524" layer="91"/>
<junction x="142.24" y="220.98"/>
</segment>
<segment>
<pinref part="SW4" gate="G$1" pin="A2"/>
<wire x1="15.24" y1="172.72" x2="15.24" y2="165.1" width="0.1524" layer="91"/>
<label x="15.24" y="165.1" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
</net>
<net name="SW2" class="0">
<segment>
<pinref part="U8" gate="G$1" pin="F"/>
<wire x1="147.32" y1="223.52" x2="139.7" y2="223.52" width="0.1524" layer="91"/>
<label x="147.32" y="223.52" size="1.27" layer="95" xref="yes"/>
<pinref part="R37" gate="G$1" pin="1"/>
<wire x1="139.7" y1="223.52" x2="129.54" y2="223.52" width="0.1524" layer="91"/>
<wire x1="139.7" y1="228.6" x2="139.7" y2="223.52" width="0.1524" layer="91"/>
<junction x="139.7" y="223.52"/>
</segment>
<segment>
<pinref part="SW2" gate="G$1" pin="A1"/>
<wire x1="0" y1="175.26" x2="0" y2="182.88" width="0.1524" layer="91"/>
<label x="0" y="182.88" size="1.27" layer="95" rot="R90" xref="yes"/>
</segment>
</net>
<net name="SW1" class="0">
<segment>
<pinref part="U8" gate="G$1" pin="E"/>
<wire x1="129.54" y1="226.06" x2="137.16" y2="226.06" width="0.1524" layer="91"/>
<label x="147.32" y="226.06" size="1.27" layer="95" xref="yes"/>
<pinref part="R36" gate="G$1" pin="1"/>
<wire x1="137.16" y1="226.06" x2="147.32" y2="226.06" width="0.1524" layer="91"/>
<wire x1="137.16" y1="228.6" x2="137.16" y2="226.06" width="0.1524" layer="91"/>
<junction x="137.16" y="226.06"/>
</segment>
<segment>
<pinref part="SW1" gate="G$1" pin="A2"/>
<wire x1="-7.62" y1="172.72" x2="-7.62" y2="165.1" width="0.1524" layer="91"/>
<label x="-7.62" y="165.1" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
</net>
<net name="N$44" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="QB"/>
<wire x1="289.56" y1="251.46" x2="294.64" y2="251.46" width="0.1524" layer="91"/>
<pinref part="RA1" gate="B" pin="1"/>
</segment>
</net>
<net name="N$45" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="QC"/>
<wire x1="289.56" y1="248.92" x2="294.64" y2="248.92" width="0.1524" layer="91"/>
<pinref part="RA1" gate="C" pin="1"/>
</segment>
</net>
<net name="N$46" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="QD"/>
<wire x1="289.56" y1="246.38" x2="294.64" y2="246.38" width="0.1524" layer="91"/>
<pinref part="RA1" gate="D" pin="1"/>
</segment>
</net>
<net name="N$47" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="QE"/>
<wire x1="289.56" y1="243.84" x2="294.64" y2="243.84" width="0.1524" layer="91"/>
<pinref part="RA2" gate="A" pin="1"/>
</segment>
</net>
<net name="N$48" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="QF"/>
<wire x1="289.56" y1="241.3" x2="294.64" y2="241.3" width="0.1524" layer="91"/>
<pinref part="RA2" gate="B" pin="1"/>
</segment>
</net>
<net name="N$49" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="QG"/>
<wire x1="289.56" y1="238.76" x2="294.64" y2="238.76" width="0.1524" layer="91"/>
<pinref part="RA2" gate="C" pin="1"/>
</segment>
</net>
<net name="N$50" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="QH"/>
<wire x1="289.56" y1="236.22" x2="292.1" y2="236.22" width="0.1524" layer="91"/>
<pinref part="RA2" gate="D" pin="1"/>
<wire x1="292.1" y1="236.22" x2="294.64" y2="236.22" width="0.1524" layer="91"/>
<wire x1="292.1" y1="236.22" x2="292.1" y2="226.06" width="0.1524" layer="91"/>
<wire x1="292.1" y1="226.06" x2="266.7" y2="226.06" width="0.1524" layer="91"/>
<wire x1="266.7" y1="226.06" x2="266.7" y2="198.12" width="0.1524" layer="91"/>
<pinref part="U6" gate="G$1" pin="A"/>
<wire x1="266.7" y1="198.12" x2="269.24" y2="198.12" width="0.1524" layer="91"/>
<junction x="292.1" y="236.22"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="QA"/>
<wire x1="289.56" y1="254" x2="294.64" y2="254" width="0.1524" layer="91"/>
<pinref part="RA1" gate="A" pin="1"/>
</segment>
</net>
<net name="N$59" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="QA"/>
<pinref part="RA3" gate="A" pin="1"/>
<wire x1="294.64" y1="215.9" x2="289.56" y2="215.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$60" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="QB"/>
<pinref part="RA3" gate="B" pin="1"/>
<wire x1="294.64" y1="213.36" x2="289.56" y2="213.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$61" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="QC"/>
<pinref part="RA3" gate="C" pin="1"/>
<wire x1="294.64" y1="210.82" x2="289.56" y2="210.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$62" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="QD"/>
<pinref part="RA3" gate="D" pin="1"/>
<wire x1="294.64" y1="208.28" x2="289.56" y2="208.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$63" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="QE"/>
<pinref part="RA4" gate="A" pin="1"/>
<wire x1="294.64" y1="205.74" x2="289.56" y2="205.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$64" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="QF"/>
<pinref part="RA4" gate="B" pin="1"/>
<wire x1="294.64" y1="203.2" x2="289.56" y2="203.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$65" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="QG"/>
<pinref part="RA4" gate="C" pin="1"/>
<wire x1="294.64" y1="200.66" x2="289.56" y2="200.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$66" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="QH"/>
<pinref part="RA4" gate="D" pin="1"/>
<wire x1="294.64" y1="198.12" x2="289.56" y2="198.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SW3" class="0">
<segment>
<pinref part="U8" gate="G$1" pin="H"/>
<wire x1="129.54" y1="218.44" x2="144.78" y2="218.44" width="0.1524" layer="91"/>
<label x="147.32" y="218.44" size="1.27" layer="95" xref="yes"/>
<pinref part="R39" gate="G$1" pin="1"/>
<wire x1="144.78" y1="218.44" x2="147.32" y2="218.44" width="0.1524" layer="91"/>
<wire x1="144.78" y1="228.6" x2="144.78" y2="218.44" width="0.1524" layer="91"/>
<junction x="144.78" y="218.44"/>
</segment>
<segment>
<pinref part="SW3" gate="G$1" pin="B2"/>
<wire x1="12.7" y1="172.72" x2="12.7" y2="165.1" width="0.1524" layer="91"/>
<label x="12.7" y="165.1" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
</net>
<net name="!LED_PWR" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="PA03/AD0/GCLK0/USB_ID"/>
<wire x1="210.82" y1="86.36" x2="215.9" y2="86.36" width="0.1524" layer="91"/>
<label x="215.9" y="86.36" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="LED1" gate="G$1" pin="A"/>
<wire x1="203.2" y1="162.56" x2="203.2" y2="165.1" width="0.1524" layer="91"/>
<wire x1="203.2" y1="165.1" x2="200.66" y2="165.1" width="0.1524" layer="91"/>
<label x="200.66" y="165.1" size="1.27" layer="95" rot="MR0" xref="yes"/>
</segment>
</net>
<net name="SR_DI2" class="0">
<segment>
<label x="101.6" y="220.98" size="1.27" layer="95" rot="MR0" xref="yes"/>
<pinref part="U8" gate="G$1" pin="QH"/>
<wire x1="101.6" y1="220.98" x2="109.22" y2="220.98" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="PA12/XOUT32/PWM1/TC-B2/USART0-CTS"/>
<wire x1="210.82" y1="60.96" x2="215.9" y2="60.96" width="0.1524" layer="91"/>
<label x="215.9" y="60.96" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="SW7" class="0">
<segment>
<pinref part="SW7" gate="G$1" pin="A2"/>
<wire x1="30.48" y1="172.72" x2="30.48" y2="165.1" width="0.1524" layer="91"/>
<label x="30.48" y="165.1" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="G"/>
<wire x1="129.54" y1="177.8" x2="152.4" y2="177.8" width="0.1524" layer="91"/>
<pinref part="R34" gate="G$1" pin="1"/>
<wire x1="152.4" y1="177.8" x2="157.48" y2="177.8" width="0.1524" layer="91"/>
<wire x1="152.4" y1="195.58" x2="152.4" y2="177.8" width="0.1524" layer="91"/>
<junction x="152.4" y="177.8"/>
<label x="157.48" y="177.8" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="SW8" class="0">
<segment>
<pinref part="SW8" gate="G$1" pin="A2"/>
<wire x1="38.1" y1="172.72" x2="38.1" y2="165.1" width="0.1524" layer="91"/>
<label x="38.1" y="165.1" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="E"/>
<wire x1="129.54" y1="182.88" x2="147.32" y2="182.88" width="0.1524" layer="91"/>
<pinref part="R32" gate="G$1" pin="1"/>
<wire x1="147.32" y1="182.88" x2="157.48" y2="182.88" width="0.1524" layer="91"/>
<wire x1="147.32" y1="195.58" x2="147.32" y2="182.88" width="0.1524" layer="91"/>
<junction x="147.32" y="182.88"/>
<label x="157.48" y="182.88" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="SW9" class="0">
<segment>
<label x="50.8" y="165.1" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
<pinref part="SW9" gate="G$1" pin="B2"/>
<wire x1="50.8" y1="165.1" x2="50.8" y2="172.72" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="H"/>
<wire x1="129.54" y1="175.26" x2="154.94" y2="175.26" width="0.1524" layer="91"/>
<pinref part="R35" gate="G$1" pin="1"/>
<wire x1="154.94" y1="175.26" x2="157.48" y2="175.26" width="0.1524" layer="91"/>
<wire x1="154.94" y1="195.58" x2="154.94" y2="175.26" width="0.1524" layer="91"/>
<junction x="154.94" y="175.26"/>
<label x="157.48" y="175.26" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="SW10" class="0">
<segment>
<label x="58.42" y="165.1" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
<pinref part="SW10" gate="G$1" pin="B2"/>
<wire x1="58.42" y1="165.1" x2="58.42" y2="172.72" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="F"/>
<wire x1="129.54" y1="180.34" x2="149.86" y2="180.34" width="0.1524" layer="91"/>
<pinref part="R33" gate="G$1" pin="1"/>
<wire x1="149.86" y1="180.34" x2="157.48" y2="180.34" width="0.1524" layer="91"/>
<wire x1="149.86" y1="195.58" x2="149.86" y2="180.34" width="0.1524" layer="91"/>
<junction x="149.86" y="180.34"/>
<label x="157.48" y="180.34" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="SW11" class="0">
<segment>
<pinref part="SW11" gate="G$1" pin="B2"/>
<wire x1="66.04" y1="172.72" x2="66.04" y2="165.1" width="0.1524" layer="91"/>
<label x="66.04" y="165.1" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="B"/>
<wire x1="129.54" y1="190.5" x2="139.7" y2="190.5" width="0.1524" layer="91"/>
<pinref part="R29" gate="G$1" pin="1"/>
<wire x1="139.7" y1="190.5" x2="157.48" y2="190.5" width="0.1524" layer="91"/>
<wire x1="139.7" y1="195.58" x2="139.7" y2="190.5" width="0.1524" layer="91"/>
<junction x="139.7" y="190.5"/>
<label x="157.48" y="190.5" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="SW12" class="0">
<segment>
<pinref part="SW12" gate="G$1" pin="B2"/>
<wire x1="73.66" y1="172.72" x2="73.66" y2="165.1" width="0.1524" layer="91"/>
<label x="73.66" y="165.1" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="A"/>
<wire x1="129.54" y1="193.04" x2="137.16" y2="193.04" width="0.1524" layer="91"/>
<pinref part="R28" gate="G$1" pin="1"/>
<wire x1="137.16" y1="193.04" x2="157.48" y2="193.04" width="0.1524" layer="91"/>
<wire x1="137.16" y1="195.58" x2="137.16" y2="193.04" width="0.1524" layer="91"/>
<junction x="137.16" y="193.04"/>
<label x="157.48" y="193.04" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="!LED_IND" class="0">
<segment>
<wire x1="228.6" y1="170.18" x2="200.66" y2="170.18" width="0.1524" layer="91"/>
<label x="200.66" y="170.18" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="LED3" gate="G$1" pin="A"/>
<wire x1="228.6" y1="165.1" x2="228.6" y2="170.18" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="PA05/AD2/INT0/USART1-DCD"/>
<wire x1="210.82" y1="81.28" x2="215.9" y2="81.28" width="0.1524" layer="91"/>
<label x="215.9" y="81.28" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="LED15" gate="G$1" pin="C"/>
<pinref part="RA5" gate="D" pin="2"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="LED3" gate="G$1" pin="C"/>
<pinref part="RA5" gate="C" pin="2"/>
<wire x1="228.6" y1="160.02" x2="228.6" y2="154.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!LED_DVWRN" class="0">
<segment>
<wire x1="266.7" y1="180.34" x2="304.8" y2="180.34" width="0.1524" layer="91"/>
<pinref part="LED16" gate="G$1" pin="A"/>
<wire x1="304.8" y1="180.34" x2="304.8" y2="160.02" width="0.1524" layer="91"/>
<label x="266.7" y="180.34" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="QF"/>
<wire x1="289.56" y1="279.4" x2="294.64" y2="279.4" width="0.1524" layer="91"/>
<label x="294.64" y="279.4" size="1.27" layer="95" xref="yes"/>
</segment>
</net>
<net name="!LED_DVERR" class="0">
<segment>
<pinref part="LED17" gate="G$1" pin="A"/>
<wire x1="309.88" y1="165.1" x2="309.88" y2="182.88" width="0.1524" layer="91"/>
<wire x1="309.88" y1="182.88" x2="266.7" y2="182.88" width="0.1524" layer="91"/>
<label x="266.7" y="182.88" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
</segment>
<segment>
<label x="294.64" y="281.94" size="1.27" layer="95" xref="yes"/>
<pinref part="U4" gate="G$1" pin="QE"/>
<wire x1="289.56" y1="281.94" x2="294.64" y2="281.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<pinref part="RA7" gate="C" pin="2"/>
<pinref part="LED16" gate="G$1" pin="C"/>
</segment>
</net>
<net name="N$75" class="0">
<segment>
<pinref part="RA7" gate="D" pin="2"/>
<pinref part="LED17" gate="G$1" pin="C"/>
<wire x1="309.88" y1="154.94" x2="309.88" y2="160.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="RA2" gate="A" pin="2"/>
<pinref part="LED10" gate="G$1" pin="B"/>
<wire x1="302.26" y1="243.84" x2="317.5" y2="251.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="RA2" gate="B" pin="2"/>
<pinref part="LED10" gate="G$1" pin="A"/>
<wire x1="302.26" y1="241.3" x2="317.5" y2="254" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="RA2" gate="C" pin="2"/>
<pinref part="LED10" gate="G$1" pin="F"/>
<wire x1="302.26" y1="238.76" x2="317.5" y2="241.3" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="RA2" gate="D" pin="2"/>
<pinref part="LED10" gate="G$1" pin="G"/>
<wire x1="302.26" y1="236.22" x2="317.5" y2="238.76" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="RA1" gate="A" pin="2"/>
<pinref part="LED10" gate="G$1" pin="DP"/>
<wire x1="302.26" y1="254" x2="317.5" y2="236.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="RA1" gate="B" pin="2"/>
<pinref part="LED10" gate="G$1" pin="C"/>
<wire x1="302.26" y1="251.46" x2="317.5" y2="248.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="RA1" gate="C" pin="2"/>
<pinref part="LED10" gate="G$1" pin="D"/>
<wire x1="302.26" y1="248.92" x2="317.5" y2="246.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="RA1" gate="D" pin="2"/>
<pinref part="LED10" gate="G$1" pin="E"/>
<wire x1="302.26" y1="246.38" x2="317.5" y2="243.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="RA3" gate="D" pin="2"/>
<pinref part="LED11" gate="G$1" pin="G"/>
<wire x1="302.26" y1="208.28" x2="317.5" y2="200.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="RA3" gate="C" pin="2"/>
<pinref part="LED11" gate="G$1" pin="F"/>
<wire x1="302.26" y1="210.82" x2="317.5" y2="203.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<pinref part="RA3" gate="B" pin="2"/>
<pinref part="LED11" gate="G$1" pin="A"/>
<wire x1="302.26" y1="213.36" x2="317.5" y2="215.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$41" class="0">
<segment>
<pinref part="RA3" gate="A" pin="2"/>
<pinref part="LED11" gate="G$1" pin="B"/>
<wire x1="302.26" y1="215.9" x2="317.5" y2="213.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$42" class="0">
<segment>
<pinref part="RA4" gate="D" pin="2"/>
<pinref part="LED11" gate="G$1" pin="E"/>
<wire x1="302.26" y1="198.12" x2="317.5" y2="205.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$51" class="0">
<segment>
<pinref part="RA4" gate="C" pin="2"/>
<pinref part="LED11" gate="G$1" pin="D"/>
<wire x1="302.26" y1="200.66" x2="317.5" y2="208.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$52" class="0">
<segment>
<pinref part="RA4" gate="B" pin="2"/>
<pinref part="LED11" gate="G$1" pin="C"/>
<wire x1="302.26" y1="203.2" x2="317.5" y2="210.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$53" class="0">
<segment>
<pinref part="RA4" gate="A" pin="2"/>
<pinref part="LED11" gate="G$1" pin="DP"/>
<wire x1="302.26" y1="205.74" x2="317.5" y2="198.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$54" class="0">
<segment>
<pinref part="CN2" gate="G$1" pin="S1"/>
<wire x1="7.62" y1="88.9" x2="7.62" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$55" class="0">
<segment>
<pinref part="CN2" gate="G$1" pin="S2"/>
<wire x1="10.16" y1="88.9" x2="10.16" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$57" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="S2"/>
<wire x1="10.16" y1="35.56" x2="10.16" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
