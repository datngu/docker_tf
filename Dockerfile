FROM ndatth/ubuntu:22.04

LABEL maintainer="Dat T Nguyen <ndat@utexas.edu"

ADD env.yml /

RUN mamba env update -n base -f /env.yml --prune