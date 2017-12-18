FROM calvintam236/ubuntu:nvidia

MAINTAINER calvintam236 <calvintam236@users.noreply.github.com>
LABEL description="XMRig-NVIDIA in Docker. Supports GPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates git build-essential cmake libuv1-dev \
    && git clone https://github.com/xmrig/xmrig-nvidia.git \
    && cd xmrig-nvidia \
    && mkdir build \
    && cd build \
    && cmake .. -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-9.1 -DWITH_HTTPD=OFF \
    && make \
    && cd ../.. \
    && mv xmrig-nvidia/build/xmrig-nvidia /usr/local/bin/xmrig-nvidia \
    && chmod a+x /usr/local/bin/xmrig-nvidia \
    && rm -r xmrig-nvidia \
    && apt-get -y remove ca-certificates curl build-essential cmake libuv1-dev \
    && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

ENTRYPOINT ["xmrig-nvidia"]
CMD ["-h"]
