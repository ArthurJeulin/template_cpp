# **********************************************************
#      2024 : Arthur JEULIN
#      Copyright (c) Arthur JEULIN
#      Created by Arthur JEULIN on 06/22/2024.
# **********************************************************
#
# Module : Create an environment do build the project
#

FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-22.04
#FROM ubuntu:22.04

RUN echo "Building Environment"
RUN echo "Updating Ubuntu"
RUN apt-get update && apt-get upgrade -y

RUN echo "Installing dependencies..."
RUN apt install -y \
			ccache \
			cppcheck \
            cmake \
			curl \
			doxygen \
			gcc \
			git \
			graphviz \
			make \
			ninja-build \
			python3 \
			python3-pip \
			tar \
			unzip \
			vim

RUN echo "Installing dependencies not found in the package repos..."

RUN apt install -y wget tar build-essential libssl-dev && \
			wget https://github.com/Kitware/CMake/releases/download/v3.27.5/cmake-3.27.5.tar.gz && \
			tar -zxvf cmake-3.27.5.tar.gz && \
			cd cmake-3.27.5 && \
			./bootstrap && \
			make && \
			make install 


RUN git clone https://github.com/microsoft/vcpkg -b 2020.06 && \
		cd vcpkg && \
		./bootstrap-vcpkg.sh -disableMetrics -useSystemBinaries	

