#! /usr/bin/env bash

source ../../emsdk/emsdk_env.sh;

em++ --version

em++ -o public/helloworld.js src/helloworld.cpp

em++ --bind -o public/add.js src/add.cpp