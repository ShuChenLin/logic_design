verdiSetActWin -win $_nWave1
wvResizeWindow -win $_nWave1 73 26 1846 1016
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab3/Lab3_Team25_Parameterized_Ping_Pong_Counter/Parameterized_Ping_Pong_Counter.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab3/Lab3_Team25_Parameterized_Ping_Pong_Counter/Parameterized_Ping_Pong_Counter.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/lab3/Lab3_Team25_Parameterized_Ping_Pong_Counter/Parameterized_Ping_Pong_Counter.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Multi_Bank_Memory_t"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Multi_Bank_Memory_t/clk} \
{/Multi_Bank_Memory_t/cyc} \
{/Multi_Bank_Memory_t/direction} \
{/Multi_Bank_Memory_t/enable} \
{/Multi_Bank_Memory_t/flip} \
{/Multi_Bank_Memory_t/max\[3:0\]} \
{/Multi_Bank_Memory_t/min\[3:0\]} \
{/Multi_Bank_Memory_t/out\[3:0\]} \
{/Multi_Bank_Memory_t/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 1193600.302115 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 1120147.975831 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 1099624.531722 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 986205.498489 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 977564.048338 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 1400995.105740 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 1427999.637462 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 1479848.338369 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 1438801.450151 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 1565182.658610 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 1598668.277946 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 711839.456193 -snap {("G2" 0)}
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 1758535.105740
wvSetCursor -win $_nWave1 1758535.105740
wvZoom -win $_nWave1 1752054.018127 1785539.637462
wvSetCursor -win $_nWave1 1769717.429413
wvZoom -win $_nWave1 1769818.594426 1771032.574583
wvSetCursor -win $_nWave1 1769999.774545
wvZoomAll -win $_nWave1
wvExit
