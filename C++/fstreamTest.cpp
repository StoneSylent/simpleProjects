#include <fstream>
#include <iostream>

using namespace std;

const char* OUTPUT_FILE = "results.txt";
bool error;

bool PrintFile(char *ileName);
bool R_Error(const bool b, string s);

//require files to be read
int main(int argc, char *argv[]) {

	//check that files were passed
	error = R_Error(argc < 2, "No files were passed.");
	if (error)
		return 1;

	//loop through files
	for (int i = 1; i < argc; i++) {
		char *fname = argv[i];
		error = R_Error(!PrintFile(fname), "unable to read" + (string) fname);
		if (error)
			return 2;

	}
	cout << endl;
	return 0;
}

bool PrintFile(char* fileName) {
	ifstream s;
	s.open(fileName);
	if (!s.good())
		return false;
	string line;
	cout << fileName << endl;
	while (getline(s, line)) {
		cout << "\t" << line << endl;
	}
	s.close();
	return true;
}

/**
 * 	Handles printing of errors
 *
 *	@param b bool if param s should be printed
 *	@param s string the error to print
 *	@return b bool if error was printed
 */
bool R_Error(bool b, string s) {
	if (b)
		cout << s << endl;
	return b;
}
