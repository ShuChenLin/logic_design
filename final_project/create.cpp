#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

int main () {
    ios_base::sync_with_stdio(0); cin.tie(0);
    string a;
    getline(cin, a);
    for (ll i = 0; i < a.size(); ++i) {
        cout << "assign adr[" << i << "] = ";
        if (a[i] == ' ') cout << 26 << "\n";
        else if (a[i] == ',') cout << 27 << "\n";
        else if (a[i] == '.') cout << 28 << "\n";
        else if (a[i] == '?') cout << 29 << "\n";
        else if (a[i] == '!') cout << 30 << "\n";
        else if (a[i] == '\'') cout << 31 << "\n";
        else if (a[i] == '\"') cout << 32 << "\n";
        else if (a[i] >= 'a' && a[i] <= 'z') cout << a[i] - 'a' << "\n";
        else cout << a[i] - 'A' + 33 << "\n";
    }
    return 0;
}
