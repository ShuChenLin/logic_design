wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/Lab4_Team25_Scan_Chain_Design/test.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/Lab4_Team25_Scan_Chain_Design/test.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/Lab4_Team25_Scan_Chain_Design/test.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Lab4_Team21_Scan_Chain_Design_t"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Lab4_Team21_Scan_Chain_Design_t/a\[3:0\]} \
{/Lab4_Team21_Scan_Chain_Design_t/b\[3:0\]} \
{/Lab4_Team21_Scan_Chain_Design_t/clk} \
{/Lab4_Team21_Scan_Chain_Design_t/rst_n} \
{/Lab4_Team21_Scan_Chain_Design_t/scan_en} \
{/Lab4_Team21_Scan_Chain_Design_t/scan_in} \
{/Lab4_Team21_Scan_Chain_Design_t/scan_out} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 0 1 1440 854
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 169007.205765 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 191649.319456 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 173050.440352 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 185180.144115 -snap {("G1" 3)}
wvExit
