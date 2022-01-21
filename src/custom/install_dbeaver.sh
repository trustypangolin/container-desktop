#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
echo "Install"

arch=$(uname -m)
if [[ $arch == x86_64* ]]; then
    echo "X64 Architecture"

    if [ "${DISTRO}" == "debian" ] ; then
      apt-get -y install gnupg2

      curl https://dbeaver.io/debs/dbeaver.gpg.key | apt-key add -
      echo "deb https://dbeaver.io/debs/dbeaver-ce /" | tee /etc/apt/sources.list.d/dbeaver.list

      apt-get update
      apt-get -y install dbeaver-ce
    fi
elif  [[ $arch == arm* ]] || [[ $arch = aarch64 ]]; then
    echo "ARM Architecture"
    if [ "${DISTRO}" == "debian" ] ; then
      apt-get -y install gnupg2 openjdk-17-jdk

      curl -L https://dbeaver.io/files/dbeaver-ce-latest-linux.gtk.aarch64-nojdk.tar.gz -o /tmp/dbeaver-ce.tar.gz
      cd /tmp
      tar xzfv /tmp/dbeaver-ce.tar.gz
      mv /tmp/dbeaver /usr/share/dbeaver-ce
      rm *.gz
    fi
fi
