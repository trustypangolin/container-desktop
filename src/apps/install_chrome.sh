#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Chromium Browser"

if [ "${DISTRO}" == "centos" ] ; then
  dnf update -y
  dnf install -y chromium
  dnf clean all

  ln -s /usr/bin/chromium-browser /usr/bin/google-chrome

  ### fix to start chromium in a Docker container, see https://github.com/ConSol/docker-headless-vnc-container/issues/2
  echo "CHROMIUM_FLAGS='--no-sandbox --start-maximized --user-data-dir'" > $HOME/.chromium-browser.init
  # add `source $INST_SCRIPTS/install/chromium-wrapper`string before last line
  sed -i '$isource $INST_SCRIPTS/chromium-wrapper' /usr/lib64/chromium-browser/chromium-browser.sh
fi

if [ "${DISTRO}" == "debian" ] ; then
  apt-get update -y
  apt-get install -y chromium
  apt-get clean -y

  # ln -s /usr/bin/chromium-browser /usr/bin/google-chrome

  ### fix to start chromium in a Docker container, see https://github.com/ConSol/docker-headless-vnc-container/issues/2
  # echo "CHROMIUM_FLAGS='--no-sandbox --start-maximized --user-data-dir'" > $HOME/.chromium-browser.init
  # add `source $INST_SCRIPTS/install/chromium-wrapper`string before last line
  # sed -i '$isource $INST_SCRIPTS/chromium-wrapper' /usr/lib64/chromium-browser/chromium-browser.sh
fi