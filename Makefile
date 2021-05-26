SHELL := /bin/bash
BUILDDIR = build

.PHONY: all dir lib list clean

all: dir hello lib list

dir:
	mkdir -p $(BUILDDIR)
	cp index.html $(BUILDDIR)

hello: hello.c
	gcc -m32 hello.c -o $(BUILDDIR)/hello

lib: lib/ld-linux.so.2 lib/i386-linux-gnu/libc.so.6


lib/%:
	mkdir -p $(BUILDDIR)/$(dir $@)
	cp -v /$@ $(BUILDDIR)/$@

list:
	for i in $$(find $(BUILDDIR) -type d); do echo $$i; ls $$i > $$i/index.list; done

clean:
	rm -rf $(BUILDDIR)
