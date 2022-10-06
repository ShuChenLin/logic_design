wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Majority/Majority.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Majority/Majority.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Majority/Majority.vcd.fsdb}
wvSetCursor -win $_nWave1 811.746077
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Majority_t"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Majority_t/a} \
{/Majority_t/b} \
{/Majority_t/c} \
{/Majority_t/out} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvResizeWindow -win $_nWave1 232 0 1440 853
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Majority_t/a} \
{/Majority_t/b} \
{/Majority_t/c} \
{/Majority_t/out} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Adder/Adder.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Adder/Adder.vcd"
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Adder/Adder.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Adders_t"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Majority/Majority.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/Majority_t/a} \
{/Majority_t/b} \
{/Majority_t/c} \
{/Majority_t/out} \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Adder/Adder.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/Adders_t/a} \
{/Adders_t/b} \
{/Adders_t/cin} \
{/Adders_t/fa_cout} \
{/Adders_t/fa_sum} \
{/Adders_t/ha_cout} \
{/Adders_t/ha_sum} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 6 7 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Majority/Majority.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/Majority_t/a} \
{/Majority_t/b} \
{/Majority_t/c} \
{/Majority_t/out} \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Adder/Adder.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/Adders_t/a} \
{/Adders_t/b} \
{/Adders_t/cin} \
{/Adders_t/fa_cout} \
{/Adders_t/fa_sum} \
{/Adders_t/ha_cout} \
{/Adders_t/ha_sum} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 6 7 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/NAND/NAND_Implement.vcd.fsdb" \
           "/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/NAND/NAND_Implement.vcd"
wvOpenFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/NAND/NAND_Implement.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/NADN_Implement_t"
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Majority/Majority.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/Majority_t/a} \
{/Majority_t/b} \
{/Majority_t/c} \
{/Majority_t/out} \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Adder/Adder.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/Adders_t/a} \
{/Adders_t/b} \
{/Adders_t/cin} \
{/Adders_t/fa_cout} \
{/Adders_t/fa_sum} \
{/Adders_t/ha_cout} \
{/Adders_t/ha_sum} \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/NAND/NAND_Implement.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/NADN_Implement_t/a} \
{/NADN_Implement_t/b} \
{/NADN_Implement_t/out} \
{/NADN_Implement_t/sel\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Majority/Majority.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/Majority_t/a} \
{/Majority_t/b} \
{/Majority_t/c} \
{/Majority_t/out} \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/Adder/Adder.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/Adders_t/a} \
{/Adders_t/b} \
{/Adders_t/cin} \
{/Adders_t/fa_cout} \
{/Adders_t/fa_sum} \
{/Adders_t/ha_cout} \
{/Adders_t/ha_sum} \
}
wvSetActiveFile -win $_nWave1 \
           {/users/course/2022F/LDL17700000/u110062208/logic_design/lab2/yju_basic_lab/NAND/NAND_Implement.vcd.fsdb}
wvAddSignal -win $_nWave1 -group {"G1" {/NADN_Implement_t/a} \
{/NADN_Implement_t/b} \
{/NADN_Implement_t/out} \
{/NADN_Implement_t/sel\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvZoom -win $_nWave1 0.000000 800.560448
wvZoomAll -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetCursor -win $_nWave1 14303.346677 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 14703.626902 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 13823.010408 -snap {("G2" 0)}
wvExit
