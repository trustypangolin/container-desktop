#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
echo "Install"

arch=$(uname -m)
if [[ $arch == x86_64* ]]; then
    echo "X64 Architecture"
    if [ "${DISTRO}" == "debian" ] ; then
      apt-get -y install libnss3 libsecret-1-0 libxss1 libasound2
      curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o /tmp/code_amd64.deb
      dpkg -i /tmp/code_amd64.deb
    fi
elif  [[ $arch == arm* ]] || [[ $arch = aarch64 ]]; then
    echo "ARM Architecture"
    if [ "${DISTRO}" == "debian" ] ; then
      apt-get -y install libnss3 libsecret-1-0 libxss1 libasound2
      curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64" -o /tmp/code_arm64.deb
      dpkg -i /tmp/code_arm64.deb
    fi
fi
