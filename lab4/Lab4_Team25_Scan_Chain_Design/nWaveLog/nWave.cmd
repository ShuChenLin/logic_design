verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab4/Lab4_Team25_Scan_Chain_Design/test.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab4/Lab4_Team25_Scan_Chain_Design/test.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/lab4/Lab4_Team25_Scan_Chain_Design/test.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Lab4_Team21_Scan_Chain_Design_t"
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Lab4_Team21_Scan_Chain_Design_t/a\[3:0\]} \
{/Lab4_Team21_Scan_Chain_Design_t/scan_out} \
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
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvZoomAll -win $_nWave1
wvZoomAll -win $_nWave1
