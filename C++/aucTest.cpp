/*
 * aucTest.cpp
 *
 *  Created on: Aug 28, 2016
 *      Author: brandon
 */

#include "AucParser.h"
#include <iostream>
#include <sstream>
#include <string>

using namespace std;

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

string strDate(const AucParser::A_Date info) {
	string r;
	stringstream ss;
	ss << "Auction: " << info.day << "," << info.month;
	ss << " open:" << info.time.sHour << strPrd(info.time.sP);
	ss << " close:" << info.time.eHour << strPrd(info.time.eP);
	return ss.str();
	r += "Auction: "+ to_string(info.day) + " " + info.month;
	r += " open:" + to_string(info.time.sHour);
	r += strPrd(info.time.sP);
	r += " close:" + to_string(info.time.eHour);
	r+= strPrd(info.time.eP);
}

int main() {

	AucParser* a = new AucParser();
	a->AddDate(11,"June",11,AucParser::am,4,AucParser::pm);
	AucParser::A_Date info = a->getDate();
	cout << strDate(info) << endl;
}
