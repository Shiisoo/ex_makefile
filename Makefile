.PHONY = all build test clean fclean help prod

include .var

# MATH = ./lib/maths/
# UTIL = ./lib/utils/
# SRC = ./sources/
# BLD = ./build/
# OBJ = ./obj/

help:
	@echo "PHASE : $@"
	@echo "Options for make :"
	@echo "- all                      : Rebuild the program and clean the object files."
	@echo "- build                    : Build all the object files."
	@echo "- ${BLD}calculatrice.exe : Rebuild the program."
	@echo "- clean                    : Remove all the object files."
	@echo "- fclean                   : Remove the object files and the executables."
	@echo "- help                     : Display this page."
	@echo "- ${OBJ}main.o             : Rebuild the main object."
	@echo "- ${DLL}maths.dll          : Rebuild the maths object."
	@echo "- prod                     : Move executables in prod directory."
	@echo "- ${DLL}sayHello.dll       : Rebuild the sayHello object."
	@echo "- ${OBJ}testUnitaire.o     : Rebuild the testUnitaire object."
	@echo "- test                     : Rebuild the test project."

all: ${BLD}calculatrice.exe test clean
	@echo "PHASE : $@"

build: ${OBJ}maths.o ${OBJ}sayHello.o ${OBJ}testUnitaire.o ${OBJ}main.o
	@echo "PHASE : $@"

# -------------------------------------------------------------------------------------------------

${BLD}calculatrice.exe: ${OBJ}maths.o ${OBJ}sayHello.o ${OBJ}main.o
	@echo "PHASE : $@"
	@mkdir -p ${BLD}
	@gcc -o $@ $^

test: ${BLD}testUnit.exe
	@echo "PHASE : $@"

${BLD}testUnit.exe: ${OBJ}testUnitaire.o ${OBJ}maths.o ${OBJ}sayHello.o
	@echo "PHASE : $@"
	@mkdir -p ${BLD}
	@gcc -o $@ $^

prod:
	@echo "PHASE : $@"
	@mkdir -p ${PROD}
	@mv ${BLD}*.exe ${PROD}*.exe

clean:
	@echo "PHASE : $@"
	@rm -rf ${OBJ}*.o

fclean: clean
	@echo "PHASE : $@"
	@rm -rf ${BLD}*.exe
	@rm -rf ${PROD}*.exe
	@rm -rf *.exe
	@rm -rf ${DLL}*.dll
	@rm -rf ${DLL}*.so

# -------------------------------------------------------------------------------------------------

${OBJ}maths.o: ${MATH}maths.c
	@echo "PHASE : $@"
	@mkdir -p ${OBJ}
	@gcc -o $@ -c $<

${OBJ}sayHello.o: ${UTIL}sayHello.c
	@echo "PHASE : $@"
	@mkdir -p ${OBJ}
	@gcc -o $@ -c $<

${OBJ}main.o: ${SRC}main.c
	@echo "PHASE : $@"
	@mkdir -p ${OBJ}
	@gcc -o $@ -c $<

${OBJ}testUnitaire.o: ${SRC}testUnitaire.c
	@echo "PHASE : $@"
	@mkdir -p ${OBJ}
	@gcc -o $@ -c $<

# -------------------------------------------------------------------------------------------------

${DLL}maths.dll: ${OBJ}maths.o
	@echo "PHASE : $@"
	@mkdir -p ${DLL}
	@gcc -shared -o $@ $<

${DLL}sayHello.dll: ${OBJ}sayHello.o
	@echo "PHASE : $@"
	@mkdir -p ${DLL}
	@gcc -shared -o $@ $<
