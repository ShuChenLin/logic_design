verdiSetActWin -win $_nWave1
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
wvResizeWindow -win $_nWave1 0 1 1920 1033
wvZoomAll -win $_nWave1
wvExit
