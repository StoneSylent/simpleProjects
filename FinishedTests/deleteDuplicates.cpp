/*
	Based on 6.6 (page 66) of 
	Elements of Programming Interviews by Aziz,Lee,Prakash
	
	$ g++ -std=c++11 deleteDuplicates.cpp
	
	Removes duplicate values from a sorted vector
	deleted values are set to zero and pushing to
	the end of the vector 
	
*/
#include <iostream>
#include <vector>

using namespace std;

void printVector ( vector<int> arg );
vector<int> deleteDuplicates(vector<int> A);

int main()
{
	vector<int> values = {1,1,4,5,6,6,12,12,21,21};
	cout << "Starting array was ";
	printVector(values);
	cout << "  Ending array was ";
	printVector(deleteDuplicates(values));
}

void printVector ( vector<int> arg ) {
	for (int i=0; i<arg.size(); i++)
	{
		cout << arg[i] << " ";
	}
	cout << endl;
}

vector<int> deleteDuplicates(vector<int> A)
{
	vector<int> temp = A;
	int writeIndex = 0;	
	for (int i=1; i<A.size(); i++) {
		if ( temp[writeIndex] != temp[i] ) {
			 temp[++writeIndex] = temp[i];
		}  
	}
	//set duplicates to zero
	for (int j=writeIndex+1; j<A.size(); j++) {
		temp[j] = 0;	
	}
	return temp;
}

