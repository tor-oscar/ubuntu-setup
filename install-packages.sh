#!/bin/sh

sudo apt-get update && apt-get install -y $(cat packages.list)

### docker
sudo usermod -aG docker $USER
### end docker
