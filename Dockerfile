FROM ndatth/ubuntu:22.04

LABEL maintainer="Dat T Nguyen <ndat@utexas.edu"

ADD env.yml /

RUN mamba env create -f /env.yml 
RUN mamba clean --tarballs --tempfiles --logfiles --yes
RUN ls /usr/local/envs/env
ENV PATH /usr/local/envs/env/bin:$PATH