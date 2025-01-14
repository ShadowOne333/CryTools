#!/bin/bash

INCLUDES="-I./include"
ARGS_DEBUG="-flto -g3 -std=c99"
ARGS_RELEASE="-flto -O3 -s -std=c99"
ARGS=$ARGS_DEBUG

if [[ ! -d bin ]]; then
	echo Creating /bin/ directory
	mkdir bin
fi

# Start building sfdmux
echo Building sfdmux
gcc "./src/sfdmux.c" -o "./bin/sfdmux" $ARGS $INCLUDES \
	./lib/adx.c ./lib/m1v.c ./lib/mpeg.c ./lib/pathutils.c \
	./lib/sfd.c ./lib/io_common.c ./lib/common.c ./lib/fd.c

# Start building test_adx
echo Building test_adx
gcc "./src/test_adx.c" -o "./bin/test_adx" $ARGS $INCLUDES \
	./lib/adx.c ./lib/common.c

# Start building test_m1v	
echo Building test_m1v
gcc "./src/test_m1v.c" -o "./bin/test_m1v" $ARGS $INCLUDES \
	./lib/m1v.c ./lib/common.c ./lib/io_common.c

# Start building test_mpeg
echo Building test_mpeg
gcc "./src/test_mpeg.c" -o "./bin/test_mpeg" $ARGS $INCLUDES \
	./lib/mpeg.c ./lib/common.c

# Start building csc_video_conv	
echo Building csc_video_conv
gcc "./src/csc_video_conv.c" -o "./bin/csc_video_conv" $ARGS $INCLUDES \
	./lib/mpeg.c ./lib/sfd.c ./lib/plane_converters.c ./lib/common.c ./lib/m1v.c ./lib/pathutils.c

# Start building sfdinfo
echo Building sfdinfo
gcc "./src/sfdinfo.c" -o "./bin/sfdinfo" $ARGS $INCLUDES \
	./lib/mpeg.c ./lib/sfd.c ./lib/common.c ./lib/fd.c \
	./lib/m1v.c

