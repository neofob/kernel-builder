# A wrapper to build  docker kernel builder for 22.04
#
# __author__: tuan t. pham

DOCKER_NAME ?= neofob/kernel-builder
DOCKER_TAG ?= 24.04

docker:
	docker build --no-cache -t $(DOCKER_NAME):$(DOCKER_TAG) .
