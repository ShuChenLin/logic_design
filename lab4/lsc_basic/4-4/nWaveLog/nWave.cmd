verdiSetActWin -win $_nWave1
wvResizeWindow -win $_nWave1 0 1 1440 854
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/lsc_basic/4-4/One_To_Many_LFSR.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/lsc_basic/4-4/One_To_Many_LFSR.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/lsc_basic/4-4/One_To_Many_LFSR.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/One_To_Many_LFSR_t"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/One_To_Many_LFSR_t/clk} \
{/One_To_Many_LFSR_t/out\[7:0\]} \
{/One_To_Many_LFSR_t/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 )} 
wvSetRadix -win $_nWave1 -format UDec
wvExit