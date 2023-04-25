#! /usr/bin/env bash

source ../../emsdk/emsdk_env.sh;

em++ --version

em++ -o public/index.js src/helloworld.cpp

em++ -lembind -o public/cpp/index.mjs -sEXPORTED_RUNTIME_METHODS=UTF8ToString,stringToUTF8 src/add.cpp src/ptr.cpp src/str.cpp
