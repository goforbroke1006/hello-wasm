#!/bin/bash

sudo apt install -y python3 cmake default-jre

(
  if [[ ! -d ./emsdk/ ]]; then
    git clone https://github.com/emscripten-core/emsdk.git
    cd emsdk || exit 1
    ./emsdk install latest
  else
    cd emsdk || exit 1
  fi

  ./emsdk activate latest
)

source ./emsdk/emsdk_env.sh
#emcc --version
