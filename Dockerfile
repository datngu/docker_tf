FROM nvidia/cuda:11.8.0-devel-ubuntu20.04

LABEL maintainer="Dat T Nguyen <ndat@utexas.edu"

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    && apt-get -qq -y remove curl bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes

RUN apt-get update && apt-get install -y \
    make \
    gcc \
    wget \
    git \
    tar \
    libz-dev \
    liblapack-dev \
    libgsl-dev \
    tabix \
    build-essential \
    bcftools

ENV PATH /opt/conda/bin:$PATH

RUN conda create -n base python=3.10

RUN conda install -n base -c conda-forge numpy==1.23.2 pandas==2.0.1

RUN conda install -n base -c bioconda pysam samtools bedtools -y

ENV PATH /opt/conda/envs/base/bin:$PATH

RUN python3 -m pip install tensorflow==2.12.0