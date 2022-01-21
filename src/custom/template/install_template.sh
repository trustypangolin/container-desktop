#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install"
arch=$(uname -m)
if [[ $arch == x86_64* ]]; then
  echo "X64 Architecture"

  if [ "${DISTRO}" == "centos" ] ; then
    dnf update -y
    # dnf -y install thethinghere
    dnf clean all
  fi

  if [ "${DISTRO}" == "debian" ] ; then
    apt-get update -y
    # apt-get install -y thethinghere
    apt-get clean -y
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
    # apt-get install -y thethinghere
    apt-get clean -y
  fi
fi