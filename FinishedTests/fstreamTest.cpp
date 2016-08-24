#include <fstream>
#include <iostream>

using namespace std;

const char* OUTPUT_FILE = "results.txt";
bool PrintFile(char *ileName);

//require files to be read
int main(int argc, char *argv[]) {

	//check that files were passed
	if (argc < 2) {
		cout << "Error: forgot to include files."<< endl;
		return 1;
	}

	//loop through files
	for(int i=1; i<argc; i++) {
		char *fname = argv[i];
		if ( !PrintFile(fname) ) {
			cout << "unable to read " << fname << endl;
			return 2;
		}
	} 
	cout << endl;
	return 0;
}

bool PrintFile(char* fileName) {
	ifstream s;
	s.open(fileName);
	if (!s.good()) return false;
	string line;
	cout << fileName << endl;
	while (getline(s, line)) {
		cout << "\t" << line << endl;
	}	
	s.close();	
	return true;
}

