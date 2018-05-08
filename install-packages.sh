#!/bin/sh

sudo apt-get update && sudo apt-get install -y $(cat packages.list)

### docker
sudo usermod -aG docker $USER
### end docker
