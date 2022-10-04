verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab2/Lab2_Ripple_Carry_Adder/Ripple_Carry_Adder.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab2/Lab2_Ripple_Carry_Adder/Ripple_Carry_Adder.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/lab2/Lab2_Ripple_Carry_Adder/Ripple_Carry_Adder.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Ripple_Carry_Adder_t"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Ripple_Carry_Adder_t/a\[7:0\]} \
{/Ripple_Carry_Adder_t/b\[7:0\]} \
{/Ripple_Carry_Adder_t/cin} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetCursor -win $_nWave1 3930766.153289 -snap {("G2" 0)}
wvSelectGroup -win $_nWave1 {G2}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetCursor -win $_nWave1 1621840.506337
wvSetCursor -win $_nWave1 1941414.990344
wvSetCursor -win $_nWave1 1645808.592637 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1174436.228727 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1525968.161135 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 2772308.648763 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 2101202.232348 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 862851.106820 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 766978.761617 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 303595.759807 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 623170.243814 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 838883.020519 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 782957.485818 -snap {("G1" 2)}
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 17257022.136391 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 28601916.318648 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 18215745.588413 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 20612554.218467 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 21731064.912492 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 32596597.368739 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 33315639.957755 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 36351597.555824 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 38348938.080869 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 40026704.121907 -snap {("G1" 3)}
wvZoom -win $_nWave1 39866916.879903 40506065.847918
wvSetCursor -win $_nWave1 40052065.645529 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 40043579.660438 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 40018893.158354 -snap {("G2" 0)}
