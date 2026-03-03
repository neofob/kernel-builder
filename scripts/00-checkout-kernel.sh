#!/usr/bin/env bash

source gitlab/build.env

function checkout_kernel()
{
	cd $GL_WORKDIR
	git clone --depth=1 -b ${GL_KERNEL_BRANCH} file://${GL_LOCAL_MIRROR}
}


checkout_kernel
