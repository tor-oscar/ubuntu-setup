#!/bin/sh

mkdir -p .ssh
HOST=$(hostnamectl status | grep hostname | cut -f2 -d':' | grep -o '\S\+')
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -b 4096 -C "$USER@$HOST" -f ~/.ssh/id_rsa -N ""
fi
