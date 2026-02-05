#!/bin/bash

set -eu

if command -v rustup &> /dev/null; then
  echo "rustup is already installed"
else
  echo "Installing rustup..."
  curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
fi

rustup target add aarch64-unknown-linux-ohos
cargo install cargo-c --features=vendored-openssl
