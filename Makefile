a.out: y.tab.o lex.yy.o ass6_16CS30009_translator.o ass6_16CS30009_target_translator.o
	g++ -g ass6_16CS30009_translator.o ass6_16CS30009_target_translator.o lex.yy.o y.tab.o -lfl -o a.out
	 ./a.out < ass6_16CS30009_test1.c > ass6_16CS30009_quad1.out
	 ./a.out < ass6_16CS30009_test2.c > ass6_16CS30009_quad2.out
	 ./a.out < ass6_16CS30009_test3.c > ass6_16CS30009_quad3.out
	 ./a.out < ass6_16CS30009_test4.c > ass6_16CS30009_quad4.out
	 ./a.out < ass6_16CS30009_test5.c > ass6_16CS30009_quad5.out
	# Above are the individual commands to generate the .s file to output.s then run make output to compile the library then do ./output to run

	# make run to execute all the test files at once
lex.yy.c: ass6_16CS30009.l
	flex ass6_16CS30009.l
y.tab.c: ass6_16CS30009.y
	yacc -dtv ass6_16CS30009.y
ass6_16CS30009_target_translator.o: ass6_16CS30009_target_translator.cxx
	g++ -g -c ass6_16CS30009_target_translator.cxx
ass6_16CS30009_translator.o: ass6_16CS30009_translator.cxx
	g++ -g -c ass6_16CS30009_translator.cxx
lex.yy.o: lex.yy.c
	g++ -g -c lex.yy.c
y.tab.o:    y.tab.c
	g++ -g -DYYDEBUG -c y.tab.c
libass2_16CS30009.a: ass2_16CS30009.o
	ar -rcs libass2_16CS30009.a ass2_16CS30009.o

ass2_16CS30009.o: ass2_16CS30009.c myl.h
	gcc -Wall  -c ass2_16CS30009.c
clean:
	rm -f test1 test2 test3 test4 test5 lex.yy.c y.tab.h y.output y.tab.c lex.yy.o y.tab.o ass6_16CS30009_translator.o ass6_16CS30009_target_translator.o ass6_16CS30009_test1.o ass6_16CS30009_test2.o ass6_16CS30009_test3.o ass6_16CS30009_test4.o ass6_16CS30009_test5.o libass2_16CS30009.a ass2_16CS30009.o output.o a.out pointerhandling pointerhandling.s pointerhandling.out pointerhandling.o output output.s


test1: ass6_16CS30009_test1.o libass2_16CS30009.a
	gcc -g ass6_16CS30009_test1.o -o test1 -L. -lass2_16CS30009
ass6_16CS30009_test1.o: ass6_16CS30009_test1.s myl.h
	gcc -g -Wall  -c ass6_16CS30009_test1.s -o ass6_16CS30009_test1.o

test2: ass6_16CS30009_test2.o libass2_16CS30009.a
	gcc -g  ass6_16CS30009_test2.o -o test2 -L. -lass2_16CS30009
ass6_16CS30009_test2.o: ass6_16CS30009_test2.s myl.h
	gcc -g -Wall -c ass6_16CS30009_test2.s

test3: ass6_16CS30009_test3.o libass2_16CS30009.a
	gcc -g  ass6_16CS30009_test3.o -o test3 -L. -lass2_16CS30009
ass6_16CS30009_test3.o: ass6_16CS30009_test3.s myl.h
	gcc -g -Wall  -c ass6_16CS30009_test3.s

test4: ass6_16CS30009_test4.o libass2_16CS30009.a
	gcc -g  ass6_16CS30009_test4.o -o test4 -L. -lass2_16CS30009
ass6_16CS30009_test4.o: ass6_16CS30009_test4.s myl.h
	gcc -g -Wall  -c ass6_16CS30009_test4.s

test5: ass6_16CS30009_test5.o libass2_16CS30009.a
	gcc -g  ass6_16CS30009_test5.o -o test5 -L. -lass2_16CS30009
ass6_16CS30009_test5.o: ass6_16CS30009_test5.s myl.h
	gcc -g -Wall -c ass6_16CS30009_test5.s

pointerhandling:pointerhandling.o libass2_16CS30009.a
	gcc -g  pointerhandling.o -o pointerhandling -L. -lass2_16CS30009
pointerhandling.o: pointerhandling.s myl.h
	gcc -g -Wall -c pointerhandling.s

#output: output.o
output: output.o libass2_16CS30009.a
	gcc -g  output.o -o output -L. -lass2_16CS30009
output.o: output.s myl.h
	gcc -g -Wall -c output.s

run:

	./a.out < ass6_16CS30009_test1.c > ass6_16CS30009_quad1.out

	mv output.s ass6_16CS30009_test1.s

	make test1

	./a.out < ass6_16CS30009_test2.c > ass6_16CS30009_quad2.out

	mv output.s ass6_16CS30009_test2.s

	make test2

	./a.out < ass6_16CS30009_test3.c > ass6_16CS30009_quad3.out

	mv output.s ass6_16CS30009_test3.s

	make test3

	./a.out < ass6_16CS30009_test4.c > ass6_16CS30009_quad4.out

	mv output.s ass6_16CS30009_test4.s

	make test4

	./a.out < ass6_16CS30009_test5.c > ass6_16CS30009_quad5.out

	mv output.s ass6_16CS30009_test5.s

	make test5

	./a.out < pointerhandling.c > pointerhandling.out

	mv output.s pointerhandling.s

	make pointerhandling
	#Below are the individual commands for compiling each test file
	#./test1
	#./test2
	#./test3
	#./test4
	#./test5
	#./pointerhandling
