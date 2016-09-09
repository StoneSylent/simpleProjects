/*
 * Takes a .mBox file and pulls select information
 */

#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

#include "AucParser.h"

using namespace std;

//Constants
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
string strDate(const AucParser::A_Date info);
string strPrd(const AucParser::Period& p);
string get_Single(ifstream& s, const string& first);
string get_Single(ifstream& s, const string& first, const string& exclude);
bool get_Pair(ifstream& s, const string first, const string second);
void get_Item_Info(ifstream& s);

int main(int argc, char *argv[]) {
	/*
	 * Test storing a day, date, time
	 */
	AucParser* a = new AucParser();
	a->AddDate(11, "June", 11, AucParser::am, 4, AucParser::pm);
	AucParser::A_Date info = a->getDate();
	cout << strDate(info) << endl;
	/*
	 * Moving on to processing .mBox file
	 */
	ifstream s;
	s.open(argv[1]);

	if (!s.good()) {
		cout << "unable to open " << argv[1] << endl;
		return 1;
	}

	while (!s.eof()) {
		//advance s to next email
		get_Pair(s, C_TYPE, C_TRANS);
		//find removal information
		string removal = get_Single(s, REMOVAL);
		cout << removal;
		//find location information
		string loca = get_Single(s, LOCATION);
		cout << loca;
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

/*
 * Converts Period values into strings
 * @param Period& p value to be returned as a string
 * @return string string version of p
 */
string strPrd(const AucParser::Period& p) {
	switch (p) {
	case AucParser::am:
		return "am";
	case AucParser::pm:
		return "pm";
	default:
		return "";
	}
}

/*
 * Converts A_Date into a string
 */
string strDate(const AucParser::A_Date info) {
	string r;
	stringstream ss;
	ss << "Auction: " << info.day << "," << info.month;
	ss << " open:" << info.time.sHour << strPrd(info.time.sP);
	ss << " close:" << info.time.eHour << strPrd(info.time.eP);
	return ss.str();
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
	cout << id;
	exp::getline(s, quant);
	cout << quant;
	exp::getline(s, brand);
	cout << brand;
	exp::getline(s, desc);
	cout << desc;
	cout << "-----------" << endl;
}
