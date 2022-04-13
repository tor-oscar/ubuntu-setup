#!/usr/bin/env bash

LSP_HOME=$HOME/.lsp

mkdir -p $LSP_HOME

curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz \
  | gunzip -c - > $LSP_HOME/rust-analyzer

git clone https://github.com/elixir-lsp/elixir-ls.git $LSP_HOME/elixir-ls
