FROM tensorflow/tensorflow:2.10.1-gpu-jupyter

LABEL maintainer="Dat T Nguyen <ndat@utexas.edu"

# COPY env.yml /env.yml
COPY test.sh /test.sh

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 samtools bedtools bwa bcftools python3-pysam

RUN python3 -m pip install numpy==1.24.3 pandas==2.0.1 scikit-learn

RUN /test.sh

