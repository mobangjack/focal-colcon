FROM ubuntu:20.04 AS focal-colcon

RUN apt-get update && apt-get install -y \
    locales
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN echo "export LANG=en_US.UTF-8" >> /etc/bash.bashrc

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    make \
    python3 \
    python3-pip

RUN python3 -m pip install \
    colcon-common-extensions \
    vcstool
