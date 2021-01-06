cmake_minimum_required(VERSION 3.12)
set(CMAKE_C_COMPILER "${CMAKE_SOURCE_DIR}/emsdk/upstream/emscripten/emcc")
set(CMAKE_CXX_COMPILER "${CMAKE_SOURCE_DIR}/emsdk/upstream/emscripten/emcc")

project(hello-wasm)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "-Wall -Wextra")
set(CMAKE_CXX_FLAGS_DEBUG "-g -O3")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s WASM=1 -s USE_SDL=2")

add_executable(${PROJECT_NAME} main.cpp)

include_directories(${CMAKE_SOURCE_DIR}/emsdk/upstream/emscripten/system/include)
include_directories(${CMAKE_SOURCE_DIR}/emsdk/upstream/emscripten/system/include/SDL)
#target_link_libraries(${PROJECT_NAME} ${CMAKE_SOURCE_DIR}/emsdk/upstream/emscripten/cache/wasm/libSDL2.a)
#link_directories(${CMAKE_SOURCE_DIR}/emsdk/upstream/emscripten/cache/wasm/)
#set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "-lSDL")
#target_link_libraries(${PROJECT_NAME} c++ SDL2)
#set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "-s DEMANGLE_SUPPORT=1 --bind")
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "main.js")

file(COPY ./bin/http-up DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ./build/main.html DESTINATION ${CMAKE_BINARY_DIR})

#add_custom_target(${PROJECT_NAME}-web
#        COMMAND bash ./http-up 34567
#        COMMAND firefox http://0.0.0.0:34567/main.html
#        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/
#        COMMENT "Running built executable and additional process..."
#        VERBATIM
#        )