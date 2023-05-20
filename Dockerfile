FROM ndatth/ubuntu:22.04

LABEL maintainer="Dat T Nguyen <ndat@utexas.edu"

ADD env.yml /

RUN mamba env update -f /env.yml --prune