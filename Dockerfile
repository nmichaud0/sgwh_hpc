# Use NVIDIA's CUDA base image with the latest CUDA version (currently 12.2 as of this writing)
FROM nvidia/cuda:12.6.2-cudnn-runtime-ubuntu22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Install necessary packages and Python
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.10 python3-pip python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Set Python 3.10 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1 \
    && update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

# Upgrade pip and install essential Python packages
RUN pip install --upgrade pip setuptools wheel

# Install PyTorch with CUDA, transformers, and any other dependencies
RUN pip install torch torchvision torchaudio

RUN pip install transformers==4.46.0

RUN pip install rapidfuzz==3.10.1

RUN pip install numpy
RUN pip install scipy
RUN pip install accelerate==0.28.0
RUN pip install librosa
RUN pip install tensorboard
RUN pip install ipywidgets
RUN pip install evaluate==0.4.3
