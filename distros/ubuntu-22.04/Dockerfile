FROM ubuntu:22.04

LABEL maintainer "tuan t. pham" <tuan@vt.edu>

ENV PKGS="bc bison build-essential chrony debhelper flex git libelf-dev \
libssl-dev lz4 mc python3-apt python3-minimal python3-pip vim-nox" \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get -yq update && apt-get dist-upgrade -yq \
    && apt-get -yq install --no-install-recommends  ${PKGS} \
    && mkdir -p /opt/src

RUN apt-get autoremove -yq \
    && apt-get autoclean \
    && rm -fr /tmp/* /var/lib/apt/lists/*

WORKDIR /opt/src
