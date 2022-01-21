#!/usr/bin/env bash
set -e

if [ "${DISTRO}" == "centos" ] ; then
  dnf update -y
  dnf install --nodocs -y htop tmux curl nano unzip git sudo
fi

echo "Install some common tools for further installation"
if [ "${DISTRO}" == "debian" ] ; then
  apt-get update
  apt-get install -y htop tmux curl nano unzip locales git keyboard-configuration sudo apt-transport-https
fi
