verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab5/Lab5_Team25_Greatest_Common_Divisor/Greatest_Common_Divisor.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab5/Lab5_Team25_Greatest_Common_Divisor/Greatest_Common_Divisor.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/lab5/Lab5_Team25_Greatest_Common_Divisor/Greatest_Common_Divisor.vcd.fsdb}
wvResizeWindow -win $_nWave1 -2 0 1920 999
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/q1_t"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/q1_t/a\[15:0\]} \
{/q1_t/b\[15:0\]} \
{/q1_t/clk} \
{/q1_t/cyc} \
{/q1_t/done} \
{/q1_t/gcd\[15:0\]} \
{/q1_t/rst_n} \
{/q1_t/start} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvZoomAll -win $_nWave1
wvZoomIn -win $_nWave1