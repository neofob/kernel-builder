Using Docker to build Linux Kernel
==================================
*A QuickWay to build a chosen branch of Linux Kernel based on existing config.*


**author:** _tuan t. pham_

## Table of Contents
* [Requirements](#Requirements)
* [Quick Start](#QuickStart)
  * [1.1 Creating local git mirror](#11-creating-local-git-mirror)
  * [1.2 Updating local git mirror](#12-updating-local-git-mirror)
  * [2. Creating local Docker builder image](#2-creating-local-docker-builder-image)
  * [3.1 Building locally with local mirror](#31-building-locally-with-local-mirror)
  * [3.2 Building locally with local mirror](#32-building-locally-using-gitlab-ci-local)

## Requirements
* `docker`
* `docker-compose`
* about 8GB disk free on `/tmp`, preferably `tmpfs` filetype for speed
  * entry in `/etc/fstab`
    * `tmpfs /tmp tmpfs size=8G,noatime,defaults 0 0`

## QuickStart
### 1.1 Creating local git mirror
```bash
mkdir -p /mnt/mirror
cd /mnt/mirror
git clone --mirror git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux.git
```

### 1.2 Updating local git mirror
```bash
cd /mnt/mirror/linux.git
git fetch --prune
```

### 2 Creating local Docker builder image
*Creating local Docker builder image for Debian and Ubuntu*
```bash
# You only need to run once unless you want to build new one with updated based/new packages in
# the distro
for d in distros/debian-13 distro/ubuntu-24.04; do
  cd $d
  docker-compose build
  cd -
done
```

### 3.1 Building locally with local mirror
* `/mnt/mirror/linux.git`: local Linux kernel git mirror repository
```bash
# It is about 18-22min on a AMD 9950X machine
time GL_LOCAL_MIRROR=/mnt/mirror/linux.git GL_KERNEL_OUTPUT_DIR=/tmp/kernel ./scripts/00-checkout-kernel.sh
time GL_LOCAL_MIRROR=//mnt/mirror/linux.git GL_KERNEL_OUTPUT_DIR=/tmp/kernel ./scripts/01-build-kernel.sh
```

### 3.2 Building locally using `gitlab-ci-local`
*Building locally using [`gitlab-ci-local`][1]to mimic the way it is built in gitlab*
```bash
gitlab-ci-local package:check
gitlab-ci-local package:build
```

[0]: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
[1]: https://github.com/firecow/gitlab-ci-local
