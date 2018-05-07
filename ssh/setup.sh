#!/bin/sh

mkdir -p .ssh
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -b 4096 -C "$USER@$HOST" -f ~/.ssh/id_rsa -N ""
fi
