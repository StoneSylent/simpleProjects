 
#Variables
CC= g++

#start with A-Z
COMPILES= 

#executables are all lowercase
LowerExecutables = $(shell echo $(COMPILES) | tr A-Z a-z)


all: $(COMPILES)

#1

#cleaners
cleanAll:
	make clean; rm -f -v *~ 

clean~:
	rm -f -v *~	

clean:
	rm -f -v $(LowerExecutables)
