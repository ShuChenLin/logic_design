verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Toggle_Flip_Flop/Tff.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Toggle_Flip_Flop/Tff.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Toggle_Flip_Flop/Tff.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Toggle_Flip_Flop_t"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Toggle_Flip_Flop_t/clk} \
{/Toggle_Flip_Flop_t/q} \
{/Toggle_Flip_Flop_t/rst_n} \
{/Toggle_Flip_Flop_t/t} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvZoomAll -win $_nWave1
