#!/usr/bin/env bash

set -e
set -o pipefail

flux bootstrap github \
    --token-auth \
    --owner=shanduur \
    --repository=infra \
    --branch=main \
    --path=clusters/oci-kube \
    --personal
