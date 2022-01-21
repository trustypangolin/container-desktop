#!/usr/bin/env bash
set -e

echo "Install base requirements"

if [ "${DISTRO}" == "centos" ] ; then
  dnf groupinstall -y -x gnome-keyring --skip-broken --nodocs "Xfce" 
fi

if [ "${DISTRO}" == "debian" ] ; then
  apt-get install -y \
    gnome-icon-theme \
    xorg xserver-xorg \
    xvfb supervisor \
    xserver-xorg-video-dummy \
    dbus-x11 \
    systemd systemd-sysv \
    geany
    
  apt-get install --no-install-recommends -y \
    xfce4 xfce4-terminal

  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ; \
  rm -rf /lib/systemd/system/multi-user.target.wants/* ; \
  rm -rf /etc/systemd/system/*.wants/* ; \
  rm -rf /lib/systemd/system/local-fs.target.wants/* ; \
  rm -rf /lib/systemd/system/sockets.target.wants/*udev* ; \
  rm -rf /lib/systemd/system/sockets.target.wants/*initctl* ; \
  rm -rf /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* ; \
  rm -rf /lib/systemd/system/systemd-update-utmp*
fi