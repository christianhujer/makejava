vpath %.java src
.PHONY: all
all: Hello.jar libHello.so

include ../include/makejava/Java.mak
include ../../makelib/include/makelib/Library.mak

Hello.jar: Hello.class Helper.class
Hello.jar: Main-Class:=Hello

.PHONY: run
run: run(Hello.jar)

run(Hello.jar): libHello.so

libHello.so: Hello.o

Hello.o: Hello.c Hello.h

.PHONY: clean
clean:
	$(RM) Hello.h *.[adios] *.so *.class *.jar

debug:
	echo $(SUFFIXES)
