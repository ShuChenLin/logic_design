verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab2/Lab2_Team25_Carry_Look_Ahead_Adder_8bit/cla.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab2/Lab2_Team25_Carry_Look_Ahead_Adder_8bit/cla.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/lab2/Lab2_Team25_Carry_Look_Ahead_Adder_8bit/cla.vcd.fsdb}
wvZoom -win $_nWave1 1439823.045317 2007753.246526
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Decode_And_Exectue_t"
wvExit
