verdiSetActWin -win $_nWave1
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
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 1498753.108027 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1495014.423657 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1504094.085697 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1514776.041038 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 216843.693422 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 337549.788775 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1655777.851539 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1660317.682559 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1665124.562462 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1669664.393482 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1665391.611346 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1674471.273386 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1666459.806880 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1675005.371153 -snap {("G1" 1)}
wvExit
