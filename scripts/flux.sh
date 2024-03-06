#!/usr/bin/env bash

set -e
set -o pipefail

X_NAME="${X_NAME:-kubernetes}"

flux bootstrap github \
    --token-auth \
    --owner=shanduur \
    --repository=infra \
    --branch=main \
    --path="clusters/${X_NAME}" \
    --personal
