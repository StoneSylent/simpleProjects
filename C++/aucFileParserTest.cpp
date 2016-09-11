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
string const NO_MATCH = "";
int const INPUT_FILE = 1;
//Globals
int lineCount = 0;
int mailCount = 0;
//Prototypes
string findLine(ifstream& s, const string& target);
string findLineBefore(ifstream& s, const string& target, const string& exclude);

bool get_Pair(ifstream& s, const string targetA, const string targetB);
void get_Item_Info(ifstream& s);
bool isLeadSub(const string line, const string sub);

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
	char* file = argv[INPUT_FILE];
	ifstream s;
	s.open(file);

	if (!s.good()) {
		cout << "unable to open " << file << endl;
		s.close();
		return 1;
	}

	//Go through file for content
	while (!s.eof()) {
		//advance s to next email
		bool hasMail = get_Pair(s, C_TYPE, C_TRANS);
		if (hasMail) {
			//find removal information
			cout << findLine(s, REMOVAL);
			//find location information
			cout << findLine(s, LOCATION);
			//pull items
			while (findLineBefore(s, ITEM, END_OF_INV) != NO_MATCH) {
				//next item found
				get_Item_Info(s);
			}
			cout << "===========" << endl;
		}
	}

	cout << mailCount << endl;
	cout << lineCount << endl;
	s.close();
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

bool isLeadSub(const string line, const string sub) {

	if (sub.length() > line.length()) {
		return false;
	}
	return (line.substr(0, sub.length()) == sub);
}

/*
 * Advances s to the next line after first
 * @return string where first was found
 */
string findLine(ifstream& s, const string& target) {
	string line;
	bool match = false;
	while (!match && !s.eof()) {
		exp::getline(s, line);
		match = isLeadSub(line, target);
	}

	if (s.eof()) {
		lineCount--;
		return NO_MATCH;
	}
	return line;
}

/*
 * Advances s to the next line after first until exclude
 * @return string where first was found up until exclude is found
 * @return string empty when exclude reached
 */
string findLineBefore(ifstream& s, const string& target,
		const string& exclude) {

	string line, firstFront, excludeFront;
	do {
		exp::getline(s, line);
		firstFront = line.substr(0, target.length());
		excludeFront = line.substr(0, exclude.length());
	} while (firstFront != target && excludeFront != exclude && !s.eof());

	if (s.eof()) {
		lineCount--;
		return NO_MATCH;
	}
	if (excludeFront == exclude) {
		return NO_MATCH;
	}
	//firstFront == first && excludeFront != exclude && !s.eof()
	return line;
}

/*
 *  Advances s to the next line after a pair of lines.
 *  If no pair is found s.eof() == true;
 *  @return bool pair of lines found
 */
bool get_Pair(ifstream& s, const string targetA, const string targetB) {
	string line;
	//find targetA
	findLine(s, targetA);
	if (s.eof()) {
		return false;
	}
	//pull the targetB line
	exp::getline(s, line);
	if (line.substr(0, targetB.length()) == targetB) {
		mailCount++;
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
	cout << id;
	exp::getline(s, quant);
	cout << quant;
	exp::getline(s, brand);
	cout << brand;
	exp::getline(s, desc);
	cout << desc;
	cout << "-----------" << endl;
}
