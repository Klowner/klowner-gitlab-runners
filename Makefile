include Makefile.conf

cproject: cproject/Dockerfile
	$(MAKE) -C cproject

cproject-daemon1c: cproject-daemon1c/Dockerfile
	$(MAKE) -C cproject-daemon1c

.PHONY: cproject cproject-daemon1c
