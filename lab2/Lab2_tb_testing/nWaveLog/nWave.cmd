wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_tb_testing/test.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_tb_testing/test.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/Lab2_tb_testing/test.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Exhausted_Testing"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Exhausted_Testing/a\[3:0\]} \
{/Exhausted_Testing/b\[3:0\]} \
{/Exhausted_Testing/cin} \
{/Exhausted_Testing/cout} \
{/Exhausted_Testing/done} \
{/Exhausted_Testing/error} \
{/Exhausted_Testing/sum\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvExit
