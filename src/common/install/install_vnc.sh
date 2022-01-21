#!/usr/bin/env bash
set -e

echo "Install vncserver for further installation"
if [ "${DISTRO}" == "centos" ] ; then
  dnf update -y
  dnf install -y tigervnc-server net-tools
  dnf install -y \
    https://cbs.centos.org/kojifiles/packages/novnc/1.1.0/6.el8/noarch/novnc-1.1.0-6.el8.noarch.rpm \
    https://cbs.centos.org/kojifiles/packages/python-websockify/0.9.0/1.el8/noarch/python3-websockify-0.9.0-1.el8.noarch.rpm
  dnf clean all
fi

if [ "${DISTRO}" == "debian" ] ; then
  apt-get update
  apt-get install -y tigervnc-standalone-server novnc net-tools procps
  apt-get clean -y
fi
