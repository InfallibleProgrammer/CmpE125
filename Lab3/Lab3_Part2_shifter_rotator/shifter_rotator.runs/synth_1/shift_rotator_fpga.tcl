# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/bcgni/shifter_rotator/shifter_rotator.cache/wt [current_project]
set_property parent.project_path C:/Users/bcgni/shifter_rotator/shifter_rotator.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/bcgni/shifter_rotator/shifter_rotator.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/bcgni/shifter_rotator/shifter_rotator.srcs/sources_1/new/shifter_rotator.v
  C:/Users/bcgni/shifter_rotator/shifter_rotator.srcs/sources_1/new/shift_rotator_fpga.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/bcgni/shifter_rotator/shifter_rotator.srcs/constrs_1/new/shifter_rotator.xdc
set_property used_in_implementation false [get_files C:/Users/bcgni/shifter_rotator/shifter_rotator.srcs/constrs_1/new/shifter_rotator.xdc]


synth_design -top shift_rotator_fpga -part xc7a100tcsg324-1


write_checkpoint -force -noxdef shift_rotator_fpga.dcp

catch { report_utilization -file shift_rotator_fpga_utilization_synth.rpt -pb shift_rotator_fpga_utilization_synth.pb }
