verdiSetActWin -win $_nWave1
wvResizeWindow -win $_nWave1 1440 1 1920 1033
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/RCA/rca.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/RCA/rca.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/RCA/rca.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/ripple_carry_adder_t"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/ripple_carry_adder_t/a\[7:0\]} \
{/ripple_carry_adder_t/b\[7:0\]} \
{/ripple_carry_adder_t/cin} \
{/ripple_carry_adder_t/cout} \
{/ripple_carry_adder_t/sum\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 4264762.152111 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 6485194.870445 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 67192899.885271 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 69443959.261789 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 69489899.249065 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 72085508.530152 -snap {("G1" 5)}
wvExit
