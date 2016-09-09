/*
 * Takes a .mBox file and pulls select information
 */

#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

#include "AucParser.h"

using namespace std;

//Constants: '<' must have a matching '>'
string const C_TYPE = "Content-Type: text/plain;";
string const C_TRANS = "Content-Transfer-Encoding:";
string const REMOVAL = "<p><b>REMOVAL:";
string const LOCATION = "<p><b>LOCATION:";
string const ITEM = "<td align=3D\"center\">123456</td>";
string const END_OF_INV = "</html>";
//Globals
int lineCount = 0;
int matchCount = 0;
//Prototypes
string get_Single(ifstream& s, const string& first);
string get_Single(ifstream& s, const string& first, const string& exclude);
bool get_Pair(ifstream& s, const string first, const string second);
void get_Item_Info(ifstream& s);

string cleanString(string s, int i);
string cleanString(string s);
string nextInfo(ifstream& s, const string& one);


int main(int argc, char *argv[]) {
	/*
	 * Test storing a date
	 */
/*	AucParser* a = new AucParser();
	a->AddDate(11, "June", 11, AucParser::am, 4, AucParser::pm, AucParser::Phillipi);

	//store time
	AucParser::A_Time time;
	time.sHour = 11; time.sP = AucParser::am;
	time.eHour = 12; time.eP = AucParser::pm;
	//store date
	AucParser::A_Date date;
	date.day = 10;
	date.month = "june";
	//store date
	a->AddDate(time, date, AucParser::Westerville);

	string info = a->getstrDate();
	cout << info << endl << endl;
	info = a->getstrDate();
	cout << info << endl;

*/

	/*
	 * Moving on to processing .mBox file
	 */
	ifstream s;
	s.open(argv[1]);

	if (!s.good()) {
		cout << "unable to open " << argv[1] << endl;
		return 1;
	}
	//TODO: put back !
	while (!s.eof()) {
		//advance s to next email
		get_Pair(s, C_TYPE, C_TRANS);
		//find removal information
		cout << nextInfo(s, REMOVAL) << endl;
		//find location information
		cout << nextInfo(s, LOCATION) << endl;
		//pull items
		string item;
		do {
			item = get_Single(s, ITEM, END_OF_INV);

			//item found
			if (item != "") {
				get_Item_Info(s);
			} else {
				cout << "===========";
			}
		} while (item != "");
		cout << endl;
	}

	cout << matchCount << endl;
	cout << lineCount << endl;
	s.close();
}

/* removes leading html tags */
string cleanString(string s, int i) {
	if (s.at(i) == '<') {
		//go until closing brace
		do {
			i++;
		} while(s.at(i) != '>');
		return cleanString(s.substr(i+1, s.length()), 0);
	}
	//skip past all characters
	int j = i;
	do {
		i++;
	} while (i < s.length() && isalnum(s.at(i)));
	return s.substr(j, i);
}

string nextInfo(ifstream& s, const string& one) {
		string words = get_Single(s,one);
		return cleanString(words, one.length()+1);
	}

namespace exp {
/*
 * Takes an already open ifstream getting a new line
 * while keeping track of how many total lines have been read.
 */
void getline(ifstream& s, string& line) {
	using std::getline;
	getline(s, line);
	lineCount++;
}
}

/*
 * Advances s to the next line after first
 * @return string where first was found
 */
string get_Single(ifstream& s, const string& first) {
	string line;
	do {
		exp::getline(s, line);
	} while (line.substr(0, first.length()) != first && !s.eof());

	if (s.eof()) {
		lineCount--;
		return "";
	}
	return line;
}

/*
 * Advances s to the next line after first until exclude
 * @return string where first was found up until exclude is found
 * @return string empty when exclude reached
 */
string get_Single(ifstream& s, const string& first, const string& exclude) {

	string line, firstFront, excludeFront;
	do {
		exp::getline(s, line);
		firstFront = line.substr(0, first.length());
		excludeFront = line.substr(0, exclude.length());
	} while (firstFront != first && excludeFront != exclude && !s.eof());

	if (s.eof()) {
		lineCount--;
		return "";
	}
	if (excludeFront == exclude) {
		return "";
	}
	//firstFront == first && excludeFront != exclude && !s.eof()
	return line;
}

/*
 *  Advances s to the next line after a pair of lines.
 *  If no pair is found s.eof() == true;
 *  @return bool pair of lines found
 */
bool get_Pair(ifstream& s, const string first, const string second) {
	string line;
	//find first
	get_Single(s, first);
	if (s.eof()) {
		return false;
	}
	//pull the second line
	exp::getline(s, line);
	if (line.substr(0, second.length()) == second) {
		matchCount++;
		return true;
	} else {
		return false;
	}
}

/*
 * Simply prints all item info found
 * TODO: print to proper file instead.
 */
void get_Item_Info(ifstream& s) {
	string id, quant, brand, desc;
	exp::getline(s, id);
	cout << cleanString(id, 0) << endl;
	exp::getline(s, quant);
	cout << cleanString(quant, 0) << endl;
	exp::getline(s, brand);
	cout << cleanString(brand, 0) << endl;
	exp::getline(s, desc);
	cout << cleanString(desc, 0) << endl;
	cout << "-----------" << endl;
}
