FROM ubuntu:22.04

LABEL maintainer="tuan t. pham <tuan@vt.edu>"

ENV PKGS="bc bison build-essential chrony cpio debhelper flex git kmod libncurses-dev libelf-dev \
libssl-dev lz4 mc python3-apt python3-minimal python3-pip rsync vim-nox xz-utils zstd" \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get -yq update && apt-get upgrade -yq && apt-get dist-upgrade -yq \
    && apt-get -yq install --no-install-recommends  ${PKGS} \
    && mkdir -p /opt/src

RUN useradd -d /home/kernel-builder kernel-builder && \
  mkdir -p /home/kernel-builder && \
  chown kernel-builder:kernel-builder /home/kernel-builder

RUN cd /opt/src \
    && git clone https://github.com/neofob/tscripts \
    && cd /usr/local/sbin \
    && ln -s /opt/src/tscripts/misc/*.sh .
# COPY build_kernel.sh /usr/local/sbin/

WORKDIR /opt/src/linux
