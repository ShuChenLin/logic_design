verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab2/Lab2_Team25_Decode_And_Execute/decode_and_execute.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab2/Lab2_Team25_Decode_And_Execute/decode_and_execute.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/lab2/Lab2_Team25_Decode_And_Execute/decode_and_execute.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Decode_And_Execute_t"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Decode_And_Execute_t/rd\[3:0\]} \
{/Decode_And_Execute_t/rs\[3:0\]} \
{/Decode_And_Execute_t/rt\[3:0\]} \
{/Decode_And_Execute_t/sel\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetCursor -win $_nWave1 80968.740181 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 82349.602417 -snap {("G1" 4)}
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 493344.416918 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 323874.960725 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 355258.193353 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 330151.607251 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 129298.918429 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 192065.383686 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 87873.051360 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 641473.274924 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 1511416.483384 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1478777.921450 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1255329.305136 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1261605.951662 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1335670.380665 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1330649.063444 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1416011.456193 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1508905.824773 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1572927.619335 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1649502.706949 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1731099.111782 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1585480.912387 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 1560374.326284 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1634438.755287 -snap {("G1" 2)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 83818.089124 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 83818.089124 -snap {("G1" 4)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomAll -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectGroup -win $_nWave1 {G2}
wvSetCursor -win $_nWave1 46919.486405 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 33402.945619 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 20430.173716 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 12972.771903 -snap {("G2" 0)}
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvPanRight -win $_nWave1
wvExit
