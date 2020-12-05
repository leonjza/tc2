FROM openjdk:16-slim-buster

RUN apt-get update && apt-get install -y \
    curl \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

ENV COBALTSTRIKE_KEY= \
    COBALTSTRIKE_PASSWORD= \
    COBALTSTRIKE_IP=

RUN mkdir -p /opt/cobaltstrike
WORKDIR /opt/cobaltstrike

ADD docker-entrypoint.sh /docker-entrypoint.sh

STOPSIGNAL SIGKILL

VOLUME [ "/opt/cobaltstrike" ]
EXPOSE 50050

ENTRYPOINT [ "/docker-entrypoint.sh" ]
