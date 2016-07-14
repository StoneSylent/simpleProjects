 
#Variables
CC= g++

#start with A-Z
COMPILES= DeleteDuplicates  Hello_world  Palendrome SortedMerge EndLTest SimpleInput SpreadsheetEncoding

#executables are all lowercase
LowerExecutables = $(shell echo $(COMPILES) | tr A-Z a-z)


all: $(COMPILES)

#1
DeleteDuplicates:
	$(CC) -std=c++11 deleteDuplicates.cpp -o deleteduplicates 
#2
Hello_world:
	$(CC) hello_world.cpp -o hello_world
#3	
Palendrome:
	$(CC) palendrome.cpp -o palendrome
#4
SortedMerge:
	$(CC) sortedMerge.cpp -o sortedmerge
#5
EndLTest:
	$(CC) endLTest.cpp -o endltest
#6
SimpleInput:
	$(CC) simpleInput.cpp -o simpleinput
#7
SpreadsheetEncoding:
	$(CC) -std=c++11 spreadsheetEncoding.cpp -o spreadsheetencoding
	
	
#cleaners	
cleanAll:
	make clean; rm -f -v *~ 	
	
clean~:
	rm -v *~	

clean:
	rm -f -v $(LowerExecutables)
