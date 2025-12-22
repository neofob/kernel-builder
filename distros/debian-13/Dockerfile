FROM debian:trixie-slim

LABEL maintainer "tuan t. pham" <tuan@vt.edu>

ENV PKGS="bc bison build-essential chrony cpio debhelper flex gawk git kmod libelf-dev \
libssl-dev lz4 mc python3-apt python3-minimal python3-pip rsync vim-nox xz-utils zstd libncurses-dev libdw-dev" \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get -yq update && apt-get dist-upgrade -yq \
    && apt-get -yq install --no-install-recommends  ${PKGS} \
    && adduser builder \
    && apt-get autoclean && apt-get autoremove -yq \
    && mkdir -p /opt/src && rm -fr /tmp/* /var/lib/lists/*

RUN cd /opt/src \
    && git clone https://github.com/neofob/tscripts \
    && cd /usr/local/sbin \
    && ln -s /opt/src/tscripts/misc/*.sh .

WORKDIR /opt/src/linux
