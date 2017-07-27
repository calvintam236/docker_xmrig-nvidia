FROM ubuntu:16.04

MAINTAINER calvintam236 <calvintam236@users.noreply.github.com>
LABEL description="XMRig in Docker. Supports CPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates cmake libuv1-dev build-essential git \
    && git clone https://github.com/xmrig/xmrig.git \
    && cd xmrig/ \
    && cmake . -DCMAKE_BUILD_TYPE=Release -DUV_LIBRARY=/usr/lib/x86_64-linux-gnu/libuv.a \
    && make \
    && mv xmrig /usr/local/bin/xmrig \
    && chmod a+x /usr/local/bin/xmrig \
    && cd .. \
    && rm -r xmrig/ \
    && apt-get -y remove ca-certificates cmake libuv1-dev build-essential git \
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

ENTRYPOINT ["xmrig"]
