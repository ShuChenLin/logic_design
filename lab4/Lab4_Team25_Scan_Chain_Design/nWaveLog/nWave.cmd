verdiSetActWin -win $_nWave1
wvResizeWindow -win $_nWave1 0 1 1440 854
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/Lab4_Team25_Scan_Chain_Design/Scan_Chain_Design.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/Lab4_Team25_Scan_Chain_Design/Scan_Chain_Design.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab4/Lab4_Team25_Scan_Chain_Design/Scan_Chain_Design.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Scan_Chain_Design_t"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Scan_Chain_Design_t/clk} \
{/Scan_Chain_Design_t/rst_n} \
{/Scan_Chain_Design_t/scan_en} \
{/Scan_Chain_Design_t/scan_in} \
{/Scan_Chain_Design_t/scan_out} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvExit
