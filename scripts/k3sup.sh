#!/usr/bin/env bash

set -e
set -o pipefail

EXTRA_ARGS=(
        "--flannel-backend=none"
        "--cluster-cidr=10.10.0.0/16"
        "--disable-network-policy"
        "--disable-helm-controller"
        "--disable=traefik"
        "--disable=servicelb"
    )

k3sup install \
    --host='100.113.226.90' \
    --user=rocky \
    --ssh-key="${HOME}/.ssh/ansible" \
    --context=oci-kube \
    --local-path="${HOME}/.kube/config.d/oci-kube" \
    --sudo \
    --tls-san=oci-kube \
    --k3s-channel=latest \
    --k3s-extra-args="${EXTRA_ARGS[*]}"
