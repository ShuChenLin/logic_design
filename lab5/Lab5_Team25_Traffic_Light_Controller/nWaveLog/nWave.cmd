verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab5/Lab5_Team25_Traffic_Light_Controller/Traffic.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab5/Lab5_Team25_Traffic_Light_Controller/Traffic.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab5/Lab5_Team25_Traffic_Light_Controller/Traffic.vcd.fsdb}
wvResizeWindow -win $_nWave1 0 1 1440 853
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/q2_t"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/q2_t/clk} \
{/q2_t/hw_light\[2:0\]} \
{/q2_t/lr_has_car} \
{/q2_t/lr_light\[2:0\]} \
{/q2_t/rst_n} \
{/q2_t/state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetRadix -win $_nWave1 -format Bin
wvExit
