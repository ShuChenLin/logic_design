#include <iostream>
using namespace std;
typedef long long ll;

char a = 'A';

signed main () {
    for (ll i = 0; i < 26; ++i) {
        char tmp = a + i;
        cout << "parameter KEY_" << tmp << " = \n";
    }
}
