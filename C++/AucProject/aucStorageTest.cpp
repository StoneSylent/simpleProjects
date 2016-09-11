
#include <iostream>
#include "AucStorage.h"

using namespace std;

int main(int argc, char *argv[]) {

	AucStorage* a = new AucStorage();
	a->AddDate(11, "June", 11, AucStorage::am, 4, AucStorage::pm, AucStorage::Phillipi);

	//store time
	AucStorage::A_Time time;
	time.sHour = 11; time.sP = AucStorage::am;
	time.eHour = 12; time.eP = AucStorage::pm;
	//store date
	AucStorage::A_Date date;
	date.day = 10;
	date.month = "june";
	//store date
	a->AddDate(time, date, AucStorage::Westerville);

	string info = a->getstrDate();
	cout << info << endl << endl;
	info = a->getstrDate();
	cout << info << endl;

}
