#Name: Dinsefa Hassen
#Course: SE3377
#email: djh170001@utdallas.edu



# PROJECTNAME is a descriptive name used for the backup target
# This should not contain spaces or special characters
PROJECTNAME = CS3376.502.Program_6

#Settings for gcc
CXX = g++
CFLAGS = -std=c++11 -Wall -c
LFLAGS = -Wall
#Name of Executable
SRC = main.cc  
EXECNAME = program6
OBJECTS = $(SRC:cc=o)

#List of Objects need to create executable
OBJS = main.o 

#Location of libraries to link in
LDFLAGS = -L/scratch/perkins/lib

#Name of libraries needed
LDLIBS = -l cdk -lcurses 
CLIBS = -I /scratch/perkins/include

all: $(EXECNAME) clean

$(EXECNAME): $(OBJS)
	$(CXX) -o $(EXECNAME) $(LFLAGS) $(OBJS) $(LDFLAGS) $(LDLIBS)

main.o: main.cc
	$(CXX) $(CFLAGS) main.cc $(CLIBS) -o $@





clean:
	@rm -f $(OBJS) *~ \#*

clean-all: clean
	@rm -f $(EXECNAME)

tar:
	tar -cvf $(EXECNAME).tar.gz *

backup:
	@mkdir -p ~/backups; chmod 700 ~/backups
	@$(eval CURDIRNAME := $(shell basename `pwd`))
	@$(eval MKBKUPNAME := ~/backups/$(PROJECTNAME)-$(shell date +'%Y.%m.%d-%H:%M:%S').tar.gz)
	@echo
	@echo Writing Backup file to: $(MKBKUPNAME)
	@echo
	@-tar zcfv $(MKBKUPNAME) ../$(CURDIRNAME)
	@chmod 600 $(MKBKUPNAME)
	@echo
	@echo Done!
