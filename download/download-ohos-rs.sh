#!/bin/bash

set -eu

# Rust is already embedded in GitHub Action
# curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

rustup target add aarch64-unknown-linux-ohos
cargo install cargo-c --features=vendored-openssl
