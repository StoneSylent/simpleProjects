#include <iostream>
using namespace std;

int main() {
	cout << "First name? ";
	string name;
	getline(cin, name);
	cout << "Hello " << name << endl;
	return 0;
}
