#! /usr/bin/env bash

source ../../emsdk/emsdk_env.sh;

em++ --version

em++ -o public/index.js src/helloworld.cpp

em++ -lembind -o public/add/index.mjs src/add.cpp