##########################################################################################
##                                                                                      ##
##         General purpose xdc file for the Alchitry AU FPGA board and IO shield        ##
##                                                                                      ##
##                            #############################                             ##
##                                                                                      ##
##                     created by: Daniel Kiovics, Nandor Kofarago                      ##
##                                                                                      ##
##########################################################################################

##########################################################################################
##                               Initializing the board                                 ##
##########################################################################################
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR NO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]


##########################################################################################
##                                100MHz onboard clock                                  ##
##########################################################################################

create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]
set_property PACKAGE_PIN N14 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]


##########################################################################################
##                                 Negated reset button                                 ##
##########################################################################################

set_property PACKAGE_PIN P6 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]


##########################################################################################
##                                     Onboard LEDs                                     ##
##########################################################################################

#set_property PACKAGE_PIN K13 [get_ports {led[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

#set_property PACKAGE_PIN K12 [get_ports {led[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

#set_property PACKAGE_PIN L14 [get_ports {led[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]

#set_property PACKAGE_PIN L13 [get_ports {led[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]

#set_property PACKAGE_PIN M16 [get_ports {led[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]

#set_property PACKAGE_PIN M14 [get_ports {led[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]

#set_property PACKAGE_PIN M12 [get_ports {led[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]

#set_property PACKAGE_PIN N16 [get_ports {led[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]


##########################################################################################
##                         7 segment display on the IO shield                           ##
##########################################################################################
## All dig_n[] and seg_n[] wires are negated.                                           ##
##                                                                                      ##
##      dig_n[3]             dig_n[2]             dig_n[1]             dig_n[0]         ##
##                                                                                      ##
##         0                    0                    0                    0             ##
##    +---------+          +---------+          +---------+          +---------+        ##
##    |         |          |         |          |         |          |         |        ##
##  5 |         | 1      5 |         | 1      5 |         | 1      5 |         | 1      ##
##    |         |          |         |          |         |          |         |        ##
##    +--- 6 ---+          +--- 6 ---+          +--- 6 ---+          +--- 6 ---+        ##
##    |         |          |         |          |         |          |         |        ##
##  4 |         | 2      4 |         | 2      4 |         | 2      4 |         | 2      ##
##    |         |     7    |         |     7    |         |     7    |         |     7  ##
##    +---------+    ##    +---------+    ##    +---------+    ##    +---------+    ##  ##
##         3                    3                    3                    3             ##
##########################################################################################

####################################  dig_n[]  ###########################################

#set_property PACKAGE_PIN P9 [get_ports {dig_n[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dig_n[3]}]

#set_property PACKAGE_PIN N9 [get_ports {dig_n[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dig_n[2]}]

#set_property PACKAGE_PIN R8 [get_ports {dig_n[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dig_n[1]}]

#set_property PACKAGE_PIN P8 [get_ports {dig_n[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dig_n[0]}]

####################################  seg_n[]  ###########################################

#set_property PACKAGE_PIN T5 [get_ports {seg_n[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_n[0]}]

#set_property PACKAGE_PIN R5 [get_ports {seg_n[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_n[1]}]

#set_property PACKAGE_PIN T9 [get_ports {seg_n[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_n[2]}]

#set_property PACKAGE_PIN R6 [get_ports {seg_n[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_n[3]}]

#set_property PACKAGE_PIN R7 [get_ports {seg_n[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_n[4]}]

#set_property PACKAGE_PIN T7 [get_ports {seg_n[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_n[5]}]

#set_property PACKAGE_PIN T8 [get_ports {seg_n[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_n[6]}]

#set_property PACKAGE_PIN T10 [get_ports {seg_n[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_n[7]}]


##########################################################################################
##                           5 push buttons on the IO shield                            ##
##########################################################################################
##                                                                                      ##
##                                       +------+                                       ##
##                                       |      |                                       ##
##                                       | bt[0]|                                       ##
##                                       +------+                                       ##
##                              +------+ +------+ +------+                              ##
##                              |      | |      | |      |                              ##
##                              | bt[1]| | bt[2]| | bt[3]|                              ##
##                              +------+ +------+ +------+                              ##
##                                       +------+                                       ##
##                                       |      |                                       ##
##                                       | bt[4]|                                       ##
##                                       +------+                                       ##
##                                                                                      ##
##########################################################################################

#set_property PACKAGE_PIN C6 [get_ports {bt[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bt[0]}]
#set_property PULLDOWN TRUE [get_ports {bt[0]}]

#set_property PACKAGE_PIN B7 [get_ports {bt[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bt[1]}]
#set_property PULLDOWN TRUE [get_ports {bt[1]}]

#set_property PACKAGE_PIN C7 [get_ports {bt[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bt[2]}]
#set_property PULLDOWN TRUE [get_ports {bt[2]}]

#set_property PACKAGE_PIN P11 [get_ports {bt[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bt[3]}]
#set_property PULLDOWN TRUE [get_ports {bt[3]}]

#set_property PACKAGE_PIN A7 [get_ports {bt[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bt[4]}]
#set_property PULLDOWN TRUE [get_ports {bt[4]}]


##########################################################################################
##                           24 DIP switches on the IO shield                           ##
##########################################################################################
## Numbered 0-23 in 3 blocks from right to left, but each block is numbered from left   ##
## to right, as it is printed on the board.                                             ##
##                    +---------+      +---------+      +---------+                     ##
##                    | 16 - 23 |      | 8 - 15  |      |  0 - 7  |                     ##
##                    +---------+      +---------+      +---------+                     ##
##########################################################################################

#set_property PACKAGE_PIN C4 [get_ports {sw[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
#set_property PULLDOWN TRUE [get_ports {sw[0]}]

#set_property PACKAGE_PIN D4 [get_ports {sw[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
#set_property PULLDOWN TRUE [get_ports {sw[1]}]

#set_property PACKAGE_PIN G4 [get_ports {sw[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
#set_property PULLDOWN TRUE [get_ports {sw[2]}]

#set_property PACKAGE_PIN G5 [get_ports {sw[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
#set_property PULLDOWN TRUE [get_ports {sw[3]}]

#set_property PACKAGE_PIN E5 [get_ports {sw[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
#set_property PULLDOWN TRUE [get_ports {sw[4]}]

#set_property PACKAGE_PIN F5 [get_ports {sw[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
#set_property PULLDOWN TRUE [get_ports {sw[5]}]

#set_property PACKAGE_PIN D5 [get_ports {sw[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
#set_property PULLDOWN TRUE [get_ports {sw[6]}]

#set_property PACKAGE_PIN D6 [get_ports {sw[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
#set_property PULLDOWN TRUE [get_ports {sw[7]}]

#set_property PACKAGE_PIN N6 [get_ports {sw[8]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
#set_property PULLDOWN TRUE [get_ports {sw[8]}]

#set_property PACKAGE_PIN M6 [get_ports {sw[9]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
#set_property PULLDOWN TRUE [get_ports {sw[9]}]

#set_property PACKAGE_PIN B1 [get_ports {sw[10]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
#set_property PULLDOWN TRUE [get_ports {sw[10]}]

#set_property PACKAGE_PIN C1 [get_ports {sw[11]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
#set_property PULLDOWN TRUE [get_ports {sw[11]}]

#set_property PACKAGE_PIN C2 [get_ports {sw[12]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
#set_property PULLDOWN TRUE [get_ports {sw[12]}]

#set_property PACKAGE_PIN C3 [get_ports {sw[13]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
#set_property PULLDOWN TRUE [get_ports {sw[13]}]

#set_property PACKAGE_PIN D3 [get_ports {sw[14]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
#set_property PULLDOWN TRUE [get_ports {sw[14]}]

#set_property PACKAGE_PIN E3 [get_ports {sw[15]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]
#set_property PULLDOWN TRUE [get_ports {sw[15]}]

#set_property PACKAGE_PIN K2 [get_ports {sw[16]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[16]}]
#set_property PULLDOWN TRUE [get_ports {sw[16]}]

#set_property PACKAGE_PIN K3 [get_ports {sw[17]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[17]}]
#set_property PULLDOWN TRUE [get_ports {sw[17]}]

#set_property PACKAGE_PIN J4 [get_ports {sw[18]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[18]}]
#set_property PULLDOWN TRUE [get_ports {sw[18]}]

#set_property PACKAGE_PIN J5 [get_ports {sw[19]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[19]}]
#set_property PULLDOWN TRUE [get_ports {sw[19]}]

#set_property PACKAGE_PIN H3 [get_ports {sw[20]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[20]}]
#set_property PULLDOWN TRUE [get_ports {sw[20]}]

#set_property PACKAGE_PIN J3 [get_ports {sw[21]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[21]}]
#set_property PULLDOWN TRUE [get_ports {sw[21]}]

#set_property PACKAGE_PIN H4 [get_ports {sw[22]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[22]}]
#set_property PULLDOWN TRUE [get_ports {sw[22]}]

#set_property PACKAGE_PIN H5 [get_ports {sw[23]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[23]}]
#set_property PULLDOWN TRUE [get_ports {sw[23]}]


##########################################################################################
##                               24 LEDs on the IO shield                               ##
##########################################################################################
## Numbered 0-23, from right to left.                                                   ##
##########################################################################################

#set_property PACKAGE_PIN B6 [get_ports {ld[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[0]}]

#set_property PACKAGE_PIN B5 [get_ports {ld[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[1]}]

#set_property PACKAGE_PIN A5 [get_ports {ld[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[2]}]

#set_property PACKAGE_PIN A4 [get_ports {ld[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[3]}]

#set_property PACKAGE_PIN B4 [get_ports {ld[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[4]}]

#set_property PACKAGE_PIN A3 [get_ports {ld[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[5]}]

#set_property PACKAGE_PIN F4 [get_ports {ld[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[6]}]

#set_property PACKAGE_PIN F3 [get_ports {ld[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[7]}]

#set_property PACKAGE_PIN F2 [get_ports {ld[8]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[8]}]

#set_property PACKAGE_PIN E1 [get_ports {ld[9]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[9]}]

#set_property PACKAGE_PIN B2 [get_ports {ld[10]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[10]}]

#set_property PACKAGE_PIN A2 [get_ports {ld[11]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[11]}]

#set_property PACKAGE_PIN E2 [get_ports {ld[12]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[12]}]

#set_property PACKAGE_PIN D1 [get_ports {ld[13]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[13]}]

#set_property PACKAGE_PIN E6 [get_ports {ld[14]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[14]}]

#set_property PACKAGE_PIN K5 [get_ports {ld[15]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[15]}]

#set_property PACKAGE_PIN G2 [get_ports {ld[16]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[16]}]

#set_property PACKAGE_PIN G1 [get_ports {ld[17]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[17]}]

#set_property PACKAGE_PIN H2 [get_ports {ld[18]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[18]}]

#set_property PACKAGE_PIN H1 [get_ports {ld[19]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[19]}]

#set_property PACKAGE_PIN K1 [get_ports {ld[20]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[20]}]

#set_property PACKAGE_PIN J1 [get_ports {ld[21]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[21]}]

#set_property PACKAGE_PIN L3 [get_ports {ld[22]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[22]}]

#set_property PACKAGE_PIN L2 [get_ports {ld[23]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ld[23]}]


##########################################################################################
##                                     Serial ports                                     ##
##########################################################################################
## Serial names are flipped in the schematic (named for the FTDI chip).                 ##
##########################################################################################

#set_property PACKAGE_PIN P16 [get_ports {usb_tx}]
#set_property IOSTANDARD LVCMOS33 [get_ports {usb_tx}]

#set_property PACKAGE_PIN P15 [get_ports {usb_rx}]
#set_property IOSTANDARD LVCMOS33 [get_ports {usb_rx}]
