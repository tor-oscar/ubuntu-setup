#!/bin/bash

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0

source ~/.asdf/asdf.sh

~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf plugin-add erlang # https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir # https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add nodejs # https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add ruby
asdf plugin-add rust
