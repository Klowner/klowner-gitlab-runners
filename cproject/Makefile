include ../Makefile.conf
NAME=$(subst $(dir $(realpath .)),,$(realpath .))
TAG=$(NAME)-latest

IMAGE_TAG=$(REGISTRY)/$(NS)/$(IMAGE):$(TAG)

build:
	@echo $(NS)
	@docker build -t $(IMAGE_TAG) .
	@echo "built $(IMAGE_TAG)"

buildforce:
	@docker build --no-cache -t $(IMAGE_TAG) .

run:
	@docker run --rm -it $(IMAGE_TAG) sh

push:
	docker push $(IMAGE_TAG)

.PHONY: build push
