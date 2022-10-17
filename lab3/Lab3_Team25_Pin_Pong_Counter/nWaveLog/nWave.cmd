wvResizeWindow -win $_nWave1 0 1 1440 853
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_Pin_Pong_Counter/ping_pong_counter.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_Pin_Pong_Counter/ping_pong_counter.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_Pin_Pong_Counter/ping_pong_counter.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Ping_Pong_Counter_t"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Ping_Pong_Counter_t/clk} \
{/Ping_Pong_Counter_t/direction} \
{/Ping_Pong_Counter_t/enable} \
{/Ping_Pong_Counter_t/out\[3:0\]} \
{/Ping_Pong_Counter_t/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvExit
