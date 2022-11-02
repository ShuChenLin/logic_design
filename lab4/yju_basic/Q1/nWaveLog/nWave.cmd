verdiSetActWin -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab4/yju_basic/Q1/q1.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062205/logic_design/lab4/yju_basic/Q1/q1.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062205/logic_design/lab4/yju_basic/Q1/q1.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/moore_machine_t"
wvResizeWindow -win $_nWave1 71 26 1848 1016
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/moore_machine_t/clk} \
{/moore_machine_t/cyc} \
{/moore_machine_t/dir} \
{/moore_machine_t/out\[1:0\]} \
{/moore_machine_t/rst_n} \
{/moore_machine_t/state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 12632.610006 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 11871.609403 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 11567.209162 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 103496.081977 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 107605.485232 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 110040.687161 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 109584.086799 -snap {("G1" 6)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvBusWaveform -win $_nWave1 -digital
wvSetCursor -win $_nWave1 118411.693791 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 85079.867390 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 98473.477999 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 104409.282700 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 38963.230862 -snap {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetCursor -win $_nWave1 9132.007233 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 32114.225437 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 42768.233876 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 51139.240506 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 78839.662447 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 18568.414708 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 15372.212176 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 12328.209765 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 26330.620856 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 22525.617842 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 38963.230862 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 46573.236890 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 59814.647378 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 67576.853526 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 26787.221218 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 39572.031344 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 47790.837854 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 20699.216395 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 23895.418927 -snap {("G1" 6)}
wvZoomAll -win $_nWave1
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 64532.851115 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 21460.216998 -snap {("G1" 3)}
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 35614.828210 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 30592.224231 -snap {("G1" 3)}
wvZoomAll -win $_nWave1
wvZoomAll -win $_nWave1
wvZoomAll -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 2 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 38)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetCursor -win $_nWave1 32875.226040 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 38506.630500 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 42159.433394 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 36984.629295 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 41550.632911 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 23134.418324 -snap {("G1" 5)}
wvZoomIn -win $_nWave1
wvZoom -win $_nWave1 75836.347197 81261.301989
wvZoomAll -win $_nWave1
wvZoom -win $_nWave1 18872.814949 24656.419530
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 20242.616034
wvSetCursor -win $_nWave1 29983.423749 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 19481.615431 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 31048.824593 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 31505.424955 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 29374.623267 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 30440.024111 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 29374.623267 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 29831.223629 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 33484.026522 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 15220.012055 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 21155.816757 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 15067.811935 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 15000.000000
wvSetCursor -win $_nWave1 180204.942737
wvExit
