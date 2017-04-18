include Makefile.conf

cproject: cproject/Dockerfile
	$(MAKE) -C cproject

cproject-joy: cproject-joy/Dockerfile cproject
	$(MAKE) -C cproject-joy

.PHONY: cproject cproject-joy \
	archlinux-mingw-x64 archlinux-gcc-x64 archlinux-clang-x64
