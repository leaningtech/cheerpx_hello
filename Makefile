all: hello lib/ld-linux.so.2 lib/i386-linux-gnu/libc.so.6

hello: hello.c
	gcc -m32 hello.c -o hello

lib/%:
	mkdir -p $(dir $@)
	cp -v /$@ $@
