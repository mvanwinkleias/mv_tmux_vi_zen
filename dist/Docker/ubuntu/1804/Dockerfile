FROM debian:18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -y \
        build-essential \
        fakeroot

CMD /mv_tmux_vi_zen/dist/Docker/ubuntu/1804/build-dist.sh
