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

EXAMPLE:
#test:test.cpp cmqtt.cpp cmqtt.h
#	g++ -o test test.cpp cmqtt.cpp -lpaho-mqtt3cs \
#	-I ../../paho.mqtt.c/src \
#	-L ../../paho.mqtt.c/build \
#	-pthread -Imqtt \
#	-std=c++11 

CC = g++

test:test.o cmqtt.o
	$(CC) -o test test.o cmqtt.o -lpaho-mqtt3cs \
	-L ../../paho.mqtt.c/build \
	-pthread

test.o: test.cpp cmqtt.h
	$(CC) -c test.cpp -I ../../paho.mqtt.c/src -Imqtt

cmqtt.o: cmqtt.cpp cmqtt.h
	$(CC) -c cmqtt.cpp -I ../../paho.mqtt.c/src -Imqtt -std=c++11

.PHONY:clean
clean: 
	-rm test *.o
