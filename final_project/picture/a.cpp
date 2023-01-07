#include <bits/stdc++.h>
using namespace std;

signed main () {
    ifstream In;
    ofstream Out;
    In.open("Upper_black.bin");
    Out.open("Upper_black.txt");
    string a;
    int cnt = 0;
    while (In >> a) {
        Out << "assign Upperletter[" << cnt << "] = 12'b" << a << ";\n";
        cnt++;
    }
    return 0;
}
