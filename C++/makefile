#Variables
CC= g++

COMPILES= DeleteDuplicates  Hello_world  Palendrome SortedMerge EndLTest SimpleInput SpreadsheetEncoding F_StreamTest

#executables are all lowercase
LowerExecutables = $(shell echo $(COMPILES))

all: $(COMPILES)

#1
DeleteDuplicates:
	$(CC) -std=c++11 deleteDuplicates.cpp -o DeleteDuplicates 
#2
Hello_world:
	$(CC) hello_world.cpp -o Hello_world
#3	
Palendrome:
	$(CC) palendrome.cpp -o Palendrome
#4
SortedMerge:
	$(CC) sortedMerge.cpp -o SortedMerge
#5
EndLTest:
	$(CC) endLTest.cpp -o EndLTest
#6
SimpleInput:
	$(CC) simpleInput.cpp -o SimpleInput
#7
SpreadsheetEncoding:
	$(CC) -std=c++11 spreadsheetEncoding.cpp -o SpreadsheetEncoding
#8
F_StreamTest:
	$(CC) fstreamTest.cpp -o F_StreamTest	
	
#cleaners	
cleanAll:
	make clean; rm -f -v *~ 	
	
clean~:
	rm -v *~	

clean:
	rm -f -v $(LowerExecutables)
