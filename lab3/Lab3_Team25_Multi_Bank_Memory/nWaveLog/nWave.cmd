verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_Multi_Bank_Memory/multi_memory.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_Multi_Bank_Memory/multi_memory.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab3/Lab3_Team25_Multi_Bank_Memory/multi_memory.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Multi_Bank_Memory_t"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Multi_Bank_Memory_t/clk} \
{/Multi_Bank_Memory_t/din\[7:0\]} \
{/Multi_Bank_Memory_t/dout\[7:0\]} \
{/Multi_Bank_Memory_t/raddr\[10:0\]} \
{/Multi_Bank_Memory_t/ren} \
{/Multi_Bank_Memory_t/waddr\[10:0\]} \
{/Multi_Bank_Memory_t/wen} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetRadix -win $_nWave1 -format UDec
wvExit
