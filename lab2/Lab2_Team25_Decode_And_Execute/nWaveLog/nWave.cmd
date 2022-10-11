verdiSetActWin -win $_nWave1
wvResizeWindow -win $_nWave1 1440 1 1920 1033
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_Team25_Decode_And_Execute/Decode_And_Execute.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_Team25_Decode_And_Execute/Decode_And_Execute.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_Team25_Decode_And_Execute/Decode_And_Execute.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Decode_And_Exectue_t"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Decode_And_Exectue_t/rd\[3:0\]} \
{/Decode_And_Exectue_t/rs\[3:0\]} \
{/Decode_And_Exectue_t/rt\[3:0\]} \
{/Decode_And_Exectue_t/sel\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 119737.478003 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 8976.966455 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 9665.200549 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 13345.756796 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 16966.466599 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 18043.702574 -snap {("G1" 3)}
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_Team25_Decode_And_Execute/decode_and_execute.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_Team25_Decode_And_Execute/decode_and_execute.vcd"
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_Team25_Decode_And_Execute/decode_and_execute.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Decode_And_Exectue_t"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_Team25_Decode_And_Execute/Decode_And_Execute.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/Decode_And_Exectue_t/rd\[3:0\]} \
{/Decode_And_Exectue_t/rs\[3:0\]} \
{/Decode_And_Exectue_t/rt\[3:0\]} \
{/Decode_And_Exectue_t/sel\[2:0\]} \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_Team25_Decode_And_Execute/decode_and_execute.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/Decode_And_Exectue_t/rd\[3:0\]} \
{/Decode_And_Exectue_t/rs\[3:0\]} \
{/Decode_And_Exectue_t/rt\[3:0\]} \
{/Decode_And_Exectue_t/sel\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 26242.665269 -snap {("G1" 7)}
wvExit
