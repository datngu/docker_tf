FROM ndatth/ubuntu:22.04

LABEL maintainer="Dat T Nguyen <ndat@utexas.edu"

ADD env.yml /

RUN mamba env create -f /env.yml 
RUN mamba clean --tarballs --tempfiles --logfiles --yes
RUN ls /opt/conda/envs/env/bin
ENV PATH /opt/conda/envs/env/bin:$PATH