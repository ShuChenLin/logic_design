wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab3/Lab3_Team25_Parameterized_Ping_Pong_Counter/tmp.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab3/Lab3_Team25_Parameterized_Ping_Pong_Counter/tmp.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/lab3/Lab3_Team25_Parameterized_Ping_Pong_Counter/tmp.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Parameterized_Ping_Pong_Counter_t"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Parameterized_Ping_Pong_Counter_t/clk} \
{/Parameterized_Ping_Pong_Counter_t/direction} \
{/Parameterized_Ping_Pong_Counter_t/enable} \
{/Parameterized_Ping_Pong_Counter_t/flip} \
{/Parameterized_Ping_Pong_Counter_t/max\[3:0\]} \
{/Parameterized_Ping_Pong_Counter_t/min\[3:0\]} \
{/Parameterized_Ping_Pong_Counter_t/out\[3:0\]} \
{/Parameterized_Ping_Pong_Counter_t/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvZoomAll -win $_nWave1
wvExit
