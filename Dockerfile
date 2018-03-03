FROM resin/rpi-raspbian:stretch as builder

RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y cmake build-essential autoconf git automake perl

WORKDIR /tmp

RUN git clone https://github.com/fluent/fluent-bit && \
    cd fluent-bit && \
    git checkout tags/v0.12.14 && \
    cd build && \
    cmake ../ &&\
    make
    
FROM resin/rpi-raspbian:stretch
RUN mkdir /root/config
WORKDIR /root
COPY --from=builder /tmp/fluent-bit/build/bin/fluent-bit .
COPY config/fluent-bit.conf /root/config/fluent-bit.conf
ENTRYPOINT ["/root/fluent-bit"]
CMD ["-c", "/root/config/fluent-bit.conf"]
