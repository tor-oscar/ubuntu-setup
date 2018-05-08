#!/bin/sh

SCRIPT=$(readlink -f "$0")
SETUP_PATH=$(dirname "$SCRIPT")

REL_NAME=$(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=)

get_lts_rel()
{
    case "$1" in
      "bionic") LTS_REL_NAME="bionic" ;;
      "astral") LTS_REL_NAME="xenial" ;;
      "zesty") LTS_REL_NAME="xenial" ;;
      *) LTS_REL_NAME="xenial" ;;
    esac
}

get_lts_rel $REL_NAME

### BEGIN i3 setup
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2018.01.30_all.deb /tmp/sur5r-keyring_2018.01.30_all.deb SHA256:baa43dbbd7232ea2b5444cae238d53bebb9d34601cc000e82f11111b1889078a
dpkg -i /tmp/sur5r-keyring_2018.01.30_all.deb
echo "deb http://debian.sur5r.net/i3/ $REL_NAME universe" > /etc/apt/sources.list.d/sur5r-i3.list
### END i33 setup

### BEGIN OpenFortiGUI https://hadler.me/linux/openfortigui/
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2FAB19E7CCB7F415
echo "deb https://apt.iteas.at/iteas $LTS_REL_NAME main" > /etc/apt/sources.list.d/iteas.list
### END

### Docker
wget -q https://download.docker.com/linux/ubuntu/gpg -O- | apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu zesty stable" > /etc/apt/sources.list.d/docker.list

### VirtualBox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
wget -q https://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $REL_NAME contrib" > /etc/apt/sources.list.d/oracle-virtualbox.list

### Google chrome
#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

### remmina
add-apt-repository ppa:remmina-ppa-team/remmina-next -y

### Slack
wget https://packagecloud.io/install/repositories/slacktechnologies/slack/script.deb.sh -O - | bash

### Ansible
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt-add-repository "deb http://ppa.launchpad.net/ansible/ansible/ubuntu $REL_NAME main"
