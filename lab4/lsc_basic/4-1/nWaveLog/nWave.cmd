verdiSetActWin -win $_nWave1
wvResizeWindow -win $_nWave1 0 1 1920 1033
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/lsc_basic/4-1/Moore.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/lsc_basic/4-1/Moore.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/lsc_basic/4-1/Moore.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Moore_t"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Moore_t/clk} \
{/Moore_t/in} \
{/Moore_t/out\[1:0\]} \
{/Moore_t/rst_n} \
{/Moore_t/state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetRadix -win $_nWave1 -format Bin
wvExit
