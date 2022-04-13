#!/bin/sh
set -ex

## DON'T RUN AS ROOT

if [ "$(id -u)" == "0" ]; then
  echo "DO NOT RUN AS ROOT"
  exit 1
fi

## Docker setup
sudo systemctl enable docker.service
sudo systemctl enable ntpd.service
sudo systemctl enable snapd.socket
systemctl enable --user pulseaudio.service
sudo usermod -a -G docker $USER
