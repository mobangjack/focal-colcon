FROM ubuntu:20.04 AS focal-colcon

RUN apt-get update && apt-get install -y \
    locales
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN echo "export LANG=en_US.UTF-8" >> /etc/bash.bashrc

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg2 \
    lsb-release \
    git \
    make

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-vcstool \
    python3-flake8 \
    python3-pytest-cov \
    python3-setuptools
