include ../Makefile.conf
NAME=$(subst $(dir $(realpath .)),,$(realpath .))
TAG=$(NAME)-latest

IMAGE_TAG=$(REGISTRY)/$(NS)/$(IMAGE):$(TAG)

build:
	@docker build -t $(IMAGE_TAG) .
	@echo "built $(IMAGE_TAG)"

push:
	@docker push $(IMAGE_TAG)

run:
	@docker run --rm -it $(IMAGE_TAG) sh

packages: packages.sh
	./packages.sh

.PHONY: build push packages
