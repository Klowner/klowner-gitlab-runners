include Makefile.conf

all: $(IMAGE_DIRS)

%: %/Dockerfile
	$(MAKE) -C $@

%/push:
	$(MAKE) -C $* push

push: $(foreach dir,$(IMAGE_DIRS),$(dir)/push)

.PHONY: % push %/push
