# Tcl script generated by PlanAhead

set reloadAllCoreGenRepositories true

set tclUtilsPath "c:/app/Xilinx/14.6/ISE_DS/PlanAhead/scripts/pa_cg_utils.tcl"

set repoPaths ""

set cgIndexMapPath "D:/work/KIKS/Gen5/FPGA/FPGA.srcs/sources_1/ip/cg_nt_index_map.xml"

set cgProjectPath "d:/work/KIKS/Gen5/FPGA/FPGA.srcs/sources_1/ip/blk_mem_gen_v7_3_1/coregen.cgc"

set ipFile "d:/work/KIKS/Gen5/FPGA/FPGA.srcs/sources_1/ip/blk_mem_gen_v7_3_1/MEM_PMEM.xco"

set ipName "MEM_PMEM"

set chains "CUSTOMIZE_CURRENT_CHAIN INSTANTIATION_TEMPLATES_CHAIN"

set bomFilePath "d:/work/KIKS/Gen5/FPGA/FPGA.srcs/sources_1/ip/blk_mem_gen_v7_3_1/pa_cg_bom.xml"

set cgPartSpec "xc6slx9-3tqg144"

set hdlType "VHDL"

# generate the IP
set result [source "c:/app/Xilinx/14.6/ISE_DS/PlanAhead/scripts/pa_cg_reconfig_core.tcl"]

exit $result

