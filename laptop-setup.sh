#!/bin/sh

# Bluetooth, https://www.roxlu.com/2019/058/setting-up-a-bluetooth-headset-on-arch-linux

sudo systemctl enable bluetooth
sudo pacman -S bluez-utils
