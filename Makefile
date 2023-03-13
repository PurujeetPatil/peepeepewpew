SFML_HOME = ./lib/SFML-2.5.1
TEMP = bin/temp

bin/main: bin/temp/main.o bin
	g++ bin/temp/main.o -o bin/main -L$(SFML_HOME)/lib -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lopengl32 -lfreetype -lwinmm -lgdi32 -mwindows

bin/temp/main.o: src/main.cpp bin/temp
	g++ -o bin/temp/main.o -c src/main.cpp -I$(SFML_HOME)/include -DSFML_STATIC

debug: bin/main-dbg

bin/main-dbg: bin/temp/main-dbg.o bin
	g++ bin/temp/main-dbg.o -g -o bin/main-dbg -L$(SFML_HOME)/lib -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lopengl32 -lfreetype -lwinmm -lgdi32 -mwindows

bin/temp/main-dbg.o: src/main.cpp bin/temp
	g++ -o bin/temp/main-dbg.o -g -c src/main.cpp -I$(SFML_HOME)/include -DSFML_STATIC

bin/temp: bin
	mkdir bin/temp

bin:
	mkdir bin

clean :
	rm -rf ./bin
