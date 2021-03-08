#!/bin/bash

K3D_VERSION=$1
SKAFFOLD_VERSION=$2
K3D_BINARY="k3d"
SKAFFOLD_BINARY="skaffold"

#set -x
if [ ! -x "$(command -v "$K3D_BINARY")" ]; then
  sudo wget https://github.com/rancher/k3d/releases/download/${K3D_VERSION}/k3d-linux-amd64 -O /tmp/k3d
  sudo chmod +x /tmp/k3d
fi

if [ ! -x "$(command -v "$SKAFFOLD_BINARY")" ]; then

  curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/${SKAFFOLD_VERSION}/skaffold-linux-amd64 && chmod +x skaffold
  sudo mv skaffold /tmp/
fi
