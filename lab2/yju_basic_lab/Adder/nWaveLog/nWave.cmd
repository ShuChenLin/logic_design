wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/basic23/Adder.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/basic23/Adder.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/basic23/Adder.vcd.fsdb}
wvResizeWindow -win $_nWave1 0 1 1440 853
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Adders_t"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalClose -win $_nWave1
wvExit
