.PHONY: build

all: build

build:
	mkdir -p cmake-build-debug
	cmake -b ./cmake-build-debug
	cmake ..

sample:
	mkdir -p build/
	emcc main.cpp -std=c++11 -s WASM=1 -s USE_SDL=2 -O3 -o build/main.js
