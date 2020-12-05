#!/bin/bash

# Get's a cobaltstrike teamserver up and running

if [[ -z "${COBALTSTRIKE_KEY}" ]]; then
    echo "COBALTSTRIKE_KEY env not set. Exiting"
    exit 2
fi

if [[ -z "${COBALTSTRIKE_PASSWORD}" ]]; then
    echo "COBALTSTRIKE_PASSWORD env not set. Exiting"
    exit 2
fi

if [[ -z "${COBALTSTRIKE_IP}" ]]; then
    echo "COBALTSTRIKE_IP env not set. Exiting"
    exit 2
fi

echo "[+] writing license key"
echo $COBALTSTRIKE_KEY > ~/.cobaltstrike.license

# check if we need to install at all
if [[ ! -f /opt/cobaltstrike/cobaltstrike.auth ]]; then
    echo "[+] looks like a fresh install. downloading."
    DL_TOKEN=`curl -s https://www.cobaltstrike.com/download -d "dlkey=${COBALTSTRIKE_KEY}" | grep 'href="/downloads/' | cut -d '/' -f3`
    echo "[+] got download token"
    echo "[+] downloading cobaltstrike.tgz"
    curl -s https://www.cobaltstrike.com/downloads/${DL_TOKEN}/cobaltstrike-dist.tgz -o /tmp/cobaltstrike.tgz
    echo "[+] extracting downloaded archive"
    tar zxf /tmp/cobaltstrike.tgz -C /opt
fi

echo "[+] updating"
/opt/cobaltstrike/update
echo "[+] starting with COBALTSTRIKE_IP=${COBALTSTRIKE_IP}"
/opt/cobaltstrike/teamserver ${COBALTSTRIKE_IP} ${COBALTSTRIKE_PASSWORD}
