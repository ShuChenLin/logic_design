wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab4/yju_basic/Q2/q2.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab4/yju_basic/Q2/q2.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/lab4/yju_basic/Q2/q2.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/mealy_machine_t"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/mealy_machine_t/clk} \
{/mealy_machine_t/cyc} \
{/mealy_machine_t/in} \
{/mealy_machine_t/out} \
{/mealy_machine_t/rst_n} \
{/mealy_machine_t/state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 34632.930514 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 53551.359517 -snap {("G1" 4)}
