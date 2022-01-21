#!/usr/bin/env bash
set -e
echo "Install base requirements"

if [ "${DISTRO}" == "centos" ] ; then
  dnf update -y
  dnf install --nodocs -y epel-release
  dnf update -y
fi

if [ "${DISTRO}" == "debian" ] ; then
  apt-get update
  apt-get upgrade -y
fi