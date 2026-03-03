#!/usr/bin/env bash

# Trap errors to print the line number and command that caused the error
trap 'echo "Error at line $LINENO: $BASH_COMMAND"' ERR

source gitlab/build.env

for d in ${GL_BUILD_DISTRO}; do
	pushd . 2>&1 >/dev/null
	rm -fr /tmp/build
	cd distros/$d
	mkdir -p ${GL_KERNEL_OUTPUT_DIR}/$d
	chown -R 1000:1000 ${GL_KERNEL_OUTPUT_DIR}/$d
	time docker-compose --env-file pipeline.env up
	#time docker-compose --env-file pipeline.env config
	popd 2>&1 >/dev/null
done
