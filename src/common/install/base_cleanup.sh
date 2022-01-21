#!/usr/bin/env bash
set -e
echo "Install base requirements"

if [ "${DISTRO}" == "centos" ] ; then
  dnf clean all
fi

if [ "${DISTRO}" == "debian" ] ; then
  apt-get clean -y
fi