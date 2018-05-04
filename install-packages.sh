#!/bin/sh

sudo apt-get update && apt-get install -y $(cat packages.list)

### docker
sudo usermod -aG docker $USER
### end docker

### asdf-vm
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.3

. ~/.asdf/asdf.sh

asdf plugin-add erlang # https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir # https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add nodejs # https://github.com/asdf-vm/asdf-nodejs.git
# asdf plugin-add python # https://github.com/tuvistavie/asdf-python
asdf plugin-add dotnet-core # https://github.com/emersonsoares/asdf-dotnet-core.git

~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install nodejs $(asdf list-all nodejs | tail -n1)
asdf install erlang $(asdf list-all erlang | tail -n1)
asdf install elixir $(asdf list-all elixir | tail -n1)
asdf install dotnet-core $(asdf list-all dotnet-core | grep -v preview | sort | tail -n1)
### end asdf-vm
