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
wvSetCursor -win $_nWave1 35370.216173 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 44758.606886 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 56330.344275 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 66592.073659 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 75543.795036 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 84932.185749 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 94538.911129 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 105018.975180 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 115062.369896 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 130127.461970 -snap {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetRadix -win $_nWave1 -format UDec
