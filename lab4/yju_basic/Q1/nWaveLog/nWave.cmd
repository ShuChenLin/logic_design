verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab4/yju_basic/Q1/q1.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab4/yju_basic/Q1/q1.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/lab4/yju_basic/Q1/q1.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/moore_machine_t"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/moore_machine_t/clk} \
{/moore_machine_t/cyc} \
{/moore_machine_t/dir} \
{/moore_machine_t/out\[1:0\]} \
{/moore_machine_t/rst_n} \
{/moore_machine_t/state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvZoomAll -win $_nWave1
