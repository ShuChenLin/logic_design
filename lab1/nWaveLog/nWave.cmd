verdiSetActWin -win $_nWave1
wvResizeWindow -win $_nWave1 73 26 1846 1016
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Dmux_1x4_4bit/DMUX.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Dmux_1x4_4bit/DMUX.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Dmux_1x4_4bit/DMUX.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Dmux_1x4_4bit_t"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Dmux_1x4_4bit_t/a\[3:0\]} \
{/Dmux_1x4_4bit_t/b\[3:0\]} \
{/Dmux_1x4_4bit_t/c\[3:0\]} \
{/Dmux_1x4_4bit_t/d\[3:0\]} \
{/Dmux_1x4_4bit_t/in\[3:0\]} \
{/Dmux_1x4_4bit_t/sel\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Dmux_1x4_4bit_t/a\[3:0\]} \
{/Dmux_1x4_4bit_t/b\[3:0\]} \
{/Dmux_1x4_4bit_t/c\[3:0\]} \
{/Dmux_1x4_4bit_t/d\[3:0\]} \
{/Dmux_1x4_4bit_t/in\[3:0\]} \
{/Dmux_1x4_4bit_t/sel\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 4778.429003 -snap {("G2" 0)}
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Toggle_Flip_Flop/Tff.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Toggle_Flip_Flop/Tff.vcd"
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Toggle_Flip_Flop/Tff.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Toggle_Flip_Flop_t"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Dmux_1x4_4bit/DMUX.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/Dmux_1x4_4bit_t/a\[3:0\]} \
{/Dmux_1x4_4bit_t/b\[3:0\]} \
{/Dmux_1x4_4bit_t/c\[3:0\]} \
{/Dmux_1x4_4bit_t/d\[3:0\]} \
{/Dmux_1x4_4bit_t/in\[3:0\]} \
{/Dmux_1x4_4bit_t/sel\[1:0\]} \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Toggle_Flip_Flop/Tff.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/Toggle_Flip_Flop_t/clk} \
{/Toggle_Flip_Flop_t/q} \
{/Toggle_Flip_Flop_t/rst_n} \
{/Toggle_Flip_Flop_t/t} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvExit
