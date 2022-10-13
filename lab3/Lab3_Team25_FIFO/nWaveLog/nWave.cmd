verdiSetActWin -win $_nWave1
wvResizeWindow -win $_nWave1 0 1 1440 853
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_FIFO/fifo.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_FIFO/fifo.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_FIFO/fifo.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/FIFO_8_t"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/FIFO_8_t/clk} \
{/FIFO_8_t/din\[7:0\]} \
{/FIFO_8_t/dout\[7:0\]} \
{/FIFO_8_t/error} \
{/FIFO_8_t/ren} \
{/FIFO_8_t/rst_n} \
{/FIFO_8_t/wen} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 24906.325060 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 34286.629303 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 44152.121697 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 44475.580464 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 44637.309848 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 54987.990392 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 104153.722978 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 25068.054444 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 34448.358687 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 45445.956765 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 54502.802242 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 64853.482786 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 74233.787030 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 84907.926341 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 94449.959968 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 104800.640512 -snap {("G1" 1)}
wvExit
