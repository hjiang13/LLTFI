CC=clang
LINKER=/home/hjiang/llvm-project/build/bin/llvm-link
OUTPUT=factorial.ll
CFLAGS=-w -emit-llvm -fno-use-cxa-atexit -g -S
LINKER_FLAGS=-o $(OUTPUT) -S
SRCDIR_OBJS=factorial.ll 

build:$(SRCDIR_OBJS)
	$(LINKER) $(LINKER_FLAGS) $(SRCDIR_OBJS)

factorial.ll: factorial.c
	$(CC) $(CFLAGS) factorial.c

clean:
	rm -rf *.ll *.bc llfi* factorial.ll

