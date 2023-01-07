#include <bits/stdc++.h>
using namespace std;

signed main () {
    ifstream In;
    ofstream Out;
    In.open("ohters.bin");
    Out.open("others.txt");
    string a;
    int cnt = 0;
    while (In >> a) {
        Out << "assign otherletter[" << cnt << "] = 12'b" << a << ";\n";
        cnt++;
    }
    return 0;
}
