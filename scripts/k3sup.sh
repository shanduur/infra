#!/usr/bin/env bash

set -e
set -o pipefail

X_HOST="${X_HOST:-1.2.3.4}"
X_USER="${X_USER:-user}"
X_SSH_KEY="${X_SSH_KEY:-${HOME}/.ssh/ansible}"
X_NAME="${X_NAME:-kubernetes}"
X_VERSION="${X_VERSION:-latest}"

if [ "${X_USER}" != "root" ]; then
    X_SUDO="--sudo"
else
    X_SUDO=""
fi

EXTRA_ARGS=(
        "--flannel-backend=none"
        "--cluster-cidr=10.10.0.0/16"
        "--disable-network-policy"
        "--disable-helm-controller"
        "--disable=traefik"
        "--disable=servicelb"
    )

k3sup install \
    --host="${X_HOST}" \
    --user="${X_USER}" \
    ${X_SUDO} \
    --ssh-key="${X_SSH_KEY}" \
    --context="${X_NAME}" \
    --local-path="${HOME}/.kube/config.d/${X_NAME}" \
    --tls-san="${X_NAME}" \
    --k3s-channel="${X_VERSION}" \
    --k3s-extra-args="${EXTRA_ARGS[*]}"
