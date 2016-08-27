/*
 Based on 6.6 (page 66) of 
 Elements of Programming Interviews by Aziz,Lee,Prakash
 
 $ g++ -std=c++11 deleteDuplicates.cpp
 
 Removes duplicate values from a sorted vector
 */
#include <iostream>
#include <vector>

using namespace std;

void printVector(const vector<int> arg);
vector<int> deleteDuplicates(const vector<int> A);

int main() {
	vector<int> values = { 1, 1, 4, 5, 6, 6, 12, 12, 21, 21 };
	cout << "Starting array was ";
	printVector(values);
	cout << "  Ending array was ";
	printVector(deleteDuplicates(values));

	vector<int> v = { 1, 1, 4, 5, 6, 6, 12, 21 };
	cout << "Starting array was ";
	printVector(v);
	cout << "  Ending array was ";
	printVector(deleteDuplicates(v));
}

void printVector(const vector<int> arg) {
	for (int i = 0; i < arg.size(); i++) {
		cout << arg[i] << " ";
	}
	cout << endl;
}

vector<int> deleteDuplicates(const vector<int> A) {
	vector<int> temp = A;
	int writeIndex = 0;
	for (int i = 1; i < A.size(); i++) {
		if (temp[writeIndex] != temp[i]) {
			temp[++writeIndex] = temp[i];
		}
	}
	//fix vector size
	temp.resize(writeIndex + 1);

	return temp;
}

