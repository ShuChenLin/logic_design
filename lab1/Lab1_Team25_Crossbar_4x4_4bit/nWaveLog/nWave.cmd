verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Crossbar_4x4_4bit/Crossbar_4x4.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Crossbar_4x4_4bit/Crossbar_4x4.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Crossbar_4x4_4bit/Crossbar_4x4.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Crossbar_4x4_4bit_t"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Crossbar_4x4_4bit_t/control\[4:0\]} \
{/Crossbar_4x4_4bit_t/in1\[3:0\]} \
{/Crossbar_4x4_4bit_t/in2\[3:0\]} \
{/Crossbar_4x4_4bit_t/in3\[3:0\]} \
{/Crossbar_4x4_4bit_t/in4\[3:0\]} \
{/Crossbar_4x4_4bit_t/out1\[3:0\]} \
{/Crossbar_4x4_4bit_t/out2\[3:0\]} \
{/Crossbar_4x4_4bit_t/out3\[3:0\]} \
{/Crossbar_4x4_4bit_t/out4\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvZoomAll -win $_nWave1
wvSetOptions -win $_nWave1 -denseBlock off
wvSetOptions -win $_nWave1 -denseBlock on
wvSetCursor -win $_nWave1 8056.809668 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 3427.897281 -snap {("G2" 0)}
wvSetOptions -win $_nWave1 -denseBlock off
wvSetCursor -win $_nWave1 5629.758308 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Crossbar_4x4_4bit/Crossbar_4x4.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Crossbar_4x4_4bit/Crossbar_4x4.vcd"
wvReloadFile -win $_nWave1
wvSetOptions -win $_nWave1 -denseBlock on
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Crossbar_4x4_4bit/Crossbar_4x4.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/Lab1_Team25_Crossbar_4x4_4bit/Crossbar_4x4.vcd"
wvReloadFile -win $_nWave1
wvExit
