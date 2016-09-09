
#ifndef AUCPARSER_H_
#define AUCPARSER_H_

#include <iostream>
#include <queue>
#include <sstream>
#include <string>

using namespace std;

class AucParser {

public:
	AucParser();
	enum Period {am, pm};
	enum Location {Westerville, Phillipi};
	struct A_Time {
				int sHour;
				Period sP;
				int eHour;
				Period eP;
			};
	struct A_Date {
				int day;
				string month;
				A_Time time;
			};

	void AddDate(int day, string month, int sHour, Period sP, int eHour, Period eP, Location l);
	void AddDate(A_Time t, A_Date d, Location l);
	void AddDate(A_Date d, Location l);
	string getstrDate();

private:
	struct A_Data {
		string Location;
		queue<A_Date> Dates;
		queue<string> Items;
	} data;
	string period[2] = {"am","pm"};
	string location[2] = {"Westerville","Phillipi"};
};

AucParser::AucParser() {
}

	void AucParser::AddDate(int day, string month, int sHour, Period sP, int eHour, Period eP, Location l) {
	A_Time t;
	t.sHour = sHour;
	t.sP = sP;
	t.eHour = eHour;
	t.eP = eP;
	A_Date d;
	d.day = day;
	d.month = month;
	d.time = t;
	this->data.Dates.push(d);
	this->data.Location = location[l];
}
void AucParser::AddDate(A_Time t, A_Date d, Location l) {
	d.time = t;
	this->data.Dates.push(d);
	this->data.Location = location[l];
}
void AucParser::AddDate(A_Date d, Location l) {
	this->data.Dates.push(d);
	this->data.Location = location[l];
}

/*
 * Converts A_Date into a string
 */
string AucParser::getstrDate() {
	stringstream ss;
	A_Date date = this->data.Dates.front();
	this->data.Dates.pop();
	ss << " Location: " << this->data.Location << endl;
	ss << " Auction: " << date.day << "," << date.month << endl;
	ss << " open:" << date.time.sHour << period[date.time.sP];
	ss << " close:" << date.time.eHour << period[date.time.eP];
	return ss.str();
}

#endif /* AUCPARSER_H_ */
