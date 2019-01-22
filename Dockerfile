FROM debian:9.0
MAINTAINER steef@debruijn.ws

RUN apt-get update \
        && apt-get -y upgrade \
        && apt-get -y install bash curl bzip2 ffmpeg cifs-utils alsa-utils

WORKDIR /app/

# Install Roon
RUN curl  http://download.roonlabs.com/builds/RoonServer_linuxx64.tar.bz2 -O \
 && tar -xjf RoonServer_linuxx64.tar.bz2 \
 && rm RoonServer_linuxx64.tar.bz2

ENV ROON_DATAROOT /data
ENV ROON_ID_DIR /data

VOLUME [ "/app", "/data", "/music", "/backup" ]

ADD run.sh /app/
RUN chmod +x run.sh
ENTRYPOINT ["/app/run.sh"]

