# Compilation Makefile for CryTools
# Dev: ThisKwasior, Makefile: ShadowOne333

GCC = gcc
SRC = ./src

LIBS = ./lib/*
ADX_LIBS = ./lib/adx.c ./lib/common.c
M1V_LIBS = ./lib/m1v.c ./lib/common.c ./lib/io_common.c
MPEG_LIBS = ./lib/mpeg.c ./lib/common.c
CSC_LIBS = ./lib/mpeg.c ./lib/sfd.c ./lib/plane_converters.c ./lib/common.c ./lib/m1v.c ./lib/pathutils.c
INFO_LIBS = ./lib/mpeg.c ./lib/sfd.c ./lib/common.c ./lib/fd.c ./lib/m1v.c

INCLUDES = -I./include

ARGS_RELEASE = -flto -O3 -s -std=c99 -Wno-unused-result -Wno-implicit-function-declaration -Wno-format
ARGS_DEBUG = -flto -g3 -std=c99 -Wno-unused-result -Wno-implicit-function-declaration -Wno-format
ARGS = $(ARGS_DEBUG)

OUT = ./bin

all: bin test_mpeg test_m1v test_adx csc_video_conv sfdinfo sfdmux

sfdmux:
	@echo "Building sfdmux";
	$(GCC) $(SRC)/sfdmux.c -o $(OUT)/sfdmux $(ARGS_RELEASE) $(INCLUDES) $(LIBS)

test_adx:
	@echo "Building test_adx";
	$(GCC) $(SRC)/test_adx.c -o $(OUT)/test_adx $(ARGS_RELEASE) $(INCLUDES) $(ADX_LIBS)

test_m1v:	
	@echo "Building test_m1v";
	$(GCC) $(SRC)/test_m1v.c -o $(OUT)/test_m1v $(ARGS_RELEASE) $(INCLUDES) $(M1V_LIBS)

test_mpeg:
	@echo "Building test_mpeg";
	$(GCC) $(SRC)/test_mpeg.c -o $(OUT)/test_mpeg $(ARGS_RELEASE) $(INCLUDES) $(MPEG_LIBS)

csc_video_conv:
	@echo "Building csc_video_conv";
	$(GCC) $(SRC)/csc_video_conv.c -o $(OUT)/csc_video_conv $(ARGS_RELEASE) $(INCLUDES) $(CSC_LIBS)

sfdinfo:
	@echo "Building sfdinfo";
	$(GCC) $(SRC)/sfdinfo.c -o $(OUT)/sfdinfo $(ARGS_RELEASE) $(INCLUDES) $(INFO_LIBS)

bin:
	@if [[ ! -d bin ]]; then\
		echo "Creating /bin/ directory";\
		echo;\
		mkdir bin;\
	fi

clean:
	rm -rf $(OUT)

