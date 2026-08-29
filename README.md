Using Docker to build Linxu Kernel
==================================
*A QuickWay to build the chosen branch of Linux Kernel based on existing config.*


**author:** _tuan t. pham_


## Requirements
* `docker`
* `docker-compose`
* about 8GB disk free on /tmp, preferably `tmpfs`
  * entry in `/etc/fstab`: `tmpfs /tmp tmpfs size=8G,noatime,defaults 0 0`

## Quick Start
### 1. Creating local git mirror
```bash
mkdir -p /mnt/mirror
cd /mnt/mirror
git clone --mirror git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux.git
```

### 2. Creating local Docker builder image for Debian and Ubuntu
```bash
# You only need to run once unless you want to build new one with updated based/new packages in
# the distro
for d in distros/debian-13 distro/ubuntu-24.04; do
  cd $d
  docker-compose build
  cd -
done
```

### 3.1. Build locally with local mirror
* `/mnt/mirror/linux.git`: local Linux kernel git mirror repository
```bash
# It is about 18-22min on a AMD 9950X machine
time GL_LOCAL_MIRROR=/mnt/mirror/linux.git GL_KERNEL_OUTPUT_DIR=/tmp/kernel ./scripts/00-checkout-kernel.sh
time GL_LOCAL_MIRROR=//mnt/mirror/linux.git GL_KERNEL_OUTPUT_DIR=/tmp/kernel ./scripts/01-build-kernel.sh
```

### 3.2. Build locally using gitlab-local to mimic the way it is built in gitlab
```bash
gitlab-ci-local --env .gitlab-ci-local check
gitlab-ci-local --env .gitlab-ci-local build
```

[0]: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
