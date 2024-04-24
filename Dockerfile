FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

# Set keyboard-configuration package selections
RUN echo 'keyboard-configuration keyboard-configuration/layoutcode string us' | debconf-set-selections \
    && echo 'keyboard-configuration keyboard-configuration/layout select' | debconf-set-selections \
    && echo 'keyboard-configuration keyboard-configuration/variantcode string ' | debconf-set-selections \
    && echo 'keyboard-configuration keyboard-configuration/variant select ' | debconf-set-selections \
    && echo 'keyboard-configuration keyboard-configuration/modelcode string ' | debconf-set-selections \
    && echo 'keyboard-configuration keyboard-configuration/model select ' | debconf-set-selections

# Install additional ROS packages and dependencies
RUN apt-get update && apt-get install -y \
    cmake build-essential git libgtk2.0-dev \
    pkg-config libavcodec-dev libavformat-dev \
    libswscale-dev software-properties-common \
    wget curl keyboard-configuration libpcl-dev \
    libeigen3-dev libopencv-dev libopencv-dev \
    python3-opencv gnupg2 lsb-release curl \
    python3 python3-pip apt-utils nano mlocate

RUN pip3 install --upgrade pip



ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
