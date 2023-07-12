FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y linux-tools-common linux-tools-generic linux-tools-`uname -r`

RUN apt-get install -y \
    strace \
    git \
    perl

# Install FlameGraph
WORKDIR /opt
RUN git clone https://github.com/brendangregg/FlameGraph.git
ENV PATH="/opt/FlameGraph:${PATH}"

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /data
CMD [ "/bin/bash" ]