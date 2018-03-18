M111
main： test.o main.o
	g++ -o $@ test.o main.o 

M222
CC = g++
CXXFLAGS = -I.

main : main.o test.o
        $(CC) -o $@ main.o test.o $(CXXFLAGS)

M333
CC = g++
CXXFLAGS = -I.
DEPS = test.h

%.o : %.c DEPS
        $(CC) -c -o $@ $<  $(DEPS)

main : main.o test.o
        $(CC) -o $@ $^ $(CXXFLAGS)  
		
M444
CC = g++
CXXFLAGS = -I.
DEPS = test.h
OBJ = main.o test.o

%.o : %.c DEPS
        $(CC) -c -o $@ $< $(DEPS)
main : $(OBJ)
        $(CC) -o $@ $^ $(CXXFLAGS)

M555
