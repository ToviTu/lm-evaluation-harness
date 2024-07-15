# Start from a PyTorch image with CUDA
FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-runtime
#FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu20.04

ENV DEBIAN_FRONTEND noninteractive

# Set the working directory in the container
WORKDIR /app
RUN mkdir /dataset/
RUN mkdir /models/

COPY . /lm-eval

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    wget \
    curl \
    dnsutils \
    nano \
    zip \
    unzip \
    git \
    s3cmd \
    ffmpeg \
    screen \
    fonts-freefont-ttf \
    inotify-tools \
    parallel \
    pciutils \
    ncdu \
    libbz2-dev \
    gettext \
    apt-transport-https \
    gnupg2 \
    time \
    openssl \
    redis-tools \
    ca-certificates \
    hdf5-tools\
    vim

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add LLaVA models
RUN git clone https://github.com/haotian-liu/LLaVA
RUN pip install -e LLaVA
RUN pip install lmms-eval
RUN pip install flash-attn --no-build-isolation

# Install lm-eval
RUN git install -e lm-eval
