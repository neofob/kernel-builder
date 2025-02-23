FROM ubuntu:24.04

LABEL maintainer "tuan t. pham" <tuan@vt.edu>

# ubuntu:23.04 image has a user ubuntu already

ENV PKGS="bc bison build-essential chrony cpio debhelper flex git kmod libelf-dev \
libssl-dev lz4 mc python3-apt python3-minimal python3-pip rsync vim-nox xz-utils zstd" \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get -yq update && apt-get upgrade -yq && apt-get dist-upgrade -yq \
    && apt-get -yq install --no-install-recommends  ${PKGS} \
    && mkdir -p /opt/src && rm -fr /tmp/* /var/lib/lists/*

RUN cd /opt/src \
    && git clone https://github.com/neofob/tscripts \
    && cd /usr/local/sbin \
    && ln -s /opt/src/tscripts/misc/*.sh .

RUN apt-get autoremove -yq \
    && apt-get autoclean

WORKDIR /opt/src/linux
