verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab5/Lab5_Team25_Booth_Multiplier_4bit/Booth_Multiplier.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab5/Lab5_Team25_Booth_Multiplier_4bit/Booth_Multiplier.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/lab5/Lab5_Team25_Booth_Multiplier_4bit/Booth_Multiplier.vcd.fsdb}
wvSetCursor -win $_nWave1 45339.595142
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/q1_t"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/q1_t/a\[3:0\]} \
{/q1_t/b\[3:0\]} \
{/q1_t/clk} \
{/q1_t/cyc} \
{/q1_t/done} \
{/q1_t/p\[7:0\]} \
{/q1_t/rst_n} \
{/q1_t/start} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 220809.716599 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 286842.336611 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 284318.796992 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 275906.998265 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 285159.976865 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 292730.595720 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 277589.358010 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 275906.998265 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 134168.189705 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 124494.621168 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 428160.555234 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 431104.684789 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 423113.475998 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 423113.475998 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 420169.346443 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 358763.215732 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 355819.086177 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 358763.215732 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 347827.877386 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 356239.676113 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 411757.547715 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 417645.806825 -snap {("G1" 4)}
