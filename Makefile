include Makefile.conf

%: %/Dockerfile

cproject: cproject/Dockerfile
	$(MAKE) -C cproject

cproject-joy: cproject-joy/Dockerfile cproject
	$(MAKE) -C cproject-joy

archlinux-gcc-x64:
archlinux-mingw-x64: archlinux-gcc-x64
archlinux-clang-x64: archlinux-gcc-x64


.PHONY: cproject cproject-joy \
	archlinux-mingw-x64 archlinux-gcc-x64 archlinux-clang-x64
