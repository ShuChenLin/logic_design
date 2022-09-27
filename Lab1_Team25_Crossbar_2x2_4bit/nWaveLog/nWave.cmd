verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Crossbar_2x2_4bit/Crossbar_2x2.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Crossbar_2x2_4bit/Crossbar_2x2.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Crossbar_2x2_4bit/Crossbar_2x2.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Crossbar_2x2_4bit_t"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Crossbar_2x2_4bit_t/control} \
{/Crossbar_2x2_4bit_t/in1\[3:0\]} \
{/Crossbar_2x2_4bit_t/in2\[3:0\]} \
{/Crossbar_2x2_4bit_t/out1\[3:0\]} \
{/Crossbar_2x2_4bit_t/out2\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Crossbar_2x2_4bit_t/control} \
{/Crossbar_2x2_4bit_t/in1\[3:0\]} \
{/Crossbar_2x2_4bit_t/in2\[3:0\]} \
{/Crossbar_2x2_4bit_t/out1\[3:0\]} \
{/Crossbar_2x2_4bit_t/out2\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Crossbar_2x2_4bit_t/control} \
{/Crossbar_2x2_4bit_t/in1\[3:0\]} \
{/Crossbar_2x2_4bit_t/in2\[3:0\]} \
{/Crossbar_2x2_4bit_t/out1\[3:0\]} \
{/Crossbar_2x2_4bit_t/out2\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 2526.525680 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 5821.993958 -snap {("G2" 0)}
wvExit
