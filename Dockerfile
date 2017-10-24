FROM calvintam236/ubuntu:nvidia

MAINTAINER calvintam236 <calvintam236@users.noreply.github.com>
LABEL description="XMRig-NVIDIA in Docker. Supports GPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates curl build-essential cmake libuv1-dev \
    && curl -L -O https://github.com/xmrig/xmrig-nvidia/archive/v2.4.2.tar.gz \
    && tar -xvf v2.4.2.tar.gz \
    && cd xmrig-nvidia-2.4.2 \
    && mkdir build \
    && cd build \
    && cmake .. -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-9.0 -DUV_LIBRARY=/usr/lib/x86_64-linux-gnu/libuv.a -DWITH_HTTPD=OFF \
    && make \
    && cd ../.. \
    && mv xmrig-nvidia-2.4.2/build/xmrig-nvidia /usr/local/bin/xmrig-nvidia \
    && chmod a+x /usr/local/bin/xmrig-nvidia \
    && rm -r xmrig-nvidia-2.4.2 \
    && apt-get -y remove ca-certificates build-essential cmake libuv1-dev \
    && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

ENTRYPOINT ["xmrig-nvidia"]
CMD ["-h"]
