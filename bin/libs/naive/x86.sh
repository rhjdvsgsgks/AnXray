#!/bin/bash

source "bin/init/env.sh"

ROOT="$PROJECT/naive-plugin/src/main/jniLibs"
OUTPUT="naive"
LIB_OUTPUT="lib$OUTPUT.so"

git submodule update --init --recursive 'naive-plugin/*'
cd naive-plugin/src/main/jni/naiveproxy/src

export EXTRA_FLAGS='target_os="android" target_cpu="x86"'
./get-clang.sh
./build.sh
DIR="$ROOT/x86"
rm -rf $DIR
mkdir -p $DIR
cp out/Release/naive $DIR/$LIB_OUTPUT
