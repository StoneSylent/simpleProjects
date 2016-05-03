/*
	Based on 6.6 (page 66) of 
	Elements of Programming Interviews by Aziz,Lee,Prakash
	
	$ g++ -std=c++11 deleteDuplicates.cpp
*/
#include <iostream>
#include <vector>

using namespace std;

void printVector ( vector<int> arg, int length) {
	for (int i=0; i<length; i++)
	{
		cout << arg[i] << " ";
	}
	cout << "\n";
}

vector<int> deleteDuplicates(vector<int> A, int length)
{
	vector<int> temp = A;
	int writeIndex = 0;
	for (int i=1; i<length; i++) {
		if ( temp[writeIndex] != temp[i] ) {
			 temp[++writeIndex] = temp[i];
		}  
	}
	//set duplicates to zero
	for (int j=writeIndex+1; j<length; j++) {
		temp[j] = 0;	
	}
	length = writeIndex;
	return temp;
}


int main()
{
	int length = 10;
	vector<int> values = {1,4,5,5,6,6,12,12,21,21};
	cout << "Starting array was ";
	printVector(values, length);
	cout << "  Ending array was ";
	printVector(deleteDuplicates(values, length), length);
}

