verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_Team25_Carry_Look_Ahead_Adder_8bit/Decode_And_Execute.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_Team25_Carry_Look_Ahead_Adder_8bit/Decode_And_Execute.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_Team25_Carry_Look_Ahead_Adder_8bit/Decode_And_Execute.vcd.fsdb}
wvResizeWindow -win $_nWave1 1440 1 1920 1033
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Decode_And_Exectue_t"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Decode_And_Exectue_t/a\[7:0\]} \
{/Decode_And_Exectue_t/b\[7:0\]} \
{/Decode_And_Exectue_t/c0} \
{/Decode_And_Exectue_t/c8} \
{/Decode_And_Exectue_t/s\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 17553624.287360 -snap {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 894452.192986 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 1229871.765356 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 1770269.965286 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 2739259.841021 -snap {("G1" 5)}
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 32218922.467031 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 32219013.455414 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 32219959.734589 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 31697014.458243 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 31695012.713833 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 31693065.562453 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 3872000.329614 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 6724985.646262 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 55418073.967548 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 54483620.040009 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 54274958.032306 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 54275049.020688 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 54274375.706659 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 54271027.334192 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 54270645.182986 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 54267096.636078 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 54266350.531344 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 54263475.298464 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 54264931.112580 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 54266077.566197 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 63782678.879602 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 63782424.112132 -snap {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetRadix -win $_nWave1 -format Bin
wvExit
