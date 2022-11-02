verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/basic/Clock_Divider.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/basic/Clock_Divider.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/basic/Clock_Divider.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Clock_Divider_t"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Clock_Divider_t/clk} \
{/Clock_Divider_t/clk1_2} \
{/Clock_Divider_t/clk1_3} \
{/Clock_Divider_t/clk1_4} \
{/Clock_Divider_t/clk1_8} \
{/Clock_Divider_t/dclk} \
{/Clock_Divider_t/rst_n} \
{/Clock_Divider_t/sel\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 0 1 1440 853
wvZoomAll -win $_nWave1
wvExit
