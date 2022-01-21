#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install"

arch=$(uname -m)
if [[ $arch == x86_64* ]]; then
    echo "X64 Architecture"
    curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /tmp/awscliv2.zip
    unzip -q /tmp/awscliv2.zip -d /tmp
    /tmp/aws/install
    if [ "${DISTRO}" == "debian" ] ; then
      apt-get -y install xdg-utils

      curl https://s3.amazonaws.com/publicsctdownload/Ubuntu/aws-schema-conversion-tool-1.0.latest.zip -o /tmp/aws-schema-conversion-tool-1.0.latest.zip
      unzip -q /tmp/aws-schema-conversion-tool-1.0.latest.zip -d /tmp
      dpkg -i /tmp/aws*.deb

      rm -rf /tmp/aws /tmp/agents /tmp/dmsagent
      rm /tmp/*
      apt-get -y clean
    fi
elif  [[ $arch == arm* ]] || [[ $arch = aarch64 ]]; then
    echo "ARM Architecture"
    curl https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip -o /tmp/awscliv2.zip
    unzip -q /tmp/awscliv2.zip -d /tmp
    /tmp/aws/install
fi
