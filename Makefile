include Makefile.conf

all: $(IMAGE_DIRS)

%/Makefile:
	ln -s ../Makefile.base $@

%: %/Dockerfile %/Makefile
	$(MAKE) -C $@

%/push:
	$(MAKE) -C $* push

%/pull:
	$(MAKE) -C $* pull

push: $(foreach dir,$(IMAGE_DIRS),$(dir)/push)
pull: $(foreach dir,$(IMAGE_DIRS),$(dir)/pull)

.PHONY: % push %/push pull %/pull
