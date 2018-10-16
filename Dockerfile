FROM calvintam236/ubuntu:cuda

LABEL maintainer="calvintam236"
LABEL description="XMRig-NVIDIA in Docker. Supports GPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates curl build-essential cmake libmicrohttpd-dev libuv1-dev \
    && curl -L -O https://github.com/xmrig/xmrig-nvidia/archive/v2.8.1.tar.gz \
    && tar -xvf v2.8.1.tar.gz \
    && rm v2.8.1.tar.gz \
    && cd xmrig-nvidia-2.8.1 \
    && mkdir build \
    && cd build \
    && cmake .. -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-9.2 \
    && make \
    && cd ../.. \
    && mv xmrig-nvidia-2.8.1/build/xmrig-nvidia /usr/local/bin/xmrig-nvidia \
    && chmod a+x /usr/local/bin/xmrig-nvidia \
    && rm -r xmrig-nvidia-2.8.1 \
    && apt-get -y remove ca-certificates curl build-essential cmake libmicrohttpd-dev libuv1-dev \
    && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

ENTRYPOINT ["xmrig-nvidia"]
CMD ["-h"]
