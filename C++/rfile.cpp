

#include <stdio.h>
#include <iostream>
#include <string>
#include <regex>

using namespace std;

const string TAGS_SPEC = "<[^>]+>";
const int INPUT_FILE = 1;
const int MAX_CHARS_PER_LINE = 512;

int main(int argc, char *argv[]) {

	if (argc != 2) {
		cout << "Error: forgot to include files." << endl;
		return 1;
	}

	//open files to be read
	FILE* rfile;
	rfile = fopen(argv[INPUT_FILE], "r");
		if (rfile == NULL) {
			cout << "unable to open " + (string) argv[INPUT_FILE] << endl;
			return 2;
		}
		//print out contents of rfile
		char line[MAX_CHARS_PER_LINE];
		fscanf(rfile, "%s", line);
		fclose(rfile);
		cout << line;
		cout << endl;
		cout << endl;

	return 0;
}
