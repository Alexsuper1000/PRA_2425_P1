.PHONY: all clean

all: bin/testListArray bin/testNode bin/testListLinked bin/testDrawing bin/testSquare bin/testRectangle bin/testCircle bin/testPoint2D

bin/testListArray: testListArray.cpp ListArray.h List.h
	mkdir -p bin
	g++ -o bin/testListArray testListArray.cpp ListArray.h

bin/testNode: testNode.cpp Node.h
	mkdir -p bin
	g++ -o bin/testNode testNode.cpp Node.h

bin/testListLinked: testListLinked.cpp ListLinked.h List.h Node.h
	mkdir -p bin
	g++ -o bin/testListLinked testListLinked.cpp ListLinked.h

Point2D.o: Point2D.h Point2D.cpp
	g++ -c Point2D.cpp

Shape.o: Shape.h Shape.cpp Point2D.h
	g++ -c Shape.cpp

Circle.o: Circle.h Circle.cpp Shape.h Point2D.h
	g++ -c Circle.cpp

Rectangle.o: Rectangle.h Rectangle.cpp Shape.h Point2D.h
	g++ -c Rectangle.cpp

Square.o: Square.h Square.cpp Rectangle.h Shape.h Point2D.h
	g++ -c Square.cpp

Drawing.o: Drawing.h Drawing.cpp List.h ListArray.h Shape.h Circle.h Square.h
	g++ -c Drawing.cpp

bin/testDrawing: testDrawing.cpp Drawing.o Square.o Rectangle.o Circle.o Shape.o Point2D.o
	mkdir -p bin
	g++ -c testDrawing.cpp
	g++ -o bin/testDrawing testDrawing.o Drawing.o Square.o Rectangle.o Circle.o Shape.o Point2D.o

bin/testSquare: testSquare.cpp Square.o Rectangle.o Shape.o Point2D.o
	mkdir -p bin
	g++ -c testSquare.cpp
	g++ -o bin/testSquare testSquare.o Square.o Rectangle.o Shape.o Point2D.o

bin/testRectangle: testRectangle.cpp Rectangle.o Shape.o Point2D.o
	mkdir -p bin
	g++ -c testRectangle.cpp
	g++ -o bin/testRectangle testRectangle.o Rectangle.o Shape.o Point2D.o

bin/testCircle: testCircle.cpp Circle.o Shape.o Point2D.o
	mkdir -p bin
	g++ -c testCircle.cpp
	g++ -o bin/testCircle testCircle.o Circle.o Shape.o Point2D.o

bin/testPoint2D: testPoint2D.cpp Point2D.o
	g++ -c testPoint2D.cpp
	mkdir -p bin
	g++ -o bin/testPoint2D testPoint2D.o Point2D.o

clean:
	rm -r *.o *.gch bin
