#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Firefox Browser"
arch=$(uname -m)
if [[ $arch == x86_64* ]]; then
  echo "X64 Architecture"

  if [ "${DISTRO}" == "centos" ] ; then
    dnf update -y
    # dnf -y install thethinghere
    dnf clean all
  fi

  if [ "${DISTRO}" == "debian" ] ; then
    apt-get update
    apt-get -y install libdbus-glib-1-2
    apt-get -y clean

    curl -L "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" -o /tmp/firefox.tar.bz2
    tar -xvjf /tmp/firefox.tar.bz2 -C /opt
    ln -s /opt/firefox/firefox /usr/bin/firefox
  fi
elif  [[ $arch == arm* ]] || [[ $arch = aarch64 ]]; then
    echo "ARM Architecture"

  if [ "${DISTRO}" == "centos" ] ; then
    dnf update -y
    # dnf -y install thethinghere
    dnf clean all
  fi

  if [ "${DISTRO}" == "debian" ] ; then
    apt-get update -y
    apt-get -y install firefox-esr
    apt-get clean -y
  fi
fi
