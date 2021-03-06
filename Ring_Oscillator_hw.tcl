# TCL File Generated by Component Editor 20.1
# Mon Nov 08 19:47:11 PST 2021
# DO NOT MODIFY


# 
# Ring_Oscillator "Ring_Oscillator" v1
#  2021.11.08.19:47:11
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module Ring_Oscillator
# 
set_module_property DESCRIPTION ""
set_module_property NAME Ring_Oscillator
set_module_property VERSION 1
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME Ring_Oscillator
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL ring_osc_top
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file adder_tree.v VERILOG PATH adder_tree.v
add_fileset_file ring_osc_top.v VERILOG PATH ring_osc_top.v TOP_LEVEL_FILE
add_fileset_file power_virus.v VERILOG PATH power_virus.v
add_fileset_file ring_osc.v VERILOG PATH ring_osc.v
add_fileset_file RO_counter.v VERILOG PATH RO_counter.v


# 
# parameters
# 
add_parameter OSC_CNT INTEGER 16
set_parameter_property OSC_CNT DEFAULT_VALUE 16
set_parameter_property OSC_CNT DISPLAY_NAME OSC_CNT
set_parameter_property OSC_CNT TYPE INTEGER
set_parameter_property OSC_CNT UNITS None
set_parameter_property OSC_CNT HDL_PARAMETER true
add_parameter CNT_WIDTH INTEGER 32
set_parameter_property CNT_WIDTH DEFAULT_VALUE 32
set_parameter_property CNT_WIDTH DISPLAY_NAME CNT_WIDTH
set_parameter_property CNT_WIDTH TYPE INTEGER
set_parameter_property CNT_WIDTH UNITS None
set_parameter_property CNT_WIDTH HDL_PARAMETER true


# 
# display items
# 


# 
# connection point avalon_slave_0
# 
add_interface avalon_slave_0 avalon end
set_interface_property avalon_slave_0 addressUnits WORDS
set_interface_property avalon_slave_0 associatedClock clock
set_interface_property avalon_slave_0 associatedReset reset
set_interface_property avalon_slave_0 bitsPerSymbol 8
set_interface_property avalon_slave_0 burstOnBurstBoundariesOnly false
set_interface_property avalon_slave_0 burstcountUnits WORDS
set_interface_property avalon_slave_0 explicitAddressSpan 0
set_interface_property avalon_slave_0 holdTime 0
set_interface_property avalon_slave_0 linewrapBursts false
set_interface_property avalon_slave_0 maximumPendingReadTransactions 0
set_interface_property avalon_slave_0 maximumPendingWriteTransactions 0
set_interface_property avalon_slave_0 readLatency 0
set_interface_property avalon_slave_0 readWaitTime 1
set_interface_property avalon_slave_0 setupTime 0
set_interface_property avalon_slave_0 timingUnits Cycles
set_interface_property avalon_slave_0 writeWaitTime 0
set_interface_property avalon_slave_0 ENABLED true
set_interface_property avalon_slave_0 EXPORT_OF ""
set_interface_property avalon_slave_0 PORT_NAME_MAP ""
set_interface_property avalon_slave_0 CMSIS_SVD_VARIABLES ""
set_interface_property avalon_slave_0 SVD_ADDRESS_GROUP ""

add_interface_port avalon_slave_0 enable begintransfer Input 1
add_interface_port avalon_slave_0 monitor_count readdata Output 32
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clock_clk clk Input 1


# 
# connection point conduit_export
# 
add_interface conduit_export conduit end
set_interface_property conduit_export associatedClock clock
set_interface_property conduit_export associatedReset reset
set_interface_property conduit_export ENABLED true
set_interface_property conduit_export EXPORT_OF ""
set_interface_property conduit_export PORT_NAME_MAP ""
set_interface_property conduit_export CMSIS_SVD_VARIABLES ""
set_interface_property conduit_export SVD_ADDRESS_GROUP ""

add_interface_port conduit_export conduit_export export_data Output 32

