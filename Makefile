include Makefile.conf

cproject: cproject/Dockerfile
	$(MAKE) -C cproject

cproject-joy: cproject-joy/Dockerfile
	$(MAKE) -C cproject-joy

.PHONY: cproject cproject-joy
