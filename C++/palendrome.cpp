#include <stdio.h>
#include <string>
#include <iostream>

using namespace std;

bool isStrictPal(string S, int start, int end);
string nicePrint(bool isPal);

int main() {

	string S = "111@@x@@111";
	cout << "String " << S << nicePrint(isStrictPal(S, 0, S.length() - 1))
			<< endl;
	return 0;
}

string nicePrint(bool isPal) {
	return isPal ? " is a palendrome." : " is not a palendrome.";
}

bool isStrictPal(string S, int start, int end) {
	//at or passed center
	if (start > end) {
		return 1;
	}

	return S[start] == S[end] ? isStrictPal(S, ++start, --end) : 0;
}
