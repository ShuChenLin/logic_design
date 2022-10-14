verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_Round_Robin_FIFO_Aribiter/round_robin_fifo_arbiter.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_Round_Robin_FIFO_Aribiter/round_robin_fifo_arbiter.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_Round_Robin_FIFO_Aribiter/round_robin_fifo_arbiter.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Round_Robin_FIFO_Arbiter_t"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Round_Robin_FIFO_Arbiter_t/a\[7:0\]} \
{/Round_Robin_FIFO_Arbiter_t/b\[7:0\]} \
{/Round_Robin_FIFO_Arbiter_t/c\[7:0\]} \
{/Round_Robin_FIFO_Arbiter_t/clk} \
{/Round_Robin_FIFO_Arbiter_t/cyc} \
{/Round_Robin_FIFO_Arbiter_t/d\[7:0\]} \
{/Round_Robin_FIFO_Arbiter_t/dout\[7:0\]} \
{/Round_Robin_FIFO_Arbiter_t/rst_n} \
{/Round_Robin_FIFO_Arbiter_t/valid} \
{/Round_Robin_FIFO_Arbiter_t/wen\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 0 1 1920 1033
wvZoomAll -win $_nWave1
wvExit
