# File saved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 12
property maxzoom 5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 12
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new HR_Test work:HR_Test:NOFILE -nosplit
load symbol clock_divider work:clock_divider:NOFILE HIERBOX pin clock_1000Hz output.right pin clock_100MHz input.left pin clock_1Hz output.right pin clock_8000Hz output.right boxcolor 1 fillcolor 2 minwidth 13%
load symbol count_up work:count_up:NOFILE HIERBOX pin button_clear input.left pin button_stop input.left pin clk_1KHz input.left pin count_done output.right pinBus hr_state input.left [2:0] pinBus hundred_mil output.right [31:0] pinBus one_mil output.right [31:0] pinBus one_sec output.right [31:0] pinBus ten_mil output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol random_number_gen work:random_number_gen:NOFILE HIERBOX pin clock input.left pinBus rand output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol display work:display:NOFILE HIERBOX pin clk_8KHz input.left pinBus anode output.right [7:0] pinBus cathode output.right [7:0] pinBus hr_state input.left [2:0] pinBus hundred_mil input.left [31:0] pinBus one_mil input.left [31:0] pinBus one_sec input.left [31:0] pinBus ten_mil input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol capture_compare work:capture_compare:NOFILE HIERBOX pin clock_1Hz input.left pin control input.left pin count_reached output.right pinBus random_number input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_MUX0 work MUX pin I0 input.left pin I1 input.left pin O output.right pin S input.bot fillcolor 1
load symbol RTL_ROM work GEN pin O output.right pinBus A input.left [2:0] fillcolor 1
load symbol RTL_REG__BREG_3 work GEN pin C input.clk.left pin CE input.left pin D input.left pin Q output.right fillcolor 1
load symbol RTL_MUX42 work MUX pin S input.bot pinBus I0 input.left [2:0] pinBus I1 input.left [2:0] pinBus O output.right [2:0] fillcolor 1
load symbol RTL_MUX41 work MUX pinBus I0 input.left [2:0] pinBus I1 input.left [2:0] pinBus I2 input.left [2:0] pinBus I3 input.left [2:0] pinBus O output.right [2:0] pinBus S input.bot [2:0] fillcolor 1
load symbol RTL_MUX43 work MUX pin I0 input.left pin I1 input.left pin I2 input.left pin I3 input.left pin I4 input.left pin I5 input.left pin O output.right pinBus S input.bot [2:0] fillcolor 1
load symbol RTL_ROM8 work GEN pinBus A input.left [2:0] pinBus O output.right [2:0] fillcolor 1
load symbol RTL_REG_ASYNC__BREG_11 work[2:0]sssww GEN pin C input.clk.left pin CE input.left pin CLR input.top pinBus D input.left [2:0] pinBus Q output.right [2:0] fillcolor 1 sandwich 3 prop @bundle 3
load symbol RTL_REG__BREG_3 work[2:0]ssww GEN pin C input.clk.left pin CE input.left pinBus D input.left [2:0] pinBus Q output.right [2:0] fillcolor 1 sandwich 3 prop @bundle 3
load port button_clear input -pg 1 -y 210
load port clock_100MHz input -pg 1 -y 520
load port button_start input -pg 1 -y 330
load port button_stop input -pg 1 -y 500
load portBus seven_seg_cathode output [7:0] -attr @name seven_seg_cathode[7:0] -pg 1 -y 760
load portBus seven_seg_anode output [7:0] -attr @name seven_seg_anode[7:0] -pg 1 -y 740
load portBus led output [2:0] -attr @name led[2:0] -pg 1 -y 380
load inst led_i__0 RTL_ROM work -attr @cell(#000000) RTL_ROM -pinBusAttr A @name A[2:0] -pg 1 -lvl 8 -y 440
load inst control_store_or_load_reg RTL_REG__BREG_3 work -attr @cell(#000000) RTL_REG -pg 1 -lvl 3 -y 240
load inst hr_state_i__0 RTL_MUX41 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[2:0] -pinBusAttr I0 @attr V=B\"001\",\ S=3'b000 -pinBusAttr I1 @name I1[2:0] -pinBusAttr I1 @attr S=3'b001 -pinBusAttr I2 @name I2[2:0] -pinBusAttr I2 @attr V=B\"100\",\ S=3'b010 -pinBusAttr I3 @name I3[2:0] -pinBusAttr I3 @attr S=default -pinBusAttr O @name O[2:0] -pinBusAttr S @name S[2:0] -pg 1 -lvl 6 -y 200
load inst led_reg[2:0] RTL_REG_ASYNC__BREG_11 work[2:0]sssww -attr @cell(#000000) RTL_REG_ASYNC -pg 1 -lvl 9 -y 380
load inst SEVENSEG display work:display:NOFILE -autohide -attr @cell(#000000) display -pinBusAttr anode @name anode[7:0] -pinBusAttr cathode @name cathode[7:0] -pinBusAttr hr_state @name hr_state[2:0] -pinBusAttr hundred_mil @name hundred_mil[31:0] -pinBusAttr one_mil @name one_mil[31:0] -pinBusAttr one_sec @name one_sec[31:0] -pinBusAttr ten_mil @name ten_mil[31:0] -pg 1 -lvl 9 -y 690
load inst hr_state_i__1 RTL_MUX0 work -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=1'b1 -pinAttr I1 @attr S=default -pg 1 -lvl 5 -y 530
load inst hr_state_i RTL_MUX42 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[2:0] -pinBusAttr I0 @attr V=B\"011\",\ S=1'b1 -pinBusAttr I1 @name I1[2:0] -pinBusAttr I1 @attr V=B\"010\",\ S=default -pinBusAttr O @name O[2:0] -pg 1 -lvl 5 -y 400
load inst hr_state_i__2 RTL_MUX0 work -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=1'b1 -pinAttr I1 @attr S=default -pg 1 -lvl 5 -y 670
load inst hr_state_parse_reg[2:0] RTL_REG__BREG_3 work[2:0]ssww -attr @cell(#000000) RTL_REG -pg 1 -lvl 3 -y 420
load inst hr_state_i__3 RTL_MUX43 work -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=3'b000 -pinAttr I1 @attr S=3'b001 -pinAttr I2 @attr S=3'b010 -pinAttr I3 @attr S=3'b011 -pinAttr I4 @attr S=3'b100 -pinAttr I5 @attr S=default -pinBusAttr S @name S[2:0] -pg 1 -lvl 6 -y 420
load inst RANDGENN random_number_gen work:random_number_gen:NOFILE -autohide -attr @cell(#000000) random_number_gen -pinBusAttr rand @name rand[3:0] -pg 1 -lvl 3 -y 720
load inst control_store_or_load_i RTL_ROM work -attr @cell(#000000) RTL_ROM -pinBusAttr A @name A[2:0] -pg 1 -lvl 2 -y 280
load inst CLOCKDIV clock_divider work:clock_divider:NOFILE -autohide -attr @cell(#000000) clock_divider -pg 1 -lvl 3 -y 800
load inst MILSECONDCOUNT count_up work:count_up:NOFILE -autohide -attr @cell(#000000) count_up -pinBusAttr hr_state @name hr_state[2:0] -pinBusAttr hundred_mil @name hundred_mil[31:0] -pinBusAttr one_mil @name one_mil[31:0] -pinBusAttr one_sec @name one_sec[31:0] -pinBusAttr ten_mil @name ten_mil[31:0] -pg 1 -lvl 4 -y 520
load inst control0_i RTL_MUX0 work -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=1'b0 -pinAttr I1 @attr S=default -pg 1 -lvl 2 -y 40
load inst hr_state_reg[2:0] RTL_REG_ASYNC__BREG_11 work[2:0]sssww -attr @cell(#000000) RTL_REG_ASYNC -pg 1 -lvl 7 -y 380
load inst hr_state_parse_i RTL_ROM work -attr @cell(#000000) RTL_ROM -pinBusAttr A @name A[2:0] -pg 1 -lvl 1 -y 160
load inst SIGCOUNT capture_compare work:capture_compare:NOFILE -autohide -attr @cell(#000000) capture_compare -pinBusAttr random_number @name random_number[3:0] -pg 1 -lvl 4 -y 720
load inst hr_state0_i RTL_MUX0 work -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=1'b0 -pinAttr I1 @attr S=default -pg 1 -lvl 2 -y 160
load inst led_i RTL_ROM8 work -attr @cell(#000000) RTL_ROM -pinBusAttr A @name A[2:0] -pinBusAttr O @name O[2:0] -pg 1 -lvl 8 -y 360
load net button_stop -pin MILSECONDCOUNT button_stop -port button_stop -pin hr_state_i S -pin hr_state_i__1 S -pin hr_state_i__2 S
netloc button_stop 1 0 5 NJ 500 NJ 500 NJ 500 820 470 1320
load net led_i_n_2 -attr @rip O[0] -pin led_i O[0] -pin led_reg[2:0] D[0]
load net one_sec_bus[23] -attr @rip one_sec[23] -pin MILSECONDCOUNT one_sec[23] -pin SEVENSEG one_sec[23]
load net hr_state[2] -attr @rip 2 -pin MILSECONDCOUNT hr_state[2] -pin SEVENSEG hr_state[2] -pin hr_state_parse_reg[2:0] Q[2]
load net hundred_mil_bus[22] -attr @rip hundred_mil[22] -pin MILSECONDCOUNT hundred_mil[22] -pin SEVENSEG hundred_mil[22]
load net hr_state_i__3_n_0 -pin hr_state_i__3 O -pin hr_state_reg[2:0] CE
netloc hr_state_i__3_n_0 1 6 1 2040
load net one_mil_bus[10] -attr @rip one_mil[10] -pin MILSECONDCOUNT one_mil[10] -pin SEVENSEG one_mil[10]
load net one_sec_bus[14] -attr @rip one_sec[14] -pin MILSECONDCOUNT one_sec[14] -pin SEVENSEG one_sec[14]
load net seven_seg_anode[4] -attr @rip anode[4] -pin SEVENSEG anode[4] -port seven_seg_anode[4]
load net seven_seg_cathode[5] -attr @rip cathode[5] -pin SEVENSEG cathode[5] -port seven_seg_cathode[5]
load net ten_mil_bus[6] -attr @rip ten_mil[6] -pin MILSECONDCOUNT ten_mil[6] -pin SEVENSEG ten_mil[6]
load net control -pin SIGCOUNT control -pin control_store_or_load_reg Q
netloc control 1 3 1 780
load net one_mil_bus[23] -attr @rip one_mil[23] -pin MILSECONDCOUNT one_mil[23] -pin SEVENSEG one_mil[23]
load net one_mil_bus[9] -attr @rip one_mil[9] -pin MILSECONDCOUNT one_mil[9] -pin SEVENSEG one_mil[9]
load net one_sec_bus[8] -attr @rip one_sec[8] -pin MILSECONDCOUNT one_sec[8] -pin SEVENSEG one_sec[8]
load net count_reached -pin SIGCOUNT count_reached -pin hr_state_i__1 I1
netloc count_reached 1 4 1 1280
load net led[2] -attr @rip 2 -port led[2] -pin led_reg[2:0] Q[2]
load net one_mil_bus[17] -attr @rip one_mil[17] -pin MILSECONDCOUNT one_mil[17] -pin SEVENSEG one_mil[17]
load net one_mil_bus[8] -attr @rip one_mil[8] -pin MILSECONDCOUNT one_mil[8] -pin SEVENSEG one_mil[8]
load net one_sec_bus[20] -attr @rip one_sec[20] -pin MILSECONDCOUNT one_sec[20] -pin SEVENSEG one_sec[20]
load net seven_seg_cathode[2] -attr @rip cathode[2] -pin SEVENSEG cathode[2] -port seven_seg_cathode[2]
load net ten_mil_bus[2] -attr @rip ten_mil[2] -pin MILSECONDCOUNT ten_mil[2] -pin SEVENSEG ten_mil[2]
load net hundred_mil_bus[17] -attr @rip hundred_mil[17] -pin MILSECONDCOUNT hundred_mil[17] -pin SEVENSEG hundred_mil[17]
load net one_mil_bus[3] -attr @rip one_mil[3] -pin MILSECONDCOUNT one_mil[3] -pin SEVENSEG one_mil[3]
load net seven_seg_anode[1] -attr @rip anode[1] -pin SEVENSEG anode[1] -port seven_seg_anode[1]
load net ten_mil_bus[21] -attr @rip ten_mil[21] -pin MILSECONDCOUNT ten_mil[21] -pin SEVENSEG ten_mil[21]
load net hundred_mil_bus[12] -attr @rip hundred_mil[12] -pin MILSECONDCOUNT hundred_mil[12] -pin SEVENSEG hundred_mil[12]
load net hr_state_i__2_n_0 -pin hr_state_i__2 O -pin hr_state_i__3 I2
netloc hr_state_i__2_n_0 1 5 1 1670
load net hr_state_reg_n_0 -attr @rip 2 -pin control_store_or_load_i A[2] -pin hr_state_i__0 S[2] -pin hr_state_i__3 S[2] -pin hr_state_parse_i A[2] -pin hr_state_parse_reg[2:0] D[2] -pin hr_state_reg[2:0] Q[2] -pin led_i A[2] -pin led_i__0 A[2]
load net hr_state0_out[2] -attr @rip O[2] -pin hr_state_i__0 O[2] -pin hr_state_reg[2:0] D[2]
load net one_sec_bus[7] -attr @rip one_sec[7] -pin MILSECONDCOUNT one_sec[7] -pin SEVENSEG one_sec[7]
load net ten_mil_bus[5] -attr @rip ten_mil[5] -pin MILSECONDCOUNT ten_mil[5] -pin SEVENSEG ten_mil[5]
load net hr_state_reg_n_1 -attr @rip 1 -pin control_store_or_load_i A[1] -pin hr_state_i__0 S[1] -pin hr_state_i__3 S[1] -pin hr_state_parse_i A[1] -pin hr_state_parse_reg[2:0] D[1] -pin hr_state_reg[2:0] Q[1] -pin led_i A[1] -pin led_i__0 A[1]
load net hundred_mil_bus[8] -attr @rip hundred_mil[8] -pin MILSECONDCOUNT hundred_mil[8] -pin SEVENSEG hundred_mil[8]
load net one_mil_bus[22] -attr @rip one_mil[22] -pin MILSECONDCOUNT one_mil[22] -pin SEVENSEG one_mil[22]
load net one_sec_bus[2] -attr @rip one_sec[2] -pin MILSECONDCOUNT one_sec[2] -pin SEVENSEG one_sec[2]
load net ten_mil_bus[16] -attr @rip ten_mil[16] -pin MILSECONDCOUNT ten_mil[16] -pin SEVENSEG ten_mil[16]
load net hundred_mil_bus[23] -attr @rip hundred_mil[23] -pin MILSECONDCOUNT hundred_mil[23] -pin SEVENSEG hundred_mil[23]
load net hr_state_reg_n_2 -attr @rip 0 -pin control_store_or_load_i A[0] -pin hr_state_i__0 S[0] -pin hr_state_i__3 S[0] -pin hr_state_parse_i A[0] -pin hr_state_parse_reg[2:0] D[0] -pin hr_state_reg[2:0] Q[0] -pin led_i A[0] -pin led_i__0 A[0]
load net ten_mil_bus[27] -attr @rip ten_mil[27] -pin MILSECONDCOUNT ten_mil[27] -pin SEVENSEG ten_mil[27]
load net hundred_mil_bus[5] -attr @rip hundred_mil[5] -pin MILSECONDCOUNT hundred_mil[5] -pin SEVENSEG hundred_mil[5]
load net one_mil_bus[2] -attr @rip one_mil[2] -pin MILSECONDCOUNT one_mil[2] -pin SEVENSEG one_mil[2]
load net hr_state0_out[1] -attr @rip O[1] -pin hr_state_i__0 O[1] -pin hr_state_reg[2:0] D[1]
load net hundred_mil_bus[11] -attr @rip hundred_mil[11] -pin MILSECONDCOUNT hundred_mil[11] -pin SEVENSEG hundred_mil[11]
load net hr_state[0] -attr @rip 0 -pin MILSECONDCOUNT hr_state[0] -pin SEVENSEG hr_state[0] -pin hr_state_parse_reg[2:0] Q[0]
load net hundred_mil_bus[2] -attr @rip hundred_mil[2] -pin MILSECONDCOUNT hundred_mil[2] -pin SEVENSEG hundred_mil[2]
load net hundred_mil_bus[20] -attr @rip hundred_mil[20] -pin MILSECONDCOUNT hundred_mil[20] -pin SEVENSEG hundred_mil[20]
load net one_mil_bus[18] -attr @rip one_mil[18] -pin MILSECONDCOUNT one_mil[18] -pin SEVENSEG one_mil[18]
load net one_sec_bus[17] -attr @rip one_sec[17] -pin MILSECONDCOUNT one_sec[17] -pin SEVENSEG one_sec[17]
load net one_sec_bus[1] -attr @rip one_sec[1] -pin MILSECONDCOUNT one_sec[1] -pin SEVENSEG one_sec[1]
load net seven_seg_cathode[3] -attr @rip cathode[3] -pin SEVENSEG cathode[3] -port seven_seg_cathode[3]
load net ten_mil_bus[24] -attr @rip ten_mil[24] -pin MILSECONDCOUNT ten_mil[24] -pin SEVENSEG ten_mil[24]
load net control0 -pin control0_i O -pin control_store_or_load_reg CE
netloc control0 1 2 1 490
load net hr_state_parse -pin hr_state0_i I0 -pin hr_state_parse_i O
netloc hr_state_parse 1 1 1 NJ
load net <const1> -power -pin control0_i I0 -pin hr_state_i I0[1] -pin hr_state_i I0[0] -pin hr_state_i I1[1] -pin hr_state_i__0 I0[0] -pin hr_state_i__0 I2[2] -pin hr_state_i__1 I0 -pin hr_state_i__2 I0 -pin hr_state_i__3 I5
load net count_done -pin MILSECONDCOUNT count_done -pin hr_state_i__2 I1
netloc count_done 1 4 1 1180
load net led[0] -attr @rip 0 -port led[0] -pin led_reg[2:0] Q[0]
load net one_mil_bus[15] -attr @rip one_mil[15] -pin MILSECONDCOUNT one_mil[15] -pin SEVENSEG one_mil[15]
load net one_sec_bus[28] -attr @rip one_sec[28] -pin MILSECONDCOUNT one_sec[28] -pin SEVENSEG one_sec[28]
load net seven_seg_cathode[0] -attr @rip cathode[0] -pin SEVENSEG cathode[0] -port seven_seg_cathode[0]
load net ten_mil_bus[0] -attr @rip ten_mil[0] -pin MILSECONDCOUNT ten_mil[0] -pin SEVENSEG ten_mil[0]
load net one_mil_bus[28] -attr @rip one_mil[28] -pin MILSECONDCOUNT one_mil[28] -pin SEVENSEG one_mil[28]
load net one_sec_bus[25] -attr @rip one_sec[25] -pin MILSECONDCOUNT one_sec[25] -pin SEVENSEG one_sec[25]
load net ten_mil_bus[8] -attr @rip ten_mil[8] -pin MILSECONDCOUNT ten_mil[8] -pin SEVENSEG ten_mil[8]
load net one_sec_bus[11] -attr @rip one_sec[11] -pin MILSECONDCOUNT one_sec[11] -pin SEVENSEG one_sec[11]
load net one_sec_bus[16] -attr @rip one_sec[16] -pin MILSECONDCOUNT one_sec[16] -pin SEVENSEG one_sec[16]
load net seven_seg_anode[6] -attr @rip anode[6] -pin SEVENSEG anode[6] -port seven_seg_anode[6]
load net ten_mil_bus[11] -attr @rip ten_mil[11] -pin MILSECONDCOUNT ten_mil[11] -pin SEVENSEG ten_mil[11]
load net ten_mil_bus[19] -attr @rip ten_mil[19] -pin MILSECONDCOUNT ten_mil[19] -pin SEVENSEG ten_mil[19]
load net hundred_mil_bus[31] -attr @rip hundred_mil[31] -pin MILSECONDCOUNT hundred_mil[31] -pin SEVENSEG hundred_mil[31]
load net one_mil_bus[25] -attr @rip one_mil[25] -pin MILSECONDCOUNT one_mil[25] -pin SEVENSEG one_mil[25]
load net one_sec_bus[22] -attr @rip one_sec[22] -pin MILSECONDCOUNT one_sec[22] -pin SEVENSEG one_sec[22]
load net ten_mil_bus[14] -attr @rip ten_mil[14] -pin MILSECONDCOUNT ten_mil[14] -pin SEVENSEG ten_mil[14]
load net control_store_or_load -pin control_store_or_load_i O -pin control_store_or_load_reg D
netloc control_store_or_load 1 2 1 NJ
load net hundred_mil_bus[19] -attr @rip hundred_mil[19] -pin MILSECONDCOUNT hundred_mil[19] -pin SEVENSEG hundred_mil[19]
load net hundred_mil_bus[21] -attr @rip hundred_mil[21] -pin MILSECONDCOUNT hundred_mil[21] -pin SEVENSEG hundred_mil[21]
load net one_mil_bus[5] -attr @rip one_mil[5] -pin MILSECONDCOUNT one_mil[5] -pin SEVENSEG one_mil[5]
load net hundred_mil_bus[28] -attr @rip hundred_mil[28] -pin MILSECONDCOUNT hundred_mil[28] -pin SEVENSEG hundred_mil[28]
load net hundred_mil_bus[14] -attr @rip hundred_mil[14] -pin MILSECONDCOUNT hundred_mil[14] -pin SEVENSEG hundred_mil[14]
load net seven_seg_anode[3] -attr @rip anode[3] -pin SEVENSEG anode[3] -port seven_seg_anode[3]
load net one_mil_bus[16] -attr @rip one_mil[16] -pin MILSECONDCOUNT one_mil[16] -pin SEVENSEG one_mil[16]
load net one_sec_bus[10] -attr @rip one_sec[10] -pin MILSECONDCOUNT one_sec[10] -pin SEVENSEG one_sec[10]
load net one_sec_bus[4] -attr @rip one_sec[4] -pin MILSECONDCOUNT one_sec[4] -pin SEVENSEG one_sec[4]
load net seven_seg_cathode[1] -attr @rip cathode[1] -pin SEVENSEG cathode[1] -port seven_seg_cathode[1]
load net ten_mil_bus[7] -attr @rip ten_mil[7] -pin MILSECONDCOUNT ten_mil[7] -pin SEVENSEG ten_mil[7]
load net one_mil_bus[24] -attr @rip one_mil[24] -pin MILSECONDCOUNT one_mil[24] -pin SEVENSEG one_mil[24]
load net one_sec_bus[9] -attr @rip one_sec[9] -pin MILSECONDCOUNT one_sec[9] -pin SEVENSEG one_sec[9]
load net seven_seg_anode[0] -attr @rip anode[0] -pin SEVENSEG anode[0] -port seven_seg_anode[0]
load net bus_random_number[1] -attr @rip rand[1] -pin RANDGENN rand[1] -pin SIGCOUNT random_number[1]
load net led_i__0_n_0 -pin led_i__0 O -pin led_reg[2:0] CE
netloc led_i__0_n_0 1 8 1 2440
load net one_mil_bus[13] -attr @rip one_mil[13] -pin MILSECONDCOUNT one_mil[13] -pin SEVENSEG one_mil[13]
load net ten_mil_bus[29] -attr @rip ten_mil[29] -pin MILSECONDCOUNT ten_mil[29] -pin SEVENSEG ten_mil[29]
load net hundred_mil_bus[7] -attr @rip hundred_mil[7] -pin MILSECONDCOUNT hundred_mil[7] -pin SEVENSEG hundred_mil[7]
load net one_mil_bus[4] -attr @rip one_mil[4] -pin MILSECONDCOUNT one_mil[4] -pin SEVENSEG one_mil[4]
load net hr_state_i__1_n_0 -pin hr_state_i__1 O -pin hr_state_i__3 I1
netloc hr_state_i__1_n_0 1 5 1 1650
load net hundred_mil_bus[13] -attr @rip hundred_mil[13] -pin MILSECONDCOUNT hundred_mil[13] -pin SEVENSEG hundred_mil[13]
load net one_mil_bus[31] -attr @rip one_mil[31] -pin MILSECONDCOUNT one_mil[31] -pin SEVENSEG one_mil[31]
load net ten_mil_bus[26] -attr @rip ten_mil[26] -pin MILSECONDCOUNT ten_mil[26] -pin SEVENSEG ten_mil[26]
load net ten_mil_bus[30] -attr @rip ten_mil[30] -pin MILSECONDCOUNT ten_mil[30] -pin SEVENSEG ten_mil[30]
load net hundred_mil_bus[29] -attr @rip hundred_mil[29] -pin MILSECONDCOUNT hundred_mil[29] -pin SEVENSEG hundred_mil[29]
load net clock_100MHz -pin CLOCKDIV clock_100MHz -pin RANDGENN clock -port clock_100MHz -pin control_store_or_load_reg C -pin hr_state_parse_reg[2:0] C -pin hr_state_reg[2:0] C -pin led_reg[2:0] C
netloc clock_100MHz 1 0 9 NJ 520 NJ 520 470 670 NJ 670 NJ 830 NJ 820 2020 490 NJ 490 2420
load net hundred_mil_bus[4] -attr @rip hundred_mil[4] -pin MILSECONDCOUNT hundred_mil[4] -pin SEVENSEG hundred_mil[4]
load net one_sec_bus[19] -attr @rip one_sec[19] -pin MILSECONDCOUNT one_sec[19] -pin SEVENSEG one_sec[19]
load net one_sec_bus[3] -attr @rip one_sec[3] -pin MILSECONDCOUNT one_sec[3] -pin SEVENSEG one_sec[3]
load net ten_mil_bus[17] -attr @rip ten_mil[17] -pin MILSECONDCOUNT ten_mil[17] -pin SEVENSEG ten_mil[17]
load net bus_random_number[0] -attr @rip rand[0] -pin RANDGENN rand[0] -pin SIGCOUNT random_number[0]
load net one_sec_bus[30] -attr @rip one_sec[30] -pin MILSECONDCOUNT one_sec[30] -pin SEVENSEG one_sec[30]
load net hundred_mil_bus[1] -attr @rip hundred_mil[1] -pin MILSECONDCOUNT hundred_mil[1] -pin SEVENSEG hundred_mil[1]
load net ten_mil_bus[23] -attr @rip ten_mil[23] -pin MILSECONDCOUNT ten_mil[23] -pin SEVENSEG ten_mil[23]
load net hundred_mil_bus[26] -attr @rip hundred_mil[26] -pin MILSECONDCOUNT hundred_mil[26] -pin SEVENSEG hundred_mil[26]
load net hr_state0 -pin hr_state0_i O -pin hr_state_parse_reg[2:0] CE
netloc hr_state0 1 2 1 430
load net ten_mil_bus[31] -attr @rip ten_mil[31] -pin MILSECONDCOUNT ten_mil[31] -pin SEVENSEG ten_mil[31]
load net hr_state[1] -attr @rip 1 -pin MILSECONDCOUNT hr_state[1] -pin SEVENSEG hr_state[1] -pin hr_state_parse_reg[2:0] Q[1]
load net one_mil_bus[14] -attr @rip one_mil[14] -pin MILSECONDCOUNT one_mil[14] -pin SEVENSEG one_mil[14]
load net one_mil_bus[19] -attr @rip one_mil[19] -pin MILSECONDCOUNT one_mil[19] -pin SEVENSEG one_mil[19]
load net one_sec_bus[13] -attr @rip one_sec[13] -pin MILSECONDCOUNT one_sec[13] -pin SEVENSEG one_sec[13]
load net one_sec_bus[18] -attr @rip one_sec[18] -pin MILSECONDCOUNT one_sec[18] -pin SEVENSEG one_sec[18]
load net one_sec_bus[27] -attr @rip one_sec[27] -pin MILSECONDCOUNT one_sec[27] -pin SEVENSEG one_sec[27]
load net one_mil_bus[27] -attr @rip one_mil[27] -pin MILSECONDCOUNT one_mil[27] -pin SEVENSEG one_mil[27]
load net one_sec_bus[24] -attr @rip one_sec[24] -pin MILSECONDCOUNT one_sec[24] -pin SEVENSEG one_sec[24]
load net hundred_mil_bus[0] -attr @rip hundred_mil[0] -pin MILSECONDCOUNT hundred_mil[0] -pin SEVENSEG hundred_mil[0]
load net led[1] -attr @rip 1 -port led[1] -pin led_reg[2:0] Q[1]
load net one_mil_bus[11] -attr @rip one_mil[11] -pin MILSECONDCOUNT one_mil[11] -pin SEVENSEG one_mil[11]
load net one_mil_bus[7] -attr @rip one_mil[7] -pin MILSECONDCOUNT one_mil[7] -pin SEVENSEG one_mil[7]
load net seven_seg_anode[5] -attr @rip anode[5] -pin SEVENSEG anode[5] -port seven_seg_anode[5]
load net seven_seg_cathode[6] -attr @rip cathode[6] -pin SEVENSEG cathode[6] -port seven_seg_cathode[6]
load net ten_mil_bus[10] -attr @rip ten_mil[10] -pin MILSECONDCOUNT ten_mil[10] -pin SEVENSEG ten_mil[10]
load net button_clear -pin MILSECONDCOUNT button_clear -port button_clear -pin control0_i S -pin hr_state0_i S -pin hr_state_reg[2:0] CLR -pin led_reg[2:0] CLR
netloc button_clear 1 0 9 NJ 210 200 N NJ 310 800 310 NJ 290 NJ 310 NJ N NJ 310 N
load net clock_8kHz_line -pin CLOCKDIV clock_8000Hz -pin SEVENSEG clk_8KHz
netloc clock_8kHz_line 1 3 6 820 840 NJ 850 NJ 840 NJ 840 NJ 840 NJ
load net hundred_mil_bus[16] -attr @rip hundred_mil[16] -pin MILSECONDCOUNT hundred_mil[16] -pin SEVENSEG hundred_mil[16]
load net clock_1Hz_line -pin CLOCKDIV clock_1Hz -pin SIGCOUNT clock_1Hz
netloc clock_1Hz_line 1 3 1 820
load net ten_mil_bus[20] -attr @rip ten_mil[20] -pin MILSECONDCOUNT ten_mil[20] -pin SEVENSEG ten_mil[20]
load net ten_mil_bus[9] -attr @rip ten_mil[9] -pin MILSECONDCOUNT ten_mil[9] -pin SEVENSEG ten_mil[9]
load net button_start -port button_start -pin hr_state_i__3 I0
netloc button_start 1 0 6 NJ 330 NJ 330 NJ 330 NJ 330 NJ 310 NJ
load net one_sec_bus[12] -attr @rip one_sec[12] -pin MILSECONDCOUNT one_sec[12] -pin SEVENSEG one_sec[12]
load net one_sec_bus[21] -attr @rip one_sec[21] -pin MILSECONDCOUNT one_sec[21] -pin SEVENSEG one_sec[21]
load net one_sec_bus[6] -attr @rip one_sec[6] -pin MILSECONDCOUNT one_sec[6] -pin SEVENSEG one_sec[6]
load net ten_mil_bus[3] -attr @rip ten_mil[3] -pin MILSECONDCOUNT ten_mil[3] -pin SEVENSEG ten_mil[3]
load net ten_mil_bus[4] -attr @rip ten_mil[4] -pin MILSECONDCOUNT ten_mil[4] -pin SEVENSEG ten_mil[4]
load net hundred_mil_bus[27] -attr @rip hundred_mil[27] -pin MILSECONDCOUNT hundred_mil[27] -pin SEVENSEG hundred_mil[27]
load net one_mil_bus[21] -attr @rip one_mil[21] -pin MILSECONDCOUNT one_mil[21] -pin SEVENSEG one_mil[21]
load net one_mil_bus[26] -attr @rip one_mil[26] -pin MILSECONDCOUNT one_mil[26] -pin SEVENSEG one_mil[26]
load net seven_seg_anode[2] -attr @rip anode[2] -pin SEVENSEG anode[2] -port seven_seg_anode[2]
load net ten_mil_bus[15] -attr @rip ten_mil[15] -pin MILSECONDCOUNT ten_mil[15] -pin SEVENSEG ten_mil[15]
load net one_mil_bus[6] -attr @rip one_mil[6] -pin MILSECONDCOUNT one_mil[6] -pin SEVENSEG one_mil[6]
load net hundred_mil_bus[15] -attr @rip hundred_mil[15] -pin MILSECONDCOUNT hundred_mil[15] -pin SEVENSEG hundred_mil[15]
load net hundred_mil_bus[9] -attr @rip hundred_mil[9] -pin MILSECONDCOUNT hundred_mil[9] -pin SEVENSEG hundred_mil[9]
load net one_mil_bus[1] -attr @rip one_mil[1] -pin MILSECONDCOUNT one_mil[1] -pin SEVENSEG one_mil[1]
load net hr_state0_out[0] -attr @rip O[0] -pin hr_state_i__0 O[0] -pin hr_state_reg[2:0] D[0]
load net hundred_mil_bus[24] -attr @rip hundred_mil[24] -pin MILSECONDCOUNT hundred_mil[24] -pin SEVENSEG hundred_mil[24]
load net bus_random_number[3] -attr @rip rand[3] -pin RANDGENN rand[3] -pin SIGCOUNT random_number[3]
load net hundred_mil_bus[10] -attr @rip hundred_mil[10] -pin MILSECONDCOUNT hundred_mil[10] -pin SEVENSEG hundred_mil[10]
load net clock_1kHz_line -pin CLOCKDIV clock_1000Hz -pin MILSECONDCOUNT clk_1KHz
netloc clock_1kHz_line 1 3 1 800
load net one_mil_bus[12] -attr @rip one_mil[12] -pin MILSECONDCOUNT one_mil[12] -pin SEVENSEG one_mil[12]
load net one_sec_bus[5] -attr @rip one_sec[5] -pin MILSECONDCOUNT one_sec[5] -pin SEVENSEG one_sec[5]
load net ten_mil_bus[28] -attr @rip ten_mil[28] -pin MILSECONDCOUNT ten_mil[28] -pin SEVENSEG ten_mil[28]
load net hundred_mil_bus[6] -attr @rip hundred_mil[6] -pin MILSECONDCOUNT hundred_mil[6] -pin SEVENSEG hundred_mil[6]
load net one_mil_bus[20] -attr @rip one_mil[20] -pin MILSECONDCOUNT one_mil[20] -pin SEVENSEG one_mil[20]
load net one_sec_bus[0] -attr @rip one_sec[0] -pin MILSECONDCOUNT one_sec[0] -pin SEVENSEG one_sec[0]
load net seven_seg_cathode[7] -attr @rip cathode[7] -pin SEVENSEG cathode[7] -port seven_seg_cathode[7]
load net bus_random_number[2] -attr @rip rand[2] -pin RANDGENN rand[2] -pin SIGCOUNT random_number[2]
load net one_mil_bus[30] -attr @rip one_mil[30] -pin MILSECONDCOUNT one_mil[30] -pin SEVENSEG one_mil[30]
load net <const0> -ground -pin control0_i I1 -pin hr_state0_i I1 -pin hr_state_i I0[2] -pin hr_state_i I1[2] -pin hr_state_i I1[0] -pin hr_state_i__0 I0[2] -pin hr_state_i__0 I0[1] -pin hr_state_i__0 I2[1] -pin hr_state_i__0 I2[0] -pin hr_state_i__0 I3[2] -pin hr_state_i__0 I3[1] -pin hr_state_i__0 I3[0] -pin hr_state_i__3 I3 -pin hr_state_i__3 I4
load net hundred_mil_bus[3] -attr @rip hundred_mil[3] -pin MILSECONDCOUNT hundred_mil[3] -pin SEVENSEG hundred_mil[3]
load net seven_seg_cathode[4] -attr @rip cathode[4] -pin SEVENSEG cathode[4] -port seven_seg_cathode[4]
load net ten_mil_bus[25] -attr @rip ten_mil[25] -pin MILSECONDCOUNT ten_mil[25] -pin SEVENSEG ten_mil[25]
load net one_mil_bus[0] -attr @rip one_mil[0] -pin MILSECONDCOUNT one_mil[0] -pin SEVENSEG one_mil[0]
load net hr_state_i_n_0 -attr @rip O[2] -pin hr_state_i O[2] -pin hr_state_i__0 I1[2]
load net one_sec_bus[15] -attr @rip one_sec[15] -pin MILSECONDCOUNT one_sec[15] -pin SEVENSEG one_sec[15]
load net one_sec_bus[29] -attr @rip one_sec[29] -pin MILSECONDCOUNT one_sec[29] -pin SEVENSEG one_sec[29]
load net ten_mil_bus[18] -attr @rip ten_mil[18] -pin MILSECONDCOUNT ten_mil[18] -pin SEVENSEG ten_mil[18]
load net ten_mil_bus[1] -attr @rip ten_mil[1] -pin MILSECONDCOUNT ten_mil[1] -pin SEVENSEG ten_mil[1]
load net ten_mil_bus[22] -attr @rip ten_mil[22] -pin MILSECONDCOUNT ten_mil[22] -pin SEVENSEG ten_mil[22]
load net hr_state_i_n_1 -attr @rip O[1] -pin hr_state_i O[1] -pin hr_state_i__0 I1[1]
load net hundred_mil_bus[30] -attr @rip hundred_mil[30] -pin MILSECONDCOUNT hundred_mil[30] -pin SEVENSEG hundred_mil[30]
load net hundred_mil_bus[25] -attr @rip hundred_mil[25] -pin MILSECONDCOUNT hundred_mil[25] -pin SEVENSEG hundred_mil[25]
load net led_i_n_0 -attr @rip O[2] -pin led_i O[2] -pin led_reg[2:0] D[2]
load net one_mil_bus[29] -attr @rip one_mil[29] -pin MILSECONDCOUNT one_mil[29] -pin SEVENSEG one_mil[29]
load net ten_mil_bus[13] -attr @rip ten_mil[13] -pin MILSECONDCOUNT ten_mil[13] -pin SEVENSEG ten_mil[13]
load net hr_state_i_n_2 -attr @rip O[0] -pin hr_state_i O[0] -pin hr_state_i__0 I1[0]
load net hundred_mil_bus[18] -attr @rip hundred_mil[18] -pin MILSECONDCOUNT hundred_mil[18] -pin SEVENSEG hundred_mil[18]
load net led_i_n_1 -attr @rip O[1] -pin led_i O[1] -pin led_reg[2:0] D[1]
load net one_sec_bus[26] -attr @rip one_sec[26] -pin MILSECONDCOUNT one_sec[26] -pin SEVENSEG one_sec[26]
load net one_sec_bus[31] -attr @rip one_sec[31] -pin MILSECONDCOUNT one_sec[31] -pin SEVENSEG one_sec[31]
load net seven_seg_anode[7] -attr @rip anode[7] -pin SEVENSEG anode[7] -port seven_seg_anode[7]
load net ten_mil_bus[12] -attr @rip ten_mil[12] -pin MILSECONDCOUNT ten_mil[12] -pin SEVENSEG ten_mil[12]
load netBundle @hr_state 3 hr_state[2] hr_state[1] hr_state[0] -autobundled
netbloc @hr_state 1 3 6 760 650 NJ 610 NJ 720 NJ 720 NJ 720 NJ
load netBundle @one_sec_bus 32 one_sec_bus[31] one_sec_bus[30] one_sec_bus[29] one_sec_bus[28] one_sec_bus[27] one_sec_bus[26] one_sec_bus[25] one_sec_bus[24] one_sec_bus[23] one_sec_bus[22] one_sec_bus[21] one_sec_bus[20] one_sec_bus[19] one_sec_bus[18] one_sec_bus[17] one_sec_bus[16] one_sec_bus[15] one_sec_bus[14] one_sec_bus[13] one_sec_bus[12] one_sec_bus[11] one_sec_bus[10] one_sec_bus[9] one_sec_bus[8] one_sec_bus[7] one_sec_bus[6] one_sec_bus[5] one_sec_bus[4] one_sec_bus[3] one_sec_bus[2] one_sec_bus[1] one_sec_bus[0] -autobundled
netbloc @one_sec_bus 1 4 5 1220 790 NJ 780 NJ 780 NJ 780 NJ
load netBundle @one_mil_bus 32 one_mil_bus[31] one_mil_bus[30] one_mil_bus[29] one_mil_bus[28] one_mil_bus[27] one_mil_bus[26] one_mil_bus[25] one_mil_bus[24] one_mil_bus[23] one_mil_bus[22] one_mil_bus[21] one_mil_bus[20] one_mil_bus[19] one_mil_bus[18] one_mil_bus[17] one_mil_bus[16] one_mil_bus[15] one_mil_bus[14] one_mil_bus[13] one_mil_bus[12] one_mil_bus[11] one_mil_bus[10] one_mil_bus[9] one_mil_bus[8] one_mil_bus[7] one_mil_bus[6] one_mil_bus[5] one_mil_bus[4] one_mil_bus[3] one_mil_bus[2] one_mil_bus[1] one_mil_bus[0] -autobundled
netbloc @one_mil_bus 1 4 5 1240 770 NJ 760 NJ 760 NJ 760 NJ
load netBundle @led 3 led[2] led[1] led[0] -autobundled
netbloc @led 1 9 1 NJ
load netBundle @seven_seg_cathode 8 seven_seg_cathode[7] seven_seg_cathode[6] seven_seg_cathode[5] seven_seg_cathode[4] seven_seg_cathode[3] seven_seg_cathode[2] seven_seg_cathode[1] seven_seg_cathode[0] -autobundled
netbloc @seven_seg_cathode 1 9 1 NJ
load netBundle @bus_random_number 4 bus_random_number[3] bus_random_number[2] bus_random_number[1] bus_random_number[0] -autobundled
netbloc @bus_random_number 1 3 1 NJ
load netBundle @hr_state_reg_n_0 3 hr_state_reg_n_0 hr_state_reg_n_1 hr_state_reg_n_2 -autobundled
netbloc @hr_state_reg_n_0 1 0 8 20 230 180 350 450 350 NJ 350 NJ 330 1690 N NJ 280 2260
load netBundle @led_i_n_0,led_i_n_1,led_i_n_2 3 led_i_n_0 led_i_n_1 led_i_n_2 -autobundled
netbloc @led_i_n_0,led_i_n_1,led_i_n_2 1 8 1 2400
load netBundle @hundred_mil_bus 32 hundred_mil_bus[31] hundred_mil_bus[30] hundred_mil_bus[29] hundred_mil_bus[28] hundred_mil_bus[27] hundred_mil_bus[26] hundred_mil_bus[25] hundred_mil_bus[24] hundred_mil_bus[23] hundred_mil_bus[22] hundred_mil_bus[21] hundred_mil_bus[20] hundred_mil_bus[19] hundred_mil_bus[18] hundred_mil_bus[17] hundred_mil_bus[16] hundred_mil_bus[15] hundred_mil_bus[14] hundred_mil_bus[13] hundred_mil_bus[12] hundred_mil_bus[11] hundred_mil_bus[10] hundred_mil_bus[9] hundred_mil_bus[8] hundred_mil_bus[7] hundred_mil_bus[6] hundred_mil_bus[5] hundred_mil_bus[4] hundred_mil_bus[3] hundred_mil_bus[2] hundred_mil_bus[1] hundred_mil_bus[0] -autobundled
netbloc @hundred_mil_bus 1 4 5 1260 750 NJ 740 NJ 740 NJ 740 NJ
load netBundle @ten_mil_bus 32 ten_mil_bus[31] ten_mil_bus[30] ten_mil_bus[29] ten_mil_bus[28] ten_mil_bus[27] ten_mil_bus[26] ten_mil_bus[25] ten_mil_bus[24] ten_mil_bus[23] ten_mil_bus[22] ten_mil_bus[21] ten_mil_bus[20] ten_mil_bus[19] ten_mil_bus[18] ten_mil_bus[17] ten_mil_bus[16] ten_mil_bus[15] ten_mil_bus[14] ten_mil_bus[13] ten_mil_bus[12] ten_mil_bus[11] ten_mil_bus[10] ten_mil_bus[9] ten_mil_bus[8] ten_mil_bus[7] ten_mil_bus[6] ten_mil_bus[5] ten_mil_bus[4] ten_mil_bus[3] ten_mil_bus[2] ten_mil_bus[1] ten_mil_bus[0] -autobundled
netbloc @ten_mil_bus 1 4 5 1200 810 NJ 800 NJ 800 NJ 800 NJ
load netBundle @seven_seg_anode 8 seven_seg_anode[7] seven_seg_anode[6] seven_seg_anode[5] seven_seg_anode[4] seven_seg_anode[3] seven_seg_anode[2] seven_seg_anode[1] seven_seg_anode[0] -autobundled
netbloc @seven_seg_anode 1 9 1 NJ
load netBundle @hr_state_i_n_0,hr_state_i_n_1 3 hr_state_i_n_0 hr_state_i_n_1 hr_state_i_n_2 -autobundled
netbloc @hr_state_i_n_0,hr_state_i_n_1 1 5 1 1630
load netBundle @hr_state0_out 3 hr_state0_out[2] hr_state0_out[1] hr_state0_out[0] -autobundled
netbloc @hr_state0_out 1 6 1 2000
levelinfo -pg 1 0 70 300 600 960 1520 1890 2090 2290 2560 2710 -top -20 -bot 890
show
zoom 0.415537
scrollpos -52 -114
#
# initialize ictrl to current module HR_Test work:HR_Test:NOFILE
ictrl init topinfo |
ictrl layer glayer install
ictrl layer glayer config ibundle 1
ictrl layer glayer config nbundle 0
ictrl layer glayer config pbundle 0
ictrl layer glayer config cache 1
