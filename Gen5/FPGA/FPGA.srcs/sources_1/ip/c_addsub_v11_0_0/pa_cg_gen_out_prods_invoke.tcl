# Tcl script generated by PlanAhead

set reloadAllCoreGenRepositories false

set tclUtilsPath "c:/app/Xilinx/14.6/ISE_DS/PlanAhead/scripts/pa_cg_utils.tcl"

set repoPaths ""

set cgIndexMapPath "D:/work/KIKS/Gen5/FPGA/FPGA.srcs/sources_1/ip/cg_nt_index_map.xml"

set cgProjectPath "d:/work/KIKS/Gen5/FPGA/FPGA.srcs/sources_1/ip/c_addsub_v11_0_0/coregen.cgc"

set ipFile "d:/work/KIKS/Gen5/FPGA/FPGA.srcs/sources_1/ip/c_addsub_v11_0_0/ADD48.xco"

set ipName "ADD48"

set hdlType "VHDL"

set cgPartSpec "xc6slx9-3tqg144"

set chains "GENERATE_CURRENT_CHAIN"

set params ""

set bomFilePath "d:/work/KIKS/Gen5/FPGA/FPGA.srcs/sources_1/ip/c_addsub_v11_0_0/pa_cg_bom.xml"

# generate the IP
set result [source "c:/app/Xilinx/14.6/ISE_DS/PlanAhead/scripts/pa_cg_gen_out_prods.tcl"]

exit $result

