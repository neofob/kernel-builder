# A wrapper to build  docker kernel builder for 26.04
#
# __author__: tuan t. pham

DOCKER_NAME ?= neofob/kernel-builder
DOCKER_TAG ?= 26.04

docker:
	docker build --no-cache -t $(DOCKER_NAME):$(DOCKER_TAG) .
