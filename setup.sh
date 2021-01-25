#!/bin/sh

## Docker setup
systemctl enable docker.service
systemctl enable ntpd.service
usermod -a -G docker $USER
