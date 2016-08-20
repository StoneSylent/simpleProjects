/*
	Based on 7.4 variant 2 (page 96) of 
	Elements of Programming Interviews by Aziz,Lee,Prakash
	
	$ g++ -o sortedMerge sortedMerge.cpp
	
	Sorts two arrays in ascending order with one another
*/

#include <stdio.h>
#include <iostream>

using namespace std;

void printArray( int A[], int length );
void merge(int A[], int B[], int x, int y);

int main () {

	int A[] = {60};
	int B[] =  {42, 54, 78, 93};
	int x = sizeof(A)/sizeof(int);
	int y = sizeof(B)/sizeof(int);

	merge(A,B,x,y);	
	printArray(A, x);
	printArray(B, y);
}
	
void merge(int A[], int B[], int x, int y) {   
	//switch to last index values
	x--;
	y--;

	//go through B[] backwards
	for (int i=y; i>=0; i--) {     
		//save the last in A to be moved to start of B.  
		int last = A[x];  
		int j;
		//make room for B[i]       
		for (j=x; j >= 0 && A[j] > B[i]; j--) {
			A[j+1] = A[j];
		}
		//shifting was done so B[i] needs to be moved				
		if (j != x) {
			A[j+1] = B[i];
			B[i] = last;
		}
	}
}


void printArray( int A[], int length ) {
	for (int i=0; i<length; i++) 	{
		cout << A[i] << ' ';	
	}
	cout << endl;
}

