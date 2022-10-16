#!/bin/bash

PROGRAMS=("csc_video_conv" "test_mpeg" "test_adx" "sfdmux")
INCLUDES=-I./include
LIBS=./lib/*
ARGS="-O2 -Wno-unused-result -Wno-format -Wno-implicit-function-declaration" #-Qns

if [[ ! -d bin ]]; then
	echo Creating /bin/ directory
	mkdir bin
fi

for prog in "${PROGRAMS[@]}"
do
	echo Building $prog
	gcc "./src/$prog.c" -o "./bin/$prog" $ARGS $INCLUDES $LIBS
done
