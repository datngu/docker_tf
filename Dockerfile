FROM tensorflow/tensorflow:2.10.1-gpu-jupyter

LABEL maintainer="Dat T Nguyen <ndat@utexas.edu"

ADD env.yml /
ADD test.sh /

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 samtools bedtools bwa bcftools python3-pip

RUN pip3 install numpy==1.24.3 pandas==2.0.1 pysam==0.21.0

RUN ./test.sh

