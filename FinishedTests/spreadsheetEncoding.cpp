/*
	Based on 7.3 (page 94) of 
	Elements of Programming Interviews by Aziz,Lee,Prakash
	
	$ g++ -std=c++11 SpreadsheetEnchoding.cpp -o Encode
*/
#include <string>
#include <stdio.h>

using namespace std;

int SSDcodeColID(string col);
int mySSD(string s, bool leadzero);
void dataPrint(string s, int i);

int main () {

	string A = "A";
	string Z = "Z";
	string AA = "AA";
	string ZZ = "ZZ";
	string a = "a";

	printf("Using SSDcodeColID\n");
	dataPrint(A, SSDcodeColID(A));
	dataPrint(Z, SSDcodeColID(Z));
	dataPrint(AA, SSDcodeColID(AA));
	dataPrint(ZZ, SSDcodeColID(ZZ));
	dataPrint(ZZ, SSDcodeColID("AZZA"));
	
	printf("Using mySSD\n");
	dataPrint(A, mySSD(A,1));
	dataPrint(Z, mySSD(Z,1));
	dataPrint(AA, mySSD(AA,1));
	dataPrint(ZZ, mySSD(ZZ,1));
	dataPrint(ZZ, mySSD("AZZA",1));	
	
return 0;
}

int SSDcodeColID(string col) {
	int ret = 0;
	for (char c: col) {
		ret = ret * 26 + c - 'A' + 1;
	}
	return ret;
}

// 'A' == 0 ? leadzero=0 : leadzero =1;
int mySSD(string s, bool leadzero) {
	int result = 0;
	for(int i=0; i<s.length(); i++) {
		result = result * 26 + s[i] - 'A' + 1;
	}	
	//return (leadzero == 0 ? result : result-1);
	return result-leadzero;
}

void dataPrint(string s, int i) {
	printf("string %s is %d\n", s.c_str(), i);
}
