ifeq (undefined,$(origin MAKEJAVA/JAVA.MAK))
MAKEJAVA/JAVA.MAK:=$(lastword $(MAKEFILE_LIST))

# File to include from your Makefile like this:
# include makejava/Java.mak

CPPFLAGS+=-I"$(JAVA_HOME)/include" -I"$(JAVA_HOME)/include/linux"

JAVAH:=javah
JAVAHFLAGS:=-jni

JAVA:=java
JAVAFLAGS:=-Djava.library.path=.

JAVAC:=javac
JAVACFLAGS:=
JAVACPPFLAGS:=

JAR:=jar
JARFLAGS=c$(if $(Main-Class),e)f $(Main-Class)

%.h: %.class
	$(JAVAH) $(JAVAHFLAGS) $*

%.class: %.java
	$(JAVAC) $(JAVACPPFLAGS) $(JAVACFLAGS) $^

%.jar:
	$(JAR) $(JARFLAGS) $@ $<

run(%.jar): %.jar
	$(JAVA) $(JAVAFLAGS) -jar $*.jar

endif
