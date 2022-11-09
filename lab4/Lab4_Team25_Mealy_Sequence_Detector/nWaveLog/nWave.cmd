verdiSetActWin -win $_nWave1
wvResizeWindow -win $_nWave1 0 1 1440 853
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/Lab4_Team25_Mealy_Sequence_Detector/msd.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/Lab4_Team25_Mealy_Sequence_Detector/msd.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/Lab4_Team25_Mealy_Sequence_Detector/msd.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/mealy_t"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/mealy_t/clk} \
{/mealy_t/dec} \
{/mealy_t/in} \
{/mealy_t/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvExit
