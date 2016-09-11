/*
 * AucFileParser.h
 *
 *  Created on: Sep 10, 2016
 *      Author: brandon
 */

#ifndef AUCFILEPARSER_H_
#define AUCFILEPARSER_H_

#include <fstream>

using namespace std;

class AucFileParser {

public:
	//Constants
	string const NO_MATCH = "";

	AucFileParser(char* file);
	bool isOkay();

	void getLine(string& line);
	string findLine(const string& target);
	string findLineBefore(const string& target, const string& exclude);

	bool getPair(const string targetA, const string targetB);

private:
	//Globals
	ifstream s;
	bool status;
	int lineCount = 0;
	int mailCount = 0;

	string exception(int i);
	bool isLeadSub(const string line, const string sub);
};

/*
 * -----------------Public--------------------
 */

/*
 * Constructor
 * @param char* fileName to be read
 */
AucFileParser::AucFileParser(char* file) {
	s.open(file);
	if (!s.good()) {
		s.close();
		perror(exception(1).c_str());
	} else {
		status = true;
	}
}
/*
 * @return bool error or file finished
 */
bool AucFileParser::isOkay() {
	return status;
}

/*
 * Get the next line of the file
 */
void AucFileParser::getLine(string& line) {
	using std::getline;
	getline(s, line);
	lineCount++;
}
/*
 * @return string where target was found
 */
string AucFileParser::findLine(const string& target) {
	string line;
	bool match = false;
	while (!match && !s.eof()) {
		getLine(line);
		match = isLeadSub(line, target);
	}

	if (s.eof()) {
		lineCount--;
		return NO_MATCH;
	}
	return line;
}
/*
 * @return string where first was found up until exclude is found
 * @return string empty when exclude reached
 */
string AucFileParser::findLineBefore(const string& target, const string& exclude) {

	string line, firstFront, excludeFront;
	do {
		getLine(line);
		firstFront = line.substr(0, target.length());
		excludeFront = line.substr(0, exclude.length());
	} while (firstFront != target && excludeFront != exclude && !s.eof());

	if (s.eof()) {
		lineCount--;
		status = false;
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
bool AucFileParser::getPair(const string targetA, const string targetB) {
	string line;
	//find targetA
	findLine(targetA);
	if (s.eof()) {
		return false;
	}
	//pull the targetB line
	getLine(line);
	if (line.substr(0, targetB.length()) == targetB) {
		mailCount++;
		return true;
	} else {
		return false;
	}
}
/*
 * -----------------Private--------------------
 */

/*
 * return string errors AucFileParser provides
 */
string AucFileParser::exception(int i) {
	switch (i) {
		case 1:
			return "Unable to access file when constructing AucFileParser";
			break;
		default:
			return "Unknown error";
			break;
	}
}

/*
 * return bool line begins with sub
 */
bool AucFileParser::isLeadSub(const string line, const string sub) {

	if (sub.length() > line.length()) {
		return false;
	}
	return (line.substr(0, sub.length()) == sub);
}

#endif /* AUCFILEPARSER_H_ */
