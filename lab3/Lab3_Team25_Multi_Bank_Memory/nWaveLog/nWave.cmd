verdiSetActWin -win $_nWave1
wvResizeWindow -win $_nWave1 0 1 1440 854
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_Multi_Bank_Memory/Memory.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_Multi_Bank_Memory/Memory.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_Multi_Bank_Memory/Memory.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Multi_Bank_Memory_t"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Multi_Bank_Memory_t/clk} \
{/Multi_Bank_Memory_t/cyc} \
{/Multi_Bank_Memory_t/din\[7:0\]} \
{/Multi_Bank_Memory_t/dout\[7:0\]} \
{/Multi_Bank_Memory_t/raddr\[10:0\]} \
{/Multi_Bank_Memory_t/ren} \
{/Multi_Bank_Memory_t/waddr\[10:0\]} \
{/Multi_Bank_Memory_t/wen} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 44782.866293 -snap {("G1" 4)}
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvExit