wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/Lab4_Team25_Content_Addressable_Memory.v/cam.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/Lab4_Team25_Content_Addressable_Memory.v/cam.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/Lab4_Team25_Content_Addressable_Memory.v/cam.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/cam_t"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/cam_t/addr\[3:0\]} \
{/cam_t/clk} \
{/cam_t/din\[7:0\]} \
{/cam_t/dout\[3:0\]} \
{/cam_t/hit} \
{/cam_t/ren} \
{/cam_t/wen} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvExit
