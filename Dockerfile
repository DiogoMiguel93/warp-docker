FROM ubuntu:22.04

FROM caomingjun/warp


ENV WARP_SLEEP=2
# ENV WARP_LICENSE_KEY= # opzionale


RUN apt-get update && apt-get install -y \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*


VOLUME /var/lib/cloudflare-warp


CMD ["sh", "-c", "sysctl -w net.ipv6.conf.all.disable_ipv6=0 && sysctl -w net.ipv4.conf.all.src_valid_mark=1 && /usr/local/bin/warp"]
