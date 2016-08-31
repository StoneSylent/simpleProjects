
#ifndef AUCPARSER_H_
#define AUCPARSER_H_

#include <iostream>
#include <queue>

//#include <regex>

using namespace std;

class AucParser {

public:
	AucParser();
	enum Period { am, pm };
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
	
	A_Date getDate();
	void AddDate(int day, string month, int sHour, Period sP, int eHour, Period eP);

private:

	struct A_Data {
		enum Location {Westerville, Phillipi};
		queue<A_Date> Dates;
	} data;
};

AucParser::AucParser() {

}

/*
 * returns a queue of dates for the Auc
 */
AucParser::A_Date AucParser::getDate() {
	return this->data.Dates.back();
}

void AucParser::AddDate(int day, string month, int sHour, Period sP, int eHour, Period eP) {
	A_Time a;
	a.sHour = sHour;
	a.sP = sP;
	a.eHour = eHour;
	a.eP = eP;
	A_Date d;
	d.day = day;
	d.month = month;
	d.time = a;
	this->data.Dates.push(d);
}

#endif /* AUCPARSER_H_ */
