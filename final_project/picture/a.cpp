#include <bits/stdc++.h>
using namespace std;

signed main () {
    ifstream In;
    ofstream Out;
    In.open("CPM.bin");
    Out.open("CPM.txt");
    string a;
    int cnt = 0;
    while (In >> a) {
        Out << "assign CPM[" << cnt << "] = 12'b" << a << ";\n";
        cnt++;
    }
    return 0;
}
