# Compilation Makefile for CryTools
# Dev: ThisKwasior, Makefile: ShadowOne333

# Compiler to use
CC = gcc

# Main directories
SRC = ./src
OUT = ./bin
LIBS = ./lib/*
INCLUDES = -I./include

# Arguments for the compilation
ARGS_RELEASE = -flto -O3 -s -std=c99 -Wno-unused-result -Wno-implicit-function-declaration -Wno-format
ARGS_DEBUG = -flto -g3 -std=c99 -Wno-unused-result -Wno-implicit-function-declaration -Wno-format
ARGS = $(ARGS_DEBUG)

# Libraries for each program
ADX_LIBS = ./lib/adx.c ./lib/common.c
M1V_LIBS = ./lib/m1v.c ./lib/common.c ./lib/io_common.c
MPEG_LIBS = ./lib/mpeg.c ./lib/common.c
CSC_LIBS = ./lib/mpeg.c ./lib/sfd.c ./lib/plane_converters.c ./lib/common.c ./lib/m1v.c ./lib/pathutils.c
INFO_LIBS = ./lib/mpeg.c ./lib/sfd.c ./lib/common.c ./lib/fd.c ./lib/m1v.c

# Begin make
all: bin test_adx test_mpeg test_m1v csc_video_conv sfdinfo sfdmux
	@echo; echo "Compilation finished without errors.";

test_adx:
	@echo "Building test_adx...";
	$(CC) $(SRC)/test_adx.c -o $(OUT)/test_adx $(ARGS_RELEASE) $(INCLUDES) $(ADX_LIBS)

test_m1v:	
	@echo; echo "Building test_m1v...";
	$(CC) $(SRC)/test_m1v.c -o $(OUT)/test_m1v $(ARGS_RELEASE) $(INCLUDES) $(M1V_LIBS)

test_mpeg:
	@echo; echo "Building test_mpeg...";
	$(CC) $(SRC)/test_mpeg.c -o $(OUT)/test_mpeg $(ARGS_RELEASE) $(INCLUDES) $(MPEG_LIBS)

csc_video_conv:
	@echo; echo "Building csc_video_conv...";
	$(CC) $(SRC)/csc_video_conv.c -o $(OUT)/csc_video_conv $(ARGS_RELEASE) $(INCLUDES) $(CSC_LIBS)

sfdinfo:
	@echo; echo "Building sfdinfo...";
	$(CC) $(SRC)/sfdinfo.c -o $(OUT)/sfdinfo $(ARGS_RELEASE) $(INCLUDES) $(INFO_LIBS)

sfdmux:
	@echo; echo "Building sfdmux...";
	$(CC) $(SRC)/sfdmux.c -o $(OUT)/sfdmux $(ARGS_RELEASE) $(INCLUDES) $(LIBS)

# Verify if the /bin/ directory exists, if not, create it
bin:
	@if [[ ! -d bin ]]; then\
		echo "Creating /bin/ directory..."; echo;\
		mkdir $(OUT);\
	fi

# Clean compilation files
clean:
	rm -rf $(OUT)

