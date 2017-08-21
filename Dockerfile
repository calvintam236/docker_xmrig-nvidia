FROM ubuntu:16.04

MAINTAINER calvintam236 <calvintam236@users.noreply.github.com>
LABEL description="XMRig in Docker. Supports CPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates curl \
    && curl -L -O https://github.com/xmrig/xmrig/releases/download/v2.3.0/xmrig-2.3.0-gcc7-xenial-amd64.tar.gz \
    && tar -xvf xmrig-2.3.0-gcc7-xenial-amd64.tar.gz \
    && rm xmrig-2.3.0-gcc7-xenial-amd64.tar.gz \
    && mv xmrig-2.3.0/xmrig /usr/local/bin/xmrig \
    && chmod a+x /usr/local/bin/xmrig \
    && rm -r xmrig-2.3.0 \
    && apt-get -y remove ca-certificates curl \
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

ENTRYPOINT ["xmrig"]
