/*
 * Takes a .mBox file and pulls select information
 */

#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

#include "AucFileParser.h"

using namespace std;

//Constants: '<' must have a matching '>'
string const C_TYPE = "Content-Type: text/plain;";
string const C_TRANS = "Content-Transfer-Encoding:";
string const REMOVAL = "<p><b>REMOVAL:";
string const LOCATION = "<p><b>LOCATION:";
string const ITEM = "<td align=3D\"center\">123456</td>";
string const END_OF_INV = "</html>";
string const NO_MATCH = "";
int const INPUT_FILE = 1;
//Globals
int lineCount = 0;
int mailCount = 0;
//Prototypes
void get_Item_Info(AucFileParser& par);

int main(int argc, char *argv[]) {

	AucFileParser par = AucFileParser(argv[INPUT_FILE]);

	while (par.isOkay()) {
		bool hasMail = par.getPair(C_TYPE, C_TRANS);
		if (hasMail) {
			cout << par.findLine(REMOVAL);
			cout << par.findLine(LOCATION);
			while( par.findLineBefore(ITEM, END_OF_INV) != par.NO_MATCH) {
				get_Item_Info(par);
			}
			cout << "===========" << endl;
		}

	}
	string line;
	par.getLine(line);
	cout << line;
	cout << par.findLine(REMOVAL);


/*

	cout << mailCount << endl;
	cout << lineCount << endl;
	s.close(); */
}

/*
 * Simply prints all item info found
 * TODO: print to proper file instead.
 */
void get_Item_Info(AucFileParser& par) {
	string id, quant, brand, desc;
	par.getLine(id);
	cout << id;
	par.getLine(quant);
	cout << quant;
	par.getLine(brand);
	cout << brand;
	par.getLine(desc);
	cout << desc;
	cout << "-----------" << endl;
}
