verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab2/Lab2_Ripple_Carry_Adder/Ripple_Carry_Adder.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab2/Lab2_Ripple_Carry_Adder/Ripple_Carry_Adder.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/lab2/Lab2_Ripple_Carry_Adder/Ripple_Carry_Adder.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Ripple_Carry_Adder_t"
